/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "allocation.hh"
# include "label_inline.hh"
# include "nmethod.hh"
# include "os.hh"
# include "zoneHeap.hh"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)



enum chunkState {
  ZeroDistance = 0, MaxDistance = 128,
  unused = 128, unusedOvfl = 190,
  used = 192, usedOvfl = 254,
  invalid = 255};

# define MaxDistLog    7  /* log2(MaxDistance) */
# define maxOneByteLen (usedOvfl - used)

// format of chunks in free map: first & last byte hold chunk size
// unused..unusedOvfl-1:unused, length n+1
// used..usedOvfl-1     used, length n - used + 1
// unusedOvfl:          unused, encoded length in next (prev) 3 bytes
// usedOvfl:            used, encoded length in next (prev) 3 bytes

// The other bytes hold the distance to the chunk header (or an approximation
// thereof); headers are found by following the distance pointers downwards

const int32 minHeaderSize = 1;
const int32 maxHeaderSize = 4;

class ChunkMap;
inline ChunkMap* asChunkMap(u_char* c)  { return (ChunkMap*)c; }

class ChunkMap {
  u_char c(int32 which)                 { return ((u_char*)this)[which]; }
  u_char n(int32 which)                 { return c(which) - unused; }
 public:
  ChunkMap()                            { fatal("shouldn't create"); }
  u_char* asByte()                      { return (u_char*)this; }
  void markSize(int32 nChunks, chunkState s);
  void markUsed(int32 nChunks)          { markSize(nChunks, used); }
  void markUnused(int32 nChunks)        { markSize(nChunks, unused); }
  ChunkMap* findStart(ChunkMap* mapStart, ChunkMap* mapEnd);
  
  void read_snapshot(FILE* f);
  void write_snapshot(FILE* f);
  bool verify();
# if  GENERATE_DEBUGGING_AIDS
  void print();
#endif
  bool isValid();
  void invalidate()                     { asByte()[0] = invalid; }
  
  chunkState state()                    { return chunkState(c(0)); }
  bool isUsed()                         { return state() >= used; }
  bool isUnused()                       { return ! isUsed(); }
  int32 headerSize() {          // size of header in bytes
    int32 ovfl = isUsed() ? usedOvfl: unusedOvfl;
    return c(0) == ovfl ? maxHeaderSize : minHeaderSize;
  }
  int32 size() {                // size of this block
    int32 ovfl = isUsed() ? usedOvfl: unusedOvfl;
    int32 len;
    assert(c(0) != invalid && c(0) >= MaxDistance, "invalid chunk");
    if (c(0) != ovfl) {
      len = c(0) + 1 - (isUsed() ? used : unused);
    } else {
      len = (((n(1) << MaxDistLog) + n(2)) << MaxDistLog) + n(3);
    }
    assert(len > 0, "negative/zero chunk length");
    return len;
  }
  bool contains(u_char* p) { return asByte() <= p && p < asByte() + size(); }
  ChunkMap*  next() { return asChunkMap(asByte()+size()); }
  ChunkMap*  prev() {
    ChunkMap* p = asChunkMap(asByte() - 1);
    int32 ovfl = p->isUsed() ? usedOvfl: unusedOvfl;
    int32 len;
    if (c(-1) != ovfl) {
      len = p->size();
    } else {
      len = (((n(-4) << MaxDistLog) + n(-3)) << MaxDistLog) + n(-2);
    }
    assert(len > 0, "negative/zero chunk length");
    return asChunkMap(asByte() - len);
  }
};

void ChunkMap::markSize(int32 nChunks, chunkState s) {
  // write header
  u_char* p = asByte();
  u_char* e = p + nChunks - 1;
  if (nChunks < maxOneByteLen) {
    p[0] = e[0] = s + nChunks - 1;
  } else {
    assert(nChunks < (1<<(3*MaxDistLog)), "chunk too large");
    unsigned mask = nthMask(MaxDistLog);
    p[0] = e[0] = (s == used) ? usedOvfl : unusedOvfl;
    p[1] = e[-3] = unused +  (nChunks >> (2*MaxDistLog));
    p[2] = e[-2] = unused + ((nChunks >>    MaxDistLog) & mask);
    p[3] = e[-1] = unused + ( nChunks                   & mask);
  }
  assert(size() == nChunks, "incorrect size encoding");
  // mark distance for used blocks
  if (s == unused) {
    // don't mark unused blocks - not necessary, and would be a performance 
    // bug (start: *huge* free block, shrinks with every alloc -> quadratic)
    // however, the first distance byte must be correct (for findStart)
    if (nChunks > 2 * minHeaderSize) p[headerSize()] = headerSize();
  } else {
    if (nChunks < maxOneByteLen) {
      assert(maxOneByteLen <= MaxDistance, "oops!");
      for (int32 i = minHeaderSize; i < nChunks - minHeaderSize; i++) p[i] = i;
    } else {
      int32 max = min(nChunks - 4, MaxDistance);
      int32 i;
      for ( i = maxHeaderSize; i < max; i++) p[i] = i;
      // fill rest with large distance values (don't use MaxDistance - 1 because
      // the elems MaxDistance..MaxDistance+maxHeaderSize-1 would point *into*
      // the header)
      for ( ; i < nChunks - maxHeaderSize; i++)
        p[i] = MaxDistance - maxHeaderSize;
    }
  }
}

