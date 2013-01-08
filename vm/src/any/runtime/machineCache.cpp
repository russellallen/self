/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "machineCache.hh"
# include "_machineCache.cpp.incl"

// define FLUSH_ALL (for debugging) to flush the complete I cache of nmethods
// and PICs very regularly

# ifndef FLUSH_ALL
    void MachineCache::flush_instruction_cache_for_debugging() {}
#  endif
