/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// AbstractNodes are nodes in a (flow-)graph.  Used by the SIC.
// This should really be an abstract base class that could be mixed
// in, but our beloved C++ makes this very hard to do (e.g.
// can't cast a virtual base ptr to the concrete class).

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# ifdef SIC_COMPILER

# define NodeClassTemplate(ClassName, BaseClass)                              \
                                                                              \
  class ClassName : public BaseClass {                                        \
   public:                                                                    \
    ClassName *_prev, *_next;                                                 \
                                                                              \
    ClassName() { _prev = _next = NULL; }                                     \
                                                                              \
    virtual bool hasSingleSuccessor()   { return true; }                      \
    virtual bool hasSinglePredecessor() { return true; }                      \
    virtual fint nPredecessors()        { return _prev ? 1 : 0; }             \
    virtual fint nSuccessors()          { return _next ? 1 : 0; }             \
    virtual bool isPredecessor(ClassName* n) { return _prev == n; }           \
    virtual bool isSuccessor(ClassName* n)   { return _next == n; }           \
    ClassName* next()                   { return _next; }                     \
    virtual ClassName* next1()          { return NULL; }                      \
    virtual ClassName* nexti(fint i)    {                                     \
      if (i == 0) return _next; else { fatal("single next"); return NULL;} }  \
    virtual ClassName* firstPrev()      { return _prev; }                     \
    virtual ClassName* prev(fint i) {                                         \
      if (i == 0) return _prev; else { fatal("single prev"); return NULL;} }  \
                                                                              \
    virtual void setPrev(ClassName* p) {                                      \
      assert(_prev == NULL, "already set");                                   \
      _prev = p; }                                                            \
    virtual void movePrev(ClassName* from, ClassName* to) {                   \
      assert(_prev == from, "mismatched prev link");                          \
      _prev = to; }                                                           \
                                                                              \
    void setNext(ClassName* n) {                                              \
      assert(_next == NULL, "already set"); _next = n; }                      \
    virtual void setNext1(ClassName* n) { Unused(n); ShouldNotCallThis(); }   \
    virtual void setNexti(fint i, ClassName* n) {                             \
      if (i == 0) setNext(n); else fatal("subclass"); }                       \
    virtual void moveNext(ClassName* from, ClassName* to) {                   \
      Unused(from);                                                           \
       assert(_next == from, "mismatched next link"); _next = to; }           \
                                                                              \
    virtual void removeMe() {                                                 \
      assert(hasSingleSuccessor() && hasSinglePredecessor(), "subclass");     \
      if (_prev) _prev->moveNext(this, _next);                                \
      if (_next) _next->movePrev(this, _prev);                                \
      _prev = _next = NULL;                                                   \
    }                                                                         \
                                                                              \
   /*protected:*/                                                             \
    virtual void removePrev(ClassName* n) {                                   \
      /* cut the _prev link between this and n  */                            \
      assert(hasSinglePredecessor(), "subclass");                             \
      assert(_prev == n, "should be same");                                   \
      _prev = NULL;                                                           \
    }                                                                         \
                                                                              \
   public:                                                                    \
    virtual void removeNext(ClassName* n) {                                   \
      /* cut the next link between this and n */                              \
      assert(hasSingleSuccessor(), "subclass");                               \
      assert(_next == n, "should be same");                                   \
      n->removePrev(this);                                                    \
      _next = NULL;                                                           \
    }                                                                         \
                                                                              \
    ClassName* endOfList() {                                                  \
      if (_next == NULL) return this;                                         \
      ClassName* n;                                                           \
      for (n = _next; n->_next; n = n->_next) {                               \
        assert(n->hasSingleSuccessor(), ">1 successors");                     \
      }                                                                       \
      return n;                                                               \
    }                                                                         \
                                                                              \
    ClassName* append(ClassName* p) {                                         \
      setNext(p);  p->setPrev(this); return p; }                              \
    ClassName* append1(ClassName* p){                                         \
      setNext1(p); p->setPrev(this); return p; }                              \
    ClassName* append(fint i, ClassName* p) {                                 \
      setNexti(i, p);  p->setPrev(this); return p; }                          \
                                                                              \
    void insertNext(ClassName* n) {                                           \
      /* this next assertion trips when adding a flush node to the */         \
      /* normal successor of a ArrayAtPut, which does have mult successors */ \
      /* Urs thinks the assertion is probably bogus so I have commented it */ \
      /* out.  dmu 3/21/96 */                                                 \
      /* assert(hasSingleSuccessor(), ">1 successors"); */                    \
      n->setNext(_next); n->setPrev(this);                                    \
      _next->movePrev(this, n); _next = n; }                                  \
    void insertPrev(ClassName* n) {                                           \
      assert(n->hasSinglePredecessor(), "where to insert?");                  \
      n->setPrev(_prev); n->setNext(this);                                    \
      _prev->moveNext(this, n); _prev = n; }                                  \
  };