ChunkMap* ChunkMap::findStart(ChunkMap* mapStart, ChunkMap* mapEnd) {
  // this points into the middle of a chunk; return start of chunk
  u_char* p = asByte();
  u_char* start = mapStart->asByte();
  u_char* end   = mapEnd  ->asByte();
  ChunkMap* m;
  if (*p < MaxDistance) {
    // we're outside the header, so just walk down the trail
    # if  GENERATE_DEBUGGING_AIDS
      u_char *lastp = NULL, *lastlastp = NULL;
    # endif
    while (*p < MaxDistance) {
      assert(*p, "stuck in endless loop");
      # if  GENERATE_DEBUGGING_AIDS
        if (SpendTimeForDebugging) {
          lastlastp = lastp;
          lastp = p;
        }
      # endif
      p -= *p;
    }
    assert(p >= start, "not found");
    m = asChunkMap(p);
  } else {
    // pointing to a header, but we don't know whether long/short etc
    // first walk up to first non-header byte
    // (note that first distance byte of unused blocks is correct, but
    // the others aren't)
    while (*p >= MaxDistance && p < end) p++;
    if (p < end) {
      // find start of this block
      while (*p < MaxDistance) p -= *p;
      assert(p >= start, "not found");
    }
    m = asChunkMap(p);
    while (! m->contains(this->asByte())) m = m->prev();
  }
  assert(m->verify(), "invalid chunk map");
# if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions) {
    if (!m->contains(this->asByte())) {
      error4("ChunkMapFindStart found wrong chunk,\n"
             "\tthis = 0x%x, mapStart = 0x%x, mapEnd = 0x%x, found = 0x%x\n",
             this, mapStart, mapEnd, m);
      lprintf("this     is %s\n",           isValid() ? "valid" : "invalid");
      lprintf("mapStart is %s\n", mapStart->isValid() ? "valid" : "invalid");
      lprintf("mapEnd   is %s\n", mapEnd  ->isValid() ? "valid" : "invalid");
      lprintf("result   is %s\n", m       ->isValid() ? "valid" : "invalid");
      Memory->code->verify();
      fatal("wrong chunk");
    }
  }
# endif
  return m;
}

bool ChunkMap::isValid() {
  u_char* p = asByte();
  bool ok;
  if (p[0] == invalid || p[0] < MaxDistance) {
    ok = false;
  } else {
    u_char* e = next()->asByte() - 1;
    int32 ovfl = isUsed() ? usedOvfl: unusedOvfl;
    ok = p[0] == e[0] &&
        (p[0] != ovfl || (p[1] == e[-3] && p[2] == e[-2] && p[3] == e[-1]));
  }
  return ok;
}

# if  GENERATE_DEBUGGING_AIDS
void ChunkMap::print() {
  lprintf("chunk [%#lx..%#lx[\n", (long unsigned)this, (next()));
}
#endif

bool ChunkMap::verify() {
  if (! isValid()) {
    error1("inconsistent chunk map %#lx", this);
    return false;
  }
  return true;
}


void FreeList::append(HeapChunk* h) {
  h->link.init();
  link.add(&h->link);
}

void FreeList::remove(HeapChunk* h) {
  h->link.remove();
}
  
HeapChunk* FreeList::get() {
  if (link.isEmpty()) {
    return NULL;
  } else {
    HeapChunk* res = anchor()->next();
    remove(res);
    return res;
  } 
}

int32 FreeList::length() {
  int32 i = 0;
  HeapChunk* f = anchor();
  for (HeapChunk* p = f->next(); p != f; p = p->next()) i++;
  return i;
}


