/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

class markMap: public Map {
 public:
  fint size() { return sizeof(markMap) / sizeof(oop); }
  
  // testers
  VtblMapType vtblMapType() { return MAP_TYPE_NAME(markMap); }

  // slot operations
  fint length_slots() { return 0; }
  fint length_nonVM_slots() { return 0; }
  
  // creation operation
  static Map* create_markMap();
  oop clone(oop obj, bool mustAllocate= true, oop genObj= NULL) {
    // shouldn't be cloning a mark
    Unused(mustAllocate); Unused(genObj);
    ShouldNotCallThis(); return obj; }
  
  // memory operations
  bool verify(oop obj) { Unused(obj); return true; }
  oop scavenge(oop obj) { return obj; }

  // bogus operations
  void switch_pointer(oop obj, oop* where, oop to) {
    Unused(obj); Unused(where); Unused(to);
    ShouldNotCallThis(); }
  mirrorOop mirror_proto() { ShouldNotCallThis(); return NULL; }
  oop dummy_obj(oop filler) {
    Unused(filler); ShouldNotCallThis(); return NULL; }
  fint empty_object_size() { ShouldNotCallThis(); return 0; }
  fint object_size(oop obj) {
    Unused(obj); ShouldNotCallThis(); return 0; }
  bool is_enumerable(oop obj, oop* matching_cell) {
    Unused(obj); Unused(matching_cell);
    ShouldNotCallThis(); return false; }
  oop fill_in_slots(slotList* slist, fint slotCount) {
    ShouldNotCallThis(); Unused(slist); Unused(slotCount); return badOop; }
  
  // printing operations
  void print_string(oop obj, char* buf) { markOop(obj)->print_string(buf); }
  void print_oop(oop obj) { markOop(obj)->print_oop(); }
  void print(oop obj);
};
