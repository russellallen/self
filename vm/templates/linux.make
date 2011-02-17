# Sun-$Revision: 30.5 $
 
# Copyright 1994-2006 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.

# Makefile template for compiling on the Sparc

TARGET_OS_VERSION       = LINUX_VERSION
# another name for the same thing
VM_SUBDIR          = linux
TARGET_ARCH = I386_ARCH
HOST_ARCH = $(TARGET_ARCH)


AS     = as
GCC    = gcc

SRC_DIRS = $(shell cd ${ROOT}/vm/src; ${MAKE} TARGET_COMPILER=gcc TARGET_ARCH=i386 srcDirList)
SRC_PATH = ${ROOT}/vm/${VM_SUBDIR}/generated/incls \
	   $(SRC_DIRS:%=${ROOT}/vm/src/%)

#ASM_FILTER    = | removeUnderscore | sed 's;//.*;;'
GLUE_LD_FLAGS = -G -m32
VPATH        += $(SRC_PATH:%=%:)
CPP           = /usr/bin/cpp

XLIBLIBDIRS = 
CLIBS = -lstdc++ -lnsl -lc
# no -lsocket


# link termcap and ucb statically to avoid having to mess with LD_LIBRARY_PATH
#OS_GLUE_LIBS = /usr/ucblib/libtermcap.a /usr/ucblib/libucb.a -lm
OS_GLUE_LIBS = -lncurses -lm -lpthread

# precomp headers for  Linux
# _precompiled.hh is in generated/incls, _precomiped.gch is in debug, optimized, etc.

PRECOMP_SRC_PATH = ${ROOT}/vm/${VM_SUBDIR}/generated/incls
PRECOMP_DST_PATH = .

%.hh.gch: %.hh
	@lock_run _$@.lock " \
		rm -f ${PRECOMP_DST_PATH}/_precompiled.hh.gch; \
		echo Precompiling header $< to $@; \
		${COMPILE.gnu.precomp}  -o ${PRECOMP_DST_PATH}/_precompiled.hh.gch ${PRECOMP_SRC_PATH}/_precompiled.hh; \
#		echo '# warning Not using precompiled header' >> ${PRECOMP_SRC_PATH}/_precompiled.hh; \
#		touch ${PRECOMP_DST_PATH}/_precompiled.hh.gch; \
		echo Finished precompiling; \
	"

CONFIGDEFS = \
             ${DYNAMIC} -DXLIB -DFAST_COMPILER -DSIC_COMPILER \
	           -DDYNLINK_SUPPORTED -DDEBUG \
             -DCOMPILER=${COMPILER} -DASSEMBLER=${ASSEMBLER} \
             -DMANUFACTURER=${MANUFACTURER}

INCLUDE_PRECOMP = -include _precompiled.hh
GNUFLAGS +=  -m32 -fno-exceptions -ffriend-injection -Winvalid-pch -fno-stack-protector

INCLUDES += -I/usr/include -I/usr/include/X11 -I/usr/lib/c++/4.1

COMPILE.gnu.precomp  = ${GCC}   ${GNUFLAGS} ${CPPFLAGS} ${CFLAGS}
#  ${GNUFLAGS} ${CPPFLAGS} -funit-at-a-time -maccumulate-outgoing-args -fpch-preprocess


#DYNLINKLIBS += -ldl
#NETLIBS = -lnsl
#COMMON_PATCHED_OBJS += write.o 
XLIBLIBS = -lX11
LOCALLIBS += -lXext
