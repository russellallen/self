/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "map.hh"

# include "_map.cpp.incl" 

Map* Map::create_map(fint size, slotList *slots, Map* mm, oop *obj) {
  fint slotCount= slots ? slots->length() : 0;
  mapOop mo = as_mapOop(
    Memory->alloc_objs(   enclosed_map_offset + (size + slotCount * sizeof(slotDesc))/oopSize)  );
  mo->init_mark();
  Memory->store((oop*)&mo->addr()->_map, Memory->map_map->enclosing_mapOop());
  
  Map* m= mo->map_addr();
  m->set_vtbl_value(mm->vtbl_value());
  m->initialize();
  m->set_annotation(Memory->objectAnnotationObj);
  if (m->is_slots() || slotCount > 0)
    *obj= m->fill_in_slots(slots, slotCount);
  return m;
}


FindSlotCache findSlotCache;

inline bool FindSlotCache::checkFor1ArgKW(stringOop name, stringOop &unary) {
  if (name == last1ArgKW) {
    unary= lastUnary;
    return true;
  }
  if (name->is_1arg_keyword()) {
    last1ArgKW= name;
    lastUnary= unary= name->unary();
    return true;
  }
  return false;
}

bool FindSlotCache::verify() {
  if (last1ArgKW == stringOop(badOop) && lastUnary == stringOop(badOop))
    return true;
  bool flag= last1ArgKW->verify() && lastUnary->verify();
  if (!last1ArgKW->is_1arg_keyword() || !lastUnary->is_unary()) {
    error("bad findSlotCache");
    flag= false;
  }
  return flag;
}
  

// we can merge search for foo and foo: because stringOop::cmp
// orders foo: before foo0
fint Map::find_slot_index_binary_for(stringOop name, bool &found) {
  stringOop shortName;
  if (!findSlotCache.checkFor1ArgKW(name, shortName)) shortName= name;
  slotDesc *s= slots();
  fint low= 0;
  fint high= length_slots() - 1;
  while (low <= high) {
    fint i= (low + high) / 2;
    stringOop sin= s[i].name;
    if (sin == name
    ||  (sin == shortName && s[i].is_obj_slot())) {
      found= true;
      return i;
    }
    if (sin->cmp(name) < 0) {
      low= i + 1; 
    } else {
      high= i - 1;
    }
  }
  found= false;
  return low;
}

inline slotDesc* Map::find_slot_binary(stringOop name) {
  bool found;
  fint i= find_slot_index_binary_for(name, found);
  return found ? slot(i) : NULL;
}

inline slotDesc* Map::find_slot_linear(stringOop name) {
  stringOop shortName;
  if (findSlotCache.checkFor1ArgKW(name, shortName)) {
    FOR_EACH_SLOTDESC(this, slot) {
      if (slot->name == name
          || (slot->is_obj_slot() && slot->name == shortName))
        return slot;
    }
  } else {
    FOR_EACH_SLOTDESC(this, slot) {
      if (slot->name == name)
  return slot;
    }
  }
  return NULL;
}


fint Map::find_slot_index_linear_for(stringOop name, bool &found) {
  stringOop shortName;
  if (findSlotCache.checkFor1ArgKW(name, shortName)) {
    FOR_EACH_SLOTDESC_N(this, slot, i) {
      if (slot->name == name
          || (slot->is_obj_slot() && slot->name == shortName)) {
        found= true;
        return i;
      }
      if (slot->name->cmp(name) > 0) {
        found= false;
        return i;
      }
    }
  } else {
    FOR_EACH_SLOTDESC_N(this, slot, i) {
      if (slot->name == name) {
        found= true;
        return i;
      }
      if (slot->name->cmp(name) > 0) {
        found= false;
        return i;
      }
    }
  }
  found= false;
  return length_slots();
}


static fint big_map_thresh; // set in findSlot_init, below

fint Map::find_slot_index_for(stringOop name, bool &found) {
  if (length_slots() > big_map_thresh)
    return find_slot_index_binary_for(name, found);
  else
    return find_slot_index_linear_for(name, found);
}


slotDesc* Map::find_slot(stringOop name) {
  if (length_slots() > big_map_thresh)
    return find_slot_binary(name);
  else
    return find_slot_linear(name);
}


