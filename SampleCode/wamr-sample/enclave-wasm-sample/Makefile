# Copyright (C) 2019 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

######## SGX SDK Settings ########

SGX_SDK ?= /opt/intel/sgxsdk
SGX_MODE ?= SIM
SGX_ARCH ?= x64
SGX_DEBUG ?= 0
SPEC_TEST ?= 0

ifeq ($(shell getconf LONG_BIT), 32)
	SGX_ARCH := x86
else ifeq ($(findstring -m32, $(CXXFLAGS)), -m32)
	SGX_ARCH := x86
endif

ifeq ($(SGX_ARCH), x86)
	SGX_COMMON_CFLAGS := -m32
	SGX_LIBRARY_PATH := $(SGX_SDK)/lib
	SGX_ENCLAVE_SIGNER := $(SGX_SDK)/bin/x86/sgx_sign
	SGX_EDGER8R := $(SGX_SDK)/bin/x86/sgx_edger8r
else
	SGX_COMMON_CFLAGS := -m64
	SGX_LIBRARY_PATH := $(SGX_SDK)/lib64
	SGX_ENCLAVE_SIGNER := $(SGX_SDK)/bin/x64/sgx_sign
	SGX_EDGER8R := $(SGX_SDK)/bin/x64/sgx_edger8r
endif

ifeq ($(SGX_DEBUG), 1)
ifeq ($(SGX_PRERELEASE), 1)
$(error Cannot set SGX_DEBUG and SGX_PRERELEASE at the same time!!)
endif
endif

ifeq ($(SGX_DEBUG), 1)
	SGX_COMMON_CFLAGS += -O0 -g
else
	SGX_COMMON_CFLAGS += -O2
endif

######## App Settings ########

ifneq ($(SGX_MODE), HW)
	Urts_Library_Name := sgx_urts_sim
else
	Urts_Library_Name := sgx_urts
endif

App_Cpp_Files := App/App.cpp
App_Include_Paths := -IApp -I$(SGX_SDK)/include

App_C_Flags := $(SGX_COMMON_CFLAGS) -fPIC -Wno-attributes $(App_Include_Paths)

# Three configuration modes - Debug, prerelease, release
#   Debug - Macro DEBUG enabled.
#   Prerelease - Macro NDEBUG and EDEBUG enabled.
#   Release - Macro NDEBUG enabled.
ifeq ($(SGX_DEBUG), 1)
	App_C_Flags += -DDEBUG -UNDEBUG -UEDEBUG
else ifeq ($(SGX_PRERELEASE), 1)
	App_C_Flags += -DNDEBUG -DEDEBUG -UDEBUG
else
	App_C_Flags += -DNDEBUG -UEDEBUG -UDEBUG
endif

App_Cpp_Flags := $(App_C_Flags) -std=c++11
App_Link_Flags := $(SGX_COMMON_CFLAGS) libvmlib_untrusted.a -L$(SGX_LIBRARY_PATH) -l$(Urts_Library_Name) -lpthread

ifneq ($(SGX_MODE), HW)
	App_Link_Flags += -lsgx_uae_service_sim
else
	App_Link_Flags += -lsgx_uae_service
endif

App_Cpp_Objects := $(App_Cpp_Files:.cpp=.o)

App_Name := iwasm

######## WASM VM Enclave Settings ########

ifneq ($(SGX_MODE), HW)
	Trts_Library_Name := sgx_trts_sim
	Service_Library_Name := sgx_tservice_sim
else
	Trts_Library_Name := sgx_trts
	Service_Library_Name := sgx_tservice
endif
Crypto_Library_Name := sgx_tcrypto

WAMR_ROOT := /home/nsec-sgx/SGXENV/wasm-micro-runtime

WASM_VM_Enclave_Cpp_Files := WASM-VM-Enclave/Enclave.cpp

WASM_VM_Enclave_Include_Paths := -IEnclave -I$(WAMR_ROOT)/core/iwasm/include \
                         -I$(WAMR_ROOT)/core/shared/utils \
                         -I$(WAMR_ROOT)/core/shared/platform/linux-sgx \
                         -I$(SGX_SDK)/include \
                         -I$(SGX_SDK)/include/tlibc \
                         -I$(SGX_SDK)/include/stlport

