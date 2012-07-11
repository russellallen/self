#!/usr/bin/env cmake


message(FATAL_ERROR "Solaris/SRV4 is to be done.")

__END__
##########################################################################################
#
# To be converted to cmake.
#


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


# found in link.make
# Patched library files
COMMON_PATCHED_OBJS += vmDate.o
ifeq (${TARGET_OS_VERSION},SOLARIS_VERSION)
# for some reason, Solaris needs lib at the end
  PATCHED_OBJS = ${COMMON_PATCHED_OBJS} /lib/libc.a
#  PATCHED_OBJS = ${COMMON_PATCHED_OBJS} sigaction.o /lib/libc.a
else
  PATCHED_OBJS = ${COMMON_PATCHED_OBJS}
endif

# found in profiled.make
ifeq (${TARGET_OS_VERSION},SOLARIS_VERSION)
  LDFLAGS += -pg ${LIBDIRS} # -L/usr/openwin/lib/libp -L/usr/lib/libp 
   # Sun libs refce _mcount which isn't in the gcc lib
else
  DYNLINKLIBS =	# no dynamic linking with profiled/statically-linked version
  UNDEFS = -UDYNLINK_SUPPORTED
  MATHLIBS = -lm_p
  LDFLAGS += -pg -Xlinker -N ${LIBDIRS}  # -N implies -Bstatic
  # The -Bstatic is necessary because of a bug in SUNOS
  #     (see email from hgs, 9/18/91).
endif





##########################################################################################
# svr4_write.
# is this necessary?

write.o: /usr/lib/libc.a
ifeq (${HOST_ARCH},${TARGET_ARCH})
	@lock_run _$@.lock " \
		echo Making write.o; \
		ar x /usr/lib/libc.a write.o; \
		${OBJ_PATCH} ${OSDEFS} write.o      _write      _WRITE; \
		${OBJ_PATCH} ${OSDEFS} write.o _libc_write _LIBC_WRITE; \
	"
endif


##########################################################################################
#### HISTORIC: this is from sun4.make
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

##### this is from sun4_write.make

# Creating patched write

write.o: /usr/lib/libc.a
	@lock_run _$@.lock " \
		echo Making write.o; \
		ar x /usr/lib/libc.a write.o; \
		${OBJ_PATCH} ${OSDEFS} write.o write WRITE; \
	"

