#pragma once
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "clist.hh"
# include "regs.hh"



class TableElem: public CListEntry {
 public:
  CListEntry* key;
  CListEntry* value;
  
  TableElem(CListEntry* k, CListEntry* v) { key = k; value = v; }
  ~TableElem() {
    if (key) delete key;
    if (value) delete value;
  }
  
  CListEntry* realDeepCopy() {
    return (CListEntry *)new TableElem(key->realDeepCopy(), 
                                       value->realDeepCopy());
  }
  void print_short();
  void print();
};

class TableIterator;

IdentityListTemplate(Table, TableElem*)

class Table: public TableList {
 public:
  friend class ::TableIterator;
  Table() {}
  Table(CListEntry* key, CListEntry* value)
    : TableList(new TableElem(key, value)) {}
  TableElem* find(CListEntry* k);
  TableElem* identityFind(CListEntry* k);
  TableElem* findContents(CListEntry* v);
  TableElem* identityFindContents(CListEntry* v);
  void remove(CListEntry* k);
  void identityRemove(CListEntry* k);
  Table* copy();
  CListEntry* realDeepCopy();
  Table* deepCopy() { 
    if (isEmpty()) {
      return EMPTY;
    } else {
      return (Table*)realDeepCopy(); 
    }
  }
  bool includes(CListEntry* k) { return find(k) != NULL; }
  bool identityIncludes(CListEntry* k) { return identityFind(k) != NULL; }
  bool contains(CListEntry* v) { return findContents(v) != NULL; }
  bool identityContains(CListEntry* v) {
    return identityFindContents(v) != NULL; }
  CListEntry* lookup(CListEntry* k) {
    TableElem* d = find(k);
    return d ? d->value : NULL; }
  CListEntry* identityLookup(CListEntry* k) {
    TableElem* d = identityFind(k);
    return d ? d->value : NULL; }
  Table* append(TableElem* e) { return (Table*) TableList::append(e); }
  Table* store(CListEntry* k, CListEntry* v) {
    TableElem* d = find(k);
    return d ? (d->value = v, this) : append(new TableElem(k, v)); }
  Table* storeNew(CListEntry* k, CListEntry* v) {
    assert(!includes(k), "shouldn't already be there");
    return append(new TableElem(k, v)); }
  Table* identityStore(CListEntry* k, CListEntry* v) {
    TableElem* d = identityFind(k);
    return d ? (d->value = v, this) : append(new TableElem(k, v)); }
  Table* identityStoreNew(CListEntry* k, CListEntry* v) {
    assert(!identityIncludes(k), "shouldn't already be there");
    return append(new TableElem(k, v)); }
  TableElem* first() { return (TableElem*) TableList::first(); }
  bool EQ(CListEntry* e) {
    Unused(e); ShouldNotCallThis(); // == not implemented for tables
    return false; }
  inline TableIterator* iterator();     // inlined below
};

class TableIterator: public ResourceObj {
 public:
  TableListElem* elem;
  
  TableIterator(Table* t) { elem = t->head(); }
  
  bool done() { return elem == NULL; }
  TableElem* data() {
    assert(!done(), "iteration done"); return (TableElem*) elem->data(); }
  void* next() {        // cfront wants a return value to use in a for stmt
    assert(!done(), "iteration done"); elem = elem->next(); return 0; }
};

inline TableIterator* Table::iterator() { return new TableIterator(this); }

