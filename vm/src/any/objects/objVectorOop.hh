/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


class objVectorOopClass: public slotsOopClass {
 public:
  // instance variable
  smiOop _len;
  
  // accessors
  objVectorOopClass* addr() {
    return (objVectorOopClass*) slotsOopClass::addr(); }
  
  smi length() { return addr()->_len->value(); }
  void set_length(smi len) { addr()->_len = as_smiOop(len); }
  
  oop* objs(fint which = 0) {
    oop* base = oops(((slotsMap*) map())->empty_vector_object_size());
    return &base[which]; }
  
  oop obj_at(fint which) {
    assert(which >= 0 && which < length(), "index out of bounds");
    return *objs(which); }

  void obj_at_put(fint which, oop contents, bool cs = true) {
    assert(which >= 0 && which < length(), "index out of bounds");
    assert(!is_string(), "shouldn't be modifying a canonical string");
    if (cs) {
      Memory->store(objs(which), contents);
    } else {
      *objs(which) = contents;
    } }
  
  oop methodPointer();

  // allocators
  objVectorOop copy(bool mustAllocate= true, oop genObj= NULL, bool cs= true) {
    return (objVectorOop)slotsOopClass::copy(size(), mustAllocate, genObj, cs); }

  objVectorOop grow(fint delta, bool mustAllocate= true);
  objVectorOop shrink(fint delta, bool mustAllocate= true);
  
  objVectorOop clone(bool mustAllocate= true) {
    return objVectorOop(slotsOopClass::clone(mustAllocate)); }
  objVectorOop cloneSize(fint length, bool mustAllocate= true,
                         oop filler= NULL) {
    return objVectorOop(slotsOopClass::cloneSize(length, mustAllocate,
                                                 filler)); }
  
  // creation operation
  friend objVectorOop create_objVector(oop parent);
  friend objVectorOop create_objVector(fint size);
  
  // memory operations
  bool verify();
  
  // primitives
  friend oop ov_at_prim(oop rcvr, oop index);
  friend oop ov_at_put_prim(oop rcvr, oop index, oop contents);
  friend oop ov_size_prim(oop rcvr);
  oop ov_clone_prim(smi size, oop filler, void *FH); // Caller must handle size < 0.

  oop ov_references_prim(oop limit);
  oop ov_implementors_prim(oop limit);
  oop ov_methodPointer_prim();
  
  // Conversions
  int32 *convertIntArray();
  short *convertShortArray();
  unsigned short *convertUnsignedShortArray();
  float *convertFloatArray();
  void  *convertProxyArray(const void*);

  // compiler support
  friend int32 objVector_len_offset() {
    return int32(&objVectorOop(NULL)->addr()->_len); }
  
};
