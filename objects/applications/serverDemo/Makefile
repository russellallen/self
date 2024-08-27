# Sun-$Revision: 10.2 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.
 
# Make file for the foreign function (server) demo.
# An example application using dynamic linking.

all: toself socks.so

ROOT = ../../..
CFLAGS=-DDEBUG -DGLUE_CHECKSUM=0 -DXLIB -DFAST_COMPILER -DSIC_COMPILER -DNATIVE_ARCH=i386 -DDYNLINK_SUPPORTED -DCOMPILER=GCC_COMPILER -DTARGET_OS_VERSION=LINUX_VERSION -DTARGET_OS_FAMILY=UNIX_FAMILY -DTARGET_ARCH=I386_ARCH -DHOST_ARCH=I386_ARCH -DGENERATE_DEBUGGING_AIDS=0 -DSPEND_TIME_FOR_DEBUGGING_BY_DEFAULT=0 -DTARGET_IS_OPTIMIZED=1 -DTARGET_IS_PROFILED=0 -DTARGET_IS_FOR_DEBUGGING=0 -m32 -fno-omit-frame-pointer -fno-delete-null-pointer-checks -fno-threadsafe-statics -fvisibility=default -fkeep-inline-functions -fno-exceptions -fno-stack-protector -Wabi=11 -Wreorder -Wreturn-type -Wswitch -Wcomment -Wformat -Wpointer-arith -Woverloaded-virtual -Wno-write-strings -Wparentheses -Wno-register

LINKFLAGS=-m32 -fno-omit-frame-pointer -fno-delete-null-pointer-checks -fno-threadsafe-statics -fvisibility=default -fkeep-inline-functions -fno-exceptions -fno-stack-protector -Wabi=11 -Wreorder -Wreturn-type -Wswitch -Wcomment -Wformat -Wpointer-arith -Woverloaded-virtual -Wno-write-strings -Wparentheses -Wno-register


INCLUDES  += -I$(ROOT)/incls \
             -I$(ROOT)/vm/src/any/asm \
             -I$(ROOT)/vm/src/any/fast_compiler \
             -I$(ROOT)/vm/src/any/interpreter \
             -I$(ROOT)/vm/src/any/lookup \
             -I$(ROOT)/vm/src/any/memory \
             -I$(ROOT)/vm/src/any/objects \
             -I$(ROOT)/vm/src/any/os \
             -I$(ROOT)/vm/src/any/parser \
             -I$(ROOT)/vm/src/any/prims \
             -I$(ROOT)/vm/src/any/runtime \
             -I$(ROOT)/vm/src/any/sic \
             -I$(ROOT)/vm/src/any/zone \
             -I$(ROOT)/vm/src/i386/asm \
             -I$(ROOT)/vm/src/unix/os \
             -I$(ROOT)/vm/src/unix/prims \
             -I$(ROOT)/vm/src/unix/runtime \
             -I$(ROOT)/objects/glue \
             -include $(ROOT)/incls/_precompiled.hh -Winvalid-pch

toself.o: toself.c
	@echo Compiling toself
	@g++ -o toself.o -c toself.c

toself: toself.o
	@echo Linking toself
	@g++ -o toself toself.o

socks.o: socks.c
	@echo Compiling socks.so
	g++ $(CFLAGS) $(INCLUDES) -o socks.o -c  socks.c

socks.so: socks.o
	@echo Linking socks.so
	g++ $(LINKFLAGS) -shared -o socks.so socks.o

clean:
	-@rm toself.o toself socks.so socks.o
