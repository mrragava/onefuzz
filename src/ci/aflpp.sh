#!/bin/bash
#
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

set -ex

mkdir -p artifacts/third-party/aflpp-linux


sudo apt-get install -y llvm llvm-dev clang

git clone https://github.com/AFLplusplus/AFLplusplus
cd AFLplusplus
# checkout v4.02c
git checkout 3e2986dd78dbc45035b47a34eedd7dd1b9a4d0b3
make
(cd utils/libdislocator && make)
(cd utils/aflpp_driver && make); #cp utils/aflpp_driver/*.so .

cp -rf afl-* *.so *.a *.o dictionaries LICENSE ../artifacts/third-party/aflpp-linux
