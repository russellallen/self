/* Sun-$Revision: 30.19 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


extern bool NeedScavenge;       // set when eden overflows
extern bool GCInProgress;       // GC/scavenge in progress
extern bool ScavengeInProgress; // Scavenge in progress
extern bool bootstrapping;      // true only at the very beginning
extern bool postReadSnapshot;   // true after reading in a snapshot
                                // reset after evaluation of snapshot actions
extern char *WorldName;         // Starting Snapshot name
extern bool compressed_snapshot;// Is the starting snapshot compressed?
extern bool page_aligned;       // Are space boundaries page aligned?
extern bool SnapshotCode;       // reading=>snap contains code; writing=>write code
extern bool okToUseCodeFromSnapshot;
extern bool noCodeWarnings;     // Suppress VM startup warnings about code

extern const char* vmDate;

class universe {
 public:
  smi major_version;
  smi minor_version;
  smi snapshot_version;
  
  bool is_snapshot_other_endian;
  smi  snapshot_oopSize;         // oopSize used in the snapshot (4 for 32-bit, 8 for 64-bit)

  smiOop programming_timestamp;

  newGeneration *new_gen;
  oldGeneration *old_gen;

  zone* code;
  
  stringTable* string_table;
  rSet* remembered_set;
  ageTable* age_table;
  oTable* object_table;
  

  // prototypes (don't forget to change APPLY_TO_VM_OOPS below)

  slotsOop           lobbyObj;
  slotsOop           nilObj;
  slotsOop           trueObj;
  slotsOop           falseObj;
  stringOop          stringObj;
  assignmentOop      assignmentObj;
  objVectorOop       objVectorObj;
  byteVectorOop      byteVectorObj;
  blockOop           deadBlockObj;
  slotsOop           blockTraitsObj;
  processOop         processObj;
  profilerOop        profilerObj;

  vframeOop          outerActivationObj;
  vframeOop          blockActivationObj;

  proxyOop           proxyObj;
  fctProxyOop        fctProxyObj;

  objVectorOop       literalsObj;

  oop                slotAnnotationObj;
  oop                objectAnnotationObj;

  slotsOop           errorObj;

  // objectID
  objVectorOop objectIDArray;
  
  // mirrors (don't forget to change APPLY_TO_VM_OOPS and FOR_ALL_MAP_TYPES
  // below)
  mirrorOop assignmentMirrorObj;
  mirrorOop blockMirrorObj;
  mirrorOop byteVectorMirrorObj;
  mirrorOop outerMethodMirrorObj;
  mirrorOop blockMethodMirrorObj;
  mirrorOop floatMirrorObj;
  mirrorOop slotsMirrorObj;
  mirrorOop objVectorMirrorObj;
  mirrorOop smiMirrorObj;
  mirrorOop stringMirrorObj;
  mirrorOop processMirrorObj;
  mirrorOop outerActivationMirrorObj;
  mirrorOop blockActivationMirrorObj;
  mirrorOop proxyMirrorObj;
  mirrorOop fctProxyMirrorObj;
  mirrorOop profilerMirrorObj;
  mirrorOop mirrorMirrorObj;
  
  // maps
  Map* smi_map;
  Map* float_map;
  Map* mark_map;
  Map* map_map;
  
  inline Map*    true_map();
  inline Map*   false_map();
  mapOop  true_mapOop();
  mapOop false_mapOop();

  // additional variables
  int32   tenuring_threshold;
  int     scavengeCount;
  int32   Desired_Surv_Size;

  // hash table holding maps
  mapTable* map_table;

  // creation
  universe();
  void canonize_map_vtbls();
  
  // space operations
  bool is_heap(oop* p) {
    return new_gen->contains(p) || old_gen->contains(p); }
    
  bool is_obj_heap(oop* p) {
    return new_gen->objs_contains(p)  ||  old_gen->objs_contains(p); }
  
  memOop relocate(memOop p);
  bool verify_oop(memOop p, bool expectErrorObj = false);
  bool really_contains(void *p);
  space* spaceFor(void* p);
  generation* generation_containing(oop p) {
    return new_gen->contains(p) ? (generation*)new_gen : (generation*)old_gen; }
  
  // allocators
  oop* alloc_objs (fint size, bool mustAllocate= true) {
    return new_gen->alloc_objs(size, mustAllocate); }
  oop* alloc_objs_and_bytes(fint size, fint bsize, char*& bytes,
                            bool mustAllocate= true) {
    return new_gen->alloc_objs_and_bytes(size, bsize, bytes, mustAllocate); }

  // scavenging operations
  void swapSurvivors();
  oop scavenge(oop p = NULL);
  oop tenure(oop p = NULL);
  oop default_low_space_handler(oop p= NULL);
  
  void need_scavenge() {
    if (! NeedScavenge) {
      NeedScavenge = true;
      currentProcess->setupPreemption();
    }
  }
  bool needs_scavenge() { return NeedScavenge; }
  
  bool should_scavenge(memOop p) {
    return new_gen->eden_space->contains(p) || new_gen->from_space->contains(p); }
  inline space* survivor_space(memOop p, fint size, fint bsize, bool &is_new);
  
  // garbage collecting operations
  oop garbage_collect(oop p = NULL);

  bool might_run_out_of_space_on_scavenge() { 
    old_gen->reselect_reserve_space();
    return old_gen->reserve_space == NULL  ||  old_gen->reserve_space->bytes_free() < new_gen->used(); }


  // enumeration primitives
  void enumerate_matches(enumeration *e);
  void enumerate_maps(enumeration *e);
  void enumerate_families(enumeration *e);
  void enumerate_all_objs(enumeration *e);

  int32 bytes_free() { return old_gen->bytes_free();   }
  int32 oops_free()  { return old_gen->oops_free();    }
  
  oop get_mem_current_state_prim(oop rcvrIgnored, slotsOop proto, void *FH);

  // snapshotting operations
  const char *check_sizes_for_snapshot(spaceSizes &snap_sizes);
  bool  write_snapshot(const char *fileName,
                       const char *compression_filter, const char *decompression_filter,
                       spaceSizes *snap_sizes);
private:

  // The next group of functions are helpers for read_snapshot_header
  void  read_first_line_in_snapshot_header(FILE* file);
  void  read_versions_in_snapshot_header(FILE* file);
  void  read_timestamp_in_snapshot_header(FILE* file);
  void  read_snapshot_code_flag_in_snapshot_header(FILE* file);
  void  read_vm_date_in_snapshot_header(FILE* file);
  void  read_compression_flag_in_snapshot_header(FILE* file);
  void  read_page_aligned_flag_in_snapshot_header(FILE* file);

  void  read_snapshot_header(FILE* file);
  void  read_snapshot(FILE* file);
  void  get_space_sizes();
  void  genesis();
  friend void OS::FWrite(const void* , int32 , FILE* );  // calls snapshot_failed
  static void  snapshot_failed();

#define SPACE_CHECK_DECL_TEMPLATE(s) \
  const char *CONC(check_,s)(spaceSizes &snap_sizes);

  APPLY_TO_SPACE_SIZES(SPACE_CHECK_DECL_TEMPLATE)

public:
  spaceSizes current_sizes, default_sizes;

public:  

  // operations: we need extras because of include file orderings
  
  void store(oop* p, smiOop contents) { *(smiOop*)p = contents;}
  inline void store(oop* p, oop contents, bool cs= true); // inlined in oop.h
  
  void record_multistores(void* start, void* endArg) {
    remembered_set->record_multistores(start, endArg); }
  
  void switch_pointers(oop from, oop to);

  bool verify(bool postScavenge = false);

  void increment_programming_timestamp();
  
  // forwarders to zone if there is one
  void  nonCombiningMode();
  void  setDepsMap(nmln *deps, slotsMapDeps *m);
  nmln* allocateSlotDeps(slotsMapDeps *m);
  void  deallocateSlotDeps(nmln *deps, fint ndeps);

  
  // printing operations
  void print();
  void objectSizeHistogram(fint maxSize);

private:
  char *verify_opts;
public:
  char* printAddr; // used for debug printing

  byteVectorOop verifyOpts(char *newOpts);
  bool is_verify_opt(char c) { return strchr(verify_opts, c) != NULL; }

# if  GENERATE_DEBUGGING_AIDS
  void printRegion(char *&caddr, int count= 16);
#endif
  void printSlotDescStats();
};

extern universe* Memory;

smi set_memory_tenuring_threshold_prim(oop rcvrIgnored, smi newThresh, void *FH);
oop expand_heap_prim(oop rcvrIgnored, smi size);
oop full_write_snapshot_prim(oop rcvrIgnored, byteVectorOop name,
                             slotsOop compression_obj, slotsOop sizeObj,
                             bool snapCode, void *FH);
oop VMversion_prim(oop rcvrIgnored);

void noCodeWarning(const char *msg);
void check_delim(FILE *file, char *expected);
void write_delim(FILE *file, char *delim);


# define APPLY_TO_VM_OOPS(template)                                           \
    template(&Memory->lobbyObj)                                               \
    template(&Memory->nilObj)                                                 \
    template(&Memory->trueObj)                                                \
    template(&Memory->falseObj)                                               \
    template(&Memory->stringObj)                                              \
    template(&Memory->assignmentObj)                                          \
    template(&Memory->objVectorObj)                                           \
    template(&Memory->byteVectorObj)                                          \
    template(&Memory->blockTraitsObj)                                         \
    template(&Memory->deadBlockObj)                                           \
    template(&Memory->processObj)                                             \
    template(&Memory->profilerObj)                                            \
    template(&Memory->outerActivationObj)                                     \
    template(&Memory->blockActivationObj)                                     \
    template(&Memory->proxyObj)                                               \
    template(&Memory->fctProxyObj)                                            \
    template(&Memory->literalsObj)                                            \
    template(&Memory->slotAnnotationObj)                                      \
    template(&Memory->objectAnnotationObj)                                    \
    template(&Memory->errorObj)                                               \
                                                                              \
    template(&Memory->assignmentMirrorObj)                                    \
    template(&Memory->blockMirrorObj)                                         \
    template(&Memory->byteVectorMirrorObj)                                    \
    template(&Memory->outerMethodMirrorObj)                                   \
    template(&Memory->blockMethodMirrorObj)                                   \
    template(&Memory->floatMirrorObj)                                         \
    template(&Memory->objVectorMirrorObj)                                     \
    template(&Memory->slotsMirrorObj)                                         \
    template(&Memory->smiMirrorObj)                                           \
    template(&Memory->stringMirrorObj)                                        \
    template(&Memory->processMirrorObj)                                       \
    template(&Memory->outerActivationMirrorObj)                               \
    template(&Memory->blockActivationMirrorObj)                               \
    template(&Memory->proxyMirrorObj)                                         \
    template(&Memory->fctProxyMirrorObj)                                      \
    template(&Memory->profilerMirrorObj)                                      \
    template(&Memory->mirrorMirrorObj)                                        \
                                                                              \
    template(&Memory->objectIDArray)                                          \
    template(&BugHuntNames)                                                   \
    template(&CompileWithSICNames)                                            \


    
// must be a complete list of all concrete map types (ordered by frequency)
// Each such map must implement vtblMapType()

# define FOR_ALL_MAP_TYPES(template)                                          \
    template(slotsMap)                                                        \
    template(slotsMapDeps)                                                    \
    template(smiMap)                                                          \
    template(floatMap)                                                        \
    template(stringMap)                                                       \
    template(blockMap)                                                        \
    template(outerMethodMap)                                                  \
    template(blockMethodMap)                                                  \
    template(byteVectorMap)                                                   \
    template(objVectorMap)                                                    \
    template(mapMap)                                                          \
    template(markMap)                                                         \
    template(proxyMap)                                                        \
    template(fctProxyMap)                                                     \
    template(mirrorMap)                                                       \
    template(ovframeMap)                                                      \
    template(bvframeMap)                                                      \
    template(processMap)                                                      \
    template(profilerMap)                                                     \
    template(assignmentMap)                                                   \
    
# define OOPS_DO_TEMPLATE(p, f)                                               \
    (*f)((oop*)p);

# define SCAVENGE_TEMPLATE(p)                                                 \
    *((oop*) p) = oop(*p)->scavenge();

# define MARK_TEMPLATE(p)                                                     \
    *((oop*) p) = oop(*p)->gc_mark();

# define UNMARK_TEMPLATE(p)                                                   \
    *((oop*) p) = oop(*p)->gc_unmark();

# define VERIFY_TEMPLATE(p)                                                   \
    if (!oop(*p)->verify_oop()) { lprintf("\tof object at 0x%lx\n", p);  verify_result = false; }

# define VERIFY_TEMPLATE_EXPECT_ERROR_OBJ(p)                                  \
    if (!oop(*p)->verify_oop(true)) { lprintf("\tof object at 0x%lx\n", (unsigned long)p); verify_result = false; }

# define SWITCH_POINTERS_TEMPLATE(p)                                          \
    if ((oop) *p == (oop) from) *((oop*) p) = (oop) to;

# define UNDERIVE(p, offset) oop(((oop*) (p)) - (offset))
# define REDERIVE(p, offset) oop(((oop*) (p)) + (offset))

# define DERIVED_OOPS_DO_TEMPLATE(p, f)                                       \
    { int32 __o = oop(*p)->derived_offset();                                  \
      oop __p = UNDERIVE(*p,__o);                                             \
      (*f)(&__p);                                                             \
      *((oop*) p) = REDERIVE(__p,__o); }

# define DERIVED_SCAVENGE_TEMPLATE(p)                                         \
    { int32 __o = oop(*p)->derived_offset();                                  \
      oop __p = UNDERIVE(*p,__o);                                             \
      __p = __p->scavenge();                                                  \
      *((oop*) p) = REDERIVE(__p,__o); }

// The stack iterators examine any location exactly once,
//  this code messes up if it sees an already forwarded point, thus the assert.

# define DERIVED_MARK_TEMPLATE(p)                                             \
{ assert( !(*p)->is_mem()  ||  Memory->is_obj_heap((oop*)memOop(*p)->addr()), \
          "used for stack, so should only see a given place one time");       \
  int32 __o = oop(*p)->derived_offset();                                      \
  oop __p = UNDERIVE(*p,__o);                                                 \
  *((oop*) p) = __p->gc_mark_derived(p,__o); }

   
# define DERIVED_UNMARK_TEMPLATE(p)                                           \
    *((oop*) p) = oop(*p)->gc_unmark_derived(p);

# define DERIVED_VERIFY_TEMPLATE(p)                                           \
    { int32 __o = oop(*p)->derived_offset();                                  \
      if (!UNDERIVE(*p,__o)->verify_oop(true)) {                              \
        lprintf("\tof object at 0x%lx\n", p);                                 \
        derived_verify_template_result = false;                               \
      } }

# define DERIVED_SWITCH_POINTERS_TEMPLATE(p)                                  \
    { int32 __o = oop(*p)->derived_offset();                                  \
      oop __p = UNDERIVE(*p,__o); Unused(__p);                                \
      if (UNDERIVE(*p, __o) == (oop) from) {                                  \
        *((oop*) p) = REDERIVE((oop) to,__o);                                 \
      } }
 


# define READ_SNAPSHOT_TEMPLATE(p)                                            \
    { if (snapshot_version == 10  &&  (oop*)p == &CompileWithSICNames)        \
        ; /* don't read CompileWithSICNames from version 10 snapshots */      \
      else                                                                    \
        OS::FRead_oop((oop*)(p), file);                                       \
    }
    

