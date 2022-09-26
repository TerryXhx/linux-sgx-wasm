#include "string.h"
#include "sgx_wasm.h"
#include "sgx_tcrypto.h"

#define DATA_BLOCK_SIZE 64
#define SIZE_NAMED_VALUE 8
#define SE_PAGE_SIZE 0x1000

#define HANDLE_SIZE_OFFSET 152
#define HANDLE_HASH_OFFSET 168
#define SHA256_DIGEST_SIZE 32
#define PENGLAI_HASH_SIZE 32

/* SGX Begin */
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
/* SGX End */

/* PENGLAI Begin */

/*
 * 32-bit integer manipulation macros (big endian)
 */
#ifndef GET_ULONG_BE
#define GET_ULONG_BE(n, b, i)                     \
{                                                 \
  (n) = ( (unsigned long)(b)[(i)] << 24 )         \
  | ( (unsigned long)(b)[(i) + 1] << 16 )         \
  | ( (unsigned long)(b)[(i) + 2] << 8  )         \
  | ( (unsigned long)(b)[(i) + 3]       );        \
}
#endif

#ifndef PUT_ULONG_BE
#define PUT_ULONG_BE(n, b, i)                     \
{                                                 \
  (b)[(i)] = (unsigned char)((n) >> 24);          \
  (b)[(i) + 1] = (unsigned char)((n) >> 16);      \
  (b)[(i) + 2] = (unsigned char)((n) >>  8);      \
  (b)[(i) + 3] = (unsigned char)((n));            \
}
#endif

/*
 * SM3 context setup
 */
void sm3_init(struct sm3_context *ctx)
{
  ctx->total[0] = 0;
  ctx->total[1] = 0;

  ctx->state[0] = 0x7380166F;
  ctx->state[1] = 0x4914B2B9;
  ctx->state[2] = 0x172442D7;
  ctx->state[3] = 0xDA8A0600;
  ctx->state[4] = 0xA96F30BC;
  ctx->state[5] = 0x163138AA;
  ctx->state[6] = 0xE38DEE4D;
  ctx->state[7] = 0xB0FB0E4E;
}

static void sm3_process(struct sm3_context *ctx, unsigned char data[64])
{
  unsigned long SS1, SS2, TT1, TT2, W[68], W1[64];
  unsigned long A, B, C, D, E, F, G, H;
  unsigned long T[64];
  unsigned long Temp1, Temp2, Temp3, Temp4, Temp5;
  int j;

  for(j = 0; j < 16; j++)
    T[j] = 0x79CC4519;
  for(j = 16; j < 64; j++)
    T[j] = 0x7A879D8A;

  GET_ULONG_BE(W[ 0], data,  0);
  GET_ULONG_BE(W[ 1], data,  4);
  GET_ULONG_BE(W[ 2], data,  8);
  GET_ULONG_BE(W[ 3], data, 12);
  GET_ULONG_BE(W[ 4], data, 16);
  GET_ULONG_BE(W[ 5], data, 20);
  GET_ULONG_BE(W[ 6], data, 24);
  GET_ULONG_BE(W[ 7], data, 28);
  GET_ULONG_BE(W[ 8], data, 32);
  GET_ULONG_BE(W[ 9], data, 36);
  GET_ULONG_BE(W[10], data, 40);
  GET_ULONG_BE(W[11], data, 44);
  GET_ULONG_BE(W[12], data, 48);
  GET_ULONG_BE(W[13], data, 52);
  GET_ULONG_BE(W[14], data, 56);
  GET_ULONG_BE(W[15], data, 60);

#define FF0(x,y,z) ((x) ^ (y) ^ (z))
#define FF1(x,y,z) (((x) & (y)) | ( (x) & (z)) | ( (y) & (z)))

#define GG0(x,y,z) ( (x) ^ (y) ^ (z))
#define GG1(x,y,z) (((x) & (y)) | ( (~(x)) & (z)) )

#define SHL(x,n) (((x) & 0xFFFFFFFF) << n)
#define ROTL(x,n) (SHL((x),n) | ((x) >> (32 - n)))

#define P0(x) ((x) ^  ROTL((x),9) ^ ROTL((x),17))
#define P1(x) ((x) ^  ROTL((x),15) ^ ROTL((x),23))

  for(j = 16; j < 68; j++ )
  {
    Temp1 = W[j - 16] ^ W[j - 9];
    Temp2 = ROTL(W[j - 3], 15);
    Temp3 = Temp1 ^ Temp2;
    Temp4 = P1(Temp3);
    Temp5 =  ROTL(W[j - 13], 7 ) ^ W[j - 6];
    W[j] = Temp4 ^ Temp5;
  }

  for(j = 0; j < 64; j++)
  {
    W1[j] = W[j] ^ W[j + 4];
  }

  A = ctx->state[0];
  B = ctx->state[1];
  C = ctx->state[2];
  D = ctx->state[3];
  E = ctx->state[4];
  F = ctx->state[5];
  G = ctx->state[6];
  H = ctx->state[7];

  for(j = 0; j < 16; j++)
  {
    SS1 = ROTL((ROTL(A, 12) + E + ROTL(T[j], j)), 7);
    SS2 = SS1 ^ ROTL(A, 12);
    TT1 = FF0(A, B, C) + D + SS2 + W1[j];
    TT2 = GG0(E, F, G) + H + SS1 + W[j];
    D = C;
    C = ROTL(B, 9);
    B = A;
    A = TT1;
    H = G;
    G = ROTL(F, 19);
    F = E;
    E = P0(TT2);
  }

  for(j = 16; j < 64; j++)
  {
    SS1 = ROTL((ROTL(A, 12) + E + ROTL(T[j], j)), 7);
    SS2 = SS1 ^ ROTL(A, 12);
    TT1 = FF1(A, B, C) + D + SS2 + W1[j];
    TT2 = GG1(E, F, G) + H + SS1 + W[j];
    D = C;
    C = ROTL(B, 9);
    B = A;
    A = TT1;
    H = G;
    G = ROTL(F, 19);
    F = E;
    E = P0(TT2);
  }

  ctx->state[0] ^= A;
  ctx->state[1] ^= B;
  ctx->state[2] ^= C;
  ctx->state[3] ^= D;
  ctx->state[4] ^= E;
  ctx->state[5] ^= F;
  ctx->state[6] ^= G;
  ctx->state[7] ^= H;
}

