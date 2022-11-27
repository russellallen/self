// Sun-$Revision: 30.21 $

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// includes for general Unix functionality
// dmu 7/91

// unix headers mess up gettimeofday
//  (some solari have 1 arg, some have 2, others do not even define it
// this must come before unistd, I think

# if  TARGET_OS_VERSION == LINUX_VERSION
  # include <time.h> // get struct tm in time.h
  // # define _TIME_H 1 // get struct tm in time.h
# endif

# include <sys/time.h>

# include <stddef.h> 
# include <stdio.h>
# include <pwd.h>

# define uname someBogusFunctionName
# include <sys/utsname.h>
# undef  uname 

// this kludge is required because SparcWorks 3.0.1 under SunOS
// includes malloc.h in stdlib.h, and misdeclares free() to take a char*, 
// and malloc() and memalign() to return char*
# define __malloc_h
extern "C" { 
  extern void free(void *);
  extern void *malloc(size_t);
  extern void *memalign(size_t, size_t);
}

# include <stdlib.h>
#if TARGET_OS_VERSION != MACOSX_VERSION && TARGET_OS_VERSION != NETBSD_VERSION
# include <alloca.h>
#endif

# include <new> // for std::set_new_handler


# if COMPILER != GCC_COMPILER && TARGET_OS_VERSION == SUNOS_VERSION
#  define write(x)     ___non_existent_function_name___
#  include <unistd.h>
#  undef write
# else
#  include <unistd.h>
# endif

# include <sys/types.h>
# include <fcntl.h>

# if  TARGET_OS_VERSION == SOLARIS_VERSION
#   include <sys/fault.h>
#   define  _ILP32 // need this for new Solaris, maybe Sun cc would define it
#   include <sys/procfs.h>
#   include <ucontext.h>
#   include <siginfo.h>
#   include <sys/swap.h>
#   include <vm/anon.h>
# endif

# include <string.h>
# include <memory.h>
# include <math.h>
# if TARGET_OS_VERSION == MACOSX_VERSION
#   undef ASSEMBLER
#   include <sys/ucontext.h>
#   include <sys/ioctl.h>
#   include <pthread.h>
# endif
# include <termios.h>
# include <sys/syscall.h>
# include <errno.h>
# include <sys/stat.h>
# include <sys/resource.h>
# include <sys/file.h>
# if TARGET_OS_VERSION != LINUX_VERSION
#   include <sys/filio.h>
# endif
# include <sys/param.h>
# include <limits.h>

# include <signal.h>


# if TARGET_OS_VERSION == SUNOS_VERSION
  typedef sigcontext       self_sig_context_t;
  typedef struct sigstack  self_stack_t;
# else
  typedef siginfo_t        self_code_info_t;
  typedef ucontext_t       self_sig_context_t;
  typedef stack_t          self_stack_t;
# endif

# if  TARGET_ARCH == SPARC_ARCH
#   if  TARGET_OS_VERSION == SOLARIS_VERSION
#     include <sys/trap.h>
#     include <sys/systeminfo.h>
#   elif  TARGET_OS_VERSION == SUNOS_VERSION
#     include <sparc/trap.h>
#   endif
# endif


// not in GNU includes:
 
extern "C" {
  extern int    end, etext, edata;
  extern double fmod(double, double);
  // It is now:  int    sigstack(const struct sigstack*, struct sigstack*);
}

# if  TARGET_OS_VERSION == SOLARIS_VERSION

extern "C" {
  uid_t getuid(void);
  // no longer needed: int   gethostname(char *name, unsigned int namelen);
  long  gethostid();
}

# elif  TARGET_OS_VERSION == SUNOS_VERSION

extern "C" {
  int mincore(caddr_t, int, char*);
  int getpagesize();
  int getrlimit(int, struct rlimit *);
  int setrlimit(int, struct rlimit *);
  int sigpause(int);
}

# endif




# if TARGET_OS_VERSION != SOLARIS_VERSION
  # define uname someBogusFunctionName
  # include <sys/utsname.h>
  # undef  uname 

  extern "C" {
    int uname(struct utsname *name);
  }
# endif


# if TARGET_OS_VERSION == SUNOS_VERSION
  #  include <sys/vadvise.h>
   extern "C" {
     int vadvise(int);
   }
# endif


# if TARGET_OS_VERSION == MACOSX_VERSION
  # undef _MACH_PPC_VM_TYPES
  # undef ASSEMBLER

  # include <mach/mach_types.h>
  # include <sys/sysctl.h>
  # include <mach/machine/vm_types.h> // for mman.h
  # include <mach/machine/thread_status.h> // for interruptedCtx_*.cpp *_thread_state_t
# endif


# include <sys/mman.h>

# if TARGET_OS_VERSION == SUNOS_VERSION && COMPILER != GCC_COMPILER
#   define wait(x) __nonexistent_function_name_due_to_incorrect_header___
#   include <sys/wait.h>
#   undef wait
    extern "C" { extern int wait(int*); }
# elif  TARGET_OS_VERSION == SOLARIS_VERSION  ||  COMPILER == GCC_COMPILER
#   include <sys/wait.h>
# endif

# include <setjmp.h>

#if  TARGET_OS_VERSION == SOLARIS_VERSION
# define FORK fork1
# elif  TARGET_OS_VERSION == SUNOS_VERSION
# include <vfork.h>
# define FORK vfork
# elif  TARGET_OS_VERSION == MACOSX_VERSION
# define FORK vfork
# elif  TARGET_OS_VERSION == LINUX_VERSION
# define FORK vfork
# elif  TARGET_OS_VERSION == NETBSD_VERSION
# define FORK vfork
# else
   error which?
#endif

// dlfcn.h is now in Tiger 5/05 dmu
// # if TARGET_OS_VERSION != MACOSX_VERSION
# include <dlfcn.h>        /* Dynamic linker, Ole Agesen, 9/91 */
// # endif

# include <sys/socket.h>
# include <netdb.h>
# include <netinet/in.h>


// required for SunOS/SparcWorks
extern "C" { extern void *valloc(size_t); }

const int Last_OS_Signal = SIGUSR2+1+20; /* so we dont crash on unknown signals */

// some definitions for SignalInterface:

# if  TARGET_OS_VERSION == SUNOS_VERSION

  typedef int* CodeInfo;
  typedef void (*Signal_Handler_t)(int sig, int code, self_sig_context_t *scp, char *addr);

# else

  typedef void (*Signal_Handler_t)(int sig, self_code_info_t *info, self_sig_context_t *con);

# endif

extern "C" { int malloc_verify(); }

# if TARGET_OS_VERSION == MACOSX_VERSION
  typedef size_t nbytes_t;
# endif