/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "slotsMap.hh"
# include "_slotsMap.cpp.incl"

// Add a slot to a copy, respecting all invariants.
// Return mark on error, failedAllocationOop if ran out of space and 
// mustAllocate arg was false.

// copy_add_slot has many complex possible errors.
// That's why I have chosen to handle errors a bit differently for it.
// It may return a mark on error and its caller needs to check

// many interesting cases are here:
// The worst is when adding an assignment slot or replacing an assignment slot.
// Aside from that, the world divides into adding a brand new slot and
//  replacing an old one. When replacing an old one, if replacing a
//  variable data slot with a method, the corresponding assignment slot
//  must also go.
// When adding an assignment slot, the data must be put into the object.
// When replacing an assignment slot, the data must be put into the map.

// If type is a VM slot, assume the caller knows what he's doing.

oop slotsMap::copy_add_slot(oop obj,
                            stringOop name,
                            slotType type,
                            oop contents,
                            oop anno,
                            bool mustAllocate) {

  if (!type->is_vm_slot())
    if (   !obj->is_programmable_slots()  // cannot add slot to some objects
        || contents->is_vframe())         // cannot put vframe in a slot
      return ErrorCodes::vmString_prim_error(BADTYPEERROR);
    else if (type->is_parent()  &&  contents->is_method_like())
      return ErrorCodes::vmString_prim_error(PARENTERROR);

  slotsOop sobj = slotsOop(obj);

  if ( type->is_arg_slot() )
    return  copy_add_argument_slot(sobj, name, type, contents, anno,
                                   mustAllocate);

  if (contents->is_assignment())
    return  copy_add_assignment_slot(sobj, name, type, anno, mustAllocate);

  if (contents->is_method_like())
    return  copy_add_method_slot(sobj, name, type, contents, anno,
                                 mustAllocate);

  return    copy_add_data_slot(  sobj, name, type, contents, anno,
                                 mustAllocate);
}


oop slotsMap::copy_add_argument_slot(slotsOop obj,
                                     stringOop name, 
                                     slotType type,
                                     oop contents,
                                     oop anno,
                                     bool mustAllocate) {
  assert_smi(contents, "arg data must be position");

  if (!name->is_unary())
    return ErrorCodes::vmString_prim_error(ARGUMENTCOUNTERROR);

  slotDesc* old = find_slot(name);
  slotsOop result;
  if (old == 0)
    result= obj;
  else if (old->is_arg_slot()) {
    // No need to remove and reinsert because order is the same.
    // Only the annotation might be really different.
    // The index will be off by one (assumes that added slot is new)
    assert(smiOop(contents)->value() == smiOop(old->data)->value() + 1,
           "arg index wrong");
    return change_slot(obj, old, type, old->data, anno, mustAllocate);
  } else {
    result= (slotsOop)copy_remove_slot(obj, name, mustAllocate);
    if (oop(result) == failedAllocationOop || result->is_mark()) return result;
    assert(result->is_slots(), "just checking");
  }
  assert(smiOop(contents)->value() == arg_count(), "arg index wrong");
  return ((slotsMap*)result->map())->copy_add_new_slot(result, 
                                                       name, 
                                                       type, 
                                                       contents,
                                                       anno,
                                                       mustAllocate);
}


// called to add a slot whose contents is assignmentObj

oop slotsMap::copy_add_assignment_slot(slotsOop obj,
                                       stringOop name,
                                       slotType type,
                                       oop annoIgnored,
                                       bool mustAllocate) {
  Unused(annoIgnored);
  Unused(type);
                                         
  if (!name->is_1arg_keyword())
    return ErrorCodes::vmString_prim_error(ARGUMENTCOUNTERROR);

  assert(obj->is_slots() && this == obj->map(), "insecurity");

  // find the data slot

  slotDesc* ds= find_assignee_slot(name);

  if (ds == 0)
    return ErrorCodes::vmString_prim_error(LONELYASSIGNMENTSLOTERROR);

  if (ds->is_obj_slot())
    // slot already exists -- nothing to do
    return obj->clone(mustAllocate);

  // must be a map slot
  if (!NakedMethods && ds->data->is_method_like())
    return ErrorCodes::vmString_prim_error(UNASSIGNABLESLOTERROR);

  // remove old map data slot
  slotsOop result= copy_remove_one_slot(obj, ds, mustAllocate);
  if (oop(result) == failedAllocationOop) return failedAllocationOop;
  slotsMap *new_map= (slotsMap*)result->map();

  // remove any existing method by same name
  slotDesc* old= new_map->find_slot(name);
  if (old) {
    result= new_map->copy_remove_one_slot(result, old, mustAllocate);
    if (oop(result) == failedAllocationOop) return result;
    new_map= (slotsMap*)result->map();
    assert(result->is_slots(), "just checking");
  } else {
    result= obj;
  }

  // Add in obj slot - enlarge object and put data into it from map
  result= new_map->copy_add_new_slot(result, ds->name, OBJ_SLOT(ds->type),
                                     ds->data, ds->annotation, mustAllocate);
  if (oop(result) == failedAllocationOop) return failedAllocationOop;
  assert(result->is_slots(), "should not fail");

  return result;
}


