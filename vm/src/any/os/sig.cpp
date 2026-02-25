/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "sig.hh"
# pragma implementation "sig_abstract.hh"
# pragma implementation "sig_inline.hh"

# include "_sig.cpp.incl"


VMStringsIndex PendingSelfSignals::_name [n_real_SelfSignals];
smi            PendingSelfSignals::_count[n_real_SelfSignals];
bool           PendingSelfSignals::_are_any_pending;
bool           PendingSelfSignals::_know_if_any_pending;


void PendingSelfSignals::init() {
  assert(sigint == 0,  "code assumes that first sig is set to zero");

  _are_any_pending     = false;
  _know_if_any_pending = true;
  
  for ( int i = 0;  i < sizeof(_name)/sizeof(_name[0]);  ++i) {
    _name [i] = SIG_UNKNOWN;
    _count[i] = 0;
  }
  _name[ sigint        ] = SIG_INT;
  _name[ sigquit       ] = SIG_QUIT;
  _name[ sigio         ] = SIG_IO; 
  _name[ siguser1      ] = SIG_USER1; 
  _name[ siguser2      ] = SIG_USER2; 
  _name[ sigpipe       ] = SIG_PIPE; 
  _name[ sigterm       ] = SIG_TERM; 
  _name[ sigurg        ] = SIG_URG; 
  _name[ sigchild      ] = SIG_CHILD; 
  _name[ sighup        ] = SIG_HUP; 
  _name[ sigwinch      ] = SIG_WINCH; 
  _name[ sigrealtimer  ] = SIG_REALTIMER; 
  _name[ sigcputimer   ] = SIG_CPUTIMER; 
}
    

smi PendingSelfSignals::Self_result_size() {
  return 2 * n_real_SelfSignals  +  1;
}

void PendingSelfSignals::pass_to_Self(oop resultArg) {
  if (SignalInterface::are_self_signals_blocked())
    fatal("signals are blocked -- shouldn't transfer");
  // must block interrupts to avoid interference from signal_handler
  { SignalBlocker sb;
    fint index = 1;
    for (fint i = 0;
              i < n_real_SelfSignals;  
            ++i ) {
      smi c = count(SelfSignal(i));
      if ( c != 0) {
        resultArg->obj_at_put(index++, name(SelfSignal(i)));
        resultArg->obj_at_put(index++, as_smiOop(c));
        reset(SelfSignal(i));
      }
    }
    _are_any_pending = false;
    _know_if_any_pending = true;
    resultArg->obj_at_put(0, as_smiOop(index / 2));
  }
}


bool PendingSelfSignals::are_any_pending() {
  bool r = false;
  for (  fint i = 0;
              i < n_real_SelfSignals;
            ++i) {
    if ( count(SelfSignal(i)) != 0) {
      r = true;
      break;
    }
  }
  _are_any_pending = r;
  _know_if_any_pending = true;
  return r;
}

// ===============================================================

SelfSignal OSToSelfSignalMapper::_map[Last_OS_Signal];

void OSToSelfSignalMapper::init() {
  for ( int32 i = 0;  i < Last_OS_Signal;  i++)
    _map[i] = sigunknown;
    
  init_platform();
}

// ===============================================================


bool SignalInterface::_block_self_signals  = false; 
bool SignalInterface::_initializing        = false;
bool SignalInterface::_is_in_map_load      = false;


void SignalInterface::initialize(bool ctrlC) {
  _initializing = true;
  _is_in_map_load = false;
  PendingSelfSignals::init();
  OSToSelfSignalMapper::init(); // virtual so cannot do in constructor
  _initializing = !ctrlC;
  initialize_platform(ctrlC);
}


bool SignalInterface::BlockSignals_prim(bool b) {
  bool old = SignalInterface::are_self_signals_blocked();
  if (b) {
    SignalInterface::block_self_signals();
    if (old) warning("_BlockSignals: signals already blocked");
  } 
  else {
    SignalInterface::unblock_self_signals();
    //  LOG_EVENT("unblocking signals");
    if (PendingSelfSignals::are_any_pending()) {
      // make sure the switch happens soon
      currentProcess->setupPreemption();
    }
  }
  return old;
}  


// for timers started by Self primitives:

void SignalInterface::Self_real_timer_tick() { handle_Self_signal( sigrealtimer ); }
void SignalInterface:: Self_CPU_timer_tick() { handle_Self_signal( sigcputimer  ); }


// Called from platfom signal handler, with Unix-like arguments

void SignalInterface::handle_signal(int ossig, char* addr, int32 code) {
  if (!(0 <= ossig  &&  ossig < Last_OS_Signal))
    fatal1("handle_signal: signal %d out of bounds", ossig);
  SelfSignal ssig = OSToSelfSignalMapper::map(ossig);
  if (ssig == sigunknown)    handle_OS_signal( ossig, addr, code);
  else                       handle_Self_signal( ssig );
}


void SignalInterface::flush_input_after_ctrl_c() {
  if ( PendingSelfSignals::keyboard_signals() != 0 ) {
    abortSelf();        // to flush stdin
    PendingSelfSignals::reset_keyboard_signals();
  }
}

    
void SignalInterface::simulate_fatal_signal() {
  InterruptedContext::the_interrupted_context->set();
  AbortContext.invalidate();
  InterruptedContext::fatal_menu();
}


