# Sun-$Revision: 9.1 $

# Copyright 1993:
#   The Cecil Group
#   University of Washington
 
# Makefile for the Cecil runtime system

ROOTDIR	= ../../..

RCS_ROOT_NAMES = \
	     array \
	     cecil \
	     initcode \
	     lookup \
	     methodCache \
	     methodTable \
	     print \
	     printable

RCS_FILES    = Makefile
RCS_SUFFIXES = .h .c
RCS_NAMES    = ${RCS_ROOT_NAMES} types

FTP_VM_FILES    = ${RCS_FILES}
FTP_VM_SUFFIXES = ${RCS_SUFFIXES}
FTP_VM_NAMES    = ${RCS_NAMES}


# the following lines are for compiling the "default" cecil application
# in this directory

include CecilMakeInfo

ROOT_NAMES = ${RCS_ROOT_NAMES} ${CECIL_ROOT_NAMES}

DEBUG_TARGET = ${TARGET_ROOT}
DEBUG_OBJS = $(ROOT_NAMES:%=%.o)

OPT_TARGET = ${TARGET_ROOT}.opt
OPT_OBJS = $(ROOT_NAMES:%=%.opt.o)

PROF_TARGET = ${TARGET_ROOT}.prof
PROF_OBJS = $(ROOT_NAMES:%=%.prof.o)

CC = filt-g++

DEBUG_CFLAGS = -g -DDEBUG -DASSERT
OPT_CFLAGS = -O -g -DOPTIMIZED
PROF_CFLAGS = -pg ${OPT_CFLAGS} -DPROFILED


default: ${DEBUG_TARGET}

all: ${DEBUG_TARGET} ${OPT_TARGET} ${PROF_TARGET}

clean:
	rm ${DEBUG_TARGET} ${OPT_TARGET} ${PROF_TARGET} \
	   ${DEBUG_OBJS}   ${OBJ_OBJS}   ${PROF_OBJS}

flush:
	rm *.cecil.*

cleanLocks:
	rm _*.lock cleanLocks

optimized: ${OPT_TARGET}

profiled: ${PROF_TARGET}

${DEBUG_TARGET}: ${DEBUG_OBJS}
	@lock_run _$@.link_lock " \
	    check_locks ; \
	    echo Linking $@ ; \
	    ${CC} ${DEBUG_CFLAGS} -o $@ ${DEBUG_OBJS} ; \
	   "

${OPT_TARGET}: ${OPT_OBJS}
	@lock_run _$@.link_lock " \
	    check_locks ; \
	    echo Linking $@ ; \
	    ${CC} ${OPT_CFLAGS} -o $@ ${OPT_OBJS} ; \
	   "

${PROF_TARGET}: ${PROF_OBJS}
	@lock_run _$@.link_lock " \
	    check_locks ; \
	    echo Linking $@ ; \
	    ${CC} ${PROF_CFLAGS} -o $@ ${PROF_OBJS} ; \
	   "

%.o: %.c
	@lock_run _$@.lock " \
	    echo Compiling $< ; \
	    ${CC} ${DEBUG_CFLAGS} -o $@ -c $< ; \
	   "

%.opt.o: %.c
	@lock_run _$@.lock " \
	    echo Compiling $< with optimization ; \
	    ${CC} ${OPT_CFLAGS} -o $@ -c $< ; \
	   "

%.prof.o: %.c
	@lock_run _$@.lock " \
	    echo Compiling $< for profiling ; \
	    ${CC} ${PROF_CFLAGS} -o $@ -c $< ; \
	   "

depend:
	@echo Computing dependencies
	@makedepend $(RCS_ROOT_NAMES:%=%.c) -o.o
	@makedepend $(RCS_ROOT_NAMES:%=%.c) -a -o.opt.o
	@makedepend $(RCS_ROOT_NAMES:%=%.c) -a -o.prof.o
	@makedepend $(CECIL_ROOT_NAMES:%=%.c) -fCecilDependencyInfo -o.o
	@makedepend $(CECIL_ROOT_NAMES:%=%.c) -fCecilDependencyInfo -a -o.opt.o
	@makedepend $(CECIL_ROOT_NAMES:%=%.c) -fCecilDependencyInfo -a -o.prof.o


include ${ROOTDIR}/MakefileFTPTemplate
include ${ROOTDIR}/MakefileSrcTemplate
include ${ROOTDIR}/MakefilePublishTemplate


include CecilDependencyInfo

# DO NOT DELETE THIS LINE -- make depend depends on it.

