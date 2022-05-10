-----------------------------
Purpose of SampleEnclaveGMIPP
-----------------------------
The project demonstrates the usage of GM SM2/SM3/SM4 functions using IPP as library of 
Intel(R) Software Guard Extensions (Intel(R) SGX) SDK.
More details about GM SM2/SM3/SM4 functions in IPP, please refer to IPP official home page.

------------------------------------
How to Build/Execute the Sample Code
------------------------------------
1. Install Intel(R) SGX SDK for Linux* OS
2. Make sure your environment is set:
    $ source ${sgx-sdk-install-path}/environment
3. Ensure IPP header file folder is included in Makefile:
	Enclave_Include_Paths := [other Enclave_Include_Paths] -I$(SGX_SDK)/include/ipp
4. Build the project with the prepared Makefile:
    a. Hardware Mode, Debug build:
        1) Enclave with no mitigation:
            $ make
        2) Enclave with mitigations for indirects and returns only:
            $ make MITIGATION-CVE-2020-0551=CF
        3) Enclave with full mitigation:
            $ make MITIGATION-CVE-2020-0551=LOAD
    b. Hardware Mode, Pre-release build:
        1) Enclave with no mitigation:
            $ make SGX_PRERELEASE=1 SGX_DEBUG=0
        2) Enclave with mitigations for indirects and returns only:
            $ make SGX_PRERELEASE=1 SGX_DEBUG=0 MITIGATION-CVE-2020-0551=CF
        3) Enclave with full mitigation:
            $ make SGX_PRERELEASE=1 SGX_DEBUG=0 MITIGATION-CVE-2020-0551=LOAD
    c. Hardware Mode, Release build:
        1) Enclave with no mitigation:
            $ make SGX_DEBUG=0
        2) Enclave with mitigations for indirects and returns only:
            $ make SGX_DEBUG=0 MITIGATION-CVE-2020-0551=CF
        3) Enclave with full mitigation:
            $ make SGX_DEBUG=0 MITIGATION-CVE-2020-0551=LOAD
    d. Simulation Mode, Debug build:
        $ make SGX_MODE=SIM
    e. Simulation Mode, Pre-release build:
        $ make SGX_MODE=SIM SGX_PRERELEASE=1 SGX_DEBUG=0
    f. Simulation Mode, Release build:
        $ make SGX_MODE=SIM SGX_DEBUG=0
5. Execute the binary directly:
    $ ./app
6. Remember to "make clean" before switching build mode
