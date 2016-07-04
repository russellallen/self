#!/bin/sh
mkdir -p artifacts

#
# Build VM
#
mkdir -p build
cd build
cmake ../../
cmake --build .
cd ..
cp -r build/vm/Self.app artifacts/
rm -r build

#
# Build Controller
#
