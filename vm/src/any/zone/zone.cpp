/* Sun-$Revision: 30.19 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "zone.hh"
# include "_zone.cpp.incl"


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

int32 zone::frame_chain_nesting = 0;



# define LRU_RETIREMENT_AGE 10  /* min. age (# sweeps) for retirement */
# define LRU_MAX_VISITED    min(numberOfNMethods(), LRUMaxVisited)
                                /* max. # nmethods visited per sweep */
# define LRU_MAX_RECLAIMED 250000 /* stop after having found this amount of */
                                /* space occupied by replacement candidates */
# define LRU_CUTOFF        32   /* max. length (bytes) of "small" methods */
# define LRU_SMALL_BOOST    3   /* small methods live this many times longer */
         // (because access methods don't clear their unused bit)
# define LRU_OPTIMIZED_BOOST 10 /* optimized nm live longer (because they */
                                /* are expensive to recreate) */

# define COMPACT_OVERHEAD  0.05 /* desired max. overhead for zone compaction */


// Trade-offs for blocksizes/queue length below:
// - larger blocks mean larger internal fragmentation but less space 
//   overhead for the heap maps and increased effectiveness of the free lists
// - longer free lists cover a wider range of allocations but can slow down
//   allocation (when most lists are empty but still have to be scanned).
# define iBLOCK 32              /* block size for iZone */
# define iFREE  20              /* # of free lists for iZone */
# define dBLOCK 32              /* block size for dZone */
# define dFREE  20              /* # of free lists for dZone */
# define sBLOCK 16              /* block size for sZone */
# define sFREE  40              /* # of free lists for sZone */

# define StubBlock  16          /* block size for PIC zone */
# define StubFree   20          /* # of free lists for PIC zone */

# define MaxExtFrag  0.05       /* max. tolerated ext. fragmentation */

# define FOR_ALL_NMETHODS(var)                                                \
    for (nmethod *var = first_nm(); var; var = next_nm(var))


static nmethod* fieldOffsetDetector_nmethod = 0;
# define NMETHOD_FROM(fieldName, p)                                           \
  ((nmethod*)((char*)p - (char*)&fieldOffsetDetector_nmethod->fieldName))


static OopNCode* fieldOffsetDetector_OopNCode = 0;
# define OOPNCODE_FROM(fieldName, p)                                          \
  ((OopNCode*)((char*)p - (char*)&fieldOffsetDetector_OopNCode->fieldName))



inline int32 roundSize(int32 s, int32 blockSize) {
  return (s + blockSize - 1) / blockSize * blockSize;
}

static const int32 maxBlockSize = max(max(iBLOCK, dBLOCK), sBLOCK);


LRUcount* LRUtable;     // for optimized methods
int32* LRUflag;         // == LRUtable, just different type for convenience
int32* useCount;        // table with counts for unoptimized methods

static int32 LRUtime;       // virtual time; incremented after every full sweep

// We could directly run the sweeper from the interrupt handler, but
// this is tricky since the stack is in a strange state.  
void sweepTrigger() {
  if (UseLRUInterrupts) {
    Memory->code->_needsSweep = true;
    InterruptedContext::setupPreemptionFromSignal();
  };
}

# if TARGET_IS_PROFILED
  extern "C" void CompiledSelfCode();
  extern "C" void CompiledSelfCodeEnd();

  char* zoneStart()     { return first_inst_addr(CompiledSelfCode); }
  char* zoneEnd()       { return first_inst_addr(CompiledSelfCodeEnd); }
  
# else
  char* zoneStart()     { return 0; }
  char* zoneEnd()       { return 0; }
# endif


zone::zone(int32& codeSize, int32& stubSize, int32& depSize, int32& debugSize) {
  used_per_compiler[nm_nic]= 0;
  used_per_compiler[nm_sic]= 0;
  
  char* stb = 0;
  if ( TARGET_IS_PROFILED )  set_sizes_for_statically_allocated_code_and_stub_area(codeSize, stubSize, depSize, debugSize, stb);
  else                                   set_sizes_and_allocate_code_and_stub_area(codeSize, stubSize, depSize, debugSize, stb);

  allocate_trapdoors_at_zone_base_stealing_from_code_space(codeSize);  
  allocate_pieces(codeSize, stubSize, depSize, debugSize, stb);
                             
  check_allocations();                               
  
  fint maxNMs = codeSize / (sizeof(nmethod) + 32); // conservative guess
  
  allocate_idManager(maxNMs);
  setup_LRU();
  allocate_useCount(maxNMs);
  clear();
  
  // start sweeper
  IntervalTimer::CPU_timer()->enroll_async_if_safe(1.0 / (float)IntervalTimer::LRU_resolution, sweepTrigger);
  zoneTimer.timeRestart();
}


static const int32 branch_disp_bits = 32;

static const uint32 maxCodeAndStubSizeForMachine =  (uint32)(1  <<  (branch_disp_bits - 1)); // -1 because disp may be + or -



void zone::set_sizes_for_statically_allocated_code_and_stub_area(int32& codeSize, int32& stubSize, int32& depSize, int32& debugSize, char*& stb) {

  if (OS::make_memory_executable(zoneStart(), zoneEnd()-zoneStart()))
    fatal3("Couldn't make PIC area writable: zoneStart() = 0x%x, zoneEnd() = 0x%x, difference = %d",
          zoneStart(), zoneEnd(), zoneEnd() - zoneStart());
          
  char* end = zoneStart() +  umin(zoneEnd() - zoneStart(),  maxCodeAndStubSizeForMachine);

  for (;;) {
    round_sizes(codeSize, stubSize, depSize, debugSize);   
            
    // make PICs part of the profiled memory area
    bottom = (int32*)roundSize(int32(zoneStart()), maxBlockSize);
    codeSize =  (end - (char*)bottom) - stubSize - 2*1024;
    codeSize = codeSize / maxBlockSize * maxBlockSize;
    stb = (char*)bottom + codeSize + 1024; // why 1024??? profiling? -dmu 6/9
    
    if (stb + stubSize <= end) 
      break;
      
    int32 oldISize = codeSize;
    codeSize = codeSize / 2;
    codeSize = codeSize / maxBlockSize * maxBlockSize;
    warning2("Cannot have such a large zone (%ld bytes)\n"
              "in profiled version.  "
              "Will proceed by reducing size of code area to %ld bytes.\n",
              oldISize, codeSize);
  }    
}


