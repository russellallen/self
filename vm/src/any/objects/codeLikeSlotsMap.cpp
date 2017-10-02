/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "blockMap.hh"
# include "blockOop.hh"
# include "blockOop_inline.hh"
# include "byteCodes.hh"
# include "codeLikeSlotsMap.hh"
# include "enumeration.hh"
# include "generation_inline.hh"
# include "os_includes.hh"
# include "scanner.hh"
# include "space_inline.hh"
# include "vmStrings.hh"

fint codeLikeSlotsMap::arg_count() {
  fint argc = 0;
  FOR_EACH_SLOTDESC(this, slot) {
    if (slot->is_arg_slot()) argc++;
  }
  assert(has_code() || argc == 0, "only objects with code can have arg slots");
  return argc;
}