array.o: array.h types.h /usr/include/stdio.h /usr/include/stdlib.h
array.o: /usr/include/sys/stdtypes.h /usr/include/memory.h printable.h
cecil.o: cecil.h array.h types.h /usr/include/stdio.h /usr/include/stdlib.h
cecil.o: /usr/include/sys/stdtypes.h /usr/include/memory.h printable.h
cecil.o: methodCache.h initcode.h
initcode.o: cecil.h array.h types.h /usr/include/stdio.h
initcode.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
initcode.o: /usr/include/memory.h printable.h initcode.h
lookup.o: cecil.h array.h types.h /usr/include/stdio.h /usr/include/stdlib.h
lookup.o: /usr/include/sys/stdtypes.h /usr/include/memory.h printable.h
lookup.o: lookup.h methodCache.h methodTable.h /usr/include/string.h
methodCache.o: cecil.h array.h types.h /usr/include/stdio.h
methodCache.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
methodCache.o: /usr/include/memory.h printable.h methodCache.h lookup.h
methodTable.o: cecil.h array.h types.h /usr/include/stdio.h
methodTable.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
methodTable.o: /usr/include/memory.h printable.h methodTable.h lookup.h
methodTable.o: methodCache.h
print.o: printable.h cecil.h array.h types.h /usr/include/stdio.h
print.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
print.o: /usr/include/memory.h
printable.o: printable.h cecil.h array.h types.h /usr/include/stdio.h
printable.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
printable.o: /usr/include/memory.h

array.opt.o: array.h types.h /usr/include/stdio.h /usr/include/stdlib.h
array.opt.o: /usr/include/sys/stdtypes.h /usr/include/memory.h printable.h
cecil.opt.o: cecil.h array.h types.h /usr/include/stdio.h
cecil.opt.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
cecil.opt.o: /usr/include/memory.h printable.h methodCache.h initcode.h
initcode.opt.o: cecil.h array.h types.h /usr/include/stdio.h
initcode.opt.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
initcode.opt.o: /usr/include/memory.h printable.h initcode.h
lookup.opt.o: cecil.h array.h types.h /usr/include/stdio.h
lookup.opt.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
lookup.opt.o: /usr/include/memory.h printable.h lookup.h methodCache.h
lookup.opt.o: methodTable.h /usr/include/string.h
methodCache.opt.o: cecil.h array.h types.h /usr/include/stdio.h
methodCache.opt.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
methodCache.opt.o: /usr/include/memory.h printable.h methodCache.h lookup.h
methodTable.opt.o: cecil.h array.h types.h /usr/include/stdio.h
methodTable.opt.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
methodTable.opt.o: /usr/include/memory.h printable.h methodTable.h lookup.h
methodTable.opt.o: methodCache.h
print.opt.o: printable.h cecil.h array.h types.h /usr/include/stdio.h
print.opt.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
print.opt.o: /usr/include/memory.h
printable.opt.o: printable.h cecil.h array.h types.h /usr/include/stdio.h
printable.opt.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
printable.opt.o: /usr/include/memory.h

array.prof.o: array.h types.h /usr/include/stdio.h /usr/include/stdlib.h
array.prof.o: /usr/include/sys/stdtypes.h /usr/include/memory.h printable.h
cecil.prof.o: cecil.h array.h types.h /usr/include/stdio.h
cecil.prof.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
cecil.prof.o: /usr/include/memory.h printable.h methodCache.h initcode.h
initcode.prof.o: cecil.h array.h types.h /usr/include/stdio.h
initcode.prof.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
initcode.prof.o: /usr/include/memory.h printable.h initcode.h
lookup.prof.o: cecil.h array.h types.h /usr/include/stdio.h
lookup.prof.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
lookup.prof.o: /usr/include/memory.h printable.h lookup.h methodCache.h
lookup.prof.o: methodTable.h /usr/include/string.h
methodCache.prof.o: cecil.h array.h types.h /usr/include/stdio.h
methodCache.prof.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
methodCache.prof.o: /usr/include/memory.h printable.h methodCache.h lookup.h
methodTable.prof.o: cecil.h array.h types.h /usr/include/stdio.h
methodTable.prof.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
methodTable.prof.o: /usr/include/memory.h printable.h methodTable.h lookup.h
methodTable.prof.o: methodCache.h
print.prof.o: printable.h cecil.h array.h types.h /usr/include/stdio.h
print.prof.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
print.prof.o: /usr/include/memory.h
printable.prof.o: printable.h cecil.h array.h types.h /usr/include/stdio.h
printable.prof.o: /usr/include/stdlib.h /usr/include/sys/stdtypes.h
printable.prof.o: /usr/include/memory.h