void zone::set_sizes_and_allocate_code_and_stub_area(int32& codeSize, int32& stubSize, int32& depSize, int32& debugSize, char*& stb) {
  
    round_sizes(codeSize, stubSize, depSize, debugSize);
    int codeSize_p = roundTo(codeSize, idealized_page_size);
    int stubSize_p = roundTo(stubSize, idealized_page_size);
    int codeAndStubSize_p = codeSize_p + stubSize_p; // (possibly) changed by OS::allocate_idealized_page_aligned
    
    if ((uint32)codeAndStubSize_p > maxCodeAndStubSizeForMachine) {
      int32 nCodeSize_p;
      int32 codeAndStubSize = maxCodeAndStubSizeForMachine; // extra -1 because asm buffer needs to be in range, too
      
      // The following paragraph is a HACK to try to deal with too-large zone requests better.
      // It duplicates the computation of stubSize, etc. just above. -- dmu 6/03
      stubSize = codeAndStubSize / 16;
      stubSize = stubSize / StubBlock * StubBlock;
      stubSize_p = roundTo(stubSize, idealized_page_size);
      nCodeSize_p = codeAndStubSize - stubSize_p; 
      nCodeSize_p &= ~(idealized_page_size - 1); // be a multiple of idealized_page_size
      codeSize = codeSize_p = nCodeSize_p;

      warning2("zone::zone: code and stub size %d was too big for this machine, using %d instead", 
                codeAndStubSize_p, codeSize_p + stubSize_p);
      codeAndStubSize_p = codeSize_p + stubSize_p;
      assert((uint32)codeAndStubSize_p <= maxCodeAndStubSizeForMachine, "");
    }
          
    // allocate stubs and code together for span-limited branches -- dmu
    // See zone::code_start() and zone::code::end()
    bottom= (int32*)OS::allocate_idealized_page_aligned(codeAndStubSize_p, "nmethod zone (inst + stubs)", NMethodStart);
    stb= (char*)bottom + codeSize_p; 
  
    if (OS::make_memory_executable(bottom, codeAndStubSize_p))
      fatal2("Couldn't make PIC area writable: start = 0x%x, length = %d",
             bottom, codeSize_p);

}



void zone::round_sizes(int32& codeSize, int32& stubSize, int32& depSize, int32& debugSize) {
   codeSize = roundSize(  codeSize, maxBlockSize);
    depSize = roundSize(   depSize, maxBlockSize);
  debugSize = roundSize( debugSize, maxBlockSize);
   stubSize = stubSize / StubBlock * StubBlock;
}


void zone::allocate_pieces(int32& codeSize, int32& stubSize, int32& depSize, int32& debugSize, char* stb) {
  int32 depSize_p = depSize, debugSize_p = debugSize; // alloate_idealized_page_aligned may change sizes
  char* db = OS::allocate_idealized_page_aligned(   depSize_p, "nmethod zone (deps)"  ,   DepsStart );
  char* sb = OS::allocate_idealized_page_aligned( debugSize_p, "nmethod zone (scopes)", ScopesStart );
  
  assert(int32(bottom) % maxBlockSize == 0, "zone misaligned");
  char* b = (char*)bottom;
  
  table      = new codeTable(codeTableSize); 
  debugTable = new codeTable(debugTableSize);

  iZone =            new Heap(codeSize,    iBLOCK,    iFREE,   b,   b != NMethodStart);
  dZone =            new Heap(depSize,     dBLOCK,    dFREE , db,  db !=    DepsStart);
  sZone =            new Heap(debugSize,   sBLOCK,    sFREE,  sb,  sb !=  ScopesStart);
  stubs = new Stubs( new Heap(stubSize, StubBlock, StubFree, stb, stb !=   StubsStart));
}

void zone::check_allocations() {
  if (iZone->contains(stubs->zone()->startAddr()))
    fatal("i and stub zones overlap");
  if (stubs->zone()->contains(dZone->startAddr()))
    fatal("d and stub zones overlap");
  if (dZone->contains(sZone->startAddr())) fatal("d and s zones overlap");
  assert(sizeof(LRUcount) == 4, "should be one word");
}

void zone::allocate_trapdoors_at_zone_base_stealing_from_code_space(int32& codeSize) {
  // allocate trapdoors at base of zone, steal space from code space
  trapdoors = new Trapdoors((char*)bottom, codeSize);
  int32 trapdoor_bytes_p = roundTo(trapdoors->trapdoor_bytes(), idealized_page_size);
  codeSize -= trapdoor_bytes_p;
  bottom    = (int32*)((char*)bottom + trapdoor_bytes_p);
}


static void idOverflowError(int32 delta) {
  Unused(delta);
  // fix this - maybe eliminate nmethod IDs altogether?
  fatal("zone: nmethod ID table overflowed");
}

void zone::allocate_idManager(fint maxNMs) {
  idManager = new IDManager(maxNMs, idOverflowError, ZoneIDStart);
}


void zone::setup_LRU() {
  LRUflag = idManager->data;
  LRUtable = (LRUcount*)LRUflag;
}

void zone::allocate_useCount(fint maxNMs) {
  int useCountSize= sizeof(LRUcount) * maxNMs;
  useCount= (int32*)OS::allocate_idealized_page_aligned(useCountSize, "use counts", UseCountStart);
}

void zone::clear() {
  table->clear();
  debugTable->clear();
  rememberLink.init();
  replCandidates.init();
  zombies.init();
  iZone->clear();
  dZone->clear();
  sZone->clear();
  stubs->clear();
  flatProfiler->clear(instsStart(), instsStart() + instsSize());
  LRUhand = 0;
  LRUtime = 0;
  idManager->init();
  needsICompaction = needsDCompaction = needsSCompaction = _needsSweep = false;
  compactDuration = 1; minFreeFrac = 0.05;
  zoneTimer.timeRestart();
}

int32 zone::nextNMethodID() { return idManager->peekID(); }

nmethod* zone::alloc(int32 iLen, int32 sLen, int32 lLen,
                     int32 dLen, char*& insts, nmethodScopes*& scopes,
                     addrDesc*& locs, nmln*& deps) {
  CSect cs(profilerSemaphore);          // for profiler
  // must get method ID here! (because reclaim might change firstFree)
  // (compiler may have used peekID to get ID of new nmethod for LRU stuff)
  int32 myID = idManager->newID();
  if (needsSweep()) doSweep();
  assert(iLen % oopSize == 0 && sLen % oopSize == 0 &&
         lLen % oopSize == 0 && dLen % oopSize == 0,
         "must be multiple of oopSize");
  int32 iSize = sizeof(class nmethod) + iLen + lLen;
  int32 dSize = dLen;
  int32 sSize = sLen;

  nmethod* n;
  int32* s;
  int32* d;
  bool flushedZombies = false;
  bool chainedFrames = false;

  while (1) {
    // try to allocate the three parts
    n = (nmethod*)iZone->allocate(iSize);
    if (sSize) {
      s = (int32*)sZone->allocate(sSize);
    } else {
      s = (int32*)n;
    }
    if (dSize) {
      d = (int32*)dZone->allocate(dSize);
    } else {
      d = (int32*)s;
    }

    if (n && s && d) break;     // everything is ok
    
    // at least one allocation failed: undo them all and flush some stuff
    { const char* msg = n ? " sec reclaim " : " reclaiming ";
      ShowVMActivityInMonitor ss(msg);
      EventMarker em(msg);

      if (n == 0)          needsICompaction = iZone->extFrag() > MaxExtFrag;
      if (dSize && d == 0) needsDCompaction = dZone->extFrag() > MaxExtFrag;
      if (sSize && s == 0) needsSCompaction = sZone->extFrag() > MaxExtFrag;
      
      if (PrintCodeReclamation && n) {
        lprintf("*flushing methods because secondary zone %s%s is full\n",
               needsDCompaction ? "D" : "", needsSCompaction ? "S" : "");
      }
      
      if (n) iZone->deallocate(n, iSize);
      if (sSize && s) sZone->deallocate(s, sSize);
      if (dSize && d) dZone->deallocate(d, dSize);
      
      if (!chainedFrames) {
        chainFrames();
        chainedFrames = true;
      }
      if (!flushedZombies) {
        flushZombies();
        flushedZombies = true;
      }
      
      if (needsWork()) {
        // schedule a zone compaction (will occur at next interrupt check)
        currentProcess->setupPreemption();
      }

      int32 reclaimed = 0;
      int32 toReclaim = min(LRU_MAX_RECLAIMED, iZone->usedBytes() / 4);
      for (fint i = 0; reclaimed < toReclaim && i < 20; i++) {
        reclaimed += flushNextMethod(toReclaim);
      }
      if (PrintCodeReclamation) {
        lprintf("*reclaimed %ld bytes in iZone\n", long(reclaimed));
      }      
      if (reclaimed < toReclaim) {
        // allocation failed
        if (chainedFrames) unchainFrames();
        idManager->freeID(myID);
        return 0;
      }
    }
  }

  if (chainedFrames) unchainFrames();    

  n->id = myID;
  LRUtable[myID].set(0);
  useCount[myID] = 0;
  insts = (char*)(n + 1);
  locs  = (addrDesc*)((char*)insts + iLen);
  deps = (nmln*)d;
  scopes = (nmethodScopes*)s;
  if (VerifyZoneOften) {
    iZone->verify(); dZone->verify(); sZone->verify();
  }
  return n;
}