# define ValueValueTableTemplate(nm, keyType, keyName, valueType, valueName)  \
    class CONC(nm,TableElem): public CListEntry {                             \
    public:                                                                   \
    keyType keyName;                                                          \
    valueType valueName;                                                      \
  };                                                                          \
                                                                              \
    class CONC(nm,TableIterator): public TableIterator {                            \
    public:                                                                   \
    CONC(nm,TableIterator) (Table* t) : TableIterator(t) {}                   \
    CONC(nm,TableElem)* data() {                                              \
    return (CONC(nm,TableElem)*) TableIterator::data(); }                     \
  };                                                                          \
                                                                              \
    class CONC(nm,TableListElem): public CListElem {                                \
    public:                                                                   \
    CONC(nm,TableListElem) (CListEntry* d, CListElem* n = NULL)               \
      : CListElem(d, n) {}                                                    \
    CONC(nm,TableElem)* data() {                                              \
    return (CONC(nm,TableElem)*) CListElem::data(); }                         \
    void setData(CONC(nm,TableElem)* d) { CListElem::setData(d); }            \
    CONC(nm,TableListElem)* next() {                                          \
    return (CONC(nm,TableListElem)*) CListElem::next(); }                     \
    void setNext(CONC(nm,TableListElem)* n) { CListElem::setNext(n); }        \
  };                                                                          \
                                                                              \
    class CONC(nm,Table): public Table {                                            \
    public:                                                                   \
    CONC(nm,Table)(keyType key, valueType value)                              \
    : Table((CListEntry*) key, (CListEntry*) value) {}                        \
    CONC(nm,Table)() {}                                                       \
    CONC(nm,TableListElem)* head() {                                          \
    return (CONC(nm,TableListElem)*) Table::head(); }                         \
    CONC(nm,TableElem)* find(keyType n) {                                     \
    return (CONC(nm,TableElem)*) Table::find((CListEntry*) n); }              \
    CONC(nm,TableElem)* findContents(valueType v) {                           \
    return (CONC(nm,TableElem)*) Table::findContents((CListEntry*) v); }      \
    valueType lookup(keyType n) {                                             \
    return (valueType) Table::lookup((CListEntry*) n); }                      \
    CONC(nm,Table)* store(keyType n, valueType t) {                           \
    return (CONC(nm,Table)*) Table::store((CListEntry*) n,                    \
    (CListEntry*) t); }                                                       \
    CONC(nm,Table)* storeNew(keyType n, valueType t) {                        \
    return (CONC(nm,Table)*) Table::storeNew((CListEntry*) n,                 \
    (CListEntry*) t); }                                                       \
    bool includes(keyType n) { return Table::includes((CListEntry*) n); }     \
    bool contains(valueType v) { return Table::contains((CListEntry*) v); }   \
    void remove(keyType n) { Table::remove((CListEntry*) n); }                \
    CONC(nm,TableListElem)* spliceOutNext(CONC(nm,TableListElem)* e) {        \
    return (CONC(nm,TableListElem)*)                                          \
    Table::spliceOutNext((TableListElem*) e); }                               \
    CONC(nm,Table)* copy() {                                                  \
    return (CONC(nm,Table)*) Table::copy(); }                                 \
    CONC(nm,Table)* deepCopy() {                                              \
    return (CONC(nm,Table)*) Table::deepCopy(); }                             \
    CONC(nm,TableElem)* first() {                                             \
    return (CONC(nm,TableElem)*) Table::first(); }                            \
    CONC(nm,TableIterator)* iterator() {                                      \
    return (CONC(nm,TableIterator)*) Table::iterator(); }                     \
  };

# define ValueIdentityTableTemplate(nm, keyType, keyName, valueType, valueName) \
    class CONC(nm,TableElem): public CListEntry {                                   \
    public:                                                                   \
    keyType keyName;                                                          \
    valueType valueName;                                                      \
  };                                                                          \
                                                                              \
    class CONC(nm,TableIterator): public TableIterator {                            \
    public:                                                                   \
    CONC(nm,TableIterator) (Table* t) : TableIterator(t) {}                   \
    CONC(nm,TableElem)* data() {                                              \
    return (CONC(nm,TableElem)*) TableIterator::data(); }                     \
  };                                                                          \
                                                                              \
    class CONC(nm,TableListElem): public CListElem {                                \
    public:                                                                   \
    CONC(nm,TableListElem) (CListEntry* d, CListElem* n = NULL)               \
      : CListElem(d, n) {}                                                    \
    CONC(nm,TableElem)* data() {                                              \
    return (CONC(nm,TableElem)*) CListElem::data(); }                         \
    void setData(CONC(nm,TableElem)* d) { CListElem::setData(d); }            \
    CONC(nm,TableListElem)* next() {                                          \
    return (CONC(nm,TableListElem)*) CListElem::next(); }                     \
    void setNext(CONC(nm,TableListElem)* n) { CListElem::setNext(n); }        \
  };                                                                          \
                                                                              \
    class CONC(nm,Table): public Table {                                            \
    public:                                                                   \
    CONC(nm,Table)(keyType key, valueType value)                              \
    : Table((CListEntry*) key, (CListEntry*) value) {}                        \
    CONC(nm,Table)() {}                                                       \
    CONC(nm,TableListElem)* head() {                                          \
    return (CONC(nm,TableListElem)*) Table::head(); }                         \
    CONC(nm,TableElem)* find(keyType n) {                                     \
    return (CONC(nm,TableElem)*) Table::find((CListEntry*) n); }              \
    CONC(nm,TableElem)* findContents(valueType v) {                           \
    return (CONC(nm,TableElem)*)                                              \
    Table::identityFindContents((CListEntry*) v); }                           \
    valueType lookup(keyType n) {                                             \
    return (valueType) Table::lookup((CListEntry*) n); }                      \
    CONC(nm,Table)* store(keyType n, valueType t) {                           \
    return (CONC(nm,Table)*) Table::store((CListEntry*) n,                    \
    (CListEntry*) t); }                                                       \
    CONC(nm,Table)* storeNew(keyType n, valueType t) {                        \
    return (CONC(nm,Table)*) Table::storeNew((CListEntry*) n,                 \
    (CListEntry*) t); }                                                       \
    bool includes(keyType n) { return Table::includes((CListEntry*) n); }     \
    bool contains(valueType v) {                                              \
    return Table::identityContains((CListEntry*) v); }                        \
    void remove(keyType n) { Table::remove((CListEntry*) n); }                \
    CONC(nm,TableListElem)* spliceOutNext(CONC(nm,TableListElem)* e) {        \
    return (CONC(nm,TableListElem)*)                                          \
    Table::spliceOutNext((TableListElem*) e); }                               \
    CONC(nm,Table)* copy() {                                                  \
    return (CONC(nm,Table)*) Table::copy(); }                                 \
    CONC(nm,TableElem)* first() {                                             \
    return (CONC(nm,TableElem)*) Table::first(); }                            \
    CONC(nm,TableIterator)* iterator() {                                      \
    return (CONC(nm,TableIterator)*) Table::iterator(); }                     \
  };

