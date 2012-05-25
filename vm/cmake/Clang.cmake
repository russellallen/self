#!/usr/bin/env cmake


# Force the compilers to Clang
# include(CMakeForceCompiler)
# cmake_force_c_compiler(clang Clang)
# cmake_force_cxx_compiler(clang++ Clang++)

set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)

set(CMAKE_CXX_FLAGS_DEBUG_INIT          "-g")
set(CMAKE_CXX_FLAGS_MINSIZEREL_INIT     "-Os -DNDEBUG")
set(CMAKE_CXX_FLAGS_RELEASE_INIT        "-O4 -DNDEBUG")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "-O2 -g")

set(CMAKE_C_FLAGS_DEBUG_INIT            "-g")
set(CMAKE_C_FLAGS_MINSIZEREL_INIT       "-Os -DNDEBUG")
set(CMAKE_C_FLAGS_RELEASE_INIT          "-O4 -DNDEBUG")
set(CMAKE_C_FLAGS_RELWITHDEBINFO_INIT   "-O2 -g")