// I have disabled the snapshot_version test below, because Universe::write_snapshot
// always uses VM_snapshot_version. -- dmu 3/04

# define WRITE_SNAPSHOT_TEMPLATE(p)                                           \
    { if ( false && snapshot_version == 10  &&  (oop*)p == &CompileWithSICNames) \
        ; /* don't write CompileWithSICNames in version 10 snapshots */       \
      else                                                                    \
        OS::FWrite(p, oopSize, snapFile);                                     \
    }

# define RELOCATE_TEMPLATE(p)                                                 \
    *((oop*) p) = oop(*p)->relocate();

# define APPLY_TO_VM_MAPS(template)                                           \
    template(&smi_map)                                                        \
    template(&float_map)                                                      \
    template(&mark_map)                                                       \
    template(&map_map)                                                        \
    
# define MAP_MARK_TEMPLATE(m)                                                 \
    *m = mapOop((*m)->enclosing_mapOop()->gc_mark())->map_addr();

# define MAP_SCAVENGE_TEMPLATE(m)                                             \
    *m = mapOop(oop((*m)->enclosing_mapOop())->scavenge())->map_addr();

# define MAP_UNMARK_TEMPLATE(m)                                               \
    *m = mapOop((*m)->enclosing_mapOop()->gc_unmark())->map_addr();

