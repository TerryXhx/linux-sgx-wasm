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
CMAKE_SOURCE_DIR = /root/SGXENV/linux-sgx/psw/ae/aesm_service/source

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build

# Include any dependencies generated for this target.
include bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/depend.make

# Include the progress variables for this target.
include bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/progress.make

# Include the compile flags for this target's objects.
include bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/flags.make

bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp: bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/res_0.zip
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Checking resource dependencies for ecdsa_quote_service_bundle"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle && /usr/bin/cmake -E copy /root/SGXENV/linux-sgx/external/CppMicroServices/local-install/share/cppmicroservices4/cmake/CMakeResourceDependencies.cpp /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp

bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/res_0.zip: ../bundles/ecdsa_quote_service_bundle/manifest.json
bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/res_0.zip: /root/SGXENV/linux-sgx/external/CppMicroServices/local-install/bin/usResourceCompiler4
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Checking resource dependencies for ecdsa_quote_service_bundle"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/bundles/ecdsa_quote_service_bundle && /usr/bin/cmake -E make_directory /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/bundles/ecdsa_quote_service_bundle && /root/SGXENV/linux-sgx/external/CppMicroServices/local-install/bin/usResourceCompiler4 -o /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/res_0.zip -n ecdsa_quote_service_bundle_name -r manifest.json

bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle.cpp.o: bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/flags.make
bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle.cpp.o: ../bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle.cpp.o"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle.cpp.o -c /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle.cpp

bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle.cpp.i"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle.cpp > CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle.cpp.i

bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle.cpp.s"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle.cpp -o CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle.cpp.s

bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp.o: bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/flags.make
bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp.o: bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp.o"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp.o -c /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp

bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp.i"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp > CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp.i

bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp.s"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp -o CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp.s

bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_init.cpp.o: bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/flags.make
bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_init.cpp.o: bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/cppmicroservices_init.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_init.cpp.o"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_init.cpp.o -c /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/cppmicroservices_init.cpp

bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_init.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_init.cpp.i"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/cppmicroservices_init.cpp > CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_init.cpp.i

bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_init.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_init.cpp.s"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/cppmicroservices_init.cpp -o CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_init.cpp.s

# Object files for target ecdsa_quote_service_bundle
ecdsa_quote_service_bundle_OBJECTS = \
"CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle.cpp.o" \
"CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp.o" \
"CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_init.cpp.o"

# External object files for target ecdsa_quote_service_bundle
ecdsa_quote_service_bundle_EXTERNAL_OBJECTS =

bin/bundles/libecdsa_quote_service_bundle.so: bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle.cpp.o
bin/bundles/libecdsa_quote_service_bundle.so: bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp.o
bin/bundles/libecdsa_quote_service_bundle.so: bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/ecdsa_quote_service_bundle/cppmicroservices_init.cpp.o
bin/bundles/libecdsa_quote_service_bundle.so: bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/build.make
bin/bundles/libecdsa_quote_service_bundle.so: /root/SGXENV/linux-sgx/external/CppMicroServices/local-install/lib/libCppMicroServices.so.4.0.0
bin/bundles/libecdsa_quote_service_bundle.so: bin/libutils.so
bin/bundles/libecdsa_quote_service_bundle.so: ../../../../../external/dcap_source/QuoteGeneration/build/linux/libsgx_qe3_logic.so
bin/bundles/libecdsa_quote_service_bundle.so: bin/liboal.so
bin/bundles/libecdsa_quote_service_bundle.so: /usr/lib/x86_64-linux-gnu/libssl.so
bin/bundles/libecdsa_quote_service_bundle.so: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/bundles/libecdsa_quote_service_bundle.so: ../../../../../external/rdrand/src/librdrand.a
bin/bundles/libecdsa_quote_service_bundle.so: bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX shared library ../../bin/bundles/libecdsa_quote_service_bundle.so"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ecdsa_quote_service_bundle.dir/link.txt --verbose=$(VERBOSE)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Appending zipped resources to ecdsa_quote_service_bundle"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/bundles/ecdsa_quote_service_bundle && objcopy --add-section .note.sgx.aesm_resource=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/res_0.zip /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bin/bundles/libecdsa_quote_service_bundle.so

# Rule to build all files generated by this target.
bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/build: bin/bundles/libecdsa_quote_service_bundle.so

.PHONY : bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/build

bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/clean:
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle && $(CMAKE_COMMAND) -P CMakeFiles/ecdsa_quote_service_bundle.dir/cmake_clean.cmake
.PHONY : bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/clean

bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/depend: bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/cppmicroservices_resources.cpp
bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/depend: bundles/ecdsa_quote_service_bundle/ecdsa_quote_service_bundle/res_0.zip
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/SGXENV/linux-sgx/psw/ae/aesm_service/source /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/bundles/ecdsa_quote_service_bundle /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bundles/ecdsa_quote_service_bundle/CMakeFiles/ecdsa_quote_service_bundle.dir/depend
