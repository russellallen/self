/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


inline int32 addressHash(void* v, int32 m) {
  return lowerBits(smi(v) >> 5, m);
}

enum { tcCList = 4000 };

class Clist;

class CListEntry: public ResourceObj {
 public:
  virtual bool EQ(CListEntry* e) { return this == e; }
  
  int32 identityHash(int32 m) {
    // use address as source of hash for identity hash tables
    return addressHash(this, m); }
  virtual CListEntry* realDeepCopy() { return this; }
  CListEntry* deepCopy() { return realDeepCopy(); }

  // memory operations - only here because it's now possible for ResourceObjs
  // to reside in the CHeap.
  virtual void scavenge_contents() { }
  virtual void gc_mark_contents() { }
  virtual void gc_unmark_contents() { }
  virtual void verify() { }
  virtual void switch_pointers(oop from, oop to) { Unused(from); Unused(to); }
  virtual void relocate() { }

  virtual void oops_do(oopsDoFn f) { Unused((void*)f); }
};  

class HashTableKey: public CListEntry {
 public:
  virtual int32 hash(int32 m) { return identityHash(m); }
};

class CListElem: public ResourceObj {
 public:
  CListEntry* _data;
  CListElem* _next;
  
  CListElem(CListEntry* d, CListElem* n = NULL) { _data = d; _next = n; }
  ~CListElem() {
    delete _data;
    if (_next) {
      delete _next;
    }
  }
  
  CListEntry* data() { return _data; }
  void setData(CListEntry* d) { _data = d; }
  
  CListElem* next() { return _next; }
  void setNext(CListElem* n) { _next = n; }
  
  void insertAfter(CListEntry* d) { _next = new CListElem(d, _next); }
};

class CList: public CListEntry {
 public:
  CListElem* _head;
  CListElem* _tail;
  
  CList(CListEntry* d, CList* l) {
    _head = _tail = new CListElem(d); appendList(l); }
  CList() { _head = _tail = NULL; }
  CList(CListEntry* d) { _head = _tail = new CListElem(d); }
  CList(CListEntry* d1, CListEntry* d2) {
    _tail = new CListElem(d2); _head = new CListElem(d1, _tail); }
  CList(CListEntry* d1, CListEntry* d2, CListEntry* d3) {
    _tail = new CListElem(d3);
    _head = new CListElem(d1, new CListElem(d2, _tail)); }
  CList(CListEntry* d1, CListEntry* d2, CListEntry* d3, CListEntry* d4) {
    _tail = new CListElem(d4);
    _head = new CListElem(d1, new CListElem(d2, new CListElem(d3, _tail))); }
  CList(CListEntry* d1, CListEntry* d2, CListEntry* d3, CListEntry* d4,
        CListEntry* d5) {
    _tail = new CListElem(d5);
    _head =
      new CListElem(d1,
                    new CListElem(d2,
                                  new CListElem(d3,
                                                new CListElem(d4, _tail)))); }
  ~CList() {
    if (this) {
      delete _head;
      _head = _tail = NULL;
    }
  }
  
  CList* prepend(CListEntry* d) {
    if (this == EMPTY) {
      return new CList(d);
    } else {
      _head = new CListElem(d, _head);
      if (_tail == NULL) {
        _tail = _head;
      }
      return this;
    } }
  CList* prependList(CList* l);
  CList* append(CListEntry* d) {
    CListElem* e;
    if (this == EMPTY) {
      return new CList(d);
    } else {
      e = new CListElem(d);
      if (_tail == NULL) {
        _head = _tail = e;
      } else {
        _tail->_next = e;
        _tail = e;
      }
      return this;
    } }
  CList* appendList(CList* l);
  
  CListElem* head() { return this ? _head : NULL; }
  void setHead(CListElem* h) { _head = h; }
  CListElem* tail() { return this ? _tail : NULL; }
  void setTail(CListElem* t) {
    assert(t || !_head, "probably doesn't do what you want; use appendList");
    _tail = t;}
  
