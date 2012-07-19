/* Sun-$Revision: 30.18 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# if !(   TARGET_OS_VERSION ==  MACOSX_VERSION \
     ||   TARGET_OS_VERSION ==   LINUX_VERSION \
     || ( TARGET_OS_VERSION == SOLARIS_VERSION \
             && TARGET_ARCH == I386_ARCH))
  # define FD_SETSIZE     256             /* max. number of open files */
# endif
  
  // not defined in usr/include/CC/fcntl.h
  
# define STDIN     0
  
# pragma implementation "unixPrims.hh"
# include "_unixPrims.cpp.incl"

  


# if  TARGET_OS_VERSION == SOLARIS_VERSION

extern "C" {
  int open(const char *path, int  oflag,  /*  mode_t  mode  */ ...);
  int fcntl(int fildes, int cmd, /* arg */ ...);
}

# elif TARGET_OS_VERSION == MACOSX_VERSION

  // removed for Tiger: (5/05 dmu)
  // typedef int socklen_t;

# elif  TARGET_OS_VERSION == SUNOS_VERSION

extern "C" {
  int ioctl(int fd, int request, caddr_t arg);
  int select(int width, fd_set *readfds, fd_set *writefds, fd_set *exceptfds,
             struct timeval *timeout);
  int socket(int domain, int type, int protocol);
  int bind(int s, struct sockaddr *name, int namelen);
  void bcopy(char *b1, char *b2, int length);
  void bzero(char *b1, int length);
  int connect(int s, struct sockaddr *name, int namelen);
  struct hostent* gethostbyname(const char*);
  int syscall(int number, ...);
  int accept(...);
}

# else

# endif


# if  COMPILER != GCC_COMPILER  ||  TARGET_OS_VERSION == SOLARIS_VERSION 
extern "C" {
  int syscall(int number, /* arg */ ...);
}
# endif

const char *UnixFile_seal = "UnixFile";

fd_set activeFDs;                      // active file descriptors


static struct termios normalSettings;

class IOCleanup {
 public:
  IOCleanup()  {
# if TARGET_OS_VERSION ==  SUNOS_VERSION \
  || TARGET_OS_VERSION == SOLARIS_VERSION  \
  || TARGET_OS_VERSION ==   LINUX_VERSION
    if (isatty(STDIN))
      ioctl(STDIN, TCGETS, (caddr_t)&normalSettings);
# elif TARGET_OS_VERSION == MACOSX_VERSION
    // not sure what to do
    if (isatty(STDIN))
      ioctl(STDIN, TIOCGETA, (caddr_t)&normalSettings);
# else
  # error what?
# endif
    FD_SET(0, &activeFDs); FD_SET(1, &activeFDs); FD_SET(2, &activeFDs); 
  }
  ~IOCleanup() { resetTerminal(); }
};
static IOCleanup* ioC;        // make sure we exit in blocking mode etc

void resetTerminal() {
# if  TARGET_OS_VERSION ==  SUNOS_VERSION \
  ||  TARGET_OS_VERSION == SOLARIS_VERSION  \
  ||  TARGET_OS_VERSION ==   LINUX_VERSION
    if (isatty(STDIN))
      ioctl(STDIN, TCSETS, (caddr_t)&normalSettings);
# elif TARGET_OS_VERSION == MACOSX_VERSION
    if (isatty(STDIN))
      ioctl(STDIN, TIOCSETA, (caddr_t)&normalSettings);
# else
    # error what?
# endif
  fcntl(STDIN, F_SETFL, 0);
}

// I tried a typedef here without success, must use the macro! Argh!!! - dmu 4/99
# if  TARGET_OS_VERSION == SOLARIS_VERSION

  // Emulate blocking write on a possibly non-blocking filedescriptor; this
  // is necessary because e.g. lprintf doesn't expect non-blocking files.

  typedef unsigned int nbytes_t;
  # if TARGET_ARCH != I386_ARCH
  extern "C"  int write(int, const void*, nbytes_t);
  extern "C"  int  _write(int fd, const void* b, nbytes_t nbytes) { return write(fd, b, nbytes); }
  extern "C" int _libc_write(int fd, const void* b, unsigned int nbytes) {
    return _write(fd, b, nbytes); }
  # endif

  static int c_lib_write(int fd, const char* buf, int nbytes) {
  # if TARGET_ARCH == I386_ARCH
    return write(fd, buf, nbytes);
  # else
    return _write(fd, buf, nbytes);
  # endif
  }

