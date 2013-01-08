/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "table.hh"
# include "_table.cpp.incl"

TableElem* Table::find(CListEntry* k) {
  assert(k, "shouldn't be comparing zeros");
  for (TableListElem* e = head(); e; e = e->next()) {
    TableElem* d = e->data();
    assert(d->key, "shouldn't have a zero key");
    if (d->key->EQ(k)) {
      return d;
    }
  }
  return 0;
}

TableElem* Table::identityFind(CListEntry* k) {
  for (TableListElem* e = head(); e; e = e->next()) {
    TableElem* d = e->data();
    if (d->key == k) {
      return d;
    }
  }
  return 0;
}

TableElem* Table::findContents(CListEntry* v) {
  assert(v, "shouldn't be comparing zeros");
  for (TableListElem* e = head(); e; e = e->next()) {
    TableElem* d = e->data();
    if (d->value && d->value->EQ(v)) {
      return d;
    }
  }
  return 0;
}

TableElem* Table::identityFindContents(CListEntry* v) {
  for (TableListElem* e = head(); e; e = e->next()) {
    TableElem* d = e->data();
    if (d->value == v) {
      return d;
    }
  }
  return 0;
}

void Table::remove(CListEntry* k) {
  assert(k, "shouldn't be comparing zeros");
  for (TableListElem* e = head(), *pe = 0; e; pe = e, e = e->next()) {
    TableElem* d = e->data();
    assert(d->key, "shouldn't have a zero key");
    if (d->key->EQ(k)) {
      spliceOutNext(pe);
      break;
    }
  }
}

void Table::identityRemove(CListEntry* k) {
  for (TableListElem* e = head(), *pe = 0; e; pe = e, e = e->next()) {
    TableElem* d = e->data();
    if (d->key == k) {
      spliceOutNext(pe);
      break;
    }
  }
}

Table* Table::copy() {
  Table* t = EMPTY;
  for (TableListElem* e = head(); e; e = e->next()) {
    TableElem* d = e->data();
    t = t->append(new TableElem(d->key, d->value));
  }
  return t;
}

CListEntry* Table::realDeepCopy() {
  Table* t = EMPTY;
  for (TableListElem* e = head(); e; e = e->next()) {
    TableElem* d = e->data();
    t = t->append(new TableElem(d->key->realDeepCopy(), 
                                d->value->realDeepCopy()));
  }
  return t;
}
