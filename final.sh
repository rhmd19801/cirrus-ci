#!/bin/bash
cd ~/rom

. build/envsetup.sh
export TZ=Asia/Jakarta
export CCACHE_DIR=~/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
export BUILD_USERNAME="OhMyVenyx"
export BUILD_HOSTNAME="IDN-Labs"
export KBUILD_BUILD_USER="Rahmad Adi Pratama"
export KBUILD_BUILD_HOST="OhMyVenyx"
ccache -M 100G -F 0
ccache -o compression=true
ccache -z

$lunch
make $1 -j8

