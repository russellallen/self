/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// A generation is a bunch of spaces of similarly-aged objects

class generation: public CHeapObj {

  friend class rSet;
  friend class universe;
  friend class memOopClass;
  // these call the alloc_ routines directly
  // friend oopsOop oopsOopClass::copy(fint, bool, oop, bool);
  // friend oopsOop oopsOopClass::insert(fint, fint, fint, bool, bool);
  // friend oopsOop oopsOopClass::remove(fint, fint, fint, bool, bool);
  friend class oopsOopClass;
  // friend byteVectorOop byteVectorOopClass::copy(fint, bool, oop, bool);
  // friend byteVectorOop byteVectorOopClass::insert(fint, fint, fint,
  //                                                 bool, bool);
  // friend byteVectorOop byteVectorOopClass::remove(fint, fint, fint,
  //                                                 bool, bool);
  friend class byteVectorOopClass;
  friend class oldGeneration;

 protected:
  // allocators; called by Memory and scavenger
  virtual oop* alloc_objs(fint size, bool mustAllocate= true) = 0;
  virtual oop* alloc_objs_and_bytes(fint size, fint bsize, char*& bytes,
                                    bool mustAllocate= true) = 0;

  // Minimum and maximum addresses, used by card marking code.
  // Must not overlap with address ranges of other generation(s).
  char *low_boundary;
  char *high_boundary;

 public:
  // space enquiries
  virtual int32 capacity() = 0;
  virtual int32 oops_used() = 0;
  virtual int32 bytes_used() = 0;
  virtual int32 oops_free() = 0;
  virtual int32 used() = 0;
  virtual int32 bytes_free() = 0;

  void print();
};


class MapList : public CHeapObj {
public:
  MapList *next;
  slotsMapDeps *map;
 
  MapList(slotsMapDeps *m, MapList *n) { next= n; map= m; }
};


// Forward-declaration for friend
oop clone0_prim(slotsOop rcvr);
oop clone1_prim(slotsOop rcvr);
oop clone2_prim(slotsOop rcvr);
oop clone3_prim(slotsOop rcvr);
oop clone4_prim(slotsOop rcvr);
oop clone5_prim(slotsOop rcvr);
oop clone6_prim(slotsOop rcvr);
oop clone7_prim(slotsOop rcvr);
oop clone8_prim(slotsOop rcvr);
oop clone9_prim(slotsOop rcvr);
#ifndef NOASM
void itrace(fint);
#endif

class newGeneration: public generation {

  friend class rSet;
  friend class universe;
  friend class MemoryHistogram;
  friend class blockOopClass;
  friend class TrackObjectHeapInMonitor;
  friend class SelfMonitor;
  friend oop clone0_prim(slotsOop rcvr);
  friend oop clone1_prim(slotsOop rcvr);
  friend oop clone2_prim(slotsOop rcvr);
  friend oop clone3_prim(slotsOop rcvr);
  friend oop clone4_prim(slotsOop rcvr);
  friend oop clone5_prim(slotsOop rcvr);
  friend oop clone6_prim(slotsOop rcvr);
  friend oop clone7_prim(slotsOop rcvr);
  friend oop clone8_prim(slotsOop rcvr);
  friend oop clone9_prim(slotsOop rcvr);

  friend class AllocationMonitor;
#ifndef NOASM
  friend void itrace(fint);
#endif

 private:
  newSpace* eden_space;
  newSpace* from_space;
  newSpace* to_space;

  // allocators; called by Memory and scavenger
  oop* alloc_objs(fint size, bool mustAllocate= true) {
    return eden_space->alloc_objs(size, mustAllocate); }
  oop* alloc_objs_and_bytes(fint size, fint bsize, char*& bytes,
                            bool mustAllocate= true) {
    return eden_space->alloc_objs_and_bytes(size, bsize, bytes,
                                            mustAllocate); }

 public:
  // space enquiries
  int32 capacity();
  int32 oops_used();
  int32 bytes_used();
  int32 oops_free();
  int32 used();
  int32 bytes_free();

  void print();
  bool verify();

  bool contains(void* p) {
    return (char*)p >= low_boundary && (char*)p < high_boundary; }

  bool objs_contains(void* p);

 private:
  // these are used to determine if an oop is in the new or old generation
  // when we have many similar tests to do; the first can be hoisted out of
  // the loop and then passed as the 2nd arg to is_new (for speed).
  // friend void OopNCode::check_store(oop, char*);
  friend class OopNCode;
  // friend nmethod::nmethod(AbstractCompiler*, nmln*, bool);
  friend class nmethod;
  char *boundary() { return high_boundary; }
  inline bool is_new(memOop p, char *boundary); // inlined in generation.dcl.h
  inline bool is_new(oop p,    char *boundary); // ditto

  // constructor, called by Memory
  newGeneration(int32 &eden_size, int32 &surv_size, FILE *snap = NULL);

  // scavenger-related items
  // these are actually called by Memory
  void prepare_for_scavenge(); 
  bool scavenge_contents();

