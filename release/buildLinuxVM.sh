#!/bin/sh
mkdir -p artifacts

#
#   BUILD LINUX VM
#
docker run -i -v ${PWD}/..:/opt/self 32bit/ubuntu:14.04 /bin/bash -c "linux32 --32bit i386 /opt/self/vm/travis-ci-buildAndTest.sh"
cp ../build/vm/Self artifacts/Self
rm -rf ../build