nmethod* zone::lookup(MethodLookupKey &k, bool needDebug) {
  return ( needDebug || currentProcess->isSingleStepping()
           ? debugTable
           : table
         ) -> lookup(k); }

int32 zone::used() {
  return iZone->usedBytes() + dZone->usedBytes() + sZone->usedBytes();
}

void zone::flush() {
  BlockProfilerTicks bpt(exclude_nmethod_flush);
  CSect cs(profilerSemaphore);          // for profiler
  timer tmr;
  ShowVMActivityInMonitor ss(" flushing ");
  EventMarker em("flushing method cache");
  if (PrintCodeReclamation) {
    lprintf("*flushing method cache...");
    tmr.start();
  }
  
  nonCombiningMode();
  chainFrames();
  stubs->flush();     // flush PICs first!  (otherwise: lots of stub shrinking)
  // To flush the nmethods, first mark them as zombies so they all end up
  // on the zombies list; then flush them.  This is more efficient than
  // flushing them directly: with heap block combination active, it is 
  // expensive to find the next nmethod after flushing the current one.
  // (This way, they're all on a nmln list.)
  FOR_ALL_NMETHODS(p) { p->makeZombie(); }
  flushZombies();

  unchainFrames();
  LRUhand = 0;
  
  if (PrintCodeReclamation) {
    lprintf("done: %ld ms.\n", long(tmr.time()));
  }
  if (VerifyZoneOften) {
    iZone->verify(); dZone->verify(); sZone->verify();
  }

  // A MachineCache::flush_instruction_cache_for_debugging() isn't necessary because the flush is done
  // when writing the cache, i.e. when a new nmethod is created.
}

int32 zone::findReplCandidates(int32 needed) {
  // find replacement candidates; stop if > needed bytes found or if
  // there seem to be no more candidates
  assert(frame_chain_nesting > 0, "frames must be chained");
  int32 reclaimed = 0, iter = 0;
  while (iter++ < LRU_RETIREMENT_AGE && reclaimed < needed) {   
    int32 vis, recl;
    int32 limit = numberOfNMethods();           // because usedIDs may change
    int32 newTime = sweeper(limit, needed, &vis, &recl);
    reclaimed += recl;
    if (recl < needed && newTime > LRUtime + 1) {
      // next sweep wouldn't reclaim anything
      assert(vis == limit, "should have visited them all");
      LRUtime = newTime - 1;
      if (PrintLRUSweep) lprintf("\n*forced new LRU time: %ld", (void*)long(LRUtime));
    }
  }
  return reclaimed;
}

// flush next replacement candidate; return # bytes freed
int32 zone::flushNextMethod(int32 needed) {
  assert(frame_chain_nesting > 0, "frames must be chained");
  int32 freed = 0;
  while (freed < needed) {
    if (replCandidates.isEmpty()) {
      findReplCandidates(max(2*needed, LRU_MAX_RECLAIMED));
      if (replCandidates.isEmpty()) {
        // there's nothing to flush
        return freed;
      }
    }
    nmethod* p = NMETHOD_FROM(zoneLink, replCandidates.prev);
    if (p->isUsed()) {
      // has been used recently or is on stack - don't reclaim
      LRUtable[p->id].set(0);                   // on stack - mark used
      p->zoneLink.remove();
    } else {
      freed += iZone->sizeOfBlock(p);
      p->flush();
    }
  }
  return freed;
}

void moveInsts(char* from, char* to, int32 size) {
  Unused(size);
  nmethod* n = (nmethod*) from;
  nmethod* nTo = (nmethod*)to;
  
  n->moveTo(nTo, (char*)n->locsEnd() - (char*)n);
  if (Memory->code->LRUhand == n) Memory->code->LRUhand = nTo;
}

static void moveDeps(char* from, char* to, int32 size) {
  fint *backptr= *(fint**) from;
  if (Memory->code->iZone->contains(backptr)) {
    nmethod* n= (nmethod*)backptr;
    n->moveDeps((nmln*)(to + oopSize), to - from);
  } else {
    slotsMapDeps* m= (slotsMapDeps*)backptr;
    m->moveDeps((nmln*)(to + oopSize), to - from);
  }
  // copy *after* relocating since the two nmln arrays could overlap
  copy_words((int32*)from, (int32*)to, size / sizeof(int32));
}

static void moveScopes(char* from, char* to, int32 size) {
  nmethodScopes* scopes = (nmethodScopes*) from;
  scopes->my_nmethod()->moveScopes((nmethodScopes*)to);
  copy_words_up((int32*)from, (int32*)to, size / sizeof(int32));
}

void zone::flushZombies() {
  chainFrames();
  nmln nonFlushable;
  while (zombies.notEmpty()) {
    nmethod* nm = NMETHOD_FROM(zoneLink, zombies.next);
    assert(nmethod::isNMethod(nm), "invalid nmethod");
    assert(nm->isZombie(), "not a zombie");
    if (nm->frame_chain != NoFrameChain) {
      // temporarily remove non-flushable nmethods from zombie chain
      nmln* l = &nm->zoneLink;          // cfront bogosity
      l->rebind(&nonFlushable);
    } else {
      nm->flush();
    }
  }
  // move nonflushables back to zombie list
  zombies = nonFlushable;
  zombies.relocate();

  unchainFrames();
}

void zone::markAllUnused() {
  // mark all nmethods as unused (used for thesis measurements)
  chainFrames();
  FOR_ALL_NMETHODS(p) {
    p->oldCount = useCount[p->id];
    LRUtable[p->id].unused = true;
    LRUtable[p->id].lastUsed = LRUtime;
  } 
  unchainFrames();
}

void zone::flushUnused() {
  // flush all nmethods marked as unused
  // NB: access methods are always unused since they don't do the LRU thing
  chainFrames();
  FOR_ALL_NMETHODS(p) {
    // use makeZombie() for efficiency, not flush()
    // (see comment in zone::flush())
    if (!p->isUsed()) p->makeZombie();
  }
  flushZombies();
  MachineCache::flush_instruction_cache_for_debugging();
  unchainFrames();
}