  MapList* map_list;
  void init_map_list() {
    while (map_list != NULL) {
      MapList *n= map_list->next;
      delete map_list;
      map_list= n; }
  }
  friend class slotsMapDeps;
  friend class mapMap;
  // friend Map* Map::init();
  // friend bool mapMap::verify(oop);
  void add_map(slotsMapDeps *m) {  // add m to map chain if new
    if ((char*)m < high_boundary)
      map_list= new MapList(m, map_list); }
  bool has_map(slotsMapDeps *m);
  void adjust_maps();
  bool verify_new_maps();

  void switch_pointers(oop from, oop to);

  void write_snapshot(FILE* file);
};

// Forward-declaration for friend
oop expand_heap_prim(oop, smi);
stringOop create_string(fint);
inline void handlePreemption();
void create_initial_strings(oop);
#ifndef NOASM
void itrace(fint);
#endif

class oldGeneration: public generation {

  friend class rSet;
  friend class universe;
  friend class SelfMonitor;

#ifndef NOASM
  friend void itrace(fint);
#endif
  friend class TrackObjectHeapInMonitor;
  friend oop expand_heap_prim(oop, smi);
  friend class oldSpace;
  // these alloc_ directly here
  friend stringOop create_string(fint);
  // friend stringOop stringOopClass::make_string(char*, fint, bool);
  friend class stringOopClass;

// the following does not work with Metroworks precompiled headers
  friend bool oldSpace::reserveFree();

  friend inline void handlePreemption();
 private:
  unsigned nSpaces;
  oldSpace *first_space;
  oldSpace *last_space;
  oldSpace *reserve_space; // the space with reserve
                           // memory for scavenge
  oldSpace *old0; // the first space to be created
  caddr_t top_of_old_space; // keep track of where old space ends so that
                // old space addresses are all near each other

  // for signalling low space 
  int32 VM_reserved_mem;
 public:
  int32 get_VM_reserved_mem() { return VM_reserved_mem; }

 private:
  int32 cached_free;
  void update_cached_free() { cached_free= bytes_free(); }
  int32 lowSpaceThreshold;
 public:
  int32 getLowSpaceThreshold() { return lowSpaceThreshold; }
  void setLowSpaceThreshold(int32 newLST) {
    assert(newLST >= VM_reserved_mem, "red line too low");
    lowSpaceThreshold= newLST;
    lowOnSpace= false; // let next alloc trip if already over the line
    needToSignalLowOnSpace= false;
  }
  bool lowOnSpace;
  bool needToSignalLowOnSpace;
  void check_for_end_of_low_space();
  inline void check_for_low_space();
  int expand(int32 size);

  void update_caches(bool postScavenge);

  // allocators; called by Memory and scavenger
  oop* alloc_objs(fint size, bool mustAllocate= true) {
    char* dummy;
    return alloc_objs_and_bytes(size, 0, dummy, mustAllocate);
  }
  oop* alloc_objs_and_bytes(fint size, fint bsize, char*& bytes,
                            bool mustAllocate= true);
                            
  // constructors, called by Memory
  oldGeneration(            int32 initial_size, int32 reserved_amount);
  oldGeneration(FILE* snap, int32 initial_size, int32 reserved_amount);

  // only called at startup
  friend void create_initial_strings(oop);
  char* empty_bytes_addr() {
    assert(first_space != NULL && first_space->next_space == NULL,
           "empty_bytes_addr called too late");
    return first_space->bytesStart();
  }
  
 public:
  bool objs_contains(void* p);

  // space enquiries
  int32 capacity();
  int32 oops_used();
  int32 bytes_used();
  int32 oops_free();
  int32 used();
  int32 bytes_free();

  void print();
  bool verify();

  bool contains(void* p);

 private:
  // scavenger-related items; only meaningful during scavenges.
  oldSpace *tenuring_space;

  oldSpace* biggest_free_space(oldSpace *f);

  // these are actually called by Memory  
  void prepare_for_scavenge();
  bool scavenge_promotions();
  void cleanup_after_scavenge();
  void switch_pointers(oop from, oop to);
  void switch_pointers_by_card(oop from, oop to);
  void reselect_reserve_space();

  space *tenuring_space_for(fint size, fint bsize);
  void reset_tenuring_order();
  
  void sorted_space_list(oldSpace *sp[], int (*cmp)(oldSpace**, oldSpace**));
  void resort_spaces(int (*cmp_fn)(oldSpace**, oldSpace**));
  void prepare_for_compaction();

  void append_space(oldSpace *last);

  void read_snapshot(FILE* file);
  bool write_only_old0;
  void set_write_only_old0();
  void write_snapshot(FILE* file);

  void coalesce_spaces();
  void record_new_pointers();
};


int addr_cmp(oldSpace **s1, oldSpace **s2);
smi set_memory_low_space_threshold_prim(oop rcvr, smi newLST, void *FH);


// ensure that you surround the call with {} to prevent s leaking out!
#define FOR_EACH_OLD_SPACE(s) \
  for (oldSpace *s= Memory->old_gen->first_space;               \
       s != NULL;                                               \
       s= s->next_space)



