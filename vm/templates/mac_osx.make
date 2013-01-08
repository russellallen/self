# Sun-$Revision: 30.11 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.

# Makefile template for compiling on MAC OSX

TARGET_OS_VERSION       = MACOSX_VERSION
# another name for the same thing
VM_SUBDIR          = mac_osx
TARGET_ARCH = I386_ARCH
HOST_ARCH = $(TARGET_ARCH)


AS     = as
GCC    = gcc

SRC_DIRS = $(shell cd ${ROOT}/vm/src; ${MAKE} TARGET_COMPILER=gcc TARGET_ARCH=i386 srcDirList)
# include . for the precompiled header file
SRC_PATH = . \
           ${ROOT}/vm/${VM_SUBDIR}/generated/incls \
	   $(SRC_DIRS:%=${ROOT}/vm/src/%)

#ASM_FILTER    =  | sed 's;//.*;;'
ASM_FILTER    = | removeUnderscore | sed 's;//.*;;'
GLUE_LD_FLAGS = -G
VPATH        += $(SRC_PATH:%=%:)
CPP           = gcc -E

XLIBLIBDIRS = -L/usr/X11R6/lib
XLIBLIBS = -lX11 -lXext
CLIBS = 

# link termcap and ucb statically to avoid having to mess with LD_LIBRARY_PATH
OS_GLUE_LIBS =

# precomp headers for OS X
%.hh.gch: %.hh
	@lock_run _$@.lock " \
		echo Precompiling header $< to $@; \
		${COMPILE.gnu.precomp}  $< -o $@; \
	"

CONFIGDEFS = \
             ${DYNAMIC} -DXLIB -DQUARTZ_LIB -DFAST_COMPILER \
	           -DDEBUG \
             -DCOMPILER=${COMPILER} -DASSEMBLER=${ASSEMBLER} \
             -DMANUFACTURER=${MANUFACTURER}
# -DUSE_TWO_UNDERSCORES

GNUFLAGS +=  -m32 -fno-exceptions -ffriend-injection -Winvalid-pch -fno-stack-protector

INCLUDES += -I/usr/X11R6/include

COMPILE.gnu.precomp  = ${COMPILE.gnu} ${GNUFLAGS} ${CPPFLAGS}  ${CFLAGS} -precomp

# needed for OS X
LOCALLIBS += -lcurses -framework CoreServices -framework Carbon

