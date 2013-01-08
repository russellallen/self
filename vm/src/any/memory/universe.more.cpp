/* Sun-$Revision: 30.15 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "universe.more.hh"

# include "_universe.more.cpp.incl"

bool GCInProgress = false;
bool ScavengeInProgress = false;

void universe::swapSurvivors() {
  {
    newSpace* s= new_gen->from_space;
    new_gen->from_space= new_gen->to_space;
    new_gen->to_space= s;
  }
  new_gen->eden_space->next_space= new_gen->from_space;
  new_gen->from_space->name= "from";
  new_gen->from_space->next_space= new_gen->to_space;
  new_gen->  to_space->name= "to";
  new_gen->  to_space->next_space= NULL;
}

smi set_memory_tenuring_threshold_prim(oop rcvrIgnored, smi newThresh, void *FH)
{
  Unused(rcvrIgnored);
  if (newThresh < 0 || newThresh > Memory->current_sizes.surv_size) {
    failure(FH, "Threshold out of range");
    return NULL;
  }
  smi oldThresh= Memory->Desired_Surv_Size;
  Memory->Desired_Surv_Size= newThresh;
  return oldThresh;
}

oop universe::tenure(oop p) {
  tenuring_threshold = 0;               // tenure everything
  oop r = scavenge(p);
# define checkIt(s) assert(s->used() == 0, "new spaces should be empty");
  APPLY_TO_YOUNG_SPACES(checkIt)
# undef checkIt
  return r;
}

oop universe::default_low_space_handler(oop p)
{
  if (MemoryAutomaticGC)
    p = garbage_collect(p);
  int32 cap= old_gen->capacity();
  int32 fre= old_gen->bytes_free();
  if (   MemoryAutomaticHeapExpansion
      && (   might_run_out_of_space_on_scavenge()
          || float(fre) / float(cap) < 0.3
          || old_gen->lowOnSpace)) {
    int32 ngc= new_gen->capacity(); // for scavenge reserve
    int32 desired= max(max(ngc * 2, cap / 2), old_gen->getLowSpaceThreshold());
    int32 exp;
    while (exp= old_gen->expand(desired),
           exp == 0  &&  desired > ngc)
      desired /= 2;
    if (exp == 0)
      warning("Could not expand heap");
  }
  return p;
}

oop universe::scavenge(oop p) {
  BlockProfilerTicks bpt(exclude_scavenging);
  if (VerifyBeforeScavenge) verify();

  FlagSetting fl(GCInProgress, true);
  FlagSetting fl2(ScavengeInProgress, true);
  ++scavengeCount;
  assert(!processSemaphore, "processSemaphore shouldn't be set");
  assert(SlotIterator::nActive == 0,
         "shouldn't be iterating over slots");

  if (might_run_out_of_space_on_scavenge()) {
    if (!twainsProcess)
      p = default_low_space_handler(p);
    else {
      warning("some memory reserved by the VM has been used;\n"
              "invoking emergency heap expansion...");
      p = expand_heap_prim(0, 10000000);
    }
  }
  
  if (might_run_out_of_space_on_scavenge()) {
      warning("GC didn't free enough; growing heap. -- dmu 5/06");
      p = garbage_collect(p);  
  }
  if (might_run_out_of_space_on_scavenge())
    warning("Despite everything, this scavenge could run out of space "
            "and cause the VM to crash. -- dmu & Mario 6/04");
  
  {
    ShowVMActivityInMonitor ss(" scavenge ");
    EventMarker em("scavenging");
    
    timer tmr;
    if (PrintScavenge) {
      lprintf("*scavenging...");
      tmr.start();
    }
    
    age_table->clear();
    new_gen->prepare_for_scavenge();
    old_gen->prepare_for_scavenge();
    
    SCAVENGE_TEMPLATE(&p);
    APPLY_TO_VM_OOPS(SCAVENGE_TEMPLATE);
    APPLY_TO_VM_MAPS(MAP_SCAVENGE_TEMPLATE);
    VMStrings_scavenge_contents();
    string_table->scavenge_contents();
    processes->scavenge_contents();
    hprofiler->scavenge_contents();
    profilers->scavenge_contents();
    code->scavenge_contents();
    slotIterator_scavenge_contents();
    {FOR_EACH_OLD_SPACE(s) s->scavenge_recorded_stores();}
    while (old_gen->scavenge_promotions() || new_gen->scavenge_contents())
      ;
    
    new_gen->adjust_maps();
    
    new_gen->eden_space->clear();
    new_gen->from_space->clear();
    
    swapSurvivors();
    
    tenuring_threshold =
      new_gen->from_space->used()  <=  Desired_Surv_Size
       ? age_mask 
         : age_table->tenuring_threshold(Desired_Surv_Size);
    
    old_gen->cleanup_after_scavenge();

    if (PrintScavenge) {
      lprintf("done: %ld ms., %ld bytes in new_gen\n", long(tmr.time()), long(new_gen->used()));
    }
    
    if (VerifyAfterScavenge) verify(true);
    
    // do this at end so an overflow during a scavenge doesnt cause another one
    NeedScavenge = false;
  }
  return p; 
}

#define NORMAL_ACCESS_TEMPLATE(s) \
 OS::normal_access((char*)s->oopsStart(), (char*)s->oopsEnd());

#define RANDOM_ACCESS_TEMPLATE(s) \
 OS::random_access((char*)s->oopsStart(), (char*)s->oopsEnd());

#define ZONE_NORMAL_ACCESS_TEMPLATE(z) \
 OS::normal_access((char*)z->startAddr(), (char*)z->endAddr());

#define ZONE_RANDOM_ACCESS_TEMPLATE(z) \
 OS::random_access((char*)z->startAddr(), (char*)z->endAddr());


oop universe::garbage_collect(oop p) {
  BlockProfilerTicks bpt(exclude_garbage_collection);
  ShowVMActivityInMonitor ss(" GC ");
  EventMarker em("GC");
  ResourceMark rm;
  // before GCInProgress for FrameIterator::check_for_overwriting_patched_frame_saved_outgoing_args
  if (VerifyBeforeScavenge || VerifyBeforeGC) verify();
  FlagSetting fl(GCInProgress, true);

  assert(SlotIterator::nActive == 0,
         "shouldn't be iterating over slots");

  // Try to flush obsolete methods because they keep the respective
  // maps alive.  Actually, that's only a half-baked solution: the
  // real problem is that pointers from the zone to the Self heap should
  // be weak pointers.
  code->flushZombies();
  
  APPLY_TO_OLD_SPACES(RANDOM_ACCESS_TEMPLATE);
  APPLY_TO_ZONES(ZONE_RANDOM_ACCESS_TEMPLATE);

  timer        cpu_timer;
  ElapsedTimer real_timer;
  fint oldUsed = old_gen->used();

  ProcessInfo::update();
  fint faults= ProcessInfo::page_faults_IO();

  if (PrintGC) {
    lprintf("*garbage collecting...");
    cpu_timer.start();
    real_timer.start();
  }

  findSlotCache.clear();
  
  object_table = new oTable;
  
  // mark roots
  MARK_TEMPLATE(&p);
  APPLY_TO_VM_OOPS(MARK_TEMPLATE);
  APPLY_TO_VM_MAPS(MAP_MARK_TEMPLATE);
  
       code->gc_mark_contents();
  hprofiler->gc_mark_contents();
  profilers->gc_mark_contents();
  processes->gc_mark_contents();
  VMStrings_gc_mark_contents();
  slotIterator_gc_mark_contents();

  // mark reachable objects
  object_table->gc_mark_contents();
  
  // Note unreachable processes, but keep them alive
  processes->gc_mark_remaining_processes();

  object_table->gc_mark_rest();

  // finalize unreachable objects - must be after all other gc_mark routines!
  string_table->gc_mark_contents();

  remembered_set->clear();
  
  new_gen->init_map_list(); // compact will add all surviving maps to list
  
  // compact/sweep memory
  if (PrintGC) { lprintf("compacting..."); }
# if  TARGET_OS_VERSION == SOLARIS_VERSION
  // making this sequential has terrible performance
  APPLY_TO_OLD_SPACES(NORMAL_ACCESS_TEMPLATE);
# elif  TARGET_OS_VERSION == SUNOS_VERSION
  sequential_access(0, ~0);
# endif
  // Linux???

  // precompute the unmarked map-map mapOop, to identify dying map objects
  mapOop unmarked_map_map = mapOop(Memory->map_map->enclosing_mapOop()->gc_unmark());

  oop *d, *bd;
  space *c2; // this variable is required to avoid the creation of a temporary
             // when calling compact().
  APPLY_TO_YOUNG_SPACES(YOUNG_SPACE_COMPACT_TEMPLATE);
  old_gen->prepare_for_compaction();
  oldSpace *copySpace= old_gen->first_space;
  c2= copySpace; // to satisfy type requirements
  APPLY_TO_OLD_SPACES(OLD_SPACE_COMPACT_TEMPLATE);
  copySpace= (oldSpace*)c2;
  copySpace= copySpace->next_space;
  while (copySpace != NULL) {
    copySpace->clear();
    copySpace= copySpace->next_space;
  }
  
  if (PrintGC) { lprintf("unmarking...");  }

  APPLY_TO_OLD_SPACES(RANDOM_ACCESS_TEMPLATE);

  // unmark objects
  APPLY_TO_SPACES(SPACE_UNMARK_TEMPLATE);
  
  UNMARK_TEMPLATE(&p);
  APPLY_TO_VM_OOPS(UNMARK_TEMPLATE);
  APPLY_TO_VM_MAPS(MAP_UNMARK_TEMPLATE);
  
       code->gc_unmark_contents();
  hprofiler->gc_unmark_contents();
  profilers->gc_unmark_contents();
  processes->gc_unmark_contents();
  VMStrings_gc_unmark_contents();
  slotIterator_gc_unmark_contents();
  
  string_table->gc_unmark_contents();


  ProcessInfo::update();
  faults= ProcessInfo::page_faults_IO() - faults;

  bool plentyOfMemory= faults < 50; // some arbitary reasonable threshold
  // More than one page fault per reclaimed page is too many.
  bool discardPgs=
       !plentyOfMemory
    && (   faults > (oldUsed - old_gen->used()) / OS::get_page_size()
        || old_gen->capacity() > OS::real_mem_size);

  {FOR_EACH_OLD_SPACE(s) {
# if  TARGET_OS_VERSION == SOLARIS_VERSION
    OS::normal_access((char*)s->oopsStart(), (char*)s->oopsEnd()); 
# endif
    // Linux???
    if (!plentyOfMemory)
      if (discardPgs)
        // +1 for sentinel
        OS::discard_pages((char*)(s->oopsEnd() + 1), s->bytesStart());
      else
        // +1 for sentinel
        OS::dont_need_pages((char*)(s->oopsEnd() + 1), s->bytesStart());
  }}

  APPLY_TO_ZONES(ZONE_NORMAL_ACCESS_TEMPLATE);

  // object_table contains a separate resource area which is freed by 
  // delete.
  delete object_table;
  object_table = NULL;
  
  old_gen->update_caches(false);

  if (PrintGC) {
    real_timer.stop();
    lprintf("done: real=%ld ms, cpu=%ld ms, freed %d bytes\n",
           long(real_timer.millisecs()),
           long(cpu_timer.time()),
           oldUsed - old_gen->used());
  }
  
  if (VerifyAfterScavenge || VerifyAfterGC) verify();

  return p;
}


// returns vector or failedAllocationOop 

void universe::enumerate_all_objs(enumeration *e) {
  APPLY_TO_SPACES(SPACE_ENUMERATE_ALL_OBJS_TEMPLATE);
}

void universe::enumerate_matches(enumeration *e) {
  APPLY_TO_SPACES(SPACE_ENUMERATE_MATCHES_TEMPLATE);
}

void universe::enumerate_maps(enumeration *e) {
  APPLY_TO_SPACES(SPACE_ENUMERATE_MAPS_TEMPLATE);
}

void universe::enumerate_families(enumeration *e) {
  APPLY_TO_SPACES(SPACE_ENUMERATE_FAMILIES_TEMPLATE);
}


bool universe::really_contains(void* p) {
  APPLY_TO_SPACES(SPACE_REALLY_CONTAINS_TEMPLATE);
  return false;
}


space* universe::spaceFor(void* p) {
  if (new_gen->from_space->contains(p))   return new_gen->from_space;
  if (new_gen->eden_space->contains(p))   return new_gen->eden_space;
  {FOR_EACH_OLD_SPACE(s) if (s->contains(p)) return s;}

  ShouldNotReachHere(); // not in any space
  return NULL;
}


typedef enum { okStatus,
               noSlotStatus,
               notAssignableStatus,
               noMemStatus } slotStatus;

static slotStatus get_space_usage(slotsOop proto, const char *slotName, space *s)
{
  bool inObj;
  oop *p= proto->get_slot_data_address_if_present(slotName, inObj); 
  if (p == NULL) return noSlotStatus;
  if (!inObj) return notAssignableStatus;
  oop vec= s->get_allocation_vector();
  if (vec == failedAllocationOop) return noMemStatus;
  Memory->store(p, vec);
  return okStatus;
}
  

#define FILL_IN_STATE_SLOT_TEMPLATE(s)                                  \
   st= get_space_usage(proto, STR(s), Memory->new_gen->CONC(s,_space));  \
   if (st == notAssignableStatus) goto unassignable;                    \
   if (st == noMemStatus) goto out_of_mem;                              \


static slotStatus set_slot(slotsOop proto, const char *slotName, smi val)
{
  bool inObj;
  oop *p= proto->get_slot_data_address_if_present(slotName, inObj); 
  if (p == NULL) return noSlotStatus;
  if (!inObj) return notAssignableStatus;
  Memory->store(p, as_smiOop(val));
  return okStatus;
}

oop universe::get_mem_current_state_prim(oop rcvrIgnored,
                                         slotsOop proto,
                                         void *FH) {
  Unused(rcvrIgnored);
  slotStatus st;
  oop *p;

  // new gen
  APPLY_TO_YOUNG_SPACE_NAMES(FILL_IN_STATE_SLOT_TEMPLATE);

  // old gen
  bool inObj;
  p= proto->get_slot_data_address_if_present("old", inObj); 
  if (p) {
    if (!inObj) goto unassignable;
    unsigned int nSpaces= Memory->old_gen->nSpaces;
    oop sv= Memory->objVectorObj->cloneSize(nSpaces, CANFAIL);
    if (sv == failedAllocationOop) goto out_of_mem;

    // sort spaces by address (so Self code can tell if first is only one used)
    oldSpace **sp= NEW_RESOURCE_ARRAY(oldSpace*, nSpaces);
    old_gen->sorted_space_list(sp, addr_cmp);

    for (int n= 0; n < nSpaces; n++) {
      oop vec= sp[n]->get_allocation_vector();
      if (vec == failedAllocationOop) goto out_of_mem;
      sv->obj_at_put(n, vec);
    }
    Memory->store(p, sv);
  }

  if (set_slot(proto, "card_table_size", Memory->remembered_set->byte_map_size())
      == notAssignableStatus) goto unassignable;
  if (set_slot(proto, "num_scavenge", Memory->scavengeCount)
      == notAssignableStatus) goto unassignable;

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  // zone
  if (set_slot(proto, "code",  Memory->code->iZone->usedBytes())
      == notAssignableStatus) goto unassignable;
  if (set_slot(proto, "deps",  Memory->code->dZone->usedBytes())
      == notAssignableStatus) goto unassignable;
  if (set_slot(proto, "pics",  Memory->code->stubs->zone()->usedBytes())
      == notAssignableStatus) goto unassignable;
  if (set_slot(proto, "debug", Memory->code->sZone->usedBytes())
      == notAssignableStatus) goto unassignable;
# endif

  return proto;

  out_of_mem: 
    out_of_memory_failure(FH);
    return NULL;

  unassignable: 
    prim_failure(FH, UNASSIGNABLESLOTERROR);
    return NULL;

}



// ---------------------- statistics stuff -----------------------

# define TitleLine              "%-20s %8s %6s %8s %6s\n"
# define LineFormat             "%-20s %8ld %5.1f%% %8ld %5.1f%%\n"
# define Percent(n,total)       (100.0 * n / total)

class InterestingMap: public ResourceObj {
 public:
  Map*  map;
  char* name;
  int32 count;
  int32 size;

  InterestingMap(Map* m, const char* n) {
    map = m; count = size = 0;
    name = NEW_RESOURCE_ARRAY( char, strlen(n));
    strncpy(name, n, strlen(n));
    name[strlen(n)-3] = '\0';           // cheap trick to get rid of "Map"
  }

  virtual bool matches(oop p, Map* m)   {
    Unused(p);
    return m->vtbl_value() == map->vtbl_value(); }
  void add(fint s)              { count++; size += s; }
  void print_im(int32 tCount, int32 tSize) {
    lprintf(LineFormat, name, long(count), Percent(count, tCount),
           long(size), Percent(size, tSize));
  }
    
};

typedef bool (*matchFn)(oop p, Map* m);

class GenericInterestingMap : public InterestingMap {
 public:
  matchFn pred;

  GenericInterestingMap(const char* nm, matchFn predicate) :
    InterestingMap(NULL, nm) { pred = predicate; }
  bool matches(oop p, Map* m) { return pred(p, m); }
};

class MemoryHistogram: public ResourceObj {
 public:
  fint   maxSize;               // max object size for histogram
  int32  totalSize;             // total size of all objects
  int32* sizeCounts;            // counters indexed by obj size
  int32  nobjs;                 // total # objects
  int32  nmaps;                 // total # maps
  int32  mapSize;               // size taken by them
  fint   interesting;           // # of interesting maps
  InterestingMap** iMaps;

  void init(fint maxSize, fint imaps);
  void addGenericMap(const char* name, matchFn predicate);
  void addMap(Map* m, const char* name);
  void add(oop p);
  void print();
};

MemoryHistogram* histogram;
void histoFn(oop* p) { histogram->add(*p); }

void MemoryHistogram::init(fint maxS, fint imaps) {
  maxSize = maxS;
  sizeCounts = NEW_RESOURCE_ARRAY( int32, maxSize);
  fint i;
  for (i = 0; i < maxSize; i++) sizeCounts[i] = 0;
  totalSize = nobjs = nmaps = mapSize = interesting = 0;
  iMaps = NEW_RESOURCE_ARRAY( InterestingMap*, imaps);
  for ( i = 0; i < imaps; i++) iMaps[i] = NULL;
}

void MemoryHistogram::addGenericMap(const char* name, matchFn predicate) {
  iMaps[interesting++] = new GenericInterestingMap(name, predicate);
}

void MemoryHistogram::addMap(Map* m, const char* name) {
  iMaps[interesting++] = new InterestingMap(m, name);
}

void MemoryHistogram::add(oop p) {
  nobjs++;
  fint size = p->size();
  totalSize += size;
  if (p->is_map()) { nmaps++; mapSize += size; }
  Map* m = p->map();
  sizeCounts[size < maxSize ? size - 1 : maxSize - 1]++;
  for (fint i = 0; i < interesting; i++ ) {
    if (iMaps[i]->matches(p, m)) {
      iMaps[i]->add(size);
      break;
    }
  }
}

int compareIM(const void* m1, const void* m2) {
  return (*(InterestingMap**)m2)->size - (*(InterestingMap**)m1)->size;
}

void MemoryHistogram::print() {
  lprintf(TitleLine, "OBJECT TYPE", "COUNT", "%", "SIZE", "%");
  qsort(iMaps, interesting, sizeof(void*), compareIM);
  fint i;
  for (i = 0; i < interesting; i++ ) iMaps[i]->print_im(nobjs, totalSize);
  lprintf(LineFormat, "TOTAL", long(nobjs), 100.0, long(totalSize), 100.0);
  lprintf("\n\n");

# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      int32 total = 0;
      for ( i = 0; i < maxSize; i++) total += sizeCounts[i];
      assert(total == nobjs, "wrong total");
    }
#   endif
  lprintf("object size distribution (size in words, including mark etc.):\n");
  int32 cumul = 0;
  fint median = 0;
  for ( i = 0; i < maxSize-1; i++) {
    cumul += sizeCounts[i];
    double percent = Percent(sizeCounts[i], nobjs);
    if (cumul / (double)nobjs < 0.5) median = i + 1;
    lprintf("%5ld: %6ld \t%4.1f%% \t%5.1f%%\n", long(i + 1),
           long(sizeCounts[i]), percent,
           Percent(cumul, nobjs));
  }
  lprintf(" >%3ld: %6ld \t%4.1f%% \t%5.1f%%\n",
         long(maxSize-1), long(sizeCounts[maxSize-1]),
         Percent(sizeCounts[maxSize-1], nobjs), 100.0);
  
  lprintf("nobjs: %6ld (%ld words); median size = %ld, avg. size = %3.1f\n",
         long(nobjs), long(totalSize), long(median + 1),
         (double)totalSize / nobjs);
  lprintf("maps:  %6ld (%ld words = %3.1f%%); avg. map size = %3.1f\n",
         long(nmaps), long(mapSize), 100.0 * mapSize / (double)totalSize,
         (double)mapSize / (double)nmaps);
  int32 bytes = Memory->new_gen->eden_space->bytes_used() +
                Memory->new_gen->from_space->bytes_used() +
                Memory->old_gen->bytes_used();
  lprintf("not counted above: bytes part of byte arrays: %ld words\n",
         long(bytes / oopSize));
}

# define INTERESTING_MAP_TEMPLATE(m)                                          \
  m CONC(m,_map);                                                             \
  histogram->addMap(&CONC(m,_map), STR(m));

static bool methodMatch(oop p, Map* pm) {
  Unused(pm);
  if (!p->is_map()) return false;
  Map* m = mapOop(p)->map_addr();
  return m->has_code() && m->kind() == OuterMethodType;
}

static bool blockMatch(oop p, Map* pm) {
  Unused(pm);
  if (!p->is_map()) return false;
  Map* m = mapOop(p)->map_addr();
  return m->is_block();
}

static bool blockMethodMatch(oop p, Map* pm) {
  Unused(pm);
  if (!p->is_map()) return false;
  Map* m = mapOop(p)->map_addr();
  return m->has_code() && m->kind() == BlockMethodType;
}

void universe::objectSizeHistogram(fint maxSize) {
  ResourceMark rm;
  maxSize++;
  histogram = new MemoryHistogram;

  histogram->init(maxSize, 100);
  histogram->addGenericMap("method mapXXX", methodMatch);
  histogram->addGenericMap("block mapXXX", blockMatch);
  histogram->addGenericMap("block method mapXXX", blockMethodMatch);
  FOR_ALL_MAP_TYPES(INTERESTING_MAP_TEMPLATE);
  new_gen->eden_space->oops_do(histoFn);
  new_gen->from_space->oops_do(histoFn);
  {FOR_EACH_OLD_SPACE(s) s->oops_do(histoFn);}
  histogram->print();
}

# if  GENERATE_DEBUGGING_AIDS
void universe::printRegion(char *&caddr, int count)    
{
  ResourceMark r;
  caddr= (char*)((int)caddr & ~Tag_Mask);
  oop *addr= (oop*)caddr;
  if (!Memory->really_contains(addr))
    fprintf(stderr, "%#lx not part of any space!\n", (long unsigned)addr);
  else {
    space *s= Memory->spaceFor(addr);
    if (!s->objs_contains(addr))
      fprintf(stderr, "%#lx not in the objs part of %s\n",
              (long unsigned)addr, s->name);
    else {
      fprintf(stderr, "%#lx (%s)\n", (long unsigned)addr, s->name);
      if (addr == s->oopsStart())
        fprintf(stderr, "---start of %s---\n", s->name);
      while (count--) {
        fprintf(stderr, "  %#lx: (%#lx) %s",
                (long unsigned)addr, (long unsigned)*addr,
                oop(*addr)->debug_print());
        if (   (*addr)->tag() == Int_Tag
            && s->bytes_contains(*addr)
            && (addr[-1])->tag() == Int_Tag)
          // probably a string
          fprintf(stderr, " \"%.*s\"", smiOop(addr[-1])->value(),
                  (char*)(*addr));
        fputc('\n', stderr);
        if (++addr == s->oopsEnd()) {
          fprintf(stderr, "---end of %s objs---\n", s->name);
          break;
        }
      }
    }
  }
}
#endif
  
static int nSlots, nDefaultAnnotations;

# if  GENERATE_DEBUGGING_AIDS
nmln* canonical_dep(nmln *d) {
  nmln *min= d;
  FOR_EACH_NMLN(d, elem, if (elem < d) d= elem);
  return min; }
#endif

void slotStats(slotDesc *s) {
  nSlots++;
  if (s->annotation == Memory->slotAnnotationObj)
    nDefaultAnnotations++;
# if  GENERATE_DEBUGGING_AIDS
  lprintf("%s %s ",
          s->augmentedName(),
            s->is_obj_slot() ? "obj"
          : s->is_map_slot() ? "map"
          : s->is_arg_slot() ? "arg"
          : "assignment");
  if (s->data->is_smi())
      lprintf("%d ", (smiOop(s->data))->value());
  else
      lprintf("%#lx ", (s->data));
  lprintf("%#lx\n",
         s->annotation == Memory->slotAnnotationObj
         ? 0 :(long unsigned)(s->annotation));
# endif
}

void allSlotDescsDo(oop *pp) {
  oop p= *pp;
  if (p->is_map()) {
    Map *m0= mapOop(p)->map_addr();
# if  GENERATE_DEBUGGING_AIDS
    lprintf("map: %s %s %s %s %#lx\n",
           m0->is_assignment()         ? "assignment"        
         : m0->is_block()              ? "block"             
         : m0->is_string()             ? "string"            
         : m0->is_byteVector()         ? "byteVector"        
         : m0->is_objVector()          ? "objVector"         
         : m0->is_mirror()             ? "mirror"            
         : m0->is_process()            ? "process"           
         : m0->is_vframe()             ? "vframe"            
         : m0->is_method_like()        ? "method_like"       
         : m0->is_fctProxy()           ? "fctProxy"          
         : m0->is_proxy()              ? "proxy"             
         : m0->is_foreign()            ? "foreign"           
         : m0->is_profiler()           ? "profiler"          
         : m0->is_slots()              ? "slots"             
         : m0->is_map()                ? "map"               
         : m0->is_smi()                ? "smi"
         : m0->is_float()              ? "float"
         : m0 == Memory->mark_map      ? "mark"
         : "???",
           m0->should_canonicalize()
           ? ((slotsMapDeps*)m0)->map_chain()->isEmpty() ? "nochain" : "chain"
           : "not_canon",
           m0->can_have_dependents()
           ? ((slotsMapDeps*)m0)->has_slot_dependents()
              ? "slotsdeps"
              : "noslotsdeps"
           : "not_slotsdeps",
           m0->can_have_dependents()
           ? ((slotsMapDeps*)m0)->add_slot_dependents()->isEmpty()
             ? "noaddslots" : "addslots"
           : "not_slots",
           m0->is_slots()
           ? ((slotsMap*)m0)->get_annotation() == Memory->objectAnnotationObj
             ? 0 : (unsigned long)(((slotsMap*)m0)->get_annotation())
           : 0);
# endif
    FOR_EACH_SLOTDESC(m0, s)
      slotStats(s);
  }
}

#define ALL_SLOTS_TEMPLATE(s)   s->oops_do(allSlotDescsDo);

void universe::printSlotDescStats() {
  nSlots= nDefaultAnnotations= 0;
  APPLY_TO_SPACES(ALL_SLOTS_TEMPLATE);
  lprintf("%d slot descriptors\n", nSlots);
  lprintf("%d (%3.1f%%) have the default annotation\n", nDefaultAnnotations,
         nDefaultAnnotations * 100.0 / nSlots);
}

void universe::nonCombiningMode() {
  code->nonCombiningMode();
}

void universe::setDepsMap(nmln *deps, slotsMapDeps *m) {
  code->setDepsMap(deps, m);
}

nmln* universe::allocateSlotDeps(slotsMapDeps *m) {
  char *d= code->allocateDeps(m->length_slots() * sizeof(nmln) + sizeof(m));
  nmln *deps= (nmln*)(d + sizeof(m));
  code->setDepsMap(deps, m);
  return deps;
}

void universe::deallocateSlotDeps(nmln *deps, fint ndeps) {
  code->deallocateDeps((char*)deps - sizeof(slotsMapDeps*),
                       ndeps * sizeof(nmln) + sizeof(slotsMapDeps*));
}

