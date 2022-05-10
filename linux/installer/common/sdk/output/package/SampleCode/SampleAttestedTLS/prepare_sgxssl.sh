#!/usr/bin/env bash
#
# Copyright (C) 2011-2021 Intel Corporation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#   * Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#   * Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in
#     the documentation and/or other materials provided with the
#     distribution.
#   * Neither the name of Intel Corporation nor the names of its
#     contributors may be used to endorse or promote products derived
#     from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#

ARG1=${1:-build}
project_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "project_dir is $project_dir"
sgxssl_dir=$project_dir/sgxssl
openssl_out_dir=$sgxssl_dir/openssl_source
openssl_ver_name=openssl-1.1.1m
sgxssl_github_archive=https://github.com/01org/intel-sgx-ssl/archive
sgxssl_file_name=support_tls_lin_1.1.1m
build_script=$sgxssl_dir/Linux/build_openssl.sh
server_url_path=https://www.openssl.org/source
full_openssl_url=$server_url_path/$openssl_ver_name.tar.gz
full_openssl_url_old=$server_url_path/old/1.1.1/$openssl_ver_name.tar.gz

FileExists() {
	pushd $sgxssl_dir/Linux/
	make clean sgxssl_no_mitigation 
	echo "build sgxssl completed"
	popd
}

debug=false

if [ $debug == true ] ; then
	read -n 1 -p "download souce code only, because we need to build ourselves"
fi

openssl_chksum=f89199be8b23ca45fc7cb9f1d8d3ee67312318286ad030f5316aca6462db6c96
sgxssl_chksum=e645b5e9b0d81da4470d454b7f7d838cc310dd72427bd343bfe744c82493b39e
rm -f check_sum_openssl.txt check_sum_sgxssl.txt
if [ ! -f $build_script ]; then
    wget $sgxssl_github_archive/$sgxssl_file_name.zip -P $sgxssl_dir/ || exit 1
    sha256sum $sgxssl_dir/$sgxssl_file_name.zip > $sgxssl_dir/check_sum_sgxssl.txt
    grep $sgxssl_chksum $sgxssl_dir/check_sum_sgxssl.txt
    if [ $? -ne 0 ]; then
        echo "File $sgxssl_dir/$sgxssl_file_name.zip checksum failure"
        rm -f $sgxssl_dir/$sgxssl_file_name.zip
        exit -1
    fi
    unzip -qq $sgxssl_dir/$sgxssl_file_name.zip -d $sgxssl_dir/ || exit 1
    mv $sgxssl_dir/intel-sgx-ssl-$sgxssl_file_name/* $sgxssl_dir/ || exit 1
    rm $sgxssl_dir/$sgxssl_file_name.zip || exit 1
    rm -rf $sgxssl_dir/intel-sgx-ssl-$sgxssl_file_name || exit 1
fi

if [ ! -f $openssl_out_dir/$openssl_ver_name.tar.gz ]; then
	wget $full_openssl_url_old -P $openssl_out_dir || wget $full_openssl_url -P $openssl_out_dir || exit 1
	sha256sum $openssl_out_dir/$openssl_ver_name.tar.gz > $sgxssl_dir/check_sum_openssl.txt
	echo "downloading OPENSSL source code now..." 
	grep $openssl_chksum $sgxssl_dir/check_sum_openssl.txt
	if [ $? -ne 0 ]; then
    	echo "File $openssl_out_dir/$openssl_ver_name.tar.gz checksum failure"
        rm -f $openssl_out_dir/$openssl_ver_name.tar.gz
    	exit -1
	fi
fi


if [ "$1" = "nobuild" ]; then
	exit 0
fi

if [ $debug == false ] ; then
	echo "only when debug is turned off, can script go here"
	FileExists
	echo "endof of build sgxssl" && exit 0
fi

echo "end of script"
