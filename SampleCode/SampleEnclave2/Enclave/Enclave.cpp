/*
 * Copyright (C) 2011-2021 Intel Corporation. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 *   * Neither the name of Intel Corporation nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

#include "Enclave.h"
#include "Enclave_t.h" /* print_string */
#include <stdarg.h>
#include <stdio.h> /* vsnprintf */
#include <string.h>
#include "sgx_wasm.h"
#include "sgx_tcrypto.h"

#define DATA_BLOCK_SIZE 64
#define SIZE_NAMED_VALUE 8
#define SE_PAGE_SIZE 0x1000

#define HANDLE_SIZE_OFFSET 152
#define HANDLE_HASH_OFFSET 168
#define SHA256_DIGEST_SIZE 32

/* 
 * printf: 
 *   Invokes OCALL to display the enclave buffer to the terminal.
 */
int printf(const char* fmt, ...)
{
    char buf[BUFSIZ] = { '\0' };
    va_list ap;
    va_start(ap, fmt);
    vsnprintf(buf, BUFSIZ, fmt, ap);
    va_end(ap);
    ocall_print_string(buf);
    return (int)strnlen(buf, BUFSIZ - 1) + 1;
}

sgx_status_t sgx_wasm_derive_measurement2(uint8_t *wasm_blob, uint64_t wasm_blob_size, sgx_measurement_t *mr)
{
    sgx_status_t ret = SGX_SUCCESS;

    sgx_wasm_vm_mr_t *vm_mr = (sgx_wasm_vm_mr_t*)sgx_get_wasm_vm_mr_sec_buf_addr();
    if (wasm_blob_size > SGX_WASM_SEC_SIZE || mr == NULL)
        return SGX_ERROR_UNEXPECTED;

    sgx_sha_state_handle_t sha_handle = NULL;
    if(sgx_sha256_init(&sha_handle) != SGX_SUCCESS)
    {
        return SGX_ERROR_UNEXPECTED;
    }

    memcpy(reinterpret_cast<uint8_t*>(sha_handle) + HANDLE_HASH_OFFSET, vm_mr->digest, SHA256_DIGEST_SIZE);
    memcpy(reinterpret_cast<uint8_t*>(sha_handle) + HANDLE_SIZE_OFFSET, &vm_mr->size, sizeof(vm_mr->size));

    uint64_t page_offset = vm_mr->offset;
    uint8_t *wasm_sec_buf = (uint8_t*)malloc(SGX_WASM_SEC_SIZE);
    memset(wasm_sec_buf, 0, SGX_WASM_SEC_SIZE);
    memcpy(wasm_sec_buf, wasm_blob, wasm_blob_size);
    uint8_t* source = reinterpret_cast<uint8_t*>(reinterpret_cast<uint64_t>(wasm_sec_buf));
    uint8_t* wasm_sec_end_addr = source + SGX_WASM_SEC_SIZE;
    int t = 0;

    printf("before derive:\n") ;   
    for (int i = 0; i < SGX_HASH_SIZE; ++i)
        printf("%02x ", (reinterpret_cast<uint8_t*>(sha_handle) + HANDLE_HASH_OFFSET)[i]);
    printf("\n");

    while (source < wasm_sec_end_addr)
    {
        uint8_t eadd_val[SIZE_NAMED_VALUE] = "EADD\0\0\0";
        uint8_t sinfo[64] = {0x01, 0x02};
        memset(sinfo + 2, 0, 62);

        uint8_t data_block[DATA_BLOCK_SIZE];
        size_t db_offset = 0;
        memset(data_block, 0, DATA_BLOCK_SIZE);
        memcpy(data_block, eadd_val, SIZE_NAMED_VALUE);
        db_offset += SIZE_NAMED_VALUE;
        memcpy(data_block + db_offset, &page_offset, sizeof(page_offset));
        db_offset += sizeof(page_offset);
        memcpy(data_block + db_offset, &sinfo, sizeof(data_block) - db_offset);

        if(sgx_sha256_update(data_block, DATA_BLOCK_SIZE, sha_handle) != SGX_SUCCESS)
        {
            ret = SGX_ERROR_UNEXPECTED;
            goto CLEANUP;
        }

        uint8_t eextend_val[SIZE_NAMED_VALUE] = "EEXTEND";

        #define EEXTEND_TIME  4
        for(int i = 0; i < SE_PAGE_SIZE; i += (DATA_BLOCK_SIZE * EEXTEND_TIME))
        {
            db_offset = 0;
            memset(data_block, 0, DATA_BLOCK_SIZE);
            memcpy(data_block, eextend_val, SIZE_NAMED_VALUE);
            db_offset += SIZE_NAMED_VALUE;
            memcpy(data_block + db_offset, &page_offset, sizeof(page_offset));
            
            if(sgx_sha256_update(data_block, DATA_BLOCK_SIZE, sha_handle) != SGX_SUCCESS)
            {
                ret = SGX_ERROR_UNEXPECTED;
                goto CLEANUP;
            }

            for(int j = 0; j < EEXTEND_TIME; j++)
            {
                memcpy(data_block, source, DATA_BLOCK_SIZE);

                if(sgx_sha256_update(data_block, DATA_BLOCK_SIZE, sha_handle) != SGX_SUCCESS)
                {
                    ret = SGX_ERROR_UNEXPECTED;
                    goto CLEANUP;
                }

                source += DATA_BLOCK_SIZE;
                page_offset += DATA_BLOCK_SIZE;
            }
        }
        printf("%d: ", ++t);
        for (int i = 0; i < SGX_HASH_SIZE; ++i)
            printf("%02x ", (reinterpret_cast<uint8_t*>(sha_handle) + HANDLE_HASH_OFFSET)[i]);
        printf("\n");   
    }

    if(sgx_sha256_get_hash(sha_handle, &mr->m) != SGX_SUCCESS)
    {
        ret = SGX_ERROR_UNEXPECTED;
        goto CLEANUP;
    }

CLEANUP:
    sgx_sha256_close(sha_handle);
    return ret;
}