void zone::adjustPolicy() {
  // This routine does the policy decisions about flushing, using feedback
  // from previous flushes.  If the heap is too full, then we'll soon have
  // to compact again, leading to frequent pauses and hight overhead.  On
  // the other hand, if we flush too many nmethods before compacting, we'll
  // have high compilation overhead to recreate the flushed code.

  if (IntervalTimer::dont_use_any_timer) return;          // for reproducible results & debugging
  float timeSinceLast = zoneTimer.millisecs();
  float overhead = compactDuration / timeSinceLast;
  if (overhead > COMPACT_OVERHEAD) {
    minFreeFrac = min(float(minFreeFrac * 1.5), float(minFreeFrac + 0.05));
    if (PrintCodeReclamation) {
      lprintf("(compact overhead %3.1f%%: increasing minFreeFrac to %3.1f%%) ",
             overhead *100, minFreeFrac * 100);
    }
  } else if (overhead < COMPACT_OVERHEAD / 2) {
    minFreeFrac = max(float(minFreeFrac / 1.5), float(minFreeFrac - 0.05));
    if (PrintCodeReclamation) {
      lprintf("(compact overhead %3.1f%%: decreasing minFreeFrac to %3.1f%%) ",
             overhead *100, minFreeFrac * 100);
    }
  }
  int32 minFree = int32(iZone->capacity() * minFreeFrac);
  while (1) {
    int32 toFlush = minFree - (iZone->capacity() - iZone->usedBytes());
    if (toFlush <= 0) break;
    flushNextMethod(LRU_MAX_RECLAIMED);
  }
}


void zone::doSweep() { sweeper(LRU_MAX_VISITED, LRU_MAX_RECLAIMED); }

void zone::doWork() {
  if (needsSweep()) doSweep();
  if (needsCompaction()) compact();
}

void zone::compact(bool forced) {
  BlockProfilerTicks bpt(exclude_nmethod_compact);
  if (VMProfileCompaction) OS::profile(true);
  CSect cs(profilerSemaphore);          // for profiler
  timer tmr;
  ShowVMActivityInMonitor ss(" compacting ");
  EventMarker em("compacting zone");
  if (PrintCodeReclamation) {
    lprintf("*compacting nmethod cache...");
    tmr.start();
  }
  
  chainFrames();
  flushZombies();
  char* firstFree = 0;
  if (!forced) adjustPolicy();
  zoneTimer.timeRestart();
  if (needsICompaction) {
    if (PrintCodeReclamation) lprintf("I");
    firstFree = iZone->compact(moveInsts);
    MachineCache::flush_instruction_cache_for_debugging();
    flatProfiler->clear(firstFree, instsStart() + instsSize());
  }
  if (needsDCompaction) {
    if (PrintCodeReclamation) lprintf("D");
    dZone->compact(moveDeps);
  }
  if (needsSCompaction) {
    if (PrintCodeReclamation) lprintf("S");
    sZone->compact(moveScopes);
  }
  unchainFrames();
  MachineCache::flush_instruction_cache_for_debugging();
  
  if (PrintCodeReclamation) {
    lprintf(" done: %ld bytes free in iZone, %ld ms.\n",
           long(iZone->capacity() - iZone->usedBytes()), long(tmr.time()));
  }
  if (VerifyZoneOften) {
    iZone->verify(); dZone->verify(); sZone->verify();
  }
  needsICompaction = needsDCompaction = needsSCompaction = false;
  compactDuration = zoneTimer.millisecs();
  if (VMProfileCompaction) OS::profile(VMProfiling);
}

void zone::doChainFrames()   { processes->chainFrames(); }
void zone::doUnchainFrames() { processes->unchainFrames(); }

void zone::free_nmethod(nmethod* nm) {
  assert(nm->zoneLink.isEmpty(), "non-empty zone link");
  if (VerifyZoneOften) {
    iZone->verify(); dZone->verify(); sZone->verify();
  }
  if (LRUhand == nm) LRUhand = next_nm(nm);
  int32 iSize = sizeof(class nmethod) + nm->instsLen() + nm->locsLen();
  used_per_compiler[nm->flags.compiler] -= iSize;
  int32 dSize = nm->depsLen + sizeof(nmethod*);
  int32 sSize = nm->scopes->size();
  idManager->freeID(nm->id);
  int32* s = (int32*)nm->scopes;
  int32* d = (int32*)nm->deps()   - 1;  // -1 for backpointer
  if (dZone->contains(d)) {
    sZone->deallocate(s, sSize);
    dZone->deallocate(d, dSize);
  } else {
    // deps allocated in sZone
    sZone->deallocate(s, sSize + dSize);
  }
  iZone->deallocate(nm, iSize);
  if (VerifyZoneOften) {
    iZone->verify(); dZone->verify(); sZone->verify();
  }
}

void zone::addToCodeTable(nmethod* nm, MethodLookupKey *k) {
  (nm->isDebug() ? debugTable : table)->add(nm, k);
}

void zone::flush_inline_cache() {
  timer tmr;   
  ShowVMActivityInMonitor ss(" ic flush ");
  EventMarker em("flushing inline caches");
  
  if (PrintInlineCacheInvalidation) {
    lprintf("*flushing inline caches...");
    tmr.start();
  }
  
  stubs->flush();     // flush PICs first!  (otherwise: lots of stub shrinking)
  FOR_ALL_NMETHODS(p) { p->remove_me_from_inline_cache(); }
  MachineCache::flush_instruction_cache_for_debugging();
  
  if (PrintInlineCacheInvalidation) {
    lprintf("done: %ld ms.\n", long(tmr.time()));
  }
}

inline int32 retirementAge(nmethod* n) {
  fint delta = LRU_RETIREMENT_AGE;
  if (n->instsLen() <= LRU_CUTOFF)
    delta = max(delta, LRU_RETIREMENT_AGE * LRU_SMALL_BOOST);
  if (n->compiler() != NIC) 
    delta = max(delta, LRU_RETIREMENT_AGE * LRU_OPTIMIZED_BOOST);
  return n->lastUsed() + delta;
}

bool zone::verify() {
  bool r = true;
  r &= table->verify();
  r &= debugTable->verify();
  {
    fint n = 0;
    EventMarker("zone::verify %d nms", (void*)numberOfNMethods());
    FOR_ALL_NMETHODS(p) {
      n++;
      eventLog->log("verifying nm %d: 0x%x", (void*)n, p);
      r &= p->verify();
    }
    if (n != numberOfNMethods()) {
      error2("zone: inconsistent usedIDs value - should be %ld, is %ld",
             n, numberOfNMethods());
      r = false;
    }
  }
  r &= iZone->verify();
  r &= dZone->verify();
  r &= sZone->verify();  
  r &= stubs->verify();
  nmln *l;
  for (l = replCandidates.next; l->next != &replCandidates; l = l->next) {
    nmethod* n1 = NMETHOD_FROM(zoneLink, l);
    nmethod* n2 = NMETHOD_FROM(zoneLink, l->next);
    if (retirementAge(n1) < retirementAge(n2) &&
        n1->lastUsed() != 0) {
      warning4("wrong order in replCandidates: %#lx (%ld) and %#lx (%ld)",
               n1, n1->lastUsed(), n2, n2->lastUsed());
    }
  }
  for (l = zombies.next; l->next != &zombies; l = l->next) {
    nmethod* nn = NMETHOD_FROM(zoneLink, l);
    if (!nn->isZombie()) {
      error1("non-zombie method in zombies list: %#lx", nn);
      r = false;
    }
  }
  r &= idManager->verify();
  return r;
}

