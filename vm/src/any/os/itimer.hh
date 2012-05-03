/* Sun-$Revision: 30.13 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// IntervalTimers manage all periodical "tasks".  (The VM can register
// functions which get called at specified intervals.)

class TimerEntry; // defined in itimer_<os>.c


// the portable one, for a platform must
//  refine this and typedef IntervalTimer to it
class IntervalTimer {
  friend class TimerEntry;
  
 private:
  static IntervalTimer* _Real_timer;
  static IntervalTimer*  _CPU_timer;
  static const int number_of_entries = 5;
  
  enum TimerState { disabled, disabling, enabled, enabling };
  enum TimerState state;

  int32 registered;
  TimerEntry* _t;
  
 public:    
  static bool dont_use_real_timer;   // disable real-timer
  static bool dont_use_any_timer;    // disable all timers
  static bool use_real_instead_of_cpu_timer; // avoid cpu timer, breaks on OS X using X
  
  
  // The Interface:
  
 public:
  // defined per-platform
  static void init();
  static void exit();
  
  // There are two timers, and you enroll and withdraw individual activities.
  static IntervalTimer*  Real_timer() { return _Real_timer; }
  static IntervalTimer*   CPU_timer() { return use_real_instead_of_cpu_timer  ? _Real_timer  :  _CPU_timer; }
  
  // Global timer operations
  static void    start_all();
  static void   enable_all();
  static void  disable_all(bool skipAsserts);
  static void do_all_sync_tasks();


  // Self-level enroll:
  static smi  setCPUTimer_prim(smi ms);  // NB: caller must guarantee ms >= 0.
  static smi setRealTimer_prim(smi ms);  // NB: caller must guarantee ms >= 0.
  
  // VM-level matriculation (sync one does not happed at interrupt time)
  void enroll_sync(float frequency, doFn fn);    
  void enroll_async(float frequency, doFn fn);    
  void enroll_async_if_safe(float frequency, doFn fn); // not safe on Mac
  void withdraw(doFn proc);
  
  // Other per-timer operations:
  
  int32 ticks_per_second(); // for spy, profilers, etc.
  static int32 oversample_rate;
  
  void  enable();
  void  disable(bool noAsserts);
  
  
  
 private:
  IntervalTimer();
  ~IntervalTimer();
  void common_initialization();
  void common_finalization();
  
  void  start() { // start for the first time
    enable();
  }
  
  bool check_and_pre_enable() {
    if (state == enabled)
      return false;
    if (state != disabled)
      fatal("cannot enable timer that is not disabled");
    return true;
  }
  
  void post_enable() {  state = enabled; }
  
  void pre_disable()  { state = disabling;}
  void post_disable() { state = disabled; }


  

 public: // (some plats)
  void do_sync_tasks();

 private:
  TimerEntry* entries() { return _t; }
  TimerEntry* entry_at(int i); // must be defined per-platform
  bool        verify_entry_address(TimerEntry*);
  
  TimerEntry* alloc_entry();
  
  void withdraw_entry(TimerEntry*);
  void move_entry(TimerEntry* from, TimerEntry* to);
  
  smi setTimer_prim(smi ms, doFn tick_fn);
  
# include "_itimer_pd.hh.incl"

};


class AbstractTimerEntry {

 protected:

  // async is called first, then sync
  doFn async_fn; // called from interrupt routine
  doFn sync_fn;  // called synchronously
  
  bool is_ready_to_do_sync_fn; // has expired, but sync_fn has not been done yet
  bool is_doing_sync_fn;       // prevents bad recursions
  
 public:
  virtual ~AbstractTimerEntry() {};

  void initialize(doFn sp, doFn ap) { 
     sync_fn = sp;  
     async_fn = ap; 
     is_ready_to_do_sync_fn = false;
     is_doing_sync_fn = false;
  }
 
  bool includes_fn(doFn sync_or_async_fn) {
    return     sync_fn == sync_or_async_fn
           || async_fn == sync_or_async_fn;
  }
  virtual void do_sync_fn();
};

// # define DEBUG_CPUTIMER 1
// # define DEBUG_EVENTS  1

static const float check_events_freq = 
# if  GENERATE_CODE_TO_AID_DEBUGGING_CPUTIMER
  0.1;
# else
  30;
# endif