WASM_VM_Enclave_C_Flags := $(SGX_COMMON_CFLAGS) -nostdinc -fvisibility=hidden -fpie -fstack-protector $(WASM_VM_Enclave_Include_Paths)
ifeq ($(SPEC_TEST), 1)
	WASM_VM_Enclave_C_Flags += -DWASM_ENABLE_SPEC_TEST=1
else
	WASM_VM_Enclave_C_Flags += -DWASM_ENABLE_SPEC_TEST=0
endif
WASM_VM_Enclave_Cpp_Flags := $(WASM_VM_Enclave_C_Flags) -std=c++03 -nostdinc++
WASM_VM_Enclave_Link_Flags := $(SGX_COMMON_CFLAGS) -Wl,--no-undefined -nostdlib -nodefaultlibs -nostartfiles -L$(SGX_LIBRARY_PATH) \
	-Wl,--whole-archive -l$(Trts_Library_Name) -Wl,--no-whole-archive \
    libvmlib.a \
	-Wl,--start-group -lsgx_tstdc -lsgx_tcxx -lsgx_pthread -lsgx_wasm -l$(Crypto_Library_Name) -l$(Service_Library_Name) -Wl,--end-group \
	-Wl,-Bstatic -Wl,-Bsymbolic -Wl,--no-undefined \
	-Wl,-pie,-eenclave_entry -Wl,--export-dynamic  \
	-Wl,--defsym,__ImageBase=0

WASM_VM_Enclave_Cpp_Objects := $(WASM_VM_Enclave_Cpp_Files:.cpp=.o)

WASM_VM_Enclave_Name := wasm-vm-enclave.so
WASM_VM_Signed_Enclave_Name := wasm-vm-enclave.signed.so
WASM_VM_Enclave_Config_File := WASM-VM-Enclave/Enclave.config.xml

######## Compiler Enclave Settings ########
Compiler_Enclave_Cpp_Files := Compiler-Enclave/Enclave.cpp
# Compiler_Enclave_Include_Paths := -IInclude -IEnclave -I$(SGX_SDK)/include -I$(SGX_SDK)/include/tlibc -I$(SGX_SDK)/include/libcxx
Compiler_Enclave_Include_Paths = -IEnclave -I$(WAMR_ROOT)/core/iwasm/include \
                         -I$(WAMR_ROOT)/core/shared/utils \
                         -I$(WAMR_ROOT)/core/shared/platform/linux-sgx \
                         -I$(SGX_SDK)/include \
                         -I$(SGX_SDK)/include/tlibc \
                         -I$(SGX_SDK)/include/stlport
Compiler_Enclave_C_Flags := $(Enclave_Include_Paths) -nostdinc -fvisibility=hidden -fpie -ffunction-sections -fdata-sections $(MITIGATION_CFLAGS)
CC_BELOW_4_9 := $(shell expr "`$(CC) -dumpversion`" \< "4.9")
ifeq ($(CC_BELOW_4_9), 1)
	Compiler_Enclave_C_Flags += -fstack-protector
else
	Compiler_Enclave_C_Flags += -fstack-protector-strong
endif

Compiler_Enclave_Cpp_Flags := $(Compiler_Enclave_C_Flags) -nostdinc++

# Enable the security flags
Compiler_Enclave_Security_Link_Flags := -Wl,-z,relro,-z,now,-z,noexecstack

Compiler_Enclave_Link_Flags := $(MITIGATION_LDFLAGS) $(Compiler_Enclave_Security_Link_Flags) \
    -Wl,--no-undefined -nostdlib -nodefaultlibs -nostartfiles -L$(SGX_TRUSTED_LIBRARY_PATH) \
	-Wl,--whole-archive -l$(Trts_Library_Name) -Wl,--no-whole-archive \
	-Wl,--start-group -lsgx_tstdc -lsgx_tcxx -l$(Crypto_Library_Name) -l$(Service_Library_Name) -lsgx_wasm -Wl,--end-group \
	-Wl,-Bstatic -Wl,-Bsymbolic -Wl,--no-undefined \
	-Wl,-pie,-eenclave_entry -Wl,--export-dynamic  \
	-Wl,--defsym,__ImageBase=0 -Wl,--gc-sections   \
	-Wl,--version-script=Enclave/Enclave.lds

