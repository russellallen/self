# Sun-$Revision: 30.16 $
 
# Copyright 1992-2012 AUTHORS.
# See the LICENSE file for license information.

# Makefile include

MAKEFLAGS += --no-print-directory

BROWSE  = Browse  -d ${ROOT}    ${EXTRA_FLAGS}
PUBLISH = Publish -a -d ${ROOT} ${EXTRA_FLAGS}
UPDATE  = UpdateFiles  -d ${ROOT}    ${EXTRA_FLAGS}
COMPARE = Compare -d ${ROOT}    ${EXTRA_FLAGS}
CLEAN   = test -z "${CLEAN_EXPR}" || rm -f ${CLEAN_EXPR}

SELF_EXT  = .self
# .dcl.h is obsolete
C_EXT     = .c .h .l \
            .cpp .hh \
            _abstract.h _inline.h .dcl.h \
            _abstract.hh _inline.hh .dcl.hh \
            _inline_abstract.h \
            _inline_abstract.hh \
            _sparc.h _inline_sparc.h _sparc.c \
            _sparc.hh _inline_sparc.hh _sparc.cpp \
            _unix.h  _inline_unix.h _unix.c \
            _unix.hh  _inline_unix.hh _unix.cpp \


RCS_FILE_CMD = echo $(FILES); \
               expandNames $(SELF_MODULES:%=-n %) $(SELF_EXT:%=-e %); \
               expandNames $(C_MODULES:%=-n %)    $(C_EXT:%=-e %)
PUB_FILE_CMD = echo $(AOUT:%=-b %) $(OBJECT_FILES:%=-b %); $(RCS_FILE_CMD)

# DO_FOREACH_DIR command
# executes command in each specified directory if the directory exists
DO_FOREACH_DIR = \
  do_foreach_dir () { \
    command=$$1; \
    for dir in `test -z "${DIRECTORIES}" &&  echo "" || echo ${DIRECTORIES}`; do \
       if test -d $$dir -a ! -h $$dir ; then (cd $$dir; $$command) fi \
    done\
  }; do_foreach_dir

# CREATE_DIRS
CREATE_DIRS = \
  for dir in `test -z "${DIRECTORIES}" &&  echo "" || echo ${DIRECTORIES}`; do \
    mkdir $$dir; \
  done;

nodefault:
	@echo 'No default make rule in' `cwdRootedIn ${ROOT}`

clean:
	@echo Cleaning `cwdRootedIn ${ROOT}`.
	@${CLEAN}
	@${DO_FOREACH_DIR} "${MAKE} $@"

touch:
	@echo Touch files in `cwdRootedIn ${ROOT}`
	@${TOUCH}
	@${DO_FOREACH_DIR} "${MAKE} $@"

create:
	@echo Creating sub-directories in `cwdRootedIn ${ROOT}`
	-@${CREATE_DIRS}
	@${DO_FOREACH_DIR} "UpdateFiles Makefile"
	@${DO_FOREACH_DIR} "${MAKE} $@"

# make publish does not work on Mac because there is also a file named Publish
# and OS X has weird file casing rules, I think -- dmu 6/1
pub publish:
	@echo Publishing files in `cwdRootedIn ${ROOT}`
	@${PUBLISH} $(shell $(PUB_FILE_CMD))
	@${DO_FOREACH_DIR} "${MAKE} $@"

update:
	@echo Updating files in `cwdRootedIn ${ROOT}`
	@${UPDATE} -e ${UPDATE_EXCL}
	@${DO_FOREACH_DIR} "${MAKE} $@"

compare:
	@echo Comparing files in `cwdRootedIn ${ROOT}`
	@${COMPARE} $(shell $(PUB_FILE_CMD))
	@${DO_FOREACH_DIR} "${MAKE} $@"

cmp:
	@COMPAREPROG=cmp ${MAKE} compare

scompare:
	@COMPAREPROG=sdiff ${MAKE} compare

scompare-brief:
	@COMPAREPROG=sdiffc ${MAKE} compare

browse:
	@echo Browsing changes caused by update in `cwdRootedIn ${ROOT}`
	@${BROWSE} 
	@${DO_FOREACH_DIR} "${MAKE} $@"

allDirs:
	@echo `cwdRootedIn ${ROOT}`
	@${DO_FOREACH_DIR} "${MAKE} $@"

updateMakefile:
	@echo Creating Makefile in `cwdRootedIn ${ROOT}`
	@${DO_FOREACH_DIR} "rm -f Makefile"
	@${DO_FOREACH_DIR} "UpdateFiles Makefile"
	@${DO_FOREACH_DIR} "${MAKE} $@"

dirList:
	@echo ${DIRECTORIES}
 
convertToUWRevs:
	@echo Converting revision \#\'s to UW in `cwdRootedIn ${ROOT}`
	@${CONVERTTOUWREVS} $(shell $(RCS_FILE_CMD))
 
convertToSunRevs:
	@echo Converting revision \#\'s to Sun in `cwdRootedIn ${ROOT}`
	@${CONVERTTOSUNREVS} $(shell $(RCS_FILE_CMD))
 
publishList:
	@echo $(shell $(PUB_FILE_CMD))

rcsFileList:
	@echo $(shell $(RCS_FILE_CMD))

absRCSFileList:
	@sh -c 'for f in `gmake rcsFileList`; do echo	`cwdRootedIn ${ROOT}`/$$f; done'

allRCSFileList:
	@${DO_FOREACH_DIR} "gmake absRCSFileList"

links:
	@echo Create source links
	@createSourceLinks ${SRC_PATH}


