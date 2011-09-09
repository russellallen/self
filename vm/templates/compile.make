# Sun-$Revision: 30.12 $
 
# Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.

# Makefile template for VM object subdirectories

COMPILER = GCC_COMPILER
#COMPILER = CC_COMPILER


OBJ_PATCH = obj_patch
CPP_NODEF = ${CPP} -undef

CLEAN_EXPR += *.o *.i core *~ vmDate.s Self

default: cleanLocks updateIncludeDB ${AOUT} ${OBJECT_FILES}

#.PRECIOUS: includeDB

cleanLocks:
	@echo Removing locks
	@rm -f _*.lock cleanLocks

# this is for VM builders
updateIncludeDB:
	@if [ -w ${ROOT}/vm/src/includeDB ]; then cd ${ROOT}/vm/${VM_SUBDIR}/generated; ${MAKE} includeDB; fi

remove:
	@echo Removing out-of-date .o files in `pwd`
	@${MAKE} files 'COMPILE.gnu.o=remove' 'COMPILE.gnu.o.nog=remove' 
	@rm -f _*.lock cleanLocks

# Compute the checksum for glueDefs.cpp and all its include files.
GLUEDEFS_C = ${ROOT}/vm/src/any/prims/glueDefs.cpp
GLUECHECKSUM_C = ${ROOT}/vm/src/any/prims/glueCheckSum.cpp
GLUEFILELIST = ${ROOT}/vm/${VM_SUBDIR}/generated/glueFileList
GLUECHECKSUM = ${ROOT}/vm/${VM_SUBDIR}/generated/glueCheckSum

ifeq (${COMPILER}, GCC_COMPILER)
  ${GLUEFILELIST} : glueDefs.cpp
	  @lock_run _`basename $@.lock` " \
	      echo Building ${GLUEFILELIST} ; \
	      ${COMPILE.gnu.s} ${INCLUDES} ${OSDEFS} -MM ${GLUEDEFS_C} | \
	      sed -e 's/\\\\//' -e 's/glueDefs.o://' >${GLUEFILELIST} ; \
	     " 
else
  glueDefs.o ${GLUEFILELIST} : glueDefs.cpp
	  @lock_run _`basename $@.lock` " \
	      echo Compiling ${GLUEDEFS_C} and building ${GLUEFILELIST} ; \
	      ( ${COMPILE.gnu.o.nog} -H ${GLUEDEFS_C} 2>&1 ) | \
		  grep '^[ 	]*\.' >${GLUEFILELIST} ; \
	     " 
endif

${GLUECHECKSUM} : ${GLUEFILELIST}
	@lock_run _`basename $@.lock` " \
	    echo Calculating glue check sum ; \
            cat /dev/null/ \`cat ${GLUEFILELIST}\` | skipComments | sum | awk '{print "1" \$$1}' >${GLUECHECKSUM} \
	   "

glueCheckSum.o : ${GLUECHECKSUM_C} ${GLUECHECKSUM}
	@lock_run _$@.lock " \
	   echo Compiling ${GLUECHECKSUM_C} ; \
	   ${COMPILE.gnu.o} -DGLUE_CHECKSUM=`cat ${GLUECHECKSUM}` ${INCLUDE_PRECOMP} ${GLUECHECKSUM_C}; \
	  "

# don't use -g with -O for glue stuff - debug info not useful, and compiles
# take too long
%glue.o: %glue.cpp ${GLUECHECKSUM}
	@lock_run _$@.lock " \
	    echo Compiling $< ; \
	    rm -f $@ ; \
	    ${COMPILE.gnu.o.nog} -DGLUE_CHECKSUM=`cat ${GLUECHECKSUM}` ${INCLUDE_PRECOMP} $< ; \
	   "

glue.o: glue.cpp
	@lock_run _$@.lock " \
	    echo Compiling $< ; \
	    rm -f $@ ; \
	    ${COMPILE.gnu.o.nog} ${INCLUDE_PRECOMP} $< ; \
	   " 
%.o: %.cpp 
	@lock_run _$@.lock " \
	    echo Compiling $< ; \
	    rm -f $@ ; \
	    ${COMPILE.gnu.o} ${INCLUDE_PRECOMP} $< ; \
	   " 

# intermediate files
%.i: %.cpp
	@lock_run _$@.lock " \
		echo Preprocessing $< to $@; \
		${COMPILE.gnu.i} ${INCLUDE_PRECOMP} $< >$@; \
	"

%.s: %.cpp
	@lock_run _$@.lock " \
		echo Preprocessing $< to $@; \
		${COMPILE.gnu.s} ${INCLUDE_PRECOMP} $< ; \
		rm -f /tmp/$*.$$$$..cpp; \
	"


# Assembling
%.o: %.s
	@lock_run _$@.lock " \
	    echo Assembling $*.s ; \
	    rm -f $@ ; \
	    ${COMPILE1.s} $< ${ASM_FILTER} >/tmp/$*.$$$$.s; \
	    ${COMPILE2.s}  -o $@ /tmp/$*.$$$$.s; \
            rm -f /tmp/$*.$$$$.s; \
	  "
# intermediate files
%.i: %.s
	@lock_run _$@.lock " \
		echo Preprocessing $*.s to $@; \
		${COMPILE1.s} $< >$@; \
          "


# Creating shared libraries
%.so: %.o
	@lock_run _$@.lock " \
		echo Linking $@; \
		ld ${GLUE_LD_FLAGS} -o $@ $< ${EXTRA_LIBS} ${$*_libs}; \
		ld ${GLUE_LD_FLAGS} -o $@ $< ${EXTRA_LIBS} ${$*_libs}; \
	"

# Creating patched sigaction

# sigaction.o: /usr/lib/libc.a
# ifeq (${HOST_ARCH},${TARGET_ARCH})
#   ifeq (${TARGET_OS_VERSION},SOLARIS_VERSION)
# 	@@lock_run _$@@.lock " \
# 		echo Making sigaction.o; \
# 		ar x /usr/lib/libc.a sigaction.o; \
# 		${OBJ_PATCH} ${OSDEFS} sigaction.o sigaction SIGACTION; \
# 		${OBJ_PATCH} ${OSDEFS} sigaction.o _sigaction _SIGACTION; \
# 	"
#   endif
# endif



# Creating dummy vmDate.o/.s (the real files are created just before every
# link, this rule is only executed to get initial files)

vmDate.o:   vmDate.s
	@touch vmDate.o

vmDate.s:   
	@touch vmDate.s

