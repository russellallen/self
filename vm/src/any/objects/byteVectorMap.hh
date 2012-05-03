/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// Forward-declaration for friend
byteVectorOop create_byteVector(slotList* slots);


class byteVectorMap: public slotsMapDeps {
 public:
  // testers
  bool is_byteVector() { return true; }
  VtblMapType vtblMapType() { return MAP_TYPE_NAME(byteVectorMap); }

  
  // accessors
  fint length_byte_array(oop obj) {
    assert_byteVector(obj, "not a byte vector");
    return byteVectorOop(obj)->length(); }
  
  char* byte_array(oop obj, fint which = 0) {
    assert_byteVector(obj, "not a byte vector");
    return byteVectorOop(obj)->bytes(which); }
  
  char byte_at(oop obj, fint which) {
    assert_byteVector(obj, "not a byte vector");
    assert(which >= 0 && which < length_byte_array(obj),
           "accessing out of bounds");
    return byteVectorOop(obj)->byte_at(which); }
  
  void byte_at_put(oop obj, fint which, char contents) {
    assert_byteVector(obj, "not a byte vector");
    assert(which >= 0 && which < length_byte_array(obj),
           "storing out of bounds");
    byteVectorOop(obj)->byte_at_put(which, contents); }
  
  // cloning operations
  oop clone(oop obj, bool mustAllocate= true, oop genObj= NULL);
  bool can_inline_clone() { return false; }
  oop cloneSize(oop obj, fint len, bool mustAllocate= true, oop filler= NULL);
  
  // creation operations
  friend byteVectorOop create_byteVector(slotList* slots);
  slotsOop create_object(fint size) { return create_byteVector(size); }
  
  // mirror operation
  mirrorOop mirror_proto() { return Memory->byteVectorMirrorObj; }
  
  // size operations
  fint empty_object_size();
  fint object_byte_size(oop obj) {
    return slotsMapDeps::object_byte_size(obj) + length_byte_array(obj); }
  
  // memory operations
  virtual oop scavenge(oop obj);
  bool verify(oop obj);
  bool verifyBytesPart(oop obj, char*& b);

 private:
  // profiler operation
  void dummy_initialize(oop obj, oop filler);

  // printing support
  void print_byteVector(oop obj);
};
