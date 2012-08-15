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
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

project(${PROJECT_NAME} C CXX ASM)

if(DEFINED SELF_MACOSX_XCODEPROJECTNAME)
else()
  set(SELF_MACOSX_XCODEPROJECTNAME ${PROJECT_NAME})
endif()

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

list(APPEND SRC ${SRC_src} ${SRC_glue})

# get platform-dependent configuratio
# sets 
#   $GUI_TYPE 
#   $EXTRA_LIBRARIES 
#   $COMPILER
#   $TARGET_OS_VERSION $TARGET_OS_FAMILY
include(${platform})

# set up the self-specific include-directories
include_directories_from_src(SRC)


# setup general definitions. 
include(setup)

## setup assemby support
#
setup_assembler_support(SRC)

# setup configuration-specific (release/debug) stuff
include(configurations)

# specify the libs we depend on
# sets ${3RD_PARTY_LIBS}
include(dependencies)

# 
# generate dependent include files.
# sets ${SELF_PREFIX_HEADER}
#
get_directory_property(le_dirs INCLUDE_DIRECTORIES)

include(makeDeps)

# we need a vmDate thing.
# sets $SRC_VMDATE
include(setupVmDate)
list(APPEND SRC ${SRC_VMDATE})

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
# we _know_ we have to deal with assembler.
setup_target_assembler_support(${PROJECT_NAME})


configure_end()
