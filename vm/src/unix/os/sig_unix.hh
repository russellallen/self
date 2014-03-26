#pragma once
/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
      
 public:
  // Certain OS signals used by SIC, etc
  static const int32 SIGNonLifo    = SIGILL;
  static const int32 SIGUncommon   = SIGILL;
  static const int32 SIGBadHomeRef = SIGSEGV;

  static const int32 ST_UpLevel    = SIGUSR1;    // trap # for non-LIFO block traps

# if  GENERATE_DEBUGGING_AIDS
  static const int32 ST_ShouldNeverHappen = SIGUSR2; // used by SIC to mark impossible case
# endif


 private:
  // Platform parameter:
  static const bool need_preemptor_for_timer = false;
  
  // =============================================================
  
  // Unix-specific declarations:
  
  // Implementation
  friend class IntervalTimer; // for debugguging OS X
  static sigset_t old_mask, sig_mask;
  static char* signal_stack;
  // ensure generic val is enough for ppc
  static int32 signal_stack_size;
  friend class SignalBlocker; // Unix version needs to see mask

  friend void OS::core_dump(); // calls install signal to revert SIGABRT
  static void install_signal(int sig, Signal_Handler_t handler);
  static void init_signal_stack();    
  static void init_sig_mask();

 public:
// Mac OS X and Solaris almost have the same signal handling flags/calls.
// So we use common code for both platforms as much as possible. -mabdelmalek 10/02
# if  TARGET_OS_VERSION == SOLARIS_VERSION  \
  ||  TARGET_OS_VERSION ==  MACOSX_VERSION  \
  ||  TARGET_OS_VERSION ==   LINUX_VERSION
   static int install_flags() { return SA_ONSTACK | SA_SIGINFO | SA_RESTART; }
# elif TARGET_OS_VERSION == SUNOS_VERSION
   static int install_flags() { return SA_ONSTACK; /* ! SA_INTERRUPT */ }
# else
  # error what?
# endif // which OS_VERSION

  // ApplicationEnhancer for MacOSX causes us to receive signals when they should be blocked.
  // Hack around this with these flags. -- dmu & m abd-el-malek 6/03
  static int currentNonTimerSignal;
  static int currentTimerSignal;
