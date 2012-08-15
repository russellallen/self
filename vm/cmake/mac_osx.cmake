#!/usr/bin/env cmake
if(NOT APPLE)
    message(FATAL_ERROR "This is only for Mac OS X")
endif(NOT APPLE)

if((CMAKE_GENERATOR MATCHES Xcode) AND ((XCODE_VERSION VERSION_LESS "4") AND (clang)))
    message("WARNING:  Self on Xcode 3 does not work with Clang. 
         It simply lacks C++ support.")
endif()


set(SELF_OSX_INFO_PLIST Info)

# do not use X11 on OSX by default.
set(SELF_X11_INIT OFF)
option(SELF_QUARTZ    "Select whether to build Self with Quartz Platform windows" ON)
option(SELF_OSX_COCOA "EXPERIMENTAL: Build with the Cocoa console" OFF)
if(SELF_OSX_COCOA)
  list(APPEND _defines -DCOCOA_EXP)
  set(SELF_OSX_INFO_PLIST InfoCocoa)
endif()

set(SELF_PREFIX_PREFIX_THRESHOLD_INIT
  "20" # DO NOT SET ABVOE 20. Breaks X-includes!
)


set(GUI_TYPE MACOSX_BUNDLE)

#
# Things we only check once.
#
if(NOT CONFIG_HAS_BEEN_RUN_BEFORE)
  # no x86_64 atm, 
  # so forcibilly overwrite
  set(CMAKE_OSX_ARCHITECTURES i386 CACHE STRING
     "Build architectures for OSX"
    FORCE)
  # we need to be 10.6 compliant.
  # so forcibilly overwrite
  set(CMAKE_OSX_DEPLOYMENT_TARGET "10.6" CACHE STRING
    "Minimum OS X version to target for deployment (at runtime); newer APIs weak linked. Set to empty string for default value."
    FORCE)
endif()

year(YEAR)

set(MACOSX_BUNDLE_GUI_IDENTIFIER
  "org.selflanguage.${PROJECT_NAME}")
set(MACOSX_BUNDLE_BUNDLE_NAME 
  "${PROJECT_NAME}")
set(MACOSX_BUNDLE_SHORT_VERSION_STRING 
  "${SELF_VERSION_MAJOR}.${SELF_VERSION_MINOR}.${SELF_VERSION_SNAPSHOT}")
set(MACOSX_BUNDLE_BUNDLE_VERSION 
  "${SELF_BUILD}")
set(MACOSX_BUNDLE_LONG_VERSION_STRING 
  "${PROJECT_NAME} ${SELF_VERSION_MAJOR}.${SELF_VERSION_MINOR}.${SELF_VERSION_SNAPSHOT} (${SELF_BUILD})")
set(MACOSX_BUNDLE_COPYRIGHT
  "© ${YEAR} Self Authors.")
set(MACOSX_BUNDLE_INFO_STRING
  "${PROJECT_NAME} ${SELF_VERSION_MAJOR}.${SELF_VERSION_MINOR}.${SELF_VERSION_SNAPSHOT}, ${MACOSX_BUNDLE_COPYRIGHT}")
set(MACOSX_BUNDLE_ICON_FILE 
  SelfIcon.icns)
set(MACOSX_DEPLOYMENT_TARGET # to be configured by Xcode
  "\${MACOSX_DEPLOYMENT_TARGET}")

set(OSX_ICON_FILES ${SELF_BUILD_SUPPORT_DIR}/${platform}/${MACOSX_BUNDLE_ICON_FILE}) 
# set where in the bundle to put the icns files
set_source_files_properties(${OSX_ICON_FILES} PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
# include the icns files in the target
list(APPEND SRC ${OSX_ICON_FILES})



macro(add_framework_to_list listVar framework)
  find_library(${framework}_LIBRARY ${framework})
  list (APPEND ${listVar} ${${framework}_LIBRARY})
  mark_as_advanced(${framework}_LIBRARY)
endmacro()

# the frameworks we need
set(frameworks)
add_framework_to_list(frameworks ApplicationServices)
add_framework_to_list(frameworks CoreServices)

if(SELF_OSX_COCOA)
  add_framework_to_list(frameworks Cocoa)
endif()

add_framework_to_list(frameworks Carbon)

list(APPEND EXTRA_LIBRARIES ${frameworks})


#
# Mac compile definitons, independent of  generator
#
list(APPEND _defines
  -DDEBUG # ?? this is straight from mac_osx.make
  -DGCC3=1 #lets see if we can live withiout it
  -DGLUE_CHECKSUM=0
)

set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -arch ${platform_processor}")


#
# Things that do not depend on a target
#
if(CMAKE_GENERATOR MATCHES Xcode)
  # Nib files.
  foreach(_nib ${SELF_MACOSX_NIBS})
    set_source_files_properties(${_nib} PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
  endforeach()
else()
  # Nib files. Xcode does it easier
  foreach(_nib ${SELF_MACOSX_NIBS})
    if(IS_DIRECTORY ${_nib})
      get_filename_component(_nib_name ${_nib} NAME)
      get_filename_component(_nib_path ${_nib} PATH)
      file(GLOB_RECURSE _nib_contents RELATIVE ${_nib} ${_nib}/*)
      foreach(_content ${_nib_contents})
        set(_nib_content_relpath ${_nib_name}/${_content})
        set(_nib_content_fullpath ${_nib_path}/${_nib_content_relpath})
        get_filename_component(_nib_content_path ${_nib_content_relpath} PATH)        
        list(APPEND SRC ${_nib_content_fullpath})
        set_source_files_properties(${_nib_content_fullpath}
          PROPERTIES MACOSX_PACKAGE_LOCATION 
          Resources/${_nib_content_path})
      endforeach()
    else()
      set_source_files_properties(${_nib} PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
    endif()
  endforeach()
  
  
  # Flags. Xcode does it already
  
  list(APPEND _flags
    --sysroot ${CMAKE_OSX_SYSROOT}
    -mmacosx-version-min=${CMAKE_OSX_DEPLOYMENT_TARGET}
  )
  
  foreach(_link_flags 
    CMAKE_EXE_LINKER_FLAGS
    CMAKE_EXE_LINKER_FLAGS_DEBUG
    CMAKE_EXE_LINKER_FLAGS_RELEASE
    CMAKE_EXE_LINKER_FLAGS_MINSIZEREL
    CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO
  )
    set(${_link_flags} "${${_link_flags}} -isysroot ${CMAKE_OSX_SYSROOT} -mmacosx-version-min=${CMAKE_OSX_DEPLOYMENT_TARGET}")
  endforeach()
endif()



#
# "API". Set up target specific stuff.
#
macro(setup_target target)
  # "super"
  setup_target_common(${target})
  
  if(CMAKE_GENERATOR MATCHES Xcode)
    # Select Xcode compiler based on user choice
    if(clang)
      set(CMAKE_XCODE_ATTRIBUTE_GCC_VERSION "com.apple.compilers.llvm.clang.1_0")
      message(STATUS "Using Clang for Xcode")
    else()
      if(CMAKE_CXX_COMPILER MATCHES ".*4[.]2.*")
        # someone specificed the non-llvm gcc.
        set(CMAKE_XCODE_ATTRIBUTE_GCC_VERSION "4.2")
        message(STATUS "Using GCC 4.2 for Xcode")
      else()
        set(CMAKE_XCODE_ATTRIBUTE_GCC_VERSION "com.apple.compilers.llvmgcc42")
        message(STATUS "Using LLVM-gcc for Xcode")
      endif()
    endif()
        
    # These are the XCode-equivalendts for the flags/warnings in setup.
    # we hence remove the respective flag, it gets added anyways at compile time
    set(CMAKE_XCODE_ATTRIBUTE_GCC_WARN_CHECK_SWITCH_STATEMENTS "YES")
    remove_definitions(-Wswitch)
    set(CMAKE_XCODE_ATTRIBUTE_GCC_WARN_ABOUT_RETURN_TYPE "YES")
    remove_definitions(-Wreturn-type)
    set(CMAKE_XCODE_ATTRIBUTE_GCC_WARN_MISSING_PARENTHESES "YES")
    remove_definitions(-Wparentheses)
    set(CMAKE_XCODE_ATTRIBUTE_GCC_WARN_TYPECHECK_CALLS_TO_PRINTF "YES")
    remove_definitions(-Wformat)
    
    set(CMAKE_XCODE_ATTRIBUTE_GCC_THREADSAFE_STATICS "NO")
    remove_definitions(-fno-threadsafe-statics)
    set(CMAKE_XCODE_ATTRIBUTE_GCC_SYMBOLS_PRIVATE_EXTERN "NO")
    remove_definitions(-fvisibility=default)
    set(CMAKE_XCODE_ATTRIBUTE_GCC_INLINES_ARE_PRIVATE_EXTERN "NO")
    remove_definitions(-fno-visibility-inlines-hidden)  
    set(CMAKE_XCODE_ATTRIBUTE_GCC_ENABLE_CPP_EXCEPTIONS "NO")
    remove_definitions(-fno-exceptions)
    # set(CMAKE_XCODE_ATTRIBUTE_GCC_ENABLE_CPP_RTTI "NO")
    # remove_definitions(-fno-rtti)
    
    if(SELF_PROFILE)
      set(CMAKE_XCODE_ATTRIBUTE_GENERATE_PROFILING_CODE "YES")
      remove_definitions(-pg)
    endif()
    
    if(SELF_COVERAGE)
      set(CMAKE_XCODE_ATTRIBUTE_GCC_GENERATE_TEST_COVERAGE_FILES "YES")
      remove_definitions(-ftest-coverage)
      set(CMAKE_XCODE_ATTRIBUTE_GCC_INSTRUMENT_PROGRAM_FLOW_ARCS "YES")
      remove_definitions(-fprofile-arcs)
    endif()
  
    set(CMAKE_XCODE_ATTRIBUTE_COPY_PHASE_STRIP "NO")
    set(CMAKE_XCODE_ATTRIBUTE_DEBUG_INFORMATION_FORMAT "dwarf")
    
    # cmake adds warnings hardcoded which we dont want.
    # mess with the warnings
    set_target_properties(${target} PROPERTIES XCODE_ATTRIBUTE_WARNING_CFLAGS "")
  endif()
  
  # configure CMake to use a custom Info.plist
  set_target_properties(${target} PROPERTIES 
    MACOSX_BUNDLE_INFO_PLIST ${SELF_BUILD_SUPPORT_DIR}/${platform}/${SELF_OSX_INFO_PLIST}.plist)
endmacro()

# API
macro(include_prefix_header target file)
  if(CMAKE_GENERATOR MATCHES Xcode)
    get_target_property(target_sources ${target} SOURCES)
    set_source_files_properties(${target_sources} PROPERTIES OBJECT_DEPENDS "${file}")
    set_target_properties(${target} PROPERTIES XCODE_ATTRIBUTE_GCC_PRECOMPILE_PREFIX_HEADER "YES")
    set_target_properties(${target} PROPERTIES XCODE_ATTRIBUTE_GCC_PREFIX_HEADER "${file}")
  else()
    include_prefix_header_common(${target} ${file})
  endif()
endmacro()
