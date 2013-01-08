/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


class foreignMap: public slotsMapDeps {
 public:
  // sizing
  fint empty_object_size() {  return sizeof(foreignOopClass) / oopSize; }
  
  // testing operations
  bool is_killable() { return true; }
  bool is_foreign()  { return true; }

  // creation: override clone to prevent clone, then delete -- dmu 12/91

  virtual bool can_inline_clone() {return false;}

  virtual oop clone(oop obj, bool mustAllocate= true, oop genObj= NULL) {
    oop r= slotsMapDeps::clone(obj, mustAllocate, genObj);
    if (r != failedAllocationOop) r->kill();
    return r;
  }

  // killable operations
  virtual void    kill(oop p) { foreignOop(p)->kill_foreign();           }
  virtual bool is_live(oop p) { return foreignOop(p)->is_live_foreign(); }

  // profiler operation
  void dummy_initialize(oop obj, oop filler) {
    Unused(filler);
    assert( obj->is_foreign(), "a foreignOop is expected");
    foreignOop(obj)->set_pointer(NULL);
  }
};
