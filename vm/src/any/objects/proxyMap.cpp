/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "foreignMap.hh"
# pragma implementation "proxyMap.hh"

# include "_proxyMap.cpp.incl"


proxyOop proxyMap::create_proxy() {
  slotList* slots = new slotList(VMString[PARENT], 
                                 parent_map_slotType,
                                 create_slots((slotList*)NULL));
  proxyMap mm;
  proxyOop mr;
  (void)create_map(sizeof(proxyMap), slots, &mm, (oop*)&mr);
  mr->set_pointer(NULL);
  mr->set_type_seal(NULL);
  mr->kill();
  assert(mr->is_killable() && mr->is_foreign() && !mr->is_live(), 
         "should be dead foreigner");
  return mr;
}


fint proxyMap::empty_object_size() {
  return sizeof(proxyOopClass) / oopSize; 
}


void proxyMap::print(oop obj) {
  if (obj->is_map()) {
    lprintf("proxy ");
  } else {
    if (proxyOop(obj)->is_live()) {
      lprintf("proxy(live) ");
    } else {
      lprintf("proxy(dead) ");
    }
    if (WizardMode) 
      lprintf("ptr = %#lx, type_seal = %#lx ",
              proxyOop(obj)->get_pointer(),
              proxyOop(obj)->get_type_seal());
  }
  slotsMap::print(obj);
}

void proxyMap::dummy_initialize(oop obj, oop filler){
  foreignMap::dummy_initialize(obj, filler);
  proxyOop(obj)->set_type_seal(NULL);
}
