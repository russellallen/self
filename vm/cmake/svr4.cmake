#!/usr/bin/env cmake


#!/usr/bin/env cmake

# TODO: these are frome the project file, reconsider
set(DYNAMIC           "-DDYNLINK_SUPPORTED")
set(COMPILER          "GCC_COMPILER")
set(TARGET_OS_VERSION "SOLARIS_VERSION")
set(TARGET_OS_FAMILY  "UNIX_FAMILY")
set(TARGET_ARCH       "I386_ARCH")
set(HOST_ARCH         "I386_ARCH")


mark_as_advanced(DYNAMIC COMPILER TARGET_OS_VERSION TARGET_OS_FAMILY)

year(YEAR)

set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS OFF)

# Threads and sockets
enable_language(C)
find_package(Threads REQUIRED)
list(APPEND EXTRA_LIBRARIES ${CMAKE_THREAD_LIBS_INIT} socket nsl)


#
# Solaris compile definitons
#
list(APPEND _defines
  -DDEBUG
  -DGLUE_CHECKSUM=0
)

set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -m32")
list(APPEND _flags -m32)
list(APPEND CMAKE_REQUIRED_DEFINITIONS -m32)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -m32")

if(clang)
  # 
  # clang 3.0 integrated assembler on linux
  # seems not to produce 32bit jump targets 
  # for global labels, so revert back to
  # binutils as. *sigh*
  #
  set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -no-integrated-as -DNO_INTEGRATED_AS_clang")
endif()
  
#
# "API". Set up target specific stuff.
#
macro(setup_target target)
  # "super"
  setup_target_common(${target}) 
endmacro()


#
# "API". Setup prefix headers
#
macro(include_prefix_header target file)  
  # "super"
  include_prefix_header_common(${target} ${file})
endmacro()

#CLIBS = -lsocket -lnsl -lc 

# link termcap and ucb statically to avoid having to mess with LD_LIBRARY_PATH

# OS_GLUE_LIBS = /usr/ucblib/libtermcap.a /usr/ucblib/libucb.a -lm

# GNUFLAGS += -msupersparc

# NETLIBS = -lnsl
# COMMON_PATCHED_OBJS += write.o 


# found in link.make
# # Patched library files
# COMMON_PATCHED_OBJS += vmDate.o
# ifeq (${TARGET_OS_VERSION},SOLARIS_VERSION)
# # for some reason, Solaris needs lib at the end
#   PATCHED_OBJS = ${COMMON_PATCHED_OBJS} /lib/libc.a
# #  PATCHED_OBJS = ${COMMON_PATCHED_OBJS} sigaction.o /lib/libc.a
# else
#   PATCHED_OBJS = ${COMMON_PATCHED_OBJS}
# endif

# found in profiled.make
# ifeq (${TARGET_OS_VERSION},SOLARIS_VERSION)
#   LDFLAGS += -pg ${LIBDIRS} # -L/usr/openwin/lib/libp -L/usr/lib/libp 
#    # Sun libs refce _mcount which isn't in the gcc lib
# else
#   DYNLINKLIBS =	# no dynamic linking with profiled/statically-linked version
#   UNDEFS = -UDYNLINK_SUPPORTED
#   MATHLIBS = -lm_p
#   LDFLAGS += -pg -Xlinker -N ${LIBDIRS}  # -N implies -Bstatic
#   # The -Bstatic is necessary because of a bug in SUNOS
#   #     (see email from hgs, 9/18/91).
# endif





# ##########################################################################################
# # svr4_write.
# # is this necessary?
# 
# write.o: /usr/lib/libc.a
# ifeq (${HOST_ARCH},${TARGET_ARCH})
# 	@lock_run _$@.lock " \
# 		echo Making write.o; \
# 		ar x /usr/lib/libc.a write.o; \
# 		${OBJ_PATCH} ${OSDEFS} write.o      _write      _WRITE; \
# 		${OBJ_PATCH} ${OSDEFS} write.o _libc_write _LIBC_WRITE; \
# 	"
# endif


# ##########################################################################################
# #### HISTORIC: this is from sun4.make
# AS     = as
# GCC    = g++
# 
# SRC_DIRS = $(shell cd ${ROOT}/vm/src; ${MAKE} TARGET_COMPILER=gcc TARGET_ARCH=sparc srcDirList)
# SRC_PATH = ${ROOT}/vm/${VM_SUBDIR}/generated/incls \
# 	   $(SRC_DIRS:%=${ROOT}/vm/src/%)
# 
# VPATH += $(SRC_PATH:%=%:)
# CPP    = /usr/lib/cpp
# ASM_FILTER    = | sed 's;//.*;;'
# 
# XLIBLIBDIRS = -L/usr/openwin/lib
# CLIBS = -lc
# 
# OS_GLUE_LIBS = -ltermcap -lm
# 
# 
# CONFIGDEFS = \
#              ${DYNAMIC} -DXLIB -DFAST_COMPILER -DSIC_COMPILER \
# 	           -DDYNLINK_SUPPORTED -DDEBUG \
#              -DCOMPILER=${COMPILER} -DASSEMBLER=${ASSEMBLER} \
#              -DMANUFACTURER=${MANUFACTURER}
# 
# GNUFLAGS += -msupersparc
# 
# INCLUDES += -I/usr/openwin/include
# 
# DYNLINKLIBS += -ldl
# NETLIBS = -lnsl
# COMMON_PATCHED_OBJS += write.o 
# XLIBLIBS = -lX11
# LOCALLIBS += -lXext
# 
# ##### this is from sun4_write.make
# 
# # Creating patched write
# 
# write.o: /usr/lib/libc.a
# 	@lock_run _$@.lock " \
# 		echo Making write.o; \
# 		ar x /usr/lib/libc.a write.o; \
# 		${OBJ_PATCH} ${OSDEFS} write.o write WRITE; \
# 	"
# 
