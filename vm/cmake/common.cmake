#!/usr/bin/env cmake

# Policies, partly from osg
if(COMMAND cmake_policy)
  # Works around warnings libraries linked against that don't
  # have absolute paths (e.g. -lpthreads)
  cmake_policy(SET CMP0003 NEW)
  
  cmake_policy(SET CMP0007 NEW) #empty list handling
  
  # tell CMake to prefer CMake's own CMake modules when available
  # only available from cmake-2.8.4
  if(${CMAKE_MAJOR_VERSION} EQUAL 2 AND ${CMAKE_MINOR_VERSION} EQUAL 8 AND ${CMAKE_PATCH_VERSION} GREATER 3)
    cmake_policy(SET CMP0017 NEW)
  endif()

  # cmake-2.6.1 introduces policy cmp0008 decide how to treat full path libraries that do not appear to be valid library file names
  # quote from cvslog "Such libraries worked by accident in the VS IDE and Xcode generators in CMake 2.4 and below."
  if(${CMAKE_MAJOR_VERSION} EQUAL 2 AND ${CMAKE_MINOR_VERSION} GREATER 4 AND ${CMAKE_PATCH_VERSION} GREATER 0)
    cmake_policy(SET CMP0008 OLD)
  endif()
endif()

# MOST IMPORTANT: THE MP-SWITCH
if(WIN32)
   # This option is to enable the /MP switch for Visual Studio 2005 and above compilers
   OPTION(WIN32_USE_MP "Set to ON to build LibCGS with the /MP option (Visual Studio 2005 and above)." ON)
   if(WIN32_USE_MP)
       SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP")
   endif(WIN32_USE_MP)
endif(WIN32)
 
# omit anoying warnings in VS
if(MSVC)
    add_definitions(/D_CRT_SECURE_NO_WARNINGS)
endif(MSVC)

# output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

# standard naming scheme
set(CMAKE_DEBUG_POSTFIX "_debug")
set(CMAKE_RELWITHDEBINFO_POSTFIX "_rdebug")
set(CMAKE_MINSIZEREL_POSTFIX "_small")

# add cmake-custom directory for find_package()
get_filename_component(THIS_DIR2 "${CMAKE_CURRENT_LIST_FILE}" PATH) 
list(APPEND CMAKE_MODULE_PATH ${THIS_DIR2})


set_property(GLOBAL PROPERTY USE_FOLDERS On)

# TODO: the incls still need to be built manually.
# get around this soon!
set(INLUDE_FILES_DIR "${CMAKE_CURRENT_SOURCE_DIR}/${platform}/generated/incls")
include_directories(${INLUDE_FILES_DIR})


# TODO: the incls for glue are strage to guess.
# get around this soon!
set(GLUE_INLUDE_FILES_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../objects/glue")
include_directories(${GLUE_INLUDE_FILES_DIR})



set(EXTRA_LIBRARIES)

#
# make include dirs out of the sources list
#
function(include_directories_from_src sourcesVar)
  get_unique_dirs_from_src(${sourcesVar} include_dirs)
  include_directories(${include_dirs})
endfunction()

function(source_groups_from_src sourcesVar)
  set(sources ${${sourcesVar}})
  foreach(fileName ${sources})
    if(fileName MATCHES "\\.cp?p?$" 
    OR fileName MATCHES "\\.hh?$"
    OR fileName MATCHES "\\.s$")
      get_filename_component(path ${fileName} PATH)
      string(REPLACE "/" "\\" group "${path}")
      message("f ${fileName}    g ${group}" )
      source_group(${group} FILES fileName)
    endif()
  endforeach()
endfunction()

function(get_unique_dirs_from_src sourcesVar dirsVar)
  set(dirs)
  set(sources ${${sourcesVar}})
  foreach(fileName ${sources})
    if(fileName MATCHES "\\.cp?p?$" 
    OR fileName MATCHES "\\.hh?$"
    OR fileName MATCHES "\\.s$")
      #get_filename_component(absolutePath ${fileName} ABSOLUTE)
      #get_filename_component(absolutePath ${absolutePath} PATH)
      #set(include_dirs ${include_dirs} ${absolutePath})
      get_filename_component(path ${fileName} PATH)
      set(dirs ${dirs} ${path})
    endif()
  endforeach()
  list(REMOVE_DUPLICATES dirs)
  set(${dirsVar} ${dirs} PARENT_SCOPE)
endfunction()

macro(setup_target_common target)
  set_target_properties(${target} PROPERTIES LINKER_LANGUAGE CXX)
endmacro()



#
#
# from link.make
#  -Wnon-virtual-dtor
add_definitions(
  -Wabi -Wreorder 
  -Wreturn-type -Wswitch -Wcomment -Wformat 
  -Wpointer-arith 
  -Woverloaded-virtual 
  -fkeep-inline-functions -Wno-write-strings
  
)

