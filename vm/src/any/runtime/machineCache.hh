#pragma once
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "top.hh"



// Handle "self-modifying" code on processors with separate I-caches.
// To minimize the performance penalty of the flushes, the VM always
// does a sequence of selective flushes followed by a flush_instruction_cache_for_debugging().
// On the SPARC, the selective flushes are more efficient; on the 68K, the
// global flush.

// For processors with a small I-cache / without selective cache invalidation,
// define MachineCache::flush_instruction_cache_for_debugging to flush the entire I-cache.  Otherwise, make it a no-op.

// For processors with selective cache invalidation, 
// define flushCacheWord and flushCacheRange


class MachineCache {
 public:
  static void flush_instruction_cache_for_debugging();
  static void flush_instruction_cache_word(void* addr);             // flush one 32-bit word (instruction)
  static void flush_instruction_cache_range(void* start, void* end);// flush range [start, end)

//# if TARGET_OS_FAMLIY == UNIX_FAMILY
# include "machineCache_unix.hh"
//# endif

};
