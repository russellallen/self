#!/usr/bin/env cmake

#force Clang
if (NOT CMAKE_CXX_COMPILER MATCHES ".*clang.*")
  
  message(FATAL_ERROR "   
    Please make sure to use Clang. Eg, run cmake as
    
    cmake -DCMAKE_TOOLCHAIN_FILE=$SELF_DIR/vm/cmake/Clang.cmake ...
    
    or better
    
    CXX=$(which clang++) CC=$(which clang) cmake ..
    
    Please remove CMakeCache.txt beforehand.
  ")
endif (NOT CMAKE_CXX_COMPILER MATCHES ".*clang")
