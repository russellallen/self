/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "stringMap.hh"
# include "_stringMap.cpp.incl"

void create_initial_strings(oop parent) {
  // create string map
  slotList* slist =
    new slotList(NULL, parent_map_slotType, parent); 
  stringMap m1;
  stringOop s;
  stringMap* m= (stringMap*) create_map(sizeof(stringMap), slist, &m1,
                                        (oop*)&s);
  assert(Memory->old_gen->objs_contains(s),
         "should be allocated in old space");

  s->set_length(0);
  s->set_bytes((char*) Memory->old_gen->empty_bytes_addr());
  Memory->stringObj = s;
  
  // add in initial empty string object
  Memory->string_table->add(s);

  // initialize vm strings -- can only do this after stringObj has been made
  vmStrings_init();
  
  // fill in empty parent slot name with "parent" VM string
  slotDesc* slot = m->slots();
  Memory->store((oop*)&slot->name, oop(VMString[PARENT]));
}

oop stringMap::clone(oop obj, bool mustAllocate, oop genObj) {
  Unused(mustAllocate); Unused(genObj);
  assert_string(obj, "object isn't a string");
  return obj;
}

oop stringMap::cloneSize(oop obj, fint len, bool mustAllocate, oop filler) {
  Unused(obj); Unused(len); Unused(mustAllocate); Unused(filler);
  ShouldNotCallThis(); // shouldn't be cloning/resizing a string
  return NULL;
}

oop stringMap::scavenge(oop obj) {
  Unused(obj);
  ShouldNotCallThis(); // shouldn't need to scavenge canonical strings
                       // (should be tenured)
  return NULL;
}

bool stringMap::verify(oop obj) {
  return stringOop(obj)->verify();
}

void stringMap::print_string(oop obj, char* buf) {
  /* sprintf breaks (why?)
  sprintf(buf, "'%*s'", 
          stringOop(obj)->length(), 
          stringOop(obj)->bytes());
  */
  buf[0] = '\'';
  fint n = stringOop(obj)->length();
  n = min(n, BUFSIZ - 3);
  strncpy(buf + 1, stringOop(obj)->bytes(), n);
  buf[ 1 + n ] = '\'';
  buf[ 2 + n ] = '\0';
}

void stringMap::print_oop(oop obj) {
  lprintf("'");
  stringOop(obj)->string_print();
  lprintf("'");
}

void stringMap::print(oop obj) {
  if (obj->is_map()) {
    lprintf("string ");
  } else {
    lprintf("'");
    stringOop(obj)->string_print();
    lprintf("' ");
  }
  byteVectorMap::print(obj);
}

int32 stringMap::debug_size(oop p) {
  return p->size() * oopSize + stringOop(p)->length();
}
  
