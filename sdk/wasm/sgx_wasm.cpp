#include "string.h"
#include "sgx_wasm.h"
#include "sgx_tcrypto.h"

#define DATA_BLOCK_SIZE 64
#define SIZE_NAMED_VALUE 8
#define SE_PAGE_SIZE 0x1000

#define HANDLE_SIZE_OFFSET 152
#define HANDLE_HASH_OFFSET 168
#define SHA256_DIGEST_SIZE 32

const uint8_t __attribute__((section(SGX_WASM_SEC_NAME))) sgx_wasm_sec_buf[SGX_WASM_SEC_SIZE] __attribute__((aligned (SE_PAGE_SIZE))) = {};
const uint8_t __attribute__((section(SGX_WASM_VM_MR_SEC_NAME))) sgx_wasm_vm_mr_buf[SGX_WASM_VM_MR_SEC_SIZE] __attribute__((aligned (SE_PAGE_SIZE))) = {};

uint8_t* sgx_get_wasm_sec_buf_addr()
{
    return reinterpret_cast<uint8_t*>(reinterpret_cast<uint64_t>(sgx_wasm_sec_buf));
}

uint8_t* sgx_get_wasm_vm_mr_sec_buf_addr()
{
    return reinterpret_cast<uint8_t*>(reinterpret_cast<uint64_t>(sgx_wasm_vm_mr_buf));
}

sgx_status_t sgx_wasm_derive_measurement(uint8_t *wasm_blob, uint64_t wasm_blob_size, sgx_measurement_t *mr)
{
    sgx_status_t ret = SGX_SUCCESS;

    sgx_wasm_vm_mr_t *vm_mr = (sgx_wasm_vm_mr_t*)sgx_get_wasm_vm_mr_sec_buf_addr();
    if (wasm_blob_size > SGX_WASM_SEC_SIZE || mr == NULL)
        return SGX_ERROR_UNEXPECTED;

    sgx_sha_state_handle_t sha_handle;
    if(sgx_sha256_init(&sha_handle) != SGX_SUCCESS)
    {
        return SGX_ERROR_UNEXPECTED;
    }

    uint64_t page_offset;

    memcpy(reinterpret_cast<uint8_t*>(sha_handle) + HANDLE_HASH_OFFSET, vm_mr->digest, SHA256_DIGEST_SIZE);
    memcpy(reinterpret_cast<uint8_t*>(sha_handle) + HANDLE_SIZE_OFFSET, &vm_mr->size, sizeof(vm_mr->size));
    memcpy(&page_offset, &vm_mr->offset, sizeof(vm_mr->offset));

    uint8_t *wasm_sec_buf = (uint8_t*)malloc(SGX_WASM_SEC_SIZE);
    memset(wasm_sec_buf, 0, SGX_WASM_SEC_SIZE);
    memcpy(wasm_sec_buf, wasm_blob, wasm_blob_size);
    uint8_t* source = reinterpret_cast<uint8_t*>(reinterpret_cast<uint64_t>(wasm_sec_buf));
    uint8_t* wasm_sec_end_addr = source + SGX_WASM_SEC_SIZE;

    while (source < wasm_sec_end_addr)
    {
        uint8_t eadd_val[SIZE_NAMED_VALUE] = "EADD\0\0\0";
        uint8_t sinfo[64] = {0x01, 0x02};

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
    }

    if(sgx_sha256_get_hash(sha_handle, &mr->m) != SGX_SUCCESS)
    {
        ret = SGX_ERROR_UNEXPECTED;
        goto CLEANUP;
    }

CLEANUP:
    sgx_sha256_close(sha_handle);
    free(wasm_sec_buf);
    return ret;
}

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