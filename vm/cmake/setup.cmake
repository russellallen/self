#!/usr/bin/env cmake
#
# setup all necessary build definition variables
#
add_definitions(-DCOMPILER=${COMPILER} -DASSEMBLER=${ASSEMBLER})
add_definitions(-DMANUFACTURER=${MANUFACTURER})
add_definitions(-DTARGET_OS_VERSION=${TARGET_OS_VERSION})
add_definitions(-DTARGET_OS_FAMILY=${TARGET_OS_FAMILY})
add_definitions(-DNATIVE_ARCH=${platform_processor})
add_definitions(${DYNAMIC})