#!/bin/bash 
 
WORKDIR="$(pwd)" 
# branch="SoraYumeKernel" 
CLANG_PATH="/home/qianxiao/work/clang-r547379/bin"
export KBUILD_BUILD_HOST=$(hostname)
export KBUILD_BUILD_USER=$(whoami)
export PATH="$CLANG_PATH:$PATH" 

# Base Test
# Clang Version
clang --version
sleep 1

# 生成配置文件
make ARCH=arm64 SUBARCH=arm64 CC="clang" CROSS_COMPILE="aarch64-linux-gnu-" CROSS_COMPILE_COMPAT="arm-linux-gnueabi-" LLVM=1 LLVM_IAS=1 O=out vendor/alioth_defconfig

# 设置内核版本号
LOCALVERSION="-perf-g$(git rev-parse --short=12 HEAD)"
echo "内核版本号为：$(make kernelversion)$LOCALVERSION"
sed -i "s/^CONFIG_LOCALVERSION=\".*\"/CONFIG_LOCALVERSION=\"${LOCALVERSION}\"/" out/.config

# 编译 
# make -j$(nproc --all) ARCH=arm64 LLVM=1 LLVM_IAS=1 O=out modules Image
make ARCH=arm64 SUBARCH=arm64 CC="clang" CROSS_COMPILE="aarch64-linux-gnu-" CROSS_COMPILE_COMPAT="arm-linux-gnueabi-" LLVM=1 LLVM_IAS=1 O=out -j$(nproc)