Heap::Heap(int32 s, int32 bs, int32 nf, char* baseAddr, bool och) {
  assert(nf > 0 && s > bs && bs >= 16, "invalid params");
  assert(s % bs == 0, "size not a multiple of blockSize");
  size = s;
  if (bs & (bs - 1)) fatal1("heap block size (%ld) isn't power of 2", bs);
  blockSize = bs;
  log2BS = 0;
  while (bs > 1) { bs >>= 1; log2BS++; }
  nfree = nf;
  if (baseAddr) {
    _base = baseAddr;
    on_c_heap= och;
  } else {
    _base = AllocateHeap(size + blockSize, "zone");
    on_c_heap = true;
  }
  base = (char*) ( ((int32)_base + blockSize - 1) & ~(blockSize - 1) );
  assert(int32(base) % blockSize == 0, "base not aligned to blockSize");
  heapMap = (ChunkMap*)(AllocateHeap(mapSize() + 2, "zone free map") + 1);
  // + 2 for sentinels
  freeList = NEW_C_HEAP_ARRAY( FreeList, nfree);
  newHeap = NULL;
  clear();
}

void Heap::clear() {
  bytesUsed = total = ifrag = 0;
  for(int32 i = 0; i < nfree; i++) freeList[i].clear();
  bigList.clear();
  heapMap->markUnused(mapSize());
  heapEnd()->markUsed(1);               // sentinels
  asChunkMap(heapMap->asByte() - 1)->markUsed(1);
  combineMode = false;
  lastCombine = heapMap;
  addToFreeList(heapMap);
}

Heap::~Heap() {
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      set_oops((oop*)base, capacity() / oopSize, NULL);
    }
# endif
  if (on_c_heap) selfs_free(_base);
  selfs_free(heapMap - 1);          // -1 to get rid of sentinel
  selfs_free(freeList);
}

void Heap::removeFromFreeList(ChunkMap* m) {
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      m->verify();
    }
# endif
  HeapChunk* p = (HeapChunk*)blockAddr(m);
  p->link.remove();
}

bool Heap::addToFreeList(ChunkMap* m) {
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      m->verify();
    }
# endif
  HeapChunk* p = (HeapChunk*)blockAddr(m);
  int32 sz = m->size();
  if (sz <= nfree) {
    freeList[sz-1].append(p);
    return false;
  } else {
    bigList.append(p);
    p->size = sz;
    return true;
  }
}

void* Heap::allocFromLists(int32 wantedBytes) {
  assert(wantedBytes % blockSize == 0, "not a multiple of blockSize");
  int32 wantedBlocks = wantedBytes >> log2BS;
  assert(wantedBlocks > 0, "negative alloc size");
  int32 blocks = wantedBlocks - 1;
  void* p = NULL;
  while (!p && ++blocks <= nfree) {
    p = freeList[blocks-1].get();
  }
  if (! p) {
    HeapChunk *c, *f = bigList.anchor();
    for (c = f->next();
         c != f && c->size < wantedBlocks;
         c = c->next()) {}
    if (c == f) {
      if (! combineMode && combineAll() >= wantedBlocks)
        return allocFromLists(wantedBytes);
    } else {
      p = c;
      blocks = c->size;
      bigList.remove(c);
    }
  } 
  if (p) {
    ChunkMap* m = mapAddr(p);
    assert(m->size() == blocks, "inconsistent sizes");
    m->markUsed(wantedBlocks);
    if (blocks > wantedBlocks) {
#ifdef LOG_LOTSA_STUFF
      if (!bootstrapping) LOG_EVENT("zoneHeap: splitting allocated block");
#endif
      int32 freeChunkSize = blocks - wantedBlocks;
      ChunkMap* freeChunk = m->next();
      freeChunk->markUnused(freeChunkSize);
      addToFreeList(freeChunk);
    }
  }
  return p;
}

void* Heap::allocate(int32 wantedBytes) {
  assert(wantedBytes > 0, "Heap::allocate: size <= 0");
  int32 rounded = ((wantedBytes + blockSize - 1) >> log2BS) << log2BS;
  
  void* p = allocFromLists(rounded);
  if (p) {
    bytesUsed += rounded;
    total += rounded;
    ifrag += rounded - wantedBytes;
  }
  if (VerifyZoneOften) {
    for (int32* pp = (int32*)p;  (char*)pp  <  (char*)p + wantedBytes;  ++pp)
      *pp = 0xdadbadee;
    verify();
  }
  return p;
}


