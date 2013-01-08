/* Sun-$Revision: 30.9 $ */ 

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "enumeration.hh"
# pragma implementation "preserve.hh"

# include "_enumeration.cpp.incl"

static enumeration* package_enumeration;

void enumeration_list::add_more(oop obj, enumeration_list*& head,
                                fint& totCnt) {
  enumeration_list* p = new enumeration_list(my_enumeration);
  p->next = head;
  head = p;
  p->add(obj, head, totCnt);
}

void enumeration_list::oops_do(oopsDoFn f) {
  package_enumeration = my_enumeration;
  for (enumeration_list* list = this;  list;  list = list->next) {
    oop* p = list->contents;
    oop* e = p + list->count;
    while (p < e) {
      f(p++);
      if (!my_enumeration->is_ok()) return;
    }
  }
}

static void unmarkThisObject(oop* p) {(*p)->unmarkThisObject();}

void package_enumeration_result(oop* p) {
  oop obj = *p;
  obj->unmarkThisObject();
  obj= oop(obj->as_mirror_or_fail());
  if (obj == failedAllocationOop)
    package_enumeration->set_error(ErrorCodes::vmString_prim_error(OUTOFMEMORYERROR));
  else
    Memory->store(package_enumeration->resultp++, obj);
}

void package_enumeration_maps(oop* p) {
  (*p)->unmarkThisObject();
  *(package_enumeration->maps_p++) = *p;
}

void enumeration::set_error(markOop e) {
  objs->oops_do(unmarkThisObject);
  maps->oops_do(unmarkThisObject);
  error_code = e;
}

void enumeration::pack_result() {
  resultVector= Memory->objVectorObj->cloneSize(obj_count, CANFAIL);
  if (oop(resultVector) == failedAllocationOop) {
    set_error(ErrorCodes::vmString_prim_error(OUTOFMEMORYERROR));
    return;
  }
  resultp = resultVector->objs();
  objs->oops_do(package_enumeration_result);
}

void enumeration::pack_maps() {
  // Make one extra element for sentinel
  maps_array = maps_p = NEW_RESOURCE_ARRAY(oop, map_count + 1);
  maps->oops_do(package_enumeration_maps);
}


static bool compute_limit(oop              in_limit, 
                          unsigned long  &out_limit,
                          VMStringsIndex &failIndex) {
  if (in_limit == infinityOop) {
    out_limit = (unsigned long)AllBits;
    return true;
  }
  if (!in_limit->is_smi()) {
    failIndex = BADTYPEERROR;
    return false;
  }
  smi i = smiOop(in_limit)->value();
  if (i < 0) {
    failIndex = PRIMITIVEFAILEDERROR;
    return false;
  }
  out_limit = i;
  return true;
}

// Check all elements are mirrors and count the number of vframeOops, 
//  stringOops, and assignmentOops. 
// Returns false if found a non-mirror element.
static bool valid_targets(oop* oops, unsigned int n,
                          smi& num_live_vframes,
                          smi& num_assignments) {
  num_live_vframes = 0;
  num_assignments  = 0;
  
  for (oop* end = oops + n;  oops < end;  ++oops) {
    oop obj = *oops;
    if (!obj->is_mirror())
      return false;
    oop r = mirrorOop(obj)->reflectee();
    if (r->is_assignment())
      num_assignments++;
    else if (r->is_vframe()  &&  vframeOop(r)->is_live())
      num_live_vframes++;
  }
  return true;
}

bool enumeration::is_target(oop t) {
  for (int j = 0;  j < num_targets;  j++)
    if (t == targetp[j])
      return true;
  return false;
}

// Enumerate references
// given a vector of mirrors on objects, return a vector of references
//  to the objects
//
// Vframes are tricky, since blocks also refer to them via an
//  integer-tagged scope pointer.
// In order to handle them we copy and expand the vector so that the
//   first part of the vector holds the scope pointers, then the next part
//  holds the vframe oops, the the rest holds the non-vframe objects
//  (not mirrors)
//   -- LB & DU  12/91
oop referencesEnumeration::enumerate_vector_references(objVectorOop vector, oop limit) {
  unsigned long cLim;
  VMStringsIndex failIndex;
  if (!compute_limit(limit, cLim, failIndex))
    return ErrorCodes::vmString_prim_error(failIndex);
  
  smi num_targets = vector->length();
  smi num_live_vframes;
  smi num_assignments;
  
  if(num_targets == 0)
    return ErrorCodes::vmString_prim_error(ENUMERATIONTARGETERROR);
  
  if (!valid_targets(vector->objs(), num_targets,
                     num_live_vframes, num_assignments))
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  
  ResourceMark m;
  
  // Calculate targets for the enumeration.
  oop* targetp = NEW_RESOURCE_ARRAY(oop, num_targets + num_live_vframes
                                          - num_assignments);
  
  int current_vframe = 0;
  int current_obj    = 2 * num_live_vframes;
  
  for (int j = 0;  j < num_targets;  j++) {
    oop       obj = mirrorOop(vector->obj_at(j))->reflectee();
    vframeOop vfo = vframeOop(obj);
    if (obj->is_vframe()  &&   vfo->is_live())  {
      // 2 targets for each vframeOop.
      targetp[current_vframe + num_live_vframes] = obj;
      targetp[current_vframe++]                  = vfo->enumeration_target();
    } else if (!obj->is_assignment())
      targetp[current_obj++] = obj;
  }
  
  enumeration* e = new referencesEnumeration(targetp,
                                             num_targets - num_assignments,
                                             num_live_vframes, 
                                             num_assignments > 0, 
                                             cLim);
  e->enumerate();
  return e->is_ok() ? oop(e->resultVector) : oop(e->error_code);
}

