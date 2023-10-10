#!/bin/bash
#
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

set -ex

mkdir -p artifacts/third-party/aflpp-linux


sudo apt-get install -y llvm llvm-dev clang

git clone https://github.com/AFLplusplus/AFLplusplus
cd AFLplusplus
# checkout v4.08c
git checkout d09950f4bb98431576b872436f0fbf773ab895db
make
(cd utils/libdislocator && make)
(cd utils/aflpp_driver && make); cp utils/aflpp_driver/*.so .

cp -rf afl-* *.so *.a *.o dictionaries LICENSE ../artifacts/third-party/aflpp-linux
