/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "fprofiler.hh"
# include "_fprofiler.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


# define ticksPerSec  100
# define SHIFT  5               
# define SCALE  (1 << SHIFT)   /* (# of insts mapped to same counter) / 2 */
# define PROFIL_SCALE   (0x10000 >> SHIFT)   /* see profil(2) man page */
# define scale(offset)  ((offset >> SHIFT) / sizeof(PCounter))

# if  TARGET_OS_VERSION == MACOSX_VERSION   &&  OSX_RELEASE >= MOUNTAIN_LION_RELEASE 

extern "C" int profil( char* /*buf*/,
            size_t   /*bufsiz*/,
            unsigned long    /*offset*/,
            unsigned int    /*scale*/ ) {
  fatal("unimp mac");
  return 0;
}
# elif TARGET_OS_FAMILY == UNIX_FAMILY
/* Pick this up from header file:
  extern "C" void profil(unsigned short *buf,
                         unsigned int bufsiz,
                         unsigned int offset,
                         unsigned int scale);
*/
                       
# endif


FlatProfiler* flatProfiler;
typedef uint16 PCounter;
static char* buf = NULL;
static int32 bufSize;

# define bufStart  ((PCounter*) buf)
# define bufEnd    ((PCounter*)(buf + bufSize))

// count buffer address for memory address m
inline PCounter* bufAddr(void* m) {
  int32 offset = (char*)m - Memory->code->instsStart();
  PCounter* p = bufStart + scale(offset);
  if (p < bufEnd) {
    // everything is ok
  } else {
    // the stubs zone has grown - can't handle this yet
    p = bufEnd - 1;
    *p = 0;     // just to make sure the results aren't bogus
  }
  assert(p >= bufStart && p < bufEnd, "outside of buffer");
  return p;
}

inline bool isInBuffer(void* m) {
  int32 offset = (char*)m - Memory->code->instsStart();
  PCounter* p = bufStart + scale(offset);
  return p < bufEnd;
}


int32 ticksFor(char* s, char* e) {
  PCounter* start = bufAddr(s);
  PCounter* end   = bufAddr(e);
  int32     sum   = 0;
  for (PCounter* p = start; p <= end; p++) sum += *p;
  return sum;
}

int32 ticksFor(nmethod* m) {
  assert(isInBuffer(m->insts()), "should be in buffer");
  assert(isInBuffer(m->instsEnd()), "should be in buffer");
  return ticksFor(m->insts(), m->instsEnd());
}

FlatProfiler::FlatProfiler() {
  flatProfiler = this;
  // BUG: doesn't handle growing PIC zone
  int32 size = Memory->code->stubs->zone()->endAddr() -
               Memory->code->instsStart();
  bufSize = roundTo(size >> SHIFT, oopSize) + oopSize;
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      // to double-check correct parameters for profil() - the 2nd half must
      // remain empty
      bufSize *= 2;
    }
# endif
  buf = AllocateHeap(bufSize, "profile counters");
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      bufSize /= 2;
      memset(buf + bufSize, 0, bufSize);
    }
# endif
  assert(isInBuffer(Memory->code->stubs->zone()->endAddr()), "oops");
  assert(isInBuffer(Memory->code->instsStart()), "oops");
  ResetFlatProfile_prim(0);
}

void initFlatProfiler() {
  if (flatProfiler) fatal("only one profiler, please");
  flatProfiler = new FlatProfiler();
}

void FlatProfiler::clear(char* startPC, char* endPC) {
  if (! flatProfiler) return;
  char* start = (char*)bufAddr(startPC);
  char* end   = (char*)(bufAddr(endPC) + 1);
  memset(start, 0, end - start);
}

void FlatProfiler::flush(char* startPC, char* endPC) {
  if (! flatProfiler) return;
  flushed += ticksFor(startPC, endPC);
  clear(startPC, endPC);
}

void FlatProfiler::move(char* startPC, char* endPC, char* toPC) {
  if (! flatProfiler) return;
  if (isInBuffer(startPC) && isInBuffer(toPC)) {
    PCounter* from = bufAddr(startPC);
    PCounter* end  = bufAddr(endPC);
    PCounter* to   = bufAddr(toPC);
    PCounter* p;
    for (p = from; p < end; ) *to++ = *p++;
    assert(p <= bufEnd, "outside of buffer");
  }
}