# elif  TARGET_OS_VERSION == SUNOS_VERSION

  // Emulate blocking write on a possibly non-blocking filedescriptor; this
  // is necessary because e.g. lprintf doesn't expect non-blocking files.
  extern "C" {
    int WRITE(int fd, const char* buf, int nbytes);
    // C library write()
  }
  static int c_lib_write(int fd, const char* buf, int nbytes) {
    return WRITE(fd, buf, nbytes);
  }

  typedef long unsigned int nbytes_t;
  
  
# elif  TARGET_OS_VERSION == MACOSX_VERSION

  // Emulate blocking write on a possibly non-blocking filedescriptor; this
  // is necessary because e.g. lprintf doesn't expect non-blocking files.
  
  // next statement is why we lose output from console, I bet -- dmu 12/02
  # if 0 // don't use WRITE for now, seems to work, WRITE is commented in runtime_asm_i386.S
    extern "C" {
      int WRITE(int fd, const char* buf, int nbytes);
      // C library write()
    }
    static int c_lib_write(int fd, const char* buf, int nbytes) {
      return WRITE(fd, buf, nbytes);
    }
    extern "C"  int  _write(int fd, const void* b, nbytes_t nbytes) { return write(fd, b, nbytes); }
    extern "C" int _libc_write(int fd, const void* b, unsigned int nbytes) {
      return _write(fd, b, nbytes); }
      
  # else
    static int c_lib_write(int fd, const char* buf, int nbytes) {
      return write(fd, buf, nbytes);
    }
  # endif  

# elif  TARGET_OS_VERSION == LINUX_VERSION
    static int c_lib_write(int fd, const char* buf, int nbytes) {
      return write(fd, buf, nbytes);
    }    
# else
  # error what?
# endif

 # if TARGET_OS_VERSION != MACOSX_VERSION  &&  TARGET_OS_VERSION != LINUX_VERSION

extern "C" int write(int fd, const void* b, nbytes_t nbytes) {
    int32 res;
    int32 bytesTransferred = 0;
    char* buf = (char*)b;
    do {
      res = c_lib_write(fd, buf + bytesTransferred, nbytes);
      if (res == -1) {
        # if  TARGET_OS_VERSION == SOLARIS_VERSION
          const int theError = EAGAIN;
        # elif  TARGET_OS_VERSION == SUNOS_VERSION
          const int theError = EWOULDBLOCK;
        # endif
        if (errno == theError) {
          // can't write right now, buffers are full; wait for 1ms
          // NOTE: don't use usleep!  It manipulates the timers and
          // sometimes forgets to restart them... arghhh!
          timeval millisecond;
          millisecond.tv_sec = 0; millisecond.tv_usec = 1000;
          select(0, 0, 0, 0, &millisecond);
          errno = 0;
        } else {
          return -1;    // write error
        }
      } else {
        bytesTransferred += res;
        nbytes -= res;
      }
    } while (nbytes > 0);
    return bytesTransferred;
  }
 # endif


// to do a connect:
// s = socket_wrap(PF_INET, SOCK_STREAM, 0)
// bind_wrap(s, AF_INET, 0 /* any port in a storm*/, INADDR_ANY)
// connect(s, AF_INET, 0, INADDR_ANY)
  
  
// example: socket_wrap(PF_INET, SOCK_STREAM, 0);

int socket_wrap(int domain, int type, int protocol) {
  int s = socket(domain, type, protocol);
  register_file_descriptor(s);
  return s;
}


// set up socket address; only works for internet right now

