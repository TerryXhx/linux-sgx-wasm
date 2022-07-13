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
#include "sgx_utils.h"
#include <unordered_map>
#include <vector>

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

struct VectorHasher {
    int operator()(const std::vector<uint8_t> V) const {
        int hash = SGX_HASH_SIZE;
        for (int i = 0; i < SGX_HASH_SIZE; ++i)
            hash ^= V[i] + 0x9e3779b9 + (hash << 6) + (hash >> 2);
        return hash;
    }
};


sgx_status_t sgx_wasm_get_hash(uint8_t *wasm_blob, uint64_t wasm_blob_size, uint8_t *hash)
{  
    sgx_status_t ret = SGX_SUCCESS;
    sgx_sha_state_handle_t sha_handle;
    if(sgx_sha256_init(&sha_handle) != SGX_SUCCESS)
    {
        return SGX_ERROR_UNEXPECTED;
    }

    uint64_t wasm_blob_size_aligned = (wasm_blob_size + DATA_BLOCK_SIZE - 1) & ~(DATA_BLOCK_SIZE - 1);
    uint8_t *wasm_blob_aligned = (uint8_t*)malloc(wasm_blob_size_aligned);
    memset(wasm_blob_aligned, 0, wasm_blob_size_aligned);
    memcpy(wasm_blob_aligned, wasm_blob, wasm_blob_size);

    uint8_t* source = reinterpret_cast<uint8_t*>(reinterpret_cast<uint64_t>(wasm_blob_aligned));
    uint8_t* wasm_blob_end_addr = source + wasm_blob_size_aligned;

    while (source < wasm_blob_end_addr)
    {
        uint8_t data_block[DATA_BLOCK_SIZE];
        memset(data_block, 0, DATA_BLOCK_SIZE);
        memcpy(data_block, source, DATA_BLOCK_SIZE);
        if(sgx_sha256_update(data_block, DATA_BLOCK_SIZE, sha_handle) != SGX_SUCCESS)
        {
            ret = SGX_ERROR_UNEXPECTED;
            goto CLEANUP;
        }
        source += DATA_BLOCK_SIZE;
    }
    sgx_measurement_t mr;
    if(sgx_sha256_get_hash(sha_handle, &mr.m) != SGX_SUCCESS)
    {
        ret = SGX_ERROR_UNEXPECTED;
        goto CLEANUP;
    }
    memcpy(hash, mr.m, SGX_HASH_SIZE);

CLEANUP:
    sgx_sha256_close(sha_handle);
    free(wasm_blob_aligned);
    return ret;  
}


void ecall_test_wasm(uint8_t *wasm_blob, uint64_t wasm_blob_size)
{
    sgx_measurement_t mr;
    
    if (SGX_SUCCESS != sgx_wasm_derive_measurement(wasm_blob, wasm_blob_size, &mr))
        printf("fail\n");
    
    else {
        printf("derived measurement:\n");
        for (uint64_t j = 0; j < sizeof(mr.m); j++)
            printf("%02x ", mr.m[j]);
        printf("\n");
    }

    std::unordered_map<std::vector<uint8_t>, std::vector<uint8_t>, VectorHasher> mr_to_hash_map;

    // get wasm sha-256
    uint8_t *wasm_hash_raw = (uint8_t*)malloc(SGX_HASH_SIZE);
    sgx_wasm_get_hash(wasm_blob, wasm_blob_size, wasm_hash_raw);
    std::vector<uint8_t> wasm_hash(SGX_HASH_SIZE);
    printf("wasm sha-256 hash:\n");
    memcpy(wasm_hash.data(), wasm_hash_raw, SGX_HASH_SIZE);
    free(wasm_hash_raw);
    for (uint64_t j = 0; j < SGX_HASH_SIZE; j++)
        printf("%02x ", wasm_hash[j]);
    printf("\n");

    // get wasm vm enclave measurement
    std::vector<uint8_t> derived_measurement(SGX_HASH_SIZE);
    memcpy(derived_measurement.data(), mr.m, SGX_HASH_SIZE);

    // update mapping
    mr_to_hash_map[derived_measurement] = wasm_hash;

    // check
    printf("get wasm hash from mapping\n");
    for (int i = 0; i < SGX_HASH_SIZE; ++i)
        printf("%02x ", mr_to_hash_map[derived_measurement][i]);
    printf("\n");
}
