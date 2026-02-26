/* Sun-$Revision: 30.20 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// Implementation-dependent definitions

// Machine dependent types and macros

/* Here is the scheme:

   HOST_ARCH is where the compiler is running, one of SPARC_ARCH, M68K_ARCH, PPC_ARCH, I386_ARCH, X86_64_ARCH
   TARGET_ARCH is the platform we are compiling for
   TARGET_OS_FAMILY: UNIX_FAMILY, MACOS_FAMILY
   TARGET_OS_VERSION: SUNOS_VERSION, SOLARIS_VERSION, MACOS_SYSTEM_7_VERSION, LINUX_VERSION
   COMPILER is the compiler we are using:
     CC_COMPILER, GCC_COMPILER, MWERKS_COMPILER, SPARCWORKS_COMPILER

   TARGET_IS_PROFILED:  defined to 0 or 1
   GENERATE_DEBUGGING_AIDS: defined to 0 or 1
   SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT: defined to 0 or 1 (only need this if GENERATE_DEBUGGING_AIDS is true)

   Do not use: GCC, MPW, OLD_GCC, PROFILED, mac, sparc, sun, unix.
   
         
   Other flags that are defined or not:
   
     FAST_COMPILER (generate non-inlining compiler)
      SIC_COMPILER (generate simple inlining compiler)
                  
                    
   -- dmu
*/

// some cpp's need numbers: 

# define SPARC_ARCH 1
# define  M68K_ARCH 2 /* No longer supported */
# define   PPC_ARCH 3 /* No longer supported, but may bring back sometime */
# define  I386_ARCH 4
# define X86_64_ARCH 5

# define  UNIX_FAMILY 1
# define MACOS_FAMILY 2 /* No longer supported */

# define          SUNOS_VERSION 1
# define        SOLARIS_VERSION 2
# define MACOS_SYSTEM_7_VERSION 3 // No longer supported
# define   MACOS_CARBON_VERSION 4 // Carbon 9/10 version
# define         MACOSX_VERSION 5 // MacOSX native version
# define          LINUX_VERSION 6 // Ubuntu
# define         NETBSD_VERSION 7
# define        FREEBSD_VERSION 8

# define         CC_COMPILER 1
# define        GCC_COMPILER 2
# define     MWERKS_COMPILER 3 /* No longer supported */
# define SPARCWORKS_COMPILER 4

# define MPW_ASM 1
# define LSC_ASM 2

# include "_config_pd.hh.incl"  

// continued in os_includes.h so it can be after os_includes_<os>.h


# ifdef __APPLE__
# define TARGET_OS_FAMILY UNIX_FAMILY
# define TARGET_OS_VERSION MACOSX_VERSION
# endif

# if TARGET_OS_VERSION == MACOSX_VERSION

  # ifdef TARGET_ARCH
    //  # error no need to define this
    // we determine ourselves
    # undef TARGET_ARCH
  # endif
  # if defined(__ppc__)
    # define TARGET_ARCH PPC_ARCH
  # elif defined(__x86_64__)
    # define TARGET_ARCH X86_64_ARCH
  # elif defined(__i386__)
    # define TARGET_ARCH I386_ARCH
  # else
    # error A new Mac CPU?
  # endif
  
  # if NATIVE_ARCH == ppc
  # define HOST_ARCH PPC_ARCH
  # elif NATIVE_ARCH == x86_64
  # define HOST_ARCH X86_64_ARCH
  # elif NATIVE_ARCH == i386
  # define HOST_ARCH I386_ARCH
  # else
  # error what?
  # endif
  //or could: # define HOST_ARCH TARGET_ARCH // cross compiling is invisible on OSX
  
  # define         TIGER_RELEASE 4
  # define       LEOPARD_RELEASE 5
  # define  SNOW_LEOPARD_RELEASE 6
  # define          LION_RELEASE 7
  # define MOUNTAIN_LION_RELEASE 8
	  
  # ifndef OSX_RELEASE
    # define OSX_RELEASE MOUNTAIN_LION_RELEASE
  # endif

  // Apple asm syntax changed in 2006 sometime
  // next 5 lines DUPLICATED in asmDefs_gcc_i386.hh
  # define   PRE_2007_OSX_ASM_RELEASE 4
  # define  POST_2007_OSX_ASM_RELEASE 5
  # ifndef OSX_ASM_RELEASE
    # define OSX_ASM_RELEASE POST_2007_OSX_ASM_RELEASE
  # endif
# endif



# if TARGET_ARCH == HOST_ARCH || TARGET_OS_VERSION == MACOSX_VERSION /* ok to cross compile */
# define DO_NOT_CROSS_COMPILE
# else
# define DO_NOT_CROSS_COMPILE cannotCrossCompileMe
# endif

# define s 17
# if TARGET_OS_VERSION == MACOSX_VERSION  &&  TARGET_ARCH == PPC_ARCH
  # ifndef GCC_OPTIMIZATION_LEVEL
    # warning The xcode project PREPROCESSOR_MACROS should include GCC_OPTIMIZATION_LEVEL=${GCC_OPTIMIZATION_LEVEL}
  # elif GCC_OPTIMIZATION_LEVEL == s
    # warning -Os breaks Self, use -O3 instead (when making a snapshot, some slots in globals are missing their annotations on the PPC)
  # endif
# endif
# undef s


# if defined(__GNUC__)
  # define GCC 1
  # if __GNUC__ < 4
    # define GCC3 1
  # else
    # define GCC4 1
  # endif
# endif

// The following definitions make machine-dependent asserts more convenient
# if  TARGET_ARCH == SPARC_ARCH
# define isSparc 1
# else 
# define isSparc 0
# endif

// Mac OS X compiler won't link if certain destructors are implicit, sigh
// Update: this bug isn't in Mac OS X anymore.  So I've falsified
// the predicate for Mac OS X as well.  -mabdelmalek 10/02
# if TARGET_OS_VERSION == MACOSX_VERSION && ! defined(GCC3)  &&  0
# define MACOSX_DESTRUCTOR_BUG(className)  XCONC(~,className)() {}
# else
# define MACOSX_DESTRUCTOR_BUG(className)
# endif

# if !GCC
  # define INTERFACE_PRAGMAS 1 // GCC >3 fails with interface pragmas
# endif


# if TARGET_IS_PROFILED != 0  &&  TARGET_IS_PROFILED != 1
  # error Makefile or project must set this
# endif  
# if GENERATE_DEBUGGING_AIDS != 0  &&  GENERATE_DEBUGGING_AIDS != 1
  # error Makefile or project must set this
# endif
# if !GENERATE_DEBUGGING_AIDS
  # if !defined(SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT)
    # define SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT 0
  # elif SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT
    # error cannot spend time for debugging without debugging code
  # endif
# elif SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT != 0  &&  SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT != 1
  # error Makefile or project must set this to 0 or 1
# endif  



# if GCC3
// GCC3.0 complains if pragmas are enabled
class DefineGCC3ToFix_storage_size_of_ZTxxXXXXX_isnt_known {
 public:
  virtual void print();
};
# endif
