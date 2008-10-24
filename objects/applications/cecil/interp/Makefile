# Sun-$Revision: 9.1 $

# Copyright 1993:
#   The Cecil Group
#   University of Washington

# Makefile for the Cecil interpreter Self code

default:
	@echo 'no default target'

ROOTDIR	= ../../..

RCS_FILES    = Makefile

RCS_SUFFIXES = .self
RCS_NAMES    = \
	ast \
	basic_cecil \
	binding \
	cecilContext \
	cecilInterp \
	cecilMethod \
	cecilObject \
	cecilParser \
	compiler \
	compiler-setup \
	errMsg \
	interface \
	interpreter \
	interpreter-setup \
	methodCache \
	methodLookup \
	partialOrder \
	resolve \
	scanner \
	sig \
	specObjects \
	token \
	type \
	typeCheck

FTP_VM_FILES    = ${RCS_FILES}
FTP_VM_SUFFIXES = ${RCS_SUFFIXES}
FTP_VM_NAMES    = ${RCS_NAMES}

include ${ROOTDIR}/MakefileSrcTemplate
include ${ROOTDIR}/MakefileFTPTemplate
include ${ROOTDIR}/MakefilePublishTemplate