Compiler_Enclave_Cpp_Objects := $(sort $(Compiler_Enclave_Cpp_Files:.cpp=.o))

Compiler_Enclave_Name := compiler-enclave.so
Compiler_Signed_Enclave_Name := compiler-enclave.signed.so
Compiler_Enclave_Config_File := Compiler-Enclave/Enclave.config.xml

MRFILE := wasmmr.bin

ifeq ($(SGX_MODE), HW)
ifneq ($(SGX_DEBUG), 1)
ifneq ($(SGX_PRERELEASE), 1)
Build_Mode = HW_RELEASE
endif
endif
endif


.PHONY: all run

ifeq ($(Build_Mode), HW_RELEASE)
all: $(App_Name) $(WASM_VM_Enclave_Name)
	@echo "The project has been built in release hardware mode."
	@echo "Please sign the $(Enclave_Name) first with your signing key before you run the $(App_Name) to launch and access the enclave."
	@echo "To sign the enclave use the command:"
	@echo "   $(SGX_ENCLAVE_SIGNER) sign -key <your key> -enclave $(Enclave_Name) -out <$(Signed_Enclave_Name)> -config $(Enclave_Config_File)"
	@echo "You can also sign the enclave using an external signing tool. See User's Guide for more details."
	@echo "To build the project in simulation mode set SGX_MODE=SIM. To build the project in prerelease mode set SGX_PRERELEASE=1 and SGX_MODE=HW."
else
all: $(App_Name) $(WASM_VM_Signed_Enclave_Name)
# all: $(App_Name) $(WASM_VM_Signed_Enclave_Name) $(Compiler_Signed_Enclave_Name)
endif

run: all
ifneq ($(Build_Mode), HW_RELEASE)
	@$(CURDIR)/$(App_Name)
	@echo "RUN  =>  $(App_Name) [$(SGX_MODE)|$(SGX_ARCH), OK]"
endif

######## App Objects ########

App/Enclave_u.c: $(SGX_EDGER8R) WASM-VM-Enclave/Enclave.edl
	@cd App && $(SGX_EDGER8R) --untrusted ../WASM-VM-Enclave/Enclave.edl\
		--search-path ../WASM-VM-Enclave \
		--search-path $(SGX_SDK)/include \
		--search-path $(WAMR_ROOT)/core/shared/platform/linux-sgx
	@echo "GEN  =>  $@"

App/Enclave_u.o: App/Enclave_u.c
	@$(CC) $(App_C_Flags) -c $< -o $@
	@echo "CC   <=  $<"

App/%.o: App/%.cpp
	@$(CXX) $(App_Cpp_Flags) -c $< -o $@
	@echo "CXX  <=  $<"

libvmlib_untrusted.a: ../build/libvmlib_untrusted.a
	@cp $< $@
	@echo "CP $@  <=  $<"

$(App_Name): App/Enclave_u.o $(App_Cpp_Objects) libvmlib_untrusted.a
	@$(CXX) $^ -o $@ $(App_Link_Flags)
	@echo "LINK =>  $@"


######## WASM VM Enclave Objects ########
WASM-VM-Enclave/Enclave_t.c: $(SGX_EDGER8R) WASM-VM-Enclave/Enclave.edl
	@cd WASM-VM-Enclave && $(SGX_EDGER8R) --trusted ../WASM-VM-Enclave/Enclave.edl \
		--search-path ../Enclave \
		--search-path $(SGX_SDK)/include \
		--search-path $(WAMR_ROOT)/core/shared/platform/linux-sgx
	@echo "GEN  =>  $@"

WASM-VM-Enclave/Enclave_t.o: WASM-VM-Enclave/Enclave_t.c
	@$(CC) $(WASM_VM_Enclave_C_Flags) -c $< -o $@
	@echo "CC   <=  $<"

