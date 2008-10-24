# Sun-$Revision: 1.1 $
 
# Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
# See the LICENSE file for license information.
 
# Makefile for the Self svr4 generated directory

ROOT          = ../../..
FILES         = Makefile glueCheckSum glueFileList
DIRECTORIES   = incls
CLEAN_EXPR    = Tags Objs.* out.* Dependencies.cpp incls/* deps/*
INCLUDEDB     = ${ROOT}/vm/src/includeDB
PLATFORM      = ${ROOT}/vm/src/Platform_linux

default:	includeDB  Platform_linux

# for SRC_DIRS
include       ${ROOT}/vm/templates/linux.make


lists:
	@echo Creating include and dependency files
	@makeFileLists ${SRC_DIRS}
	@rm -f includeDB Platform_linux
	@makeDeps Platform_linux includeDB ${PLATFORM} ${INCLUDEDB}
	@${CPP} -undef Dependencies.cpp Dependencies.tmp
	sed "/lock_run/s/^./	/" <Dependencies.tmp >Dependencies
	rm Dependencies.tmp

includeDB Platform_linux:	${INCLUDEDB} ${PLATFORM}
	@echo Updating include dependency database
	@makeDeps Platform_linux includeDB ${PLATFORM} ${INCLUDEDB}
	@${CPP} -undef Dependencies.cpp Dependencies.tmp
	sed "/lock_run/s/^./	/" <Dependencies.tmp >Dependencies
	rm Dependencies.tmp

include        ${ROOT}/templates/sources.make