  CList* copy();
  CListEntry* realDeepCopy();
  CList* deepCopy() { 
    if (isEmpty()) {
      return EMPTY;
    } else {
      return (CList*)realDeepCopy();
    }
  }
  CList* reverse();

  // memory operations - needed for ResourceObjs that have been allocated in
  // the CHeap.
  void scavenge_contents();
  void gc_mark_contents();
  void gc_unmark_contents();
  void verify();
  void switch_pointers(oop from, oop to);
  void relocate();

  void oops_do(oopsDoFn f);

  bool isEmpty() { return this == EMPTY || _head == NULL; }
  bool nonEmpty() { return ! isEmpty(); }
  
  bool isSingleton() {
    return this != EMPTY && _head != NULL && _head == _tail; }
  bool nonSingleton() { return !isSingleton(); }
  
  int32 length();
  
  CListEntry* nth(fint i);
  void nthPut(fint i, CListEntry* d);
  
  CListEntry* first() { return head()->data(); }
  CListEntry* second() { return head()->next()->data(); }
  CListEntry* last() { return tail()->data(); }
  
  bool includes(CListEntry* d);
  bool includesList(CList* l);
  bool includesAny(CList* l);
  bool EQ(CListEntry* l) { return EQlist((CList*) l); }
  bool EQlist(CList* l);
  
  bool identityIncludes(CListEntry* d);
  bool identityIncludesList(CList* l);
  bool identityIncludesAny(CList* l);
  bool identityEQ(CList* l);
  bool identityNE(CList* l) { return !identityEQ(l); }
  
  CList* add(CListEntry* d) { return includes(d) ? this : append(d); }
  CList* addList(CList* l);
  
  CList* identityAdd(CListEntry* d) {
    return identityIncludes(d) ? this : append(d); }
  CList* identityAddList(CList* l);
  
  void remove(CListEntry* d);
  void removeList(CList* l);
  
  void identityRemove(CListEntry* d);
  void identityRemoveList(CList* l);
  
# ifdef UNUSED
  CList* intersection(CList* l, bool makeCopy);
# endif
  CList* identityIntersection(CList* l, bool makeCopy);
  
  CListElem* spliceOutNext(CListElem* e);
  
  CListEntry* removeHead() {
    assert(nonEmpty(), "removing from an empty list");
    CListEntry* d = first();
    spliceOutNext(NULL);
    return d; }
  
  CList* push(CListEntry* d) { return prepend(d); }
  CList* pushList(CList* l) { return prependList(l); }
  CListEntry* pop() { return removeHead(); }
  CList* pop(fint count);

  void print();
  void print_short();
};