// After OS signal has been translated to a Self-scheduler-aware
// signal, call me.
void SignalInterface::handle_Self_signal(SelfSignal ssig) {
  const int max_ctrl_c = 5;
  FlagSettingInt fs(errno, 0);  // save errno
  safely_handle_Self_signal(ssig);
  
  smi kbs = PendingSelfSignals::keyboard_signals();
  if  ( kbs < max_ctrl_c )
    return; // OK
    
  if  ( kbs == max_ctrl_c ) {
    warning("press one more ^\\ or ^C to force abort");
    return ;
  }

  OS::handle_suspend_and_resume(true);                // set stdin to normal mode
  lprintf("\nDo you really want to force a 'hard' abort (y/n)? ");
  char c[255];
  c[0] = '\0';
  if (fgets(c, sizeof(c), stdin) == NULL) {
    lprintf("\nError while reading answer, quitting.");
    OS::terminate(1);
  }
  if (c[0] == 'y') {
    fatal("forced ^\\ abort");
  } 
  else {
    lprintf("--- not aborted.\n");
    PendingSelfSignals::reset_keyboard_signals(1);
  }
}


void SignalInterface::safely_handle_Self_signal(SelfSignal ssig) {
  // was called from Mac timer interrupt,
  // the safely referred to the fact that it is so easy to crash mac by
  //  e.g., printing
  PendingSelfSignals::increment(ssig);
  if (are_self_signals_blocked())
    return; // no more for now
    
  if (preemptCause == cNoCause) 
    preemptCause = cSignal;
    
  if ( twainsProcess != NULL
  ||   PendingSelfSignals::keyboard_signals() != 0
  ||   need_preemptor_for_timer )
    preemptor();
}


// Handle an OS signal that won't be passed to Self
void SignalInterface::handle_OS_signal(int ossig, char* addr, int32 code) {

  FlagSettingInt fs(errno, 0);  // save errno

  if (eventLog != NULL) // might not exist yet
    LOG_EVENT3("signal %ld pc %#lx npc %#lx",
               ossig, InterruptedContext::the_interrupted_context->pc(), InterruptedContext::the_interrupted_context->next_pc());
            
  # if TARGET_OS_VERSION != MACOSX_VERSION
  assert(!is_off_signal_stack(), "should be on interrupt stack");
  # endif
  // Linux???
  
  if (handle_SIC_OS_signal(ossig, addr, code))
    return;
# if TARGET_OS_VERSION == LINUX_VERSION
  lprintf("\nInternal error: signal %d code %d addr 0x%lx pc 0x%lx.\n",
         (void*)ossig, (void*)code, (void*)(long unsigned)addr,
         (void*)(long unsigned)(InterruptedContext::the_interrupted_context->pc()));
# elif TARGET_OS_VERSION == SOLARIS_VERSION
  lprintf("\nInternal error: signal %d (sig%s) code %d addr 0x%lx pc 0x%lx.\n",
          (void*)ossig, (void*)strsignal(ossig),
          (void*)code, (void*)(long unsigned)addr,
          (void*)(long unsigned)(InterruptedContext::the_interrupted_context->pc()));
# else
  lprintf("\nInternal error: signal %d (sig%s) code %d addr 0x%lx pc 0x%lx.\n",
         (void*)ossig, (void*)sys_signame[ossig],
         (void*)code, (void*)(long unsigned)addr,
         (void*)(long unsigned)(InterruptedContext::the_interrupted_context->pc()));
# endif
  error_breakpoint();
  if (WizardAbortMode) {
    // for better VM debugging - see regs and stack undisturbed, but
    // printing/traversing Self stack may break
    InterruptedContext::fatal_menu();
  } 
  else {
    // let user print the stack etc; easier to do in user context
    WizardAbortMode = true; // next bit might fail over and over
    InterruptedContext::continue_abort_at(first_inst_addr(InterruptedContext::fatal_menu), true);
    AbortContext.set(InterruptedContext::the_interrupted_context);
  }
}


bool SignalInterface::handle_SIC_OS_signal(int ossig, char* addr, int32 code) {
  InterruptedContext::the_interrupted_context->must_be_in_self_thread();
  
  assert( !(ossig == SIGNonLifo && code == ST_ShouldNeverHappen),
          "SIC compiler error: should never get to this trap instruction");

  if ( FastMapTest
  &&   is_map_load_signal(ossig)
  &&   isMapLoad((int32*)InterruptedContext::the_interrupted_context->pc())) {
    FlagSetting fs2(_is_in_map_load, true);
    handleMapLoadTrap(InterruptedContext::the_interrupted_context);
    return true;
  }
  if (ossig == SIGUncommon && handleUncommonTrap())
    // was uncommon branch trap
    return true;
    
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  if ( (ossig == SIGNonLifo     &&  is_uplevel_trap(code))
  ||   (ossig == SIGBadHomeRef  &&  NLRSupport::is_bad_home_reference(addr)
                                &&  Memory->code->contains(InterruptedContext::the_interrupted_context->pc()))) {
    // continue in NLRSupport::non_lifo_abort
    // This is much easier than doing it here because the stack is in a mess right now.
    InterruptedContext::continue_abort_at(first_inst_addr(NLRSupport::non_lifo_abort_from_continuePC), false);
    return true;
  }
# endif 

  return false;
}
