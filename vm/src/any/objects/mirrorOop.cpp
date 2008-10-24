/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "mirrorOop.hh"
# include "_mirrorOop.cpp.incl"

oop as_mirror_prim(oop obj) {
  return obj->as_mirror();
}


oop reflectee_id_hash_prim(mirrorOop rcvr) {
  if (!rcvr->is_mirror()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  return as_smiOop(rcvr->reflectee()->identity_hash());
}

oop reflectee_eq_prim(mirrorOop rcvr, oop anotherMirror) {
  if (!rcvr         ->is_mirror()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  if (!anotherMirror->is_mirror()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  return rcvr->reflectee() == mirrorOop(anotherMirror)->reflectee()
    ? Memory->trueObj : Memory->falseObj;
}


oop mirrorOopClass::define_prim(mirrorOop cont, void *FH) {
  oop result= reflectee()->define_prim(cont->reflectee(), FH);
  if (result == NULL) return NULL;
  return  result->is_mark() ?  result : this;
}

oop mirrorOopClass::copy_add_slot_prim(stringOop name, 
                                       mirrorOop contMirror,
                                       bool isP,
                                       bool isA,
                                       oop anno,
                                       void *FH) {
  oop result = slotsOop(reflectee())
    ->copy_add_slot_prim(name, contMirror->reflectee(), isP, isA, anno, FH);
  return result == failedAllocationOop || result->is_mark()
    ? result : result->as_mirror();
}

oop mirrorOopClass::copy_remove_prim(stringOop name, void *FH) {
  oop result = slotsOop(reflectee())->copy_remove_slot_prim(name, FH);
  return result == failedAllocationOop || result->is_mark() 
    ? result : result->as_mirror();
}


oop mirrorOopClass::evaluate_in_context_prim(mirrorOop methodMirror) {
  return reflectee()->evaluate_in_context_prim(methodMirror->reflectee());
}

// switch reflectee if appropriate
// because a mirror's map depends on the kind of reflectee it has,
// this can get difficult, since the map or size might be different
// Let's try a recursive define! It will be fast for the like-type case,
// ought to work for the weird cases. -- dmu 2/93
//
// unsuitable for primitive
//  cause doesnt call define_prim, so doesnt convert processes

void mirrorOopClass::switch_reflectee(oop* where, oop to) {
  if (where == &addr()->_reflectee) {
    // optimize to prevent alloated and running out of space -- dmu 5/6
    if (to->map()->mirror_proto() == reflectee()->map()->mirror_proto())
      set_reflectee(to);
    else {
      mirrorOop toM = to->as_mirror();
      if (toM->map() == map()) // an opt to avoid method inval
        set_reflectee(to);
      else if ( define(toM) -> is_mark() )
        fatal("define failed");
    }
  }
}

oop mirrorOopClass::copy_set_annotation_prim(oop a, void *FH) { 
  oop r= reflectee()->mirror_copy_set_annotation(a);
  if (r == failedAllocationOop) {
    out_of_memory_failure(FH, this->size());
    return NULL;
  }
  return r->is_mark() ? r : r->as_mirror();
}
