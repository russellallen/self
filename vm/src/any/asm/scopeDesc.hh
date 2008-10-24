/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



const int32 IllegalBCI  = -1;
const int32 PrologueBCI = -2;
const int32 EpilogueBCI = -3;
// PrologueBCI must be different than NormalProcessing in scope.h

// use the following functions to compare bcis; they handle PrologueBCI et al.
fint compareBCI(fint bci1, fint bci2);
        // negative if bci1 is before bci2, 0 if same, positive if after
inline bool bciLT(fint bci1, fint bci2) { return compareBCI(bci1, bci2) <  0; }
inline bool bciLE(fint bci1, fint bci2) { return compareBCI(bci1, bci2) <= 0; }
inline bool bciGT(fint bci1, fint bci2) { return compareBCI(bci1, bci2) >  0; }
inline bool bciGE(fint bci1, fint bci2) { return compareBCI(bci1, bci2) >= 0; }



// Blocks belonging to scopes that aren't described (because they
// can't possibly be visible to the user) get IllegalDescOffset as
// their desc offset
const fint IllegalDescOffset = -2;  // not -1 because that's BLOCK_PROTO_DESC

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

// scopeDescs contain the information that makes source-level debugging of
// nmethods possible; each scopeDesc describes a method activation

# define FOR_EACH_LOCAL_NAME_DESC(DESC, VAR)                                  \
   for(NameDesc* VAR = DESC->getNextNameDesc(NULL);                           \
       VAR != NULL; VAR = DESC->getNextNameDesc(VAR) )

#define FOR_EACH_STACK_EXPR(DESC, VAR)                                        \
   for(NameDesc* VAR = DESC->getNextExprDesc(NULL);                           \
       VAR != NULL; VAR = DESC->getNextExprDesc(VAR) )

#define FOR_EACH_BLOCK(DESC, VAR)                                             \
   for(NameDesc* VAR = DESC->getNextBlockDesc(NULL);                          \
       VAR != NULL; VAR = DESC->getNextBlockDesc(VAR) )

class ScopeDesc : public ResourceObj {          // abstract
 unknown:
  ScopeLookupKey key;

  bool lite;

  nmethodScopes* _scopes;
  int32 _offset;
  int32 _name_desc_offset;
  int32 _exprOffset;
  int32 _blockOffset;
  int32 _next;

  int32 senderScopeOffset;
  int32 _senderByteCodeIndex;
  
 protected:
  // helper for next 3 iterators
  NameDesc* getNextDesc( NameDesc* n, 
                         int32 start_offset, 
                         int32 end_offset) {
    assert(!is_lite(), "cannot get nameDesc from lite scopeDesc");
    int32 offset = n ? n->next : start_offset;
    if (offset < end_offset) return nameDescAt(offset);
    return NULL;
  }
 
 public:

  // Iterator for name descriptors.
  NameDesc* getNextNameDesc(NameDesc* n) {
    return getNextDesc( n, _name_desc_offset, _exprOffset);
  }

  // Iterator for expression descriptors.
  NameDesc* getNextExprDesc(NameDesc* n) {
    return getNextDesc( n, _exprOffset, _blockOffset);
  }

  // Iterator for block descriptors.
  NameDesc* getNextBlockDesc(NameDesc* n) {
    return getNextDesc( n, _blockOffset, _next);
  }
  
  
  NameDesc* nameDescAt(int32 offset);

  ScopeDesc(nmethodScopes* scopes, int32 offset);

  fint offset() { return fint(_offset); }

  bool is_equal(ScopeDesc* s) {
    return    _scopes == s->_scopes
           && _offset == s->_offset;
  }

  // A scopeDesc is lite if no slot or expression stack information is 
  // saved.
  bool is_lite() { return lite; }

  ScopeDesc* sender();

  virtual ScopeDesc* parent() = 0;
  
  // Returns the bci of the calling method if this scopeDesc is inlined.
  // For a root scopeDesc IllegalBCI is returned.
  int32 senderByteCodeIndex() {
    assert(_senderByteCodeIndex != IllegalBCI,
           "need to ask calling byte code");
    return _senderByteCodeIndex; }
  
  bool isTop() { return senderScopeOffset == 0; }
  
  virtual NameDesc* self() = 0;
  virtual NameDesc* cachedSelf() { return self(); }
  virtual mapOop selfMapOop() = 0;
# ifdef SIC_COMPILER
    virtual SExpr* selfExpr() = 0;
    virtual SExpr* rcvrExpr() = 0;
# endif
  
  virtual oop method() = 0;
  methodMap* method_map() { return (methodMap*)method()->map(); }
  virtual oop methodHolder_or_map() = 0;

