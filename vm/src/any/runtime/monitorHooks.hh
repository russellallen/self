/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// Classes used by the monitor (spy) to gather data


// First, a utility class:


// keeps a sliding average over the last N values
class SlidingAverage : public CHeapObj {
  int32* values;
  fint n;           // window size
  fint index;       // next value to use
  int32 _sum;       // sliding sum
 public:
  SlidingAverage(fint N) {
    assert(N > 0, "must be positive");
    n = N; values = (int32*)AllocateHeap(N * sizeof(int32), "spy avg"); reset();
  }
  ~SlidingAverage() { delete values; }
  void reset() { 
    index = 0; _sum = 0;
    for (fint i = 0; i < n; ++i) values[i] = 0;
  }
  void add(int32 v) {
    _sum -= values[index];  values[index] = v; _sum += v;
    index = index == n - 1 ? 0 : index + 1;
  }
  int32 average() { return _sum / n; }
  int32 sum()     { return _sum; }
};


// Now, classes that are used by the VM to inform the spy:
 

// The Show... classes inform the monitor merely be being instantiated:

class ShowLookupInMonitor {
 public:
  static fint lookup_nesting;  // > 0 means lookup in progress
  
  ShowLookupInMonitor()  { ++lookup_nesting; }
  ~ShowLookupInMonitor() { --lookup_nesting; }
};


class ShowCompileInMonitor: CHeapObj {
  friend class ExecutionMonitor;
  friend class SelfMonitor;
  
  void do_show_compile(oop selector, const char* compiler, bool opt);
  static const char* current_compiler_name;
  static fint* current_compiler_ticks;
  static fint  compiler_ticks[2];
  static fint  all_ticks() { return compiler_ticks[0] + compiler_ticks[1]; }
  static bool  recompiling;
  static const char* old_method_being_compiled;

 public:
  static const char*     method_being_compiled;
  ShowCompileInMonitor(oop selector, const char* compiler, bool optimize);
  ~ShowCompileInMonitor();
  static bool method_changed();
};


class ResetMonitor: CHeapObj {
 public:
  ResetMonitor();
};


class ShowVMActivityInMonitor: CHeapObj { 
  const char* old_activity;
 public:
  static const char* current_activity;
  
  ShowVMActivityInMonitor(const char* what);
  ~ShowVMActivityInMonitor();
};


class ShowContextSwitchInMonitor: CHeapObj {
  static int32 _context_switches;
 public:
  ShowContextSwitchInMonitor()    { ++_context_switches; }
  static int32 context_switches() { return _context_switches; }
};


// The Track... classes need more than mere instantiation...

class TrackCHeapInMonitor /* AllStatic */ {
 private:
  
  // for unix, _allocated starts at 0, and is updated by malloc/free
  // for mac,  _allocated starts at processSize - FreeMem(), also updated by malloc/free
  // must be static to work from start of VM
  static int32 _allocated;             // bytes allocated with malloc()
  
 public:
  static void  adjust(int32 delta);
  static int32 allocated();
  static void  reset();
  static void  set_allocated(int32);
};
  

class TrackObjectHeapInMonitor /* AllStatic */ {
 private:
  static bool _reserve_changed;
  
 public:
  static void recreate_old_bars();
  static void reserve_changed();
  static bool has_reserve_changed();
  static fint new_capacity();
  static fint old_capacity();
  static fint   n_spaces();
  static fint old_used();
  static fint old_VM_reserved_memory();
  static fint old_low_space_threshold();
};
