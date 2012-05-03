/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// zoneHeap.h - basic heap management

class HeapChunk {       // a heap chunk is a consecutive sequence of blocks
 public:
  nmln link;
  int32 size;           // size in blocks (only for heterogenuous list)
  virtual ~HeapChunk() {};

  HeapChunk* next()             { return (HeapChunk*)link.next; }
# ifdef UNUSED
  HeapChunk* prev()             { return (HeapChunk*)link.prev; }
  void insert(HeapChunk* next)  { link.add(&next->link); }
# endif
};

class FreeList:  public HeapChunk {
 public:
  
  FreeList()   { link.init(); }
  void clear() { link.init(); }

  HeapChunk* anchor() { return (HeapChunk*)this; }
  
  void append(HeapChunk* h);
  void remove(HeapChunk* h);
  HeapChunk* get();
  int32 length();
};

class ChunkMap;
class nmethod;
typedef void (*moveChunkFn)(char* from, char* to, int32 nbytes);

class Heap: public CHeapObj {
 protected:
  int32 size;           // total size in bytes
 public:
  int32 blockSize;      // allocation unit in bytes (must be power of 2)
  int32 nfree;          // number of free lists
 protected:
  int32 log2BS;         // log2(blockSize)
  
  int32 bytesUsed;      // used bytes (rounded to block size)
  int32 total;          // total bytes allocated so far
  int32 ifrag;          // bytes wasted by internal fragmentation
  char* _base;          // for deallocation
  char* base;           // base addr of heap
  bool on_c_heap;       // allocated via malloc (if not, mmapped)
  ChunkMap* heapMap;    // map of heap (1 byte / block)
  FreeList* freeList;   // array of free lists for different chunk sizes
  FreeList  bigList;    // list of all big free blocks
  ChunkMap* lastCombine;// result of last block combination
 public:
  Heap* newHeap;        // only set when growing a heap (i.e. replacing it)
  bool combineMode;     // do eager block combination on deallocs?
  
 public:
  Heap(int32 s, int32 bs, int32 nf, char* baseAddr = NULL,
       bool on_c_heap = true);
  ~Heap();

  void      clear();
  
  void*     allocate(int32 wantedBytes);
  void      deallocate(void* p, int32 bytes);
  char*     compact(moveChunkFn move);          // returns first free byte  
  bool      verify();
  void      read_snapshot(FILE* f);
  void      write_snapshot(FILE* f);
  void      print();
  
  int32     capacity()  { return size; }
  int32     usedBytes() { return bytesUsed; }
  int32     freeBytes() { return size - bytesUsed; }
  double    intFrag()   { return usedBytes() ? (float)ifrag / usedBytes() : 0 ; }
  double    extFrag() {
    return usedBytes() ? 1.0 - (float)usedBytes() / capacity() : 0; }
  char*     startAddr() { return base; }
  char*     endAddr()   { return startAddr() + capacity(); }
  bool      contains(void* p) {
    return (void*)base <= p && p < (void*)(base + capacity()); }
  void*     firstUsed();                // addr of first used object
  void*     nextUsed(void* prev);
  void*     findStartOfBlock(void* start);
  int32     sizeOfBlock(void* nm);
  
 protected:
  int32  mapSize()              { return size >> log2BS; }
  char*  blockAddr(ChunkMap* m) {
    u_char* fm = (u_char*)heapMap;
    u_char* bm = (u_char*)m;
    assert(bm >= fm && bm < fm + mapSize(), "not a heapMap entry");
    return base + ((bm - fm) << log2BS);
  }
  ChunkMap* mapAddr(void* p) {
    char* pp = (char*)p;
    assert(pp >= base && pp < base + size, "not in this heap");
    assert(int32(pp) % blockSize == 0, "must be block-aligned");
    u_char* fm = (u_char*)heapMap;
    return (ChunkMap*)(fm + ((pp - base) >> log2BS));
  }
  ChunkMap* heapEnd() { return (ChunkMap*)((u_char*)heapMap + mapSize()); }
  void*     allocFromLists(int32 wantedBytes);
  bool      addToFreeList(ChunkMap* m);
  void      removeFromFreeList(ChunkMap* m);
  int32     combineAll();
  int32     combine(HeapChunk*& m);
 public:
  void      relocate_nmlns();
};

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