slotDesc* Map::find_nonVM_slot(stringOop name) {
  slotDesc* sd = find_slot(name);
  return  sd != NULL  &&  !sd->is_vm_slot()  ?  sd  :  NULL;
}


// given "foo:", find "foo" (return NULL if not found)
slotDesc* Map::find_assignee_slot(stringOop assigner_name) {
  return find_slot(new_string(assigner_name->bytes(),
                              assigner_name->length() - 1));
}



// Allow fast defines of methods when the generated code does not change.
// This check must be recursive because the literals 
// (i.e. the actual literal vectors) won't be the same objects because
// of the backpointer that must be embedded from the vector to the method.

static bool recursive_method_similarity_check(oop o1, oop o2) {
  if (!FastMethodDefines) return false;
  
  if (o1 == o2) return true;
  if (o1->is_block()  &&  o2->is_block())
    return recursive_method_similarity_check(
                            blockOop(o1)->value(),
                            blockOop(o2)->value());

  if (!o1->has_code()  ||  !o2->has_code())
    return false;
  
  if ( o1->kind()  != o2->kind() )
    return false;

  if (o1->codes() != o2->codes()) return false;

  // arg count must be same
  if (o1->arg_count() != o2->arg_count()) return false;


  // slots must be same
  Map *m1= o1->map();
  Map *m2= o2->map();
  fint nSlots = m1->length_slots();
  if (m2->length_slots() != nSlots) return false;

  SlotIterator *it= m1->slotIterator();
  FOR_EACH_SLOTDESC(m2, s2) {
    slotDesc *s1= it->slot_desc();

    if (    s1->name != s2->name
        ||  s1->type != s2->type
        ||  s1->data != s2->data)
      if (s1->is_vm_slot())
        assert(   s1->name == VMString[SELF]
               || s1->name == VMString[LEXICAL_PARENT],
               "Found a new VM slot in a method that I may not be able to ignore");
      else
        return false;

    it->next();
  }

  objVectorOop l1 = o1->literals();
  objVectorOop l2 = o2->literals();
  if ( l1->length() != l2->length() ) return false;
  for (fint i = 0;  i < l1->length();  i++)
    if ( ! recursive_method_similarity_check( l1->obj_at(i), l2->obj_at(i)) )
      return false;

  return true;
}
    

// The cloning semantics allow the optimization included here.
// I am restricting this to slotsOops to keep it simple.
// Otherwise would have to worry about changing smallInts such as
//  slot offsets, etc.
// The problem is that 1. could not keep the hash, and 2. the zone code
//  is not smart enough to change slotsOops to smiOops.
// If the hash were not propagated, the maps would need to be
//  recanonicalized.
// Mirrors will do a recursive define so that they can change their
//  maps, etc when the reflectee changes type.
//  -- dmu 1/93
// Can return failedAllocationOop if out of space due to copy of large object

oop Map::define(oop obj, oop contents) {
  if (   !obj     ->is_programmable_slots() 
      || !contents->is_programmable_slots()) {
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  }

  // cannot change a non-method to a method cause the non-method
  //  might be in an obj_slot instead of a map_slot
  // I think this is OK for NakedMethods -- dmu 3/02
  if (!NakedMethods && !obj->is_method_like() && contents->is_method_like()) {
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  }

  slotsOop sobj = slotsOop(obj);
  slotsOop scon = slotsOop(contents);

  slotsOop result;
  fint sobjSize = sobj->size();

  // assume as_mirror() will not fail
  if (    scon->size() == sobjSize
      && !scon->is_byteVector()  
      && !sobj->is_byteVector()
      && (
               // contents not method, mirror check will ensure recvr
               //  not method either, both not methods is OK
               !scon->is_method_like()
          ||
                recursive_method_similarity_check(sobj, scon)
         )        
      // cannot do fast one if mirrors need to change; must visit mirrors 
      &&  sobj->as_mirror()->map() == scon->as_mirror()->map()) { 
    // fast define: just overwrite lhs with right (excluding mark)
    oop* sobjOops = sobj->oops();
    // don't overwrite mark word (don't change hash/age of object)
    copy_oops(scon->oops() + 1, sobjOops + 1, sobjSize - 1);
    Memory->record_multistores(sobjOops + 1, sobjOops + sobjSize);
    result = sobj;
  } else {
    // slow define: switch pointers from lhs to a clone of the rhs            

    BlockProfilerTicks bpt(include_type);

    result = slotsOop(scon->clone_into_same_gen(sobj, CANFAIL));
    if (oop(result) == failedAllocationOop) return failedAllocationOop;
    assert(result != scon, // see switch_pointer_in_map (dmu)
           "switch_pointers needs a new object to avoid creating redundant maps");

    // copy over hash to new object
    // used to be:
    //  int32 hash = sobj->mark()->hash_in_place();
    //  result->set_mark(result->mark()->set_hash_in_place(hash));
    // which avoided assigning a hash just for this.
    // However, I think it is cleaner, to just use the external interface.
    // That way the callee can simply check for the same identity_hash
    //  on old & new objects.
    // It has to check so that switching pointers in a map will not change
    //  the map's hash in the canonicalization table (mapTable) -- dmu 11/93.

    result->set_identity_hash(sobj->identity_hash());

    Memory->switch_pointers(sobj, result);
  }
  // too late to fail
  result = (slotsOop)result->fix_up_method( contents, false, !CANFAIL);
  assert_slots(result, "just checking");

  return result;
}


