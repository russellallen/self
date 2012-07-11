#!/usr/bin/env cmake
#
# setup all necessary build definition variables
#
list(APPEND _defines
  -DXLIB 
  -DFAST_COMPILER 
  -DSIC_COMPILER
  -DNATIVE_ARCH=${platform_processor}
  ${DYNAMIC}
)

add_definitions_if_cmakevar( 
  COMPILER
  TARGET_OS_VERSION
  TARGET_OS_FAMILY
  TARGET_ARCH
  HOST_ARCH
)


#
# setup all necessary build flags
#
list(APPEND _flags
  -fno-threadsafe-statics
  -fvisibility=default
  -fkeep-inline-functions
  -fno-exceptions
  -fno-stack-protector
)

if(SELF_COVERAGE)
  list(APPEND _flags --coverage)
endif()

if(SELF_PROFILE)
  list(APPEND _flags -pg)
endif()

#
# setup all warning flags
#
list(APPEND _flags
  -Wabi 
  -Wreorder 
  -Wreturn-type 
  -Wswitch 
  -Wcomment 
  -Wformat 
  -Wpointer-arith 
  -Woverloaded-virtual 
  -Wno-write-strings
  -Wparentheses
)

