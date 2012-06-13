#!/usr/bin/env cmake
set(PROJECT_NAME Self)


# This is for a cmake compatibility check
if(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} LESS 2.4)
    message(FATAL_ERROR "${PROJECT_NAME} requires at least CMake v2.4."
        " You are running v${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}."
        " Please upgrade." )
endif(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} LESS 2.4)
cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

project(${PROJECT_NAME} C CXX ASM)

# setup the routines and variables we might use
# sets ${platform} ${platform_processor} ${LOCAL_CMAKE_DIR}
include(common)


# sets SRC_src
add_subdirectory(src)
# for IDEs, make the source nice.
source_groups_from_src(SRC_src "${CMAKE_CURRENT_SOURCE_DIR}/src/")

# use glue-directory, but put binaries into a local dir
# sets SRC_glue
add_subdirectory(${SELF_GLUE_DIRECTORY} _glue)
source_group("glue" FILES ${SRC_glue} "${CMAKE_CURRENT_SOURCE_DIR}/src/")

set(SRC ${SRC_src} ${SRC_glue})

# get platform-dependent configuratio
# sets ${GUI_TYPE}, ${EXTRA_LIBRARIES} 
# ${COMPILER} ${ASSEMBLER} ${MANUFACTURER}
# ${TARGET_OS_VERSION} ${TARGET_OS_FAMILY}
include(${platform})

# setup general definitions. 
# this depends on the platform
include(setup)

# set up the self-specific include-directories
include_directories_from_src(SRC)

# we need a vmDate thing.
set(SRC_VMDATE ${SELF_GENERATED_INLCUDE_FILES_DIR}/vmDate.c)
set(SRC_VMDATE_IN ${SELF_BUILD_SUPPORT_DIR}/vmDate.c.in)
configure_file(
  "${LOCAL_CMAKE_DIR}/configureVmDate.cmake.in"
  "${CMAKE_BINARY_DIR}/configureVmDate.cmake" @ONLY
) 

add_custom_target(create_vmDate
    COMMAND "${CMAKE_COMMAND}" -P "${CMAKE_BINARY_DIR}/configureVmDate.cmake" 
    COMMENT "Creating ${SRC_VMDATE}"
) 

set(SRC ${SRC} ${SRC_VMDATE})
set_source_files_properties(
  ${CMAKE_SOURCE_DIR}/vm/src/any/memory/universe.cpp 
  PROPERTIES OBJECT_DEPENDS ${SRC_VMDATE}
)
set_source_files_properties(
  ${SRC_VMDATE} 
  PROPERTIES GENERATED TRUE
)


## setup assemby support
#
setup_assembler_support(SRC)


# specify the libs we depend on
# sets ${3RD_PARTY_LIBS}
include(dependencies)

## setup the acutal executable.
#
add_executable(${PROJECT_NAME} ${GUI_TYPE} ${SRC})
add_dependencies(${PROJECT_NAME} create_vmDate)


# setup configuration-specific (release/debug) stuff
# must come after add_executable
include(configurations)

# setup prefix-header for target
include_prefix_header(${PROJECT_NAME})

# setup linked libraries for target
target_link_libraries(${PROJECT_NAME} ${EXTRA_LIBRARIES} ${3RD_PARTY_LIBS})

# setup target-specific definitions
setup_target(${PROJECT_NAME})

configure_end()