// Add all slots of contents to the receiver.  
// If new_only, then add slot only if it doesn't already exist.

oop Map::add_slots_to(oop src, oop dst, bool new_only, void *FH) {
  assert(src->map() == this, "oops!");

  if (    dst->is_vframe()
      ||  dst->is_method_like()
      || !dst->is_programmable_slots()) {
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  }

  oop result = dst;

  {
    FOR_EACH_SLOTDESC(this, s) {
      slotDesc *old;
      oop result2;
      if (new_only
          && (old= dst->find_slot(s->name), old != NULL)) {
        if (s->is_obj_slot() && !old->is_obj_slot()) {
          // must add assignment slot
          assert_slots(result, "can only add slots to a slotsOop");
          result2= slotsOop(result)->
            copy_add_slot_fixing_up_method( s->assignment_slot_name(),
                                            MAP_SLOT(s->type),
                                            Memory->assignmentObj,
                                            old->annotation);
        } else {
          continue; // do nothing
        }
      } else {
        assert_slots(result, "can only add slots to a slotsOop");
        result2= slotsOop(result)->
          copy_add_slot_fixing_up_method( s->name,
                                          s->type,
                                          src->get_slot(s),
                                          s->get_annotation());
      }
      if (result2 == failedAllocationOop) {
        out_of_memory_failure(FH, result->size() + 1);
        return NULL;
      }
      result= result2;
      if (result->is_mark()) return result;
    }
  }

  // Update the annotation of the dst object.
  oop anno = get_annotation();
  if (anno != Memory->objectAnnotationObj) {
    oop result2= result->mirror_copy_set_annotation(anno);
    if (result2 == failedAllocationOop) {
      out_of_memory_failure(FH, result->size());
      return NULL;
    }
    result = result2;
  }
  oop r = dst->define_prim(result, FH);
  return r;
}

     
oop Map::copy_add_slot(oop obj, stringOop name, slotType t, oop contents,
                       oop anno,
                       bool mustAllocate) {
  Unused(obj); Unused(name); Unused(t); Unused(contents);
  Unused(anno);
  Unused(mustAllocate);
  return ErrorCodes::vmString_prim_error(BADTYPEERROR);
}


oop Map::copy_remove_slot(oop obj, stringOop name, bool mustAllocate) {
  Unused(obj); Unused(name); Unused(mustAllocate);
  return ErrorCodes::vmString_prim_error(BADTYPEERROR);
}


// Called when Define does a switch_pointers and it finds a match in map.
//  It could be something we should not change, so only change it
//  if it is contained in a slot -- dmu 1/93
void Map::switch_pointer_in_map(oop* where,  oop to) {
  fint i= ((char*)where - (char*)slots()) / sizeof(slotDesc);

  if (i < 0 || i >= length_slots()) return;

  slotDesc *s= slot(i);

  if (&s->annotation == where) {
    s->set_annotation(to);
  }
  else if (&s->data == where  &&  s->is_map_slot()  && !s->is_vm_slot()) {
    switch_pointer_in_map_slot(s, where, to);
  }
}

