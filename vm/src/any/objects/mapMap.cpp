/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "mapMap.hh"
# include "_mapMap.cpp.incl"

Map* mapMap::create_mapMap() {
  oop ignored;
  mapMap m1;
  Map* m = create_map(sizeof(mapMap), 0, &m1, &ignored);
  m->enclosing_mapOop()->set_map(m); // mapMap is its own map
  return m;
}

oop mapMap::clone(oop obj, bool mustAllocate, oop genObj) {
  Unused(mustAllocate); Unused(genObj);
  ShouldNotCallThis(); // cannot clone a mapOop
  return obj;
}

oop mapMap::cloneSize(oop obj, fint length, bool mustAllocate, oop filler) {
  Unused(length); Unused(mustAllocate); Unused(filler);
  ShouldNotCallThis(); // cannot clone a mapOop
  return obj;
}

oop mapMap::scavenge(oop obj) {
  // use :: to avoid another virtual function call
  return mapOop(obj)->scavenge(mapMap::object_size(obj)); 
}


bool mapMap::verify(oop obj) {
  if (!oopsOop(obj)->verify())
    return false;
  bool isOK = true;
  Map* m = mapOop(obj)->map_addr();
  
  if (!Vtbls->contains(m->vtbl_value()) )  {
    lprintf("Vtable of map %#lx is not registered in Vtbls\n", m);
    isOK = false;
  }
  if (m->length_slots() < 0) {
    error1("map 0x%lx has a weird slot length", obj);
    isOK = false;
  }
  slotDesc *prev= 0;
  fint offset= m->is_slots() ? m->empty_object_size() : 0;
  FOR_EACH_SLOTDESC(m, slot) {
    if (! slot->verify(m)) {
      lprintf("\tof map 0x%lx\n", obj);
      isOK = false;
    }
    if (slot->is_obj_slot()) {
      if (smiOop(slot->data)->value() != offset) {
        lprintf("error in offset of obj slot in map %#lx\n", (long unsigned)m);
        isOK= false;
      }
      ++offset;
    }
    if (prev && prev->name->cmp(slot->name) >= 0) {
      lprintf("slot order error in map %#lx\n", m);
      isOK= false;
    }
    prev= slot;
  }
  if (m->can_have_dependents()) {
    ((slotsMapDeps*)m)->verify_dependents();
  }
  /*  disable this; only check maps actually in objects
      Memory->map_table->verify_map(m);
   */
  return isOK;
}


void mapMap::print(oop obj) {
  Map* m = mapOop(obj)->map_addr();
  if (m == Memory->map_map) {
    lprintf("map map\n");
  } else {
    m->print_map();
  }
}
