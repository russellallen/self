/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "init.hh"
# include "_init.cpp.incl"

// Add new initialization/finalization methods to the macro below; your
// functions must be parameterless and must be named after the .c file
// they belong to (e.g. "void foo_init(); void foo_exit()" for foo.c).
// The INIT_DO macro defines the initialization sequence; you need not
// add a corresponding entry to EXIT_DO if you don't need finalization.

// processInfo_init used to be after countStub2, 
// but universe makes zone, zone now uses timer, timer needs processInfo
// template(vmStrings_init)     vmStrings is called during universe_init

// abort_init must preceed OS::init on Mac to init InterruptedContext::the_interrupted_context

// mapVtbls_init must preceed universe_init

# define INIT_DO(template)                                                    \
  template(abort_init)                                                        \
  template(kinds_init)                                                        \
  template(process_init)                                                      \
  template(profilers_init)                                                    \
  template(malloc_init)                                                       \
  template(monitor_init)                                                      \
  template(errorCodes_init)                                                   \
  template(sendDesc_init)                                                     \
  template(IntervalTimer_init)                                                \
  template(files_init)                                                        \
  template(opcode_init)                                                       \
  template(prim_init)                                                         \
  template(mapVtbls_init)                                                     \
  template(sic_init)                                                          \
  template(eventlog_init)                                                     \
  template(processInfo_init)                                                  \
  template(universe_init)                                                     \
  template(countStub1_init)  /* now uses trapdoors, so need universe */       \
  template(debug_init)                                                        \
  template(nmethod_init)                                                      \
  template(recompile_init)                                                    \
  template(monitorBar_init)                                                   \
  template(inlining_init)                                                     \
  template(countStub2_init)                                                   \
  template(uncommonBranch_init)                                               \
  template(slotIterator_init)                                                 \
  template(findSlot_init)                                                     \
  
// Mac OS X compiler will not allow ErrorCodes::init above, so use inlines:
inline void    errorCodes_init() {    ErrorCodes::init(); }
inline void      sendDesc_init() {      sendDesc::init(); }
inline void IntervalTimer_init() { IntervalTimer::init(); }
inline void IntervalTimer_exit() { IntervalTimer::exit(); }
 
# define PPC_INIT_DO(template) \
  template(regs_ppc_init)                                                     \
  
# define I386_INIT_DO(template) \
  template(regs_i386_init)                                                     \
  
# define UNIX_INIT_DO(template) \
  template(unixPrims_init)                                                    \
  
# define SPARC_INIT_DO(template) \
  template(regs_sparc_init)                                                   \

# define EXIT_DO(template)                                                    \
  template(files_exit)                                                        \
  template(lprintf_exit)                                                      \
  template(monitor_exit)                                                      \
  template(IntervalTimer_exit)                                               \
  
# define UNIX_EXIT_DO(template)                                               \
  template(unixPrims_exit)                                                    \

# define DEFINE_TEMPLATE(name)    void name();

# if GENERATE_DEBUGGING_AIDS // set to 1 to debug initialization
  # define CALL_TEMPLATE(name)  \
      { \
      if (SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT) fprintf(stderr, "init.cpp: calling %s\n", #name); \
      name(); \
      }
# else
  # define CALL_TEMPLATE(name)      name();
# endif


INIT_DO(DEFINE_TEMPLATE)
# if TARGET_ARCH == SPARC_ARCH
  SPARC_INIT_DO(DEFINE_TEMPLATE)
# elif TARGET_ARCH == PPC_ARCH
  PPC_INIT_DO(DEFINE_TEMPLATE)
# elif TARGET_ARCH == I386_ARCH
  I386_INIT_DO(DEFINE_TEMPLATE)
# endif
# if TARGET_OS_FAMILY == UNIX_FAMILY
  UNIX_INIT_DO(DEFINE_TEMPLATE)
# endif


EXIT_DO(DEFINE_TEMPLATE)
# if TARGET_OS_FAMILY == UNIX_FAMILY
  UNIX_EXIT_DO(DEFINE_TEMPLATE)
# endif

# if TARGET_IS_PROFILED
  extern "C" void monitor(int);         // HACK until we have gnulib_p
# endif

void init_globals() {

# if TARGET_IS_PROFILED
    OS::profile(false);
# endif
  INIT_DO(CALL_TEMPLATE)
# if TARGET_ARCH == SPARC_ARCH
  SPARC_INIT_DO(CALL_TEMPLATE)
# elif TARGET_ARCH == PPC_ARCH
  PPC_INIT_DO(CALL_TEMPLATE)
# elif TARGET_ARCH == I386_ARCH
  I386_INIT_DO(CALL_TEMPLATE)
# endif
# if TARGET_OS_FAMILY == UNIX_FAMILY
  UNIX_INIT_DO(CALL_TEMPLATE)
# endif

if (Assembler::do_the_tests) Assembler::test(); 
}

void exit_globals() {
  static bool destructorsCalled = false;
  if (!destructorsCalled) {
    destructorsCalled = true;
    EXIT_DO(CALL_TEMPLATE);
#   if TARGET_OS_FAMILY == UNIX_FAMILY
    UNIX_EXIT_DO(CALL_TEMPLATE)
#   endif
  }
}


bool do_exit_cleanup = true;

void prepare_to_exit_self() {
  if (do_exit_cleanup) {
#   if TARGET_IS_PROFILED
      monitor(0);
#   endif
    exit_globals();
  }
}