void Heap::deallocate(void* p, int32 bytes) {
  if (VerifyZoneOften) {
    for ( int32* pp = (int32*)p;  (char*)pp < (char*)p + bytes; ++pp)
      *pp = 0xbadbad25;
  }
  ChunkMap* m = mapAddr(p);
  int32 myChunkSize = m->size();
  int32 blockedBytes = myChunkSize << log2BS;
  bytesUsed -= blockedBytes;
  ifrag -= blockedBytes - bytes;
  m->markUnused(myChunkSize);
  bool big = addToFreeList(m);
  HeapChunk* c = (HeapChunk*)p;
  if (combineMode || big) combine(c);   // always keep bigList combined

  if (VerifyZoneOften) {
    verify();
  }
}

# define INC(p, n)   p = asChunkMap(p->asByte() + n)

char* Heap::compact(moveChunkFn move) {
  if (usedBytes() == capacity()) return NULL;
  
  ChunkMap* m = heapMap;
  ChunkMap* end = heapEnd();
  
  ChunkMap* freeChunk = m;
  while (freeChunk->isUsed()) {                         // find 1st unused blk
    freeChunk = freeChunk->next();
  }
  ChunkMap* usedChunk = freeChunk;
  
  for(;;) {
    while (usedChunk->isUnused()) usedChunk = usedChunk->next();
    if (usedChunk == end) break;
    int32 uSize = usedChunk->size();
    assert(freeChunk < usedChunk, "compaction bug");
    move(blockAddr(usedChunk), blockAddr(freeChunk), uSize << log2BS);
    freeChunk->markUsed(uSize);   // must come *after* move
    INC(freeChunk, uSize);
    INC(usedChunk, uSize);
  }
  for(int i = 0; i < nfree; i++) freeList[i].clear();
  bigList.clear();
  int32 freeBlocks = end->asByte() - freeChunk->asByte();
  freeChunk->markUnused(freeBlocks);
  addToFreeList(freeChunk);
  assert(freeBlocks * blockSize == capacity() - usedBytes(),
         "usage info inconsistent");
  lastCombine = heapMap;
  return blockAddr(freeChunk);
}  

int32 Heap::combine(HeapChunk*& c) {
  // Try to combine c with its neighbors; on return, c will point to
  // the next element in the freeList, and the return value will indicate
  // the size of the combined block.
  ChunkMap* cm = mapAddr((char*)c);
  assert(cm < heapEnd(), "beyond heap");
  ChunkMap* cmnext = cm->next();
  ChunkMap* cm1;
  if (cm == heapMap) {
    cm1 = cm;
  } else {
    cm1 = cm->prev();                   // try to combine with prev
    while (cm1->isUnused()) {           // will terminate because of sentinel
      ChunkMap* free = cm1;
      cm1 = free->prev();
      removeFromFreeList(free);
      free->invalidate();               // make sure it doesn't look valid
    }
    cm1 = cm1->next();
  }
  ChunkMap* cm2 = cmnext;               // try to combine with next
  while (cm2->isUnused()) {             // will terminate because of sentinel
    ChunkMap* free = cm2;
    cm2 = cm2->next();
    removeFromFreeList(free);
    free->invalidate();                 // make sure it doesn't look valid
  }

  // The combined block will move to a new free list; make sure that c
  // returns an element in the current list so that iterators work.
  c = c->next();

  if (cm1 != cm || cm2 != cmnext) {
    removeFromFreeList(cm);
    cm->invalidate();   
    cm1->markUnused(cm2->asByte() - cm1->asByte());
    addToFreeList(cm1);
    lastCombine = cm1;
  }
  assert(cm1 >= heapMap && cm2 <= heapEnd() && cm1 < cm2, "just checkin'");
  return cm1->size();
}

// Try to combine adjacent free chunks; return size of biggest chunk (in blks).
int32 Heap::combineAll() {
  int32 biggest = 0;
  for (int32 i = 0; i < nfree; i++) {
    HeapChunk* f = freeList[i].anchor();
    for (HeapChunk* c = f->next(); c != f; ) {
      HeapChunk* c1 = c;
      int32 sz = combine(c);
      if (c1 == c) fatal("infinite loop detected while combining blocks");
      if (sz > biggest) biggest = sz;
    }
  }
  combineMode = true;
  if (VerifyZoneOften) {
    verify();
  }
  return biggest;
}

