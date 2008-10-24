/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

// Yet another version of lists, this one for the SIC.
// The "L" business is needed to get C++ to type-check correctly
// (otherwise myList->append(anyPointer) happily matches SList::append)

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# ifdef SIC_COMPILER
  
  class SListElem : public ResourceObj  {
   protected:
    void* _data;
    SListElem*  _next;
   public: 
    SListElem(void* d, SListElem* n = NULL) { _data = d; _next = n; }
    
    void* dataL()               { return this ? _data : NULL; }
    void setDataL(void* d)      { _data = d; }
    
    SListElem* nextL()          { return _next; }
    void setNextL(SListElem* n) { _next = n; }

   protected:
    void insertAfterL(void* d) { _next = new SListElem(d, _next); }
    
    friend class SList;
  };
  
  typedef bool (*slistFindFn)(void* token, void* elem);

  class SList : public ResourceObj {
   protected:
    SListElem* _head;
    SListElem* _tail;
    int32 _len;
   public:
    SList() { _head = _tail = NULL; _len = 0; }
    
    void prependL(void* d) {
      _head = new SListElem(d, _head);
      if (_tail == NULL) _tail = _head;
      _len++;
    }
    void appendL(void* d) {
      SListElem* e = new SListElem(d);
      if (_tail == NULL) {
        _head = _tail = e;
      } else {
        _tail->_next = e;
        _tail = e;
      }
      _len++;
    }
    
    SListElem* headL()          { return _head; }
    SListElem* tailL()          { return _tail; }
    
    void applyL(void f(void*));
    
    bool isEmpty()      { return _head == NULL; }
    bool nonEmpty()     { return ! isEmpty(); }
    int32 length()      { return _len; }
    bool includesL(void* p) { return findL(p) != NULL; }
    SListElem* findL(void* p);
    SListElem* findL(void* p, slistFindFn f);
    
    void* nthL(fint i);
    
    void* firstL() { return headL()->dataL(); }
    void* secondL() { return headL()->nextL()->dataL(); }
    void* lastL() { return tailL()->dataL(); }
    
    void insertAfterL(SListElem* e, void* d);
    void removeL(void* d);
    void removeAfterL(SListElem* e);
    
   protected:
    void* removeHeadL() {
      assert(nonEmpty(), "removing from an empty list");
      void* d = firstL();
      _head = headL()->nextL();
      if (--_len == 0) _tail = _head;
      return d; }
    
   public:
    void pushL(void* d)         { prependL(d); }
    void* popL()                { return removeHeadL(); }
    
    void print();
    void print_short();
  };
  
# define SListTemplate(name,dataType)                                         \
    class CONC(name,ListElem) : public SListElem {                            \
   public:                                                                    \
    CONC(name,ListElem)(dataType d, CONC(name,ListElem)* n = NULL)            \
      : SListElem((void*) d, (SListElem*) n) {}                               \
                                                                              \
    dataType data() { return (dataType) SListElem::dataL(); }                 \
    void setData(dataType d) { SListElem::setDataL((void*) d); }              \
                                                                              \
    CONC(name,ListElem)* next() {                                             \
      return (CONC(name,ListElem)*) SListElem::nextL(); }                     \
    void setNext(CONC(name,ListElem)* n) { SListElem::setNextL(n); }          \
                                                                              \
    void insertAfter(dataType d) { SListElem::insertAfterL((void*) d); }      \
  };                                                                          \
                                                                              \
  typedef bool (*CONC(name,__DoFn))(void* token, dataType e);                 \
                                                                              \
  class CONC(name,List) : public SList {                                      \
   public:                                                                    \
    CONC(name,List)() {}                                                      \
                                                                              \
    CONC(name,ListElem)* head() {                                             \
      return (CONC(name,ListElem)*) SList::headL(); }                         \
    CONC(name,ListElem)* tail() {                                             \
      return (CONC(name,ListElem)*) SList::tailL(); }                         \
    bool includes(dataType e) { return SList::includesL((void*)e); }          \
    CONC(name,ListElem)* find(dataType e) {                                   \
      return (CONC(name,ListElem)*)SList::findL((void*)e); }                  \
    CONC(name,ListElem)* find(void* token, CONC(name,__DoFn) f) {             \
      return (CONC(name,ListElem)*)SList::findL(token, (slistFindFn)f); }     \
                                                                              \
    dataType first()    { return (dataType) SList::firstL(); }                \
    dataType second()   { return (dataType) SList::secondL(); }               \
    dataType nth(fint i){ return (dataType) SList::nthL(i); }                 \
    dataType last()     { return (dataType) SList::lastL(); }                 \
                                                                              \
    void prepend(dataType d)            { SList::prependL((void*) d); }       \
    void append(dataType d)             { SList::appendL((void*) d); }        \
                                                                              \
    void apply(void f(dataType)){ SList::applyL((void (*)(void*))f); }        \
                                                                              \
    void insertAfter(CONC(name,ListElem)* e, dataType d) {                    \
      SList::insertAfterL((SListElem*) e, (void*) d); }                       \
    void removeAfter(CONC(name,ListElem)* e, dataType d) {                    \
      Unused(d);  SList::removeAfterL((SListElem*) e); }                      \
    void remove(dataType d) { SList::removeL((void*) d); }                    \
                                                                              \
    dataType removeHead() { return (dataType) SList::removeHeadL(); }         \
                                                                              \
    void push(dataType d)               { SList::pushL((void*) d); }          \
    dataType pop()                      { return (dataType) SList::popL(); }  \
  };

  SListTemplate(PDefUse, PDefUse*)
  SListTemplate(PDef, PDef*)
  SListTemplate(PUse, PUse*)

# endif
