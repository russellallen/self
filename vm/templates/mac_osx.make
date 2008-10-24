# Sun-$Revision: 30.11 $
 
# Copyright 1994-2006 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.

# Makefile template for compiling on MAC OSX

TARGET_OS_VERSION       = MACOSX_VERSION
# another name for the same thing
VM_SUBDIR          = mac_osx
TARGET_ARCH = PPC_ARCH
HOST_ARCH = $(TARGET_ARCH)


AS     = as
GCC    = g++2

SRC_DIRS = $(shell cd ${ROOT}/vm/src; ${MAKE} TARGET_COMPILER=gcc TARGET_ARCH=ppc srcDirList)
# include . for the precompiled header file
SRC_PATH = . \
           ${ROOT}/vm/${VM_SUBDIR}/generated/incls \
	   $(SRC_DIRS:%=${ROOT}/vm/src/%)

#ASM_FILTER    =  | sed 's;//.*;;'
ASM_FILTER    = | removeUnderscore | sed 's;//.*;;'
GLUE_LD_FLAGS = -G
VPATH        += $(SRC_PATH:%=%:)
CPP           = /usr/bin/cpp

XLIBLIBDIRS = -L/usr/X11R6/lib
XLIBLIBS = -lX11 -lXext
CLIBS = 

# link termcap and ucb statically to avoid having to mess with LD_LIBRARY_PATH
OS_GLUE_LIBS =

# precomp headers for OS X
%.p: %.h
	@lock_run _$@.lock " \
		echo Precompiling header $< to $@; \
		${COMPILE.gnu.precomp}  $< -o $@; \
	"

CONFIGDEFS = \
             ${DYNAMIC} -DXLIB -DMACTOOLBOX_LIB -DFAST_COMPILER \
	           -DDEBUG \
             -DCOMPILER=${COMPILER} -DASSEMBLER=${ASSEMBLER} \
             -DMANUFACTURER=${MANUFACTURER}
# -DUSE_TWO_UNDERSCORES

INCLUDES += -I/usr/X11R6/include

COMPILE.gnu.precomp  = ${COMPILE.gnu} ${CFLAGS} -precomp

# needed for OS X
LOCALLIBS += -lcurses -framework CoreServices -framework Carbon

