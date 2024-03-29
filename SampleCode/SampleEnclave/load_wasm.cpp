#include <fstream>
#include <iostream>
#include <link.h>
#include <memory>
#include <unistd.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <pwd.h>
#include <fcntl.h>

typedef struct _sgx_wasm_t {
    uint64_t size;
    uint8_t wasm_blob[];
} sgx_wasm_t;

int write_data_to_file(const char* filename, uint8_t* buf, size_t bsize, long offset)
{
    std::ios_base::openmode mode = std::ios::in | std::ios::binary | std::ios::out;
    if (filename == NULL || (buf == NULL && bsize != 0) || (buf != NULL && bsize == 0))
        return -1;
    std::ofstream ofs(filename, mode);
    if (!ofs.good())
        return -1;
    ofs.seekp(offset, std::ios::beg);
    ofs.write(reinterpret_cast<char*>(buf), bsize);
    if (ofs.fail())
        return -1;
    return 0;
}

uint64_t get_file_size(const char* filename)
{
    std::ifstream ifs(filename, std::ios::binary | std::ios::in);
    if (!ifs.good())
        return 0;
    ifs.seekg(0, std::ios::end);
    uint64_t size = (uint64_t)ifs.tellg();
    return size;
}

int open_file(const char* file_name)
{
    FILE *fp = fopen(file_name, "rb");
    if (fp == NULL)
        return -1;

    return fileno(fp);
}

void close_handle(int fd)
{
    close(fd);
}

// #define GET_PTR(t, p, offset) reinterpret_cast<t*>( reinterpret_cast<size_t>(p) + static_cast<size_t>(offset) )
// #define GET_PTR(t, p, offset) (t*)( (size_t)(p) + (size_t)(offset) )
// const ElfW(Shdr)* get_secion_by_name(
//     const ElfW(Shdr) *elf_hdr,
//     const char *secion_name
// ) {
//     const ElfW(Shdr) *shdr = GET_PTR(ElfW(Shdr), elf_hdr, elf_hdr->e_shoff);
//     assert (sizeof(ElfW(Shdr)) == elf_hdr->e_shentsize);

//     const char *shstrtab = GET_PTR(char, elf_hdr, shdr[elf_hdr->e_shstrndx].sh_offset);
//     for (unsigned idx = 0; idx < elf_hdr->e_shnum; ++idx, ++shdr) {
//         if (!strcmp(shstrtab + shdr->sh_name, (const char*)secion_name))
//             return shdr;
//     }
//     return NULL;
// }

int read_file_to_buf(const char *filename, uint8_t *buf, uint64_t bsize, long offset)
{
    if (filename == NULL || buf == NULL || bsize == 0)
        return -1;
    std::ifstream ifs(filename, std::ifstream::in | std::ifstream::binary);
    if (!ifs.good())
        return -1;
    ifs.seekg(offset, std::ifstream::beg);
    ifs.read(reinterpret_cast<char *>(buf), bsize);
    if (ifs.fail())
        return -1;
    ifs.close();
    return 0;
}

int main()
{
    const char *wasm_file = "main.wasm";
    const char *enclave_file = "enclave.signed.so";

    uint64_t wasm_size = get_file_size(wasm_file);
    uint64_t wasm_sec_size = sizeof(uint64_t) + wasm_size;
    sgx_wasm_t *wasm_sec = (sgx_wasm_t *)malloc(wasm_sec_size);
    if (wasm_sec == NULL)
        return -1;
    if (read_file_to_buf(wasm_file, wasm_sec->wasm_blob, wasm_size, 0) != 0)
        return -1;
    wasm_sec->size = wasm_size;
    for (int i = 0; i < wasm_sec_size; i++)
        printf("%d: %02x\n", i, reinterpret_cast<uint8_t*>(wasm_sec)[i]);
    write_data_to_file(enclave_file, (uint8_t*)wasm_sec, wasm_sec_size, 0x26000);
    const char* sign_cmd = "/home/nsec-sgx/SGXENVWASM/sgxsdk/bin/x64/sgx_sign sign -key Enclave/Enclave_private_test.pem -enclave enclave.so -out enclave.signed.so -config Enclave/Enclave.config.xml";
    system(sign_cmd);
    return 0;
}