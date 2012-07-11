/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

class mapMap: public Map {
 public:
  // testers
  bool is_map()  { return true; }
  VtblMapType vtblMapType() { return MAP_TYPE_NAME(mapMap); }
  
  // slot operations
  fint length_slots() { return 0; }
  fint length_nonVM_slots() { return 0; }
  
  fint size() { return sizeof(mapMap) / sizeof(oop); }
  fint object_size(oop obj) { return enclosed_map_offset + mapOop(obj)->map_addr()->size(); }
  
  // cloning operations
  oop clone(oop obj, bool mustAllocate= true, oop genObj= 0);
  oop cloneSize(oop obj, fint length, bool mustAllocate= true,
                oop filler= 0);
  
  // creation operation
  static Map* create_mapMap();
  oop fill_in_slots(slotList* slist, fint slotCount) {
    ShouldNotCallThis(); Unused(slist); Unused(slotCount); return badOop; }
  
  // memory operations
  virtual oop scavenge(oop obj);
  bool verify(oop obj);

  // programming operations
  void switch_pointer(oop obj, oop* where, oop to) {
    assert_map(obj, "obj must be map!");
    mapOop(obj)->map_addr()->switch_pointer_in_map(where, to);
  }

  // bogus operations
  mirrorOop mirror_proto() { ShouldNotCallThis(); return 0; }
  oop dummy_obj(oop filler) {
    Unused(filler);  ShouldNotCallThis(); return 0; }
  fint empty_object_size() { ShouldNotCallThis(); return 0; }
  bool is_enumerable(oop obj, oop* matching_cell) {
    Unused(obj); Unused(matching_cell);
    ShouldNotCallThis(); return false; }

  // printing operations
  void print(oop obj);
};
