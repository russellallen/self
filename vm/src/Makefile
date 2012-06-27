# Sun-$Revision: 30.9 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.

ROOT         = ../..
FILES        = Makefile includeDB Platform_mac_osx Platform_sparc
DIRECTORIES  = any ppc sparc unix

SUBSYSTEMS = asm fast_compiler interpreter lookup memory objects os parser prims

# for compilation: sources only (Unix only)

SRC_DIRS     = \
         any/asm \
         any/fast_compiler \
         any/interpreter \
         any/lookup \
         any/memory \
         any/objects \
         any/os \
         any/parser \
         any/prims \
         any/runtime \
         any/sic \
         any/zone \
         \
         unix/os   unix/prims   unix/runtime \
          \
           ${TARGET_ARCH}/asm     ${TARGET_ARCH}/fast_compiler   ${TARGET_ARCH}/lookup   ${TARGET_ARCH}/memory   \
           ${TARGET_ARCH}/prims   ${TARGET_ARCH}/runtime         ${TARGET_ARCH}/sic      ${TARGET_ARCH}/zone     \

srcDirList:
	@echo ${SRC_DIRS} 



include        ${ROOT}/templates/sources.make


