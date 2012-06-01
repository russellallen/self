/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "objVectorMap.hh"
# include "_objVectorMap.cpp.incl"

oop objVectorMap::clone(oop obj, bool mustAllocate, oop genObj) {
  assert_objVector(obj, "not an obj vector");
  objVectorOop v= objVectorOop(obj)->copy(mustAllocate, genObj);
  if (oop(v) != failedAllocationOop) v->init_mark();
  return v;
}

oop objVectorMap::cloneSize(oop obj, fint len, bool mustAllocate, oop filler) {
  assert_objVector(obj, "not an obj vector");
  fint l = objVectorOop(obj)->length();
  objVectorOop v;
  if (l < len) {
    // growing array
    v= objVectorOop(obj)->grow(len - l, mustAllocate);
    if (oop(v) != failedAllocationOop) {
      set_oops(v->objs(l), len - l, filler);
      if (v->is_old()) {
        if (filler->is_new()) {
          // do all of object
          Memory->remembered_set->record_multistores(v->oops(), v->objs(len));
        } else {
          // just do beginning of object; filler isn't new
          Memory->remembered_set->record_multistores(v->oops(), v->objs(l));
        }
      }
    }
  } else if (l > len) {
    // shrinking array
    v= objVectorOop(obj)->shrink(l - len, mustAllocate);
  } else {
    // copying array
    v= objVectorOop(obj)->copy(mustAllocate);
  }
  if (oop(v) != failedAllocationOop) v->init_mark();
  return v;
}

objVectorOop objVectorMap::create_objVector(slotList* slots) {
  objVectorOop ov;
  objVectorMap m1;
  (void)create_map(sizeof(objVectorMap), slots, &m1, (oop*)&ov);
  return ov;
}

oop objVectorMap::scavenge(oop obj) {
  // use :: to avoid another virtual function call
  return objVectorOop(obj)->scavenge(objVectorMap::object_size(obj)); 
}

bool objVectorMap::verify(oop obj) {
  return objVectorOop(obj)->verify();
}

fint objVectorMap::empty_object_size() {
  return sizeof(objVectorOopClass)/oopSize;
}

// do not change literal backpointer
void objVectorMap::switch_pointer(oop obj, oop* where, oop to) {
  slotDesc* s = find_slot(VMString[METHOD_POINTER]);
  if (s  &&  obj->get_slot_data_address(s) == where) 
    return;
  slotsMap::switch_pointer(obj, where, to);
}

void objVectorMap::dummy_initialize(oop obj, oop filler) { 
  Unused(filler);
  assert_objVector(obj, "not an obj vector");
  objVectorOop(obj)->set_length(0);
}

void objVectorMap::print_objVector(oop obj) {
  lprintf("object array: {");
  if (obj->is_map()) {
    lprintf("...");
  } else {
    bool first = true;
    oop* p = obj_array(obj);
    oop* end = p + length_obj_array(obj);
    oop* end2 = p + VectorPrintLimit < end ? p + VectorPrintLimit : end;
    for (; p < end2; p ++) {
      if (first) first = false;
      else lprintf(", ");
      (*p)->print_oop();
    }
    if (end != end2) {
      lprintf(", ... (%d more elements) ", end - end2);
    }
  }
  lprintf("} ");
}