void Map::switch_pointer_in_map_slot(slotDesc *s, oop *where, oop to) {
  Unused(s);
  Memory->store(where, to);
}


oop Map::fix_up_method( oop obj, 
                        oop old_optimized_method, 
                        bool isOKToBashLiteralVector,
                        bool mustAllocate,
      IntBList* stack_deltas ) {
  Unused(mustAllocate); 
  Unused(isOKToBashLiteralVector);
  Unused(old_optimized_method);
  Unused(stack_deltas);
  // except for methods, is noop
  return obj;
}

fint Map::length_nonVM_slots() {
  fint i = 0;
  FOR_EACH_SLOTDESC(this, slot) {
    if (!slot->is_vm_slot())
      i += slot->is_obj_slot() ? 2 : 1;
  }
  return i;
}

fint Map::length_obj_slots() {
  fint slotCount = 0;
  FOR_EACH_SLOTDESC(this, s) {
    if (s->is_obj_slot()) slotCount++;
  }
  return slotCount;
}


oop Map::cloneSize(oop obj, fint length, bool mustAllocate, oop filler) {
  Unused(length); Unused(mustAllocate); Unused(filler);
  ShouldNotCallThis(); // object isn't a vector
  return obj;
}

bool Map::verifyBytesPart(oop obj, char*& b) {
  // nothing more to do
  Unused(obj); Unused(b);
  return true;
}

bool Map::compare(Map* m) {
  // INPUT: another map object, its slots and its length
  // OUTPUT: true if this map is equivalent to m, else false

  // make sure it's not mapMap
  assert(!m->is_map(), "map can't be mapMap");

  // check if they are the same type
  if (m->vtbl_value() != vtbl_value()) return false;
      
  // check if they have the same number of slots
  fint length = length_slots();
  if (m->length_slots() != length) return false;

  // check object annotations
  if (m->get_annotation() != get_annotation()) return false;
          
  // check slots are equivalent.  
  slotDesc *m_slot= m->slots();
  FOR_EACH_SLOTDESC(this, slot) {
    if (slot->name != m_slot->name) return false;
    if (!m_slot->compare(slot)) return false;
    ++m_slot;
  }
  
  // check if one has code and the other doesn't
  if (has_code()) {
    assert(m->has_code(), "one compared map has code, other doesn't");
    return false; // code comparison not implemented
  } else {
    assert(!m->has_code(), "one compared map has code, other doesn't");
  }

  // if got this far, then equivalent
  return true;
}

bool Map::equal(Map* other) {
  return enclosing_mapOop()->equal(other->enclosing_mapOop());
}

int32 getObjectID(oop obj) {
  int32 i = CurrentObjectID % NumObjectIDs;
  if (i) i--; else i = NumObjectIDs - 1;
  int32 id = CurrentObjectID - 1;
  int32 m = max(0, CurrentObjectID - NumObjectIDs);
  while (id >= m && Memory->objectIDArray->obj_at(i) != obj) {
    id--;
    if (--i < 0) i += NumObjectIDs;
  }
  if (id >= m) {
    assert(Memory->objectIDArray->obj_at(i) == obj, "not found");
  } else {
    Memory->objectIDArray->obj_at_put(CurrentObjectID % NumObjectIDs, obj);
    id = CurrentObjectID++;
  }
  return id;
}

void printObjectID(oop obj) {
  int32 id = bootstrapping ? -1 : getObjectID(obj);
  lprintf("<%ld", (void*)id);
  if (PrintOopAddress) {
    lprintf(" (0x%lx)", obj);
  }
  lprintf(">");
}

void SetNumObjectIDs(int32 length) {
  if (length > 1) {
    objVectorOop newArray= Memory->objectIDArray->cloneSize(length, CANFAIL);
    // make sure old objects are released
    for (int32 i = 0;  i < length;  ++i)
      newArray->obj_at_put(i, as_smiOop(0));
    if (oop(newArray) != failedAllocationOop) {
      Memory->objectIDArray= newArray;
      NumObjectIDs = length;
    }
  }
}

