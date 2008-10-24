/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "monitorHooks.hh"

# include "_monitorHooks.cpp.incl"

fint  ShowLookupInMonitor::lookup_nesting = 0;
const char* ShowVMActivityInMonitor::current_activity = NULL;
const char* ShowCompileInMonitor::method_being_compiled = NULL;
const char* ShowCompileInMonitor::old_method_being_compiled = NULL;
const char* ShowCompileInMonitor::current_compiler_name = NULL;
fint* ShowCompileInMonitor::current_compiler_ticks = NULL;
fint  ShowCompileInMonitor::compiler_ticks[2] = {0, 0};
bool  ShowCompileInMonitor::recompiling = false;
int32 TrackCHeapInMonitor::_allocated = 0;
int32 ShowContextSwitchInMonitor::_context_switches = 1; // prevent zero divide


void TrackCHeapInMonitor::adjust(int32 delta) {
  if (bootstrapping)  return;
  _allocated += delta;
  if (allocated() < 0) {
    static bool warned = false;
    if (!warned  &&  TARGET_ARCH == SPARC_ARCH) {
      warning("_allocated went negative");
      warned = true;
    }
    _allocated = 0;
  }
}


int32 TrackCHeapInMonitor::allocated() {
  return _allocated;
}


void TrackCHeapInMonitor::set_allocated(int32 a) { _allocated = a; }


ShowCompileInMonitor::ShowCompileInMonitor(oop selector, char* compiler, bool optimize) {
    if (TheSpy->is_active()) do_show_compile(selector, compiler, optimize); }

ShowCompileInMonitor::~ShowCompileInMonitor() { method_being_compiled = NULL; }

bool ShowCompileInMonitor::method_changed() { 
  bool r = old_method_being_compiled != method_being_compiled;
  old_method_being_compiled = method_being_compiled;
  return r;
}

ResetMonitor::ResetMonitor() { if (TheSpy != NULL) TheSpy->reset(); } 


// ==============================================================
  
void ShowCompileInMonitor::do_show_compile(oop sel, char* compiler, bool optimize) {
  method_being_compiled = selector_string(sel);
  current_compiler_name = compiler;
  current_compiler_ticks = &compiler_ticks[optimize];
  assert(optimize == 0 || optimize == 1, "should use true or false");
  recompiling = recompilee != NULL;
}

ShowVMActivityInMonitor::ShowVMActivityInMonitor(const char* what)  { 
  old_activity = current_activity;
  current_activity = what;
}

ShowVMActivityInMonitor::~ShowVMActivityInMonitor() {
  current_activity = old_activity;
}


bool TrackObjectHeapInMonitor::_reserve_changed = true;

void TrackObjectHeapInMonitor::reserve_changed()      {  _reserve_changed = true; }
bool TrackObjectHeapInMonitor::has_reserve_changed()  {  bool r = _reserve_changed;  _reserve_changed = false;  return r; }


void TrackObjectHeapInMonitor::recreate_old_bars() {
  ((SelfMonitor*)TheSpy)->recreate_old_bars();
}

fint TrackObjectHeapInMonitor::new_capacity() { return Memory->new_gen->to_space->capacity(); }
fint TrackObjectHeapInMonitor::old_capacity() { return Memory->old_gen->capacity(); }
fint TrackObjectHeapInMonitor::n_spaces()     { return Memory->old_gen->nSpaces; }
fint TrackObjectHeapInMonitor::old_used()     { return Memory->old_gen->used(); }
fint TrackObjectHeapInMonitor::old_VM_reserved_memory() { return Memory->old_gen->get_VM_reserved_mem(); }
fint TrackObjectHeapInMonitor::old_low_space_threshold() { return Memory->old_gen->getLowSpaceThreshold(); }
