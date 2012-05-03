/* Sun-$Revision: 30.10 $ $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// Forward-declaration for friend  
profilerOop create_profiler();

class profilerMap : public slotsMapDeps {
 public:
  // Type test operation
  bool is_profiler() { return true; }
  VtblMapType vtblMapType()     { return MAP_TYPE_NAME(profilerMap); }


  // cloning
  bool can_inline_clone() { return false; }
  
  bool verify(oop obj);

  // creation operation
  friend profilerOop create_profiler(); // To create initial profilerOop
  
  // killable operations
  void    kill(oop p);
  bool is_live(oop p);
  bool is_killable()            { return true; }


  // sizing
  fint empty_object_size();

  // mirror operation
  mirrorOop mirror_proto() { return Memory->profilerMirrorObj; }

  // printing
  void print_string(oop obj, char* buf);
  void print(oop obj);
  void print_oop(oop obj);

  // enumerating
  // virtual bool is_enumerable(oop obj, oop* matching_cell);

  // profiler operation
  void dummy_initialize(oop obj, oop filler);
};
