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
CMAKE_SOURCE_DIR = /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build

# Include any dependencies generated for this target.
include qpl/CMakeFiles/dcap_quoteprov.dir/depend.make

# Include the progress variables for this target.
include qpl/CMakeFiles/dcap_quoteprov.dir/progress.make

# Include the compile flags for this target's objects.
include qpl/CMakeFiles/dcap_quoteprov.dir/flags.make

qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp.o: qpl/CMakeFiles/dcap_quoteprov.dir/flags.make
qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp.o: /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp.o"
	cd /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/qpl && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp.o -c /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp

qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp.i"
	cd /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/qpl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp > CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp.i

qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp.s"
	cd /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/qpl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp -o CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp.s

qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp.o: qpl/CMakeFiles/dcap_quoteprov.dir/flags.make
qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp.o: /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp.o"
	cd /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/qpl && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp.o -c /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp

qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp.i"
	cd /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/qpl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp > CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp.i

qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp.s"
	cd /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/qpl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp -o CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp.s

qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp.o: qpl/CMakeFiles/dcap_quoteprov.dir/flags.make
qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp.o: /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp.o"
	cd /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/qpl && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp.o -c /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp

qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp.i"
	cd /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/qpl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp > CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp.i

qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp.s"
	cd /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/qpl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp -o CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp.s

# Object files for target dcap_quoteprov
dcap_quoteprov_OBJECTS = \
"CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp.o" \
"CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp.o" \
"CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp.o"

# External object files for target dcap_quoteprov
dcap_quoteprov_EXTERNAL_OBJECTS =

bin/libdcap_quoteprov.so: qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_base64.cpp.o
bin/libdcap_quoteprov.so: qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/sgx_default_quote_provider.cpp.o
bin/libdcap_quoteprov.so: qpl/CMakeFiles/dcap_quoteprov.dir/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/external/dcap_source/QuoteGeneration/qpl/linux/x509.cpp.o
bin/libdcap_quoteprov.so: qpl/CMakeFiles/dcap_quoteprov.dir/build.make
bin/libdcap_quoteprov.so: bin/libsgx_default_qcnl_wrapper.so
bin/libdcap_quoteprov.so: /usr/lib/x86_64-linux-gnu/libcurl.so
bin/libdcap_quoteprov.so: ../../../../../external/dcap_source/QuoteGeneration/qpl/linux/sgx_default_quote_provider.lds
bin/libdcap_quoteprov.so: qpl/CMakeFiles/dcap_quoteprov.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX shared library ../bin/libdcap_quoteprov.so"
	cd /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/qpl && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dcap_quoteprov.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
qpl/CMakeFiles/dcap_quoteprov.dir/build: bin/libdcap_quoteprov.so

.PHONY : qpl/CMakeFiles/dcap_quoteprov.dir/build

qpl/CMakeFiles/dcap_quoteprov.dir/clean:
	cd /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/qpl && $(CMAKE_COMMAND) -P CMakeFiles/dcap_quoteprov.dir/cmake_clean.cmake
.PHONY : qpl/CMakeFiles/dcap_quoteprov.dir/clean

qpl/CMakeFiles/dcap_quoteprov.dir/depend:
	cd /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/qpl /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/qpl /home/nsec-sgx/SGXENVWASM/linux-sgx-wasm/psw/ae/aesm_service/source/build/qpl/CMakeFiles/dcap_quoteprov.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : qpl/CMakeFiles/dcap_quoteprov.dir/depend