class nmTime {
 public:
  nmethod* m;
  int32 ticks;
};

typedef int compareFn(nmTime*, nmTime*);

# define FOR_ALL_NMETHODS(var)                                                \
    for (nmethod *var = Memory->code->first_nm();                             \
    var; var = Memory->code->next_nm(var))

static int compar(const void* t1,  const void* t2) {
  return ((nmTime*)t2)->ticks - ((nmTime*)t1)->ticks;
}

static int32 printStubNumbers() {
  int32 total;
  Heap* stubs = Memory->code->stubs->zone();
  if (isInBuffer(stubs->endAddr())) {
    assert(isInBuffer(stubs->startAddr()), "oops");
    total = ticksFor(stubs->startAddr(), stubs->endAddr() - 1);
    lprintf("Total ticks in PICs/count stubs = %ld (%3.2fs)\n",
           long(total), (float)total / ticksPerSec);
    int32 pics = 0, counts = 0, npics = 0, ncounts = 0,
          npics2 = 0, ncounts2 = 0;
    FOR_ALL_STUBS(st) {
      int32 t = ticksFor(st->insts(), st->instsEnd());
      if (st->isCacheStub()) {
        pics += t;
        npics++;
        if (t) npics2++;
      } else {
        counts += t;
        ncounts++;
        if (t) ncounts2++;
      }
    }
    lprintf("Approx. ticks in PICs     = %ld (%3.2fs)\t(%d/%d)\n",
           long(pics), (float)pics / ticksPerSec, npics2, npics);
    lprintf("Approx. ticks in counters = %ld (%3.2fs)\t(%d/%d)\n",
           long(counts), (float)counts / ticksPerSec, ncounts2, ncounts);
  } else {
    lprintf("Total ticks in PICs/count stubs = N/A (PIC zone has grown since start)\n");
    total = 0;
  }
  return total;
}

# if  GENERATE_DEBUGGING_AIDS
  PCounter* findGT(int32 x) {   // for debugging
    PCounter* p = (PCounter*)buf;
    PCounter* e = (PCounter*)(buf + bufSize);
    while (p < e && *p <= x) p++;
    if (p < e) {
      return p;
    } else {
      return NULL;
    }
  }
# endif

oop ResetFlatProfile_prim(oop r) {
  if (flatProfiler) {
    char* start = Memory->code->instsStart();
    char* end = Memory->code->stubs->zone()->endAddr();
    flatProfiler->clear(start, end - 1);
  } else {
    initFlatProfiler();
  }
  flatProfiler->flushed = 0;
  return r;
}


oop PrintFlatProfile_prim(oop rcvr, smi lines) {
  if (! flatProfiler) {
    lprintf("\nError: profiler is inactive; use _FlatProfile: true to activate\n");
    return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
  }
  ResourceMark mark;
# if GENERATE_DEBUGGING_AIDS
    PCounter* p;
    if (CheckAssertions) {
      for (p = bufEnd; p < bufEnd + bufSize / sizeof(PCounter); p++) {
        if (*p != 0)
          error2("fprofiler: word at %#lx (offset %d) is non-zero",
                 p, p - bufStart);
      }
    }
# endif
    
  int32 n = 0;
  FOR_ALL_NMETHODS(dummy) n++;
  if (n < lines) lines = n;
  nmTime* times = NEW_RESOURCE_ARRAY( nmTime, n);
  int32 total = 0;
  int32 access = 0;
  int32 nicCompiled = 0;
  int32 i = 0;
  FOR_ALL_NMETHODS(m) {
    times[i].m = m;
    int32 t = ticksFor(m);
    times[i].ticks = t;
    total += t;
    if (m->isAccess()) access += t;
    if (m->compiler() == NIC) nicCompiled += t;
    i++;
  }
  qsort(times, n, sizeof(nmTime), compar);
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      char* instsEnd = Memory->code->instsStart() + Memory->code->instsSize();
      int32 total2 = ticksFor(Memory->code->instsStart(), instsEnd);
      if (total != total2)
        error2("inconsistent total: is %d, should be %d", total, total2);
      // clear out all nmethod counters to see where the rest is
      int32 cleared = 0;
      FOR_ALL_NMETHODS(nm) {
        nmethod* nextnm = Memory->code->next_nm(nm);
        assert(!nextnm || bufAddr(nm->instsEnd()) < bufAddr(nextnm->insts()),
               "nmethods overlap (SHIFT too big)");
        cleared += ticksFor(nm);
        flatProfiler->clear(nm->insts(), nm->instsEnd());
      }
      PCounter* end = bufAddr(instsEnd);
      for (p = bufStart; p < end + 1; p++) {
        if (*p != 0) {
          // compute corresponding PC
          fint pc_offset = ((p - bufStart) << SHIFT) * sizeof(PCounter);
          char* pc = Memory->code->instsStart() + pc_offset;
          assert(bufAddr(pc) == p, "oops");
          error2("fprofiler: word at %#lx (offset %d) is non-zero",
                 p, p - bufStart);
        }
      }
    }