# define MAP_SWITCH_POINTERS_TEMPLATE(m)                                      \
    if (from == (*m)->enclosing_mapOop()) *m = mapOop(to)->map_addr();

// Starting with snapshot_version 12, maps are embedded in mapObjects,
// and so the proper address for the map is larger -- dmu 7/03
# define MAP_READ_SNAPSHOT_TEMPLATE(m)                                        \
    { OS::FRead_oop((oop*)(m), file);                                         \
      if (snapshot_version < 12)  *m = as_mapOop(*m)->map_addr(); }       

# define MAP_WRITE_SNAPSHOT_TEMPLATE(m)                                       \
    OS::FWrite(m, oopSize, snapFile);

# define MAP_RELOCATE_TEMPLATE(m)                                             \
    { mapOop _old_mo;                                                         \
      if (Memory->snapshot_oopSize == oopSize) {                              \
        _old_mo = (*m)->enclosing_mapOop();                                   \
      } else {                                                                \
        /* 32-bit Map* was at offset enclosed_map_offset * snapshot_oopSize */\
        char* _base = (char*)(*m)                                             \
                      - enclosed_map_offset * Memory->snapshot_oopSize;       \
        _old_mo = as_mapOop(_base);                                           \
      }                                                                       \
      *m = mapOop(_old_mo->relocate())->map_addr();                           \
    }

