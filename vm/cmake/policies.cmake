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
