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
include utils/CMakeFiles/utils.dir/depend.make

# Include the progress variables for this target.
include utils/CMakeFiles/utils.dir/progress.make

# Include the compile flags for this target's objects.
include utils/CMakeFiles/utils.dir/flags.make

utils/CMakeFiles/utils.dir/aesm_config.cpp.o: utils/CMakeFiles/utils.dir/flags.make
utils/CMakeFiles/utils.dir/aesm_config.cpp.o: ../utils/aesm_config.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object utils/CMakeFiles/utils.dir/aesm_config.cpp.o"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/utils.dir/aesm_config.cpp.o -c /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/aesm_config.cpp

utils/CMakeFiles/utils.dir/aesm_config.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utils.dir/aesm_config.cpp.i"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/aesm_config.cpp > CMakeFiles/utils.dir/aesm_config.cpp.i

utils/CMakeFiles/utils.dir/aesm_config.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utils.dir/aesm_config.cpp.s"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/aesm_config.cpp -o CMakeFiles/utils.dir/aesm_config.cpp.s

utils/CMakeFiles/utils.dir/aesm_long_lived_thread.cpp.o: utils/CMakeFiles/utils.dir/flags.make
utils/CMakeFiles/utils.dir/aesm_long_lived_thread.cpp.o: ../utils/aesm_long_lived_thread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object utils/CMakeFiles/utils.dir/aesm_long_lived_thread.cpp.o"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/utils.dir/aesm_long_lived_thread.cpp.o -c /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/aesm_long_lived_thread.cpp

utils/CMakeFiles/utils.dir/aesm_long_lived_thread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utils.dir/aesm_long_lived_thread.cpp.i"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/aesm_long_lived_thread.cpp > CMakeFiles/utils.dir/aesm_long_lived_thread.cpp.i

utils/CMakeFiles/utils.dir/aesm_long_lived_thread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utils.dir/aesm_long_lived_thread.cpp.s"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/aesm_long_lived_thread.cpp -o CMakeFiles/utils.dir/aesm_long_lived_thread.cpp.s

utils/CMakeFiles/utils.dir/aesm_rand.cpp.o: utils/CMakeFiles/utils.dir/flags.make
utils/CMakeFiles/utils.dir/aesm_rand.cpp.o: ../utils/aesm_rand.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object utils/CMakeFiles/utils.dir/aesm_rand.cpp.o"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/utils.dir/aesm_rand.cpp.o -c /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/aesm_rand.cpp

utils/CMakeFiles/utils.dir/aesm_rand.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utils.dir/aesm_rand.cpp.i"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/aesm_rand.cpp > CMakeFiles/utils.dir/aesm_rand.cpp.i

utils/CMakeFiles/utils.dir/aesm_rand.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utils.dir/aesm_rand.cpp.s"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/aesm_rand.cpp -o CMakeFiles/utils.dir/aesm_rand.cpp.s

utils/CMakeFiles/utils.dir/crypto_aes_gcm.cpp.o: utils/CMakeFiles/utils.dir/flags.make
utils/CMakeFiles/utils.dir/crypto_aes_gcm.cpp.o: ../utils/crypto_aes_gcm.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object utils/CMakeFiles/utils.dir/crypto_aes_gcm.cpp.o"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/utils.dir/crypto_aes_gcm.cpp.o -c /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/crypto_aes_gcm.cpp

utils/CMakeFiles/utils.dir/crypto_aes_gcm.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utils.dir/crypto_aes_gcm.cpp.i"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/crypto_aes_gcm.cpp > CMakeFiles/utils.dir/crypto_aes_gcm.cpp.i

utils/CMakeFiles/utils.dir/crypto_aes_gcm.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utils.dir/crypto_aes_gcm.cpp.s"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/crypto_aes_gcm.cpp -o CMakeFiles/utils.dir/crypto_aes_gcm.cpp.s

utils/CMakeFiles/utils.dir/crypto_cmac128.cpp.o: utils/CMakeFiles/utils.dir/flags.make
utils/CMakeFiles/utils.dir/crypto_cmac128.cpp.o: ../utils/crypto_cmac128.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object utils/CMakeFiles/utils.dir/crypto_cmac128.cpp.o"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/utils.dir/crypto_cmac128.cpp.o -c /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/crypto_cmac128.cpp

