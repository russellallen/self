# Sun-$Revision: 1.1 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.
 
# Makefile for the Self svr4 generated directory

ROOT          = ../../..
FILES         = Makefile glueCheckSum glueFileList
DIRECTORIES   = incls
CLEAN_EXPR    = Tags Objs.* out.* Dependencies Dependencies.cpp incls/_* deps/*
INCLUDEDB     = ${ROOT}/vm/src/includeDB
PLATFORM      = ${ROOT}/vm/src/Platform_linux

# We are already in Gnu land - set for $SELF_WORKING_DIR/bin/shell/makeFileLists
export MAKE := make

.PHONY: lists

default:	includeDB Platform_linux Dependencies
# for SRC_DIRS
include       ${ROOT}/vm/templates/linux.make

Dependencies lists:
	@echo Creating include and dependency files
	@makeFileLists ${SRC_DIRS}
	@rm -f includeDB Platform_linux
	@makeDeps Platform_linux includeDB ${PLATFORM} ${INCLUDEDB}
	@${CPP} -undef Dependencies.cpp -o Dependencies.tmp
	sed "/lock_run/s/^./	/" <Dependencies.tmp >Dependencies
	rm Dependencies.tmp

includeDB Platform_linux:	${INCLUDEDB} ${PLATFORM}
	@echo Updating include dependency database
	@makeDeps Platform_linux includeDB ${PLATFORM} ${INCLUDEDB}
	@${CPP} -undef Dependencies.cpp -o Dependencies.tmp
	sed "/lock_run/s/^./	/" <Dependencies.tmp >Dependencies
	rm Dependencies.tmp

include        ${ROOT}/templates/sources.make
