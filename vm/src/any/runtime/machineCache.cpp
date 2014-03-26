/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "label_inline.hh"
# include "machineCache.hh"
# include "runtime.hh"
# include "space_inline.hh"
# include "universe.hh"
# include "zone.hh"

// define FLUSH_ALL (for debugging) to flush the complete I cache of nmethods
// and PICs very regularly

# ifndef FLUSH_ALL
    void MachineCache::flush_instruction_cache_for_debugging() {}
#  endif