utils/CMakeFiles/utils.dir/crypto_cmac128.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utils.dir/crypto_cmac128.cpp.i"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/crypto_cmac128.cpp > CMakeFiles/utils.dir/crypto_cmac128.cpp.i

utils/CMakeFiles/utils.dir/crypto_cmac128.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utils.dir/crypto_cmac128.cpp.s"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/crypto_cmac128.cpp -o CMakeFiles/utils.dir/crypto_cmac128.cpp.s

utils/CMakeFiles/utils.dir/crypto_ecc.cpp.o: utils/CMakeFiles/utils.dir/flags.make
utils/CMakeFiles/utils.dir/crypto_ecc.cpp.o: ../utils/crypto_ecc.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object utils/CMakeFiles/utils.dir/crypto_ecc.cpp.o"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/utils.dir/crypto_ecc.cpp.o -c /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/crypto_ecc.cpp

utils/CMakeFiles/utils.dir/crypto_ecc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utils.dir/crypto_ecc.cpp.i"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/crypto_ecc.cpp > CMakeFiles/utils.dir/crypto_ecc.cpp.i

utils/CMakeFiles/utils.dir/crypto_ecc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utils.dir/crypto_ecc.cpp.s"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/crypto_ecc.cpp -o CMakeFiles/utils.dir/crypto_ecc.cpp.s

utils/CMakeFiles/utils.dir/crypto_rsa.cpp.o: utils/CMakeFiles/utils.dir/flags.make
utils/CMakeFiles/utils.dir/crypto_rsa.cpp.o: ../utils/crypto_rsa.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object utils/CMakeFiles/utils.dir/crypto_rsa.cpp.o"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/utils.dir/crypto_rsa.cpp.o -c /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/crypto_rsa.cpp

utils/CMakeFiles/utils.dir/crypto_rsa.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utils.dir/crypto_rsa.cpp.i"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/crypto_rsa.cpp > CMakeFiles/utils.dir/crypto_rsa.cpp.i

utils/CMakeFiles/utils.dir/crypto_rsa.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utils.dir/crypto_rsa.cpp.s"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/crypto_rsa.cpp -o CMakeFiles/utils.dir/crypto_rsa.cpp.s

utils/CMakeFiles/utils.dir/crypto_sha256_msg.cpp.o: utils/CMakeFiles/utils.dir/flags.make
utils/CMakeFiles/utils.dir/crypto_sha256_msg.cpp.o: ../utils/crypto_sha256_msg.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object utils/CMakeFiles/utils.dir/crypto_sha256_msg.cpp.o"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/utils.dir/crypto_sha256_msg.cpp.o -c /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/crypto_sha256_msg.cpp

utils/CMakeFiles/utils.dir/crypto_sha256_msg.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utils.dir/crypto_sha256_msg.cpp.i"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/crypto_sha256_msg.cpp > CMakeFiles/utils.dir/crypto_sha256_msg.cpp.i

utils/CMakeFiles/utils.dir/crypto_sha256_msg.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utils.dir/crypto_sha256_msg.cpp.s"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/crypto_sha256_msg.cpp -o CMakeFiles/utils.dir/crypto_sha256_msg.cpp.s

utils/CMakeFiles/utils.dir/ssl_compat_wrapper.cpp.o: utils/CMakeFiles/utils.dir/flags.make
utils/CMakeFiles/utils.dir/ssl_compat_wrapper.cpp.o: ../utils/ssl_compat_wrapper.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object utils/CMakeFiles/utils.dir/ssl_compat_wrapper.cpp.o"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/utils.dir/ssl_compat_wrapper.cpp.o -c /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/ssl_compat_wrapper.cpp

utils/CMakeFiles/utils.dir/ssl_compat_wrapper.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utils.dir/ssl_compat_wrapper.cpp.i"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/ssl_compat_wrapper.cpp > CMakeFiles/utils.dir/ssl_compat_wrapper.cpp.i

utils/CMakeFiles/utils.dir/ssl_compat_wrapper.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utils.dir/ssl_compat_wrapper.cpp.s"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/ssl_compat_wrapper.cpp -o CMakeFiles/utils.dir/ssl_compat_wrapper.cpp.s

utils/CMakeFiles/utils.dir/type_length_value.cpp.o: utils/CMakeFiles/utils.dir/flags.make
utils/CMakeFiles/utils.dir/type_length_value.cpp.o: ../utils/type_length_value.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object utils/CMakeFiles/utils.dir/type_length_value.cpp.o"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/utils.dir/type_length_value.cpp.o -c /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/type_length_value.cpp

