# Sun-$Revision: 9.1 $

# Copyright 1993:
#   The Cecil Group
#   University of Washington

# Makefile for Cecil source code for tests

default:
	@echo 'no default target'

ROOTDIR	= ../../..

RCS_FILES    = Makefile

RCS_SUFFIXES = .cecil
RCS_NAMES    = \
	pair \
	towers \
	window \
	\
	checkAll \
	array.tst \
	boolean.tst \
	closure.tst \
	field.tst \
	loop.tst \
	method.tst \
	new.tst \
	prim.tst \
	private.tst \
	resend.tst \
	tree.tst \
	types.tst \
	\
	compile.tst


FTP_VM_FILES    = ${RCS_FILES}
FTP_VM_SUFFIXES = ${RCS_SUFFIXES}
FTP_VM_NAMES    = ${RCS_NAMES}

include ${ROOTDIR}/MakefileSrcTemplate
include ${ROOTDIR}/MakefileFTPTemplate
include ${ROOTDIR}/MakefilePublishTemplate
