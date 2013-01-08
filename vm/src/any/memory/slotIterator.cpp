/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "slotIterator.hh"
# include "_slotIterator.cpp.incl"

#if GENERATE_DEBUGGING_AIDS
SlotIterator *SlotIterator::blockIterator= 0;
fint SlotIterator::nActive= 0;
#endif

slotDesc block_slots[2];

void SlotIterator::init(Map *m) {
#if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions) {
    nActive++;
    if ((!bootstrapping && !GCInProgress) || ScavengeInProgress)
      // if compacting, map might not have been unmarked
      assert_map(m->enclosing_mapOop(), "not a map");
  }
#endif
  if (m->is_block()) {
#if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      assert(blockIterator==0, "conflict in use of block_slots");
      blockIterator= this;
    }
#endif
    sd= block_slots;
    end= block_slots + sizeof(block_slots)/sizeof(slotDesc);
    ((blockMap*)m)->setSlots();
  } else {
    sd= m->slots();
    end= sd + m->length_slots();
  }
}

// If you change the names or number of blocks slots, 
// change blockMap::find_slot too.
void slotIterator_init() {
  // block parent slot
  block_slots[0].name= VMString[PARENT];
  block_slots[0].type= parent_map_slotType;
  block_slots[0].data= Memory->blockTraitsObj;
  block_slots[0].annotation= Memory->slotAnnotationObj;

  // used and reused for value, value:, value:With:, etc..
  block_slots[1].name= stringOop(badOop);
  block_slots[1].type= map_slotType;
  block_slots[1].data= badOop;
  block_slots[1].annotation= Memory->slotAnnotationObj;
}

#define SLOT_ITERATOR_OOPS_DO(template)                         \
  template(&block_slots[0].name);                               \
  template(&block_slots[0].data);                               \
  template(&block_slots[0].annotation);                         \
  if (block_slots[1].name != stringOop(badOop))                 \
    template(&block_slots[1].name);                             \
  if (block_slots[1].data != badOop)                            \
    template(&block_slots[1].data);                             \
  template(&block_slots[1].annotation);

void slotIterator_scavenge_contents() { 
  SLOT_ITERATOR_OOPS_DO(SCAVENGE_TEMPLATE); }

void slotIterator_gc_mark_contents() { 
  SLOT_ITERATOR_OOPS_DO(MARK_TEMPLATE); }

void slotIterator_gc_unmark_contents() { 
  SLOT_ITERATOR_OOPS_DO(UNMARK_TEMPLATE); }

void slotIterator_switch_pointers(oop from, oop to) { 
  SLOT_ITERATOR_OOPS_DO(SWITCH_POINTERS_TEMPLATE); }

bool slotIterator_verify() { 
  bool verify_result = true;
  SLOT_ITERATOR_OOPS_DO(VERIFY_TEMPLATE);
  if (   block_slots[0].name != VMString[PARENT]
      || block_slots[0].type != parent_map_slotType
      || block_slots[0].data != Memory->blockTraitsObj
      || block_slots[0].annotation != Memory->slotAnnotationObj
      || block_slots[1].type != map_slotType
      || block_slots[1].annotation != Memory->slotAnnotationObj) {
    error("block slots corrupted");
    verify_result = false;
  }
  return verify_result;
}

