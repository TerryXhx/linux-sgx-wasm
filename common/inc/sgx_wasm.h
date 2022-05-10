#ifndef _SGX_WASM_H
#define _SGX_WASM_H

#include <cstdint>
#ifdef __cplusplus
extern "C" {
#endif

#define SGX_WASM_SEC_NAME ".sgx_wasm"
#define SGX_WASM_SEC_SIZE 20480
// must be a multiple of 4096 (page size)

typedef struct _sgx_wasm_t {
    uint64_t size;
    uint8_t wasm_blob[];
} sgx_wasm_t;

uint64_t sgx_wasm_get_size();

uint8_t* get_sgx_wasm_sec_buf_addr();

#ifdef __cplusplus
}
#endif

#endif