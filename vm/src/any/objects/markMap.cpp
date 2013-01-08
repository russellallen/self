/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "markMap.hh"
# include "_markMap.cpp.incl"

Map* markMap::create_markMap() {
  markMap m1;
  oop ignored;
  return create_map(sizeof(markMap), NULL, &m1, &ignored);
}

void markMap::print(oop obj) {
  if (obj->is_map()) {
    lprintf("mark ");
    Map::print(obj);
  } else {
    markOop(obj)->print();
  }
}
