/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


#define FOR_EACH_SLOTDESC(MAP, SLOT)                                    \
  SlotIterator _iterator(MAP);                                          \
  slotDesc *SLOT= _iterator.slot_desc();                                \
  for ( ; !_iterator.atEnd(); SLOT= _iterator.next())
    
#define FOR_EACH_SLOTDESC_N(MAP, SLOT, N)                               \
  SlotIterator _iterator(MAP);                                          \
  slotDesc *SLOT= _iterator.slot_desc();                                \
  fint N;                                                            \
  for (N= 0; !_iterator.atEnd(); SLOT= _iterator.next(), N++)



class SlotIterator : public ResourceObj {
private:
  slotDesc *sd;
  slotDesc *end;

  void init(Map *m);
public:
  SlotIterator(Map *m)       { init(m); }

# if GENERATE_DEBUGGING_AIDS
  static SlotIterator *blockIterator;
  static fint nActive;

  ~SlotIterator() {
    if (CheckAssertions) {
      --nActive;
      if (this == blockIterator) blockIterator= NULL; 
    }
  }
# endif

  slotDesc *slot_desc() { return sd; }

  slotDesc *next() {
    assert(sd < end, "a step too far");
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions  &&  sd + 1 == end && this==blockIterator) blockIterator= NULL;
#   endif
    return ++sd; }

  bool atEnd()          { return sd == end; }
};


extern void slotIterator_init();
extern void slotIterator_scavenge_contents();
extern void slotIterator_gc_mark_contents();
extern void slotIterator_gc_unmark_contents();
extern void slotIterator_switch_pointers(oop from, oop to);
extern bool slotIterator_verify();
extern slotDesc block_slots[];