utils/CMakeFiles/utils.dir/type_length_value.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utils.dir/type_length_value.cpp.i"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/type_length_value.cpp > CMakeFiles/utils.dir/type_length_value.cpp.i

utils/CMakeFiles/utils.dir/type_length_value.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utils.dir/type_length_value.cpp.s"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils/type_length_value.cpp -o CMakeFiles/utils.dir/type_length_value.cpp.s

utils/CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp.o: utils/CMakeFiles/utils.dir/flags.make
utils/CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp.o: /root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object utils/CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp.o"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp.o -c /root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp

utils/CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp.i"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp > CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp.i

utils/CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp.s"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp -o CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp.s

utils/CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp.o: utils/CMakeFiles/utils.dir/flags.make
utils/CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp.o: /root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object utils/CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp.o"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp.o -c /root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp

utils/CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp.i"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp > CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp.i

utils/CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp.s"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp -o CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp.s

# Object files for target utils
utils_OBJECTS = \
"CMakeFiles/utils.dir/aesm_config.cpp.o" \
"CMakeFiles/utils.dir/aesm_long_lived_thread.cpp.o" \
"CMakeFiles/utils.dir/aesm_rand.cpp.o" \
"CMakeFiles/utils.dir/crypto_aes_gcm.cpp.o" \
"CMakeFiles/utils.dir/crypto_cmac128.cpp.o" \
"CMakeFiles/utils.dir/crypto_ecc.cpp.o" \
"CMakeFiles/utils.dir/crypto_rsa.cpp.o" \
"CMakeFiles/utils.dir/crypto_sha256_msg.cpp.o" \
"CMakeFiles/utils.dir/ssl_compat_wrapper.cpp.o" \
"CMakeFiles/utils.dir/type_length_value.cpp.o" \
"CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp.o" \
"CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp.o"

# External object files for target utils
utils_EXTERNAL_OBJECTS =

bin/libutils.so: utils/CMakeFiles/utils.dir/aesm_config.cpp.o
bin/libutils.so: utils/CMakeFiles/utils.dir/aesm_long_lived_thread.cpp.o
bin/libutils.so: utils/CMakeFiles/utils.dir/aesm_rand.cpp.o
bin/libutils.so: utils/CMakeFiles/utils.dir/crypto_aes_gcm.cpp.o
bin/libutils.so: utils/CMakeFiles/utils.dir/crypto_cmac128.cpp.o
bin/libutils.so: utils/CMakeFiles/utils.dir/crypto_ecc.cpp.o
bin/libutils.so: utils/CMakeFiles/utils.dir/crypto_rsa.cpp.o
bin/libutils.so: utils/CMakeFiles/utils.dir/crypto_sha256_msg.cpp.o
bin/libutils.so: utils/CMakeFiles/utils.dir/ssl_compat_wrapper.cpp.o
bin/libutils.so: utils/CMakeFiles/utils.dir/type_length_value.cpp.o
bin/libutils.so: utils/CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_read_rand.cpp.o
bin/libutils.so: utils/CMakeFiles/utils.dir/root/SGXENV/linux-sgx/common/src/sgx_memset_s.cpp.o
bin/libutils.so: utils/CMakeFiles/utils.dir/build.make
bin/libutils.so: /usr/lib/x86_64-linux-gnu/libssl.so
bin/libutils.so: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/libutils.so: bin/liboal.so
bin/libutils.so: ../../../../../external/rdrand/src/librdrand.a
bin/libutils.so: utils/CMakeFiles/utils.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Linking CXX shared library ../bin/libutils.so"
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/utils.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
utils/CMakeFiles/utils.dir/build: bin/libutils.so

.PHONY : utils/CMakeFiles/utils.dir/build

utils/CMakeFiles/utils.dir/clean:
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils && $(CMAKE_COMMAND) -P CMakeFiles/utils.dir/cmake_clean.cmake
.PHONY : utils/CMakeFiles/utils.dir/clean

utils/CMakeFiles/utils.dir/depend:
	cd /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/SGXENV/linux-sgx/psw/ae/aesm_service/source /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/utils /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils /root/SGXENV/linux-sgx/psw/ae/aesm_service/source/build/utils/CMakeFiles/utils.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : utils/CMakeFiles/utils.dir/depend
