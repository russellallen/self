/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

class processMap: public slotsMapDeps {
 public:
  // testing operations
  bool is_process()  { return true; }
  bool is_killable() { return true; }
  VtblMapType vtblMapType()  { return MAP_TYPE_NAME(processMap); }

  
  // creation operation
  static processOop create_process(Process* process);
  
  oop clone(oop obj, bool mustAllocate= true, oop genObj= NULL);
  bool can_inline_clone() { return false; }
  oop cloneSize(oop obj, fint len, bool mustAllocate= true, oop filler= NULL); 
  
  // mirror operation
  mirrorOop mirror_proto()      { return Memory->processMirrorObj; } 

  // killable operations
  void    kill(oop p);
  bool is_live(oop p);
  
  // sizing
  fint empty_object_size();
  
  virtual void gc_mark_contents(oop p);

  // printing
  void print(oop obj);

  // programming
  void switch_pointer(oop obj, oop* where, oop to);

  // profiler operation
  void dummy_initialize(oop obj, oop filler);
};

static inline processOop create_process(Process* process) {
  return processMap::create_process(process);
}
