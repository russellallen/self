/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



oop PrintDebugSize_prim(oop rcvr);
oop findNMethods_prim(oop rcvr, oop map, oop sel);
oop printNMethodCode_prim(oop rcvr);


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

// The zone is the area of memory holding compiled methods (nmethods).

class ScopeDesc;
class PcDesc;
class addrDesc;

enum nm_compiler {nm_nic, nm_sic, nm_last};

class zone: public CHeapObj {
 protected:
  int32* bottom;
  
  nmethod* LRUhand;     // for LRU algorithm; sweeps through iZone
  
  bool needsICompaction;// need compaction of iZone
  bool needsSCompaction;// need compaction of dZone
  bool needsDCompaction;// need compaction of sZone
  bool _needsSweep;     // need LRU sweep
  int32 compactDuration;// duration of last compaction
  timer zoneTimer;      // timer for computation of above
  float minFreeFrac;    // fraction of free space needed at compaction time
  IDManager* idManager;
  
 public:                // for monitor
  Heap* iZone;          // class nmethod + insts + locs
  Heap* dZone;          // deps
  Heap* sZone;          // scopes + pcs
  Stubs* stubs;         // PICs
 
  Trapdoors* trapdoors;  // long calls to far-away stubs
  
 public:
  codeTable* table;     // hash table MethodLookupKey --> nmethod
  codeTable* debugTable;// same for nmethods with debugging code
  nmln rememberLink;    // list of nmethods with pointers to newspace
  nmln replCandidates;  // list of replacement candidates
  nmln zombies;         // list of zombie methods

  static int32 frame_chain_nesting;   // are nmethods on stacks chained? (>0 = yes)

  
  zone(int32& codeSize, int32& stubSize, int32& depSize, int32& debugSize);
  void* operator new(size_t size) {
    return AllocateHeap(size, "nmethod zone header"); }
  void clear();
  
  int32 capacity()      {
    return iZone->capacity() + dZone->capacity()
      + sZone->capacity() + stubs->zone()->capacity(); }
      
  int32 used();
  int32 numberOfNMethods() { return idManager->usedIDs; }
  
  int used_per_compiler[nm_last];

  nmethod* alloc(int32 iLen, int32 sLen, int32 lLen, int32 dLen,
                 char*& insts, nmethodScopes*& scopes,
                 addrDesc*& locs, nmln*& deps);
  void free_nmethod(nmethod* m);
  void addToCodeTable(nmethod* nm, MethodLookupKey *k);
  
  nmethod* lookup(MethodLookupKey &k, bool needDebug = false);

  void compact(bool forced = false);
  void compactAll() {
    needsICompaction = needsSCompaction = needsDCompaction = true;
    compact(true); }
  bool needsCompaction() {
    return needsICompaction || needsSCompaction || needsDCompaction; }
  bool needsWork() { return needsCompaction() || _needsSweep; }
  bool needsSweep() { return _needsSweep; }
  void doWork();
  void doSweep();
  void flush();
  void flushZombies();
  void markAllUnused();
  void flushUnused();
  void flush_inline_cache();
  int32 findReplCandidates(int32 needed);
  
  void nonCombiningMode() {
    iZone->combineMode = dZone->combineMode = sZone->combineMode = false;
  }
  // frame chaining: see FrameChainer below
  void chainFrames() { 
    assert(frame_chain_nesting >= 0, "frame_chain_nesting should be nonnegative");
    if (frame_chain_nesting++ == 0) doChainFrames();
  }
  void unchainFrames() { 
    assert(frame_chain_nesting > 0, "frame_chain_nesting should be positive");
    if (--frame_chain_nesting == 0) doUnchainFrames();
  }


  // zone creation (for PPC) must put stubs right after iZone
  pc_t code_start() { return Memory->code->      iZone->startAddr(); }
  pc_t code_end()   { return Memory->code->stubs->zone()->endAddr(); }

  bool isSelfPC(void* p) { return code_start() <= p  &&  p < code_end(); }
  
  
  bool contains(void *p) {
    return iZone->contains(p) || dZone->contains(p) || sZone->contains(p); }
  nmethod* findNMethod(void* start);
  nmethod* findNMethod_maybe(void* start);      // slow!
  void findNMethodOrMap(nmln *n, nmethod* &nm, slotsMapDeps* &s);
  
  void nmethods_do(nmethodDoFn f);
  void oops_do(oopsDoFn f);
  void scavenge_contents();
  void gc_mark_contents();
  void gc_unmark_contents();
  void switch_pointers(oop from, oop to);
  bool verify();
  void read_snapshot(FILE* f);
  void write_snapshot(FILE* f);
#ifdef UNUSED
  void relocate();
#endif
  void relocate_nmln(nmln*);
  void fixup();
  void print();
  void print_stats();
  