# define IdentityValueTableTemplate(nm, keyType, keyName, valueType, valueName) \
    class CONC(nm,TableElem): public CListEntry {                                   \
    public:                                                                   \
    keyType keyName;                                                          \
    valueType valueName;                                                      \
  };                                                                          \
                                                                              \
    class CONC(nm,TableIterator): public TableIterator {                            \
    public:                                                                   \
    CONC(nm,TableIterator) (Table* t) : TableIterator(t) {}                   \
    CONC(nm,TableElem)* data() {                                              \
    return (CONC(nm,TableElem)*) TableIterator::data(); }                     \
  };                                                                          \
                                                                              \
    class CONC(nm,TableListElem): public CListElem {                                \
    public:                                                                   \
    CONC(nm,TableListElem) (CListEntry* d, CListElem* n = NULL)               \
      : CListElem(d, n) {}                                                    \
    CONC(nm,TableElem)* data() {                                              \
    return (CONC(nm,TableElem)*) CListElem::data(); }                         \
    void setData(CONC(nm,TableElem)* d) { CListElem::setData(d); }            \
    CONC(nm,TableListElem)* next() {                                          \
    return (CONC(nm,TableListElem)*) CListElem::next(); }                     \
    void setNext(CONC(nm,TableListElem)* n) { CListElem::setNext(n); }        \
  };                                                                          \
                                                                              \
    class CONC(nm,Table): public Table {                                            \
    public:                                                                   \
    CONC(nm,Table)(keyType key, valueType value)                              \
    : Table((CListEntry*) key, (CListEntry*) value) {}                        \
    CONC(nm,Table)() {}                                                       \
    CONC(nm,TableListElem)* head() {                                          \
    return (CONC(nm,TableListElem)*) Table::head(); }                         \
    CONC(nm,TableElem)* find(keyType n) {                                     \
    return (CONC(nm,TableElem)*) Table::identityFind((CListEntry*) n); }      \
    CONC(nm,TableElem)* findContents(valueType v) {                           \
    return (CONC(nm,TableElem)*) Table::findContents((CListEntry*) v); }      \
    valueType lookup(keyType n) {                                             \
    return (valueType) Table::identityLookup((CListEntry*) n); }              \
    CONC(nm,Table)* store(keyType n, valueType t) {                           \
    return (CONC(nm,Table)*) Table::identityStore((CListEntry*) n,            \
    (CListEntry*) t); }                                                       \
    CONC(nm,Table)* storeNew(keyType n, valueType t) {                        \
    return (CONC(nm,Table)*) Table::identityStoreNew((CListEntry*) n,         \
    (CListEntry*) t); }                                                       \
    bool includes(keyType n) {                                                \
    return Table::identityIncludes((CListEntry*) n); }                        \
    bool contains(valueType v) { return Table::contains((CListEntry*) v); }   \
    void remove(keyType n) { Table::identityRemove((CListEntry*) n); }        \
    CONC(nm,TableListElem)* spliceOutNext(CONC(nm,TableListElem)* e) {        \
    return (CONC(nm,TableListElem)*)                                          \
    Table::spliceOutNext((TableListElem*) e); }                               \
    CONC(nm,Table)* copy() {                                                  \
    return (CONC(nm,Table)*) Table::copy(); }                                 \
    CONC(nm,TableElem)* first() {                                             \
    return (CONC(nm,TableElem)*) Table::first(); }                            \
    CONC(nm,TableIterator)* iterator() {                                      \
    return (CONC(nm,TableIterator)*) Table::iterator(); }                     \
  };