WASM-VM-Enclave/%.o: WASM-VM-Enclave/%.cpp
	@$(CXX) $(WASM_VM_Enclave_Cpp_Flags) -c $< -o $@
	@echo "CXX  <=  $<"

libvmlib.a: ../build/libvmlib.a
	@cp $< $@
	@echo "CP $@  <=  $<"

$(WASM_VM_Enclave_Name): WASM-VM-Enclave/Enclave_t.o $(WASM_VM_Enclave_Cpp_Objects) libvmlib.a
	@$(CXX) $^ -o $@ $(WASM_VM_Enclave_Link_Flags)
	@echo "LINK =>  $@"

$(WASM_VM_Signed_Enclave_Name): $(WASM_VM_Enclave_Name)
	@$(SGX_ENCLAVE_SIGNER) gen_wasm_vm_mr -key WASM-VM-Enclave/Enclave_private.pem -enclave $(WASM_VM_Enclave_Name) -out $@ -config $(WASM_VM_Enclave_Config_File) -wasm_vm_mr_out $(MRFILE)
	@$(SGX_ENCLAVE_SIGNER) signwasm -key WASM-VM-Enclave/Enclave_private.pem -enclave $(WASM_VM_Enclave_Name) -out $@ -config $(WASM_VM_Enclave_Config_File) -wasmfile main.wasm
	# @$(SGX_ENCLAVE_SIGNER) sign -key WASM-VM-Enclave/Enclave_private.pem -enclave $(WASM_VM_Enclave_Name) -out $@ -config $(WASM_VM_Enclave_Config_File)
	@echo "SIGN =>  $@"

######## Compiler Enclave Objects ########
Compiler-Enclave/Enclave_t.h: $(SGX_EDGER8R) Compiler-Enclave/Enclave.edl
	@cd Compiler-Enclave && $(SGX_EDGER8R) --trusted ../Compiler-Enclave/Enclave.edl --search-path ../Compiler-Enclave --search-path $(SGX_SDK)/include
	@echo "GEN  =>  $@"

Compiler-Enclave/Enclave_t.c: Compiler-Enclave/Enclave_t.h

Compiler-Enclave/Enclave_t.o: Compiler-Enclave/Enclave_t.c
	@$(CC) $(SGX_COMMON_CFLAGS) $(Compiler_Enclave_C_Flags) -c $< -o $@
	@echo "CC   <=  $<"

Compiler-Enclave/%.o: Compiler-Enclave/%.cpp Compiler-Enclave/Enclave_t.h
	@$(CXX) $(SGX_COMMON_CXXFLAGS) $(Compiler_Enclave_Cpp_Flags) -c $< -o $@
	@echo "CXX  <=  $<"

$(Compiler_Enclave_Name): Compiler-Enclave/Enclave_t.o $(Compiler_Enclave_Cpp_Objects)
	@$(CXX) $^ -o $@ $(Compiler_Enclave_Link_Flags)
	@echo "LINK =>  $@"

MRFILE := wasmmr.bin
$(Compiler_Signed_Enclave_Name): $(Compiler_Enclave_Name)
	@$(SGX_ENCLAVE_SIGNER) sign_wasm_vm_mr -key Compilre-Enclave/Enclave_private_test.pem -enclave $(Compiler_Enclave_Name) -out $@ -config $(Compiler_Enclave_Config_File) -wasm_vm_mr_in $(MRFILE)
	# @$(SGX_ENCLAVE_SIGNER) sign -key Compiler-Enclave/Enclave_private_test.pem -enclave $(Compiler_Enclave_Name) -out $@ -config $(Enclave_Config_File)
	@echo "SIGN =>  $@"

.PHONY: clean

clean:
	@rm -f $(App_Name) $(WASM_VM_Enclave_Name) $(WASM_VM_Signed_Enclave_Name) $(Compiler_Enclave_Name) $(Compiler_Signed_Enclave_Name) $(App_Cpp_Objects) App/Enclave_u.* $(WASM_VM_Enclave_Cpp_Objects) WASM-VM-Enclave/Enclave_t.* $(Compiler_Enclave_Cpp_Objects) Compiler-Enclave/Enclave_t.* libvmlib.a libvmlib_untrusted.a $(MRFILE)