# endif
  total += flatProfiler->flushed;
  lprintf("\nTotal ticks in Self = %ld (%3.2fs)\n",
         long(total), (float)total / ticksPerSec);
  if (flatProfiler->flushed) {
    lprintf("Total ticks in flushed nmethods = %ld (%3.2fs)\n",
           long(flatProfiler->flushed), (float)flatProfiler->flushed / ticksPerSec);
  }

  int32 pics = printStubNumbers();

  total += pics;
  if (total) {
    int32 topN = 0;
    for(i = 0; i < lines && times[i].ticks; i++) {
      nmethod *m = times[i].m;
      lprintf("%6ld %5.1f%%  %s",
             long(times[i].ticks),
             (100.0 * times[i].ticks) / total,
             m->key.selector_string());
      if (m->isAccess()) {
        if (WizardMode) {
          lprintf(" (access method for map 0x%lx)",
                 (long unsigned)(m->key.receiverMap()));
        } else {
          lprintf(" (access method)");
        }
      } else {
        methodMap* mm = (methodMap *) m->method()->map();
        stringOop file = mm->file();
        if (file->length() > 0) {
          lprintf(" (");
          file->string_print();
          lprintf(":%ld)", long(mm->line()->value()));
        }
      }
      if (WizardMode)
        lprintf("  (%s %#lx%s%s%s)",
               VMString[m->compiler()]->copy_null_terminated(), long(m),
               m->isYoung() ? " Y" : "",
               m->isToBeRecompiled() ? " TBR" : "",
               m->isUncommonRecompiled() ? " UNCOMMON" : "");
      lprintf("\n");
      topN += times[i].ticks;
    }
    lprintf("%6ld %5.1f%%  %s\n", long(topN), (100.0 * topN) / total,
           "(above methods combined)");
    lprintf("%6ld %5.1f%%  %s\n", long(access), (100.0 * access) / total,
           "(all data access methods combined)");
    lprintf("%6ld %5.1f%%  %s\n\n", long(nicCompiled), (100.0 * nicCompiled) / total,
           "(all NIC-compiled methods combined)");
  }
  return rcvr;
}

# else // defined(FAST_COMPILER) || defined(SIC_COMPILER)

oop  ResetFlatProfile_prim(oop r) { return r; }
oop PrintFlatProfile_prim(oop r, smi lines) { 
  Unused(lines); Unused(r); return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR); }

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

// need this entry point either way

void SelfFlatProfile(bool on) {
  # if TARGET_OS_VERSION == MACOSX_VERSION \
    || TARGET_OS_VERSION == NETBSD_VERSION \
    || TARGET_OS_VERSION == FREEBSD_VERSION
    typedef  char *           buf_t;
  # else // ! MACOSX_VERSION
    typedef unsigned short *  buf_t;
    // Linux???
  # endif

  # if !TARGET_IS_PROFILED && ( defined(FAST_COMPILER) || defined(SIC_COMPILER) )
      // won't work in the profiled Self version
      if (on) {
        if (! flatProfiler) initFlatProfiler();
          profil((buf_t) buf, bufSize, (int) Memory->code->instsStart(), PROFIL_SCALE);
        FlatProfile = true;
      }
      else {
        profil((buf_t)buf, 0, 0, 0);
        FlatProfile = false;
      }
  # else
      Unused(on);
      warning("_FlatProfile: only works with unprofiled VM");
  # endif
}

