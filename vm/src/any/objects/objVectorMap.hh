/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// Forward-declaration for friend
objVectorOop create_objVector(slotList* slots);


class objVectorMap: public slotsMapDeps {
 public:
  // testers
  bool is_objVector() { return true; }
  VtblMapType vtblMapType() { return MAP_TYPE_NAME(objVectorMap); }

  
  // accessing operations
  fint length_obj_array(oop obj) {
    assert_objVector(obj, "not an object vector");
    return objVectorOop(obj)->length(); }
  
  oop* obj_array(oop obj, fint which = 0) {
    assert_objVector(obj, "not an object vector");
    return objVectorOop(obj)->objs(which); }
  
  oop obj_at(oop obj, fint which) {
    assert_objVector(obj, "not an object vector");
    assert(which >= 0 && which < length_obj_array(obj),
           "accessing out of bounds");
    return objVectorOop(obj)->obj_at(which); }
  
  void obj_at_put(oop obj, fint which, oop contents) {
    assert_objVector(obj, "not an object vector");
    assert(which >= 0 && which < length_obj_array(obj),
           "storing out of bounds");
    objVectorOop(obj)->obj_at_put(which, contents); }
  
  // cloning operations
  oop clone(oop obj, bool mustAllocate= true, oop genObj= NULL);
  bool can_inline_clone() { return false; }
  oop cloneSize(oop obj, fint len, bool mustAllocate= true, oop filler= NULL);
  
  // mirror operation
  mirrorOop mirror_proto() { return Memory->objVectorMirrorObj; }
  
  // size operations
  fint object_size(oop obj) {
    return slotsMapDeps::object_size(obj) + objVectorOop(obj)->length(); }
  fint empty_object_size();
  
  // memory operations
  virtual oop scavenge(oop obj);
  bool verify(oop obj);
  
  // creation operation
  friend objVectorOop create_objVector(slotList* slots);
  slotsOop create_object(fint size) { return create_objVector(size); }

  // printing support
  void print_objVector(oop obj);
  
  // programming
  void switch_pointer(oop obj, oop* where, oop to);

 private:
  // profiler operation
  void dummy_initialize(oop obj, oop filler);
};
