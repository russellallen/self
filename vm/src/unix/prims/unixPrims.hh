/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


extern char *UnixFile_seal;

extern fd_set activeFDs;                      // active file descriptors

// so glued in  routines can call me
extern "C" void register_file_descriptor(int fd);


extern "C" int listen(int, int);

void resetTerminal();

int socket_wrap(int domain, int type, int protocol);

int bind_wrap(int socket,
              short family,
              unsigned short port,
              char* address,
              int address_length,
              void* FH);

int connect_wrap(int socket,
                 short family,
                 unsigned short port,
                 char* address,
                 int address_length,
                 void* FH);

char *gethostbyaddr_wrap(char *addr, int addrlen, int addrtype, void *FH);
oop gethostbyname_wrap(char* name, void* FH);

int accept_wrap(int sock, objVectorOop info);

int open_wrap(char *path, int flags, int mode);
int close_wrap(int fd);
int select_wrap(objVectorOop vec, int howMany, void *FH);
int select_read_wrap(objVectorOop vec, int howMany, void *FH);
int system_wrap(char *cmd);
int read_wrap(int fd, char *buf, int buf_len,
              int offset, int nbytes, void *FH);
int write_wrap(int fd, char *buf, int buf_len,
               int offset, int nbytes, void *FH);
char *getcwd_wrap(void *FH);

int putenv_wrap(char *name, char *value);

byteVectorOop syscall0(int n, void* FH);
byteVectorOop syscall1(int n, void* a0, void* FH);
byteVectorOop syscall2(int n, void* a0, void* a1, void* FH);
byteVectorOop syscall3(int n, void* a0, void* a1, void* a2, void* FH);
byteVectorOop syscall4(int n, void* a0, void* a1, void* a2, void* a3, void* FH);
byteVectorOop syscall5(int n, void* a0, void* a1, void* a2, void* a3,
                              void* a4, void* FH);
byteVectorOop syscall6(int n, void* a0, void* a1, void* a2, void* a3, 
                              void* a4, void* a5, void* FH);
  



# define unix_syscall_glue                                                                                                                                  \
   C_func_1(oop,, syscall0,   syscall0_glue,fail,        int,                                                                            ) \
   C_func_2(oop,, syscall1,   syscall1_glue,fail,        int,,           any,void*                                                       ) \
   C_func_3(oop,, syscall2,   syscall2_glue,fail,        int,,           any,void*, any,void*                                            ) \
   C_func_4(oop,, syscall3,   syscall3_glue,fail,        int,,           any,void*, any,void*, any,void*                                 ) \
   C_func_5(oop,, syscall4,   syscall4_glue,fail,        int,,           any,void*, any,void*, any,void*, any,void*                      ) \
   C_func_6(oop,, syscall5,   syscall5_glue,fail,        int,,           any,void*, any,void*, any,void*, any,void*, any,void*           ) \
   C_func_7(oop,, syscall6,   syscall6_glue,fail,        int,,           any,void*, any,void*, any,void*, any,void*, any,void*, any,void*) 


# if TARGET_OS_VERSION == MACOSX_VERSION \
  || TARGET_OS_VERSION ==  LINUX_VERSION
  char*  sysname_wrap(void* FH);
  char* nodename_wrap(void* FH);
  char*  release_wrap(void* FH);
  char*  version_wrap(void* FH);
  char*  machine_wrap(void* FH);
  # define macosx_uname_glue \
    C_func_0(string,,   sysname_wrap,  sysname_glue,fail) \
    C_func_0(string,,  nodename_wrap, nodename_glue,fail) \
    C_func_0(string,,   release_wrap,  release_glue,fail) \
    C_func_0(string,,   version_wrap,  version_glue,fail) \
    C_func_0(string,,   machine_wrap,  machine_glue,fail) 
# else
  # define macosx_uname_glue
# endif


# define WHAT_GLUE PROTOTYPES
    unix_glue
    unix_syscall_glue
    macosx_uname_glue    
# undef WHAT_GLUE