void* Heap::firstUsed() {
  if (usedBytes() == 0) return NULL;
  if (heapMap->isUsed()) {
    return base;
  } else {
    return nextUsed(base);
  }
}

// return next used chunk with address > p
void* Heap::nextUsed(void* p) {
  ChunkMap* m = mapAddr(p);
  if (m->isValid() && !lastCombine->contains(m->asByte())) {
    if (VerifyZoneOften) {
      ChunkMap *m1;
      for (m1 = heapMap; m1 < m; m1 = m1->next()) ;
      assert(m1 == m, "m isn't a valid chunk");
    }
    assert(m->verify(), "valid chunk doesn't verify");
    m = m->next();
  } else {
    // m is pointing into the middle of a block (because of block
    // combination)
    ChunkMap *n;
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      ChunkMap *m1;
      for (m1 = heapMap; m1 < lastCombine; m1 = m1->next()) ;
      assert(m1 == lastCombine, "lastCombine not found");
      assert(lastCombine->verify(), "invalid lastCombine");
    }
#   endif
    for (n = lastCombine; n <= m; n = n->next()) ;
    m = n;
    assert(m->isValid(), "something's wrong");
  }
  
  while (m->isUnused()) {
    m = m->next();
  } 
  
  assert(m->isValid(), "something's wrong");
  assert(m <= heapEnd(), "past end of heap");
  if (m == heapEnd()) {
    return NULL;                                        // was last one
  } else {
    void* next = blockAddr(m);
    assert(next > p, "must be monotonic");
    assert(!(int(next) & 1), "must be even");
    return next;
  }
}

void* Heap::findStartOfBlock(void* start) {
  // used a lot -- help the optimizer a bit
  if (newHeap && newHeap->contains(start))
    return newHeap->findStartOfBlock(start);
  
  const fint  blockSz = blockSize;      
  start = (void*)(int32(start) & ~(blockSz-1));
  assert(contains(start), "start not in this zone");
  ChunkMap* m = mapAddr(start)->findStart(heapMap, heapEnd());
  return blockAddr(m);
}

int32 Heap::sizeOfBlock(void* p) {
  return mapAddr(p)->size() << log2BS;
}

bool Heap::verify() {
  bool r = true;
  ChunkMap* m = heapMap;
  ChunkMap* end = heapEnd();
  if (end->isUnused() || end->size() != 1) {
    error2("wrong end-sentinel %d in heap 0x%lx", (int)*(u_char*)end, this);
    r = false;
  }
  ChunkMap* begin = asChunkMap(heapMap->asByte() - 1);
  if (begin->isUnused() || begin->size() != 1) {
    error2("wrong begin-sentinel %d in heap 0x%lx", (int)*(u_char*)begin, this);
    r = false;
  }

  
  // verify map structure
  for (  ;  m < end;  m = m->next()) {
    if (!m->verify()) {
      lprintf(" in heap 0x%lx", this);
      r = false;
    }
  }
  // verify free lists
  int32 i;
  for (i = 0; i < nfree; i++) {
    int32 j = 0;
    int32 lastSize = 0;
    HeapChunk* f = freeList[i].anchor();
    for(HeapChunk* h = f->next(); h != f; h = h->next(), j++) {
      ChunkMap* p = mapAddr(h);
      if (!p->verify()) {
        lprintf(" in free list %ld (elem %ld) of heap 0x%lx",
               long(i), long(j), (long unsigned)this); 
        r = false;
      }
      if (p->isUsed()) {
        error4("inconsistent freeList %ld elem 0x%lx in heap 0x%lx (map %#lx)",
               i, h, this, p);
        r = false;
      }
      if (p->size() != lastSize && j != 0) {
        error4("freeList %ld elem %#lx in heap %#lx (map %#lx) has wrong size",
               i, h, this, p);
        r = false;
      }
      lastSize = p->size();
      if (h->next() == h) {
        error3("loop in freeList %ld elem %#lx in heap %#lx", i, h, this);
        r = false;
        break;
      }
    }
  }
  int j = 0;
  HeapChunk* f = bigList.anchor();

  for(HeapChunk* h = f->next(); h != f; h = h->next(), j++) {
    ChunkMap* p = mapAddr(h);
    if (!p->verify()) {
      lprintf(" in bigList (elem %ld) of heap 0x%lx", long(j), this);
      r = false;
    }
    if (p->isUsed()) {
      error4("inconsistent freeList %ld elem 0x%lx in heap 0x%lx (map 0xlx)",
             i, h, this, p);
      r = false;
    }
  }
  if (! lastCombine->verify()) {
    error1("invalid lastCombine in heap %#lx", this);
    r = false;
  }
  return r;
}

