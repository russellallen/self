/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "enumeration.hh"
# include "floatMap.hh"
# include "generation_inline.hh"
# include "space_inline.hh"
# include "vmStrings.hh"

DO_NOT_CROSS_COMPILE 
  
Map* floatMap::create_floatMap(oop parent) {
  slotList *s= new slotList(VMString[PARENT], 
                            parent_map_slotType,
                            parent,
                            Memory->slotAnnotationObj);
  floatMap m1;
  oop ignored;
  return create_map(sizeof(floatMap), s, &m1, &ignored);
}

void floatMap::print_string(oop obj, char* buf) {
  floatOop(obj)->print_string(buf);
}

void floatMap::print_oop(oop obj) {
  floatOop(obj)->print_oop();
}

void floatMap::print(oop obj) {
  if (obj->is_map()) {
    lprintf("float ");
  } else {
    floatOop(obj)->print_oop();
    lprintf(": ");
  }
  immediateMap::print(obj);
}
