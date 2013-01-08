# Sun-$Revision: 30.8 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.
 
# Makefile for the Self svr4 generated directory

ROOT          = ../../..
FILES         = Makefile glueCheckSum glueFileList
DIRECTORIES   = incls
CLEAN_EXPR    = Tags Objs.* out.* Dependencies.cpp incls/* deps/*
INCLUDEDB     = ${ROOT}/vm/src/includeDB
PLATFORM      = ${ROOT}/vm/src/Platform_sparc

default:	includeDB  Platform_sparc

# for SRC_DIRS
include       ${ROOT}/vm/templates/svr4.make


lists:
	@echo Creating include and dependency files
	@makeFileLists ${SRC_DIRS}
	@rm -f includeDB Platform_sparc
	@makeDeps Platform_sparc includeDB ${PLATFORM} ${INCLUDEDB}
	@${CPP} -undef Dependencies.cpp Dependencies

includeDB Platform_sparc:	${INCLUDEDB} ${PLATFORM}
	@echo Updating include dependency database
	@makeDeps Platform_sparc includeDB ${PLATFORM} ${INCLUDEDB}
	@${CPP} -undef Dependencies.cpp Dependencies

include        ${ROOT}/templates/sources.make