void Map::print_string(oop obj, char* buf) {
  if (obj == (oop) Memory->trueObj) {
    sprintf(buf, "true");
  } 
  else if (obj == (oop) Memory->falseObj) {
    sprintf(buf, "false");
  } 
  else if (obj == (oop) Memory->nilObj) {
    sprintf(buf, "nil");
  } 
  else if (obj == (oop) Memory->lobbyObj) {
    sprintf(buf, "lobby");
  } 
  else if (obj == (oop) Memory->errorObj) {
    sprintf(buf, "<!error object!>");
  } 
  else {
    sprintf(buf, "<%d>", obj->objectID_prim());
  }
}

void Map::print_oop(oop obj) {
  if (obj == (oop) Memory->trueObj) {
    lprintf("true");
    if (PrintOopAddress) {
      lprintf(" (0x%lx)", obj);
    }
  } else if (obj == (oop) Memory->falseObj) {
    lprintf("false");
    if (PrintOopAddress) {
      lprintf(" (0x%lx)", obj);
    }
  } else if (obj == (oop) Memory->nilObj) {
    lprintf("nil");
    if (PrintOopAddress) {
      lprintf(" (0x%lx)", obj);
    }
  } else if (obj == (oop) Memory->lobbyObj) {
    lprintf("lobby");
    if (PrintOopAddress) {
      lprintf(" (0x%lx)", obj);
    }
  } else if (obj == (oop) Memory->errorObj) {
    lprintf("<!error object!>");
    if (PrintOopAddress) {
      lprintf(" (0x%lx)", obj);
    }
  } else {
    printObjectID(obj);
  }
}

void Map::print(oop obj) {
  if (obj->is_map()) {
    lprintf("map ");
  }
  lprintf("( ");
  fint length = length_slots();
  if (length || obj->is_block()) {
    lprintf("| ");
    FOR_EACH_SLOTDESC(this, slot) {
      if (slot->is_vm_slot()) {
        if (! WizardMode) continue;
        lprintf("{");
      }
      slot->printAugmentedName();
      if (slot->is_arg_slot()) {
        lprintf(" = <arg %ld>", smiOop(slot->data)->value());
      } else if (slot->is_map_slot()) {
        lprintf(" = ");
        slot->data->print_oop();
      } else {
        assert(slot->is_obj_slot(), "unexpected slot type");
        if (obj->is_map()) {
          // just printing a map; there isn't an object to print
          lprintf(" = <offset %ld>", slot->data);
        } else {
          // printing a real object; fetch its slot
          lprintf(" <- ");
          obj->get_slot(slot)->print_oop();
        }
      }
      if (slot->is_vm_slot()) lprintf("}");
      lprintf(". ");
    }
    lprintf("| ");
  }
  print_objVector(obj);
  print_byteVector(obj);
  print_code(obj);
  lprintf(")\n");
}

bool Map::has_assignment_slots() {
  FOR_EACH_SLOTDESC(this, s) {
    if (!s->is_vm_slot() && s->is_obj_slot())
      return true;
  }
  return false;
}

bool Map::matching_slots_data(oop match) {
  FOR_EACH_SLOTDESC(this, s) {
    if (!s->is_vm_slot() && s->is_map_slot() && s->data == match)
      return true;
  }
  return false;
}

// used for enumerating implementors
bool Map::matching_slots_name(oop match) {
  FOR_EACH_SLOTDESC(this, s) {
    if (!s->is_vm_slot() && s->name == match)
      return true;
  }
  return false;
}

// used for enumerating implementors
bool Map::matching_slots_assignment_name(oop match) {
  FOR_EACH_SLOTDESC(this, s) {
    if (!s->is_vm_slot() && s->name == match)
      return s->is_obj_slot();
  }
  return false;
}


# define GET_SLOT_DESC                                                        \
    slotDesc* sd = find_nonVM_slot(name);                                     \
    if (sd == NULL) return ErrorCodes::vmString_prim_error(SLOTNAMEERROR)                          

oop Map::mirror_is_parent_at(oop r, stringOop name) {
  Unused(r);
  GET_SLOT_DESC;
  return sd->is_assignment_slot_name(name) ? Memory->falseObj
    : sd->is_parent() ? Memory->trueObj : Memory->falseObj;
}

oop Map::mirror_is_assignable_at(oop r, stringOop name) {
  Unused(r);
  GET_SLOT_DESC;
  return sd->is_obj_slot() && sd->name == name
    ? Memory->trueObj : Memory->falseObj;
}

