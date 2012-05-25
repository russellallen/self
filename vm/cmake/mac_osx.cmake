#!/usr/bin/env cmake
if(NOT APPLE)
    message(FATAL "This is only for Mac OS X")
endif(NOT APPLE)

set(GUI_TYPE MACOSX_BUNDLE)


set(CMAKE_OSX_ARCHITECTURES i386) #no x86_64 atm.

# TODO: these are frome the project file, reconsider
set(DYNAMIC           "-DDYNLINK_SUPPORTED")
set(COMPILER          "GCC_COMPILER")
set(ASSEMBLER         "")
set(MANUFACTURER      "")
set(TARGET_OS_VERSION "MACOSX_VERSION")
set(TARGET_OS_FAMILY  "UNIX_FAMILY")


mark_as_advanced(DYNAMIC COMPILER ASSEMBLER MANUFACTURER TARGET_OS_VERSION TARGET_OS_FAMILY)

# icon files to copy in the bundle
#set(OSX_ICON_FILES ${CMAKE_CURRENT_SOURCE_DIR}/vm_project/SelfIcon.icns ${CMAKE_CURRENT_SOURCE_DIR}/Snapshot.icns)  #tbd
set(OSX_ICON_FILES ${CMAKE_CURRENT_SOURCE_DIR}/${platform}/vm_project/SelfIcon.icns) 
# set where in the bundle to put the icns files
set_source_files_properties(${OSX_ICON_FILES} PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
# include the icns files in the target
set(SRC ${SRC} ${OSX_ICON_FILES})

# the frameworks we need
find_library(COCOA_LIBRARY Cocoa)
find_library(APP_SERVICES_LIBRARY ApplicationServices)
#find_library(CORE_GRAPHICS_LIBRARY CoreGraphics)
find_library(CORE_SERVICES_LIBRARY CoreServices)
mark_as_advanced(COCOA_LIBRARY
                 APP_SERVICES_LIBRARY
                 CORE_SERVICES_LIBRARY)
set(frameworks ${COCOA_LIBRARY} ${APP_SERVICES_LIBRARY} ${CORE_SERVICES_LIBRARY})

set(EXTRA_LIBRARIES ${frameworks})

## TBD
# configure CMake to use a custom Info.plist
# set_target_properties(${PROJECT_NAME} PROPERTIES MACOSX_BUNDLE_INFO_PLIST ${PROJECT_SOURCE_DIR}/MyInfoPlist.plist )

if(CMAKE_GENERATOR MATCHES Xcode)
  # we want to reuse the GCC_OPTIMIZATION_LEVEL
  add_definitions(-DGCC_OPTIMIZATION_LEVEL=\${GCC_OPTIMIZATION_LEVEL})
  
  option(USE_CLANG_OSX "Set ON for Xcode to use clang instead of llvm-gcc" ON)
  if(USE_CLANG_OSX)
    set(CMAKE_XCODE_ATTRIBUTE_GCC_VERSION "com.apple.compilers.llvm.clang.1_0")
    # somewhen.
    #set(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LANGUAGE_STANDARD "c++0x")
    #set(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
  else(USE_CLANG_OSX)
    set(CMAKE_XCODE_ATTRIBUTE_GCC_VERSION "com.apple.compilers.llvmgcc42")
  endif(USE_CLANG_OSX)
  
  # from the vm_project
  set(CMAKE_XCODE_ATTRIBUTE_GCC_WARN_CHECK_SWITCH_STATEMENTS "YES")
  set(CMAKE_XCODE_ATTRIBUTE_GCC_WARN_ABOUT_RETURN_TYPE "YES")
  set(CMAKE_XCODE_ATTRIBUTE_GCC_WARN_MISSING_PARENTHESES "YES")
  set(CMAKE_XCODE_ATTRIBUTE_GCC_WARN_TYPECHECK_CALLS_TO_PRINTF "YES")
  
  set(CMAKE_XCODE_ATTRIBUTE_GCC_THREADSAFE_STATICS "NO")
  #set(CMAKE_XCODE_ATTRIBUTE_GCC_SYMBOLS_PRIVATE_EXTERN "NO") ?
  set(CMAKE_XCODE_ATTRIBUTE_COPY_PHASE_STRIP "NO")
  set(CMAKE_XCODE_ATTRIBUTE_DEBUG_INFORMATION_FORMAT "dwarf-with-dsym")
  
else(CMAKE_GENERATOR MATCHES Xcode)

  # from the vm_project, converted
  add_definitions(-fno-threadsafe-statics)
  #  -fvisibility=hidden?
  add_definitions(
    -Wswitch
    -Wreturn-type
    -Wparentheses
    -Wno-format
  )
  # todo: clang
  # set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -std=c++0x -stdlib=libc++ -g -Wall")

endif(CMAKE_GENERATOR MATCHES Xcode)


macro(setup_target target)
  setup_target_common(${target})
  if(CMAKE_GENERATOR MATCHES Xcode)
    # mess with the warnings
    set_target_properties(${target} PROPERTIES XCODE_ATTRIBUTE_WARNING_CFLAGS "")
  else()
    # guess optimization level…
    math(EXPR GCC_OPTIMIZATION_LEVEL "${_is_optimized} * 3")
    add_definitions(-DGCC_OPTIMIZATION_LEVEL=${GCC_OPTIMIZATION_LEVEL})
  endif()
  
endmacro()



#
# Mac compile definitons, independent of  generator
#
add_definitions(-fno-exceptions -fno-stack-protector)
add_definitions(
  -DXLIB 
  -DFAST_COMPILER 
  -DSIC_COMPILER
  -DQUARTZ_LIB
)
# there was -DMACTOOLBOX_LIB , but seems unused.

add_definitions(-DDEBUG) # ?? this is straight from mac_osx.make
add_definitions(-DGCC3=1) #lets see if we can live withiout it
add_definitions(-DGLUE_CHECKSUM=0)




# TODO: this is potenitally dangerous
set(_prefixFile "${INLUDE_FILES_DIR}/_precompiled.hh")

macro(include_prefix_header target)
  get_filename_component(_fullPrefixFile ${_prefixFile} ABSOLUTE)
  if(CMAKE_GENERATOR MATCHES Xcode)
    set_target_properties(${target} PROPERTIES XCODE_ATTRIBUTE_GCC_PRECOMPILE_PREFIX_HEADER "YES")
    set_target_properties(${target} PROPERTIES XCODE_ATTRIBUTE_GCC_PREFIX_HEADER "${_fullPrefixFile}")
  else(CMAKE_GENERATOR MATCHES Xcode)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -include ${_fullPrefixFile} -Winvalid-pch")
  endif(CMAKE_GENERATOR MATCHES Xcode)
endmacro()



#TBD
# elseif ("${_compilerID}" MATCHES "GNU|Clang")
#     # GCC / Clang options used
#     # -x specify the source language
#     # -c compile but do not link
#     # -o place output in file
#     set (_xLanguage_C "c-header")
#     set (_xLanguage_CXX "c++-header")
#     if (_flags)
#       # append to list
#       list (APPEND _flags "-x" "${_xLanguage_${_language}}" "-c" "${_prefixFile}" -o "${_pchFile}")
#     else()
#       # return as a flag string
#       set (_flags "-x ${_xLanguage_${_language}} -c \"${_prefixFile}\" -o \"${_pchFile}\"")
#     endif()
#   else()
