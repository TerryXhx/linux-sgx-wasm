#ifndef _SGX_WASM_H
#define _SGX_WASM_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include "sgx_urts.h"

/* SGX Begin */
#define SGX_WASM_SEC_NAME ".sgx_wasm"
#define SGX_WASM_SEC_SIZE 20480
// must be a multiple of 4096 (page size)

#define SGX_WASM_VM_MR_SEC_NAME ".sgx_wasm_vm_mr"
#define SGX_WASM_VM_MR_SEC_SIZE 4096
// must be a multiple of 4096 (page size)
// 4096 is large enough to store the measurement


typedef struct _sgx_wasm_t {
    uint64_t size;
    uint8_t wasm_blob[];
} sgx_wasm_t;

typedef struct _sgx_wasm_vm_mr_t
{
    uint64_t size;              // number of blocks updated
    uint64_t offset;            // offset of sgx_mage section
    uint8_t digest[32];         // sha-256 internal state
} sgx_wasm_vm_mr_t;

uint8_t* sgx_get_wasm_sec_buf_addr();

uint8_t* sgx_get_wasm_vm_mr_sec_buf_addr();

sgx_status_t sgx_wasm_derive_measurement(uint8_t *wasm_blob, uint64_t wasm_blob_size, sgx_measurement_t *mr);

sgx_status_t sgx_wasm_get_hash(uint8_t *wasm_blob, uint64_t wasm_blob_size, uint8_t *hash);
/* SGX End */

/* PENGLAI Begin */

#define PENGLAI_WASM_VM_MR_SEC_ADDR 0xfffffff000000000UL
#define PENGLAI_WASM_VM_MR_SEC_SIZE 0x1000UL
#define PENGLAI_WASM_SEC_ADDR       0xfffffff000001000UL
#define PENGLAI_WASM_SEC_SIZE       0x5000UL

#define PENGLAI_SM3_SIZE (sizeof(penglai_wasm_vm_mr_t) - sizeof(unsigned long))

struct sm3_context
{
  unsigned long total[2];     /*!< number of bytes processed  */
  unsigned long state[8];     /*!< intermediate digest state  */
  unsigned char buffer[64];   /*!< data block being processed */

  unsigned char ipad[64];     /*!< HMAC: inner padding        */
  unsigned char opad[64];     /*!< HMAC: outer padding        */
};

typedef struct _penglai_wasm_t {
    unsigned long size;
    unsigned char wasm_blob[];
} penglai_wasm_t;

typedef struct _penglai_wasm_vm_mr_t {
    unsigned long offset;       /*!< offset of penglai_wasm section */
    unsigned long total[2];     /*!< number of bytes processed      */
    unsigned long state[8];     /*!< intermediate digest state      */
    unsigned char buffer[64];   /*!< data block being processed     */
} penglai_wasm_vm_mr_t;

uint8_t* penglai_get_wasm_vm_mr_sec_buf_addr();

void penglai_wasm_derive_measurement(uint8_t *wasm_blob, uint64_t wasm_blob_size, uint8_t *hash, unsigned long nonce);

/* PENGLAI End */

#ifdef __cplusplus
}
#endif

#endif