void zone::scavenge_contents() {
  nmln *p = rememberLink.next;
  rememberLink.init(); // cause OopNCode::scavenge_contents will remember methods
  bool needToInvalICache = false;
  for (nmln *q = p->next; p != &rememberLink; p = q, q = q->next) {
    OopNCode* m = OOPNCODE_FROM(rememberLink, p);
    needToInvalICache |= m->scavenge_contents();
  }
  if (needToInvalICache) MachineCache::flush_instruction_cache_for_debugging();
}

void zone::switch_pointers(oop from, oop to) {
  bool needToInvalICache = false;
  // this code used to invalidate as it went, but since invalidation
  // may free PICS and snap both rememberLinks and next pointers,
  // you cannot traverse and invalidate at the same time.
  // (Why invalidate? see nmethodScopes::switch_pointers())
  // So, make a list and invalidate later.
  // But, resource marks further down could cause part of list
  //  to be allocated and freed before using list was used.
  // So, make list big enough from the start.
  // dmu 7/94 (w/ help from Urs)
  
  ResourceMark rm;
  nmethodBList* nmethods_to_invalidate = new nmethodBList(numberOfNMethods());

  if (from->is_new()) {
    nmln *p = rememberLink.next;
    for (nmln *q = p->next; p != &rememberLink; p = q, q = q->next) {
      nmethod* m = NMETHOD_FROM(rememberLink, p);
      needToInvalICache |= m->switch_pointers(from, to,
                                              nmethods_to_invalidate);
    }
  } else {
    FOR_ALL_NMETHODS(r)
      needToInvalICache |= r->switch_pointers(from, to,
                                              nmethods_to_invalidate);
    needToInvalICache |= stubs->switch_pointers(from, to,
                                                nmethods_to_invalidate);
  }
  for (fint i = 0;  i < nmethods_to_invalidate->length();  i++)
    nmethods_to_invalidate->nth(i)->invalidate();

  if (needToInvalICache) MachineCache::flush_instruction_cache_for_debugging();
}

void zone::gc_mark_contents() {
  FOR_ALL_NMETHODS(p) p->gc_mark_contents();
  stubs->gc_mark_contents(); 
}

void zone::gc_unmark_contents() {
  bool needToInvalICache = false;
  FOR_ALL_NMETHODS(p) needToInvalICache |= p->gc_unmark_contents();
  needToInvalICache |= stubs->gc_unmark_contents(); 
  if (needToInvalICache) MachineCache::flush_instruction_cache_for_debugging();
}

void zone::oops_do(oopsDoFn f) {
  bool needToInvalICache = false;
  FOR_ALL_NMETHODS(p) needToInvalICache |= p->code_oops_do(f);
  needToInvalICache |= stubs->code_oops_do(f);
  if (needToInvalICache) MachineCache::flush_instruction_cache_for_debugging();
}

void zone::nmethods_do(nmethodDoFn f) { FOR_ALL_NMETHODS(p) f(p); }

char* zone::allocateDeps(fint nbytes) {
  char *d= (char*) dZone->allocate(nbytes);

  if (d == 0) {
    // allocation failed -- need to do some deallocation
    // this code is depressingly similar to the code in zone::alloc.
    // It would be nice if it could be factored...
    
    // must get method ID here! (because reclaim might change firstFree)
    // (compiler may have used peekID to get ID of new nmethod for LRU stuff)
    int32 myID = idManager->newID();
    if (needsSweep()) doSweep();
 
    bool flushedZombies = false;
    bool chainedFrames = false;

    do {
      ShowVMActivityInMonitor ss(" reclaiming ");
      EventMarker em(" reclaiming ");
      
      needsDCompaction = dZone->extFrag() > MaxExtFrag;
      
      if (!chainedFrames) {
        chainFrames();
        chainedFrames = true;
      }
      if (!flushedZombies) {
        flushZombies();
        flushedZombies = true;
      }
      
      if (needsWork()) {
        // schedule a zone compaction (will occur at next interrupt check)
        currentProcess->setupPreemption();
      }
      
      int32 reclaimed = 0;
      int32 toReclaim = min(LRU_MAX_RECLAIMED, iZone->usedBytes() / 4);
      for (fint i = 0; reclaimed < toReclaim && i < 20; i++) {
        reclaimed += flushNextMethod(toReclaim);
      }
      if (PrintCodeReclamation) {
        lprintf("*reclaimed %ld bytes in iZone\n", long(reclaimed));
      }      
      if (reclaimed < toReclaim) {
        // allocation failed
        if (chainedFrames) unchainFrames();
        idManager->freeID(myID);
        return 0;
      }
      d= (char*) dZone->allocate(nbytes);
    } while (d == 0);

    if (chainedFrames) unchainFrames();    

    LRUtable[myID].set(0);
    useCount[myID] = 0;
    if (VerifyZoneOften) {
      iZone->verify(); dZone->verify(); sZone->verify();
    }
  }

  return d;
}

void zone::setDepsMap(nmln *deps, slotsMapDeps *m) {
  *(((slotsMapDeps**)deps)-1)= m; }


# define NMLINE(format, n, ntot, ntot2)                                       \
  lprintf(format, (n), 100.0 * (n) / (ntot), 100.0 * (n) / (ntot2))

class nmsizes {
 public:
  int32 n, insts, locs, deps, scopes;
  void  clear()   { n = insts = locs = deps = scopes = 0; }
  int32 total()   {
    return n * sizeof(nmethod)+ insts + locs + deps + scopes; }
  void add(nmsizes& other) {
    n += other.n; insts += other.insts; locs += other.locs;
    deps += other.deps; scopes += other.scopes;
  }
  bool isEmpty() { return n == 0; }
  void print(const char* name, nmsizes& tot) {
    int32 bigTotal = tot.total();
    int32 myTotal = total();
    if (! isEmpty()) {
      lprintf("%-13s (%ld methods): ", name, n);
      NMLINE("headers = %ld (%2.0f%%/%2.0f%%); ", n*sizeof(nmethod),
             myTotal, bigTotal);
      NMLINE("insts = %ld (%2.0f%%/%2.0f%%);\n", insts,
             myTotal, bigTotal);
      NMLINE("\tlocs = %ld (%2.0f%%/%2.0f%%); ",
             locs, myTotal, bigTotal);
      NMLINE("deps = %ld (%2.0f%%/%2.0f%%); ", deps, myTotal, bigTotal);
      NMLINE("scopes = %ld (%2.0f%%/%2.0f%%);\n",
             scopes, myTotal, bigTotal);
      NMLINE("\ttotal = %ld (%2.0f%%/%2.0f%%)\n",
             myTotal, myTotal, bigTotal);
    }
  }
  void print_stats(const char* name) {
    if (! isEmpty()) {
      lprintf("%-13s: %7ld %7ld %7ld %7ld %7ld %7ld\n",
             name, long(n), long(n*sizeof(nmethod)), long(insts), long(locs),
             long(deps), long(scopes));
    }
  }
};

void zone::print() { print_helper(false); }
void zone::print_stats() { print_helper(true); }

