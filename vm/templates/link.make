# Sun-$Revision: 30.13 $
 
# Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.

# Makefile template for compiling directories, including tools

.SUFFIXES:

SHELL = /bin/sh

GLUE_CHECKSUM  = "NaN"

LANGDEFS   = 

OSDEFS = -DTARGET_OS_VERSION=${TARGET_OS_VERSION} -DTARGET_OS_FAMILY=UNIX_FAMILY

UNDEFS = 
HOSTDEFS =   -DHOST_ARCH=${HOST_ARCH}
TARGETDEFS = -DTARGET_ARCH=${TARGET_ARCH}

# LOCALDEFS  = -DGLUE_CHECKSUM=${GLUE_CHECKSUM}

DEFS = ${SYSDEFS}  ${CONFIGDEFS} ${UNDEFS} ${OSDEFS} \
       ${HOSTDEFS} ${TARGETDEFS} ${LANGDEFS} \
       ${LOCALDEFS} 
# These generate too much output to be useful: 
# -Wcast-align -Wshadow -Wcast-qual -Winline 

# remove -fkeep-inline-functions for `production' version
# -fmemoize-lookups -fsave-memoized break gcc (2.7.2)
# removed -Wbad-function-cast for GCC3 -mabdelmalek 5/2003
GNUFLAGS += \
	   -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wformat \
	   -Wpointer-arith \
	   -Wtraditional-conversion -Woverloaded-virtual \
	   -fkeep-inline-functions -Wno-write-strings
# would like to use -Wall but this includes -Wunused which gives just too
# many errors in conjunction with ifdefs  -Urs 1/93
#
# GCC 4.3+ changes some of the warnings. To stop genuine errors being lost
# in the forest, some of the warnings are reduced - Russell 11/09

INCLUDES += $(SRC_PATH:%=-I%)

# add this to access X11 under SOLARIS -- dmu

# prim.cpp needs to include *.primMaker.hh files from here:

INCLUDES += -I${ROOT}/objects/glue


CPPFLAGS = ${DEFS} ${INCLUDES}

# don't use -O2 -- it breaks the VM...(gcc 2.3.3)  -Urs
# Still causing problems with 2.7.2  -Mario
# Don't use -finline-functions either, breaks VM (gcc 2.7.2)
GNUOPTFLAGS =  -O -fno-defer-pop 

GLUE_LIB_DIR = ../../../objects/glue/${VM_SUBDIR}
GLUE_LIBS = ${GLUE_LIB_DIR}/xlib_glue.o \
	    ${GLUE_LIB_DIR}/stat_glue.o \
	    ${GLUE_LIB_DIR}/termcap_glue.o \
	    ${GLUE_LIB_DIR}/transcendental_glue.o 

${GLUE_LIBS} : alwaysMakeGlue

alwaysMakeGlue :
	cd ${GLUE_LIB_DIR} ; ${MAKE}

# use "gcc -xc++" instead of "g++" -- the latter adds 3-5 secs for the
# wrapper script   -Urs 9.93
ifeq (${COMPILER}, GCC_COMPILER)
  COMPILE.gnu   = ${GCC} -xc++ ${GNUFLAGS} ${CPPFLAGS}
  LINK.gnu      = ${GCC} -xc++
else
  # can't figure out how to use +e1 to suppress multiple vtbls..
  COMPILE.gnu = CC -DNOASM -Dvolatile='' ${CPPFLAGS} +w +p -noex 
  LINK.gnu = CC  -norunpath 
endif

COMPILE.gnu.o	  = ${COMPILE.gnu} ${CFLAGS}    -c
COMPILE.gnu.o.nog = ${COMPILE.gnu} ${CFLAGSnog} -c
COMPILE.gnu.s	  = ${COMPILE.gnu} ${CFLAGS} -S
COMPILE.gnu.i	  = ${COMPILE.gnu} ${CFLAGS} -E

ASFLAGS =
ifeq (${COMPILER}, GCC_COMPILER)
 COMPILE1.s = ${COMPILE.gnu.i} -xc++
else
 COMPILE1.s = cpp -C ${CPPFLAGS}
endif
COMPILE2.s = ${AS} ${ASFLAGS}


LOCALLIBDIRS = 
# moved to plat-specific files:
#LOCALLIBS += -lXext

GNULIBDIRS =
GNULIBS = 

DYNLINKLIBDIRS =
DYNLINKLIBS +=

# moved to plat-specific files
#XLIBLIBS = -lX11

MATHLIBDIRS =
MATHLIBS = -lm

NETLIBDIRS =
NETLIBS +=

CLIBDIRS =

LIBDIRS = ${LOCALLIBDIRS} ${GNULIBDIRS}  ${DYNLINKLIBDIRS} \
	  ${XLIBLIBDIRS}  ${MATHLIBDIRS} ${NETLIBDIRS}  ${CLIBDIRS}

LIBS    = ${GLUE_LIBS}   ${OS_GLUE_LIBS} ${LOCALLIBS}   ${GNULIBS}     ${DYNLINKLIBS}  \
	  ${XLIBLIBS}     ${MATHLIBS}    ${NETLIBS}     ${CLIBS}  

#LINK = ${LINK.gnu} ${TARGET_ARCH} ${LDFLAGS} 

ifeq (${COMPILER}, GCC_COMPILER)
  ifeq (${TARGET_OS_VERSION},SOLARIS_VERSION)
    LDFLAGS += ${LIBDIRS} -i
    # NB: use gcc, not g++ - we avoid global initializers to get much
    # faster links 
    LD =  ${GCC} ${LDFLAGS} 	
    # PURELINKHOME=/clarity/src/purify-beta2
    # CC_PURELINK_OPTS= -B/clarity/src/purify-beta2/nld/
    # LD = PURIFYOPTIONS="-HOME=$(PURELINKHOME)" \
    #      ${GCC} ${CC_PURELINK_OPTS} ${LDFLAGS}
  else
    LDFLAGS += ${LIBDIRS} -e start -dc -dp
    # Get gcc to call ld directly
    # for Jaguar:
    LD = ${GCC} -B/usr/bin/ ${LDFLAGS}
  endif
else
  LD = CC ${LIBDIRS}
endif

LOG = /dev/null

# Patched library files
COMMON_PATCHED_OBJS += vmDate.o
ifeq (${TARGET_OS_VERSION},SOLARIS_VERSION)
# for some reason, Solaris needs lib at the end
  PATCHED_OBJS = ${COMMON_PATCHED_OBJS} /lib/libc.a
#  PATCHED_OBJS = ${COMMON_PATCHED_OBJS} sigaction.o /lib/libc.a
else
  PATCHED_OBJS = ${COMMON_PATCHED_OBJS}
endif

# Rule that links Self is in Dependencies (created by makeFileList).
# ${AOUT}: *.o
#	${LD} -o $@ *.o ${PATCHED_OBJS} ${LIBS}
#
# files: *.o