/*
 * SM3 process buffer
 */
void sm3_update(struct sm3_context *ctx, unsigned char *input, int ilen)
{
  int fill;
  unsigned long left;

  if(ilen <= 0)
    return;

  left = ctx->total[0] & 0x3F;
  fill = 64 - (int)left;

  ctx->total[0] += ilen;
  ctx->total[0] &= 0xFFFFFFFF;

  if(ctx->total[0] < (unsigned long)ilen)
    ctx->total[1]++;

  if(left && ilen >= fill)
  {
    memcpy((void *)(ctx->buffer + left),
      (void *)input, fill);
    sm3_process(ctx, ctx->buffer);
    input += fill;
    ilen -= fill;
    left = 0;
  }

  while(ilen >= 64)
  {
    sm3_process( ctx, input );
    input += 64;
    ilen  -= 64;
  }

  if(ilen > 0)
  {
    memcpy((void*)(ctx->buffer + left),
      (void*)input, ilen);
  }
}

static const unsigned char sm3_padding[64] =
{
  0x80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

/*
 * SM3 final digest
 */
void sm3_final(struct sm3_context *ctx, unsigned char output[32])
{
  unsigned long last, padn;
  unsigned long high, low;
  unsigned char msglen[8];

  high = (ctx->total[0] >> 29)
    | (ctx->total[1] << 3);
  low = (ctx->total[0] << 3);

  PUT_ULONG_BE( high, msglen, 0 );
  PUT_ULONG_BE( low,  msglen, 4 );

  last = ctx->total[0] & 0x3F;
  padn = (last < 56) ? (56 - last) : (120 - last);

  sm3_update( ctx, (unsigned char *) sm3_padding, (int)padn );
  sm3_update( ctx, msglen, 8 );

  PUT_ULONG_BE( ctx->state[0], output,  0 );
  PUT_ULONG_BE( ctx->state[1], output,  4 );
  PUT_ULONG_BE( ctx->state[2], output,  8 );
  PUT_ULONG_BE( ctx->state[3], output, 12 );
  PUT_ULONG_BE( ctx->state[4], output, 16 );
  PUT_ULONG_BE( ctx->state[5], output, 20 );
  PUT_ULONG_BE( ctx->state[6], output, 24 );
  PUT_ULONG_BE( ctx->state[7], output, 28 );
}

uint8_t* penglai_get_wasm_vm_mr_sec_buf_addr()
{
    return reinterpret_cast<uint8_t*>(reinterpret_cast<uint64_t>(sgx_wasm_vm_mr_buf) + sizeof(sgx_wasm_vm_mr_t));
}

void measure_sim(uint8_t *wasm_blob, uint64_t wasm_blob_size, struct sm3_context *hash_ctx, uint8_t* hash, unsigned long nonce)
{
    unsigned long start_va = PENGLAI_WASM_SEC_ADDR;
    unsigned char pte = 0;
    unsigned long offset;

    uint8_t *wasm_sec_buf = (uint8_t*)malloc(PENGLAI_WASM_SEC_SIZE);
    memset(wasm_sec_buf, 0, PENGLAI_WASM_SEC_SIZE);
    memcpy(wasm_sec_buf, wasm_blob, wasm_blob_size);
    uint8_t* source = reinterpret_cast<uint8_t*>(reinterpret_cast<uint64_t>(wasm_sec_buf));
    
    sm3_update(hash_ctx, (unsigned char*)&start_va, sizeof(unsigned long));
    sm3_update(hash_ctx, &pte, 1);
    sm3_update(hash_ctx, (unsigned char*)source, 0x1000);
    source += 0x1000;

    for (offset = 0x1000; offset < PENGLAI_WASM_SEC_SIZE; offset += 0x1000, source += 0x1000)
        sm3_update(hash_ctx, (unsigned char*)source, 0x1000);

    sm3_update(hash_ctx, (unsigned char*)(&nonce), sizeof(unsigned long));
    sm3_final(hash_ctx, (unsigned char*)hash);

    free(wasm_sec_buf);
}

void penglai_wasm_derive_measurement(uint8_t *wasm_blob, uint64_t wasm_blob_size, uint8_t *hash, unsigned long nonce)
{
    penglai_wasm_vm_mr_t* wasm_vm_mr = (penglai_wasm_vm_mr_t*)penglai_get_wasm_vm_mr_sec_buf_addr();
    struct sm3_context hash_ctx;

    memcpy(&hash_ctx, (void*)(wasm_vm_mr->total), PENGLAI_SM3_SIZE);

    measure_sim(wasm_blob, wasm_blob_size, &hash_ctx, hash, 0);

    sm3_init(&hash_ctx);

    sm3_update(&hash_ctx, (unsigned char*)(hash), PENGLAI_HASH_SIZE);

    sm3_update(&hash_ctx, (unsigned char*)(&nonce), sizeof(unsigned long));

    sm3_final(&hash_ctx, hash);
}
/* PENGLAI End */