/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "itimer.hh"
# pragma implementation "itimer_abstract.hh"
# pragma implementation "itimer_inline.hh"
# include "_itimer.cpp.incl"

// entries

IntervalTimer* IntervalTimer::_Real_timer = NULL;
IntervalTimer* IntervalTimer::_CPU_timer  = NULL;

bool IntervalTimer::dont_use_real_timer = false;
bool IntervalTimer::dont_use_any_timer  = false;
bool IntervalTimer::use_real_instead_of_cpu_timer = false;

// Changed by -o argument; see processArguments() in shell.cpp
int32 IntervalTimer::oversample_rate = 1;

// initialization & finalization

void IntervalTimer::common_initialization() { registered = 0;  state = disabled; }
void IntervalTimer::common_finalization()   { disable(true);      };

void IntervalTimer::exit() {
  disable_all(true); // needed to not crash mac
}


// primitive implementations:

smi IntervalTimer::setRealTimer_prim(smi ms) { return Real_timer()->setTimer_prim(ms, SignalInterface::Self_real_timer_tick); }
smi IntervalTimer:: setCPUTimer_prim(smi ms) { return  CPU_timer()->setTimer_prim(ms, SignalInterface::Self_CPU_timer_tick); }

smi IntervalTimer::setTimer_prim(smi ms, doFn tick_fn)  {
  assert(ms >= 0, "negative ms");
  withdraw(tick_fn);
  if (ms) 
    enroll_async_if_safe( 1000.0 / float(ms), tick_fn );
  return ms;
}


// ensemble operations:

void IntervalTimer::start_all() {
  Real_timer()->start();
  if (use_real_instead_of_cpu_timer)
    return;
  CPU_timer()->start();
}

void IntervalTimer::disable_all(bool skipAsserts) {
  Real_timer()->disable(skipAsserts);
  if (use_real_instead_of_cpu_timer)
    return;
  CPU_timer()->disable(skipAsserts);
}

void IntervalTimer::enable_all() {
  Real_timer()->enable();
  if (use_real_instead_of_cpu_timer)
    return;
  CPU_timer()->enable();
}

void IntervalTimer::do_all_sync_tasks() {
  Real_timer()->do_sync_tasks();
  if (use_real_instead_of_cpu_timer)
    return;
  CPU_timer()->do_sync_tasks();
}


// Enrolling, etc.

void IntervalTimer::withdraw(doFn sync_or_async_fn) {
  fint i = 0;
  for (  ;  
           i < registered  &&  !((AbstractTimerEntry*)entry_at(i))->includes_fn( sync_or_async_fn );
         ++i) {
  }
  if ( i == registered ) {
    // function wasn't registered
    // missing entry, but setCPUTimer_prim does this, so OK
    return;
  }
  
  TimerEntry* e  = entry_at(i);
  withdraw_entry(e);
  if (i + 1  ==  registered) {
    --registered;
    assert(0 <= registered  &&  registered < number_of_entries, "registered out of range");
  }
  else { // reclaim non-last entry by using it for last one
    --registered;
    TimerEntry* e1 = entry_at(registered);
    move_entry(e1, e);
  }
}


// Utilities:

TimerEntry* IntervalTimer::alloc_entry() {
  if (registered >= number_of_entries)
    fatal2("out of interval timers, increase IntervalTimer::number_of_entries and recompile Self\n"
           "(registered = %d, number_of_entries = %d)",
           registered, 
           number_of_entries);
  return entry_at(registered++);
}

bool IntervalTimer::verify_entry_address(TimerEntry* te) {
  if (entries() <= te  &&  te < entry_at(number_of_entries)) ;
  else return false; // Timer entry is out of range
  
  int   offset = (char*)entry_at(1) - (char*)entry_at(0);
  if ( ((char*)te - (char*)entry_at(0)) % offset  ==  0 ) ;
  else return false; // not aligned
  
  return true;
}


void IntervalTimer::do_sync_tasks() {
  if (state != enabled)
    return;
  // This calls sync_fn's which may recurse back in here!
  for ( fint i = 0;  i < registered;  ++i)
    ((AbstractTimerEntry*)entry_at(i))->do_sync_fn();
}


void AbstractTimerEntry::do_sync_fn() {
  if (!is_ready_to_do_sync_fn  ||  is_doing_sync_fn) 
    return;
  if (sync_fn == NULL)      fatal("interval timer error");
  
  is_doing_sync_fn = true;
  
  doFn p = sync_fn;
  if (p != (doFn)-1)
    (*p)();
    
  is_ready_to_do_sync_fn = false;
  is_doing_sync_fn = false;
}

