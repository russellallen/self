/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "machineCache_unix.hh"
# include "_machineCache_unix.cpp.incl"


// define FLUSH_ALL (for debugging) to flush the complete I cache of nmethods
// and PICs very regularly

# ifdef FLUSH_ALL
  void MachineCache::flush_instruction_cache_for_debugging() {
    flush_instruction_cache_range(Memory->code->iZone->startAddr(),
                                  Memory->code->iZone->endAddr());
    flush_instruction_cache_range(Memory->code->stubs->zone()->startAddr(),
                                  Memory->code->stubs->zone()->endAddr());
}
# endif  

# define OVERDO_IT 0
# if TARGET_OS_VERSION == MACOSX_VERSION  \
  && (     TARGET_ARCH == PPC_ARCH \
       ||  TARGET_ARCH == I386_ARCH  &&  !OVERDO_IT )

  extern "C" { void MakeDataExecutable(void*, unsigned long); }

  void MachineCache::flush_instruction_cache_word(void* addr) {
    MakeDataExecutable(addr, sizeof(int32)); }

  void MachineCache::flush_instruction_cache_range(void* s, void* e) {
    MakeDataExecutable(s, (char*)e - (char*)s);
  }

# elif TARGET_OS_VERSION == MACOSX_VERSION \
    && TARGET_ARCH == I386_ARCH  &&  OVERDO_IT
  extern "C" { void MakeDataExecutable(void*, unsigned long); }
  void MachineCache::flush_instruction_cache_word(void* addr) { 
    const fint maxInstLen = 8; // a guess
    flush_instruction_cache_range(((char*)addr) - maxInstLen,  ((char*)addr) + maxInstLen);
  }

  void MachineCache::flush_instruction_cache_range(void* s, void* e) {
    MakeDataExecutable(s, (char*)e - (char*)s);

    // Could make this more efficient by depending on cache characteristics,
    // e.g. I-cache line size.  Also, should be a nop on machines without
    // split I/D caches (everything up to SS-2).

    const fint cacheLineSize = 8; // a guess

    char* start = (char*) ((int)s & ~(cacheLineSize - 1));
    char* end   = (char*) roundTo((int)e, cacheLineSize);
    for ( ; start < end; start += cacheLineSize) {
      FlushInstruction(start);  // FLUSH inst flushes (at least) a doubleword
    }
  }

# elif TARGET_ARCH == SPARC_ARCH

  void MachineCache::flush_instruction_cache_word(void* addr) { 
    FlushInstruction(addr); 
  }

  void MachineCache::flush_instruction_cache_range(void* s, void* e) {
    // Could make this more efficient by depending on cache characteristics,
    // e.g. I-cache line size.  Also, should be a nop on machines without
    // split I/D caches (everything up to SS-2).

    // Round s down to a double-word boundary
    char* start = (char*)(int(s) & ~(oopSize + oopSize - 1));
    char* end   = (char*)e;
    for ( ; start < end; start += 2 * sizeof(char*)) {
      FlushInstruction(start);  // FLUSH inst flushes (at least) a doubleword
    }
  }

# elif TARGET_OS_VERSION == LINUX_VERSION \
    && TARGET_ARCH       == I386_ARCH
  // Don't know if Linux does this; rely on I386 for now
  void MachineCache::flush_instruction_cache_word(void* addr) { }

  void MachineCache::flush_instruction_cache_range(void* s, void* e) {}
  
# else
  # error for which machine?  

# endif
