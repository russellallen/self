/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "clist.hh"
# include "_clist.cpp.incl"

CList* CList::prependList(CList* l) {
  assert(this != l || this == EMPTY, "prepending list to itself");
  if (l->isEmpty()) return this;
  l = l->copy();
  if (isEmpty()) return l;
  l->tail()->setNext(head());
  l->_tail = tail();
  return l;
}

CList* CList::appendList(CList* l) {
  assert(this != l || this == EMPTY, "appending list to itself");
  CList* c = this;
  for (CListElem* e = l->head(); e; e = e->next()) {
    c = c->append(e->data());
  }
  return c;
}

CList* CList::addList(CList* l) {
  assert(this != l || this == EMPTY, "adding list to itself");
  CList* c = this;
  for (CListElem* e = l->head(); e; e = e->next()) {
    c = c->add(e->data());
  }
  return c;
}

CList* CList::identityAddList(CList* l) {
  assert(this != l || this == EMPTY, "adding list to itself");
  CList* c = this;
  for (CListElem* e = l->head(); e; e = e->next()) {
    c = c->identityAdd(e->data());
  }
  return c;
}

CList* CList::copy() {
  CList* c = EMPTY;
  return c->appendList(this);
}

CListEntry* CList::realDeepCopy() {
  CList* c = EMPTY;
  for (CListElem* e = head(); e; e = e->next()) {
    if (e->data()) {
      c = c->append(e->data()->realDeepCopy());
    } else {
      c = c->append(e->data());
    }
  }
  return c;
}

CList* CList::reverse() {
  CList* r = EMPTY;
  for (CListElem* e = head(); e; e = e->next()) {
    CListEntry* x = e->data();
    r = r->prepend(x);
  }
  return r;
}

int32 CList::length() {
  int32 l = 0;
  for (CListElem* e = head(); e; e = e->next()) l++;
  return l;
}

CListEntry* CList::nth(fint i) {
  CListElem* e;
  for (e = head(); i--; e = e->next()) {
    assert(e, "nth past end of list");
  }
  assert(e, "nth past end of list");
  return e->data();
}

void CList::nthPut(fint i, CListEntry* d) {
  CListElem* e;
  for (e = head(); i--; e = e->next()) {
    assert(e, "nthPut past end of list");
  }
  assert(e, "nthPut past end of list");
  e->setData(d);
}

CListElem* CList::spliceOutNext(CListElem* pe) {
  CListElem* e;
  if (pe == 0) {
    e = head()->next();
    _head = e;
  } else {
    e = pe->next()->next();
    pe->setNext(e);
  }
  if (e == 0) {
    _tail = pe;
  }
  return e;
}

CList* CList::pop(fint count) {
  CList* l = EMPTY;
  while (count--) l = l->prepend(pop());
  return l;
}

bool CList::includes(CListEntry* d) {
  for (CListElem* e = head(); e; e = e->_next) {
    if (e->data()->EQ(d)) return true;
  }
  return false;
}

bool CList::includesList(CList* l) {
  if (this == l) return true;
  for (CListElem* e = l->head(); e; e = e->next()) {
    if (! includes(e->data())) return false;
  }
  return true;
}

bool CList::includesAny(CList* l) {
  if (this == l) return nonEmpty();
  for (CListElem* e = l->head(); e; e = e->next()) {
    if (includes(e->data())) return true;
  }
  return false;
}

bool CList::EQlist(CList* l) {
  if (this == l) return true;
  if (length() != l->length()) return false;
  for (CListElem* e = l->head(); e; e = e->next()) {
    if (! includes(e->data())) return false;
  }
  return true;
}

bool CList::identityIncludes(CListEntry* d) {
  for (CListElem* e = head(); e; e = e->_next) {
    if (e->data() == d) return true;
  }
  return false;
}

bool CList::identityIncludesList(CList* l) {
  if (this == l) return true;
  for (CListElem* e = l->head(); e; e = e->next()) {
    if (! identityIncludes(e->data())) return false;
  }
  return true;
}

bool CList::identityIncludesAny(CList* l) {
  if (this == l) return nonEmpty();
  for (CListElem* e = l->head(); e; e = e->next()) {
    if (identityIncludes(e->data())) return true;
  }
  return false;
}

bool CList::identityEQ(CList* l) {
  if (this == l) return true;
  if (length() != l->length()) return false;
  for (CListElem* e = l->head(); e; e = e->next()) {
    if (! identityIncludes(e->data())) return false;
  }
  return true;
}

void CList::remove(CListEntry* d) {
  for (CListElem* e = head(), *pe = 0; e; pe = e, e = e->next()) {
    if (e->data()->EQ(d)) {
      spliceOutNext(pe);
      break;
    }
  }
}

void CList::removeList(CList* l) {
  for (CListElem* e = l->head(); e; e = e->next()) {
    remove(e->data());
  }
}

void CList::identityRemove(CListEntry* d) {
  for (CListElem* e = head(), *pe = 0; e; pe = e, e = e->next()) {
    if (e->data() == d) {
      spliceOutNext(pe);
      break;
    }
  }
}

void CList::identityRemoveList(CList* l) {
  for (CListElem* e = l->head(); e; e = e->next()) {
    identityRemove(e->data());
  }
}

#ifdef UNUSED
CList* CList::intersection(CList* l, bool makeCopy) {
  CListElem* e = head(), *pe = 0;
  while (e) {
    CListEntry* x = e->data();
    if (! l->includes(x)) {
      if (makeCopy) {
        return copy()->intersection(l, false);
      }
      e = spliceOutNext(pe);
    } else {
      pe = e, e = e->next();
    }
  }
  return this;
}
#endif

CList* CList::identityIntersection(CList* l, bool makeCopy) {
  CListElem* e = head(), *pe = 0;
  while (e) {
    CListEntry* x = e->data();
    if (! l->identityIncludes(x)) {
      if (makeCopy) {
        return copy()->identityIntersection(l, false);
      }
      e = spliceOutNext(pe);
    } else {
      pe = e, e = e->next();
    }
  }
  return this;
}

# define DEFINE_ITERATOR(name,template)                                       \
    void CList::name {                                                        \
      for (CListElem* e = head(); e; e = e->next()) {                         \
        e->data()->template;                                                  \
      }                                                                       \
  }

DEFINE_ITERATOR(scavenge_contents(),scavenge_contents())
DEFINE_ITERATOR(gc_mark_contents(), gc_mark_contents())
DEFINE_ITERATOR(gc_unmark_contents(), gc_unmark_contents())
DEFINE_ITERATOR(verify(), verify())
DEFINE_ITERATOR(switch_pointers(oop from, oop to), switch_pointers(from,to))
DEFINE_ITERATOR(relocate(), relocate())
DEFINE_ITERATOR(oops_do(oopsDoFn f), oops_do(f))