# define BranchNodeClassTemplate(BranchClassName, NodeName, BaseClass, N)     \
                                                                              \
  class BranchClassName : public BaseClass {                                  \
    /* branch with 2..N successors */                                         \
   unknown:                                                                   \
    CONC(NodeName, BList)* _nxt;        /* elem 0 is next1 */                 \
   public:                                                                    \
                                                                              \
    BranchClassName() { _nxt = new CONC(NodeName, BList)(N); }                \
    NodeName* next1()                           {                             \
      return _nxt->length() ? _nxt->nth(0) : NULL; }                          \
    bool hasSingleSuccessor() { return next1() == NULL; }                     \
    fint nSuccessors()        { return _nxt->length() + (_next ? 1 : 0); }    \
    NodeName* next()          { return _next; }                               \
    NodeName* nexti(fint i)   {                                               \
      return i == 0 ? _next : _nxt->nth(i-1); }                               \
                                                                              \
    void removeMe() {                                                         \
      if (hasSingleSuccessor()) {                                             \
        if (!_next && _nxt->nonEmpty()) { _next = next1(); _nxt->pop(); }     \
        BaseClass::removeMe();                                                \
      } else {                                                                \
        ShouldNotReachHere(); /* not implemented */                           \
      } }                                                                     \
    void removeNext(NodeName* n) {                                            \
      /* cut the next link between this and n */                              \
      if (n == _next) {                                                       \
        n->removePrev(this);                                                  \
        _next = NULL;                                                         \
      } else {                                                                \
        fint i;                                                               \
        for (i = 0; i < _nxt->length() && _nxt->nth(i) != n; i++) ;           \
        assert(i < _nxt->length(), "not found");                              \
        n->removePrev(this);                                                  \
        for ( ; i < _nxt->length() - 1; i++) _nxt->nthPut(i, _nxt->nth(i+1)); \
        _nxt->pop();                                                          \
      } }                                                                     \
                                                                              \
    void setNext1(NodeName* n) {                                              \
      assert(_nxt->length() == 0, "already set");                             \
      _nxt->append(n); }                                                      \
    void setNext(NodeName* n) { BaseClass::setNext(n); }                      \
    void setNexti(fint i, NodeName* n) {                                      \
      if (i == 0) {                                                           \
        setNext(n);                                                           \
      } else {                                                                \
        assert(_nxt->length() == i - 1, "wrong index");                       \
        _nxt->append(n);                                                      \
      } }                                                                     \
    void moveNext(NodeName* from, NodeName* to) {                             \
      if (_next == from) {                                                    \
        _next = to;                                                           \
      } else {                                                                \
        fint i;                                                               \
        for (i = 0; i < _nxt->length() && _nxt->nth(i) != from; i++) ;        \
        assert(i < _nxt->length(), "not found");                              \
        _nxt->nthPut(i, to);                                                  \
      } }                                                                     \
    bool isSuccessor(NodeName* n) {                                           \
      if (_next == n) {                                                       \
        return true;                                                          \
      } else {                                                                \
        fint i;                                                               \
        for (i = 0; i < _nxt->length() && _nxt->nth(i) != n; i++) ;           \
        return i < _nxt->length();                                            \
      } }                                                                     \
  };

# define MergeNodeClassTemplate(MergeClassName, NodeName, ListClassName,      \
                                BaseClass, N)                                 \
                                                                              \
  class MergeClassName : public BaseClass {                                   \
    /* n-way merge */                                                         \
   unknown:                                                                   \
    ListClassName* _prevs;                                                    \
   public:                                                                    \
                                                                              \
    MergeClassName() { _prevs = new ListClassName(N); }                       \
    MergeClassName(NodeName* prev1, NodeName* prev2) {                        \
      _prevs = new ListClassName(N);                                          \
      _prevs->append(prev1); prev1->setNext(this);                            \
      _prevs->append(prev2); prev2->setNext(this);                            \
    }                                                                         \
                                                                              \
    bool hasSinglePredecessor() { return _prevs->length() <= 1; }             \
    fint nPredecessors()        { return _prevs->length(); }                  \
    NodeName* firstPrev()       {                                             \
      return _prevs->isEmpty() ? NULL : _prevs->nth(0); }                     \
                                                                              \
    void setPrev(NodeName* p) {                                               \
      assert(p, "should be something");                                       \
      assert( !_prevs->contains(p),                                           \
              "shouldn't already be there");                                  \
      _prevs->append(p); }                                                    \
    NodeName* prev(fint n) { return _prevs->nth(n); }                         \
    void removeMe() {                                                         \
      if (hasSinglePredecessor()) {                                           \
        _prev = firstPrev();                                                  \
        BaseClass::removeMe();                                                \
      } else {                                                                \
         ShouldNotReachHere(); /* not implemented */                          \
      } }                                                                     \
   /*protected:*/                                                             \
    virtual void removePrev(NodeName* n) {                                    \
      /* cut the _prev link between this and n  */                            \
      _prevs->remove(n);                                                      \
    }                                                                         \
   public:                                                                    \
    void movePrev(NodeName* from, NodeName* to) {                             \
      fint i;                                                                 \
      for ( i = _prevs->length() - 1; i >= 0; i--) {                          \
        if (_prevs->nth(i) == from) { _prevs->nthPut(i, to); return; }        \
      }                                                                       \
      ShouldNotReachHere(); /* from not found */                              \
    }                                                                         \
    bool isPredecessor(NodeName* n) {                                         \
      fint i;                                                                 \
      for ( i = _prevs->length() - 1; i >= 0; i--) {                          \
        if (_prevs->nth(i) == n) return true;                                 \
      }                                                                       \
      return false;                                                           \
    }                                                                         \
                                                                              \
  };                                                                          \
    
# endif
