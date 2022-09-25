# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "ASM"
  "C"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_ASM
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/arch/invokeNative_em64.s" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/arch/invokeNative_em64.s.o"
  )
set(CMAKE_ASM_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_ASM
  "BH_FREE=wasm_runtime_free"
  "BH_MALLOC=wasm_runtime_malloc"
  "BH_PLATFORM_LINUX_SGX"
  "BUILD_TARGET_X86_64"
  "WASM_DISABLE_HW_BOUND_CHECK=0"
  "WASM_ENABLE_AOT=1"
  "WASM_ENABLE_BULK_MEMORY=1"
  "WASM_ENABLE_FAST_INTERP=1"
  "WASM_ENABLE_INTERP=1"
  "WASM_ENABLE_LIBC_BUILTIN=1"
  "WASM_ENABLE_LIBC_WASI=1"
  "WASM_ENABLE_LIB_PTHREAD=1"
  "WASM_ENABLE_MINI_LOADER=0"
  "WASM_ENABLE_MULTI_MODULE=0"
  "WASM_ENABLE_SHARED_MEMORY=1"
  "WASM_ENABLE_THREAD_MGR=1"
  )

# The include file search paths:
set(CMAKE_ASM_TARGET_INCLUDE_PATH
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/interpreter"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/aot"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-builtin"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/include"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/src"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/lib-pthread"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/thread-mgr"
  "../../../../core/iwasm/include"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/../include"
  "/home/nsec-sgx/SGXENVWASM/sgxsdk/include"
  "/home/nsec-sgx/SGXENVWASM/sgxsdk/include/tlibc"
  "/home/nsec-sgx/SGXENVWASM/sgxsdk/include/libcxx"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/mem-alloc"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils"
  )
set(CMAKE_DEPENDS_CHECK_C
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/aot/aot_intrinsic.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/aot/aot_intrinsic.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/aot/aot_loader.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/aot/aot_loader.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/aot/aot_runtime.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/aot/aot_runtime.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/aot/arch/aot_reloc_x86_64.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/aot/arch/aot_reloc_x86_64.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/wasm_application.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/wasm_application.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/wasm_c_api.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/wasm_c_api.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/wasm_exec_env.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/wasm_exec_env.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/wasm_memory.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/wasm_memory.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/wasm_native.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/wasm_native.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/wasm_runtime_common.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/wasm_runtime_common.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/wasm_shared_memory.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common/wasm_shared_memory.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/interpreter/wasm_interp_fast.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/interpreter/wasm_interp_fast.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/interpreter/wasm_loader.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/interpreter/wasm_loader.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/interpreter/wasm_runtime.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/interpreter/wasm_runtime.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/lib-pthread/lib_pthread_wrapper.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/lib-pthread/lib_pthread_wrapper.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-builtin/libc_builtin_wrapper.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-builtin/libc_builtin_wrapper.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-wasi/libc_wasi_wrapper.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-wasi/libc_wasi_wrapper.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/src/posix.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/src/posix.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/src/random.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/src/random.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/src/str.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/src/str.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/src/wasm_mr.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/src/wasm_mr.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/thread-mgr/thread_manager.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/thread-mgr/thread_manager.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/mem-alloc/ems/ems_alloc.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/mem-alloc/ems/ems_alloc.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/mem-alloc/ems/ems_hmu.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/mem-alloc/ems/ems_hmu.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/mem-alloc/ems/ems_kfc.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/mem-alloc/ems/ems_kfc.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/mem-alloc/mem_alloc.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/mem-alloc/mem_alloc.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_attestation.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_attestation.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_file.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_file.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_platform.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_platform.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_pthread.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_pthread.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_signal.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_signal.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_socket.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_socket.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_thread.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_thread.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_time.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/sgx_time.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/bh_assert.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/bh_assert.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/bh_common.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/bh_common.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/bh_hashmap.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/bh_hashmap.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/bh_list.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/bh_list.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/bh_log.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/bh_log.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/bh_queue.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/bh_queue.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/bh_vector.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/bh_vector.c.o"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/runtime_timer.c" "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib.dir/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils/runtime_timer.c.o"
  )
set(CMAKE_C_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_C
  "BH_FREE=wasm_runtime_free"
  "BH_MALLOC=wasm_runtime_malloc"
  "BH_PLATFORM_LINUX_SGX"
  "BUILD_TARGET_X86_64"
  "WASM_DISABLE_HW_BOUND_CHECK=0"
  "WASM_ENABLE_AOT=1"
  "WASM_ENABLE_BULK_MEMORY=1"
  "WASM_ENABLE_FAST_INTERP=1"
  "WASM_ENABLE_INTERP=1"
  "WASM_ENABLE_LIBC_BUILTIN=1"
  "WASM_ENABLE_LIBC_WASI=1"
  "WASM_ENABLE_LIB_PTHREAD=1"
  "WASM_ENABLE_MINI_LOADER=0"
  "WASM_ENABLE_MULTI_MODULE=0"
  "WASM_ENABLE_SHARED_MEMORY=1"
  "WASM_ENABLE_THREAD_MGR=1"
  )

# The include file search paths:
set(CMAKE_C_TARGET_INCLUDE_PATH
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/interpreter"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/aot"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-builtin"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/include"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/libc-wasi/sandboxed-system-primitives/src"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/lib-pthread"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/libraries/thread-mgr"
  "../../../../core/iwasm/include"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/platform/linux-sgx/../include"
  "/home/nsec-sgx/SGXENVWASM/sgxsdk/include"
  "/home/nsec-sgx/SGXENVWASM/sgxsdk/include/tlibc"
  "/home/nsec-sgx/SGXENVWASM/sgxsdk/include/libcxx"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/mem-alloc"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/iwasm/common"
  "/home/nsec-sgx/Penglai-WAMR/WAMR-wasm/core/shared/utils"
  )

# Targets to which this target links.
set(CMAKE_TARGET_LINKED_INFO_FILES
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
