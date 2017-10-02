/* Sun-$Revision: 30.8 $ $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "byteVectorOop.hh"
# include "debug.hh"
# include "files.hh"
# include "glueSupport.hh"
# include "interruptedCtx.hh"
# include "label_inline.hh"
# include "nprofiler.hh"
# include "preserve.hh"
# include "profilerMap.hh"
# include "profilerOop.hh"
# include "runtime.hh"
# include "scanner.hh"
# include "shell.hh"
# include "stringMap.hh"
# include "vmStrings.hh"
# include "zone.hh"


void profilerOopClass::initialize() {
  set_process(illegal_process());
  set_profiler(NULL);
}

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

# define TRACE(str) \
    // fprintf(stderr, "(profiler-trace %s)\n", str)

oop profilerOopClass::ProfilerProcess_prim(void *FH) {
  TRACE("process");
  if (!is_active()) {
    prim_failure(FH, NOPROCESSERROR);
    return NULL;
  }
  return get_process(); 
}

oop profilerOopClass::ProfilerEngage_prim(oop process, void *FH) {
  TRACE("engage");
  // Fail if argument it is not a process
  if(!process->is_process() ) {
    prim_failure(FH, BADTYPEERROR);
    return NULL;
  } 
  processOop p = processOop(process);

  // Fail if argument has no real process (see processOop.c, checkProcess)
  if(!p->process() || p->process()->processObj() != p ) {
    // dead process or a clone of a process obj
    prim_failure(FH, NOPROCESSERROR);
    return NULL;
  }

  if (get_profiler() == NULL) {
    set_profiler(new Profiler(this));
  }
  
  set_process(p);
  get_profiler()->engage(p->process());

  return (oop) this;
}

oop profilerOopClass::ProfilerDisengage_prim(void *FH) {
  TRACE("disengage");
  processOop process = get_process();

  if (!is_active()) {
    // No profiler active for this 
    prim_failure(FH, NOPROCESSERROR);
    return NULL;
  }

  assert(process->process()->profiler, "Profiler should be present");

  process->process()->profiler->disengage();
  process->process()->profiler = NULL;

  set_process(illegal_process());

  return (oop) this;
}

oop profilerOopClass::ProfilerReset_prim() {
  TRACE("reset");
  Profiler* prof = get_profiler();
  if (prof) delete prof;
  initialize();
  return (oop) this;
}


oop profilerOopClass::ProfilerTicks_prim(oop tick_pt, void *FH) {
  TRACE("ticks");

  if (!get_profiler()) {
    prim_failure(FH, NOPROFILINGINFOERROR);
    return NULL;
  }
  if (!tick_pt->is_slots()) {
    prim_failure(FH, BADTYPEERROR);
    return NULL;
  }
  oop tick_node = get_profiler()->copy_tick_info(tick_pt);
  if (tick_node == failedAllocationOop) {
    out_of_memory_failure(FH);
    return NULL;
  }
  return tick_node;
}

oop profilerOopClass::ProfilerTimes_prim(oop time_pt, void *FH) {
  TRACE("timesd");

  if (!get_profiler()) {
    prim_failure(FH, NOPROFILINGINFOERROR);
    return NULL;
  }
  if (!time_pt->is_slots()) {
    prim_failure(FH, BADTYPEERROR);
    return NULL;
  }
  oop time_node = get_profiler()->copy_time_info(time_pt);
  if (time_node == failedAllocationOop) {
    out_of_memory_failure(FH);
    return NULL;
  }
  return time_node;
}

oop profilerOopClass::ProfilerPrint_prim(float cutoff) {
  TRACE("call-print");
  get_profiler()->printProfile(cutoff);
  return (oop) this;
}

oop profilerOopClass::ProfilerCopyGraph_prim(oop method_pt, oop block_pt, 
                                             oop access_pt, oop prim_pt,
                                             oop leaf_pt,   oop fold_pt,
                                             oop unknown_oop, smi cutoff,
                                             void *FH) {
  TRACE("call-graph");

  if (!get_profiler()) {
    prim_failure(FH, NOPROFILINGINFOERROR);
    return NULL;
  }

  // check method_pt, block_pt, and prim_pt are vector objects and
  // access_t, leaf_pt and fold_pt are slot objects.
  if (! method_pt->is_objVector() ||
      ! block_pt->is_objVector()  ||
      ! prim_pt->is_objVector()   ||
      ! access_pt->is_slots()     ||
      ! leaf_pt->is_slots()       ||
      ! fold_pt->is_slots()) {
    prim_failure(FH, BADTYPEERROR);
    return NULL;
  }

  oop call_graph = get_profiler()->
                      copy_call_graph(method_pt, block_pt, access_pt, 
                                      prim_pt,   leaf_pt,  fold_pt,
                                      unknown_oop, cutoff);

  if (call_graph == failedAllocationOop) {
    out_of_memory_failure(FH);
    return NULL;
  }
  return call_graph;
}

# else // defined(FAST_COMPILER) || defined(SIC_COMPILER)

oop profilerOopClass::ProfilerProcess_prim(void *FH) {
  Unused(FH);  return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
}
oop profilerOopClass::ProfilerEngage_prim(oop process, void *FH) {
  Unused(process); Unused(FH);  return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
}
oop profilerOopClass::ProfilerDisengage_prim(void *FH) {
  Unused(FH);  return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
}
oop profilerOopClass::ProfilerReset_prim() {
  return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
}
oop profilerOopClass::ProfilerTicks_prim(oop tick_pt, void *FH) {
  Unused(tick_pt); Unused(FH);  return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
}
oop profilerOopClass::ProfilerTimes_prim(oop time_pt, void *FH) {
  Unused(time_pt); Unused(FH);  return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
}
oop profilerOopClass::ProfilerPrint_prim(float cutoff) {
  Unused(cutoff);  return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
}
oop profilerOopClass::ProfilerCopyGraph_prim(oop method_pt, oop block_pt, 
                                             oop access_pt, oop prim_pt,
                                             oop leaf_pt,   oop fold_pt,
                                             oop unknown_oop, smi cutoff, 
                                             void *FH) {
  Unused(method_pt); Unused(block_pt); Unused(access_pt);
  Unused(prim_pt);   Unused(leaf_pt);  Unused(fold_pt);
  Unused(unknown_oop); Unused(FH);  
  return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