static void set_sockaddr_in(struct sockaddr_in &a,
                       short family,
                       unsigned short port,
                       char* address,
                       int address_length,
                       void* FH) {
  if (family != AF_INET) {
    char buf[128];
    sprintf(buf, "bad family %d: only AF_INET (%d) supported",
            family,
            AF_INET);
    if (strlen(buf) >= sizeof(buf))
      fatal("buf too small");
    failure(FH, buf);
    return;
  }
  if (address_length < sizeof(long)) {
    char buf[128];
    sprintf(buf, "address is too short; (%d), must be >= sizeof(long)",
            address_length);
    if (strlen(buf) >= sizeof(buf))
      fatal("buf too small");
    failure(FH, buf);
    return;
  }

  long aLong;
#   if  TARGET_OS_VERSION == SOLARIS_VERSION  \
    ||  TARGET_OS_VERSION == MACOSX_VERSION   \
    ||  TARGET_OS_VERSION == LINUX_VERSION
    memcpy((char*) &aLong, address, sizeof(long));
    memset(a.sin_zero, 0, sizeof(a.sin_zero));
# elif  TARGET_OS_VERSION == SUNOS_VERSION
    bcopy(address, (char*) &aLong, sizeof(long));
    bzero(a.sin_zero, sizeof(a.sin_zero));
#   endif

     a.sin_family        = family;
     a.sin_port          = htons(port);
     a.sin_addr.s_addr   = aLong;
}

  
// bind, see /usr/include/netinet/in.h
// example (socket, port_no (1275), AF_INET, INADDR_ANY)

int bind_wrap(int socket,
              short family,
              unsigned short port,
              char* address,
              int   address_length,
              void *FH) {
  struct sockaddr_in a;
  set_sockaddr_in(a, family, port, address, address_length, FH);
  int res = bind(socket, (sockaddr*)&a, sizeof(a));

  if (res == -1) return -1;     /* Error in bind call. */

  if (port != 0) return port;

  /* We requested port 0, so the system chose a port number for us.
     As a favor to the caller, return this port number. 
     Yes, this is overloading of a single primitive. Agesen, June 1996.*/
  socklen_t len = sizeof(a);
  if (getsockname(socket, (sockaddr*)&a, &len) == -1) return -1;
  return ntohs(a.sin_port);
  
}


const int addrSize = sizeof(struct in_addr);

byteVectorOop addrAsByteVector(struct in_addr *addr) {
  byteVectorOop bv = Memory->byteVectorObj->cloneSize(addrSize);
  copy_bytes((char*)addr, bv->bytes(0), addrSize);
  return bv;
}


oop gethostbyname_wrap(char* name, void* FH) {
  int addrCount = 0;
  hostent* h = gethostbyname(name);

  if (h == 0) { unix_failure(FH); return 0; }
  for (char **p = h->h_addr_list; *p; p++) 
    addrCount++;
  objVectorOop res = Memory->objVectorObj->cloneSize(addrCount);

  char **p = h->h_addr_list;
  for (int i = 0; i < addrCount; i++) {
    /* Seems imposible to avoid this cast. */
    res->obj_at_put(i, addrAsByteVector((struct in_addr *)*p));
    p++;
  }
  return res;
}


char *gethostbyaddr_wrap(char *addr, int addrlen, int addrtype, void *FH) {
  struct hostent *h = gethostbyaddr(addr, addrlen, addrtype);
  if (!h) { unix_failure(FH, h_errno); return 0; }
  return h->h_name; 
}


int connect_wrap(int socket,
                 short family,
                 unsigned short port,
                 char* address,
                 int   address_length,
                 void* FH) {

  struct sockaddr_in a;
  set_sockaddr_in(a, family, port, address, address_length, FH);

  /* for debugging:
    lprintf("before: socket %d, family %hd, port %hu, address %x, "
           "address_length %d\n",
           socket, family, port, *(int*)&address, address_length);
    lprintf("after: socket %d, sin_family %hd, sin_port %hu, sin_addr %x, "
           "sin_zero1 %d, sin_zero2 %d, len %d\n",
           socket, a.sin_family, a.sin_port, *(int*)&a.sin_addr,
           *(int*)&a.sin_zero[0], *(int*)&a.sin_zero[4], sizeof(a));
  */
  int r =  connect(socket, (sockaddr*)&a, sizeof(a));
  return r;
}
      


// to get a socket for accepting connections:

// s = socket_wrap(PR_INET, SOCK_STREAM, 0)
// bind_wrap(s, AF_INET, port_no (1275), INADDR_ANY)
// listen(s, queueSize? (5))