// put in vm_slot checks cause method backpointer in literals and
// parent pointer in block methods do not obey the rules

oop slotsMap::copy_add_method_slot( slotsOop obj,
                                    stringOop name, 
                                    slotType type, 
                                    oop contents,
                                    oop anno,
                                    bool mustAllocate) {

  if (type->is_vm_slot()) {
    // skip all the checks and do not try to remove it, since
    // vm slots do not change from obj to map, and rm will fetch anyway
    slotDesc* sd = obj->find_slot(name);
    return sd != 0
     ? change_slot      (obj, sd,   type, contents, anno, mustAllocate)
     : copy_add_new_slot(obj, name, type, contents, anno, mustAllocate);
  }
  if ( contents->arg_count() != name->arg_count() )
    return ErrorCodes::vmString_prim_error(ARGUMENTCOUNTERROR);

  if (obj->is_method_like())
    return ErrorCodes::vmString_prim_error(BADTYPEERROR); // cannot add methods to methods

  slotDesc *old= find_slot(name);
  if (old && old->is_map_slot())
    // change in situ
    return change_slot(obj, old, type, contents, anno, mustAllocate);

  slotsOop result;
  if (old) {
    // remove the old slot, then add in a new one
    result= (slotsOop)copy_remove_one_slot(obj, old, mustAllocate);
    if (oop(result) == failedAllocationOop) return failedAllocationOop;

    if (old->is_assignment_slot_name(name)) {
      // replace the data slot as a map slot
      result= ((slotsMap*)result->map())->
        copy_add_new_slot(result, old->name, MAP_SLOT(old->type),
                          obj->get_slot(old), old->annotation, mustAllocate);
      if (oop(result) == failedAllocationOop) return failedAllocationOop;
    }
  } else
    result= obj;

  return ((slotsMap*)result->map())->
    copy_add_new_slot(result, name, MAP_SLOT(type), contents, anno,
                      mustAllocate);
}


oop slotsMap::copy_add_data_slot(slotsOop obj,
                                 stringOop name, 
                                 slotType type,
                                 oop contents,
                                 oop anno,
                                 bool mustAllocate) {
  if (!name->is_unary()) {
    return ErrorCodes::vmString_prim_error(SLOTNAMEERROR);
  }

  slotDesc* old = find_slot(name);
  
  if (!old)
    return copy_add_new_slot(obj, name, type, contents, anno, mustAllocate);

  if (old->is_obj_slot())
    // change in place; if type is map_slot, just changes value
    return (slotsOop)change_slot(obj, old, OBJ_SLOT(type), contents, anno,
                                 mustAllocate);

  // remove then add obj slot
  slotsOop result= copy_remove_one_slot(obj, old, mustAllocate);
  if (oop(result) == failedAllocationOop) return result;
  slotsMap *new_map= (slotsMap*)result->map();
  
  return new_map->copy_add_new_slot(result, name, type, contents,
                                    anno, mustAllocate);
}



