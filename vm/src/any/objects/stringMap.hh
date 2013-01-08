/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// stringOops are canonical strings; all stringOops are registered in the
// string table

class stringMap: public byteVectorMap {
 public:
  // testers
  bool is_string() { return true; }
  bool is_programmable_slots() { return false; }
  VtblMapType vtblMapType() { return MAP_TYPE_NAME(stringMap); }

  // if you ever change this, must go back and look at create_initial_strings
  bool should_canonicalize() { return false; }  
  
  // constructors
  static void create_initial_strings(oop parent);
  
  // mirror operation
  mirrorOop mirror_proto() { return Memory->stringMirrorObj; }
  
  // creation operations
  slotsOop create_object(fint size) { return create_string(size); }
  
  // cloning operations
  bool can_inline_clone() { return false; }
  oop clone(oop obj, bool mustAllocate= true, oop genObj= NULL);
  oop cloneSize(oop obj, fint len, bool mustAllocate= true, oop filler= NULL);
  
  // memory operations
  virtual oop scavenge(oop obj);
  bool verify(oop obj);

  int32 debug_size(oop p);
  
  // printing operations
  void print_string(oop obj, char* buf);
  void print_oop(oop obj);
  void print(oop obj);
};


static inline void create_initial_strings(oop parent) {
  return stringMap::create_initial_strings(parent);
}
