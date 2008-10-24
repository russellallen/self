/* Sun-$Revision: 30.15 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


class space: public CHeapObj {
  
  friend class universe;
  friend class generation;
  friend class newGeneration;
  friend class oldGeneration;
  friend class Monitor;
  friend class abstract_monitor;
  friend class byteVectorOopClass;
  // friend oopsOop oopsOopClass::scavenge(fint);
  friend class oopsOopClass;
  // friend void nmethod::printDeps();
  friend class nmethod;

  // instance variables
 protected:
  // invariant: objs_bottom and bytes_top are on idealized_page_size boundaries

  // invariant: keep at least one word free between
  // object and byte areas, for sentinels,
  // ie, objs_top < bytes_bottom.

  oop* objs_bottom;
  oop* objs_top;
  oop* bytes_bottom;
  oop* bytes_top;

  oop* objs_scavenge_point; // used during scavenging
  
  // these are used after a snapshot is read in
  oop* old_objs_bottom;
  oop* old_objs_top;
  oop* old_bytes_bottom;
  oop* old_bytes_top;

  int32 old_size_bytes() { // the extra 1 is for the invariant
    return oopSize * (1
                      + (old_bytes_top - old_bytes_bottom)
                      + (old_objs_top - old_objs_bottom)); }

  friend bool rSet::verify(bool);

 public:
  char* name;
  
  // constructors; none allocate object space
  space(char *nm, int32 &size) {
    Unused(size); name= nm; } // dummy just for oldSpace
  space(char* nm, int32 &size, char *bottom) {
    init_space(nm, size, bottom); };
  space(char* nm, char *bottom, char *top);
  space(char* nm, FILE *snap);

  void read_snapshot(FILE* snap, char *bottom, char *top);

  // destructor
  ~space() { delete [] name; }

 protected:
  void init_space(char* nm, int32 &size, char *bottom);

 public:
  // allocation test
  bool would_fit(fint size, fint bsize = 0) {
    return objs_top + size  <  bytes_bottom - bsize; }
    
 protected:
  // allocators; called by new,oldGeneration, and by string and block
  // allocators.
  oop* alloc_objs_local(fint size) {
    oop* p = objs_top;
    oop* p1 = p + size;
    if (p1 < bytes_bottom) {
      objs_top = p1;
      return p;
    } else {
      return NULL;
    } }
  void unalloc_objs_local(fint size) { objs_top -= size; }    
  oop* alloc_objs_and_bytes_local(fint size, fint bsize, char*& bytes) {
    oop* p = objs_top;
    oop* p1 = p + size;
    oop* bp = bytes_bottom;
    oop* bp1 = bp - bsize;
    if (bp1 > p1  &&  bp1 <= bp) {
      objs_top = p1;
      bytes_bottom = bp1;
      bytes = (char*) bp1;
      return p;
    } else {
      return NULL;
    } }
  void unalloc_objs_and_bytes_local(fint size, fint bsize) {
    objs_top -= size;
    bytes_bottom += bsize; }
 public:
  oop* oopsStart()   { return objs_bottom; }
  oop* oopsEnd()     { return objs_top; }
  char* bytesStart() { return (char*) bytes_bottom; }
  char* spaceStart() { return (char*)  objs_bottom; }
  char* spaceEnd()   { return (char*) bytes_top; }
  int32 capacity()   { return (char*) bytes_top    - (char*) objs_bottom - oopSize; }
  int32 oops_used()  { return          objs_top    - objs_bottom; }
  int32 bytes_used() { return (char*) bytes_top    - (char*) bytes_bottom; }
  int32 oops_free()  { return         bytes_bottom - objs_top - 1; }
  int32 used()       { return (char*)  objs_top    - (char*) objs_bottom 
                       +      (char*) bytes_top    - (char*) bytes_bottom; }
  int32 bytes_free() { return (char*) bytes_bottom - (char*) objs_top - oopSize; }
  
  bool contains(void* p) {
    return (oop*) p >= objs_bottom && (oop*) p <= bytes_top; }
  bool objs_contains(void* p) {
    return (oop*) p >= objs_bottom && (oop*) p < objs_top; }
  bool in_objs_bounds(void* p) {
    return (oop*) p >= objs_bottom && (oop*) p <= objs_top; }
  bool bytes_contains(void* p) {
    return (oop*) p >= bytes_bottom && (oop*) p <= bytes_top; }
  bool really_contains(void *p) { 
    return objs_contains(p) || bytes_contains(p);}
  bool old_objs_contains(void* p) {
    return (oop*) p >= old_objs_bottom && (oop*) p < old_objs_top; }
  bool old_bytes_contains(void* p) {
    return (oop*) p >= old_bytes_bottom && (oop*) p <= old_bytes_top; }
  
  oop get_allocation_vector();

 protected:
  void set_objs_top_sentinel(oop s) { *objs_top= s; }

  // operations
  inline void clear();                  // inlined below
  void compact(mapOop unmarked_map_map, space*& copySpace, oop*& d, oop*& bd);
  virtual void gc_unmark_contents();
  bool verify();

  // for debugging & fun
  oop find_oop_backwards(void* start);
  void oops_do(oopsDoFn f);
  
  void switch_pointers_in_region(oop from, oop to, oop* bottom, oop* top);
  void switch_pointers(oop from, oop to) {
    switch_pointers_in_region(from, to, objs_bottom, objs_top); }
  void write_snapshot_header(FILE* file);
  void write_snapshot(FILE* file);
  void relocate();
  void relocate_bytes();
  void fixup_maps();
  void fixup_killables();
  void canonicalize_maps(); 
  void canonize_map_vtbls();
 
  bool need_to_relocate() {
    return objs_bottom != old_objs_bottom ||
      bytes_bottom != old_bytes_bottom; }
  bool need_to_relocate_objs() {
    return objs_bottom != old_objs_bottom; }
  
  memOop relocate_objs(memOop p) {
    assert(old_objs_contains(p), "not correctly relocating");
    return memOop((oop*) p + (objs_bottom - old_objs_bottom)); }
  char* relocate_bytes(char* p) {
    assert(old_bytes_contains(p), "not correctly relocating");
    return (char*) ((oop*) p + (bytes_bottom - old_bytes_bottom)); }
  
 public:
  void enumerate_matches(enumeration *e);
  void enumerate_maps(enumeration *e);
  void enumerate_families(enumeration *e);
  void enumerate_all_objs(enumeration *e);

 protected:
  void enumerate_families_small(enumeration *e);

 public:
  void print();
};

inline void space::clear() {
  objs_top = objs_bottom; bytes_bottom = bytes_top;
# if GENERATE_DEBUGGING_AIDS 
    if (CheckAssertions) {
      // to detect scavenging bugs
      set_oops(objs_bottom, oops_free(), oop(1));
    }
# endif
}

class newSpace: public space {
  friend class universe;
  friend class generation;
  friend class newGeneration;
  friend class oldGeneration;
  // these allocate directly in a newSpace
  // friend oop blockOopClass::clone_block(oop);
  friend class blockOopClass;
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

  // friend byteVectorOop byteVectorOopClass::scavenge(fint);
  friend class ::byteVectorOopClass;

  newSpace* next_space;

 private: // see friends for other callers
  oop* alloc_objs(fint size, bool mustAllocate= true) {
    assert(size > 0, "should be a positive allocation");
    oop* p= alloc_objs_local(size);
    if (p) {
#     if GENERATE_DEBUGGING_AIDS
        if (CheckAssertions  &&  p == (oop*)catchThisOne) {
          warning1("space::alloc_objs caught 0x%lx", p);
        }
#     endif
      return p;
    } else {
      char* dummy;
      return alloc_more_objs_and_bytes(size, 0, dummy, mustAllocate);
    }
  }
  
  oop* alloc_objs_and_bytes(fint size, fint bsize, char*& bytes,
                            bool mustAllocate= true) {
    assert(size > 0, "should be a positive allocation");
    assert(bsize >= 0, "should be a non-negative allocation");
    oop* p= alloc_objs_and_bytes_local(size, bsize, bytes);
    if (p) {
#     if GENERATE_DEBUGGING_AIDS
        if (CheckAssertions  &&  (p == (oop*)catchThisOne || bytes == (char*)catchThisOne)) {
          warning1("space::alloc_objs_and_bytes caught 0x%lx", catchThisOne);
        }
#     endif
      return p;
    } else {
      return alloc_more_objs_and_bytes(size, bsize, bytes, mustAllocate);
    }
  }
  oop* alloc_more_objs_and_bytes(fint size, fint bsize, char*& bytes,
                                 bool mustAllocate);
  
  void prepare_for_scavenge();
  bool scavenge_contents();

  // called by Memory
  newSpace(char* n, int32 &size, char* bottom) : space(n, size, bottom) {}
  newSpace(char* n, int32 &size, FILE* snap);
};


class oldSpace: public space {
  friend class universe;
  friend class generation;
  friend class newGeneration;
  friend class oldGeneration;
  friend class Monitor;
  friend class SelfMonitor;
  friend class abstract_monitor;
  friend class rSet;
  // GCC4 friend void space::compact(mapOop, space*&, oop*&, oop*&);


 // GCC4 private: 
 public:
  oldSpace *next_space;

 private:
  inline bool reserveFree();
  // called by oldGeneration
  oop* alloc_objs_and_bytes(fint size,
                            fint bsize,
                            char*& bytes,
                            bool mustAllocate);

  // constructors
  // allocates object space too; sets size to amount allocated, 0 if none
  // tries to start space at desiredAddress if non-zero.
  oldSpace(char* nm, int32 &size, caddr_t desiredAddress);

  // constructors which do not allocate object space
  oldSpace(char *nm, FILE *snap) : space(nm, snap) { next_space= NULL; }
  oldSpace(char *nm, char *bottom, char *top) : space(nm, bottom, top) {
    next_space= NULL; }

  void prepare_for_scavenge();
  bool scavenge_promotions();
  bool scavenge_recorded_stores();
  virtual void gc_unmark_contents();
  void switch_pointers_by_card(oop from, oop to);
  void record_new_pointers();
};