slotsOop slotsMap::copy_add_new_slot(slotsOop  obj, 
                                     stringOop name,
                                     slotType  slot_type,
                                     oop       contents,
                                     oop       anno,
                                     bool      mustAllocate) {
  assert_slots(obj, "object isn't a slotsOop");
  assert(!obj->is_string(), "cannot clone strings!");

  bool found;
  fint newIndex= find_slot_index_for(name, found);
  assert(!found, "I only add new slots");
  slotsMap* new_map= (slotsMap*) insert(newIndex, mustAllocate);
  if (new_map == 0) return slotsOop(failedAllocationOop);

  slotDesc* s= new_map->slot(newIndex);
  new_map->slots_length= new_map->slots_length->increment();
  mapOop new_moop= new_map->enclosing_mapOop();
  new_moop->init_mark();
  new_map->init_dependents();

  slotsOop new_obj;
  switch (slot_type->slot_type()) {
   case obj_slot_type: {
    assert(NakedMethods || !contents->has_code() || slot_type->is_vm_slot(),
           "adding an assignable slot with code");
    // find which offset this slot should be at
    fint offset= empty_object_size();
    for (fint i= newIndex - 1; i >= 0; --i)
      if (slot(i)->is_obj_slot()) {
        offset= smiOop(slot(i)->data)->value() + 1;
        break;
      }
    new_obj= obj->is_byteVector()
              ? (slotsOop) byteVectorOop(obj) ->
                  insert(object_size(obj), offset, 1, mustAllocate, true)
              : (slotsOop) slotsOop(obj) ->
                  insert(object_size(obj), offset, 1, mustAllocate, true);
    if (oop(new_obj) == failedAllocationOop)
      return slotsOop(failedAllocationOop);
    new_map->shift_obj_slots(as_smiOop(offset), 1);
    new_map->object_length = new_map->object_length->increment();
    new_obj->at_put(offset, contents, false);
    new_obj->fix_generation(new_map->object_size(new_obj));
    contents= as_smiOop(offset);   // tagged index of slot data
    break; }
   case map_slot_type:
    new_obj= slotsOop(obj->clone(mustAllocate));
    break;
   case arg_slot_type:
    assert_smi(contents, "argument index isn't a smiOop");
    new_obj= slotsOop(obj->clone(mustAllocate));
    break;
   default:
    ShouldNotReachHere(); // unexpected slot type
  }
  if (oop(new_obj) == failedAllocationOop)
    return slotsOop(failedAllocationOop);
  s->init(name, slot_type, contents, anno, false);
  new_moop->fix_generation(new_moop->size());
  new_obj->set_canonical_map(new_map);
  
  return new_obj;
}

oop slotsMap::change_slot(oop obj,
                          slotDesc* slot,
                          slotType type, 
                          oop contents,
                          oop anno,
                          bool mustAllocate) {
  assert(slot != 0, "cannot change the contents of a non-existent slot");
  assert(!obj->is_string(), "cannot clone strings!");
  assert_slots(obj, "object isn't a slotsOop");

  slotsOop new_obj= slotsOop(obj->clone(mustAllocate));
  if (oop(new_obj) == failedAllocationOop) return failedAllocationOop;
  switch (slot->type->slot_type()) {
   case obj_slot_type:
    assert(NakedMethods || !contents->has_code() || slot->type->is_vm_slot(),
           "adding an assignable slot with code");
    assert_smi(slot->data, "data slot contents isn't an offset");
    new_obj->at_put(smiOop(slot->data)->value(), contents);
    break;
   case map_slot_type:
    break;
   case arg_slot_type:
    assert_smi(contents, "argument index isn't a smiOop");
    break;
   default:
    ShouldNotReachHere(); // unexpected slot type
  }

  if (    slot->data == contents
      &&  slot->type == type
      &&  slot->get_annotation() == anno) {
    // no change (to the map, at least)!
    return new_obj;
  }
  
  // create a new map for this object
  slotsMap* new_map= copy_for_changing(mustAllocate);
  if (new_map == 0) return failedAllocationOop;
  slot = slot->shift(this, new_map);
  slot->type = type;
  slot->set_annotation(anno);
  if (!slot->is_obj_slot()) {
    Memory->store(&slot->data, contents);
  }

  new_obj->set_canonical_map(new_map);
  
  return new_obj;
}


slotsMap* slotsMap::copy_for_changing(bool mustAllocate) {
  slotsMap* new_map= (slotsMap*) copy(mustAllocate);
  if (new_map == 0) return 0;
  new_map->init_dependents();
  mapOop new_moop = new_map->enclosing_mapOop();
  new_moop->init_mark();
  return new_map;
}


