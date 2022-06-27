#ifndef _SGX_WASM_H
#define _SGX_WASM_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

#define SGX_WASM_SEC_NAME ".sgx_wasm"
#define SGX_WASM_SEC_SIZE 20480
// must be a multiple of 4096 (page size)


typedef struct _sgx_wasm_t {
    uint64_t size;
    uint8_t wasm_blob[];
} sgx_wasm_t;

uint8_t* sgx_get_wasm_sec_buf_addr();

#ifdef __cplusplus
}
#endif

#endif