void zone::print_helper(bool stats) {
  nmsizes nms[nm_last];
  int32 i;
  for (i = 0; i < nm_last; i++) nms[i].clear();
  int32 n = 0, ignored = 0;
  FOR_ALL_NMETHODS(p) {
    if (stats && (p->isZombie() || p->isInvalid())) {
      ignored++;
      continue;                 // don't count obsolete nmethods
    }
    n++;
    fint comp = p->flags.compiler;
    assert(comp >= 0 && comp < nm_last, "invalid compiler");
    nms[comp].n++;
    nms[comp].insts  += p->instsLen();
    nms[comp].locs   += p->locsLen();
    nms[comp].deps   += p->depsLen;
    nms[comp].scopes += p->scopes->length();
  }
  if (n + ignored != numberOfNMethods()) warning("inconsistent usedIDs value");
  nmsizes total;
  total.clear();
  for (i = 0; i < nm_last; i++) total.add(nms[i]);

  if (stats) {
    int32 nstubs = 0, npics = 0, stubs_l = 0, pics = 0,
      stubsTotal = 0, picsTotal = 0;
    FOR_ALL_STUBS(st) {
      if (st->isCacheStub()) {
        npics++;  pics += st->instsLen();  picsTotal += st->size();
      } else {
        nstubs++; stubs_l += st->instsLen(); stubsTotal += st->size();
      }
    }
    nms[nm_nic].print_stats("NIC compiler");
    nms[nm_sic].print_stats("SIC compiler");
    lprintf("PICs:  %7ld %7ld %7ld\n", long(npics), long(pics),
           long(picsTotal));
    lprintf("stubs: %7ld %7ld %7ld\n", long(nstubs), long(stubs_l),
           long(stubsTotal));
  } else {
    printIndent();
    lprintf("zone: starts at %#-6lx; LRU time %ld; minFree %3.1f%%; %ld nmethods (%1.0f%%)\n",
           (long unsigned)bottom, long(LRUtime),
           minFreeFrac * 100, long(n), n * 100.0 / idManager->n);
    printIndent(); lprintf("iZone: "); iZone->print();
    printIndent(); lprintf("dZone: "); dZone->print();
    printIndent(); lprintf("sZone: "); sZone->print();
    printIndent(); lprintf("stubs: "); stubs->print();

    printIndent(); nms[nm_nic].print("NIC compiler", total);
    printIndent(); nms[nm_sic].print("SIC compiler", total);
    printIndent(); total.print("total", total);
  }
}

class nm_hist_elem{
 public:
  nmethod* nm;
  fint     count;
  fint     size;
  fint     sic_count;
  fint     sic_size;
};

static int compareOop(const void *m1, const void *m2) {
  ResourceMark rm;
  class nm_hist_elem *nmethod1 = (class nm_hist_elem *) m1;
  class nm_hist_elem *nmethod2 = (class nm_hist_elem *) m2;
  return nmethod2->nm->method() - nmethod1->nm->method();
}

static int compareCount(const void *m1, const void *m2) {
  class nm_hist_elem *nmethod1 = (class nm_hist_elem *) m1;
  class nm_hist_elem *nmethod2 = (class nm_hist_elem *) m2;
  return nmethod2->count - nmethod1->count;
}

void zone::print_nmethod_histogram(fint size) {
  ResourceMark rm;
  nm_hist_elem* hist_array = NEW_RESOURCE_ARRAY(nm_hist_elem, numberOfNMethods());

  fint*  compiled_nmethods = NEW_RESOURCE_ARRAY(fint, numberOfNMethods());

  int32 n = 0;
  FOR_ALL_NMETHODS(p) {
    if (!p->isAccess() && !p->isZombie()) {
      hist_array[n].nm     = p;
      hist_array[n].size   = p->instsLen() +
                             p->locsLen() +
                             p->depsLen +
                             p->scopes->length();
      n++;
    }
  }

  qsort(hist_array, n, sizeof(nm_hist_elem), compareOop);
  
  int32 i = 0;
  for (i = 0; i < n; i++) compiled_nmethods[i] = 0;

  i = 0;
  fint out = 0;
  while (i < n) {
    int counter     = 1;
    int all_size    = 0;
    int sic_counter = 0;
    int sic_size    = 0;

    oop method = hist_array[i].nm->method();
    all_size = hist_array[i].size;

    i++;

    while (i < n && method == hist_array[i].nm->method()) {
      if (hist_array[i].nm->flags.compiler == nm_sic) {
        sic_counter++;
        sic_size += hist_array[i].size;
      }
      all_size += hist_array[i].size;
      counter++; i++;
    }
    compiled_nmethods[counter]++;
    if (counter > size) {
      hist_array[out]           = hist_array[i-1];
      hist_array[out].count     = counter;
      hist_array[out].size      = all_size;
      hist_array[out].sic_count = sic_counter;
      hist_array[out].sic_size  = sic_size;
      out++;
    }
  }

  qsort(hist_array, out, sizeof(nm_hist_elem), compareCount);

  lprintf("\n# nm \t # methods \t%% acc.\n");
  int nm_count = 0;
  for (i = 0; i < n; i++) {
    if (compiled_nmethods[i] > 0) {
      nm_count += i * compiled_nmethods[i];
      lprintf("%5ld \t%5ld \t\t%3ld %%\n", long(i), long(compiled_nmethods[i]), 
             long((nm_count*100)/n));

    }
  }

  lprintf( "\nList of methods with more than %d nmethods compiled.\n", size);
  lprintf( " ALL(#,Kb)  SIC(#,Kb) Method:\n");
  for (i = 0; i < out; i++) {
    lprintf("%4d,%-4d   %4d,%-4d ",
           hist_array[i].count,     hist_array[i].size / 1024,
           hist_array[i].sic_count, hist_array[i].sic_size / 1024);
    printName((methodMap*) hist_array[i].nm->method()->map(),
               hist_array[i].nm->key.selector);
    lprintf("\n");
  }
}


nmethod* zone::findNMethod(void* start) {
  nmethod* n;
  if (iZone->contains(start)) {
    n = (nmethod*)iZone->findStartOfBlock(start);
    assert(nmethod::isNMethod(n), "not an nmethod");
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      if ((char*)start >= (char*)n->locsEnd()) {
        warning2("found wrong nmethod, start = 0x%x, n->locsEnd = 0x%x\n",
                 start, n->locsEnd());
        verify();
        fatal("found wrong nmethod");
      }
    }
#   endif
  } else if (dZone->contains(start)) {
    n = *(nmethod**)dZone->findStartOfBlock(start);
  } else {
    assert(sZone->contains(start), "not in any zone");
    nmethodScopes* scopes = (nmethodScopes*)sZone->findStartOfBlock(start);
    n = scopes->my_nmethod();
  }
  assert(iZone->contains(n), "not in zone");
  assert(n->isNMethod(), "findNMethod didn't find nmethod");
  assert(n->encompasses(start), "doesn't encompass start");
  return n;
}


void zone::findNMethodOrMap(nmln* n, nmethod* &nm, slotsMapDeps* &s) {
  nm= 0;  s= 0;
  if (iZone->contains(n)) {
    nm= (nmethod*)iZone->findStartOfBlock(n);
    assert(nmethod::isNMethod(nm), "not an nmethod");
    assert((char*)n < (char*)nm->locsEnd(), "found wrong nmethod");
  } else if (dZone->contains(n)) {
    void *p= *(void**)dZone->findStartOfBlock(n);
    if (iZone->contains(p))
      nm= (nmethod*)p;
    else
      s= (slotsMapDeps*)p;
  } else if (sZone->contains(n)) {
    nmethodScopes* scopes= (nmethodScopes*)sZone->findStartOfBlock(n);
    nm= scopes->my_nmethod();
  } else {
    assert(Memory->is_obj_heap((oop*)n), "not a map");
  }
  assert(nm == 0 || iZone->contains(nm), "not in zone");
  assert(nm == 0 || nm->isNMethod(), "findNMethod didn't find nmethod");
  assert(nm == 0 || nm->encompasses(n), "doesn't encompass start");
}


