#include "sgx_wasm.h"

const uint8_t __attribute__((section(SGX_WASM_SEC_NAME))) sgx_wasm_sec_buf[SGX_WASM_SEC_SIZE] __attribute__((aligned (SE_PAGE_SIZE))) = {};

uint64_t sgx_wasm_get_size()
{
    sgx_wasm_t* wasm_hdr = (sgx_wasm_t*)sgx_wasm_sec_buf;
    if (wasm_hdr->size + sizeof(uint64_t) > SGX_WASM_SEC_SIZE)
        return 0;
    return wasm_hdr->size;
}

uint8_t* get_sgx_wasm_sec_buf_addr()
{
    return reinterpret_cast<uint8_t*>(reinterpret_cast<uint64_t>(sgx_wasm_sec_buf));
}