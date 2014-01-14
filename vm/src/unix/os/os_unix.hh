/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


 private:
  // max length of a login name, in limits.h under Solaris
# if TARGET_OS_VERSION == SUNOS_VERSION \
  || TARGET_OS_VERSION == MACOSX_VERSION \
  || TARGET_OS_VERSION == LINUX_VERSION
     static const int logname_max = 8; 
# else
     static const int logname_max = LOGNAME_MAX;
# endif

 public:
  static const int max_path_length = MAXPATHLEN;

 private:
  static int zero_fd;
  static const int dont_bother = 8 * K;

# if  TARGET_OS_VERSION == SOLARIS_VERSION \
  ||  TARGET_OS_VERSION == MACOSX_VERSION  \
  ||  TARGET_OS_VERSION ==  LINUX_VERSION
    static void setPageAdvisory(char *start, char *end, int code);
# endif