// Return clone of obj with slot removed.
// If removed slot is asg slot, must also move data slot.
// If slotDesc::data is ever used for arg slots, this routine will have
//  to do more work than today -- dmu 2/93

oop slotsMap::copy_remove_slot(oop obj, stringOop name, bool mustAllocate) {

  if (    obj->is_vframe()
      ||  obj->is_assignment()
      || !obj->is_programmable_slots()) {
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  }

  slotsOop sobj = slotsOop(obj);

  slotDesc* d= find_slot(name);
  if (d == 0 || d->is_vm_slot()) {
    return ErrorCodes::vmString_prim_error(BADSLOTNAMEERROR); 
  }

  slotsOop result;

  if (d->is_assignment_slot_name(name)) {
    // remove data slot then add in as map slot
    result= copy_remove_one_slot(sobj, d, mustAllocate);
    if (oop(result) == failedAllocationOop) return failedAllocationOop;

    // add data slot back in as map slot
    result = (slotsOop)
      result->copy_add_slot(d->name, MAP_SLOT(d->type), sobj->get_slot(d),
                            d->get_annotation(), mustAllocate);
    if (oop(result) == failedAllocationOop) return failedAllocationOop;
    assert(result->is_slots(), "should not fail");

  } else {
    // remove slot
    result= copy_remove_one_slot(sobj, d, mustAllocate);
  }

  return result;
}


slotsOop slotsMap::copy_remove_one_slot(slotsOop obj, slotDesc *slot,
                                        bool mustAllocate) {
  assert_slots(obj, "object isn't a slotsOop");
  assert(!obj->is_string(), "cannot clone strings!");
  assert(slot >= slots() && slot < slotsMap::slot(length_slots()),
         "slotDesc not part of map");

  slotsMap* new_map= (slotsMap*) remove(slot, 1, mustAllocate);
  if (new_map == 0) return slotsOop(failedAllocationOop);
  new_map->slots_length = new_map->slots_length->decrement();
  new_map->init_dependents();
  mapOop new_moop = new_map->enclosing_mapOop();
  new_moop->init_mark();

  slotsOop new_obj;
  switch (slot->type->slot_type()) {
   case obj_slot_type:
    assert_smi(slot->data, "data slot contents isn't an offset");
    new_obj= obj->is_byteVector()
      ? (slotsOop) byteVectorOop(obj)->remove(object_size(obj),
                                              smiOop(slot->data)->value(), 
                                              1, mustAllocate, true)
      : (slotsOop) slotsOop(obj)->remove(object_size(obj),
                                         smiOop(slot->data)->value(), 
                                         1, mustAllocate, true);
    if (oop(new_obj) == failedAllocationOop)
      return slotsOop(failedAllocationOop);
    // check-stores done by remove already
    new_map->shift_obj_slots(smiOop(slot->data), -1);
    new_map->object_length = new_map->object_length->decrement();
    break;
   case arg_slot_type: {
    // fix up any arg slots after this one
    assert_smi(slot->data, "bad arg index");
    fint argIndex= smiOop(slot->data)->value();
    FOR_EACH_SLOTDESC(new_map, s) {
      if (s->is_arg_slot()) {
        assert_smi(s->data, "bad arg index");
        fint a= smiOop(s->data)->value();
        if (a > argIndex)
          s->data= as_smiOop(a - 1);
      }
    }
   }
   // fall through     
   case map_slot_type:
    new_obj= slotsOop(obj->clone(mustAllocate));
    if (oop(new_obj) == failedAllocationOop)
      return slotsOop(failedAllocationOop);
    break;
   default:
    ShouldNotReachHere(); // unexpected slot type;
  }

  new_obj->set_canonical_map(new_map);
  
  return new_obj;
}


void slotsMap::switch_pointer(oop obj, oop* where, oop to) {
  assert_slots(obj, "must be slotsOop");
  slotsOop sobj = slotsOop(obj);
  if (where  >=  sobj->oops(empty_object_size())) {
    Memory->store(where, to);
  }
}


void slotsMap::switch_pointer_in_map(oop* where,  oop to) {
  if (where == &annotation) {
    set_annotation(to);
    return;
  }
  Map::switch_pointer_in_map(where, to);
}


