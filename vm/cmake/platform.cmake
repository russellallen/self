#!/usr/bin/env cmake

# CPU detection

if(false)
elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "^Intel" OR
       CMAKE_SYSTEM_PROCESSOR MATCHES "^i.86" OR
       CMAKE_SYSTEM_PROCESSOR MATCHES "^x86_")
    
    set(platform_processor "i386")
    
elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "^powerpc" OR
       CMAKE_SYSTEM_PROCESSOR MATCHES "^Power" OR
       CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc")
    
    set(platform_processor "ppc")
    
elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "^sparc")
    
    set(platform_processor "spac")
    
else(false)
    
    message(FATAL_ERROR "Processor type ${CMAKE_SYSTEM_PROCESSOR} not supported")
    
endif(false)


# OS detection

if(false)
elseif(CMAKE_SYSTEM_NAME MATCHES "Darwin")
    
    set(platform_name "Mac OS X")
    set(platform "mac_osx")
    
elseif(CMAKE_SYSTEM_NAME MATCHES "Linux")
    
    set(platform_name "Linux")
    set(platform "linux")
    
elseif(CMAKE_SYSTEM_NAME MATCHES "(Solaris|SunOS)")
    
    set(platform_name "Solaris")
    set(platform "svr4")
    
else(false)
    
    message(FATAL_ERROR "OS type ${CMAKE_SYSTEM_NAME} not supported")
    
endif(false)

# Compiler detection

if(CMAKE_CXX_COMPILER_ID MATCHES ".*[Cc]lang.*")
  
  set(clang 1)

elseif(CMAKE_CXX_COMPILER_ID MATCHES ".*[Gg][Nn][Uu].*")

  set(gcc 1)

else(false)
    
    message(FATAL_ERROR "Compiler ${CMAKE_CXX_COMPILER} not supported")
    
endif()


message(STATUS "Preparing for ${platform_name} on ${platform_processor}")