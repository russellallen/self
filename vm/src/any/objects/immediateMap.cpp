/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "immediateMap.hh"
# include "_immediateMap.cpp.incl"

oop immediateMap::fill_in_slots(slotList *slist, fint slotCount) {
  UsedOnlyInAssert(slotCount);
  assert(slist->obj_count() == 0, "immediates can't have obj slots");
  assert(slotCount == 1, "only space for a single map slot");

  slots()->init(slist->name(),
                slist->type(),
                slist->contents(),
                slist->annotation());

  return badOop; // nothing to create
}
