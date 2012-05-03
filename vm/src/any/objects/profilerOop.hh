/* Sun-$Revision: 30.9 $ $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// A profilerOop is an object collect profiling information from
// a single Self process.

class profilerOopClass : public slotsOopClass {
 protected:
  Profiler* _profiler;
  oop       _process; // process to which I'm attached

  profilerOop addr()             { return (profilerOop)slotsOopClass::addr(); }

  void       set_process(oop p) { Memory->store((oop*)&addr()->_process, p); }
  processOop get_process()      { return (processOop)addr()->_process; }
  processOop illegal_process()  { return (processOop) smiOop_zero; }

 public:
  // Accessing
  void       set_profiler(Profiler* prof) { addr()->_profiler = prof; }
  Profiler*  get_profiler()     { return addr()->_profiler; }


  // Primitives

  oop ProfilerProcess_prim(void *FH);
  // fails with: 
  //  NOPROCESSERROR if profiler is passive.
  // returns the processOop beeing observed..

  oop ProfilerEngage_prim(oop process, void *FH);
  // fails with: 
  //  BADTYPEERROR  if argument is not a processOop.
  //  NOPROCESSERROR if argument has no real process.
  // returns the processOop.

  oop ProfilerDisengage_prim(void *FH);
  // fails with:
  //  NOPROCESSERROR if profiler is not engaged.
  // returns the engaged processOop.

  oop ProfilerReset_prim();

  oop ProfilerTicks_prim(oop tick_pt, void *FH);           

  oop ProfilerTimes_prim(oop time_pt, void *FH);

  oop ProfilerCopyGraph_prim(oop method_pt, oop block_pt, oop access_pt,
                             oop prim_pt,   oop leaf_pt,  oop fold_pt, 
                             oop unknown_oop, smi cutoff, void *FH);
  // returns the call graph with annotated nodes.

  oop ProfilerPrint_prim(float cutoff);
  // Print a VM low level dump of the call graph;

  bool is_active() { return get_process() != illegal_process(); }

  void initialize(); // Initialize all instance variables
};
