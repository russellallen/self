# Sun-$Revision: 30.8 $
 
# Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.

# Makefile template for compiling on the Sparc

TARGET_OS_VERSION       = SUNOS_VERSION
# another name for the same thing
VM_SUBDIR          = sun4
TARGET_ARCH = SPARC_ARCH
HOST_ARCH = $(TARGET_ARCH)


AS     = as
GCC    = g++

SRC_DIRS = $(shell cd ${ROOT}/vm/src; ${MAKE} TARGET_COMPILER=gcc TARGET_ARCH=sparc srcDirList)
SRC_PATH = ${ROOT}/vm/${VM_SUBDIR}/generated/incls \
	   $(SRC_DIRS:%=${ROOT}/vm/src/%)

VPATH += $(SRC_PATH:%=%:)
CPP    = /usr/lib/cpp
ASM_FILTER    = | sed 's;//.*;;'

XLIBLIBDIRS = -L/usr/openwin/lib
CLIBS = -lc

OS_GLUE_LIBS = -ltermcap -lm


CONFIGDEFS = \
             ${DYNAMIC} -DXLIB -DFAST_COMPILER -DSIC_COMPILER \
	           -DDYNLINK_SUPPORTED -DDEBUG \
             -DCOMPILER=${COMPILER} -DASSEMBLER=${ASSEMBLER} \
             -DMANUFACTURER=${MANUFACTURER}

GNUFLAGS += -msupersparc

INCLUDES += -I/usr/openwin/include

DYNLINKLIBS += -ldl
NETLIBS = -lnsl
COMMON_PATCHED_OBJS += write.o 
XLIBLIBS = -lX11
LOCALLIBS += -lXext