int accept_wrap(int sock, objVectorOop info) {

  struct sockaddr_in from;
  socklen_t len = sizeof(from);

  int acceptResult = accept(sock, (sockaddr*)&from, &len);

  if (acceptResult == -1) return -1;    /* Error return. */

  register_file_descriptor(acceptResult);

  /* Now fill in the 'info' structure with information about the
     accepted connection. */
  if (info->length_obj_array() >= 3) {
    info->obj_at_put(0, as_smiOop(ntohs(from.sin_port)), false);
    info->obj_at_put(1, as_smiOop(from.sin_family), false);
    info->obj_at_put(2, addrAsByteVector(&from.sin_addr));
  }

  return acceptResult;
}


// need to do this whenever we open a file so select will check it
    
extern "C"
void register_file_descriptor(int fd) {
    // check if this file will mess up select
    // (/dev/rsr0 does under SVR4) -- dmu

  if (fd < 0) return;

  timeval nowait;
  nowait.tv_sec = 0;
  nowait.tv_usec = 0;
  
  static fd_set zeroes; // static to initialize to zero
  fd_set r = zeroes, w = zeroes;
  FD_SET(fd, &r);
  FD_SET(fd, &w);
  
  if ( select(FD_SETSIZE, &r, &w, 0, &nowait) < 0 )
    return;
  
  // end of check
  
  FD_SET(fd, &activeFDs);
  
}

int open_wrap(char *path, int flags, int mode) {
    int result = open(path, flags, mode);
    register_file_descriptor(result);
    return result;
  }




int close_wrap(int fd) {
  int result = close(fd);
  if (result != -1)
    FD_CLR(fd, &activeFDs);
  return result;
}


int select_wrap(objVectorOop vec, int howMany, void *FH) {
  if (howMany > vec->length_obj_array()) {
    prim_failure(FH, BADSIZEERROR);
    return 0;
  }
  if (howMany > FD_SETSIZE) 
    howMany = FD_SETSIZE;
  fd_set r = activeFDs, w = activeFDs;
  timeval nowait;
  nowait.tv_sec  = 0; 
  nowait.tv_usec = 0;
  if (select(howMany, &r, &w, 0, &nowait) < 0) {
    unix_failure(FH);
    return 0;
  }
  // now extract all ready file descriptors
  int index= 0;
  for (int fd = 0; fd < FD_SETSIZE && index < howMany; fd++) {
    if (FD_ISSET(fd, &r) || FD_ISSET(fd, &w))
      vec->obj_at_put(index++, as_smiOop(fd), false);
  }
  return index;
}

int select_read_wrap(objVectorOop vec, int howMany, void *FH) {
  if (howMany > vec->length_obj_array()) {
    prim_failure(FH, BADSIZEERROR);
    return 0;
  }
  if (howMany > FD_SETSIZE) 
    howMany = FD_SETSIZE;
  fd_set r = activeFDs;
  timeval nowait;
  nowait.tv_sec  = 0; 
  nowait.tv_usec = 0;
  if (select(howMany, &r, 0, 0, &nowait) < 0) {
    unix_failure(FH);
    return 0;
  }
  // now extract all ready file descriptors
  int index= 0;
  for (int fd = 0; fd < FD_SETSIZE && index < howMany; fd++) {
    if (FD_ISSET(fd, &r))
      vec->obj_at_put(index++, as_smiOop(fd), false);
  }
  return index;
}


int system_wrap(char *cmd) {
  if (!IntervalTimer::use_real_instead_of_cpu_timer)  IntervalTimer::CPU_timer()->disable(false);
  IntervalTimer::Real_timer()->disable(false);
  int result = system(cmd);
  if (!IntervalTimer::use_real_instead_of_cpu_timer)  IntervalTimer::CPU_timer()->enable();
  IntervalTimer::Real_timer()->enable();
  return result;
}




int putenv_wrap(char *name, char *value) {
  char *buf= new char[strlen(name)+strlen(value)+2];
  strcpy(buf, name);
  strcat(buf, "=");
  strcat(buf, value);
  return putenv(buf); // buf become part of the env; don't deallocate
}