void Heap::print() {
  lprintf("%#lx: [%#lx..%#lx)\n",
         this,  base,  base + capacity());
  printIndent();
  lprintf("  size %ld (blk %ld), used %ld (%1.1f%%), ifrag %1.1f%%;\n",
         capacity(), blockSize, usedBytes(),
         100.0 * usedBytes() / capacity(), 100.0 * intFrag());
  printIndent();
  lprintf("  grand total allocs = %ld bytes\n", long(total));
  printIndent();
  lprintf("  free lists: ");
  for (int i = 0; i < nfree; i++) lprintf("%ld ", freeList[i].length());
  lprintf("; %ld\n", bigList.length());
}

static char zone_heap_delim[] = "\n\f\na zone heap\n\f\n!%n";

void ChunkMap::write_snapshot(FILE* f) {
  u_char* p = asByte();
  int32 nChunks = size();
  if (nChunks < maxOneByteLen) {
    OS::FWrite(p, 1, f);
  } else {
    OS::FWrite(p, maxHeaderSize, f);
  }
}

void Heap::write_snapshot(FILE* f) {
  write_delim(f, zone_heap_delim);

  OS::FWrite(this, sizeof(Heap), f);
  OS::FWrite(freeList, sizeof(FreeList) * nfree, f);
  ChunkMap* m = heapMap;
  ChunkMap* end = heapEnd();
  while (m < end) {
    m->write_snapshot(f);
    char* nm = blockAddr(m);
    int sz = m->size();
    if (m->isUsed()) {
      // write used blocks
      OS::FWrite(nm, sz * blockSize, f);
    } else {
      // write link info of unused block
      OS::FWrite(nm, sizeof(HeapChunk), f);
    }
    m = m->next();
  }
}

void ChunkMap::read_snapshot(FILE* f) {
  u_char* p = asByte();
  OS::FRead(p, minHeaderSize, f);
  if (headerSize() > minHeaderSize) {
    assert(headerSize() == maxHeaderSize, "should be either min or max");
    OS::FRead(p + minHeaderSize, maxHeaderSize - minHeaderSize, f);
  }
  assert(size() > 0, "wrong size");
  markSize(size(), isUsed() ? used : unused);
}

void Heap::read_snapshot(FILE* f) {
  check_delim(f, zone_heap_delim);
  
  char* buf[sizeof(Heap)];
  Heap* theHeap = (Heap*)buf;
  
  OS::FRead(buf, sizeof(Heap), f);
  if (okToUseCodeFromSnapshot
      && (   theHeap->size != size
          || theHeap->base != base
          || theHeap->nfree != nfree
          || theHeap->blockSize != blockSize))
    noCodeWarning(
      "because of a mismatch in the size or address of a zone heap");

  if (okToUseCodeFromSnapshot) {
    ChunkMap* m = heapMap;
    FreeList* fr = freeList;
    *this = *theHeap;
    heapMap= m;
    if ((caddr_t)lastCombine < NMethodStart)
      lastCombine= heapMap + (lastCombine - theHeap->heapMap);
    freeList= fr;       // "relocation"
  }
  OS::read_or_seek(freeList, sizeof(FreeList) * theHeap->nfree, f);
  ChunkMap* m = heapMap;
  int32 blocksToRead = theHeap->heapEnd() - theHeap->heapMap;
  int32 sz;
  for (int32 blocksRead = 0; blocksRead < blocksToRead; blocksRead += sz) {
    m->read_snapshot(f);
    char* nm = blockAddr(m);
    sz = m->size();
    if (m->isUsed()) {
      // read used blocks
      OS::read_or_seek(nm, sz * theHeap->blockSize, f);
    } else {
      // read link info of unused block
      OS::read_or_seek(nm, sizeof(HeapChunk), f);
    }
    if (okToUseCodeFromSnapshot) m= m->next();
  }
    
  relocate_nmlns();

# if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions  &&  okToUseCodeFromSnapshot) verify();
# endif
}

void Heap::relocate_nmlns() 
{
  // relocate nmlns after reading snapshot (zone may have moved)
  for (int i= 0;  i < nfree;  i++)
    Memory->code->relocate_nmln(&freeList[i].link);
  Memory->code->relocate_nmln(&bigList.link);
}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
