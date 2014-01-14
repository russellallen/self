/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "unixPrims.glue.hh"

#include "_unixPrims.glue.cpp.incl"

# if  TARGET_OS_VERSION == SOLARIS_VERSION
extern "C" {
  int open(const char *path, int  oflag,  /*  mode_t  mode  */ ...);
  int fcntl(int fildes, int cmd, /* arg */ ...);
}
# endif

  DO_NOT_CROSS_COMPILE

# define WHAT_GLUE FUNCTIONS
    unix_glue
    unix_syscall_glue
    macosx_uname_glue
# undef  WHAT_GLUE

