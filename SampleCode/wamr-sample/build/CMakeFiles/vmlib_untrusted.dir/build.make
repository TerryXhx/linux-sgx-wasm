# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/nsec-sgx/SGXENV/wasm-micro-runtime/product-mini/platforms/linux-sgx

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nsec-sgx/SGXENV/wasm-micro-runtime/product-mini/platforms/linux-sgx/build

# Utility rule file for vmlib_untrusted.

# Include the progress variables for this target.
include CMakeFiles/vmlib_untrusted.dir/progress.make

CMakeFiles/vmlib_untrusted: libvmlib_untrusted.a


libvmlib_untrusted.a:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/nsec-sgx/SGXENV/wasm-micro-runtime/product-mini/platforms/linux-sgx/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating libvmlib_untrusted.a"
	mkdir -p untrusted && cd untrusted && /usr/bin/cc -c /home/nsec-sgx/SGXENV/wasm-micro-runtime/core/shared/platform/linux-sgx/untrusted/file.c /home/nsec-sgx/SGXENV/wasm-micro-runtime/core/shared/platform/linux-sgx/untrusted/pthread.c /home/nsec-sgx/SGXENV/wasm-micro-runtime/core/shared/platform/linux-sgx/untrusted/signal.c /home/nsec-sgx/SGXENV/wasm-micro-runtime/core/shared/platform/linux-sgx/untrusted/socket.c /home/nsec-sgx/SGXENV/wasm-micro-runtime/core/shared/platform/linux-sgx/untrusted/time.c
	/usr/bin/ar rc libvmlib_untrusted.a untrusted/*.o

vmlib_untrusted: CMakeFiles/vmlib_untrusted
vmlib_untrusted: libvmlib_untrusted.a
vmlib_untrusted: CMakeFiles/vmlib_untrusted.dir/build.make

.PHONY : vmlib_untrusted

# Rule to build all files generated by this target.
CMakeFiles/vmlib_untrusted.dir/build: vmlib_untrusted

.PHONY : CMakeFiles/vmlib_untrusted.dir/build

CMakeFiles/vmlib_untrusted.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/vmlib_untrusted.dir/cmake_clean.cmake
.PHONY : CMakeFiles/vmlib_untrusted.dir/clean

CMakeFiles/vmlib_untrusted.dir/depend:
	cd /home/nsec-sgx/SGXENV/wasm-micro-runtime/product-mini/platforms/linux-sgx/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nsec-sgx/SGXENV/wasm-micro-runtime/product-mini/platforms/linux-sgx /home/nsec-sgx/SGXENV/wasm-micro-runtime/product-mini/platforms/linux-sgx /home/nsec-sgx/SGXENV/wasm-micro-runtime/product-mini/platforms/linux-sgx/build /home/nsec-sgx/SGXENV/wasm-micro-runtime/product-mini/platforms/linux-sgx/build /home/nsec-sgx/SGXENV/wasm-micro-runtime/product-mini/platforms/linux-sgx/build/CMakeFiles/vmlib_untrusted.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/vmlib_untrusted.dir/depend