# define ListTemplate(name,dataType)                                          \
    class CONC(name,ListElem): public CListElem {                            \
     public:                                                                  \
      CONC(name,ListElem)(dataType d, CONC(name,ListElem)* n = NULL)            \
    : CListElem((CListEntry*) d, (CListElem*) n) {}                           \
                                                                              \
    dataType data() { return (dataType) CListElem::data(); }                  \
    void setData(dataType d) { CListElem::setData((CListEntry*) d); }         \
                                                                              \
    CONC(name,ListElem)* next() {                                             \
    return (CONC(name,ListElem)*) CListElem::next(); }                        \
    void setNext(CONC(name,ListElem)* n) { CListElem::setNext(n); }           \
                                                                              \
    void insertAfter(dataType d) { CListElem::insertAfter((CListEntry*) d); } \
  };                                                                          \
                                                                              \
  class CONC(name,List): public CList {                                             \
  public:                                                                     \
    CONC(name,List)(dataType d, CONC(name,List)* l)                           \
    : CList((CListEntry*) d, (CList*) l) {}                                   \
    CONC(name,List)() {}                                                      \
    CONC(name,List)(dataType d) : CList((CListEntry*) d) {}                   \
    CONC(name,List)(dataType d1, dataType d2)                                 \
    : CList((CListEntry*) d1, (CListEntry*) d2) {}                            \
    CONC(name,List)(dataType d1, dataType d2, dataType d3)                    \
    : CList((CListEntry*) d1, (CListEntry*) d2, (CListEntry*) d3) {}          \
    CONC(name,List)(dataType d1, dataType d2, dataType d3, dataType d4)       \
    : CList((CListEntry*) d1, (CListEntry*) d2, (CListEntry*) d3,             \
    (CListEntry*) d4) {}                                                      \
    CONC(name,List)(dataType d1, dataType d2, dataType d3, dataType d4,       \
    dataType d5)                                                              \
    : CList((CListEntry*) d1, (CListEntry*) d2, (CListEntry*) d3,             \
    (CListEntry*) d4, (CListEntry*) d5) {}                                    \
                                                                              \
    CONC(name,ListElem)* head() {                                             \
    return (CONC(name,ListElem)*) CList::head(); }                            \
    void setHead(CONC(name,ListElem)* h) {                                    \
    CList::setHead((CONC(name,ListElem)*) h); }                               \
    CONC(name,ListElem)* tail() {                                             \
    return (CONC(name,ListElem)*) CList::tail(); }                            \
    void setTail(CONC(name,ListElem)* t) {                                    \
    CList::setTail((CONC(name,ListElem)*) t); }                               \
                                                                              \
    dataType first() { return (dataType) CList::first(); }                    \
    dataType second() { return (dataType) CList::second(); }                  \
    dataType last() { return (dataType) CList::last(); }                      \
                                                                              \
    CONC(name,List)* prepend(dataType d) {                                    \
    return (CONC(name,List)*) CList::prepend((CListEntry*) d); }              \
    CONC(name,List)* prepend(CONC(name,List)* l) {                            \
    return (CONC(name,List)*) CList::prependList((CList*) l); }               \
    CONC(name,List)* append(dataType d) {                                     \
    return (CONC(name,List)*) CList::append((CListEntry*) d); }               \
    CONC(name,List)* append(CONC(name,List)* l) {                             \
    return (CONC(name,List)*) CList::appendList((CList*) l); }                \
                                                                              \
    CONC(name,List)* copy() { return (CONC(name,List)*) CList::copy(); }      \
    CONC(name,List)* deepCopy() {                                             \
      return (CONC(name,List)*) CList::deepCopy(); }                          \
    CONC(name,List)* reverse() {                                              \
      return (CONC(name,List)*) CList::reverse(); }                           \
                                                                              \
    dataType nth(fint i) { return (dataType) CList::nth(i); }                 \
    void nthPut(fint i, dataType d) { CList::nthPut(i, (CListEntry*) d); }    \
                                                                              \
    bool includes(dataType d) { return CList::includes((CListEntry*) d); }    \
    bool includes(CONC(name,List)* l) {                                       \
    return CList::includesList((CList*) l); }                                 \
    bool includesAny(CONC(name,List)* l) {                                    \
    return CList::includesAny((CList*) l); }                                  \
                                                                              \
    CONC(name,List)* add(dataType d) {                                        \
    return (CONC(name,List)*) CList::add((CListEntry*) d); }                  \
    CONC(name,List)* add(CONC(name,List)* l) {                                \
    return (CONC(name,List)*) CList::addList((CList*) l); }                   \
                                                                              \
    CONC(name,ListElem)* spliceOutNext(CONC(name,ListElem)* e) {              \
    return (CONC(name,ListElem)*) CList::spliceOutNext((CListElem*) e); }     \
    void remove(dataType d) { CList::remove((CListEntry*) d); }               \
    void remove(CONC(name,List)* l) { CList::removeList((CList*) l); }        \
                                                                              \
    dataType removeHead() { return (dataType) CList::removeHead(); }          \
                                                                              \
    CONC(name,List)* push(dataType d) {                                       \
    return (CONC(name,List)*) CList::push((CListEntry*) d); }                 \
    CONC(name,List)* push(CONC(name,List)* l) {                               \
    return (CONC(name,List)*) CList::pushList(l); }                           \
    dataType pop() { return (dataType) CList::pop(); }                        \
    CONC(name,List)* pop(fint count) {                                        \
    return (CONC(name,List)*) CList::pop(count); }                            \
  };

