#!/usr/bin/env cmake
if(NOT APPLE)
    message(FATAL_ERROR "This is only for Mac OS X")
endif(NOT APPLE)

execute_process(COMMAND xcodebuild -version
  RESULT_VARIABLE _xcodebuild_failed OUTPUT_VARIABLE XCODE_OUT ERROR_VARIABLE _) 
if(NOT _xcodebuild_failed 
  AND ((XCODE_OUT MATCHES "Xcode 3")
  AND (clang)))
    message("WARNING:  Self on Xcode 3 does not work with Clang. 
         It simply lacks C++ support.")
endif()



# TODO: these are frome the project file, reconsider
set(DYNAMIC           "-DDYNLINK_SUPPORTED")
set(COMPILER          "GCC_COMPILER")
set(ASSEMBLER         "")
set(MANUFACTURER      "")
# still implicit in config.hh
#set(TARGET_OS_VERSION "MACOSX_VERSION")
#set(TARGET_OS_FAMILY  "UNIX_FAMILY")
#set(TARGET_ARCH       "I386_ARCH")
#set(HOST_ARCH         "I386_ARCH")
mark_as_advanced(DYNAMIC COMPILER ASSEMBLER MANUFACTURER TARGET_OS_VERSION TARGET_OS_FAMILY)

set(SELF_OSX_INFO_PLIST Info)


option(SELF_OSX_COCOA
  "EXPERIMENTAL: Build with the Cocoa console" OFF)
if(SELF_OSX_COCOA)
  add_definitions(-DCOCOA_EXP)
  set(SELF_OSX_INFO_PLIST InfoCocoa)
endif()



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
set(SRC ${SRC} ${OSX_ICON_FILES})



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

set(EXTRA_LIBRARIES ${EXTRA_LIBRARIES} ${frameworks})


#
# Mac compile definitons, independent of  generator
#
add_definitions(
  -DQUARTZ_LIB
  # there was -DMACTOOLBOX_LIB , but seems unused.
  -DDEBUG # ?? this is straight from mac_osx.make
  -DGCC3=1 #lets see if we can live withiout it
  -DGLUE_CHECKSUM=0
)

set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -arch ${platform_processor}")


#
# "API". Set up target specific stuff.
#
macro(setup_target target)
  # "super"
  setup_target_common(${target})
  
  if(CMAKE_GENERATOR MATCHES Xcode)
    # we want to reuse the GCC_OPTIMIZATION_LEVEL
    add_definitions(-DGCC_OPTIMIZATION_LEVEL=\${GCC_OPTIMIZATION_LEVEL})
        
    # Select Xcode compiler based on user choice
    if (clang)
      set(CMAKE_XCODE_ATTRIBUTE_GCC_VERSION "com.apple.compilers.llvm.clang.1_0")
      message(STATUS "Using Clang for Xcode")
    else()
      set(CMAKE_XCODE_ATTRIBUTE_GCC_VERSION "com.apple.compilers.llvmgcc42")
      message(STATUS "Using LLVM-gcc for Xcode")
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
    
    if(SELF_COVERAGE)
      set(CMAKE_XCODE_ATTRIBUTE_GCC_GENERATE_TEST_COVERAGE_FILES "YES")
      remove_definitions(-ftest-coverage)
      set(CMAKE_XCODE_ATTRIBUTE_GCC_INSTRUMENT_PROGRAM_FLOW_ARCS "YES")
      remove_definitions(-fprofile-arcs)
    endif()
  
    set(CMAKE_XCODE_ATTRIBUTE_COPY_PHASE_STRIP "NO")
    set(CMAKE_XCODE_ATTRIBUTE_DEBUG_INFORMATION_FORMAT "dwarf-with-dsym")
    
  
  
    # cmake adds warnings hardcoded which we dont want.
    # mess with the warnings
    set_target_properties(${target} PROPERTIES XCODE_ATTRIBUTE_WARNING_CFLAGS "")
    
  else()
    # guess optimization level…
    math(EXPR GCC_OPTIMIZATION_LEVEL "${_is_optimized} * 3")
    add_definitions(-DGCC_OPTIMIZATION_LEVEL=${GCC_OPTIMIZATION_LEVEL})
    
    add_definitions(
      --sysroot ${CMAKE_OSX_SYSROOT}
      -mmacosx-version-min=${CMAKE_OSX_DEPLOYMENT_TARGET}
    )
    
    foreach(_flags 
      CMAKE_EXE_LINKER_FLAGS
      CMAKE_EXE_LINKER_FLAGS_DEBUG
      CMAKE_EXE_LINKER_FLAGS_RELEASE
      CMAKE_EXE_LINKER_FLAGS_MINSIZEREL
      CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO
    )
      set(${_flags} "${${_flags}} -isysroot ${CMAKE_OSX_SYSROOT} -mmacosx-version-min=${CMAKE_OSX_DEPLOYMENT_TARGET}")
    endforeach()

  endif()
  
  # configure CMake to use a custom Info.plist
  set_target_properties(${target} PROPERTIES 
    MACOSX_BUNDLE_INFO_PLIST ${SELF_BUILD_SUPPORT_DIR}/${platform}/${SELF_OSX_INFO_PLIST}.plist)
  foreach(_nib ${SELF_MACOSX_NIBS})
    set_source_files_properties(${_nib} PROPERTIES MACOSX_PACKAGE_LOCATION Resources)      
  endforeach()
endmacro()





# TODO: this is potenitally dangerous
set(_prefixFile "${SELF_GENERATED_INLCUDE_FILES_DIR}/_precompiled.hh")

macro(include_prefix_header target)
  get_filename_component(_fullPrefixFile ${_prefixFile} ABSOLUTE)
  if(CMAKE_GENERATOR MATCHES Xcode)
    set_target_properties(${target} PROPERTIES XCODE_ATTRIBUTE_GCC_PRECOMPILE_PREFIX_HEADER "YES")
    set_target_properties(${target} PROPERTIES XCODE_ATTRIBUTE_GCC_PREFIX_HEADER "${_fullPrefixFile}")
  else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -include ${_fullPrefixFile} -Winvalid-pch")
  endif()
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
