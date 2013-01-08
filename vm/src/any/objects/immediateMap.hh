/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


class immediateMap: public Map {
 public:
  fint size() { 
    return (sizeof(immediateMap) + sizeof(slotDesc)) / sizeof(oop); }

  // slot operations (a single fixed parent slot)
  fint length_slots() { return 1; }
  fint length_nonVM_slots() { return 1; }
  
  // cloning operations
  oop clone(oop obj, bool mustAllocate= true, oop genObj= 0) {
    UsedOnlyInAssert(obj); Unused(mustAllocate); Unused(genObj);
    assert(obj->is_smi() || obj->is_float(), "object isn't immediate");
    return obj; }
  bool can_inline_clone() { return false; }
  oop cloneSize(oop obj, fint length, bool mustAllocate= true,
                oop filler= 0) {
    Unused(length); Unused(mustAllocate); Unused(filler);
    ShouldNotCallThis(); // cannot resize an immediate oop
    return obj; }
  
  // memory operations
  bool verify(oop obj) { Unused(obj);  return true; }
  virtual oop scavenge(oop obj) { return obj; }
  
  // bogus operations
  void switch_pointer(oop obj, oop* where, oop to) {
    Unused(obj); Unused(where); Unused(to);
    ShouldNotCallThis(); }
  fint empty_object_size() { ShouldNotCallThis(); return 0; }
  fint object_size(oop obj) {
    Unused(obj);  ShouldNotCallThis(); return 0; }
  fint object_byte_size(oop obj) { Unused(obj);  return 0; }
  
  bool is_enumerable(oop obj, oop* matching_cell) {
    Unused(obj); Unused(matching_cell);
    ShouldNotCallThis(); return false; }

  // creation operation
  oop fill_in_slots(slotList* slist, fint slotCount);
};
