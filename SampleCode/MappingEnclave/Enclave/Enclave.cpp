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
#include "sgx_tseal.h"
#include "sgx_utils.h"
#include <unordered_map>
#include <vector>

#define DATA_BLOCK_SIZE 64
#define SIZE_NAMED_VALUE 8
#define SE_PAGE_SIZE 0x1000

#define HANDLE_SIZE_OFFSET 152
#define HANDLE_HASH_OFFSET 168
#define SHA256_DIGEST_SIZE 32

#define WASM_HASH_SIZE 32

#define PENGLAI_HASH_SIZE 32

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

uint32_t get_sealed_data_size()
{
    return sgx_calc_sealed_data_size(0, WASM_HASH_SIZE + SGX_HASH_SIZE + PENGLAI_HASH_SIZE);
}

void printHash(unsigned char *hash)
{
	char hex[17] = "0123456789abcdef";
	char tmp[65] = {0};
	int i;
	for (i = 0; i < PENGLAI_HASH_SIZE; i++) {
        tmp[i + i] = hex[hash[i] / 16];
        tmp[i + i + 1] = hex[hash[i] % 16];
	}
    printf("%s\n", tmp);
}

void printHashCtx(unsigned long *hash)
{
	int i;
    printf("intermediate hash ctx:\n");
	for (i = 0; i < 18; i++) {
        printf("0x%016lx,\n", (*hash));
        ++hash;
	}
}

void ecall_generate_mapping(uint8_t *wasm_blob, uint64_t wasm_blob_size, uint8_t* sealed_mapping, uint32_t data_size)
{
    sgx_measurement_t mr;
    uint8_t *penglai_hash = (uint8_t*)malloc(PENGLAI_HASH_SIZE);
    uint8_t *wasm_hash = (uint8_t*)malloc(WASM_HASH_SIZE);
    uint8_t* mapping = (uint8_t*)malloc(WASM_HASH_SIZE + SGX_HASH_SIZE + PENGLAI_HASH_SIZE);

    // get sgx measurement
    if (SGX_SUCCESS != sgx_wasm_derive_measurement(wasm_blob, wasm_blob_size, &mr))
        printf("fail to derive sgx measurement\n");
    else {
        printf("sgx derived measurement:\n");
        for (uint64_t j = 0; j < sizeof(mr.m); j++)
            printf("%02x ", mr.m[j]);
        printf("\n");
    }

    // get penglai measurement
    penglai_wasm_derive_measurement(wasm_blob, wasm_blob_size, penglai_hash, 0);
    printf("penglai derived measurement:\n");
    printHash(penglai_hash);

    // get wasm sha-256
    sgx_wasm_get_hash(wasm_blob, wasm_blob_size, wasm_hash);
    printf("wasm sha-256:\n");
    for (uint64_t j = 0; j < WASM_HASH_SIZE; j++)
        printf("%02x ", wasm_hash[j]);
    printf("\n");

    // get mapping
    memcpy(mapping, wasm_hash, WASM_HASH_SIZE);
    memcpy(mapping + WASM_HASH_SIZE, mr.m, SGX_HASH_SIZE);
    memcpy(mapping + WASM_HASH_SIZE + SGX_HASH_SIZE, penglai_hash, PENGLAI_HASH_SIZE);

    // seal mapping
    uint32_t sealed_data_size = sgx_calc_sealed_data_size(0, WASM_HASH_SIZE + SGX_HASH_SIZE + PENGLAI_HASH_SIZE);
    uint8_t *temp_sealed_buf = (uint8_t*)malloc(sealed_data_size);
    sgx_status_t err = sgx_seal_data(0, NULL, (uint32_t)WASM_HASH_SIZE + SGX_HASH_SIZE + PENGLAI_HASH_SIZE, mapping, sealed_data_size, (sgx_sealed_data_t *)temp_sealed_buf);
    if (err == SGX_SUCCESS) {
        printf("selaed success\n");
        memcpy(sealed_mapping, temp_sealed_buf, sealed_data_size);
    } else
        printf("seal failed\n");

    free(mapping);
    free(wasm_hash);
    free(penglai_hash);
}

void unseal_mapping(const uint8_t *sealed_mapping, uint32_t data_size)
{
    uint32_t mac_text_len = sgx_get_add_mac_txt_len((const sgx_sealed_data_t*)sealed_mapping);
    uint32_t decrypt_data_len = sgx_get_encrypt_txt_len((const sgx_sealed_data_t*)sealed_mapping);
    if (mac_text_len == UINT32_MAX || decrypt_data_len == UINT32_MAX)
        printf("Error: Unexpected\n");
    if (mac_text_len > data_size || decrypt_data_len > data_size)
        printf("Error: Invalid parameter\n");
    printf("mac_text_len: %d\n", mac_text_len);
    printf("decrypt_data_len: %d\n", decrypt_data_len);
    
    uint8_t *de_mac_text = (uint8_t*)malloc(mac_text_len);
    if (de_mac_text == NULL)
        printf("Error: Out of memory\n");
    uint8_t *decrypt_mapping = (uint8_t*)malloc(decrypt_data_len);
    if (decrypt_mapping == NULL)
    {
        free(de_mac_text);
        printf("Error: Out of memory\n");
    }

    sgx_status_t ret = sgx_unseal_data((const sgx_sealed_data_t*)sealed_mapping, de_mac_text, &mac_text_len, decrypt_mapping, &decrypt_data_len);
    if (ret != SGX_SUCCESS)
    {
        printf("unseal failed\n");
        free(de_mac_text);
        free(decrypt_mapping);
        return;
    }

    printf("unseal success\n");
    for (uint64_t j = 0; j < mac_text_len; j++)
        printf("%02x ", de_mac_text[j]);
    printf("\n");
    printf("decrypt mapping\n");
    for (uint64_t j = 0; j < decrypt_data_len; j++)
        printf("%02x ", decrypt_mapping[j]);
    printf("\n");

    free(de_mac_text);
    free(decrypt_mapping);
}