void slotsMap::shift_obj_slots(smiOop offset, fint delta) {
  FOR_EACH_SLOTDESC(this, slot) {
    if (slot->type->is_obj_slot() && smiOop(slot->data) >= offset)
      Memory->store(&slot->data,
                    as_smiOop(smiOop(slot->data)->value() + delta));
  }
}

oop slotsMap::clone(oop obj, bool mustAllocate, oop genObj) {
  assert_slots(obj, "not a slots object");
  assert(!is_byteVector(), "should override this method for a byte vector");
  slotsOop p= (slotsOop) slotsOop(obj)->copy(object_size(obj),
                                             mustAllocate, genObj);
  if (oop(p) != failedAllocationOop) p->init_mark();
  return p;
}

oop slotsMap::cloneSize(oop obj, fint length, bool mustAllocate, oop filler) {
  Unused(length); Unused(mustAllocate); Unused(filler);
  ShouldNotCallThis(); // object isn't a vector
  return obj;
}

oop slotsMap::fill_in_slots(slotList* slist, fint slotCount) {
  fint offset = empty_object_size();
  fint objCount = slist->obj_count();

  slots_length = as_smiOop(slotCount);
  object_length = as_smiOop(offset + objCount);

  slotsOop obj = create_object(offset + objCount);
  oop* p = obj->oops(offset);
  for (slotDesc* slot = slots(); slist; slist = slist->next, slot ++) {
    oop data;
    switch (slist->type()->slot_type()) {
     case obj_slot_type:
      assert(slist->contents() == 0 ||
             NakedMethods ||
             !slist->contents()->has_code() ||
             slist->type()->is_vm_slot(),
             "creating an assignable slot with code");
      data = as_smiOop(offset++);
      Memory->store(p++, slist->contents());
      break;
     case map_slot_type:
      data = slist->contents();
      break;
     case arg_slot_type:
      assert_smi(slist->contents(), "not an integer offset");
      data = slist->contents();
      break;
     default:
      ShouldNotReachHere(); // unexpected slot type
    }
    slot->init(slist->name(), slist->type(), data, slist->annotation());
  }

  slotsOop(obj)->set_canonical_map(this);
  
  return obj;
}

oop slotsMap::scavenge(oop obj) {
  // use :: to avoid another virtual function call
  return slotsOop(obj)->scavenge(slotsMap::object_size(obj)); 
}

bool slotsMap::verify(oop obj) {
  return slotsOop(obj)->verify();
}

fint slotsMap::empty_object_size() {
  return sizeof(slotsOopClass) / oopSize;
}

void slotsMap::print(oop obj) {
  if (obj->is_map()) {
    // do nothing special
  } else {
    if (obj == (oop) Memory->trueObj) {
      lprintf("true ");
    } else if (obj == (oop) Memory->falseObj) {
      lprintf("false ");
    } else if (obj == (oop) Memory->nilObj) {
      lprintf("nil ");
    } else if (obj == (oop) Memory->lobbyObj) {
      lprintf("lobby ");
    }
    printObjectID(obj);
    lprintf(": ");
  }
  Map::print(obj);
}

void slotsMap::dummy_initialize(oop obj, oop filler) {
  Unused(obj); Unused(filler); }

oop slotsMap::dummy_obj(oop filler) {
  fint offset = empty_object_size();
  fint n_slots= length_obj_slots();
  slotsOop obj= create_object(offset + n_slots);
  obj->set_map(this);

  { // fill in the data slots with filler
    oop* p = obj->oops(offset);
    for (fint n= 0; n < n_slots; ++n) {
      Memory->store(p++, filler);
    }
  }

  dummy_initialize(obj, filler);

  return obj;
}

oop slotsMap::mirror_copy_set_annotation(oop r, oop a, bool mustAllocate) {
  if (!is_programmable_slots())
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);

  assert_slots(r, "better be slotsOop");
  slotsOop new_obj = slotsOop(r)->clone(mustAllocate);
  if (new_obj == slotsOop(failedAllocationOop))
    return slotsOop(failedAllocationOop);

  slotsMap* new_map= copy_for_changing(mustAllocate);
  if (new_map == 0) return slotsOop(failedAllocationOop);
  new_map->set_annotation(a);
  new_obj->set_canonical_map(new_map);
  return new_obj->fix_up_method(r, false, mustAllocate);
}

