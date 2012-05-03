/* Sun-$Revision: 30.13 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

// nmethods (native methods) are the compiled code versions of Self
// methods.  

class nmFlags {
 public:
  // metrowerks requires int types for bitfields to pack!
  
  /* bool        */          int isZombie:             1;  // can be discarded if not on stack
  /* bool        */          int isDI:                 1;  // affected by DI
  /* bool        */          int isInvalid:            1;  // nmethod is invalid (needs programming conv.)
  /* bool        */          int isDebug:              1;  // version compiled for debugging
  /* nm_compiler */          int compiler:             2;  // compiler which generated this nmethod
  /* bool        */          int flushed:              1;  // to catch flushing errors
  /* bool        */          int isUncommonRecompiled: 1;  // recompiled because of uncommon trap?  (SIC)
  /* bool        */          int isYoung:              1;  // "young"? (recently recompiled)
  /* bool        */          int isToBeRecompiled:     1;  // to be recompiled as soon as it matures
  /* bool        */          int isImpureNIC:          1;  // if NIC method, something is inlined
  /* fint        */          int filler:               1;  
  /* uint16      */ unsigned int level:                4;  // optimization level
  /* uint16      */ unsigned int version:              8;  // version number (0 = first version)
  /* uint16      */ unsigned int trapCount:            8;  // number of map-load traps encountered

  void clear() { assert(sizeof(nmFlags) == 4, "oops"); *(int32*)this = 0; }
};


nmethod* constructDoItMethod(oop receiver, oop method);

// GGC3 needs 0 not NULL
static nmethod* shutUpCompiler = NULL;
# define NMETHOD_FROM(fieldName, p)                                           \
      ((nmethod*)((char*)p - (char*)&shutUpCompiler->fieldName))


// Forward-declaration for friend
bool     isNMethod(void* p);
nmethod* nmethodContaining(char* pc, char* likelyEntryPoint);
nmethod* findNMethod(void* start);
nmethod* findNMethod_maybe(void* start);
nmethod* nmethod_from_insts(char* insts);
nmethod* new_nmethod(AbstractCompiler* c,
                     bool generateDebugCode);
// cf. cacheStub
void set_nmethod_vtbl_value();

class nmethod : public OopNCode {
 public:
  int32 depsLen;
  nmethodScopes* scopes;
  
 protected:
  nmln* depsAddr;
  VTBL_AND_SETTER(nmethod,);
 public:
  NMethodLookupKey key; // key for code table searching
  
  codeTableEntry *codeTableLink; // links codeTableEntries for this nmethod
  nmln  linkedSends;    // links all nmethods that are i-c to me
  nmln  diLink;         // links the nmethod that DI forwards to me
  nmln  zoneLink;       // used by the zone to link replacement candidates
  int32 id;             // for LRU and recompiles; every nmethod has unique ID
  int32 oldCount;       // previous value of usage counter
  nmFlags flags;        // various flags
  uint16 verifiedOffset;// offset of entry point for known map
  uint16 diCheckOffset; // offset of entry point for DI checks
  uint16 frameCreationOffset; // offset of entry point where activation frame
                             // has been established.
 protected:
  uint16 frame_size;    // size of stack frame (in words)
  fint   _incoming_arg_count; // w/o receiver

 public:
  frame* frame_chain;   // beginning link of frames that are running me
  
 protected:
  nmethod(AbstractCompiler* c, bool generateDebugCode = false);
  void get_platform_specific_data(AbstractCompiler* c);

  void* operator new(size_t size);
  void deallocate()     { flush(); }
 public:
  friend nmethod* new_nmethod(AbstractCompiler* c,
                              bool generateDebugCode = false);
  
  char* insts()                 { return (char*)(this + 1); }
  char* verifiedEntryPoint()    { return insts() + verifiedOffset; }
  char* diCheckEntryPoint()     { return insts() + diCheckOffset; }
  char* entryPointFor(sendDesc *sd);

  PcDesc* pcs()         { return (PcDesc*) scopes->pcs();}
  PcDesc* pcsEnd()      { return (PcDesc*) scopes->pcsEnd();}

  nmln*   deps()        { return depsAddr;}
  nmln*   depsEnd()     { return (nmln*) ((char*) deps() + depsLen);}

  fint    size()        { return (char*)locsEnd() - (char*)this; }

  fint incoming_arg_count()  { return _incoming_arg_count; }

  void removeFromCodeTable();

  nmethod** dBackLinkAddr() { return (nmethod**)deps()   - 1; }

  bool  isNMethod()     { return vtbl_value() == static_vtbl_value(); }
  bool  isUncommon()    { return false; }
  bool  isZombie()      { return flags.isZombie; }
  void  makeZombie(bool unlink = true);
  bool  isDI()          { return flags.isDI; }
  bool  isInvalid()     { return flags.isInvalid; }
  bool  isValid()       { return !isInvalid(); }
  fint  compiler()      {
    switch (flags.compiler) {
     case nm_nic: return NIC;
     case nm_sic: return SIC;
     default: fatal("invalid compiler"); return 0;
    }
  }
  bool  isDebug()               { return flags.isDebug; }
  bool  isUncommonRecompiled()  { return flags.isUncommonRecompiled; }
  bool  isYoung()               { return flags.isYoung; }
  bool  isImpureNIC()           { return flags.isImpureNIC; }
  bool  reusable()              { return compiler()==NIC && !isImpureNIC(); }
  void  makeYoung();
  void  makeVeryYoung();
  void  makeOld();
  fint  agingLimit();          // # invocations before isYoung is cleared

