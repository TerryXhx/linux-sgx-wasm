#include "arch.h"
#include "sgx_wasm.h"

const uint8_t __attribute__((section(SGX_WASM_SEC_NAME))) sgx_wasm_sec_buf[SGX_WASM_SEC_SIZE] __attribute__((aligned (SE_PAGE_SIZE))) = {};
const uint8_t __attribute__((section(SGX_WASM_VM_MR_SEC_NAME))) sgx_wasm_vm_buf_mr[SGX_WASM_VM_MR_SEC_SIZE] __attribute__((aligned (SE_PAGE_SIZE))) = {};

uint8_t* sgx_get_wasm_sec_buf_addr()
{
    return reinterpret_cast<uint8_t*>(reinterpret_cast<uint64_t>(sgx_wasm_sec_buf));
}

uint8_t* sgx_get_wasm_vm_mr_sec_buf_addr()
{
    return reinterpret_cast<uint8_t*>(reinterpret_cast<uint64_t>(sgx_wasm_vm_buf_mr));
}