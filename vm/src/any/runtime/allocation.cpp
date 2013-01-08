/* Sun-$Revision: 30.21 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "allocation.hh"
# include "_allocation.cpp.incl"


bool isNull(VMObj* p) {
  return (p == NULL);
}

void VMObj::print()            { print_short();}
void VMObj::print_short()      { lprintf("%#lx", this); }
void VMObj::print_zero() { 
  if (!isNull(this)) {
    VMObj* temp = this;  // Hack to avoid seg faults in optimized version 
    temp->print(); 
  } else {
    lprintf("0x0");
  }
}
void VMObj::print_short_zero() {
  if (!isNull(this)) {
    VMObj* temp = this;  // Hack to avoid seg faults in optimized version 
    temp->print_short(); 
  } else {
    lprintf("0x0");
  }
}

const bool allocatePersistent = false;
// this is simpler than using #ifdefs for code below

void* ResourceObj::operator new(size_t size){
  char* r = (bootstrapping || allocatePersistent) ? 
    (char *) selfs_malloc(size) : allocateResource(size);
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions  &&  size && r == (char*) catchThisOne) breakpoint();
# endif
  return r;
}

void ResourceObj::operator delete(void* p){
  if (p != NULL) {
#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions  &&  p == (void*) catchThisOne) breakpoint();
#   endif
    if (allocatePersistent) {
      selfs_free(p);
    }
  }
}

void* CHeapObj::operator new(size_t size){
  return (void *) AllocateHeap(size, "operator-new");
}

void CHeapObj::operator delete(void* p){
 assert( !resources.contains((char*)p),
        "CHeapObj should not be in resource area");
 FreeHeap(p);
}

ResourceAreaChunk::ResourceAreaChunk(fint min_capacity,
                                     ResourceAreaChunk* previous) {
  if (PrintResourceChunkAllocation)
    lprintf("allocating new resource chunk %#lx\n", this);
  fint size = max(min_capacity + min_resource_free_size,
                  min_resource_chunk_size);
  bottom = (char*) AllocateHeap(size,"resourceAreaChunk");
  top    = bottom + size;
  initialize(previous);
}

void ResourceAreaChunk::initialize(ResourceAreaChunk* previous) {
  first_free  = bottom;
  prev        = previous;

  _allocated     = capacity() + (prev ? prev->_allocated : 0);
  _previous_used = prev ? (prev->_previous_used + used()) : 0;
}

ResourceAreaChunk::~ResourceAreaChunk() {
  FreeHeap(bottom);
}

void ResourceAreaChunk::print() {
  if (prev) prev->print();
  print_short();
  lprintf(": [%#lx, %#lx), prev = %#lx\n", 
         bottom, top, prev);
}

ResourceArea::ResourceArea() {
  chunk = NULL;
# if GENERATE_DEBUGGING_AIDS
  nesting = 0;
# endif
}

ResourceArea::~ResourceArea() {
  // deallocate all chunks
  ResourceAreaChunk* prevc;
  for (ResourceAreaChunk* c = chunk; c != NULL; c = prevc) {
    prevc = c->prev;
    resources.addToFreeList(c);
  }
}

char* ResourceArea::allocate_more_bytes(int32 size) {
  chunk = resources.new_chunk(size, chunk);
  char* p = chunk->allocate_bytes(size);
  assert(p, "Nothing returned");
  return p;
}

int32 ResourceArea::used() {
  if (chunk == NULL) return 0;
  return chunk->used() + (chunk->prev ? chunk->prev->_previous_used : 0);
}

Resources resources;

int32 Resources::capacity() { return _allocated; }

static int32 rsrc_used;

static void rsrcf1(Process* p) { rsrc_used += p->resource_area.used(); }

int32 Resources::used() {
  int32 old_rsrc_used = rsrc_used;      // to make this reentrant w/ the spy
  rsrc_used = 0;
  processes->processesDo(rsrcf1);
  int32 used = rsrc_used;
  rsrc_used = old_rsrc_used;
  return used;
}

static bool  in_rsrc;
static char* p_rsrc;
static void rsrcf2(Process* p) {
  in_rsrc = in_rsrc || p->resource_area.contains(p_rsrc);
}

bool Resources::contains(char* p) {
  in_rsrc = false;
  p_rsrc = p;
  processes->processesDo(rsrcf2);

# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions)
      for (ResourceAreaChunk* c = freeChunks; c; c = c->prev) {
        if (c->contains(p)) warning("Resources::contains(): p is deallocated!");
      }
# endif
  return in_rsrc;
}

void Resources::addToFreeList(ResourceAreaChunk* c) {
  if (PrintResourceChunkAllocation)
    lprintf("adding chunk %#lx to free list\n", c);
  # if GENERATE_DEBUGGING_AIDS
    if (ZapResourceArea)
      c->clear();
  # endif
  c->prev = freeChunks;
  freeChunks = c;
}

ResourceAreaChunk* Resources::getFromFreeList(fint min_capacity) {
  CSect cs(profilerCollectStackSemaphore); // ensure nprofiler does not mess up free list
  if (!freeChunks) return NULL;

  // Handle the first element specially
  if (freeChunks->capacity() >= min_capacity) {
    ResourceAreaChunk* res = freeChunks;
    freeChunks = freeChunks->prev;
    if (PrintResourceChunkAllocation)
      lprintf("getting resource chunk %#lx from free list\n",
             (long unsigned)res);
    return res;
  }

  ResourceAreaChunk* cursor = freeChunks;
  while (cursor->prev) {
    if (cursor->prev->capacity() >= min_capacity) {
      ResourceAreaChunk* res = cursor->prev;
      cursor->prev = cursor->prev->prev;
      if (PrintResourceChunkAllocation)
        lprintf("getting resource chunk %#lx from free list\n",
               (long unsigned)res);
      return res;
    }
    cursor = cursor->prev;
  }

  // No suitable chunk found
  return NULL;
}

    
ResourceAreaChunk* Resources::new_chunk(fint min_capacity,
                                        ResourceAreaChunk* previous) {
  _in_consistent_state = false;
  ResourceAreaChunk* res = getFromFreeList(min_capacity);
  if (res) {
    res->initialize(previous);
  } else {
        res = new ResourceAreaChunk(min_capacity, previous);
        _allocated += res->capacity();
        // Subtract the size of the resource chunk from the 'C-Heap' area.
        TrackCHeapInMonitor::adjust(-res->capacity());
  }
  _in_consistent_state = true;
  return res;
}

void ResourceAreaChunk::freeTo(char *new_first_free) {
  assert(new_first_free <= first_free, "unfreeing in resource area");
  # if GENERATE_DEBUGGING_AIDS
    if (ZapResourceArea) clear(new_first_free, first_free);
  # endif
  first_free= new_first_free;
}

Resources::Resources() {
 _allocated           = 0;
 _in_consistent_state = true;
}

ResourceMark::ResourceMark() {
  area  = &currentProcess->resource_area;
  chunk = area->chunk;
  top   = chunk ? chunk->first_free : NULL;
  ++area->nesting;
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      if (   !SignalInterface::is_in_map_load()
          &&  SignalInterface::is_on_signal_stack((char*)currentFrame())) {
        // gdb sometimes (rarely) screws up SIGALRM handling during expression
        // evaluation, so this is a warning instead of a fatal.  -Urs

        // HProfiler does this, so silence warning -- Dave 12/03
        static bool haveWarned = false;
        if (!haveWarned) {
          warning("cannot use ResourceMarks in interrupt handlers!");
          if (!hprofiler->inactive()) {
            warning("silencing this warning for HProfiler");
            haveWarned = true;
          }
        }
      }
    }
# endif
  assert(area->nesting > 0, "nesting must be positive");
  if (PrintResourceAllocation) {
    lprintf("setting mark at %#lx\n", top);
  } 
}

ResourceMark::~ResourceMark() {
  assert(area->nesting > 0, "nesting must be positive");
  --area->nesting;
  if (PrintResourceAllocation) {
    lprintf("deallocating to mark %#lx\n", top);
  }
  ResourceAreaChunk *c, *prevc;
  for (c = area->chunk; c != chunk; c = prevc) {
    // deallocate all chunks behind marked chunk
    prevc = c->prev;
    resources.addToFreeList(c);
  }
  area->chunk = c;
  if (c == NULL) {
    top = NULL;
    return;
  }
  c->freeTo(top); 
  if (top == c->bottom) {
    // this chunk is completely unused - deallocate it
    area->chunk = c->prev;
    resources.addToFreeList(c);
  }
}


// Programming convention: never use "delete" on resource-allocated objects;
// if finalization is necessary, add a "finalize" method and make the
// destructor call finalize (to make stack-allocated objects work).  -Urs



int32 wastedBytes = 0;  // sum of wasted bytes on C heap (int. fragmentation
                        // and header info overhead)
                        
caddr_t mallocReserve= NULL;
static const size_t mallocReserveAmount= 1 * 1024 * 1024; // wild guess
bool MallocInProgress = false;

static void MallocFailed(void) { OS::allocate_failed("VM use"); } 


static int32 true_size_of_malloced_obj(int32* p) {
  static const int32 s_offset = 
#   if    TARGET_ARCH == SPARC_ARCH
      -2;
#   elif  TARGET_ARCH == I386_ARCH   &&   TARGET_OS_VERSION == MACOSX_VERSION
      -2;
#   elif  TARGET_ARCH == I386_ARCH   &&   TARGET_OS_VERSION ==  LINUX_VERSION
      -1;
#   else
	# error What is it?
#   endif
#   if  TARGET_OS_VERSION == MACOSX_VERSION
      // this routine breaks sometimes when you kill the scheduler and do prompt start -- dmu 8/1
      if (true) return 0;
# endif

  return p[s_offset] & ~3; // some mallocs use low-order bit as flag
}


// Linux malloc allocates addresses with bit 31 set, this conflicts with Self oop marking
# if TARGET_OS_VERSION == LINUX_VERSION
    # include <malloc.h> // for mallopt
# endif

void malloc_init() {
    # if TARGET_OS_VERSION == LINUX_VERSION
      mallopt(M_MMAP_MAX, 0); // if Linux malloc mmaps, we get bit 31 on, which conflicts with memOop marking
    # endif
    mallocReserve= (caddr_t)malloc(mallocReserveAmount);
    if (mallocReserve == NULL)
        warning("Couldn't reserve enough memory: system is unlikely to run.\n"
                "You should increase the amount of swap space available");
    std::set_new_handler(MallocFailed);
  }
  
  
  void* selfs_malloc(size_t size) {
         if (!MallocInProgress)              ;
    else if (profilerCollectStackSemaphore)  warning("profiler is reentering malloc; hope it will work");
    else {
      MallocInProgress = false;       // because fatal uses printf uses malloc...
      fatal("malloc/free aren't reentrant");
    }
    MallocInProgress = true;              // for hprofiler
    size = max(1, size); // malloc does not seem to like zero
    char* result = (char*)malloc(size);
  if ((int)result & 0x80000000) fatal("xxxxxxx");
    MallocInProgress = false;
  
    if (result == NULL) {
      warning1("malloc failed to allocate %d bytes", size);
      if (mallocReserve  &&  size <= mallocReserveAmount) {
        MallocInProgress= true;
        free(mallocReserve);
        mallocReserve= NULL;
        result= (char*)malloc(size);
  if ((int)result & 0x80000000) fatal("xxxxxxx");
        MallocInProgress= false;
        warning(
            "Memory for the Self VM is running low; the system may crash\n"
            "soon.  You would be advised to save then exit, and increase the amount\n"
            "of swap space available to Self.  Forcing a garbage collection is\n"
            "unlikely to help and may in fact precipitate a crash.\n"
            "You can force an immediate snapshot with the expression\n"
            "\t'snapshotFileName' _WriteSnapshot"
            );
      } else
        return NULL;
    }
    int32* p = (int32*)result;
    // assert(true_size_of_malloced_obj(p) >= size, "should be rounded size");
    int ts = true_size_of_malloced_obj(p);
  # if GENERATE_DEBUGGING_AIDS
     if (CheckAssertions) {
      // cannot use assert because printf uses malloc() ...
       if (ts != 0  &&  ts < size) breakpoint();
      if (result == (char*)catchThisOne) 
        breakpoint();
     }
  # endif
     if (ts) {
       TrackCHeapInMonitor::adjust(ts);
       wastedBytes += (ts - size);
     }
    return result;
  }
  
  
  void selfs_free(void* ptr) {
    int32* p = (int32*)ptr;
    TrackCHeapInMonitor::adjust(-true_size_of_malloced_obj(p));
  # if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      if (resources.contains((char*)p)) 
        fatal("should not delete resource object");
      // cannot use assert because printf uses malloc() ...
      if ( true_size_of_malloced_obj(p) < 0 
      ||   TrackCHeapInMonitor::allocated() < 0 )
        breakpoint();
      if (ptr == (void*)catchThisOne) 
        breakpoint();
    }
  # endif
    if (MallocInProgress) fatal("malloc/free are't reentrant");
    MallocInProgress = true;              // for hprofiler
    free(ptr);
    MallocInProgress = false;
  }
  
  // Linux: sbrk returns ponters with the high-order bit and Self objects

  # if TARGET_OS_VERSION == LINUX_VERSION
  
    static void *self_morecore(ptrdiff_t n) {
      // try first way, if it doesn't work, try second way
      # if 1
        void* r = sbrk(n);
        return r;
      # else
        static char malloc_heap[ 0x10000000 ];
        static char* malloc_heap_next = malloc_heap;
  
        void* r = (void*)malloc_heap_next;
        malloc_heap_next += n;
        if (malloc_heap_next > &malloc_heap[sizeof(malloc_heap)])
          fatal("ran out of memory");
        return r;
    # endif
  }
  
  void *(*__morecore)(ptrdiff_t __size) = self_morecore;
# endif
