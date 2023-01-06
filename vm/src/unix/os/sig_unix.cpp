/* Sun-$Revision: 30.20 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "sig_unix.hh"

# include "_sig_unix.cpp.incl"

int SignalInterface::currentNonTimerSignal = 0;
int SignalInterface::currentTimerSignal = 0;


# if  TARGET_OS_VERSION == SOLARIS_VERSION \
  ||  TARGET_OS_VERSION ==  MACOSX_VERSION \
  ||  TARGET_OS_VERSION ==  NETBSD_VERSION \
  ||  TARGET_OS_VERSION == FREEBSD_VERSION \
  ||  TARGET_OS_VERSION ==   LINUX_VERSION
  static void signal_handler(int sig, self_code_info_t *info = NULL, self_sig_context_t *scp = NULL);
# elif TARGET_OS_VERSION == SUNOS_VERSION
  static void signal_handler(int sig, int code = 0, self_sig_context_t *scp = NULL, char *addr = NULL);
# else
  # error what?
# endif

static int32 ctrl_z_handler(int sig);
  


// ==================================================================


void OSToSelfSignalMapper::init_platform() {
  _map[ SIGINT    ] = sigint;
  _map[ SIGQUIT   ] = sigquit;
  _map[ SIGIO     ] = sigio;
  _map[ SIGUSR1   ] = siguser1;
  _map[ SIGUSR2   ] = siguser2;
  _map[ SIGPIPE   ] = sigpipe;
  _map[ SIGTERM   ] = sigterm;
  _map[ SIGURG    ] = sigurg;
  _map[ SIGCHLD   ] = sigchild;
  _map[ SIGHUP    ] = sighup;
  _map[ SIGWINCH  ] = sigwinch;
  _map[ SIGALRM   ] = sigrealtimer;
  _map[ SIGVTALRM ] = sigcputimer;
}

// ==================================================================


bool SignalInterface::is_on_signal_stack(char* sp) {
  if (sp == NULL)  sp = (char*)currentFrame();
  return signal_stack <= sp  
      &&           sp <  signal_stack + signal_stack_size;
}


bool SignalInterface::is_off_signal_stack(char* sp) { 
  return !is_on_signal_stack(sp); 
}
  
  
void SignalInterface::wait_for_any() {
  select(0, NULL, NULL, NULL, NULL);
  IntervalTimer::do_all_sync_tasks();
}


void SignalInterface::initialize_platform(bool ctrlC) {
  init_sig_mask();
  if (! signal_stack) {
    init_signal_stack();
  }
  install_signal(SIGSEGV,        signal_handler);
  install_signal(SIGNonLifo,     signal_handler);
    
  // catch all fatal errors
  install_signal(SIGILL,         signal_handler);
  install_signal(SIGABRT,        signal_handler);
  // want to use gdb always
  // install_signal(SIGEMT,         signal_handler);
  install_signal(SIGFPE,         signal_handler);
  install_signal(SIGBUS,         signal_handler);  
  install_signal(SIGSYS,         signal_handler);
  // ^Z handling
  install_signal(SIGTSTP,        Signal_Handler_t(ctrl_z_handler));
  install_signal(SIGCONT,        Signal_Handler_t(ctrl_z_handler));
  
  // Self-level signals
  if (ctrlC) {
    install_signal(SIGQUIT,      signal_handler);
    install_signal(SIGINT,       signal_handler);
  }
  install_signal(SIGIO,          signal_handler);
  install_signal(SIGUSR1,        signal_handler);
  install_signal(SIGUSR2,        signal_handler);
  install_signal(SIGPIPE,        signal_handler);
  install_signal(SIGTERM,        signal_handler);
  install_signal(SIGURG,         signal_handler);
  install_signal(SIGCHLD,        signal_handler);
  install_signal(SIGHUP,         signal_handler);
  install_signal(SIGWINCH,       signal_handler);

# if TARGET_OS_VERSION == SUNOS_VERSION
  install_signal(SIGLOST, signal_handler);
# endif
}


// SunOS always seems to signal SIGBUS, but to be safe also include SEGV
bool SignalInterface::is_map_load_signal(int sig) { return sig == SIGSEGV  || sig == SIGBUS; }


# if TARGET_OS_VERSION ==  SOLARIS_VERSION
  bool SignalInterface::is_uplevel_trap(int code) { return code == ILL_ILLTRP; }
# elif TARGET_OS_VERSION ==  SUNOS_VERSION
  bool SignalInterface::is_uplevel_trap(int code) { return code == ILL_TRAP_FAULT(ST_UpLevel); }
# elif TARGET_OS_VERSION == MACOSX_VERSION
  bool SignalInterface::is_uplevel_trap(int code) { return code == ILL_ILLOPC; }
# else
  bool SignalInterface::is_uplevel_trap(int code) { fatal("unimp"); return false; }
# endif


// ================================================================

# if  GENERATE_DEBUGGING_AIDS

// For inspecting the signal mask
static void currentMask() {
 sigset_t current_mask;

 sigprocmask(SIG_SETMASK, NULL, &current_mask);
 for(int i = 1; i < 34; i++) {
   if (sigismember(&current_mask, i)) fprintf(stderr, "Sig-%d, ", i);
 }
 fprintf(stderr, "\n");
 fflush(stderr);
}

#endif

// ==================================================================

sigset_t SignalInterface::old_mask, SignalInterface::sig_mask;
char*    SignalInterface::signal_stack;
int      SignalInterface::signal_stack_size;


void SignalInterface::install_signal(int sig, Signal_Handler_t handler) {
  struct sigaction action;
  action.sa_handler = (void (*)(int))handler;
  action.sa_mask    = sig_mask;
  action.sa_flags   = install_flags();

  if (sigaction(sig, &action, NULL) == -1) {
    perror("sigaction");
    fatal1("couldn't install signal action for signal %ld", sig);
  }
  if (sig != SIGILL && sig != SIGABRT && sig != SIGFPE && sig != SIGBUS && sig != SIGSEGV
  &&  sig != SIGSYS && sig != SIGTSTP && sig != SIGCONT && sig != SIGUSR1 && sig != SIGUSR2
  && sig != SIGPIPE && sig != SIGTERM && sig != SIGHUP && sig != SIGQUIT
  && !sigismember(&sig_mask, sig))
    fatal1("should have masked %d", sig);
}


void SignalInterface::init_sig_mask() {
  if (CheckAssertions) {
    // only block timers and SIGIO - gdb doesn't work with all signals blocked
    sigemptyset(&sig_mask);
    sigaddset(&sig_mask, SIGALRM);
    sigaddset(&sig_mask, SIGVTALRM);
    sigaddset(&sig_mask, SIGIO);
    sigaddset(&sig_mask, SIGCHLD);
    sigaddset(&sig_mask, SIGURG);
    sigaddset(&sig_mask, SIGWINCH);
    sigaddset(&sig_mask, SIGINT );
    return;
  }
  // also block other signals, but not gdb essentials
  sigfillset(&sig_mask);
  sigdelset(&sig_mask, SIGTSTP);
  sigdelset(&sig_mask, SIGTRAP);
  sigdelset(&sig_mask, SIGSEGV);
  sigdelset(&sig_mask, SIGILL);
  sigdelset(&sig_mask, SIGBUS);
  sigdelset(&sig_mask, SIGFPE);
  # if  TARGET_OS_VERSION != LINUX_VERSION
  sigdelset(&sig_mask, SIGEMT);
  # endif
}


static int32 ctrl_z_handler(int sig) {
  if (InterruptedContext::the_interrupted_context->forwarded_to_self_thread(sig))
    return 0;
  
  FlagSettingInt fs(errno, 0);  // save errno
  if (sig == SIGTSTP) {
    OS::handle_suspend_and_resume(true);
    LOG_EVENT("Control-Z");
    kill(0, SIGSTOP);
    return 0;
  } else {
    OS::handle_suspend_and_resume(false);
    return 0;
  }
}

# if  TARGET_OS_VERSION == SOLARIS_VERSION \
  ||  TARGET_OS_VERSION ==  MACOSX_VERSION \
  ||  TARGET_OS_VERSION ==  NETBSD_VERSION \
  ||  TARGET_OS_VERSION == FREEBSD_VERSION \
  ||  TARGET_OS_VERSION ==   LINUX_VERSION
#if TARGET_OS_VERSION == NETBSD_VERSION && TARGET_ARCH == I386_ARCH
__attribute__((force_align_arg_pointer))
#endif
static void signal_handler(int sig, self_code_info_t *info, self_sig_context_t *scp) {
  if (InterruptedContext::the_interrupted_context->forwarded_to_self_thread(sig))
    return;
 
  if (SignalInterface::currentNonTimerSignal || SignalInterface::currentTimerSignal) {
      fatal3("signal_handler:  cannot nest (only one interrupted context).\n"
             "Received sig %d while in sig %d or timer sig %d.\n"
             "MacOSX ApplicationEnhancer causes apps to get signals that should be blocked.",
             sig, SignalInterface::currentNonTimerSignal, SignalInterface::currentTimerSignal);
    }

    SignalInterface::currentNonTimerSignal = sig;

    sigset_t oset;
    if (sigprocmask(0, NULL, &oset) != 0) {
      perror("sigprocmask");
      fatal("sigprocmask failed");
    }
    if (!sigismember(&oset, sig))
    fatal2("signal %d is not member of 0x%x", sig, (int*)(int*)&oset);
      
    InterruptedContext::the_interrupted_context->set(scp);
    SignalInterface::handle_signal( sig, 
                                    info == NULL  ?  NULL  :  (char*)info->si_addr, 
                                    info == NULL  ?  NULL  :         info->si_code );
    InterruptedContext::the_interrupted_context->invalidate();

    SignalInterface::currentNonTimerSignal = 0;
  }


# elif TARGET_OS_VERSION == SUNOS_VERSION
  static void signal_handler(int sig, int code, self_sig_context_t *scp, char *addr) {   
    InterruptedContext::the_interrupted_context->set(scp);
    SignalInterface::handle_signal( sig, addr, code );
    InterruptedContext::the_interrupted_context->invalidate();
  }
                     
# else
  # error what?
# endif


# if  TARGET_OS_VERSION == SOLARIS_VERSION \
  ||  TARGET_OS_VERSION == MACOSX_VERSION \
  ||  TARGET_OS_VERSION == NETBSD_VERSION \
  ||  TARGET_OS_VERSION == FREEBSD_VERSION \
  ||  TARGET_OS_VERSION ==  LINUX_VERSION

void SignalInterface::init_signal_stack() {
  // ensure generic val is enough for ppc
  signal_stack_size = max(1 << 15, SIGSTKSZ); // 32K should be enough
  self_stack_t ss;
  ss.ss_sp    = signal_stack = (char*)valloc(signal_stack_size);
  ss.ss_size  = signal_stack_size;
  ss.ss_flags = 0;
  if ( sigaltstack(&ss, NULL) == -1) {
    perror("sigaltstack");
    fatal("cannot install alternate signal stack");
  }
}

# elif TARGET_OS_VERSION == SUNOS_VERSION

void SignalInterface::init_signal_stack() {
  // ensure generic val is enough for ppc
  signal_stack_size = max(1 << 15, SIGSTKSZ); // 32K should be enough
  signal_stack = (char*)valloc(signal_stack_size);
  struct sigstack ss;
  ss.ss_sp = signal_stack + signal_stack_size;     // stack grows downwards
  ss.ss_onstack = false;
  if (sigstack(&ss, NULL) == -1) {
   perror("sigstack");
  fatal("cannot install signal stack");
  }
}


void SignalInterface::wait_for_any() {
  sigpause(0);
  IntervalTimer::do_all_sync_tasks();
}

# else

  # error which?

# endif // which OS_VERSION
