/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "codeLikeSlotsMap.hh"
# include "_codeLikeSlotsMap.cpp.incl"

fint codeLikeSlotsMap::arg_count() {
  fint argc = 0;
  FOR_EACH_SLOTDESC(this, slot) {
    if (slot->is_arg_slot()) argc++;
  }
  assert(has_code() || argc == 0, "only objects with code can have arg slots");
  return argc;
}


