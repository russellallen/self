# Sun-$Revision: 30.9 $
 
# Copyright 1994-2006 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.

# Makefile template for compiling on the Sparc

TARGET_OS_VERSION       = SOLARIS_VERSION
# another name for the same thing
VM_SUBDIR          = svr4
TARGET_ARCH = SPARC_ARCH
HOST_ARCH = $(TARGET_ARCH)


AS     = as
GCC    = gcc

SRC_DIRS = $(shell cd ${ROOT}/vm/src; ${MAKE} TARGET_COMPILER=gcc TARGET_ARCH=sparc srcDirList)
SRC_PATH = ${ROOT}/vm/${VM_SUBDIR}/generated/incls \
	   $(SRC_DIRS:%=${ROOT}/vm/src/%)

ASM_FILTER    = | removeUnderscore | sed 's;//.*;;'
GLUE_LD_FLAGS = -G
VPATH        += $(SRC_PATH:%=%:)
CPP           = /usr/ccs/lib/cpp

XLIBLIBDIRS = -L/usr/openwin/lib
CLIBS = -lsocket -lnsl -lc 

# link termcap and ucb statically to avoid having to mess with LD_LIBRARY_PATH
OS_GLUE_LIBS = /usr/ucblib/libtermcap.a /usr/ucblib/libucb.a -lm


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
