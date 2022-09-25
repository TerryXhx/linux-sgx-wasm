#include <iostream>
#include <fstream>

using namespace std;

#define PENGLAI_WASM_VM_MR_SEC_ADDR 0xfffffff000000000UL
#define PENGLAI_WASM_VM_MR_SEC_SIZE 0x1000UL
#define PENGLAI_WASM_SEC_ADDR       0xfffffff000001000UL
#define PENGLAI_WASM_SEC_SIZE       0x5000UL

void printHashCtx(unsigned long *hash)
{
	int i;
    printf("intermediate hash ctx:\n");
	for (i = 0; i < 25; i++) {
        printf("0x%016lx,\n", (*hash));
        ++hash;
	}
}


int main() {
    ifstream in("sgx_wasm_vm_mr.bin", ios::in | ios::binary);
    unsigned long wasm_vm_mr[512];
    in.read((char*)wasm_vm_mr, 512 * sizeof(unsigned long));
    in.close();

    ifstream in2("penglai_wasm_vm_mr.bin", ios::in | ios::binary);
    in2.read(((char*)wasm_vm_mr + 48), 512 * sizeof(unsigned long));
    in2.close();

    ofstream out("wasm_vm_mr.bin", ios::out | ios::binary);
    out.write((char*)wasm_vm_mr, 512 * sizeof(unsigned long));
    out.close();
    printHashCtx(wasm_vm_mr);

    ifstream in3("wasm_vm_mr.bin", ios::in | ios::binary);
    unsigned long wasm_vm_mr_test[512];
    in3.read((char*)wasm_vm_mr_test, 512 * sizeof(unsigned long));

    printHashCtx(wasm_vm_mr_test);
}