char *getcwd_wrap(void *FH) {
  static char path[MAXPATHLEN];
  char *r= getcwd(path, sizeof(path));
  if (strlen(path) >= sizeof(path))
    fatal("just checkin'");
  if (r == 0) {
    unix_failure(FH);
    return 0;
  }
  return path;
}

int read_wrap(int fd, char *buf, int buf_len, 
              int offset, int nbytes, void *FH) {
  if (offset < 0 ||  nbytes < 0) {
    prim_failure(FH, BADSIGNERROR);
    return 0;
  }
  if (offset + nbytes > buf_len) {
    prim_failure(FH, BADINDEXERROR);
    return 0;
  }
  return read(fd, buf + offset, nbytes);
}


int write_wrap(int fd, char *buf, int buf_len, 
               int offset, int nbytes, void *FH) {
  if (offset < 0 ||  nbytes < 0)
    prim_failure(FH, BADSIGNERROR);
  else if (offset + nbytes > buf_len)
    prim_failure(FH, BADINDEXERROR);
  else 
    return c_lib_write(fd, buf + offset, nbytes);
  return 0;
}



// Since the result of syscall uses all 32 bits of a long the result is 
// converted into a 4 element byteVector instead of a smiOop.
// Since most system calls return -1 for error, we assume -1 means failure.
// Self code can tell because errno will be zero if there were no error.

inline byteVectorOop convertLongToByteVector(long value,  void* FH) {
  if (value == -1)
    unix_failure(FH);
  
  byteVectorOop b = Memory->byteVectorObj->cloneSize(sizeof(long));
  b->byte_at_put(0, char((value & 0xff000000) >> 24));
  b->byte_at_put(1, char((value & 0x00ff0000) >> 16));
  b->byte_at_put(2, char((value & 0x0000ff00) >>  8));
  b->byte_at_put(3, char((value & 0x000000ff) >>  0));
  return b;
}

byteVectorOop syscall0(int n, void* FH) {
  errno = 0;
  return convertLongToByteVector(syscall(n), FH);}

byteVectorOop syscall1(int n, void* a0, void* FH) {
  errno = 0;
  return convertLongToByteVector(syscall(n, a0), FH);}

byteVectorOop syscall2(int n,  void* a0, void* a1, void* FH) {
  errno = 0;
  return convertLongToByteVector(syscall(n, a0, a1), FH);}

byteVectorOop syscall3(int n,  void* a0, void* a1, void* a2, void* FH) {
  errno = 0;
  return convertLongToByteVector(syscall(n, a0, a1, a2), FH);}

byteVectorOop syscall4(int n,  void* a0, void* a1, void* a2, void* a3, void* FH) {
  errno = 0;
  return convertLongToByteVector(syscall(n, a0, a1, a2, a3), FH);}

byteVectorOop syscall5(int n,  void* a0, void* a1, void* a2,
                       void* a3, void* a4, void* FH) {
  errno = 0;
  return convertLongToByteVector(syscall(n, a0, a1, a2, a3, a4), FH);}

byteVectorOop syscall6(int n,  void* a0, void* a1, void* a2, void* a3,
                       void* a4, void* a5, void* FH) {
  errno = 0;
  return convertLongToByteVector(syscall(n, a0, a1, a2, a3, a4, a5), FH);}


void unixPrims_init() { ioC = new IOCleanup; }

void unixPrims_exit() { delete ioC; }

# if TARGET_OS_VERSION == MACOSX_VERSION \
  || TARGET_OS_VERSION ==  LINUX_VERSION
  static struct utsname my_utsname;
  char*  sysname_wrap(void* FH) { return uname(&my_utsname) ? (unix_failure(FH), (char*)0) : my_utsname. sysname; }
  char* nodename_wrap(void* FH) { return uname(&my_utsname) ? (unix_failure(FH), (char*)0) : my_utsname.nodename; }
  char*  release_wrap(void* FH) { return uname(&my_utsname) ? (unix_failure(FH), (char*)0) : my_utsname. release; }
  char*  version_wrap(void* FH) { return uname(&my_utsname) ? (unix_failure(FH), (char*)0) : my_utsname. version; }
  char*  machine_wrap(void* FH) { return uname(&my_utsname) ? (unix_failure(FH), (char*)0) : my_utsname. machine; }
# endif
    
