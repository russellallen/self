/* Sun-$Revision: 30.21 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "generation.hh"
# pragma implementation "generation_inline.hh"

# include "_generation.cpp.incl"


void generation::print()
{
  lprintf(" total capacity: %d\n", capacity());
  lprintf(" used: %d bytes for oops, %d bytes for bytes, total %d\n",
         oops_used() * oopSize, bytes_used(), used());
  lprintf(" address boundaries: 0x%x, 0x%x\n",
         low_boundary, high_boundary);
}


newGeneration::newGeneration(int32 &eden_size, int32 &surv_size, FILE *snap) {

  map_list= NULL;
  
  if (snap) {
    eden_space= new newSpace("eden", eden_size, snap);
    from_space= new newSpace("from", surv_size, snap);
      to_space= new newSpace("to",   surv_size, snap);
  }
  int32 new_size= eden_size + surv_size + surv_size;
  assert(is_idealized_page_multiple(new_size), "new size mismatch");

  // Need to allocate an extra page because the search operations
  // in sun4.enum.s can walk back a few words before their starting point.
  // This should be fixed sometime by recoding those ops.
  new_size += idealized_page_size;
  char *new_spaces= OS::allocate_idealized_page_aligned(
                           new_size, "new space",
                           HeapStart - idealized_page_size);
  new_spaces += idealized_page_size;
  new_size -= idealized_page_size;

  // must start on a card boundary
  assert(int(new_spaces) % card_size == 0,
         "page size not a multiple of card size");

  char *be=  new_spaces;
  char *bs1= be  + eden_size;
  char *bs2= bs1 + surv_size;
  char *es2= bs2 + surv_size;

  if (snap) {
    eden_space->read_snapshot(snap, be, bs1);
    bool fromAfterTo= from_space->old_objs_bottom > to_space->old_objs_bottom;
    (fromAfterTo ? to_space : from_space)->read_snapshot(snap, bs1, bs2);
    (fromAfterTo ? from_space : to_space)->read_snapshot(snap, bs2, es2);
  } else {
    eden_space= new newSpace("eden", eden_size, be );
    from_space= new newSpace("from", surv_size, bs1);
    to_space  = new newSpace("to",   surv_size, bs2);
  }

  eden_space->next_space = from_space;
  from_space->next_space =   to_space;
    to_space->next_space =       NULL;

   low_boundary= new_spaces;
  high_boundary= new_spaces + new_size;
}

void newGeneration::prepare_for_scavenge()
{
  to_space->prepare_for_scavenge();
}

bool newGeneration::scavenge_contents() {
  return to_space->scavenge_contents();
}

# define APPLY_TO_YOUNG_SPACES2(template,member)                      \
    template(eden_space,member)                                       \
    template(from_space,member)                                       \
    template(to_space,member)                                                 

#define ACCUMULATE_TEMPLATE(s,member) { sum += s->member(); }

#define ACCUMULATE_NEW(member)                          \
int32 newGeneration::member()                           \
{                                                       \
  int32 sum= 0;                                         \
  APPLY_TO_YOUNG_SPACES2(ACCUMULATE_TEMPLATE,member);   \
  return sum;                                           \
}

ACCUMULATE_NEW(capacity)
ACCUMULATE_NEW(oops_used)
ACCUMULATE_NEW(bytes_used)
ACCUMULATE_NEW(oops_free)
ACCUMULATE_NEW(used)
ACCUMULATE_NEW(bytes_free)

bool newGeneration::has_map(slotsMapDeps *m) {
  for (MapList *p= map_list;  p != NULL;  p= p->next)
    if (p->map == m)
      return true;
  return false; }

void newGeneration::adjust_maps() {
  int n= 0, nDead= 0, nSurv= 0; // gather stats of length of list
  MapList *mapl;
  for ( MapList **prevp= &map_list; 
        mapl= *prevp,  mapl != NULL; 
        n++) {
    slotsMapDeps *map= mapl->map;
    mapOop m= map->enclosing_mapOop();
    if (m->is_forwarded()) {
      slotsMapDeps* oldMap= map;
      m= mapOop(m->forwardee());
      map= (slotsMapDeps*)m->map_addr();
      map->forward_map(oldMap);      // shift dependency links
    }
    assert_map(m, "new map list contains a non-map");

    enum { 
      was_tenured,  died,  is_alive_and_young 
    } what_happened = 
        (char*)m >= high_boundary 
           ? was_tenured 
           : ( Memory->should_scavenge(m) ? died : is_alive_and_young );

    switch (what_happened) {

     case is_alive_and_young: // survived to to-space: adjust list
      nSurv++;
      mapl->map= map;         // update list 
      prevp= &(mapl->next);   // goto next list elem
      break;

    case died:                // died in eden- or from-space: delete map
      nDead++;
      map->delete_map();
      // and FALL THROUGH to remove link from list

    case was_tenured:  // leave map alive, but remove from list entirely
      MapList *next= mapl->next;  
      delete mapl;  
      *prevp= next;
      break;
    }
  }
  if (PrintNewMapListScavengeStats)
    lprintf("%d new maps, %d died, %d survived, %d tenured\n",
           n, nDead, nSurv, n-nDead-nSurv);
}


bool newGeneration::verify_new_maps() {
  int32 count = 0;
  for (MapList* mp= map_list;  mp;  mp= mp->next) {
    mapOop p = mp->map->enclosing_mapOop();
    if (count++ >= 100000) {
      error1("figure 6 bug in new maps list around map 0x%lx", p);
      return false;
    }
    if (! p->verify_oop()) {
      lprintf("\tof map on new maps list.\n");
      return false;
    }
    if (!p->map_addr()->can_have_dependents()) {
      error1("mapOop 0x%lx on new maps list can't have deps", p);
      return false;
    } 
    if (! p->is_new()) {
      error1("mapOop 0x%lx on new maps list isn't new", p);
      return false;
    }
  }
  return true;
}


void newGeneration::switch_pointers(oop from, oop to) {
  eden_space->switch_pointers(from, to);
  from_space->switch_pointers(from, to);
    to_space->switch_pointers(from, to);
}


bool newGeneration::objs_contains(void* p)
{
  return
      eden_space->objs_contains(p)
  ||  from_space->objs_contains(p)
  ||    to_space->objs_contains(p);
}


#define OMIT2(t,m) m(t)

void newGeneration::print()
{
  lprintf(" New generation\n");
  generation::print();
  APPLY_TO_YOUNG_SPACES2(OMIT2,SPACE_PRINT_TEMPLATE);
}

bool newGeneration::verify()
{
  bool r = true;
  if (   eden_space->next_space != from_space
      || from_space->next_space !=   to_space
      || to_space->next_space != NULL) {
    error("misconnnected spaces in new gen");
    r = false;
  }

  if (Memory->is_verify_opt('e') || Memory->is_verify_opt('n'))
    r = eden_space->verify()  && r;
  if (Memory->is_verify_opt('s') || Memory->is_verify_opt('n')) {
    r = from_space->verify() && r;
    r =   to_space->verify() && r;
  }
  return r;
}

void newGeneration::write_snapshot(FILE* file)
{
  eden_space->write_snapshot_header(file);
  from_space->write_snapshot_header(file);
    to_space->write_snapshot_header(file);
  eden_space->write_snapshot(file);
  from_space->write_snapshot(file);
    to_space->write_snapshot(file);
}


# undef FOR_EACH_OLD_SPACE
// this version used with old_gen
// ensure that you surround the call with {} to prevent s leaking out!
#define FOR_EACH_OLD_SPACE(s) \
  for (oldSpace *s= first_space;                                \
       s != NULL;                                               \
       s= s->next_space)


void oldGeneration::sorted_space_list(oldSpace *sp[],
                                      int (*cmp)(oldSpace**, oldSpace**))
{
  unsigned n= 0;
  {FOR_EACH_OLD_SPACE(s) sp[n++]= s;}
  assert(n == nSpaces, "old space count is wrong");
  qsort(sp, n, sizeof(sp[0]), (int(*)(const void *, const void *))cmp);
}

int addr_cmp(oldSpace **s1, oldSpace **s2)
{
  char *s1start= (*s1)->spaceStart();
  char *s2start= (*s2)->spaceStart();
  if (s1start < s2start) return -1;
  else if (s1start > s2start) return 1;
  else return 0;
}

static int most_used_space_first(oldSpace **s1, oldSpace **s2) {
  int u1= (*s1)->used(), u2= (*s2)->used();
  return u1 > u2 ? -1 : u1 < u2 ? 1 : addr_cmp(s1, s2); }

static int most_free_space_last(oldSpace **s1, oldSpace **s2) {
  int u1= (*s1)->oops_free(), u2= (*s2)->oops_free();
  return u1 < u2 ? -1 : u1 > u2 ? 1 : addr_cmp(s1, s2); }

// sort the linked list of spaces by the cmp_fn
void oldGeneration::resort_spaces(int (*cmp_fn)(oldSpace**, oldSpace**))
{
  // I can be called a lot if there is just one space,
  // and recreate_old_bars is slow.
  if (nSpaces == 1)
    return;
    
  ResourceMark rm;
  oldSpace **sp= NEW_RESOURCE_ARRAY( oldSpace*, nSpaces );
  sorted_space_list(sp, cmp_fn);
  first_space= sp[0];
  int n;
  for (n= 0;  n < nSpaces-1;  ++n)
    sp[n]->next_space= sp[n+1];
  last_space= sp[n];
  sp[n]->next_space= NULL;
  
  TrackObjectHeapInMonitor::recreate_old_bars();
}


oldGeneration::oldGeneration(int32 initial_size, int32 reserved_amt) {
  VM_reserved_mem= reserved_amt;
  setLowSpaceThreshold(VM_reserved_mem * 2);

  // make adjacent to new spaces
  old0= first_space= last_space= tenuring_space=
    new oldSpace("old0", initial_size, Memory->new_gen->high_boundary);

  assert( old0->spaceStart() >= Memory->new_gen->high_boundary,
          "old must be after new for scavenging");
          
  if (initial_size == 0)
    fatal("Couldn't allocate initial old space -- not enough swap space?");

  top_of_old_space= old0->spaceEnd();

  reserve_space= first_space;

   low_boundary= first_space->spaceStart();
  high_boundary= first_space->spaceEnd();

  nSpaces= 1;
  update_cached_free();
}


oldGeneration::oldGeneration(FILE* snap, int32 initial_size,
                             int32 reserved_amt) {
  oldSpace *s;

  VM_reserved_mem= reserved_amt;
  setLowSpaceThreshold(VM_reserved_mem * 2);

  OS::FRead_swap(&nSpaces, sizeof(nSpaces), snap);
  assert( nSpaces < 1000, "Snapshot corrupted, unbelievable number of spaces");

  oldSpace *prev= NULL;
  for (unsigned n= 0; n < nSpaces; n++) {
    char *name= new char[10];
    sprintf(name, "old%d", n);
    s= new oldSpace(name, snap);
    if (prev)
      prev->next_space= s;
    else
      first_space= s;
    prev= s;
  }
  last_space= s;

  caddr_t old_start= Memory->new_gen->high_boundary;
  char *old_heap= OS::allocate_idealized_page_aligned(initial_size, "old0", old_start);
  
  // I don't know why the Unix code does this, but
  //  the MAC always falls back on malloc--I don't know
  //  how else to do it -- dmu
  if (OS::is_directed_allocation_supported()  &&  caddr_t(old_heap) != old_start)
    fatal("Couldn't allocate old space contiguous with new space");

  assert(caddr_t(old_heap) >= old_start, "at least assume sequentiality");
  
  top_of_old_space= old_heap + initial_size;
  
  char *bottom= low_boundary=  old_heap;
  char *top=    high_boundary= old_heap + initial_size;
  
  {FOR_EACH_OLD_SPACE(ss) {
    ss->read_snapshot(snap, bottom, top);
    bottom= (char*)(ss->objs_top);
    top=    (char*)(ss->bytes_bottom);
  }}
}

void oldGeneration::coalesce_spaces()
{
  reserve_space= NULL; 
  
  if (nSpaces == 1) {
    old0= tenuring_space= first_space;
    update_cached_free();
    return;
  }
    
  first_space->objs_top=     last_space->objs_top;
  first_space->bytes_bottom= last_space->bytes_bottom;
  oldSpace *s= first_space->next_space;
  first_space->next_space= NULL;
  
  while (s) {
    oldSpace *n= s->next_space;
    delete s;
    s= n;
  }

  old0= tenuring_space= last_space= first_space;
  nSpaces= 1;
  update_cached_free();
  reselect_reserve_space();
}

bool oldGeneration::objs_contains(void* p)
{
  {FOR_EACH_OLD_SPACE(s) { if (s->objs_contains(p)) return true; }}
  return false;
}

bool oldGeneration::contains(void* p)
{
  {FOR_EACH_OLD_SPACE(s) { if (s->contains(p)) return true; }}
  return false;
}

#define ACCUMULATE_OLD(member)                          \
int32 oldGeneration::member()                           \
{                                                       \
  int32 sum= 0;                                         \
  {FOR_EACH_OLD_SPACE(s) { sum += s->member(); }}       \
  return sum;                                           \
}

ACCUMULATE_OLD(capacity)
ACCUMULATE_OLD(oops_used)
ACCUMULATE_OLD(bytes_used)
ACCUMULATE_OLD(oops_free)
ACCUMULATE_OLD(used)
ACCUMULATE_OLD(bytes_free)

void oldGeneration::check_for_end_of_low_space() {
  lowOnSpace= cached_free <= lowSpaceThreshold;
  if (!lowOnSpace) TrackObjectHeapInMonitor::reserve_changed();
}

void oldGeneration::update_caches(bool postScavenge) {
  update_cached_free();
  if (postScavenge)
    check_for_low_space();
  else {
    reselect_reserve_space();
    check_for_end_of_low_space();
  }
}


void oldGeneration::reset_tenuring_order()
{
  resort_spaces(most_free_space_last);
  tenuring_space = first_space;
}


void oldGeneration::prepare_for_scavenge()
{
  reset_tenuring_order();
  FOR_EACH_OLD_SPACE(s) {
    s->prepare_for_scavenge();
  }
}


space* oldGeneration::tenuring_space_for(fint size, fint bsize) 
{
  if (tenuring_space->would_fit(size, bsize))
    return tenuring_space;
  
  FOR_EACH_OLD_SPACE(s) {
    if (s->would_fit(size, bsize))
      return tenuring_space= s;
  }
  fatal2("out of space for tenuring %d oops %d bytes", size, bsize);
  return NULL;
}



bool oldGeneration::scavenge_promotions() {
  bool r = false;
  FOR_EACH_OLD_SPACE(s) {
    r = s->scavenge_promotions() || r;
  }
  return r;
}


void oldGeneration::switch_pointers(oop from, oop to) {
  if (from->is_new())
    {FOR_EACH_OLD_SPACE(space) space->switch_pointers_by_card(from, to);}
  else
    {FOR_EACH_OLD_SPACE(space) space->switch_pointers(from, to);}
}
    
    
void oldGeneration::cleanup_after_scavenge()
{
  reset_tenuring_order();
  update_caches(true);
}

// Expand the old space by size bytes. 
// Returns the amount actually allocated (0, maybe, if expansion isn't
// possible; or more than asked for, due to rounding).
int oldGeneration::expand(int32 size)
{
  EventMarker em("expanding heap by %d", (void*)size);
  assert(size >= 0, "negative expansion?");
  
  if (OS::is_directed_allocation_supported()
  &&  top_of_old_space + size > HeapStart + MaxHeapSize) 
    return 0;

  char *name= new char[10];
  sprintf(name, "old%d", nSpaces);
  oldSpace *s= new oldSpace(name, size, // modifies size for amount allocated
                            top_of_old_space); 

  if (size == 0) 
    delete s;
  else {
    if (s->spaceStart() < Memory->new_gen->high_boundary)
      fatal("allocation of old space before new space");
    
    top_of_old_space= caddr_t(s->spaceEnd());

    // it's OK for the new oldSpace to go between the new spaces and
    // existing old space (as there is already a card bytemap for this
    // region), or between two old spaces (for the same reason), or after
    // the last old space (in which case we will extend the card byte map).
    
    nSpaces++;
    append_space(s);
    update_caches(false);
      
    char *sStart= s->spaceStart();
    char *sEnd  = s->spaceEnd();
    if (sStart <  low_boundary)  low_boundary= sStart;
    if (sEnd   > high_boundary) high_boundary= sEnd;
    Memory->remembered_set->fixup(sStart, sEnd);
    Memory->current_sizes.old_size= capacity();
    TrackObjectHeapInMonitor::recreate_old_bars();
  }
  return size;
}

// Find oldSpace with most room.  Start with s.
oldSpace* oldGeneration::biggest_free_space(oldSpace *s)
{
  oldSpace *big= s;
  int32 room= big->bytes_free();
  for (;;) {
    s= s->next_space;
    if (s == NULL) return big;
    int32 t= s->bytes_free();
    if (t > room) {
      room= t;
      big= s;
    }
  }
}


// sort the spaces into least occupied last
// Actually, most used first -- dmu 7/04
void oldGeneration::prepare_for_compaction()
{
  resort_spaces(most_used_space_first);
}

  

void oldGeneration::append_space(oldSpace *last)
{
  last_space->next_space= last;
  last_space= last;
  last->next_space= NULL;
}  

void oldGeneration::reselect_reserve_space()
{
  reserve_space= biggest_free_space(first_space);
  if (!reserve_space->reserveFree())
    reserve_space= NULL;
}



static oop* HeapAllocateFailed(){
  lprintf("\n**** Heap allocation failed! ****\n");
  lprintf("This indicates that either you continued to allocate objects\n"
          "despite warnings, or, if you did not get any warnings, the Self\n"
          "low space handler is broken.\n");
  fatal("out of memory");
  return NULL;
}


// Unify with tenuring code?? -- dmu 7/04
oop* oldGeneration::alloc_objs_and_bytes(fint size, fint bsize, char*& bytes, bool mustAllocate) {

  oop *p = NULL;

  oldSpace* s;
  for ( s = tenuring_space;   p == NULL  &&  s != NULL;            s = s->next_space)
    if (s != reserve_space)
      p = s->alloc_objs_and_bytes(size, bsize, bytes, mustAllocate);

  for ( s = first_space;      p == NULL  &&  s != tenuring_space;  s = s->next_space)
    if (s != reserve_space)
      p = s->alloc_objs_and_bytes(size, bsize, bytes, mustAllocate);
      
  if ( p == NULL  &&  reserve_space != NULL )
    p = reserve_space->alloc_objs_and_bytes(size, bsize, bytes, mustAllocate);

  if (nSpaces > 1  &&  s == reserve_space)
    reset_tenuring_order(); // sorts & sets tenuring_space
  else
    tenuring_space = s;
    
  if ( p == NULL ) {
    if ( mustAllocate )  HeapAllocateFailed();
    return NULL;
  }
  # if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions  &&  (p == (oop*)catchThisOne || bytes == (char*)catchThisOne)) {
      warning1("oldGeneration::alloc_objs_and_bytes caught 0x%lx",
               catchThisOne);
    }
  # endif
  
  cached_free -= (size + bsize)*oopSize;
  check_for_low_space();
  return p;
}


void oldGeneration::print()
{
  lprintf(" Old generation\n");
  generation::print();
  APPLY_TO_OLD_SPACES(SPACE_PRINT_TEMPLATE);
  lprintf(" VM reserve: %d  Low space threshold: %d\n", VM_reserved_mem,
          lowSpaceThreshold);
}

bool oldGeneration::verify()
{
  int n= 0;
  bool r = true;
  oldSpace *p;
  {FOR_EACH_OLD_SPACE(s) {
    n++;
    p= s;
  }}
  if (n != nSpaces) { error("Wrong nSpaces in old gen"); r = false; }
  if (p != last_space) { error("Wrong last_space in old gen"); r = false; }
  if (reserve_space  &&  !reserve_space->reserveFree()) {
     error("reserve_space doesn't have reserve"); r = false; }
  if (cached_free != bytes_free()) { error("cached_free in old gen wrong"); r = false; }
  if (cached_free < VM_reserved_mem) { error("VM reserve missing"); r = false; }
  if (lowOnSpace != (cached_free < lowSpaceThreshold)) {
    warning("lowOnSpace wrong");
    r = false;
  }
  bool verify_result = true;
  APPLY_TO_OLD_SPACES(SPACE_VERIFY_TEMPLATE);
  return r && verify_result;
}


void oldGeneration::set_write_only_old0() {
  write_only_old0= true;
  FOR_EACH_OLD_SPACE(s) {
    if (s != old0 && s->used() != 0)
      write_only_old0= false;
  }
}

void oldGeneration::write_snapshot(FILE* file)
{
  if (write_only_old0) {

    const unsigned n= 1;
    OS::FWrite(&n, sizeof(n), file);
    old0->write_snapshot_header(file);
    old0->write_snapshot(file);

  } else {

    OS::FWrite(&nSpaces, sizeof(nSpaces), file);
    
    // sort spaces by address
    oldSpace **sp= NEW_RESOURCE_ARRAY( oldSpace*, nSpaces);
    sorted_space_list(sp, addr_cmp);
    unsigned n= 0;
    for (n= 0; n < nSpaces; n++)
      sp[n]->write_snapshot_header(file);
    for (n= 0; n < nSpaces; n++)
      sp[n]->write_snapshot(file);
  }
}

void oldGeneration::record_new_pointers()
{
  FOR_EACH_OLD_SPACE(s) ((oldSpace*)s)->record_new_pointers();
}

smi set_memory_low_space_threshold_prim(oop rcvrIgnored, smi newLST, void *FH)
{
  Unused(rcvrIgnored);
  if (newLST < Memory->old_gen->get_VM_reserved_mem()) {
    failure(FH, "Threshold set below VM reserve");
    return NULL;
  }
  smi oldLST= Memory->old_gen->getLowSpaceThreshold();
  Memory->old_gen->setLowSpaceThreshold(newLST);
  TrackObjectHeapInMonitor::reserve_changed();
  return oldLST;
}

