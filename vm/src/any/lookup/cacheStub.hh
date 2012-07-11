/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

// A CacheStub implements a polymorphic inline cache (PIC).

#define VTBL_AND_SETTER(classname, INIT) \
 protected:                                                             \
  static VtblPtr_t _vtbl_value;                                         \
  classname(float /* unLikelyToCallByAccident */) INIT {}               \
                 /* shouldn't call this except in the function below */ \
                                                                        \
 public:                                                                \
  static void set_vtbl_value() {                                        \
    classname c(1.0);                                                   \
    _vtbl_value= c.vtbl_value(); }                                      \
  VtblPtr_t static_vtbl_value() { return _vtbl_value; }                 \


#define CHECK_VTBL_VALUE   if (_vtbl_value == 0) _vtbl_value = vtbl_value();

class cacheStubInfo {
 public:
  unsigned int has_smi        : 1;
  unsigned int has_float      : 1;
  unsigned int is_megamorphic : 1;
  unsigned int arity          : 29;
};

class CacheStub : public OopNCode {
  VTBL_AND_SETTER(CacheStub,);
 protected:
  // The globals below are shared by various routines during an extension.
  static Assembler* a;
  static nmethod** n;           // n[newMethods] = method currently added
  static CountStub** st;        // corresponding count stub or 0
  static fint newMethods;
  static sendDesc* theSendDesc;
  static Assembler* oldAssembler;
  static nmethod *nsmi, *nfloat;
  static CountStub *stsmi, *stfloat;

  //  WARNING: if you add/remove inst vars, please fix CacheStubSize in
  //    spaceSizeMacros.h -- dmu 12/91

 private:
  ~CacheStub() {}               // should never be called
  cacheStubInfo info;
 public:
  nmln  cacheLink;              // link to inline cache
  // storage layout:    instructions
  //                    locations
  //                    nmlns
  
  CacheStub();
  void* operator new(size_t size);
  void  deallocate()            { deallocate2(false); }
  fint arity()                  { return this ? info.arity : 0; }
  pc_t insts()                 { return (pc_t)(this + 1); }
  sendDesc* sd();
  nmethod* sender();
  nmln* deps()                  { return (nmln*)locsEnd(); }
  nmln* depsEnd()               { return deps() + arity(); }
  int32 size()                  { return (pc_t)depsEnd() - (pc_t)this; }
  bool  encompasses(void* addr) { return (pc_t)this <= (pc_t)addr &&
                                         (pc_t)addr < (pc_t)depsEnd(); }
  fint indexOfDep(nmln *dep)    { 
    assert(dep >= deps() && dep < depsEnd(), "not in this stub's deps");
    return dep - deps(); }
  
  nmethod* get_method(fint which);
  mapOop   get_map(fint which);
  fint nOccurrences(nmethod *nm);
  CountStub* countStub(fint which);
  bool isCacheStub()            { return true; }
  bool isMegamorphic()          { return this && info.is_megamorphic; }
#ifdef UNUSED
  int32 flush();
#endif
  virtual void moveTo_inner(NCodeBase* to, int32 delta, int32 size);
  void shift_target(nmln* l, int32 delta);
  NCodeBase* unlink_me(nmln* l);
#ifdef UNUSED
  NCodeBase* unlink_one(nmln* l);
#endif
  void replace_with_inline_cache(fint i);
  void forwardLinkedSend(nmln* l, nmethod* to);
  CacheStub* extend(sendDesc* sd, nmethod* n, mapOop rcvrMapOop);
#ifdef UNUSED
  void insertCounters();        // insert count stubs if not already there
  void removeCounters();        // remove count stubs if not counting sendDesc
#endif
  void print();

  friend bool isCacheStub(void* p);
  bool verify();
  
  void rebind(fint index, nmethod* nm, CountStub* cs);
  void rebind(nmln *l, nmethod* nm, CountStub* cs) {
    rebind(indexOfDep(l), nm, cs); }