oop Map::mirror_is_argument_at(oop r, stringOop name) {
  Unused(r);
  GET_SLOT_DESC;
  return sd->is_arg_slot() ? Memory->trueObj : Memory->falseObj;
}

oop Map::mirror_names(oop ignored) {
  Unused(ignored);
  objVectorOop r= Memory->objVectorObj->cloneSize(length_nonVM_slots());
  fint i= 0;
  FOR_EACH_SLOTDESC(this, sd) {
    if (!sd->is_vm_slot()) {
      r->obj_at_put(i++, sd->name);
      if (sd->is_obj_slot())
        r->obj_at_put(i++, sd->assignment_slot_name());
    }
  }
  return r;
}


// get name of selector at index inx;
//  used to decode local access bytecodes

oop Map::mirror_name_at(oop obj, smi inx) {
  Unused(obj);
  if (inx < 0 || inx >= length_slots()) 
    return ErrorCodes::vmString_prim_error(BADINDEXERROR);
  return slot(inx)->name;
}


oop Map::mirror_contents_at(oop r, stringOop name) {
  GET_SLOT_DESC;
  if (sd->is_obj_slot() && name->is_1arg_keyword())
    return Memory->assignmentMirrorObj;
  if (sd->is_arg_slot())
    return Memory->nilObj->as_mirror();
  return r->get_slot(sd)->as_mirror();
}

oop Map::mirror_get_annotation(oop r) {
  Unused(r);
  return get_annotation();
}

oop Map::mirror_copy_set_annotation(oop r, oop a, bool mustAllocate) {
  Unused(r); Unused(a); Unused(mustAllocate);
  return ErrorCodes::vmString_prim_error(BADTYPEERROR);
}

oop Map::mirror_annotation_at(oop r, stringOop name) {
  Unused(r);
  GET_SLOT_DESC;
  return sd->get_annotation();
}


# define CODE_PRIM(name)                                                      \
    oop Map::name(oop r) { Unused(r); return ErrorCodes::vmString_prim_error(REFLECTTYPEERROR); }  \
    
CODE_PRIM(mirror_codes)
CODE_PRIM(mirror_literals)
CODE_PRIM(mirror_source)
CODE_PRIM(mirror_source_length)
CODE_PRIM(mirror_source_offset)
CODE_PRIM(mirror_file)
CODE_PRIM(mirror_line)
CODE_PRIM(mirror_sender)
CODE_PRIM(mirror_parent)
CODE_PRIM(mirror_selector)
CODE_PRIM(mirror_bci)
CODE_PRIM(mirror_receiver)
CODE_PRIM(mirror_expr_stack)
CODE_PRIM(mirror_methodHolder)

static int time_find_slot(slotDesc* (Map::*searchFn)(stringOop),
        stringOop s, Map* m) {
  ProcessInfo::update();
  int t0= ProcessInfo::user_time().milli_secs();
  for (fint i= 0; i < 100000; ++i)
    (m->*searchFn)(s); // C++ is amazing, isn't it?
  ProcessInfo::update();
  int t1= ProcessInfo::user_time().milli_secs();
  return t1 - t0;
}

static Map* build_map_of_size(fint i) {
  slotList* slist= NULL;
  char nm[3];
  nm[0]= nm[1]= 'a'; nm[2]= 0;
  fint incCh= i > 26 ? 1 : 0;
  while (i-- > 0) {
    stringOop s= new_string(nm);
    slist= slist->add(s, map_slotType, Memory->nilObj);
    nm[incCh]++;
    if (nm[incCh] > 'z') {
      nm[0]++; nm[1]= 'a';
    }
  }
  oop obj= create_slots(slist);
  return obj->map();
}

// figure out map size at which binary search is better than linear
void findSlot_init() {
  fint i= 1;
  int t_linear, t_binary;
  do {
    i *= 2;
    if (i > 26*26) break; 
    Map *m= build_map_of_size(i);
    stringOop s= m->slot(i / 2 - 1)->name;
    // preceeding ampersands needed for MetroWorks
    t_linear= time_find_slot(&Map::find_slot_linear, s, m);
    t_binary= time_find_slot(&Map::find_slot_binary, s, m);
  } while (t_linear <= t_binary);
  big_map_thresh= i / 2;
  LOG_EVENT1("setting find slot threshold to %d", big_map_thresh);
}