# define MAP_VERIFY_TEMPLATE(m)                                               \
    if (!(*m)->enclosing_mapOop()->verify_oop()) { lprintf("\tof vm map\n");  verify_result = false; }

# define MAP_CANONICALIZATION_TEMPLATE(m)                                     \
  { Map *_m= *m;                                                              \
    if (_m->should_canonicalize())                                            \
      map_table->add_map_from_snapshot((slotsMapDeps*)_m); }

# define APPLY_TO_YOUNG_SPACE_NAMES(template)                                 \
    template(eden)                                                            \
    template(from)                                                            \
    template(to)                                                      

# define APPLY_TO_YOUNG_SPACES(template)                                      \
    template(new_gen->eden_space)                                             \
    template(new_gen->from_space)                                             \
    template(new_gen->to_space)                                               

#define APPLY_TO_OLD_SPACES(template)                                         \
    {FOR_EACH_OLD_SPACE(s) {template(s);}}

# define APPLY_TO_SPACES(template)                                            \
    APPLY_TO_YOUNG_SPACES(template)                                           \
    APPLY_TO_OLD_SPACES(template)

# define YOUNG_SPACE_COMPACT_TEMPLATE(s)                                      \
    c2= s; s->compact(unmarked_map_map, c2, d, bd);

# define OLD_SPACE_COMPACT_TEMPLATE(s)                                        \
    s->compact(unmarked_map_map, c2, d, bd);

