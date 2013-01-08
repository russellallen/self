/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "slot.hh"
# include "_slot.cpp.incl"

# define CHECK(e)                                                             \
    if ((e) == 0) return 0
  
  slotList* Slot::make_list(slotList* slots, fint& index) {
    preservedObj ps(slots);                  // for scavenging!
    oop contents = slot_contents(index);     // this may run Self!!
    if (!contents->is_mark()) {
      return slots->add(new_string(name->AsCharP()), 
                        slot_type(),
                        contents, 
                        *annotation == '\0'
                         ? Memory->slotAnnotationObj
                         : new_string(annotation));
    } else {
      return 0;
    }
  }


void Slot::Print() {
  name->Print();
}

fint SlotList::ArgCount() {
  fint n = 0;
  for (SlotListElement* e = Head(); e; e = e->Next()) {
    if (e->Data()->IsArgSlot()) n++;
  }
  return n;
}

bool SlotList::make_list(slotList* &s) {    // turns the Slots into oops
  fint index = 0;
  s = EMPTY;
  for (SlotListElement* e = Head(); e; e = e->Next()) {
    s = e->Data()->make_list(s, index);
    CHECK(s);
  }
  return true;
}


SlotList* SlotList::Append(Slot* elem, Parser* parser) {
  for (SlotListElement* e = Head();  e;  e = e->Next()) {
    if (elem->collides(e->Data())) {
      char errmsg[255];
      sprintf(errmsg, "slot %s already defined", elem->name->AsCharP());
      parser->syntaxError(errmsg, elem->startToken);
      return 0;
    }
  }
  return (SlotList*) List::Append(elem);
}


void ArgSlot::Print() {
  lprintf(":");
  name->Print();
}


Object* ArgSlotList::AddArgs(Object* b, Parser* parser) {
  for (ArgSlotListElement* e = Head(); e && b; e = e->Next()) {
    if (b->AddArg(e->Data(), parser) == 0) return 0;
  }
  return b;
}


void DataSlot::Print() {
  Slot::Print();
  if (is_parent) lprintf("*");
  if (expr) {
    lprintf(assignable ? " <- " : " = ");
    expr->Print();
  }
}


void DataSlot::addCommentAnnotations(Scanner* scanner) {
  if (expr) expr->addCommentAnnotations(scanner);
}
