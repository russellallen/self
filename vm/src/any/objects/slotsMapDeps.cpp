/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "slotsMapDeps.hh"
# include "_slotsMapDeps.cpp.incl"


# define FOR_EACH_SLOT_DEP(d)                                           \
  if (dependents)                                                       \
    for (nmln* d= dependents, *dend= d + length_slots(); d < dend; d++) \


oop slotsMapDeps::define(oop obj, oop contents) {
  if (VerifyZoneOften)
    Memory->code->verify();
  oop result= slotsMap::define(obj, contents);
  if (result->is_mark()) return result;
  Memory->nonCombiningMode();
  FOR_EACH_SLOT_DEP(d) {
    d->invalidate();
  }
  deallocate_slot_dependents();
  add_slot_dependents()->invalidate();
  if (VerifyZoneOften)
    Memory->code->verify();
  return result;
}  


void slotsMapDeps::switch_pointer_in_map_slot(slotDesc *s, oop* where, oop to)
{
  Memory->store(where, to);
  if (dependents)
    dependents_for_slot(s)->invalidate();
}


void slotsMapDeps::shift_obj_slots(smiOop offset, fint delta) {
  FOR_EACH_SLOTDESC(this, slot) {
    if (slot->is_obj_slot() && smiOop(slot->data) >= offset) {
      Memory->store(&slot->data,
                   as_smiOop(smiOop(slot->data)->value() + delta));
      if (   dependents
          && dependents_for_slot(slot)->notEmpty()) {
        Memory->nonCombiningMode();
        dependents_for_slot(slot)->invalidate();
      }
    }
  }
}


slotsOop slotsMapDeps::create_slots(slotList* slots, const char* annotation) {
  slotsMapDeps m1;
  slotsOop obj;
  slotsMapDeps* sm= (slotsMapDeps*) create_map(sizeof(slotsMapDeps),
                                               slots, &m1, (oop*)&obj);
  if (*annotation != '\0') sm->set_annotation(new_string(annotation));
  return obj;
}


oop slotsMapDeps::fill_in_slots(slotList* slist, fint slotCount) {
  add_slot_dependents()->init();
  dependents= NULL;
  return slotsMap::fill_in_slots(slist, slotCount);
}



// Shift the links, as the map is moving during compaction.
// Note that the new_map list is being rebuilt from scratch,
// so we can assume that the target is not in the list.
void slotsMapDeps::shift_map(Map* target) {
  slotsMapDeps *m= (slotsMapDeps*)target;
  Memory->new_gen->add_map(m);
  fint delta= (char*) m - (char*) this;
  add_slot_dependents()->shift(delta);
  // make next map point to shifted (current) map
  map_chain()->shift(delta);
  if (dependents)
    Memory->setDepsMap(dependents, m);
}


void slotsMapDeps::forward_map(Map* oldMap) {
  // make next map point to forwarded (current) map
  fint delta= (char*) this - (char*) oldMap;
  map_chain()->forward(delta);
  add_slot_dependents()->forward(delta);
  if (dependents)
    Memory->setDepsMap(dependents, this);
}


void slotsMapDeps::delete_map() {
  add_slot_dependents()->remove();
  map_chain()->remove();
  FOR_EACH_SLOT_DEP(d) {
    d->remove();
  }
  deallocate_slot_dependents();
}


nmln* slotsMapDeps::dependents_for_slot(slotDesc *s) {
  assert(s >= slots() && s < slot(length_slots()),
         "slotDesc not part of map");
  if (dependents == NULL) {
    dependents= Memory->allocateSlotDeps(this);
    FOR_EACH_SLOT_DEP(d) {
      d->init();
    }
  }    
  return &dependents[s - slots()];
}

void slotsMapDeps::deallocate_slot_dependents() {
  if (dependents) {
    Memory->deallocateSlotDeps(dependents, length_slots());
    dependents= NULL;
  }
}

void slotsMapDeps::moveDeps(nmln* newDeps, int32 delta) {
  FOR_EACH_SLOT_DEP(d) {
    d->shift(delta);
  }
  dependents= newDeps;
}

// receiver should be a new map
void slotsMapDeps::init_dependents() {
  dependents= NULL;
  add_slot_dependents()->init();
}

bool slotsMapDeps::verify_dependents() {
  mapOop m= enclosing_mapOop();
  bool flag= true;
  if (! add_slot_dependents()->verify_map_deps()) {
    lprintf("\tof map 0x%lx\n", m);
    flag = false;
  }
  FOR_EACH_SLOT_DEP(d) {
    flag= flag && d->verify_map_deps();
  }
  if (dependents && *(((slotsMapDeps**)dependents)-1) != this) {
    lprintf("slot map dependency backpointer inconsistent in map %#lx\n",
           (long unsigned)m);
    flag= false;
  }
  if (m->is_new() != Memory->new_gen->has_map(this)) {
    lprintf("map %#lx and new map list are inconsistent\n", m);
    flag= false;
  }
  return flag;
}