# define SPACE_UNMARK_TEMPLATE(s)                                             \
    s->gc_unmark_contents();

# define SPACE_VERIFY_TEMPLATE(s)                                             \
    verify_result = s->verify() && verify_result;

# define SPACE_RELOCATE_TEMPLATE(s)                                           \
    s->relocate();

# define SPACE_RELOCATE_BYTES_TEMPLATE(s)                                     \
    s->relocate_bytes();

# define SPACE_REPACK_BYTES_TEMPLATE(s)                                       \
    s->repack_bytes_for_64bit();

# define SPACE_NEED_TO_RELOCATE_TEMPLATE(s)                                   \
    need_to_relocate      |= s->need_to_relocate();                           \
    need_to_relocate_objs |= s->need_to_relocate_objs();

# define SPACE_FIXUP_MAPS_TEMPLATE(s)                                         \
    s->fixup_maps();

# define SPACE_CANONIZE_MAP_VTBLS_TEMPLATE(s)                                  \
    s->canonize_map_vtbls();

# define SPACE_CANONICALIZE_MAPS_TEMPLATE(s)                                  \
    s->canonicalize_maps();

# define SPACE_FIXUP_KILLABLES_TEMPLATE(s)                                    \
    s->fixup_killables();

# define SPACE_OOP_RELOCATE_TEMPLATE(s)                                       \
    if (s->old_objs_contains(p)) return s->relocate_objs(p);

# define SPACE_VERIFY_OOP_TEMPLATE(s)                                         \
    if (s->objs_contains(p)) return true;

# define SPACE_ENUMERATE_ALL_OBJS_TEMPLATE(s)                                 \
    s->enumerate_all_objs(e);

# define SPACE_ENUMERATE_MATCHES_TEMPLATE(s)                                  \
    s->enumerate_matches(e);

# define SPACE_ENUMERATE_MAPS_TEMPLATE(s)                                     \
    s->enumerate_maps(e);

# define SPACE_ENUMERATE_FAMILIES_TEMPLATE(s)                                 \
    s->enumerate_families(e);

# define SPACE_PRINT_TEMPLATE(s)                                              \
    s->print();

# define SPACE_REALLY_CONTAINS_TEMPLATE(s)                                    \
    if (s->really_contains(p)) return true;