void ecall_test_wasm(uint8_t *wasm_blob, uint64_t wasm_blob_size)
{
    printf("wasm section address: %p\n", sgx_get_wasm_sec_buf_addr());
    printf("wasm vm mr section address: %p\n", sgx_get_wasm_vm_mr_sec_buf_addr());
    sgx_measurement_t mr, mr2;
    
    if (SGX_SUCCESS != sgx_wasm_derive_measurement(wasm_blob, wasm_blob_size, &mr2))
        printf("fail\n");
    else {
        printf("derived measurement2:\n");
        for (uint64_t j = 0; j < sizeof(mr2.m); j++)
            printf("%02x ", mr2.m[j]);
        printf("\n");
    }
    sgx_measurement_t mr3;
    sgx_wasm_derive_measurement2(wasm_blob, wasm_blob_size, &mr3);
    printf("derived measurement3:\n");
    for (uint64_t j = 0; j < sizeof(mr3.m); j++)
        printf("%02x ", mr3.m[j]);
    printf("\n");

    sgx_wasm_vm_mr_t *vm_mr = (sgx_wasm_vm_mr_t*)sgx_get_wasm_vm_mr_sec_buf_addr();
    printf("vm_mr->size: %lu\n", vm_mr->size);
    printf("vm_mr->offset:%lu\n", vm_mr->offset);
    for (int i = 0; i < SGX_HASH_SIZE; i++)
        printf("%02x ", (vm_mr->digest)[i]);
    printf("\n");
    printf("------------\n");
    uint8_t *a = (uint8_t*)malloc(32);
    for (int i = 0; i < 32; ++i)
        a[i] = 0;
    a[0] = 0x0;
    a[1] = 1;
    printf("%d\n", *(reinterpret_cast<int*>(a)));
}