void referencesEnumeration::enumerate() {
  // collect objects with slots in them, and maps of clone families
  // containing the desired slots.
  
  if (has_assignments) {
    // For each map in Memory this->filter_map is called
    Memory->enumerate_maps(this);
    if (!is_ok()) return;
  }
  
  // For each match in Memory this->filter_match is called
  Memory->enumerate_matches(this);
  if (!is_ok()) return;
  
  processes->enumerate_references(this);
  
  // collect family members
  if (map_count > 0) {
    pack_maps();
    Memory->enumerate_families(this);
    processes->enumerate_families(this);
    if (!is_ok()) return;
  }
  
  pack_result(); 
}

void referencesEnumeration::filter_match(oopsOop obj,
                                         oop*    matching_cell,
                                         smi     targetNo) {
  if (targetNo < num_live_vframes)   
    consider_vframe(obj, matching_cell, targetNo);
  else
    consider_obj   (obj, matching_cell, targetNo);
}

void referencesEnumeration::consider_vframe(oopsOop  obj,
                                            oop*     matching_cell,
                                            smi      targetNo) {
  if (              obj ->is_block()
      &&   blockOop(obj)->scope(true) ==  (frame*) *matching_cell
      &&   blockOop(obj)->desc()      ==  vframeOop(targetp[targetNo +
                                                            num_live_vframes])
      ->descOffset())
    add_obj(obj);
}

void referencesEnumeration::consider_obj(oopsOop  obj,
                                         oop*     matching_cell,
                                         smi      targetNo) {
  Unused(targetNo);
  if (obj ->is_map()) {
    if (mapOop(obj)->map_addr()->matching_slots_data(*matching_cell))
      add_map(mapOop(obj)->map_addr());
  } else if (obj->is_enumerable(matching_cell))
    add_obj(obj);
}

void referencesEnumeration::filter_map(mapOop obj) {
  if (obj->map_addr()->has_assignment_slots())
    add_map(obj->map_addr());
}


// Enumerate implementors.
oop implementorsEnumeration::enumerate_vector_implementors(objVectorOop vector, oop limit) {
  unsigned long cLim;
  VMStringsIndex failIndex;
  if (!compute_limit(limit, cLim, failIndex))
    return ErrorCodes::vmString_prim_error(failIndex);
  
  smi num_targets = vector->length();
  
  if (num_targets == 0)
    return ErrorCodes::vmString_prim_error(ENUMERATIONTARGETERROR);    
  
  // Count the number of strings in vector.
  // For 1-arg keywords, include the non-keyword variant to catch
  // assignable slots
  smi num_strings = 0;
  for (int i= 0; i < num_targets; i++) {
    oop el= vector->obj_at(i);
    if (el->is_string()) {
      stringOop s= stringOop(el);
      num_strings += s->length() > 0 && s->is_1arg_keyword() ? 2 : 1;
    }
  }

  if (num_strings == 0)
    return ErrorCodes::vmString_prim_error(ENUMERATIONTARGETERROR);    

  ResourceMark m;
  
  // Calculate targets for the enumeration.
  // Put the potentially spurious ones (the unary form of a 1-arg keyword)
  // at the end.
  oop* targetp = NEW_RESOURCE_ARRAY(oop, num_strings);
  
  int current_obj= 0;
  int current_poss_assignment= num_strings - 1;
  for (int j = 0; j < num_targets; j++) {
    oop obj = vector->obj_at(j);
    if (obj->is_string()) {
      targetp[current_obj++]= obj;
      stringOop s= stringOop(obj);
      if (s->length() > 0 && s->is_1arg_keyword())
        targetp[current_poss_assignment--]= s->unary();
    }
  }
  assert(current_obj == current_poss_assignment + 1,
         "mistake in counting names");
  
  enumeration* e = new implementorsEnumeration(targetp,
                                               num_strings,
                                               current_obj,
                                               cLim);
  e->enumerate();
  return e->is_ok() ? oop(e->resultVector) : oop(e->error_code);
}

void implementorsEnumeration::enumerate() {
  if (num_targets <= 0) return;
  
  Memory->enumerate_matches(this);
  if (!is_ok()) return;
  
  if (map_count > 0) {
    pack_maps();
    Memory->enumerate_families(this);
    processes->enumerate_families(this);
    if (!is_ok()) return;
  }
  
  pack_result();  
}

void implementorsEnumeration::filter_match(oopsOop obj,
                                           oop*    matching_cell,
                                           smi     targetNo) {
  if (obj->is_map()) {
    Map *map= mapOop(obj)->map_addr();
    if (targetNo < poss_assignments_index) {
      if (map->matching_slots_name(*matching_cell))
        add_map(map);
    } else if (map->matching_slots_assignment_name(*matching_cell))
      add_map(map);
  }
}


// Enumerate all objects in the self world.
oop allObjEnumeration::enumerate_all_objs(oop limit) {
  unsigned long cLim;
  VMStringsIndex failIndex;
  if (!compute_limit(limit, cLim, failIndex))
    return ErrorCodes::vmString_prim_error(failIndex);
  
  ResourceMark m;
  
  enumeration* e = new allObjEnumeration(cLim);
  e->enumerate();
  return e->is_ok() ? oop(e->resultVector) : oop(e->error_code);
}

void allObjEnumeration::enumerate() {
  Memory->enumerate_all_objs(this);
  // Cannot do a verify now, the objects are marked.
  if (!is_ok()) return;
  
  add_obj(as_floatOop(0.0));
  add_obj(as_smiOop(0));

  pack_result();
}

