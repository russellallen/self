/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "list.hh"
# include "_list.cpp.incl"


List* List::Append(ParseNode* e) {
  ListElement* le = new ListElement(e);
  if (tail) {
    tail->SetNext(le);
  } else {
    head = le;
  }
  tail = le;
  return this;
}

fint List::Length() {
  fint count = 0;
  for (ListElement* e = Head(); e; e = e->Next()) {
    count ++;
  }
  return count;
}

void List::PrintSeparatedBy(char* sep) {
  for (ListElement* e = Head(); e; e = e->Next()) {
    e->Print();
    if (sep) lprintf("%s", sep);
  }
}

bool List::GenByteCodes(AbstractByteCode* b, Object* parent, bool isExpr) {
  Unused(isExpr);
  for (ListElement* e = Head(); e; e = e->Next()) {
    if (! e->Data()->GenByteCodes(b, parent)) return false;
  }
  return true;
}


void List::addCommentAnnotations(Scanner* scanner) {
  for (ListElement* e = Head(); e; e = e->Next())
   e->Data()->addCommentAnnotations(scanner);
}

void List::oops_do(oopsDoFn f) {
  for (ListElement* e = Head(); e; e = e->Next())
    e->oops_do(f);
}

