#!/usr/bin/env cmake
#
# setup all necessary build definition variables
#
add_definitions(
  -DXLIB 
  -DFAST_COMPILER 
  -DSIC_COMPILER
  -DNATIVE_ARCH=${platform_processor}
  ${DYNAMIC}
)

add_definitions_if_cmakevar( 
  COMPILER
  ASSEMBLER
  MANUFACTURER
  TARGET_OS_VERSION
  TARGET_OS_FAMILY
  TARGET_ARCH
  HOST_ARCH
)


#
# setup all necessary build flags
#
add_definitions(
  -fno-threadsafe-statics
  -fvisibility=default
  -fkeep-inline-functions
  -fno-exceptions
  -fno-stack-protector
)


#
# setup all warning flags
#
add_definitions(
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