  // arghh - overloading of virtuals is tricky, thus the prefixes
  virtual bool s_equivalent(ScopeDesc* s);
  virtual bool l_equivalent(simpleLookup* l);
  
#if GENERATE_DEBUGGING_AIDS
  virtual bool isHome() { return false; }
#endif
  virtual bool isCodeScope() { return false; }
  virtual bool isMethodScope() { return false; }
  virtual bool isBlockScope() { return false; }
  virtual bool isTopLevelBlockScope() { return false; }
  virtual bool isDeadBlockScope() { return false; }
  virtual bool isAccessScope() { return false; }
  virtual bool isDataAccessScope() { return false; }
  virtual bool isDataAssignmentScope() { return false; }
  virtual bool isRemote() { return false; }

  bool isLiveBlockScope() { return isBlockScope() && !isDeadBlockScope(); }

  virtual int32 scopeID() { SubclassResponsibility(); return 0; }
  virtual NameDesc* block() { SubclassResponsibility(); return NULL; }
  virtual NameDesc* cachedBlock() { return block(); }
  
  virtual NameDesc* receiver() = 0;
  virtual mapOop receiverMapOop() { SubclassResponsibility(); return NULL; }
  Map*   receiverMap() { return receiverMapOop()->map_addr(); }

  virtual NameDesc* slot(stringOop name, bool canFail = false) = 0;
  NameDesc* slot(slotDesc* s, bool canFail = false) {
    return slot(s->name, canFail); }
  virtual NameDesc* exprStackElem(int32 bci, bool includeTrivial = true) = 0;
  virtual NameDesc*     blockElem(int32 bci) = 0;
  
 unknown:
  int32      next_offset() { return is_lite() ? _name_desc_offset :_next; }  
 public:
  virtual bool verify();
  
  void print();
  
 protected:
  void print_slots();
  void print_locals();
  void print_stack();
  void print_blocks();
  
 public:
  void doForNames(fint bci, nameDescStringDoFn fn);
 protected:
  virtual bool shallow_verify() { return true; }
  virtual void printName() = 0;
  virtual void printMethod() = 0;
  virtual void printMethodHolder() {}
  virtual void printSelf() {}
};

class CodeScopeDesc : public ScopeDesc {                // abstract
 protected:
  oop _method;
  int32 _scopeID;
  
 public:
  CodeScopeDesc(nmethodScopes* scopes, int32 offset);

  bool s_equivalent(ScopeDesc* s);
  bool l_equivalent(simpleLookup* l);
  bool isCodeScope() { return true; }
  oop  method()    { return _method; }
  int32 scopeID() { return _scopeID; }

  NameDesc* slot(stringOop name, bool canFail = false);
  NameDesc* exprStackElem(int32 bci, bool includeTrivial = true);
  NameDesc*     blockElem(int32 bci);
  
 protected:
  void printMethod();
};

class MethodScopeDesc : public CodeScopeDesc { // normal method
 protected:
  NameDesc* self_name;
  oop self_type;
  oop _methodHolder_or_map;
  
 public:
  MethodScopeDesc(nmethodScopes* scopes, int32 offset);

  NameDesc* self()      { return self_name; }
  NameDesc* receiver()  { return self_name; }
  mapOop selfMapOop();
# ifdef SIC_COMPILER
    SExpr* selfExpr();
    SExpr* rcvrExpr()   { return selfExpr(); }
# endif

  oop methodHolder_or_map() { return _methodHolder_or_map; }
  
  ScopeDesc* parent()   { return NULL; }
  
  bool isMethodScope()  { return true; }
#if GENERATE_DEBUGGING_AIDS
  bool isHome()         { return true; }
#endif
  bool s_equivalent(ScopeDesc* s);
  bool l_equivalent(simpleLookup* l);
  
 protected:
  void printName();
  void printSelf();
  void printMethodHolder();
};

class LexicalScopeDesc : public CodeScopeDesc { // abstract
 protected:
  LexicalScopeDesc(nmethodScopes* scopes, int32 offset) 
  : CodeScopeDesc( scopes, offset) {}

  // don't check block map because block might have been remapped
  // also don't check _methodHolder_or_map == l->methodHolder because l->mh is
  // the sending mh, not the receiving mh.
  // thus, no method needed
  // bool equivalent(simpleLookup* l);

  void printSelf();
};

class TopLevelBlockScopeDesc : public LexicalScopeDesc {
  // a block method whose enclosing scope isn't in the same nmethod
 protected:
  NameDesc* self_name;
  NameDesc* cachedSelf_name;
  oop self_type;
  oop _methodHolder_or_map;
  NameDesc* blockName;
  NameDesc* blockName_cached;
  mapOop _receiverMapOop;
  
 public:
  TopLevelBlockScopeDesc(nmethodScopes* scopes, int32 offset);

  mapOop receiverMapOop() { return _receiverMapOop; }
  
