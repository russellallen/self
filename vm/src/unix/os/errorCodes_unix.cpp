/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "errorCodes_unix.hh"

# include "_errorCodes_unix.cpp.incl"

  static const char* unixError[] = {
  
# if TARGET_OS_VERSION == SOLARIS_VERSION

    "NOERR",
    // 1 through 20
    "EPERM", "ENOENT", "ESRCH", "EINTR", "EIO",
    "ENXIO", "E2BIG", "ENOEXEC", "EBADF", "ECHILD",
    "EAGAIN", "ENOMEM", "EACCES", "EFAULT", "ENOTBLK",
    "EBUSY", "EEXIST", "EXDEV", "ENODEV", "ENOTDIR",
    
    // 21 through 40
    "EISDIR", "EINVAL", "ENFILE", "EMFILE", "ENOTTY",
    "ETXTBSY", "EFBIG", "ENOSPC", "ESPIPE", "EROFS",
    "EMLINK", "EPIPE", "EDOM", "ERANGE", "ENOMSG",
    "EIDRM", "ECHRNG", "EL2NSYNC", "EL3HLT", "EL3RST",
    
    // 41 through 60
    "ELNRNG", "EUNATCH", "ENOCSI", "EL2HLT", "EDEADLK",
    "ENOLCK", "ECANCELED", "ENOTSUP", "", "EBADE",
    "EBADR", "EXFULL", "ENOANO", "EBADRQC", "EBADSLT",
    "EDEADLOCK", "EBFONT", "", "", "ENOSTR",
    
    // 61 through 80
    "ENODATA", "ETIME", "ENOSR", "ENONET", "ENOPKG",
    "EREMOTE", "ENOLINK", "EADV", "ESRMNT", "ECOMM",
    "EPROTO", "", "", "EMULTIHOP", "",
    "", "EBADMSG", "ENAMETOOLONG", "EOVERFLOW", "ENOTUNIQ",
    
    // 81 through 100
    "EBADFD", "EREMCHG", "ELIBACC", "ELIBBAD", "ELIBSCN",
    "ELIBMAX", "ELIBEXEC", "EILSEQ", "ENOSYS", "ELOOP",
    "ERESTART", "ESTRPIPE", "ENOTEMPTY", "EUSERS", "ENOTSOCK",
    "EDESTADDRREQ", "EMSGSIZE", "EPROTOTYPE", "ENOPROTOOPT", "",
    
    // 101 through 120
    
    "", "", "", "", "",
    "", "", "", "", "",
    "", "", "", "", "",
    "", "", "", "", "EPROTONOSUPPORT",
    
    // 121 through 140
    "ESOCKTNOSUPPORT", "EOPNOTSUPP", "EPFNOSUPPORT", "EAFNOSUPPORT", "EADDRINUSE",
    "EADDRNOTAVAIL", "ENETDOWN", "ENETUNREACH", "ENETRESET", "ECONNABORTED",
    "ECONNRESET", "ENOBUFS", "EISCONN", "ENOTCONN", "EUCLEAN",
    "", "ENOTNAM", "ENAVAIL", "EISNAM", "EREMOTEIO",
    
    
    // 141 through 151
    "EINIT", "EREMDEV", "ESHUTDOWN", "ETOOMANYREFS", "ETIMEDOUT",
    "ECONNREFUSED", "EHOSTDOWN", "EHOSTUNREACH", "EALREADY", "EINPROGRESS",
    "ESTALE"
    
# elif  TARGET_OS_VERSION == SUNOS_VERSION

    "NOERR",
    // 1 through 20
    "EPERM", "ENOENT", "ESRCH", "EINTR", "EIO",
    "ENXIO", "E2BIG", "ENOEXEC", "EBADF", "ECHILD",
    "EAGAIN", "ENOMEM", "EACCES", "EFAULT", "ENOTBLK",
    "EBUSY", "EEXIST", "EXDEV", "ENODEV", "ENOTDIR",
    
    // 21 through 40
    "EISDIR", "EINVAL", "ENFILE", "EMFILE", "ENOTTY",
    "ETXTBSY", "EFBIG", "ENOSPC", "ESPIPE", "EROFS",
    "EMLINK", "EPIPE", "EDOM", "ERANGE", "EWOULDBLOCK",
    "EINPROGRESS", "EALREADY", "ENOTSOCK", "EDESTADDRREQ", "EMSGSIZE",
    
    // 41 through 60
    "EPROTOTYPE", "ENOPROTOOPT", "EPROTONOSUPPORT", "ESOCKTNOSUPPORT", "EOPNOTSUPP",
    "EPFNOSUPPORT", "EAFNOSUPPORT", "EADDRINUSE", "EADDRNOTAVAIL", "ENETDOWN",
    "ENETUNREACH", "ENETRESET", "ECONNABORTED", "ECONNRESET", "ENOBUFS",
    "EISCONN", "ENOTCONN", "ESHUTDOWN", "ETOOMANYREFS", "ETIMEDOUT",
    
    // 61 through 80
    "ECONNREFUSED", "ELOOP", "ENAMETOOLONG", "EHOSTDOWN", "EHOSTUNREACH",
    "ENOTEMPTY", "EPROCLIM", "EUSERS", "EDQUOT", "ESTALE",
    "EREMOTE", "ENOSTR", "ETIME", "ENOSR", "ENOMSG",
    "EBADMSG", "EIDRM", "EDEADLK", "ENOLCK", "ENONET",
    
    // 81 through 90
    "ERREMOTE", "ENOLINK", "EADV", "ESRMNT", "ECOMM",
    "EPROTO", "EMULTIHOP", "EDOTDOT", "EREMCHG", "ENOSYS"
    
# elif  TARGET_OS_VERSION == MACOSX_VERSION

    "NOERR",
    // 1 through 20
    "EPERM", "ENOENT", "ESRCH", "EINTR", "EIO",
    "ENXIO", "E2BIG", "ENOEXEC", "EBADF", "ECHILD",
    "EDEADLK", "ENOMEM", "EACCES", "EFAULT", "ENOTBLK",
    "EBUSY", "EEXIST", "EXDEV", "ENODEV", "ENOTDIR",
    
    // 21 through 40
    "EISDIR", "EINVAL", "ENFILE", "EMFILE", "ENOTTY",
    "ETXTBSY", "EFBIG", "ENOSPC", "ESPIPE", "EROFS",
    "EMLINK", "EPIPE", "EDOM", "ERANGE", "EAGAIN",
    "EINPROGRESS", "EALREADY", "ENOTSOCK", "EDESTADDRREQ", "EMSGSIZE",
    
    // 41 through 60
    "EPROTOTYPE", "ENOPROTOOPT", "EPROTONOSUPPORT", "ESOCKTNOSUPPORT", "ENOTSUP",
    "EPFNOSUPPORT", "EAFNOSUPPORT", "EADDRINUSE", "EADDRNOTAVAIL", "ENETDOWN",
    "ENETUNREACH", "ENETRESET", "ECONNABORTED", "ECONNRESET", "ENOBUFS",
    "EISCONN", "ENOTCONN", "ESHUTDOWN", "ETOMANYREFS", "ETIMEDOUT",
    
    // 61 through 80
    "ECONNREFUSED", "ELOOP", "ENAMETOOLONG", "EHOSTDOWN", "EHOSTUNREACH",
    "ENOTEMPTY", "EPROCLIM", "EUSERS", "EDQUOT", "ESTALE",
    "EREMOTE", "EBADRPC", "ERPCMISMATCH", "EPROGUNAVAIL", "EPROGMISMATCH",
    "EPROCUNAVAIL", "ENOLCK", "ENOSYS", "EFTYPE", "EAUTH",
    
    // 81 through 100
    "ENEEDAUTH", "EPWROFF", "EDEVERR", "EOVERFLOW", "EBADEXEC",
    "EBADARCH", "ESHLIBVERS", "EBADMACHO", "ELAST"


# elif  TARGET_OS_VERSION == LINUX_VERSION

    "NOERR",
    // 1 through 20
    "EPERM", "ENOENT", "ESRCH", "EINTR", "EIO",
    "ENXIO", "E2BIG", "ENOEXEC", "EBADF", "ECHILD",
    "EAGAIN", "ENOMEM", "EACCES", "EFAULT", "ENOTBLK",
    "EBUSY", "EEXIST", "EXDEV", "ENODEV", "ENOTDIR",
    
    // 21 through 40
    "EISDIR", "EINVAL", "ENFILE", "EMFILE", "ENOTTY",
    "ETXTBSY", "EFBIG", "ENOSPC", "ESPIPE", "EROFS",
    "EMLINK", "EPIPE", "EDOM", "ERANGE", "EDEADLK",
    "ENAMETOOLONG", "ENOLCK", "ENOSYS", "ENOTEMPTY", "ELOOP",
    
    // 41 through 60
    "E41-UNUSED", "ENOMSG", "EIDRM", "ECHRNG", "EL2NSYNC",
    "EL3HLT", "EL3RST", "ELNRNG", "EUNATCH", "ENOCSI",
    "EL2HLT", "EBADE", "EBADR", "EXFULL", "ENOANO", 
    "EBADRQC", "EBADSLT", "E58-Unused", "EBFONT", "ENOSTR",
    
    // 61 through 80
    "ENODATA", "ETIME", "ENOSR", "ENONET", "ENOPKG",
    "EREMOTE", "ENOLINK", "EADV", "ESRMNT", "ECOMM",
    "EPROTO", "EMULTIHOP", "EDOTDOT", "EBADMSG", "EOVERFLOW",
    "ENOTUNIQ", "EBADFD", "EREMCHG", "ELIBACC", "ELIBBADD",
    
    // 81 through 100
    "ELIBSCN", "ELIBMAX", "ELIBEXEC", "EILSEQ", "ERESTART",
    "ESTRPIPE", "EUSERS", "ENOTSOCK", "EDESTADDRREQ", "EMSGSIZE",
    "EPROTOTYPE", "ENOPROTOOPT", "EPROTONOSUPPORT", "ESOCKTNOSUPPORT", "EOPNOTSUPP",
    "EPFNOSUPPORT", "EAFNOSUPPORT", "EADDRINUSE", "EADDRNOTAVAIL", "ENETDOWN",

    // 101 through 120
    "ENETUNREACH", "ENETRESET", "ECONNABORTED", "ECONNRESET", "ENOBUFS",
    "EISCONN", "ENOTCONN", "ESHUTDOWN", "ETOOMANYREFS", "ETIMEOUT",
    "ECONNREFUSED", "EHOSTDOWN", "EHOSTUNREACH", "EALREADY", "EINPROGRESS",
    "ESTALE", "EUCLEAN", "ENOTNAM", "ENAVAIL", "EISNAM", 

    // 121 through 140
    "EREMOTEIO", "EDQUOT", "ENOMEDIUM", "EMEDIUMTYPE", "ECANCELED",
    "ENOKEY", "EKEYEXPIRED", "EKEYREVOKED", "EKEYREJECTED", "EOWNERDEAD",
    "ENOTRECOVERABLE"

#   else
	# error what?

#   endif // OS_VERSION

};


static inline int numUnixErrors() { return sizeof(unixError) / sizeof(unixError[0]); }


#if TARGET_OS_VERSION != MACOSX_VERSION  &&  TARGET_OS_VERSION != LINUX_VERSION
extern char* sys_errlist[];             // error messages corr. to errno.
extern int   sys_nerr;                  // length of above table
#endif // !MACOSX_VERSION


const char* ErrorCodes::os_error_name(int error) {
  static char buf[128];
  return 0 <= error && error < numUnixErrors()  &&  unixError[error][0]
    ? unixError[error]
    : (sprintf(buf, "UNKNOWN %d", error), buf);

}

# if TARGET_OS_VERSION ==  LINUX_VERSION \
  || TARGET_OS_VERSION == MACOSX_VERSION
  # define ERROR_STRING(i) strerror(i)
# else
  # define ERROR_STRING(i) (i < sys_nerr ? (char*)sys_errlist[i] : (char*)-1)
# endif

char* ErrorCodes::os_error_message(char* s) {  
  // search unix error table
  int i;
  for( i = 0; i < numUnixErrors(); i++) {
    if (!strncmp(s, unixError[i], strlen(unixError[i]))) {
      return ERROR_STRING(i);
    }
  }
  return 0;
}
