#!/usr/bin/env cmake

# CPU detection

if(CMAKE_SYSTEM_PROCESSOR MATCHES "^Intel" OR
   CMAKE_SYSTEM_PROCESSOR MATCHES "^i.86" OR
   CMAKE_SYSTEM_PROCESSOR MATCHES "^x86_")
  
  set(platform_processor "i386")
  set(TARGET_ARCH       "I386_ARCH")
  set(HOST_ARCH         "I386_ARCH")
  
elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "^powerpc" OR
       CMAKE_SYSTEM_PROCESSOR MATCHES "^Power" OR
       CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc")
    
  set(platform_processor "ppc")
  set(TARGET_ARCH       "PPC_ARCH")
  set(HOST_ARCH         "PPC_ARCH")

elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "^sparc")
  
  set(platform_processor "sparc")
  set(TARGET_ARCH       "SPARC_ARCH")
  set(HOST_ARCH         "SPARC_ARCH")
  
else()
  
  message(FATAL_ERROR "Processor type ${CMAKE_SYSTEM_PROCESSOR} not supported")
  
endif()


# OS detection

if(CMAKE_SYSTEM_NAME MATCHES "Darwin")
  
  set(platform_kind "unix")
# implicit   
# set(TARGET_OS_FAMILY  "UNIX_FAMILY")
  
  set(platform_name "Mac OS X")
  set(platform "mac_osx")
# implicit
# set(TARGET_OS_VERSION "MACOSX_VERSION")
  
elseif(CMAKE_SYSTEM_NAME MATCHES "Linux")
  
  set(platform_kind "unix")
  set(TARGET_OS_FAMILY  "UNIX_FAMILY")
  
  set(platform_name "Linux")
  set(platform "linux")
  set(TARGET_OS_VERSION "LINUX_VERSION")
  
elseif(CMAKE_SYSTEM_NAME MATCHES "NetBSD")

  set(platform_kind "unix")
  set(TARGET_OS_FAMILY  "UNIX_FAMILY")

  set(platform_name "NetBSD")
  set(platform "netbsd")
  set(TARGET_OS_VERSION "NETBSD_VERSION")

elseif(CMAKE_SYSTEM_NAME MATCHES "FreeBSD")

  set(platform_kind "unix")
  set(TARGET_OS_FAMILY  "UNIX_FAMILY")

  set(platform_name "FreeBSD")
  set(platform "freebsd")
  set(TARGET_OS_VERSION "FREEBSD_VERSION")

elseif(CMAKE_SYSTEM_NAME MATCHES "(Solaris|SunOS)")
  
  set(platform_kind "unix")
  set(TARGET_OS_FAMILY  "UNIX_FAMILY")
  
  set(platform_name "Solaris")  
  set(platform "svr4")
  set(TARGET_OS_VERSION "SOLARIS_VERSION")
  
else()
  
  message(FATAL_ERROR "OS type ${CMAKE_SYSTEM_NAME} not supported")
  
endif()

# Compiler detection

if(CMAKE_CXX_COMPILER_ID MATCHES ".*[Cc]lang.*")
  
  set(clang 1)
  set(COMPILER          "GCC_COMPILER")
  set(platform_compiler "gcc")

elseif(CMAKE_CXX_COMPILER_ID MATCHES ".*[Gg][Nn][Uu].*")

  set(gcc 1)
  set(COMPILER          "GCC_COMPILER")
  set(platform_compiler "gcc")

else()
  
  set(cc 1)
  set(COMPILER          "CC_COMPILER")
  # message(FATAL_ERROR "Compiler ${CMAKE_CXX_COMPILER} not supported")
  
endif()

set(DYNAMIC           "DYNLINK_SUPPORTED")
mark_as_advanced(DYNAMIC COMPILER TARGET_OS_VERSION TARGET_OS_FAMILY)


message(STATUS "Preparing for ${platform_name} on ${platform_processor}")



