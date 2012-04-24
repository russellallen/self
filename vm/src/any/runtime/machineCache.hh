/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


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
  
# include "_machineCache_pd.hh.incl"  

};
