/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// Forward-declaration for friend
mirrorOop create_mirror(oop reflectee=create_slots((slotList*)NULL));

class mirrorMap: public slotsMapDeps {
 public:
  // testing operations
  bool is_mirror() { return true; }
  VtblMapType vtblMapType() { return MAP_TYPE_NAME(mirrorMap); }

  // creation operation
  friend mirrorOop create_mirror(oop reflectee);
  
  // mirror operation
  mirrorOop mirror_proto() { return Memory->mirrorMirrorObj; }
  
  // sizing
  fint empty_object_size();
  
  // printing
  void print(oop obj);

  // enumerating
  virtual bool is_enumerable(oop obj, oop* matching_cell) {
    Unused(obj); Unused(matching_cell);
    return true; }

  // programming
  void switch_pointer(oop obj, oop* where, oop to);

  // profiler operation
  void dummy_initialize(oop obj, oop filler);
};
