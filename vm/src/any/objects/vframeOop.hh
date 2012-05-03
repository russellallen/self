/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// A vframeOop represents a live activation object.  It contains enough
// information to construct the corresponding vframe.
 
// Forward-declaration for friend
vframeOop create_vframeOop(oop method);          // for prototype
vframeOop new_vframeOop(Process* p,abstract_vframe* vf);
vframeOop new_senderVFrameOop(Process* p, vframeOop from,
                              abstract_vframe* vf);

class vframeOopClass : public slotsOopClass {
 protected:
  vframeOop _next;              // next in list of live vframeOops
  oop       _method;            // "reflectee"
  Process*  _process;           // process to which I belong
  smiOop    _descOffset;        // offset into nmethod's scopes
  frame*    _locals;            // locals frame of fr(), not the same as
                                // the frame for this vframe, see
                                // home_frame_of_vfo_locals
  
  vframeOopClass* addr()  { return (vframeOopClass*)slotsOopClass::addr(); }
  void    kill_vframe();   // Don't call this fct. Call kill() instead.
  bool is_live_vframe() {  // Don't call this fct. Call is_live() instead.
    return locals() != NULL;
  }
# ifdef UNUSED
  vframeOop clone(bool mustAllocate= true) {
    return vframeOop(map()->clone(this, mustAllocate)); }
# endif
  vframeOop basic_clone(bool mustAllocate= true, oop genObj= NULL) {
    return vframeOop(((vframeMap*)map())->basic_clone(this,
                                                      mustAllocate, genObj)); }

  frame*     fr();
 public:
  friend vframeOop create_vframeOop(oop method);          // for prototype
  
  friend vframeOop new_vframeOop(Process* p,abstract_vframe* vf);
  friend vframeOop new_senderVFrameOop(Process* p, vframeOop from,
                                       abstract_vframe* vf);
  
  frame*     locals()           { return addr()->_locals; }
  smiOop     descOffset()       { return addr()->_descOffset; }
  Process*   process()          { return addr()->_process; }
  oop        method()           { return addr()->_method; }
  abstract_vframe*    as_vframe();

  oop        enumeration_target() {
    return oop(as_vframe()->fr->block_scope_of_home_frame()); }
  
  bool       equal(vframeOop v);
  bool       is_below(frame* fr);       // is receiver below fr on stack?
  bool       is_equal(frame* fr);       // is receiver in frame fr?
  bool       is_above(frame* fr);       // is receiver above fr on stack?

  bool       is_equal(abstract_vframe* vf);
# ifdef UNUSED
  bool       is_below(abstract_vframe* vf);
  bool       is_above(abstract_vframe* vf);
# endif
  
  bool       verify();
  
 protected:
  // list functions
  vframeOop next()              { assert(verify_oop(), "");  return addr()->_next; }
  void set_next(vframeOop n)    { Memory->store((oop*)&addr()->_next, n); }
  void insertAfter(vframeOop before) {
    set_next(before->next());
    before->set_next(this); }
  void remove(vframeOop prev) {
    assert(prev->next() == this, "not previous");
    prev->set_next(next());
  }
  
  void set_descOffset(smiOop n) { addr()->_descOffset = n; }
  vframeOop set_method(oop n)   {
    Memory->store(&addr()->_method, n); return this; }
  void set_locals(frame* l)     {
    assert(oop(l)->is_smi(), "not a smi");
    if (traceV) { lprintf("*** set_locals of 0x%x to 0x%x\n", this, l); }
    addr()->_locals = l; }
  void set_process(Process* p)  { addr()->_process = p; }
  
  friend class Process;
  friend class vframeMap;
  friend class processOopClass;
  friend class processMap;
  friend class Recompilation;
};