  bool  isToBeRecompiled()      { return flags.isToBeRecompiled; }
  void  makeToBeRecompiled()    { flags.isToBeRecompiled = 1; }
  void  makeImpureNIC()         { flags.isImpureNIC= 1; }
  bool  needToRecompileFor(sendDesc *s) {
    return compiler() == NIC  &&  s->isOptimized(); }
  void  setCompiler(fint c) {
    switch (c) {
     case NIC: flags.compiler = nm_nic; break;
     case SIC: flags.compiler = nm_sic; break;
     default: fatal("invalid compiler"); break;
    }
  }
  bool shouldRecompile();    // these names are crummy (one is not the inverse
  bool shouldNotRecompile(); // of the other)
  bool mustNotRecompile();
  fint level();
# ifdef UNUSED
  void setLevel(fint newLevel)  { flags.level = newLevel; }
# endif
  fint version()                { return flags.version; }
  void setVersion(fint v);
  fint invocationCount();       // approximation (not all calls have counters)
  fint ncallers();              // # of callers (*not* # of inline caches)
  fint nsends(bool includeAll = false); // # of inlinable sends; if includeAll,
                                // also count non-inlinable sends
  bool isTiny();

  bool is_frame_chain_saved() { return frame_chain == SavedFrameChain; }
  void save_frame_chain()     { frame_chain= SavedFrameChain; }
  void clear_frame_chain()    { frame_chain= NULL; }
  void unlink_saved_frame_chain() {
    if (frame_chain == SavedFrameChain) frame_chain= NoFrameChain; }
  void save_unlinked_frame_chain() {
    if (frame_chain == NoFrameChain) frame_chain= SavedFrameChain; }

  bool  encompasses(void* p);
  int32 frameSize()             { return frame_size; }
  
  // for zone LRU management
  int32 lastUsed()      { return LRUtable[id].lastUsed; }
  bool  isUsed()        {
    return frame_chain != NoFrameChain
        || !LRUflag[id]
        || useCount[id] != oldCount; }
  
  virtual void moveTo_inner(NCodeBase* to, int32 delta, int32 size);
  void  shift_target(nmln* l, int32 delta);
  NCodeBase* unlink_me(nmln* l);
  void  forwardLinkedSend(nmln* l, nmethod* to) {
    l->asSendDesc()->rebind(to); }

  void  addDeps(dependencyList *deps); // changes deps
  void  moveDeps(nmln* newDeps, int32 delta);
  void  moveScopes(nmethodScopes* scopes);
  void  remove_me_from_inline_cache();
  void  forwardLinkedSends(nmethod* to);
  
  void  unlink();               // unlink from codeTable, deps etc.
  void  flush();
  void  flushPartially(); // used during recompilation
  void  invalidate();
#ifdef UNUSED
  int32 flushPICs();
  int32 unlinkDI(nmln*& savedDIChildren);
#endif
  void  relinkDI(int32 n, nmln*& savedDIChildren);
  
 protected:
  void  check_store();
 public:
  bool  code_oops_do(oopsDoFn f);
  bool  scavenge_contents();
  void  gc_mark_contents();
  bool  gc_unmark_contents();
  bool  switch_pointers(oop from, oop to,
                        nmethodBList* nmethods_to_invalidate);
  void  relocate();
  bool  verify();
  
  // programming and debugging
  PcDesc*    containingPcDesc(char* pc);
  PcDesc*    containingPcDescOrNULL(char* pc);
 public:

  ScopeDesc* containingScopeDesc(char* pc);
  ScopeDesc* correspondingScopeDesc(ScopeDesc* s);
# if  GENERATE_DEBUGGING_AIDS
  PcDesc*    correspondingPC(ScopeDesc* sd, int32 bci);
#endif
  sendDesc*  sendDescFor(compiled_vframe* vf, bool wantIntrCheck);
  Map*       blockMapFor(blockOop bl);

  addrDesc*  addrDesc_at(char* p); // slow - for debugging

  // Returns true if activation frame has been established. 
  bool       has_frame_at(char* pc);

  // Returns true if pc is not in prologue or epilogue code.
  bool       in_self_code_at(char* pc);
  
  oop   method()   { return scopes->root()->method(); }

# ifdef UNUSED
  bool  isMethod() { return scopes->root()->isMethodScope(); }
# endif
  bool  isAccess() { return scopes->root()->isAccessScope(); }
  
  void  print();
 protected:
  void print_platform_specific_data();
 public:
  void  printCode();
# if  GENERATE_DEBUGGING_AIDS
  void  printLocs();
  void  printDeps();
  void  printPcs();
# endif
  
  friend bool           isNMethod(void* p);
  friend nmethod*       nmethodContaining(char* pc, char* likelyEntryPoint);
  friend nmethod*       findNMethod(void* start);
  friend nmethod*       findNMethod_maybe(void* start);
  
  friend nmethod* nmethod_from_insts(char* insts) {     // for efficiency
    nmethod* nm = (nmethod*) insts - 1;
    if (::isNMethod(nm)) return nm; else return findNMethod(nm);
  }
# include "_nmethod_pd.hh.incl"
};

# else // defined(FAST_COMPILER) || defined(SIC_COMPILER)

class nmethod {
 public:
  void invalidate() {}
};

# endif
