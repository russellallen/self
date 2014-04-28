/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// a portable interface to OS signals

// Self signals are passed up to self scheduler  
// SelfSignal's are the ones that the Self scheduler gets to get
enum SelfSignal {
  sigint,
  sigquit, sigio, siguser1, siguser2, sigpipe, sigterm, sigurg,
  sigchild, sighup, sigwinch, sigrealtimer, 
  sigcputimer, last_real_SelfSignal = sigcputimer,
  sigunknown, // not really a Self signal; must be last
  last_SelfSignal = sigunknown
  };


// First, a simple data structure to track which self signals are pending
class PendingSelfSignals /* AllStatic */ {
 public:
  static const int n_SelfSignals      = last_SelfSignal       + 1; 
  static const int n_real_SelfSignals = last_real_SelfSignal  + 1;
 private:
  static VMStringsIndex  _name [n_real_SelfSignals];  // index into VMString[]
  static smi             _count[n_real_SelfSignals];  // number of outstanding signals
  
  static bool            _are_any_pending; // summary
  static bool            _know_if_any_pending; // true if field above is valid
    
  static void            check(SelfSignal s) { UsedOnlyInAssert(s); assert( 0 <= s  &&  s <= last_real_SelfSignal, "signal out of bounds");  }
  
  
 public:
  static void       init();
  static stringOop  name(      SelfSignal s)  { check(s);  return VMString[_name[s]]; }
  static smi        count(     SelfSignal s)  { check(s);  return         _count[s];  }
  static void       reset(     SelfSignal s,  smi c = 0) { check(s);  _count[s] = c;  _know_if_any_pending = false;}
  static void       increment( SelfSignal s)  { check(s);  ++_count[s];  _know_if_any_pending = _are_any_pending = true; }
  
  static smi        Self_result_size();
  static void       pass_to_Self(oop resultArg);
  static bool       are_any_pending();
  
  static smi        keyboard_signals() { return count(sigint) + count(sigquit); }
  static void reset_keyboard_signals(smi i = 0) { _count[sigint] = _count[sigquit] = i; }    
}; 


class OSToSelfSignalMapper /* AllStatic */ {
 private:
  static SelfSignal _map[Last_OS_Signal];
  
 public:
  static void init();
  static void init_platform();
  static SelfSignal map(int32 s) { 
    assert( 0 <= s  &&  s < Last_OS_Signal,  "out of range");  
    return _map[s]; 
  }
};

class SignalInterface /* AllStatic */ {

 // State:
 private:
  static bool _block_self_signals;  // don't deliver signals to Self
  static bool _initializing;        // in the midst of it
  static bool _is_in_map_load;
  
 // Public interface:
 public:
  // Initialization;
  static void  initialize( bool ctrlC = true); // called from OS::init and run_the_VM
  static bool  is_initializing()           { return _initializing; }
  
  
  // Blocking signals:
  static void    block_self_signals() { _block_self_signals = true;  }
  static void  unblock_self_signals() { _block_self_signals = false; }
  
  static bool  are_self_signals_blocked()  { return _block_self_signals; }
  static bool  BlockSignals_prim(bool); // Self-level primitive
  
  
  // Some platforms have a separate signal stack.
  // is_on...  returns true if such a stack exists and VM is currently running on it.
  // is_off... returns true if such a stack exists and VM is currently NOT running on it.
  // ( TERNARY logic; return false if not applicable )
  static bool  is_on_signal_stack(char* sp = NULL);
  static bool is_off_signal_stack(char* sp = NULL);
  
  // Similar to is_on... this test returns true if we are handling a signal resulting
  // from a map load. (Self uses load alignment signals to trap a load of an int map.)
  static bool  is_in_map_load()            { return _is_in_map_load; }
  
  
  // Self code may ask for a signal in real or CPU time.
  // The timers get their basic signals from here, then call back into here
  // to pass their signals to Self:
  static void  Self_real_timer_tick();
  static void   Self_CPU_timer_tick();
  
  // Called from Platform code with Unix-like arguments
  static void  handle_signal(int ossig, char* addr = 0, int32 code = 0);
  
  // When the VM has nothing to do, wait for any signal:
  // Caller checks preemptCause
  static void wait_for_any();                 // Wait for any signal to come in
  
  // And some miscellany:
  static void flush_input_after_ctrl_c();     // Returning to Self prompt, discard ^c's
  static void simulate_fatal_signal();
  
  
 // Internal methods:
 private:  
  // Initialization (per-platform)
  static void initialize_platform(bool ctrlC);
  
  // Self uses illegal-instruction-oidal traps to optimize map loads and uplevel traps
  static bool is_map_load_signal(int sig);
  static bool is_uplevel_trap(int code );
  
  // Handle a signal normally passed on to Self code:
  static void         handle_Self_signal( SelfSignal ssig); // Also called from itimer.c at timer interrupts
  static void  safely_handle_Self_signal( SelfSignal ssig );  // helper for above 
  
  // Handle an OS signal not passed on to Self code
  static void handle_OS_signal(int32 ossig, char* addr = 0, int32 code = 0);
  // Handle an OS signal for SIC not passed on to Self code, return true if handled
  static bool handle_SIC_OS_signal(int32 ossig, char* addr, int32 code);
 
  
  # include "_sig_pd.hh.incl"  

};