# define IdentityIdentityTableTemplate(                                       \
    nm, keyType, keyName, valueType, valueName)                               \
                                                                              \
    class CONC(nm,TableElem): public CListEntry {                                   \
    public:                                                                   \
    keyType keyName;                                                          \
    valueType valueName;                                                      \
  };                                                                          \
                                                                              \
    class CONC(nm,TableIterator): public TableIterator {                            \
    public:                                                                   \
    CONC(nm,TableIterator) (Table* t) : TableIterator(t) {}                   \
    CONC(nm,TableElem)* data() {                                              \
    return (CONC(nm,TableElem)*) TableIterator::data(); }                     \
  };                                                                          \
                                                                              \
    class CONC(nm,TableListElem): public CListElem {                                \
    public:                                                                   \
    CONC(nm,TableListElem) (CListEntry* d, CListElem* n = NULL)               \
      : CListElem(d, n) {}                                                    \
    CONC(nm,TableElem)* data() {                                              \
    return (CONC(nm,TableElem)*) CListElem::data(); }                         \
    void setData(CONC(nm,TableElem)* d) { CListElem::setData(d); }            \
    CONC(nm,TableListElem)* next() {                                          \
    return (CONC(nm,TableListElem)*) CListElem::next(); }                     \
    void setNext(CONC(nm,TableListElem)* n) { CListElem::setNext(n); }        \
  };                                                                          \
                                                                              \
    class CONC(nm,Table): public Table {                                            \
    public:                                                                   \
    CONC(nm,Table)(keyType key, valueType value)                              \
    : Table((CListEntry*) key, (CListEntry*) value) {}                        \
    CONC(nm,Table)() {}                                                       \
    CONC(nm,TableListElem)* head() {                                          \
    return (CONC(nm,TableListElem)*) Table::head(); }                         \
    CONC(nm,TableElem)* find(keyType n) {                                     \
    return (CONC(nm,TableElem)*) Table::identityFind((CListEntry*) n); }      \
    CONC(nm,TableElem)* findContents(valueType v) {                           \
    return (CONC(nm,TableElem)*)                                              \
    Table::identityFindContents((CListEntry*) v); }                           \
    valueType lookup(keyType n) {                                             \
    return (valueType) Table::identityLookup((CListEntry*) n); }              \
    CONC(nm,Table)* store(keyType n, valueType t) {                           \
    return (CONC(nm,Table)*) Table::identityStore((CListEntry*) n,            \
    (CListEntry*) t); }                                                       \
    CONC(nm,Table)* storeNew(keyType n, valueType t) {                        \
    return (CONC(nm,Table)*) Table::identityStoreNew((CListEntry*) n,         \
    (CListEntry*) t); }                                                       \
    bool includes(keyType n) {                                                \
    return Table::identityIncludes((CListEntry*) n); }                        \
    bool contains(valueType v) {                                              \
    return Table::identityContains((CListEntry*) v); }                        \
    void remove(keyType n) { Table::identityRemove((CListEntry*) n); }        \
    CONC(nm,TableListElem)* spliceOutNext(CONC(nm,TableListElem)* e) {        \
    return (CONC(nm,TableListElem)*)                                          \
    Table::spliceOutNext((TableListElem*) e); }                               \
    CONC(nm,Table)* copy() {                                                  \
    return (CONC(nm,Table)*) Table::copy(); }                                 \
    CONC(nm,Table)* deepCopy() {                                              \
    return (CONC(nm,Table)*) Table::deepCopy(); }                             \
    CONC(nm,TableElem)* first() {                                             \
    return (CONC(nm,TableElem)*) Table::first(); }                            \
    CONC(nm,TableIterator)* iterator() {                                      \
    return (CONC(nm,TableIterator)*) Table::iterator(); }                     \
  };

IdentityIdentityTableTemplate(OopOop, oop, oop1, oop, oop2)
