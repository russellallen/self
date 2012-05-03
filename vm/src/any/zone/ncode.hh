/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */
   
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

static OopNCode* shutUpCompiler_OopNCode = NULL;
# define OOPNCODE_FROM(fieldName, p)                                          \
      ((OopNCode*)((char*)p - (char*)&shutUpCompiler_OopNCode->fieldName))


// NCodeBase is the superclass of all things containing native code.

class NCodeBase : public VMObj {
 protected:
  int32 _instsLen;                      // instruction length in bytes
 public:
  MACOSX_DESTRUCTOR_BUG(NCodeBase)
  
  void* operator new(size_t size) {
    Unused(size); SubclassResponsibility();  
    /* dummy for OS X compiler: */ return ::new char[size]; }
  virtual void deallocate() = 0;
  
  virtual char* insts() = 0;            // beginning of instructions part
  virtual int32 size() = 0;             // size in bytes
  int32 instsLen()      { return this ? _instsLen : 0; }
  char* instsEnd()      { return insts() + instsLen(); }
  bool  contains(void* p) {
    return (void*)insts() <= p && p < (void*)instsEnd(); }

  virtual bool isNMethod()      { return false; }
  virtual bool isCacheStub()    { return false; }
  virtual bool isCountStub()    { return false; }
  virtual bool isAgingStub()    { return false; }
  
  void moveTo(NCodeBase* to, int32 size); // (possibly overlapping) copy
  virtual void moveTo_inner(NCodeBase* to, int32 delta, int32 size) = 0;
  virtual void shift_target(nmln* l, int32 delta) = 0;
  virtual NCodeBase* unlink_me(nmln* l) = 0;
  virtual void forwardLinkedSend(nmln* l, nmethod* to) = 0;
  virtual bool encompasses(void* addr) {
    return (char*)this <= (char*)addr  &&  (char*)addr < instsEnd(); }
  
  virtual void relocate() {};
  virtual bool verify() = 0;
 protected:
  bool verify2(const char* name);
};


// OopNCode is the base class of all code containing oop references embedded
// in the code (e.g. sethi instructions).  

class OopNCode : public NCodeBase {
 protected:
  void  check_store(oop x, char *bound) {
    if (Memory->new_gen->is_new(x, bound)) remember(); }

 public:
  nmln rememberLink;                    // links all remembered OopNCodes
  int32 _locsLen;                       // relocation info length (bytes)
  
  addrDesc* locs()      { return (addrDesc*) instsEnd();}
  int32 locsLen()       { return this ? _locsLen : 0;}
  addrDesc* locsEnd()   { return (addrDesc*) ((char*)locs() + _locsLen);}
    
  virtual bool isNMethod()      { return false; }
  virtual void moveTo_inner(NCodeBase* to, int32 delta, int32 size);
  
  // Memory operations: return true if need to invalidate instruction cache
  virtual bool scavenge_contents();
  virtual void gc_mark_contents();
  virtual bool gc_unmark_contents();
  virtual bool switch_pointers(oop from, oop to,
                               nmethodBList* nmethods_to_invalidate);
  virtual void oops_do(oopsDoFn f) {
    Unused((void*)f);  ShouldNotCallThis(); } // use code_oops_do
  virtual bool code_oops_do(oopsDoFn f);
  void relocate();
  void remember();
  virtual bool verify();

  MACOSX_DESTRUCTOR_BUG(OopNCode)
};

NCodeBase* findThing(void* addr);   // returns NULL if addr not in a zone

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
