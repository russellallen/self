#!/usr/bin/env cmake
set(PROJECT_NAME Self)

#
#
# Prologue
#

# This is for a cmake compatibility check
# old style:
if(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} LESS 2.4)
    message(FATAL_ERROR "${PROJECT_NAME} requires at least CMake v2.8"
        " You are running v${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}."
        " Please upgrade." )
endif(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} LESS 2.4)
# new style:
if(APPLE)
  # it has to be 2.8.8 on OSX 
  cmake_minimum_required(VERSION 2.8.8 FATAL_ERROR)
  set(CMAKE_TRY_COMPILE_OSX_ARCHITECTURES i386)
else()
  cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
endif()


#
# Actual start.
#
#
#
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

project(${PROJECT_NAME} CXX ASM)

# setup the routines and variables we might use
# sets 
#  ${platform} ${platform_processor} 
#  ${LOCAL_CMAKE_DIR}
include(common)


# sets SRC_src
add_subdirectory(src)
# for IDEs, make the source nice.
source_groups_from_src(SRC_src "${CMAKE_CURRENT_SOURCE_DIR}/src/")

# use glue-directory, but put binaries into a local dir
# sets SRC_glue
add_subdirectory(${SELF_GLUE_DIRECTORY} _glue)
source_group("glue" FILES ${SRC_glue} "${CMAKE_CURRENT_SOURCE_DIR}/src/")

set(SRC ${SRC} ${SRC_src} ${SRC_glue})

# get platform-dependent configuratio
# sets 
#   $GUI_TYPE 
#   $EXTRA_LIBRARIES 
#   $COMPILER $ASSEMBLER $MANUFACTURER
#   $TARGET_OS_VERSION $TARGET_OS_FAMILY
include(${platform})

# setup general definitions. 
# this depends on the platform
include(setup)
# set up the self-specific include-directories
include_directories_from_src(SRC)


# we need a vmDate thing.
# sets $SRC_VMDATE
include(setupVmDate)
set(SRC ${SRC} ${SRC_VMDATE})


## setup assemby support
#
setup_assembler_support(SRC)


# specify the libs we depend on
# sets ${3RD_PARTY_LIBS}
include(dependencies)

# pre-compiled headers. (not for Xcode, has its own way)
if(NOT CMAKE_GENERATOR MATCHES Xcode)
  add_pch_rule(${SELF_PREFIX_HEADER} SRC)
endif()

## setup the acutal executable.
#
add_executable(${PROJECT_NAME} ${GUI_TYPE} ${SRC})
add_dependencies(${PROJECT_NAME} create_vmDate)

# setup prefix-header for target
include_prefix_header(${PROJECT_NAME} ${SELF_PREFIX_HEADER})

# setup linked libraries for target
target_link_libraries(${PROJECT_NAME} ${EXTRA_LIBRARIES} ${3RD_PARTY_LIBS})

# setup target-specific definitions
setup_target(${PROJECT_NAME})

configure_end()
