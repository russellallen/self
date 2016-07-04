#!/bin/sh

# Assumes already built Self.app in artifacts/

# Copy Controller code
mkdir -p ../build
cp -r ../controller/osx/* ../build

# Copy in newly built VM
mkdir -p ../build/VM
cp -r artifacts/Self.app ../build/VM

# Move to dir and build
cd ../build
xcodebuild 

# Copy artifact
cp -r build/Release/Self\ Control.app ../release/artifacts

# Cleanup
cd ../release
rm -r ../build



