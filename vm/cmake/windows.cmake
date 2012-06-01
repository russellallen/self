#!/usr/bin/env cmake

if(NOT WIN32)
    message(FATAL "This is only for Windoes")
endif()


# This option is to enable the /MP switch for Visual Studio 2005 and above compilers
OPTION(WIN32_USE_MP "Set to ON to build with the /MP option (Visual Studio 2005 and above)." ON)
if(WIN32_USE_MP)
   SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP")
endif(WIN32_USE_MP)
 
# omit anoying warnings in VS
if(MSVC)
    add_definitions(/D_CRT_SECURE_NO_WARNINGS)
endif(MSVC)

# output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

