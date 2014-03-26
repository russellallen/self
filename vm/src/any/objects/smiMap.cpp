/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "enumeration.hh"
# include "generation_inline.hh"
# include "smiMap.hh"
# include "space_inline.hh"
# include "vmStrings.hh"

Map* smiMap::create_smiMap(oop parent) {
  slotList *s= new slotList(VMString[PARENT], 
                            parent_map_slotType,
                            parent,
                            Memory->slotAnnotationObj);
  smiMap m1;
  oop ignored;
  return create_map(sizeof(smiMap), s, &m1, &ignored);
}

void smiMap::print_string(oop obj, char* buf) {
  smiOop(obj)->print_string(buf);
}

void smiMap::print_oop(oop obj) {
  smiOop(obj)->print_oop();
}

void smiMap::print(oop obj) {
  if (obj->is_map()) {
    lprintf("smi ");
  } else {
    smiOop(obj)->print_oop();
    lprintf(": ");
  }
  immediateMap::print(obj);
}