nmethod* zone::findNMethod_maybe(void* start) {
  // start *may* point into the instructions part of a nmethod; find it
  if (!iZone->contains(start)) return 0;
  // relies on FOR_ALL_NMETHODS to enumerate in ascending order
  FOR_ALL_NMETHODS(p) {
    if (p->insts() > (char*)start) return 0;
    if (p->instsEnd() > (char*)start) return p;
  }
  return 0;
}

char* zone::instsStart() { return iZone->startAddr(); };
int32 zone::instsSize()  { return iZone->capacity(); }

inline nmethod* zone::next_circular_nm(nmethod* nm) {
  nm = next_nm(nm);
  if (nm == 0) nm = first_nm();
  assert(nm == 0 || nmethod::isNMethod(nm), "not a valid nmethod");
  return nm;
}

// called every IntervalTimer::LRU_resolution seconds or by reclaimNMethods if needed
// returns time at which oldest non-reclaimed nmethod will be reclaimed
int32 zone::sweeper(int32 maxVisit, int32 maxReclaim,
                    int32* nvisited, int32* nbytesReclaimed) {
  ShowVMActivityInMonitor ss(" LRU sweep ");
  EventMarker em("LRU sweep");
  ResourceMark rm;

  timer tmr;   
  int32 visited = 0;
  int32 nused = 0;
  int32 nbytes = 0;
  int32 nextTime = LRUtime + LRU_RETIREMENT_AGE;
  nmethod* first = first_nm();
  if (! first) return -1;
  
  nmethod* p = LRUhand ? LRUhand : first;
  if (PrintLRUSweep || PrintLRUSweep2) {
    lprintf("*starting LRU sweep...");
    tmr.start();
  }
  
  chainFrames();
  
  do {
    if (PrintLRUSweep2) lprintf("\n*inspecting %#lx (id %ld): ",
                               (void*)(long unsigned)p, (void*)long(p->id));
    assert(nmethod::isNMethod(p), "invalid nmethod");
    
    if ((p->isZombie() ||
         p->isDebug()  ||
         (p->codeTableLink == 0 && !p->isUncommon() && !p->isDI())) &&
        p->frame_chain == NoFrameChain) {
      // can be flushed - nobody will ever use it again
      if (PrintLRUSweep2) lprintf(" %s; flushed",
                                 p->isZombie() ? "zombie" :
                                 (p->isDebug() ? "debug" : "unreachable"));
      nbytes += iZone->sizeOfBlock(p);
      p->flush();
    } else if (p->isUsed()) {
      // has been used
      nused++;
      if (PrintLRUSweep2) {
        lprintf("used");
        int32 diff = useCount[p->id] - p->oldCount;
        if (diff) lprintf(" %ld times", (void*)long(diff));
      }
      if (LRUDecayFactor > 1) {
        useCount[p->id] = int(useCount[p->id] / LRUDecayFactor);
      }
      p->oldCount = useCount[p->id];
      LRUtable[p->id].unused = true;
      LRUtable[p->id].lastUsed = LRUtime;
      if (p->zoneLink.notEmpty()) {
        if (PrintLRUSweep2) lprintf("; removed from replCandidates");
        p->zoneLink.remove();           // no longer a replacement candidate
        nbytes -= iZone->sizeOfBlock(p);
      }
    } else if (retirementAge(p) < LRUtime && p->zoneLink.isEmpty()) {
      if (PrintLRUSweep2) lprintf("added to replCandidates");
      replCandidates.add(&p->zoneLink);
      nbytes += iZone->sizeOfBlock(p);
    } else {
      int32 age = retirementAge(p);
      if (age < nextTime) {
        nextTime = age;
      }
      if (PrintLRUSweep2) {
        lprintf("unused (age %ld)", (void*)long(LRUtime - p->lastUsed()));
        if (p->zoneLink.notEmpty())
          lprintf(" already scheduled for replacement");
      }
    }
    
    nmethod* oldp = p;
    p = next_circular_nm(p);
    if (p < oldp) {                             // wrap around
      LRUtime++;
      // The LRU scheme will actually fail if LRUtime > 2^16, but that
      // won't happen very often (every 20*IntervalTimer::LRU_resolution CPU hours).
      if (PrintLRUSweep2) lprintf("\n*new LRU time: %ld", (void*)long(LRUtime));
    }
  } while (++visited < maxVisit && nbytes < maxReclaim && p);
  
  if (needsSweep() && LRUDecayFactor > 1) {
    // called from timer; decay count stubs
    stubs->decay(LRUDecayFactor);
  }

  unchainFrames();
  
  LRUhand = p;
  _needsSweep = false;
  if (PrintLRUSweep || PrintLRUSweep2) {
    lprintf(" done: %ld/%ld visits, %ld bytes, %ld ms.\n",
           (void*)long(nused), (void*)long(visited), (void*)long(nbytes), (void*)long(tmr.time()));
  }
  if (nvisited) *nvisited = visited;
  if (nbytesReclaimed) *nbytesReclaimed = nbytes;
  return nextTime;
}

int32 zone::LRU_time() { return LRUtime; }

void printAllNMethods() {
  for(nmethod* m = Memory->code->first_nm(); m != 0;
      m = Memory->code->next_nm(m)) {
    lprintf("nmethod %#lx, id %ld (", m, long(m->id));
    printName(0, m->key.selector);
    lprintf("), ");
    lprintf("map %#lx, size %ld, ", m->key.receiverMapOop(),
                                 (long unsigned)m->size() );
    if (m->isUsed()) {
      lprintf("used");
    } else {
      if (! LRUtable[m->id].unused ||
          LRUtable[m->id].lastUsed > Memory->code->LRU_time())
        warning("inconsistent LRU table entry! ");
      lprintf("last used at %ld", long(LRUtable[m->id].lastUsed));
    }
    lprintf("\n");
    
  }
  lprintf("\nreplacement candidates:\n");
  nmln* p;
  for ( p = Memory->code->replCandidates.next;
        p != &Memory->code->replCandidates; 
        p = p->next) {
    nmethod* n = NMETHOD_FROM(zoneLink, p);
    lprintf("nmethod %#lx, id %ld, lastUsed %ld\n", n,
           long(n->id), long(n->lastUsed()));
  }
  lprintf("\nzombies:\n");
  for (p = Memory->code->zombies.next;
       p != &Memory->code->zombies;
       p = p->next) {
    nmethod* n = NMETHOD_FROM(zoneLink, p);
    lprintf("nmethod %#lx, id %ld, lastUsed %ld\n", n,
           long(n->id), long(n->lastUsed()));
  }
}


// fix nmln after reading in code in case the zone object has moved

void zone::relocate_nmln(nmln* p) {
  if ((caddr_t)p->next >= NMethodStart) {
    p->next->prev = p;
    p->prev->next = p;
  } else
    p->init();
}


