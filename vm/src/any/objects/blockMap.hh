#pragma once
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "blockOop.hh"
# include "os_includes.hh"
# include "slotsMap.hh"
# include "vmStrings.hh"



// lexical parent (frame pointer) of prototype block
# define BLOCK_PROTO_SCOPE  as_smiOop(-1)
// initial scopeDesc value
# define BLOCK_PROTO_DESC  as_smiOop(-1)


class blockMap: public Map {
  friend class blockOopClass;
  friend class SCodeScope;
  // is static now
  // friend SCodeScope* scopeFromBlockMap(mapOop blockMap);
  friend class BlockPReg;
private:
  smiOop _desc;
  stringOop valueMethodName;
  slotsOop valueMethod;
public:
  // testers
  bool is_block()               { return true; }
  bool is_killable()            { return true; }
  VtblMapType vtblMapType() { return MAP_TYPE_NAME(blockMap); }
  
private:
  // hard-wired block accessors
  smiOop desc()                 { return _desc; }
  void setDesc(smiOop d)        { _desc= d; }
  blockMap *clone_and_set_desc(smiOop d) {
    blockMap* new_map = (blockMap*) copy();
    mapOop new_moop = new_map->enclosing_mapOop();
    new_moop->init_mark();
    new_map->setDesc(d);
    return new_map; }

public: // because map::init is public
  void init(stringOop name, slotsOop method);

private:
  void setSlots();

  friend class SlotIterator;
    
public:

  // programming
  // nothing in block object to change
  void switch_pointer(oop obj, oop* where, oop to) {
    Unused(obj); Unused(where); Unused(to); }
  void switch_pointer_in_map(  oop* where, oop to);

  fint size()                   { return sizeof(blockMap)/sizeof(oop); }

  slotDesc* slots();
  fint length_slots()           { return 0; }

  virtual slotDesc* find_slot(stringOop name);

  slotsOop  value()             { return valueMethod; }
  
  // constructor
  static blockOop create_block(slotsOop valueMethod);
  
  // cloning operations; users aren't allowed to clone blocks  -Urs
  oop clone(oop obj, bool mustAllocate= true, oop genObj= NULL) {
    Unused(mustAllocate); Unused(genObj);
    return obj; }
  bool can_inline_clone()       { return false; }

  // creation op
  oop fill_in_slots(slotList* slist, fint slotCount) {
    ShouldNotCallThis(); Unused(slist); Unused(slotCount); return badOop; }

  // size operations
  fint empty_object_size()        { return sizeof(blockOopClass) / oopSize; }
  fint object_size(oop obj)       { Unused(obj); return empty_object_size(); }

  // mirror operation
  mirrorOop mirror_proto()      { return Memory->blockMirrorObj; }
  oop mirror_parent(oop obj);

  // killable operations
  void    kill(oop p);
  bool is_live(oop p);

  // memory operations
  virtual oop scavenge(oop obj);
  bool verify(oop obj);
  
  // enumerating
  virtual bool is_enumerable(oop obj, oop* matching_cell) {
    Unused(obj); Unused(matching_cell);
    return false; }

  // printing operations
  void print(oop obj);
  oop dummy_obj(oop filler);

  // profiler operation
  void dummy_initialize(oop obj, oop filler);
};

static inline blockOop create_block(slotsOop valueMethod) {
  return blockMap::create_block(valueMethod);
}


inline void blockMap::setSlots() {
  block_slots[1].name= valueMethodName;
  block_slots[1].data= valueMethod; 
}

inline slotDesc* blockMap::slots() { setSlots(); return block_slots; }
