#!/bin/bash

# BUILD

# SET PATH TO VM

if [[ `uname` == 'Linux' ]]; then
    echo 
    echo WE ARE AT:
    echo PWD = $PWD

    echo
    echo UPDATE AND INSTALL
    apt-get update -y -qq
    apt-get install -y git cmake libc6-dev g++ xorg-dev libncurses5-dev -qq

    echo 
    echo SUCCESS?
    which git
    which cmake
    which gcc
    which g++

    echo
    echo MOVE TO SELF DIR
    cd /opt/self
    git describe --tags --dirty
fi

echo
echo STARTING BUILD
mkdir -p build
cd build
cmake ..
cmake --build .
