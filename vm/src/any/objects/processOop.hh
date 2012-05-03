/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// A processOop is the Self-level half of a process descriptor. It contains
// a pointer to the C++ Process structure.  It is also used to keep track
// of all live activation mirrors for the process.

class processOopClass: public slotsOopClass {
 protected:
  Process*  _process;
  vframeOop _vframeList;
  oop       _return_oop; // Contains the return value when after the
                         // process has terminated.
  processOopClass* addr() { return (processOopClass*)slotsOopClass::addr();}
  oop get_result(oop resultArg);
  void    kill_process();    // Don't call this fct. Call kill() instead.
  bool is_live_process();    // Don't call this fct. Call is_live() instead.
  vframeOop clone_vframeOop(abstract_vframe* vf, Process* p, bool mustAllocate= true);
  
 public:
  Process* process()            { return addr()->_process; }
  void set_process(Process* p)  { 
    assert(oop(p)->is_smi(), "not a smi");
    addr()->_process = p; }


  processOop clone(bool mustAllocate= true) {
    return (processOop) slotsOopClass::clone(mustAllocate); }

  vframeOop vframeList()        { return addr()->_vframeList; }
# ifdef UNUSED
  processOop set_vframeList(vframeOop p) {
    Memory->store((oop*)&addr()->_vframeList, p); return this; }
# endif
  
  friend class processMap;
  
  // process primitives
  oop NewProcess_prim(smi stackSize, oop rcvr, stringOop sel, 
                      objVectorOop args, void *FH);
  oop AbortProcess_prim(void *FH);
  oop PrintProcessStack_prim(void *FH);
  oop TWAINS_prim(objVectorOop resultArg, bool stepping, oop stop, void *FH);
  
 protected: // Twains helpers:
 
  Process*  TWAINS_receiver_check(void* FH);
  bool      TWAINS_result_vector_check(objVectorOop resultArg, void* FH);
  vframeOop TWAINS_stop_activation_check(Process* proc, oop stop, void* FH);
  bool      TWAINS_parallel_check(void* FH);
  void      TWAINS_await_signal();
  
  void TWAINS_transfer_to_another_process(
                            Process*       proc,
                            objVectorOop&  resultArg, 
                            bool           stepping,
                            vframeOop      stop_vfo);

 public:

  oop ProcessReturnValue_prim(void *FH);
  
  // debugging primitives
  smi StackDepth_prim(void *FH);

  // Returns all the vframeOops of this process in a vector.
  oop ActivationStack_prim(void *FH);

  void set_return_oop(oop ret) { Memory->store((oop*)&addr()->_return_oop, ret); }
  oop  get_return_oop() { return addr()->_return_oop; }

 protected:
 abstract_vframe* vframe_at(smi index, void *FH, Process*& p, frame*& last);
 public:
  oop ActivationAt_prim(smi index, void *FH);
  oop KillUpTo_prim(smi index, void *FH);
  oop GotoByteCode_prim(smi index, objVectorOop exprStack, void *FH);

  oop set_current_hash_prim(smi val) {
    process()->current_hash = val;
    return this;
  }

  void switch_return_oop(oop* where, oop to) {
    if (where == &addr()->_return_oop)
      set_return_oop(to);
  }

};


smi TWAINSResultSize_prim();
oop ThisProcess_prim(oop rcvr);
oop Yield_prim(oop rcvr, oop arg);
