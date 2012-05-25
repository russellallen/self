#!/usr/bin/env cmake
set(PROJECT_NAME Self)


# Older versions have a different signature for CMAKE_MINIMUM_REQUIRED,
# check it manually just to make sure
if(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} LESS 2.4)
    message(FATAL_ERROR "${PROJECT_NAME} requires at least CMake v2.4."
        " You are running v${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}."
        " Please upgrade." )
endif(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} LESS 2.4)

# If we get this far, use the modern signature.  This will also cause newer
# CMake versions to try to be backwards-compatible with the desired version
cmake_minimum_required(VERSION 2.8 FATAL_ERROR)


project(${PROJECT_NAME})

#force Clang
if (NOT CMAKE_CXX_COMPILER MATCHES ".*clang")
  
  message(FATAL_ERROR "   
    Please make sure to use Clang. Eg, run cmake as
    
    cmake -DCMAKE_TOOLCHAIN_FILE=$SELF_DIR/vm/cmake/Clang.cmake ...
    
    or better
    
    CXX=$(which clang++) CC=$(which clang) cmake ..
    
    Please remove CMakeCache.txt beforehand.
  ")
endif (NOT CMAKE_CXX_COMPILER MATCHES ".*clang")

set(LOCAL_CMAKE_FILES "cmake")
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/${LOCAL_CMAKE_FILES}" )

include("${LOCAL_CMAKE_FILES}/platform.cmake")
include("${LOCAL_CMAKE_FILES}/common.cmake")
include("${LOCAL_CMAKE_FILES}/dependencies.cmake")



add_subdirectory(src)

include("${LOCAL_CMAKE_FILES}/${platform}.cmake")

include_directories_from_src(SRC)

include("${LOCAL_CMAKE_FILES}/setup.cmake")

add_executable(${PROJECT_NAME} ${GUI_TYPE} ${SRC})

include("${LOCAL_CMAKE_FILES}/configurations.cmake")

include_prefix_header(${PROJECT_NAME})

target_link_libraries(${PROJECT_NAME} ${EXTRA_LIBRARIES} ${3RD_PARTY_LIBS})

setup_target(${PROJECT_NAME})