 protected:
  bool hasSmi()         { return this && info.has_smi; }
  bool hasFloat()       { return this && info.has_float; }
  fint immediateCount() { return int(hasSmi()) + int(hasFloat()); }
  inline NCodeBase* get_thing(fint which);
  virtual fint getMapLocsIndex(fint which);
  virtual fint getJumpLocsIndex(fint which);
  addrDesc *getJumpLoc(fint which) { return &locs()[getJumpLocsIndex(which)]; }
  pc_t getJumpAddr(fint which) { return getJumpLoc(which)->referent(this); }
  void setJumpAddr(fint which, char *addr) {
    getJumpLoc(which)->set_referent(this, addr); }
  void computeJumpAddr(nmethod* nm, sendDesc* sd, CountStub*& s, pc_t& addr);

  CacheStub* copy_add_nmethod(sendDesc* sd, nmethod* add, mapOop rcvrMapOop);
  CacheStub* copy_remove_nmethod(sendDesc* sd, fint delIndex);
  CacheStub* copy_remove_all(sendDesc* sd, nmethod* del);
  CacheStub* copy_replace_immediate(sendDesc* sd, fint delIndex,
                                    nmethod* add, mapOop rcvrMapOop);

  void copy_prologue(sendDesc *sd);
  void find_immediate_nmethods(nmethod *del);
  CacheStub* copy_epilogue();
  void gen_copy(fint total, fint delIndex, nmethod *delnm= 0,
                nmethod *a1= 0, mapOop m1= mapOop(badOop),
                CountStub *s1= 0,
                nmethod *a2= 0, mapOop m2= mapOop(badOop),
                CountStub *s2= 0);

  CacheStub* makeMegamorphic(sendDesc* sd, nmethod* nm, mapOop rcvrMapOop);
  CacheStub* extendMegamorphic(sendDesc* sd, nmethod* nm, mapOop rcvrMapOop);
  Label* generate(nmethod* n, mapOop rcvrMapOop, CountStub* stub, Label* prev);
  Label* prologue(bool immediateOnly);
  Label* test(oop what, pc_t addr, Label* prev);
  inline void jump(pc_t addr);
  
  void finish(Label* miss, Label* prev);
  void deallocate2(bool dontDeallocateStubs);

  friend class Stubs;
# if  GENERATE_DEBUGGING_AIDS
  friend CacheStub* StubFromNmln(nmln* l);
#endif

# include "_cacheStub_pd.hh.incl"
};

NCodeBase* findStub(void* addr);
CacheStub* findCacheStub(void* addr);
CacheStub* findCacheStub_maybe(void* addr);     // slow!  for debugging only

class Stubs {
  Heap* stubZone;
 public:
  bool needsWork;       // true if compaction/expansion is needed
  void* reserve;        // space for emergencies (0 if none)
  
  Stubs(Heap* s);
  void* operator new(size_t size) {
    return AllocateHeap(size, "PIC stubs header"); }
  
  void gc_mark_contents();
  bool gc_unmark_contents();
  bool switch_pointers(oop from, oop to,
                       nmethodBList* nmethods_to_invalidate);
  bool code_oops_do(oopsDoFn f);
#ifdef UNUSED
  void relocate();
#endif
  void cleanup();       // called if needsWork
  void decay(float factor);
  void flush();
  void clear();
  bool verify();
  void space_print();
  void print()                          { stubZone->print(); }
  Heap* zone()                          { return stubZone; }
  
  bool contains(void* p)                { return stubZone->contains(p); }
  void* allocate(int32 size);
  void deallocate(void* s, int32 size)  { stubZone->deallocate(s, size); }
};


# define SKIP_RESERVE(var,expr)                                               \
    var = expr,                                                               \
    (var  &&  var == Memory->code->stubs->reserve)                            \
      ?  var = (NCodeBase*)Memory->code->stubs->zone()->nextUsed(var)         \
      :  var                                                                  \


# define FOR_ALL_STUBS(var)                                                   \
  NCodeBase* var;                                                             \
  for (                                                                       \
      SKIP_RESERVE(var,(NCodeBase*)Memory->code->stubs->zone()->firstUsed()); \
      var;                                                                    \
      SKIP_RESERVE(var,(NCodeBase*)Memory->code->stubs->zone()->nextUsed(var))\
  )  \


# endif  // defined(FAST_COMPILER) || defined(SIC_COMPILER)

oop pic_histogram_prim(oop rcvr);
