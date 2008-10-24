/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "mirrorMap.hh"
# include "_mirrorMap.cpp.incl"

mirrorOop create_mirror(oop reflectee) {
  slotList* slots = new slotList(VMString[PARENT], 
                                 parent_map_slotType,
                                 create_slots((slotList*)NULL));
  mirrorMap mm;
  mirrorOop mr;
  (void)create_map(sizeof(mirrorMap), slots, &mm, (oop*)&mr);
  mr->set_reflectee(reflectee);
  return mr;
}

fint mirrorMap::empty_object_size() {
  return sizeof(mirrorOopClass) / oopSize;
}

void mirrorMap::print(oop obj) {
  if (obj->is_map()) {
    lprintf("mirror ");
  } else {
    lprintf("mirror <reflectee = ");
    mirrorOop(obj)->reflectee()->print_oop();
    lprintf("> ");
  }
  slotsMapDeps::print(obj);
}

void mirrorMap::switch_pointer(oop obj, oop* where, oop to) {
  assert_mirror(obj, "obj must be mirror");
  mirrorOop(obj)->switch_reflectee(where, to);
  slotsMapDeps::switch_pointer(obj, where, to);
}

void mirrorMap::dummy_initialize(oop obj, oop filler) {
  assert_mirror(obj, "obj must be mirror");
  mirrorOop(obj)->set_reflectee(filler);
}