  NameDesc* self() { return self_name; }
  NameDesc* cachedSelf() { return cachedSelf_name; }
  mapOop selfMapOop();
# ifdef SIC_COMPILER
    SExpr* selfExpr();
    SExpr* rcvrExpr();
# endif
  oop methodHolder_or_map() { return _methodHolder_or_map; }
  
  ScopeDesc* parent() { return NULL; }
  
  void printMethodHolder();
  void printSelf();

  NameDesc* block()     { return blockName; }
  NameDesc* receiver()  { return blockName; }
  NameDesc* cachedBlock() { return blockName_cached; }
  
  bool s_equivalent(ScopeDesc* s);

  bool isBlockScope()         { return true; }
  bool isTopLevelBlockScope() { return true; }
  
  void printName();
};

class BlockScopeDesc : public LexicalScopeDesc {
  // a block
 protected:
  int32     parentScopeOffset;
  NameDesc* blockName;
  mapOop    _receiverMapOop;
 public:
  BlockScopeDesc(nmethodScopes* scopes, int32 offset);

  NameDesc* self()      { return parent()->self(); }
  mapOop selfMapOop()   { return parent()->selfMapOop(); }
# ifdef SIC_COMPILER
    SExpr* selfExpr()   { return parent()->selfExpr(); }
    SExpr* rcvrExpr();
# endif
  oop methodHolder_or_map() { return parent()->methodHolder_or_map(); }

  ScopeDesc* parent();

  NameDesc* block()     { return blockName; }
  NameDesc* receiver()  { return blockName; }

  mapOop receiverMapOop()  { return _receiverMapOop; }
  
  bool s_equivalent(ScopeDesc* s);

  bool isBlockScope()     { return true; }
  
  void printSelf();
  void printName();
};

class DeadBlockScopeDesc : public CodeScopeDesc {
  // a dead block invocation
 protected:
  NameDesc* blockName;
  
 public:
  DeadBlockScopeDesc(nmethodScopes* scopes, int32 offset);

  // treat the block as self; makes things easier
  NameDesc* self() { return blockName; }
  mapOop selfMapOop() { ShouldNotCallThis(); return mapOop(badOop); }
# ifdef SIC_COMPILER
  SExpr* selfExpr() { ShouldNotCallThis(); return NULL; }
  SExpr* rcvrExpr() { ShouldNotCallThis(); return NULL; }
# endif
  oop methodHolder_or_map() { ShouldNotCallThis(); return badOop; }
  
  ScopeDesc* parent() { return NULL; }
  
  void printMethodHolder();
  void printSelf();

  NameDesc* block()     { return blockName; }
  NameDesc* receiver()  { return blockName; }
  
  bool s_equivalent(ScopeDesc* s);

  bool isBlockScope()     { return true; }
  bool isDeadBlockScope() { return true; }
  
  void printName();
};

class AccessScopeDesc : public ScopeDesc {      // abstract
 protected:
  NameDesc* self_name;
  oop self_type;
  oop _methodHolder_or_map;
  
 public:
  AccessScopeDesc(nmethodScopes* scopes, int32 offset);

  NameDesc* self() { return self_name; }
  NameDesc* receiver() { return self_name; }
  mapOop selfMapOop();
# ifdef SIC_COMPILER
    SExpr* selfExpr();
    SExpr* rcvrExpr()   { return selfExpr(); }
# endif
  oop method() { ShouldNotCallThis(); return NULL; }
  oop methodHolder_or_map() { return _methodHolder_or_map; }
  
  ScopeDesc* parent()   { return NULL; }

#if GENERATE_DEBUGGING_AIDS
  bool isHome()         { return true; }
#endif
  bool isAccessScope()  { return true; }
  bool l_equivalent(simpleLookup* l);
  
  NameDesc* slot(stringOop name, bool canFail = false);
  NameDesc* exprStackElem(int32 bci, bool includeTrivial = true) {
    Unused(bci); Unused(includeTrivial);
    ShouldNotCallThis(); return NULL; }
  NameDesc* blockElem(int32 bci) { 
    Unused(bci); ShouldNotCallThis(); return NULL; }
  
 protected:
  void printMethod() {}
  void printMethodHolder();
};

class DataAccessScopeDesc : public AccessScopeDesc {    // access method
 public:
  DataAccessScopeDesc(nmethodScopes* s, int32 o) : AccessScopeDesc(s,o) {}
  bool s_equivalent(ScopeDesc* s);
  bool isDataAccessScope() { return true; }
  
 protected:
  void printName();
};

class DataAssignmentScopeDesc : public AccessScopeDesc { // assignment method
 public:
  DataAssignmentScopeDesc(nmethodScopes* s, int32 o) : AccessScopeDesc(s,o) {}
  bool s_equivalent(ScopeDesc* s);
  bool isDataAssignmentScope() { return true; }
  
 protected:
  void printName();
};



# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
