/* Sun-$Revision: 30.15 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "space.hh"
# pragma implementation "space_inline.hh"

# include "_space.cpp.incl"

void space::init_space(const char *n, int32 &size, char *bottom) {
  size = roundTo(size, idealized_page_size);
  name = n;
  objs_bottom = objs_top = (oop*)bottom;
  bytes_bottom = bytes_top = (oop*)(bottom + size);
}


space::space(const char *n, char *bottom, char *top) {
  assert(is_idealized_page_multiple(int(bottom)) && is_idealized_page_multiple(int(top)),
         "invalid space boundaries");
  name = n;
  objs_bottom = objs_top = (oop*)bottom;
  bytes_bottom = bytes_top = (oop*)top;
}


space::space(const char *n, FILE *snap) {
  name = n;

  OS::FRead_swap(&old_objs_bottom, oopSize, snap);
  OS::FRead_swap(&old_objs_top,    oopSize, snap);
  if (old_objs_top < old_objs_bottom)
    fatal2("snapshot format error reading %s: objs_top < objs_bottom (position 0x%x)", 
           name, ftell(snap));
  OS::FRead_swap(&old_bytes_bottom, oopSize, snap);
  OS::FRead_swap(&old_bytes_top,    oopSize, snap);
  if (old_bytes_top < old_bytes_bottom)
    fatal1("snapshot format error reading %s: bytes_top < bytes_bottom", name);
}


static void snap_error(const char *msg) { fatal1("snapshot format error: %s", msg); }

void space::read_snapshot(FILE* snap, char *bottom, char *top)
{
   objs_bottom = (oop*)bottom;
      objs_top = objs_bottom + (old_objs_top - old_objs_bottom);
     bytes_top = (oop*)top;
  bytes_bottom = bytes_top - (old_bytes_top - old_bytes_bottom);

  if (objs_top >= bytes_bottom)
    snap_error("space too small to read in snapshot");
               
  if (page_aligned) {
    char    *objs_page_end = OS::idealized_page_end(   objs_top);
    char *bytes_page_start = OS::idealized_page_start(bytes_bottom);
    if (fseek(snap, roundTo(ftell(snap), idealized_page_size), SEEK_SET) < 0)
      snap_error("seek failed");
    if (bytes_page_start <= objs_page_end)           
      OS::Mmap(objs_bottom, bytes_top, snap);
    else {
      OS::Mmap(objs_bottom, objs_page_end, snap);
      OS::Mmap(bytes_page_start, bytes_top, snap);
    }
  } else {
    OS::FRead_mem_swap(objs_bottom, objs_top, snap);
    OS::FRead_mem(bytes_bottom, bytes_top, snap);
  }    
}

oop space::get_allocation_vector() {
  oop vec= Memory->objVectorObj->cloneSize(3, CANFAIL);
  if (vec != failedAllocationOop) {
    vec->obj_at_put(0, as_smiOop(oops_used() * oopSize));
    vec->obj_at_put(1, as_smiOop(bytes_used()));
    vec->obj_at_put(2, as_smiOop(capacity()));
  }
  return vec;
}


newSpace::newSpace(const char *nm, int32 &size, FILE *snap) : space(nm, snap) {
  int32 snap_size = old_size_bytes();
  if (size < snap_size) {
    warning1("Default size for %s too small for snapshot; ignoring", nm);
    size= snap_size;
  }
  assert((size & (oopSize-1)) == 0,
         "space size must be a multiple of oop size");
}


oop* newSpace::alloc_more_objs_and_bytes(fint size, fint bsize, char*& bytes,
                                         bool mustAllocate) {
  Memory->need_scavenge();
  return next_space
         ?  next_space->     alloc_objs_and_bytes(size, bsize, bytes, mustAllocate)
         :  Memory->old_gen->alloc_objs_and_bytes(size, bsize, bytes, mustAllocate);
}


void newSpace::prepare_for_scavenge() {
  objs_scavenge_point= oopsStart();
}


bool newSpace::scavenge_contents() {
  if (objs_top == objs_scavenge_point) return false;
  assert(objs_scavenge_point < objs_top, "scavenging past top");

  oop *so_far = objs_scavenge_point; // for performance

  do {
    SCAVENGE_TEMPLATE(so_far); // advances objs_top when an object is moved
  } while (++so_far < objs_top);

  objs_scavenge_point = so_far;
  return true;
}


oldSpace::oldSpace(const char *nm, int32 &size, caddr_t desiredAddress) : space(nm, size)
{
  next_space= 0;
  size++;  // +1 for the invariant
  // size rounded up for us in OS::allocate_idealized_page_aligned
  char *mem= OS::allocate_idealized_page_aligned(size, nm, desiredAddress, false);
  if (!mem) {
    size= 0;
    return;
  }
  if (OS::is_directed_allocation_supported()  
  &&  mem != desiredAddress) { // must have fallen back on malloc()
    size= 0;
    delete [] mem;
    return;
  }
  int32 old_size = size; // init_space rounds it up!
  init_space(nm, size, mem);
  if (size != old_size) fatal("size changed");
}

  
oop* oldSpace::alloc_objs_and_bytes(fint size,
                                    fint bsize,
                                    char*& bytes,
                                    bool mustAllocate) {
  oop *p= alloc_objs_and_bytes_local(size, bsize, bytes);
  if (!p) return 0;

  if ( this == Memory->old_gen->reserve_space )
    Memory->old_gen->reselect_reserve_space();

  if ( Memory->old_gen->reserve_space  ||  mustAllocate )
    return p;

  unalloc_objs_and_bytes_local(size, bsize);
  Memory->old_gen->reselect_reserve_space();
  return 0;
}


void oldSpace::prepare_for_scavenge() {
  objs_scavenge_point= oopsEnd();
}

bool oldSpace::scavenge_recorded_stores() {
  return Memory->remembered_set->scavenge_contents(objs_bottom, objs_top);
}

bool oldSpace::scavenge_promotions() 
{
  bool flag= false;

  for (oop* p = objs_scavenge_point;  p < objs_top;  ++p) {
    oop x = *p;
    if (x->is_new()) {
      flag = true;
      x = x->scavenge();
      // haven't check-stored newly tenured objects; do it here
      Memory->store(p, x);
    }
  }
  objs_scavenge_point = objs_top;
  return flag;
}

void space::compact(mapOop unmarked_map_map,
                    space*& copySpace,
                    oop*& d,
                    oop*& bd) {
  // compact oops and bytes (outwards in), place copies in copySpace
  // (and successors, if necessary)

  // Leave sentinel at end of oops part
  // (utilises extra word between objs and bytes part).
  // This causes the is_object_start() loop below to exit.
  set_objs_top_sentinel(badOop);

  if (copySpace == this) {
    d=  objs_bottom;
    bd= bytes_top;
  }
  
  for (oop* p= objs_bottom; p < objs_top; ) {
    oopsOop obj = as_oopsOop(p);

    if (obj->is_gc_marked()) {
      // object survives GC
      // figure out size
      Map* nm = mapOop(obj->map()->enclosing_mapOop()->gc_unmark())->map_addr();
      fint size = nm->object_size(obj);
      byteVectorOop bv= 0;
      int32 bsize= 0;
      if (nm->is_byteVector()) {
        bv= byteVectorOop(obj);
        bsize= bv->lengthWords();
      }

      if (copySpace != this && !copySpace->would_fit(size, bsize)) {
        copySpace= ((oldSpace*)copySpace)->next_space;
        d=  copySpace->objs_bottom;
        bd= copySpace->bytes_top;
      }

      // check for special map processing
      if (obj->map() == Memory->map_map) {
        // adjust dependencies first
        as_mapOop(p)->map_addr()->shift_map(as_mapOop(d)->map_addr());
      }

      // do compaction
      if (bv) {
        // compact bytes part up
        oop* bp = (oop*) bv->bytes();
        assert(copySpace != this  ||  bp + bsize <= bd,
               "bytes parts aren't in order");
        copy_words_down((int32*)bp + bsize, (int32*)bd, bsize);
        bd -= bsize;
        bv->set_bytes((char*) bd);
      }
      // compact oops part down
      copy_oops_up(p, d, size);
      as_oopsOop(d)->gc_moved();
      d += size;
      p += size;
      if (copySpace != this) {
        copySpace->objs_top= d;
        copySpace->bytes_bottom= bd;
      }
    } else {
      // object is dying

      // check for special map processing
      if (((memOopClass*)p)->_map == unmarked_map_map) {
        // delete the dying map
        as_mapOop(p)->map_addr()->delete_map();
      }

      // skip to next object
      // (can't use object's map to compute object size,
      //  since it might be destroyed by now)
      for (p += 2;      // skip mark and map
           !is_object_start(*p);
           p++) ;
      assert(p <= objs_top, "compacter ran off end");
    }
  }
  assert(d < bd, "didn't compact anything");
  if (copySpace == this) {
    objs_top= d;
    bytes_bottom= bd;
  }
}

void space::gc_unmark_contents() {
  for (oop* p = objs_bottom; p < objs_top; p ++) UNMARK_TEMPLATE(p);
}

void oldSpace::gc_unmark_contents() {
  space::gc_unmark_contents();
  Memory->record_multistores(objs_bottom, objs_top);
}

oop space::find_oop_backwards(void* start) {
  if (objs_contains(start)) {
    oop* p = find_this_object((oop*)start);
    return as_memOop(p);
  }
  ShouldNotReachHere(); // not in this space
  return 0; // for C++
}

void space::oops_do(oopsDoFn f) {
  oop* p = objs_bottom;
  while (p < objs_top) {
    oop m = as_oopsOop(p);
    f(&m);
    p += m->size();
  }
}

bool space::verify() {
  lprintf("%s ", name);
  oop* p = objs_bottom;
  char* b = (char*) bytes_top;
  bool r = true;
  while (p < objs_top) {
    oop m = as_oopsOop(p);
    r &= m->verify();
    if (r) {
      r &= m->verifyBytesPart(b);
    }
    p += m->size();
  }
  return r;
}

void oldSpace::switch_pointers_by_card(oop from, oop to)
{
  rSet* rs= Memory->remembered_set;
  char* start_byte = rs->byte_for(oopsStart());
  char* end_byte   = rs->byte_for(oopsEnd());
  
  // first & middle cards:
  char *cp;
  for (cp = rSet::next_zero_byte(start_byte, end_byte);
       cp < end_byte;
       cp = rSet::next_zero_byte(cp + 1, end_byte)) {
    assert(*cp == 0, "next_zero_byte failed");
    switch_pointers_in_region(from, to, rs->oop_for(cp), rs->oop_for(cp+1));
  }
  // last card (could be partial):
  if (*end_byte == 0)
    switch_pointers_in_region(from, to, rs->oop_for(cp), oopsEnd());
}


// This routine is not fully general
// is called carefully (see define in map.c)
//  so it works as is.
// It is only called for programmable_slots objects,
//  which excludes byteVectors, and smiOops,
// hashes are preserved by the caller, and
// the code is updated separately by the caller.
// Finally, to is always a newly-created object, so that
// if from is found in the value of a constant slot
// (i.e. in a map), the map can be mutated without
// creating a duplicate map, which would violate the
// canonical-map invariants. -- dmu
// Thanks, Craig for some of the explanation -- dmu 1/12/93

void space::switch_pointers_in_region(oop from, oop to,
                                      oop* bottom, oop* top) {
  // don't search bytes; they contain no oop references
  assert(in_objs_bounds(bottom) && in_objs_bounds(top),
         "switching pointers outside oops part");
  if (top <= bottom) return; // space could be empty
  oop saved_bottom = *bottom;
  *bottom = from;
  oop *p;
  for (p =  find_prior_reference(top - 1,  from);  
       p > bottom; 
       p =  find_prior_reference(p - 1, from)) {
    // must undo sentinel cause switch_pointer may need to look at that spot
    *bottom = saved_bottom;
    as_memOop(find_this_object(p))->switch_pointer(p, to);
    *bottom = from;  // redo sentinel
  }
  assert(p == bottom, "search missed sentinel");
  *bottom = saved_bottom;
  if (saved_bottom == from)
    as_memOop(find_this_object(bottom))->switch_pointer(bottom, to);
}

void space::write_snapshot_header(FILE* file) {
  OS::FWrite(&objs_bottom, oopSize, file);
  OS::FWrite(&objs_top, oopSize, file);
  OS::FWrite(&bytes_bottom, oopSize, file);
  OS::FWrite(&bytes_top, oopSize, file);
}

void space::write_snapshot(FILE* file) {
  OS::set_access_before_writing_space(objs_bottom, objs_top, bytes_bottom, bytes_top);
  if (page_aligned) {
    char *objs_page_end=    OS::idealized_page_end(   objs_top);
    char *bytes_page_start= OS::idealized_page_start(bytes_bottom);
    fseek(file, roundTo(ftell(file), idealized_page_size), SEEK_SET);
    if (bytes_page_start <= objs_page_end)
      OS::FWrite_mem(objs_bottom, bytes_top, file);
    else {
      OS::FWrite_mem(objs_bottom, objs_page_end, file);
      OS::FWrite_mem(bytes_page_start, bytes_top, file);
    }
  } else {
    OS::FWrite_mem(objs_bottom, objs_top, file);
    OS::FWrite_mem(bytes_bottom, bytes_top, file);
  }
  OS::reset_access_after_writing_space(objs_bottom, objs_top, bytes_bottom, bytes_top);
}

void space::relocate() {
  for (oop* p = objs_bottom; p < objs_top; p ++)
    RELOCATE_TEMPLATE(p);
}

void space::relocate_bytes() {
  if (bytes_bottom != old_bytes_bottom) {
    for (oop* p = objs_bottom; p < objs_top; ) {
      oopsOop m = as_oopsOop(p);
      if (m->is_byteVector()) {
        byteVectorOop(m)->relocate_bytes(this);
      }
      p += m->size();
    }
  }
}

void space::fixup_maps() {
  for (oop* p = objs_top; p  >  objs_bottom; ) {
    p = find_this_object(p - 1);
    memOop obj = as_memOop(p);
    Map* m = as_mapOop(p)->map_addr();
    if (obj->map() == Memory->map_map) {
      m->set_vtbl_value(Vtbls->translate(m->vtbl_value()));
      m->fixup();
    }
  }
}


void space::fixup_killables() {
  // because we can't snapshot them yet
  for (oop* p = objs_top; p  >  objs_bottom; ) {
    p = find_this_object(p - 1);
    oop obj = as_memOop(p);
    if (obj->is_killable())  // process, block, activation obj, foreignOop, ...
      obj->kill();
  }
}


void space::canonize_map_vtbls() {
  for (oop* p = objs_top; p  >  objs_bottom; ) {
    p = find_this_object(p - 1);
    memOop obj = as_memOop(p);
    Map* m = as_mapOop(p)->map_addr();
    if (obj->map() == Memory->map_map)
      m->set_vtbl_value(Vtbls->vtbl_values[m->vtblMapType()]);
  }
}

// called when reading a snapshot w/o canonicalized maps to recanonicalize them

void space::canonicalize_maps() {
  for (oop* p = objs_top; p  >  objs_bottom; ) {
    p = find_this_object(p - 1);
    as_memOop(p)->canonicalize_map();
  }
}


void space::print() {
  printIndent();
  lprintf("%4s: oops: 0x%-6lx -> 0x%-6lx; used: %ld bytes\n",
         name, objs_bottom, objs_top,
         (char*) objs_top - (char*) objs_bottom);
  printIndent();
  lprintf("     bytes: 0x%-6lx -> 0x%-6lx; used: %ld bytes\n",
         bytes_bottom, bytes_top,
         (char*) bytes_top - (char*) bytes_bottom);
  printIndent();
  lprintf("     total: used: %ld bytes; free: %ld bytes\n",
         used(), bytes_free());
}


static enumeration* theEnumeration;
bool call_filter_match(oop* matching_cell,  smi hit_num) {
  oop* obj = find_this_object(matching_cell);
  theEnumeration->filter_match(as_oopsOop(obj), matching_cell, hit_num);
  return theEnumeration->is_ok();
}

void space::enumerate_matches(enumeration* e) {
  smi num_targets = e->get_num_targets();
  if (num_targets <= 0)  return;
  theEnumeration = e;
  search_area((int32*) objs_bottom, (int32*) objs_top,
              (int32*) e->get_targets(), num_targets,
              (match_func)call_filter_match);
}

void space::enumerate_maps(enumeration* e) {
  for (oop* p = objs_top;  p > objs_bottom  &&  e->is_ok();  ) {
    p = find_this_object(p - 1);
    oopsOop obj = as_oopsOop(p);
    if (obj->is_map()) {
      e->filter_map(mapOop(obj));
    }
  }
}

void space::enumerate_all_objs(enumeration* e) {
  for (oop* p = objs_top; p > objs_bottom  &&  e->is_ok(); ) {
    p = find_this_object(p - 1);
    oopsOop obj = as_oopsOop(p);
    if (!obj->is_map() && obj != Memory->errorObj) {
      assert(obj->is_slots() || obj->is_block(), "weird type of object");
      e->add_obj(obj);
    }
  }
}

bool add_obj_map_match(oop* matching_cell,  smi hit_num) {
  Unused(hit_num);
  // could be a real match with memOop::map_index,
  // or could be a unwanted match with Map::my_index
  oop* obj = matching_cell - (map_offset() + Mem_Tag)/oopSize;
  assert((*obj)->is_mark(), "should only reference a map in map field");
  theEnumeration->add_obj(as_oopsOop(obj));
  return theEnumeration->is_ok();
}

void space::enumerate_families_small(enumeration* e) {
  theEnumeration = e;
  // need to skip searching errorObj
  // (This is used to fill frames and should not show up in other objects
  //  but DOES sit in the heap. If we search it by mistake,
  //  assertions will kvetch.)
  oop* errorObjp    = (oop*)Memory->errorObj->addr();
  oop* errorObj_end = find_next_object(errorObjp);
  
  if (objs_bottom <= errorObjp  &&  errorObjp < objs_top) {
    // two pieces:
    search_area((int32*) objs_bottom,  (int32*) errorObjp, (int32*) e->get_maps(), e->get_num_maps(), (match_func)add_obj_map_match);
    search_area((int32*) errorObj_end, (int32*)  objs_top, (int32*) e->get_maps(), e->get_num_maps(), (match_func)add_obj_map_match);
  }
  else
    search_area((int32*) objs_bottom,  (int32*) objs_top,  (int32*) e->get_maps(), e->get_num_maps(), (match_func)add_obj_map_match);
}


void space::enumerate_families(enumeration* e) {
 if (objs_bottom >= objs_top) {
   return;
 }

 oop* maps     = e->get_maps();
 smi  num_maps = e->get_num_maps();
 smi  hit_num;

 // An experiment showed it is faster to search for maps
 // in an area instead of examine the map of each object
 // iff num_maps < Vectorfind_max_targets
 if (num_maps < Vectorfind_max_targets) {
   enumerate_families_small(e);
   return;
 }

 set_objs_top_sentinel(*objs_bottom);  // must be a mark for find_next_object()

 slotsOopClass *errorObjp= Memory->errorObj->addr();
 for (oop* objp = objs_bottom; 
           objp < objs_top && !e->stop();
           objp = find_next_object(objp)) {
    if (objp == (oop*)errorObjp) continue;
    mapOop m = as_oopsOop(objp)->map()->enclosing_mapOop();
    maps[num_maps] = m; // Place sentinel
    oop* matching_cell =
      (oop*) vectorfind_next_match((int32*) maps, (int32*) &m, 1, &hit_num);
    assert(matching_cell <= &maps[num_maps], "match out of area");
    if (matching_cell != &maps[num_maps]) {
      assert(!as_oopsOop(objp)->is_map(), "objp is a map");
      e->add_obj(as_oopsOop(objp));
    }
  }
}

void oldSpace::record_new_pointers()
{
  for (oop* objp= objs_bottom; objp < objs_top; ++objp) {
    oop p= *objp;
    if (p->is_new())
      Memory->remembered_set->record_store(objp);
  }
}

