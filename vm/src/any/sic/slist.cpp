/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

#ifdef SIC_COMPILER

# pragma implementation "slist.hh"
# include "_slist.cpp.incl"
  
  SListElem* SList::findL(void* p) {
    for (SListElem* e = headL(); e; e = e->nextL()) {
      if (e->dataL() == p) return e;
    }
    return 0;
  }
  
  SListElem* SList::findL(void* token, slistFindFn f) {
    for (SListElem* e = headL(); e; e = e->nextL()) {
      if (f(token, e->dataL())) return e;
    }
    return 0;
  }
  
  void* SList::nthL(fint n) {
    assert(n < length(), "non-existing element");
    SListElem* e = headL();
    for (fint i = 0; i < n; i++, e = e->nextL()) ;
    return e->dataL();
  }
  
  void SList::insertAfterL(SListElem* e, void* d) {
    if (e == tailL()) {
      appendL(d);
    } else if (e == 0) {
      prependL(d);
    } else {
      SListElem* newe = new SListElem(d, e->nextL());
      e->setNextL(newe);
      _len++;
    }
  }

  void SList::removeAfterL(SListElem* e) {
    if (e == 0) {
      removeHeadL();
    } else {
      SListElem* deletee = e->nextL();
      e->_next = deletee->nextL();
      if (deletee == tailL()) _tail = e;
      _len--;
    }
  }

  void SList::removeL(void* p) {
    SListElem *e, *prev = 0;
    for (e = headL(); e && e->dataL() != p;
         prev = e, e = e->nextL()) ;
    if (e == 0) fatal("not in list");
    removeAfterL(prev);
    assert(!includesL(p), "remove doesn't work");
  }
  
  void SList::applyL(void f(void*)) {
    SListElem* nexte;   // to permit removing during iteration
    for (SListElem* e = headL(); e; e = nexte) {
      nexte = e->nextL();
      f(e->dataL());
    }
  }

  void SList::print_short() { lprintf("SList %#lx", (unsigned long)this); }

  static void print_them(void* p) {
    ((VMObj*)p)->print_short(); lprintf(" ");
  }
  
  void SList::print() {
    print_short(); lprintf(": ");
    applyL(print_them);
  }
# endif
