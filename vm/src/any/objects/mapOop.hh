/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
#  pragma interface
# endif


static const fint enclosed_map_offset = sizeof(oopsOopClass) / oopSize; // words from start of object to embedded map

class mapOopClass: public oopsOopClass /* WARNING if you change oopsOopClass, fix enclosed_map_offset above */ {
 protected:
  //  really a whole Map (or subclass thereof) -- dmu 7/03
  void* _my_map; // WARNING: if not first in this class, fix enclosed_map_offset above
  
 public:
  // constructor
    
  // DO NOT USE THIS to get mapOop from Map*; use enclosing_mapOop -- dmu 7/03
  friend mapOop as_mapOop(void* p) { return mapOop(as_memOop(p)); }

  static mapOop enclosing_mapOop(Map* m) { 
    return as_mapOop( ((oop*)m) - enclosed_map_offset ); }
    
  // accessors
  mapOopClass* addr() { return (mapOopClass*) oopsOopClass::addr(); }
  Map*         map_addr() { return (Map*)&addr()->_my_map; }
  
  // copying operations
  mapOop copy(fint size, bool mustAllocate= true, oop genObj= NULL) {
    return mapOop(oopsOopClass::copy(size, mustAllocate, genObj)); }
  
  mapOop grow(fint size, fint delta, bool mustAllocate= true) {
    return mapOop(oopsOopClass::grow(size, delta, mustAllocate)); }
  mapOop shrink(fint size, fint delta, bool mustAllocate= true) {
    return mapOop(oopsOopClass::shrink(size, delta, mustAllocate)); }
  mapOop insert(fint size, fint change_point, fint delta,
                bool mustAllocate= true) {
    return mapOop(oopsOopClass::insert(size, change_point,
                                       delta, mustAllocate)); }
  mapOop remove(fint size, fint change_point, fint delta,
                bool mustAllocate= true) {
    return mapOop(oopsOopClass::remove(size, change_point,
                                       delta, mustAllocate)); }

  // conversion/recompilation support: equal() is true if the maps are
  // identical or both maps have been copied from the same block prototype
  // map
  bool equal(mapOop other);
};