#ifdef UNUSED
void zone::relocate() {
  FOR_ALL_NMETHODS(p) {
    p->relocate();
  }
  stubs->relocate();
}
#endif

void zone::fixup() {
  table->clear();
  debugTable->clear();
  FOR_ALL_NMETHODS(p) {
    if (p->codeTableLink == 0) {
      // e.g. di methods; leave it empty
    } else {
      assert(! p->isZombie(), "codeTableLink not be empty");
      p->codeTableLink= 0;
      if (p->isDebug()) {
        debugTable->add(p);
      } else {
        table->add(p);
      }
    }
  }
}


// the following is a quick hack to estimate the debugging-related space
// cost outside the zone (selectors etc)
static int32 debugBytes;

static void oopDebugSize(oop* p1) {
  oop p = *p1;
  if (p->is_objectMarked()) return;
  p->markThisObject();
  debugBytes += p->debug_size();
}

static void oopResetMark(oop* p) { (*p)->unmarkThisObject(); }

// for debugging
static bool ignoreRcvr;
static oop findNM_map;
static oop findNM_sel;
static fint findNM_found;
static void findNM_helper(nmethod* nm) {
  if (nm->key.selector == findNM_sel &&
      (ignoreRcvr || nm->key.receiverMapOop() == findNM_map)) {
    lprintf("nmethod 16r%lx \'%s\'\n", nm,
           selector_string(nm->key.selector));
    findNM_found++;
  }
}

static void findNM_helper2(nmethod* nm) {
  bool first = true;
  FOR_EACH_SCOPE(nm->scopes, s) {
    if (first) {
      first = false;    // ignore top-level scope -- already printed
    } else if (s->key.selector == findNM_sel) {
      if (ignoreRcvr || (!s->isDeadBlockScope() && s->selfMapOop() == findNM_map)) {
        lprintf("nmethod 16r%lx \'%s\'\n", nm,
               selector_string(nm->key.selector));
        findNM_found++;
      }
    }
  }
}

oop PrintDebugSize_prim(oop rcvr) {
  Unused(rcvr);
  debugBytes = 0;
  Memory->code->oops_do(oopDebugSize);
  Memory->code->oops_do(oopResetMark);
  return as_smiOop(debugBytes);
}

oop findNMethods_prim(oop rcvr, oop map, oop sel) {
  // print nmethods with selector sel and given receiver map (if rcvr is
  // a mirror); ignore rcvr type if non-mirror
  ResourceMark rm;
  ignoreRcvr = !map->is_mirror();
  findNM_map = badOop;
  findNM_sel = sel;
  findNM_found = 0;
  if (!ignoreRcvr) findNM_map = mirrorOop(map)->reflectee()->map()->enclosing_mapOop();
  lprintf("nmethods implementing \'%s\'%s:\n", selector_string(findNM_sel),
         ignoreRcvr ? "" : " for this receiver type");
  Memory->code->nmethods_do(findNM_helper);
  if (findNM_found == 0) lprintf("--none.\n");
  findNM_found = 0;
  lprintf("nmethods containing inlined copies of \'%s\'%s:\n",
         selector_string(findNM_sel),
         ignoreRcvr ? "" : " for this receiver type");
  Memory->code->nmethods_do(findNM_helper2);
  if (findNM_found == 0) lprintf("--none.\n");
  return rcvr;
}

oop printNMethodCode_prim(oop rcvr) {
  // rcvr is address of a nmethod
  if (rcvr->is_smi()) {
    nmethod* nm = (nmethod*)smiOop(rcvr)->value();
    nm->printCode();
  } else {
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  }
  return rcvr;
}

# else  // defined(FAST_COMPILER) || defined(SIC_COMPILER)

oop PrintDebugSize_prim(oop rcvr) {
  Unused(rcvr);
  return as_smiOop(0);
}

oop findNMethods_prim(oop rcvr, oop map, oop sel) {
  Unused(map); Unused(sel); Unused(rcvr);
  return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
}

oop printNMethodCode_prim(oop rcvr) {
  Unused(rcvr);
  return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
}

void zone::findNMethodOrMap(nmln *n, nmethod* &nm, slotsMapDeps* &s) {
  Unused(n);
  nm = 0;
  s = 0;
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)


void zone::read_snapshot(FILE* f) {
  char* buf[sizeof(zone)];
  zone* theZone = (zone*)buf;

  if (SnapshotCode) { // must read or skip
#   if  defined(FAST_COMPILER) || defined(SIC_COMPILER)
      OS::FRead(buf, sizeof(zone), f);
      fint n= idManager->read_snapshot(f);

      if (okToUseCodeFromSnapshot        &&  theZone->bottom != bottom)
        noCodeWarning("because of a zone address mismatch");

      OS::read_or_seek(useCount, n * sizeof(int32  ), f);
      OS::read_or_seek(&LRUtime,     sizeof(LRUtime), f);

      iZone->read_snapshot(f);
      dZone->read_snapshot(f);
      sZone->read_snapshot(f);

      stubs->zone()->read_snapshot(f);

          nmethod::set_vtbl_value();
        CacheStub::set_vtbl_value();
     CountingStub::set_vtbl_value();
    ComparingStub::set_vtbl_value();
        AgingStub::set_vtbl_value();

      if (!okToUseCodeFromSnapshot)
        clear();
      else {
        // copy across all the relevant fields
                  bottom= theZone->bottom;
                 LRUhand= theZone->LRUhand;
        needsICompaction= theZone->needsICompaction;
        needsSCompaction= theZone->needsSCompaction;
        needsDCompaction= theZone->needsDCompaction;
             _needsSweep= theZone->_needsSweep;
         compactDuration= theZone->compactDuration;
             minFreeFrac= theZone->minFreeFrac;
            rememberLink= theZone->rememberLink;
          replCandidates= theZone->replCandidates;
                 zombies= theZone->zombies;
       for (int i = 0; i < nm_last; ++i)
         used_per_compiler[i]= theZone->used_per_compiler[i];
          
        // in case the zone itself moved,
        // must relocate the ends of all nmlns -- dmu
        relocate_nmln(&rememberLink);
        relocate_nmln(&replCandidates);
        relocate_nmln(&zombies);
        
      }
      ((CountStub*)0)->read_snapshot(f);
      
      MachineCache::flush_instruction_cache_range(iZone->startAddr(), iZone->endAddr());
      MachineCache::flush_instruction_cache_for_debugging();
#   else // no compiler
      Unused(f);
      fatal("This version of Self has no compilers, and cannot read a snapshot with code.");
#   endif
  } else {
    clear();
  }
}


void zone::write_snapshot(FILE* f) {
  flushZombies();

  if (SnapshotCode) {
#   if  defined(FAST_COMPILER) || defined(SIC_COMPILER)
      OS::FWrite(this, sizeof(zone), f);
      // write all information that's not directly in the zone
      idManager->write_snapshot(f);
      OS::FWrite(useCount, idManager->n * sizeof(int32), f);
      OS::FWrite(&LRUtime, sizeof(LRUtime), f);
      iZone->write_snapshot(f);
      dZone->write_snapshot(f);
      sZone->write_snapshot(f);
      stubs->zone()->write_snapshot(f);
      ((CountStub*)0)->write_snapshot(f);
#   else // no compiler
      Unused(f);
      fatal("cannot snapshot code without compilers");
#   endif
  }
}