// this was part of the interface
#ifdef UNUSED
    CONC(name,List)* intersection(CONC(name,List)* l, bool makeCopy = true) { \
    return (CONC(name,List)*) CList::intersection(l, makeCopy); }             \

#endif 

# define IdentityListTemplate(name,dataType)                                  \
    class CONC(name,ListElem): public CListElem {                            \
    public:                                                                   \
    CONC(name,ListElem)(dataType d, CONC(name,ListElem)* n = NULL)            \
    : CListElem((CListEntry*) d, (CListElem*) n) {}                           \
                                                                              \
    dataType data() { return (dataType) CListElem::data(); }                  \
    void setData(dataType d) { CListElem::setData((CListEntry*) d); }         \
                                                                              \
    CONC(name,ListElem)* next() {                                             \
    return (CONC(name,ListElem)*) CListElem::next(); }                        \
    void setNext(CONC(name,ListElem)* n) { CListElem::setNext(n); }           \
                                                                              \
    void insertAfter(dataType d) { CListElem::insertAfter((CListEntry*) d); } \
  };                                                                          \
                                                                              \
  class CONC(name,List): public CList {                                             \
    public:                                                                   \
    CONC(name,List)(dataType d, CONC(name,List)* l)                           \
    : CList((CListEntry*) d, (CList*) l) {}                                   \
    CONC(name,List)() {}                                                      \
    CONC(name,List)(dataType d)                                               \
      : CList((CListEntry*) d) {}                                             \
    CONC(name,List)(dataType d1, dataType d2)                                 \
    : CList((CListEntry*) d1, (CListEntry*) d2) {}                            \
    CONC(name,List)(dataType d1, dataType d2, dataType d3)                    \
    : CList((CListEntry*) d1, (CListEntry*) d2, (CListEntry*) d3) {}          \
    CONC(name,List)(dataType d1, dataType d2, dataType d3, dataType d4)       \
    : CList((CListEntry*) d1, (CListEntry*) d2, (CListEntry*) d3,             \
    (CListEntry*) d4) {}                                                      \
    CONC(name,List)(dataType d1, dataType d2, dataType d3, dataType d4,       \
    dataType d5)                                                              \
    : CList((CListEntry*) d1, (CListEntry*) d2, (CListEntry*) d3,             \
    (CListEntry*) d4, (CListEntry*) d5) {}                                    \
                                                                              \
    CONC(name,ListElem)* head() {                                             \
    return (CONC(name,ListElem)*) CList::head(); }                            \
    void setHead(CONC(name,ListElem)* t) {                                    \
    CList::setHead((CONC(name,ListElem)*) t); }                               \
    CONC(name,ListElem)* tail() {                                             \
    return (CONC(name,ListElem)*) CList::tail(); }                            \
    void setTail(CONC(name,ListElem)* t) {                                    \
    CList::setTail((CONC(name,ListElem)*) t); }                               \
                                                                              \
    dataType first() { return (dataType) CList::first(); }                    \
    dataType second() { return (dataType) CList::second(); }                  \
    dataType last() { return (dataType) CList::last(); }                      \
                                                                              \
    CONC(name,List)* prepend(dataType d) {                                    \
    return (CONC(name,List)*) CList::prepend((CListEntry*) d); }              \
    CONC(name,List)* prepend(CONC(name,List)* l) {                            \
    return (CONC(name,List)*) CList::prependList((CList*) l); }               \
    CONC(name,List)* append(dataType d) {                                     \
    return (CONC(name,List)*) CList::append((CListEntry*) d); }               \
    CONC(name,List)* append(CONC(name,List)* l) {                             \
    return (CONC(name,List)*) CList::appendList((CList*) l); }                \
                                                                              \
    CONC(name,List)* copy() { return (CONC(name,List)*) CList::copy(); }      \
    CONC(name,List)* reverse() {                                              \
      return (CONC(name,List)*) CList::reverse(); }                           \
                                                                              \
    dataType nth(fint i) { return (dataType) CList::nth(i); }                 \
    void nthPut(fint i, dataType d) { CList::nthPut(i, (CListEntry*) d); }    \
                                                                              \
    bool includes(dataType d) {                                               \
    return CList::identityIncludes((CListEntry*) d); }                        \
    bool includes(CONC(name,List)* l) {                                       \
    return CList::identityIncludesList((CList*) l); }                         \
    bool includesAny(CONC(name,List)* l) {                                    \
    return CList::identityIncludesAny((CList*) l); }                          \
                                                                              \
    bool EQ(CListEntry* l) {                                                  \
    return CList::identityEQ((CList*) l); }                                   \
                                                                              \
    CONC(name,List)* add(dataType d) {                                        \
    return (CONC(name,List)*) CList::identityAdd((CListEntry*) d); }          \
    CONC(name,List)* add(CONC(name,List)* l) {                                \
    return (CONC(name,List)*) CList::identityAddList((CList*) l); }           \
                                                                              \
    CONC(name,ListElem)* spliceOutNext(CONC(name,ListElem)* e) {              \
    return (CONC(name,ListElem)*) CList::spliceOutNext((CListElem*) e); }     \
    void remove(dataType d) { CList::identityRemove((CListEntry*) d); }       \
    void remove(CONC(name,List)* l) {                                         \
      CList::identityRemoveList((CList*) l); }                                \
                                                                              \
    CONC(name,List)* intersection(CONC(name,List)* l, bool makeCopy = true) { \
    return (CONC(name,List)*) CList::identityIntersection(l, makeCopy); }     \
                                                                              \
    dataType removeHead() { return (dataType) CList::removeHead(); }          \
                                                                              \
    CONC(name,List)* push(dataType d) {                                       \
    return (CONC(name,List)*) CList::push((CListEntry*) d); }                 \
    CONC(name,List)* push(CONC(name,List)* l) {                               \
    return (CONC(name,List)*) CList::pushList(l); }                           \
    dataType pop() { return (dataType) CList::pop(); }                        \
    CONC(name,List)* pop(fint count) {                                        \
    return (CONC(name,List)*) CList::pop(count); }                            \
  };                                                                          \
                                                                              \
                                                                              \
  class CONC(name,ListStream): public AnywhereObj {                          \
   public:                                                                    \
    CONC(name,ListElem)* rest;                                                \
    dataType             current;                                             \
                                                                              \
    void init(CONC(name,List)* lst,  dataType none) {                         \
      if (lst->nonEmpty())  {  rest=lst->head();  advance();  }               \
      else                  {  rest= NULL;  current= none;    }               \
    }                                                                         \
    void advance() { if (rest) { current= rest->data(); rest= rest->next();} }\
    void print_short() { lprintf("rest %#lx, current %#lx\n",                  \
                                (long unsigned)rest, (long unsigned)current); \
                          }                                    \
  };

class lookupTarget;
IdentityListTemplate(lookupTarget,lookupTarget*)

class abstractSlotRef;
ListTemplate(abstractSlotRef,abstractSlotRef*)

class LookupMarker;
IdentityListTemplate(LookupMarker,LookupMarker*)

IdentityListTemplate(Int,fint)
IdentityListTemplate(StringOop,stringOop)
IdentityListTemplate(Oop, oop)

