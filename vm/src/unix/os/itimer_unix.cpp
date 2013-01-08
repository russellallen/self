/* Sun-$Revision: 30.19 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "itimer_unix.hh"
# include "_itimer_unix.cpp.incl"


extern "C" { void IntervalTimerTick(int sig, self_code_info_t *info, self_sig_context_t *scp); }


class TimerEntry: public AbstractTimerEntry {
 private:
  int32 divisor;
  int32 count;
  
 public:
 
  void initialize(doFn sp, doFn ap, int32 factor) {
    AbstractTimerEntry::initialize(sp, ap);
    factor   *= IntervalTimer::oversample_rate; // for profiler debugging
    divisor   = factor;
    count     = 0;
  }
  
  void do_procs_if_needed() {
    if ( is_ready_to_do_sync_fn || is_doing_sync_fn )
      return; // avoid races
      
    if (++count >= divisor) {
      count = 0;
      if (async_fn != (doFn)-1)  async_fn();
      if ( sync_fn != (doFn)-1)  is_ready_to_do_sync_fn = true;
    }
  }
};


#if TARGET_OS_VERSION != SOLARIS_VERSION && TARGET_OS_VERSION != MACOSX_VERSION && TARGET_OS_VERSION != LINUX_VERSION
extern "C" int setitimer(int which,
                         struct itimerval *value,
                         struct itimerval *ovalue);
#endif

// initing the timers

void IntervalTimer::init() {
  assert(Real_timer() == NULL,  "must only init itimers once");
  
  _Real_timer = new IntervalTimer( SIGALRM,   ITIMER_REAL);
   _CPU_timer = new IntervalTimer( SIGVTALRM, ITIMER_VIRTUAL);

  // For Carbon Windows under OSX: 
  // sync, not async to avoid races in event queue code
  // -- dmu 9/01
  Real_timer()->enroll_sync(check_events_freq, OS::check_events );
}


int32 IntervalTimer::ticks_per_second() { return 100; }


// constructors & destructors

IntervalTimer::IntervalTimer(int s, int t) {
  common_initialization();
  _t = new TimerEntry[number_of_entries];

 sig = s;
 timer = t;
}


IntervalTimer::~IntervalTimer() {}


// enabling/disabling a timer:


// cannot be done in initializer because signal stack does not exist yet

void IntervalTimer::enable() {
  if (dont_use_any_timer) return;                     // no timers wanted
  if (dont_use_real_timer && sig == SIGALRM) return;  // don't install real timer
  if (!check_and_pre_enable()) return;
  
  static struct itimerval dt;          // value for activating timer

  dt.it_value.tv_sec  = dt.it_interval.tv_sec  = 0;
  dt.it_value.tv_usec = dt.it_interval.tv_usec = 1000000 / ticks_per_second() / oversample_rate; 
  
  struct sigaction action;
# if  TARGET_OS_VERSION == SOLARIS_VERSION \
  ||  TARGET_OS_VERSION ==  MACOSX_VERSION \
  ||  TARGET_OS_VERSION ==   LINUX_VERSION
  action.sa_sigaction = (void (*)(int, siginfo_t*, void*)) IntervalTimerTick;
  
# elif COMPILER != GCC_COMPILER  &&  TARGET_OS_VERSION == SUNOS_VERSION
  action.sa_handler = (void (*)()) IntervalTimerTick;
# else
  # error which?
# endif

  action.sa_flags   = SignalInterface::install_flags();
 
  sigfillset(&action.sa_mask);
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      sigdelset(&action.sa_mask, SIGINT);
      sigdelset(&action.sa_mask, SIGTSTP);
      sigdelset(&action.sa_mask, SIGTRAP);
    }
# endif
  sigdelset(&action.sa_mask, SIGILL);
  sigdelset(&action.sa_mask, SIGFPE);
  sigdelset(&action.sa_mask, SIGSEGV);

  if (sigaction( sig, &action, NULL) == -1) {
    perror("sigaction");
    fatal1("couldn't install signal handler for signal %ld", sig);
  }
  if (!sigismember(&action.sa_mask, sig) || !sigismember(&SignalInterface::sig_mask, sig))
    fatal1("should have masked %d", sig);
    
  if (setitimer(timer, &dt, NULL)) fatal("cannot start timer!");
  
  post_enable();
}


void IntervalTimer::disable(bool) {
  pre_disable();
  static struct itimerval dt0;         // to deactivate (all zero)
  dt0.it_value.tv_sec = dt0.it_value.tv_usec = 0;
  if (setitimer(timer, &dt0, NULL))
    fatal("cannot reset timer!");
  // in OS X: can get timer killing process, try SIG_IGN instead of SIG_DFL
  (void)signal( sig, SIG_IGN);
  post_disable();
}  


// enrolling/withdrawing tasks


void IntervalTimer::enroll_async(float freq, doFn fn) {
  TimerEntry* e = alloc_entry();
  int32 factor = (int32) rint(float(ticks_per_second()) / freq);
  e->initialize((doFn)-1, fn, factor);
}


void IntervalTimer::enroll_sync(float freq, doFn fn) {
  TimerEntry* e = alloc_entry();
  int32 factor = (int32) rint(float(ticks_per_second()) / freq);
  e->initialize(fn, (doFn)-1, factor);
}


void IntervalTimer::enroll_async_if_safe(float freq, doFn fn) {
  # if TARGET_OS_VERSION == LINUX_VERSION
    enroll_sync(freq, fn); // Fix spy crash
  # else
   enroll_async(freq, fn);
  # endif
}


void IntervalTimer::withdraw_entry(TimerEntry*) {}

void IntervalTimer::move_entry(TimerEntry* from, TimerEntry* to) { *to = *from; }


#define SIGNONE -1

void IntervalTimerTick(int sig, self_code_info_t *info, self_sig_context_t *scp) {
  // A Mac OS X application, ApplicationEnhancer, causes the VM to receive nested
  // SIGALRM/SIGVTALRM signals.
  // We don't know why this is happening, since our call to sigaction (where
  // the SIGALRM/SIGVTALRM handlers are installed) specified that we don't want
  // recursive timer signals.
  // As a workaround to this funny behaviour induced by ApplicationEnhancer, we
  // check if we're in a recursive SIGALRM/SIGVTALRM handler.  If we receive a
  // recursive SIGALRM/SIGVTALRM signal, then we immediately return from the
  // signal handler.  This is OK since it's not a catastrophe if we ignore a
  // timer signal. -mabdelmalek 10/02
  
  // Now we are getting SIGIO's while in the SIGVTALRM handler, maybe
  // caused by ApplicationEnhancer--argh! -- dmu 6/03
  
  if (InterruptedContext::the_interrupted_context->forwarded_to_self_thread(sig))
    return;
  
  if (SignalInterface::currentNonTimerSignal || SignalInterface::currentTimerSignal) {
    static bool haveWarned = false;
    if (!haveWarned) {
# if TARGET_OS_VERSION == LINUX_VERSION
      warning3("IntervalTimerTick: signal_handler cannot nest (only one interrupted context).\n"
               "Received timer sig %d while in sig %d or timer sig %d.\n"
               "MacOSX ApplicationEnhancer causes apps to get signals that should be blocked.",
               sig, 
               SignalInterface::currentNonTimerSignal,
               SignalInterface::currentTimerSignal);
# else
      warning6("IntervalTimerTick: signal_handler cannot nest (only one interrupted context).\n"
               "Received timer sig %d (sig%s) while in sig %d (sig%s) or timer sig %d (sig%s).\n"
               "MacOSX ApplicationEnhancer causes apps to get signals that should be blocked.",
               sig, sys_signame[sig],
               SignalInterface::currentNonTimerSignal, sys_signame[SignalInterface::currentNonTimerSignal],
               SignalInterface::currentTimerSignal, sys_signame[SignalInterface::currentTimerSignal]);
# endif
      haveWarned = true;
    }
    return;
  }           
  SignalInterface::currentTimerSignal = sig;       

  // this is called at every tick of our timer
  if (processSemaphore || IntervalTimer::dont_use_any_timer) {
    // We're in a critical region, so return from the timer interrupt 
    // without overwriting InterruptedContext::the_interrupted_context.
    // The check for dont_use_any_timer is for better debugging with gdb.

    SignalInterface::currentTimerSignal = 0;
    return;
  }
  
# if TARGET_OS_VERSION != MACOSX_VERSION
  // The following assertion fails on Mac OS X when ApplicationEnhancer is running.
  // Since it's not critical that we execute on a signal stack, we can skip
  // the assertion.  -mabdelmalek 10/02
  assert(SignalInterface::is_on_signal_stack(), "should be on interrupt stack");
# endif
  assert(!IntervalTimer::dont_use_any_timer, "should not have timer interrupts");
  
  InterruptedContext::the_interrupted_context->set(scp);

  IntervalTimer* t =  sig == SIGALRM ? IntervalTimer::Real_timer() 
                                     : IntervalTimer:: CPU_timer();
  t->do_async_tasks();
  
  if ( PendingSelfSignals::keyboard_signals() != 0 ) 
    preemptor();
        
  InterruptedContext::the_interrupted_context->invalidate();

  SignalInterface::currentTimerSignal = 0;

  if (IntervalTimer::dont_use_any_timer  && sig == SIGVTALRM)
    IntervalTimerTick(SIGALRM, info, scp);  // simulate real timer
  }


void IntervalTimer::do_async_tasks() {
  for ( fint i = 0;  i < registered;  ++i)
    entry_at(i)->do_procs_if_needed();
}

TimerEntry* IntervalTimer::entry_at(int i) { return &entries()[i]; }