  void print_nmethod_histogram(fint size);

  nmethod* first_nm()           { return (nmethod*)(iZone->firstUsed()); }
  nmethod* next_nm(nmethod* p)  { return (nmethod*)(iZone->nextUsed(p)); }
  char*    instsStart();
  int32    instsSize();
  int32    LRU_time();
  int32    sweeper(int32 maxVisit, int32 maxReclaim,
                   int32* nvisited = NULL, int32* nbytesReclaimed = NULL);
  int32    nextNMethodID();
  
  char *allocateDeps(fint nbytes);
  void deallocateDeps(char *d, fint nbytes) { dZone->deallocate(d, nbytes); }
  void setDepsMap(nmln *deps, slotsMapDeps *m);

 protected:
  void     print_helper(bool stats);
  void     adjustPolicy();
  int32    flushNextMethod(int32 needed);
  inline nmethod* next_circular_nm(nmethod* nm);
  void     doChainFrames();
  void     doUnchainFrames();
  
  friend void moveInsts(char* from, char* to, int32 size);
  friend void printAllNMethods();
  friend void sweepTrigger();
  
 // constructor helpers:
 private:
  void round_sizes(int32& codeSize, int32& stubSize, int32& depSize, int32& debugSize);
  
  void set_sizes_for_statically_allocated_code_and_stub_area(
         int32& codeSize, int32& stubSize, int32& depSize, int32& debugSize,
         char*& stb);
  void set_sizes_and_allocate_code_and_stub_area(
         int32& codeSize, int32& stubSize, int32& depSize, int32& debugSize,
         char*& stb);
         
  void allocate_pieces(int32& codeSize, int32& stubSize, int32& depSize, int32& debugSize, char* stb);
  void check_allocations();
  void allocate_trapdoors_at_zone_base_stealing_from_code_space(int32& codeSize);
  void allocate_idManager(fint maxNMs);
  void setup_LRU();
  void allocate_useCount(fint maxNMs);
};

// use this to make sure frames are unchained when returning from function
class FrameChainer {
  zone* z;
 public:
  FrameChainer(zone* zz)    { z = zz; zz->chainFrames(); }
  ~FrameChainer()           { z->unchainFrames(); }
};

// holds usage information for nmethods (or index of next free nmethod ID
// if not assigned to any nmethod)
class LRUcount {
 public:
  uint16 unused;        // nmethod prologue clears BOTH fields to 0
  uint16 lastUsed;      // time of last use
  
  LRUcount()                { ShouldNotCallThis(); } // shouldn't create
  LRUcount(LRUcount &/*l*/) { ShouldNotCallThis(); } // shouldn't create
#ifdef UNUSED
  int32 asInt()         { return *(int32*)this; }
#endif
  void  set(int32 i)    { *(int32*)this = i; }
};

extern LRUcount* LRUtable;      // for optimized methods
extern int32* LRUflag;  // == LRUtable, just different type for convenience
extern int32* useCount; // table with counts for unoptimized methods

#define APPLY_TO_ZONES(template) \
        template(Memory->code->iZone); \
        template(Memory->code->dZone); \
        template(Memory->code->sZone); \
        template(Memory->code->stubs->zone()); \

# else // make a dummy zone

class zone: public CHeapObj {
 public:
  bool contains(void *p) { Unused(p); return false;}
  int32 capacity() { return 0; }
  void compactAll() {}
  void flush() {}
  void flushUnused() {}
  void flushZombies() {}
  void flush_inline_cache() {}
  void markAllUnused() {}
  void flushInlineCache() {}
  void print_nmethod_histogram(fint size) { Unused(size); }
  void print_stats() {}
  zone(int32& iSize, int32& dSize, int32& sSize, int32& stSize) {
    iSize = dSize = sSize = stSize = 0; }
  void switch_pointers(oop from, oop to) { Unused(from); Unused(to); }
  void  read_snapshot( FILE* f);
  void write_snapshot( FILE* f);
  void fixup() {}
  void verify() {}
  void clear() {}

  
  void print() {}
  void scavenge_contents() {}
  void gc_mark_contents() {}
  void gc_unmark_contents() {}
  
  void nonCombiningMode() {}
  
  char *allocateDeps(fint nbytes) {  // no zone; no deps
    Unused(nbytes); ShouldNotCallThis(); return NULL; }
  void deallocateDeps(char *d, fint nbytes) {
    Unused(d); Unused(nbytes); ShouldNotCallThis(); }
  void setDepsMap(nmln *deps, slotsMapDeps *m) {
    Unused(deps); Unused(m); ShouldNotCallThis(); }

  void chainFrames() {}
  void unchainFrames() {}

  void findNMethodOrMap(nmln *n, nmethod* &nm, slotsMapDeps* &s);
};

#define APPLY_TO_ZONES(template) 

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
