#!/usr/bin/env sh

######################################################################
# @author      : ShunLi (2015097272@qq.com)
# @file        : compile_ccls
# @created     : 星期六 5月 11, 2024 15:28:29 CST
#
# @description :
######################################################################

CUR_DIR=$(pwd)
ccls_build_dir=$CUR_DIR/ccls_build

sudo apt update
sudo apt install -y clang llvm libclang-10-dev libncurses5

git clone --depth=1 --recursive https://github.com/MaskRay/ccls $ccls_build_dir
cd $ccls_build_dir

# Download "Pre-Built Binaries" from https://releases.llvm.org/download.html
# and unpack to /path/to/clang+llvm-xxx.
# Do not unpack to a temporary directory, as the clang resource directory is hard-coded
# into ccls at compile time!
# See https://github.com/MaskRay/ccls/wiki/FAQ#verify-the-clang-resource-directory-is-correct
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=/usr/lib/llvm-10 \
    -DLLVM_INCLUDE_DIR=/usr/lib/llvm-10/include \
    -DLLVM_BUILD_INCLUDE_DIR=/usr/include/llvm-10/
cmake --build Release

cd $CUR_DIR
