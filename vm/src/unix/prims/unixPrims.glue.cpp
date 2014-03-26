/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# include "unixPrims.hh"
# include "generation_inline.hh"
# include "quartzWindow.hh"
# include "os.hh"
# include "platformWindow.hh"
# include "space_inline.hh"

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

