/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "slotList.hh"
# include "_slotList.cpp.incl"

slotList* slotList::add(stringOop name, slotType type, oop contents, oop anno)
{
  if (this == NULL) {
    // empty list
    return new slotList(name, type, contents, anno);
  }

  if (name->cmp(this->name()) < 0)
    return new slotList(name, type, contents, anno, this);

  slotList* prev;
  slotList* l= this;
  do {
    prev= l;
    l= l->next;
  } while (l && l->name()->cmp(name) < 0);
  // insert
  prev->next= new slotList(name, type, contents, anno, l);
  return this;
}


fint slotList::length() {
  fint c = 0;
  for (slotList* l = this; l; l = l->next) c ++;
  return c;
}

fint slotList::obj_count() {
  fint c = 0;
  for (slotList* l = this; l; l = l->next) {
    if (l->type()->is_obj_slot()) c ++;
  }
  return c;
}

void slotList::oops_do(oopsDoFn f) {
  for (slotList* l= this; l; l= l->next) {
    (*f)((oop*)&l->desc.name);
    (*f)(      &l->desc.data);
    (*f)(      &l->desc.annotation);
  }
}
