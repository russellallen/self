/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "byteVectorMap.hh"
# include "_byteVectorMap.cpp.incl"

oop byteVectorMap::clone(oop obj, bool mustAllocate, oop genObj) {
  assert_byteVector(obj, "not a byte vector");
  byteVectorOop v= byteVectorOop(obj)->copy(mustAllocate, genObj);
  if (oop(v) != failedAllocationOop) v->init_mark();
  return v;
}

oop byteVectorMap::cloneSize(oop obj, fint len, bool mustAllocate,
                             oop filler) {
  assert_byteVector(obj, "not a byte vector");
  assert_smi(filler, "not a smiOop filler");
  fint l = byteVectorOop(obj)->length();
  byteVectorOop v;
  if (l < len) {
    // growing array
    v= byteVectorOop(obj)->grow_bytes(len - l, mustAllocate);
    if (oop(v) != failedAllocationOop)
      set_bytes(v->bytes(l),  len - l,  char(smiOop(filler)->value()));
  } else if (l > len) {
    // shrinking array
    v= byteVectorOop(obj)->shrink_bytes(l - len, mustAllocate);
  } else {
    // copying array
    v= byteVectorOop(obj)->copy(mustAllocate);
  }
  if (oop(v) != failedAllocationOop) v->init_mark();
  return v;
}

byteVectorOop create_byteVector(slotList* slots) {
  byteVectorOop bv;
  byteVectorMap m1;
  (void)create_map(sizeof(byteVectorMap), slots, &m1, (oop*)&bv);
  return bv;
}

oop byteVectorMap::scavenge(oop obj) {
  // use :: to avoid another virtual function call
  return byteVectorOop(obj)->scavenge(byteVectorMap::object_size(obj)); 
}

bool byteVectorMap::verify(oop obj) {
  return byteVectorOop(obj)->verify();
}

bool byteVectorMap::verifyBytesPart(oop obj, char*& b) {
  return byteVectorOop(obj)->verifyBytesPart(b);
}

fint byteVectorMap::empty_object_size()  { 
  return sizeof(byteVectorOopClass) / oopSize;
}

void byteVectorMap::dummy_initialize(oop obj, oop filler) {
 Unused(filler);
 assert_byteVector(obj, "not a byte vector");
 byteVectorOop(obj)->set_length(0);
 byteVectorOop(obj)->set_bytes(NULL);
}

void byteVectorMap::print_byteVector(oop obj) {
  lprintf("byte array: {");
  if (obj->is_map()) {
    lprintf("...");
  } else {
    bool first = true;
    char* p = byte_array(obj);
    char* end = p + length_byte_array(obj);
    char* end2 = p + VectorPrintLimit < end ? p + VectorPrintLimit : end;
    for (; p < end2; p ++) {
      if (first) first = false;
      else lprintf(", ");
      lprintf("%ld", long(*p));
    }
    if (end != end2) {
      lprintf(", ... (%d more elements) ", end - end2);
    }
  }
  lprintf("} ");
}
