/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "fctProxyMap.hh"
# include "_fctProxyMap.cpp.incl"


fctProxyOop fctProxyMap::create_fctProxy() {
  slotList* slots = new slotList(VMString[PARENT], 
                                 parent_map_slotType,
                                 create_slots((slotList*)NULL));
  fctProxyMap mm;
  fctProxyOop mr;
  (void)create_map(sizeof(fctProxyMap), slots, &mm, (oop*)&mr);
  mr->kill();
  assert(mr->is_killable() && mr->is_foreign() && !mr->is_live(), 
         "should be dead foreigner");
  return mr;
}


fint fctProxyMap::empty_object_size() {
  return sizeof(fctProxyOopClass) / oopSize; 
}


void fctProxyMap::print(oop obj) {
  if (obj->is_map()) {
    lprintf("fctProxy ");
  } else {
    lprintf("fctProxy(%s) ", fctProxyOop(obj)->is_live() ? "live" : "dead");
    if (WizardMode)
      lprintf("ptr = %#lx, type_seal = %#lx, argc = %d ", 
             fctProxyOop(obj)->get_pointer(),
             fctProxyOop(obj)->get_type_seal(),
             fctProxyOop(obj)->get_noOfArgs());
  }
  slotsMap::print(obj);
}

bool fctProxyMap::is_enumerable(oop obj,  oop* matching_cell) {
  return          matching_cell  >= fctProxyOop(obj)->oops(empty_object_size())
    ||   smiOop(*matching_cell)  == as_smiOop(fctProxyOop(obj)->get_noOfArgs());
}

void fctProxyMap::dummy_initialize(oop obj, oop filler) {
  assert( obj->is_fctProxy(), "a fctProxyOop is expected");
  proxyMap::dummy_initialize(obj, filler);
  fctProxyOop(obj)->set_noOfArgs(0);
}
