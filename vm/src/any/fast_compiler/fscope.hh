/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef FAST_COMPILER

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// A FScope represents the current state of a Self scope during inlining

class FSelfScope;

class BlockLocation: public ResourceObj {
 public:
  Location loc;
  bool memoized;
  blockOop block;       // uninitialized if !memoized
};


typedef BoundedListTemplate<BlockLocation> BlockLocationList;



class FScope : public CListEntry {      // abstract
 protected:
  bool debugging;
  
 public:
  FScope(bool d) : CListEntry() { debugging = d; }
  
  virtual bool isSelfScope()            { return false; }
  virtual bool isMethodSelfScope()      { return false; }
  virtual bool isBlockSelfScope()       { return false; }
  
  virtual bool isVFrameScope()          { return false; }
  virtual bool isVFrameMethodScope()    { return false; }   
  virtual bool isVFrameBlockScope()     { return false; }

  virtual bool isLexicalScope()         { return false; }

  virtual mapOop   receiverMapOop() = 0;
  Map*             receiverMap() { return receiverMapOop()->map_addr(); }
  virtual mapOop   selfMapOop() = 0;
  virtual oop      method()     = 0;
  virtual oop      methodHolder_or_map() = 0;
  virtual void     set_methodHolder_or_map(oop mh) = 0;
  virtual FScope*  parent()     = 0;
  virtual FSelfScope* sender()  = 0;
  bool isTop()                  { return sender() == 0; }
  virtual FScope*  home()       = 0;
  virtual smi      scopeID()    = 0;
  virtual smi      homeID()     = 0;
  virtual compiled_vframe*  vf() = 0;

  // lexical scoping: search for sel in this scope, return scope if found
  // Search parent up to an outer method
  virtual FScope* lookup(stringOop sel, slotDesc*& sd) = 0;
  virtual void genLocal(FScope* target, FSelfScope* sender, slotDesc* sd,
                        fint argc, bool first, Location temp_sp_reg) = 0;
  virtual void loadParentScope(Location dst_reg, Location child_sp_reg) = 0;

  virtual void genCode() = 0;
  virtual void genDescs() = 0;
};


class FSelfScope: public FScope {       // abstract
 protected:

  MethodLookupKey* _key;
  oop        _method;
  ScopeInfo  scope;

  smi _scopeID;
  fint nargs;                   // number of arguments (excluding self)

  Location self;
  Location receiver;
  LocationList* args;           // indexed by arg slot indices
  LocationList* locals;         // same for locals
  Location result;
  LocationList* exprStack;      // expression stack
  BlockLocationList* blocks;    // blocks to kill
  LabelList* nlrPoints;         // nth elem = NLR point for sends with n
                                // blocks to kill
  BoolBList* branchTargetFlags; // nth elem = true if there is a branch bc to bci n
  LabelList* branchTargets;     // nth elem = label for branch bc to bci n
  LocationList* branchTargetExprStack; // where to materialize expr stack to
  LocationList* initializedBlockLocations; // for methods with branch codes
  RegisterState* allocs;

  methodMap *method_map;
  Label* startOfScope;          // address of first instr (for _Restart)

  ScopeDescRecorder* scopeDescs;
  
  bool frequentPreemption;   // generate pc descs and preemption checks
                             // after every interesting bytecode
                             // enables single-stepping
                             
  // to allow for branch bytecodes and
  // the process goto bytecode primitive,
  // need to allocate location for each block
  // at start of method and initialize it.
  // Since don't want to create blocks eagerly
  // (too costly) this implies memoizing all blocks zaps.
  // Without this flag, a branch could skip
  // a block's creation site, then at end of method
  // would try to zap an uninitialized block location.
  // dmu
  
  bool initBlocksInPrologue;     // for branch bytecoes
  bool memoizeAllBlockZaps;      // branches and debugging
  bool createMemoizedBlocks;     // debugging
  bool foundLoop;                // controls block zapping
  
  // When debugging programming primitives & conversions
  // may need to set a value in the expression stack,
  // so keep it in real locations all the time.
  // Not sufficient for branches, cause they need to use SAME
  // locations at all paths to merge.
  // So branches use materializeExprStack.
  // An alternative would be to ensure that pickLocal always
  // allocated the same location for a given exprStack index.
  // -- dmu
  
  bool allowPrimitivesToAlterExpressionStack;
  
  FSelfScope(bool debugging, MethodLookupKey* key, oop method);

  int32 descOffset()      { return 0; } // descOffset is 0 for the NIC.
  
  bool need_epilogue; // true if need to gen return sequence at end

 public:
  bool isSelfScope()      { return true; }
  mapOop receiverMapOop() { return _key->receiverMapOop(); }
  mapOop selfMapOop()     { return _key->receiverMapOop(); }
  oop method()            { return _method; }
  oop selector()          { return _key->selector; }
  oop delegatee()         { return _key->delegatee; }
  smi scopeID()           { return _scopeID; }
  smi homeID()            { return _scopeID; }

  compiled_vframe* vf() { ShouldNotCallThis(); return 0; }

  void genCode();
 protected:
  void initialize();
  void prologue();
  virtual void postPrologue() {}
  void epilogue();
  void genSend(bool isSelfImplicit, stringOop sel, fint arg_count, bool isUndirectedResend,
               stringOop del);
  void genLocalAccess(bool isRead, fint lexicalLevel, fint index);
  bool genLocalSend(stringOop sel, fint arg_count, slotDesc* sd = 0,  FScope* s = 0);
  bool genReceiverDataAccess(stringOop sel);
  void blockLiteral(int32 litIndex, blockOop literal, 
                    bool memoized, BlockLocation& bl);
  bool testMemoization(u_char* bytes, u_char* end, oop* literals);
  void returnCode();
  void selfCode();
  void handleNLR(Label* nlr);
  void genNLRPoints();
  void local(slotDesc* sd, fint argc);
  Label* genCall(LookupType lookupType, Location receiver, Location lastArg,
                 fint argc, stringOop sel, oop del);
  Label* primCall(stringOop selector, bool& canFail, fint arg_count);           
  bool checkPerform_and_push_arguments(
                    char* sel, fint len, fint prefix,
                    LookupType& lookupType, LocationList*& argRegs);
  bool checkPerformPrim_and_push_arguments(
                        stringOop sel, LookupType& performLookupType,
                        LocationList*& argRegs);
                        
  void unconditionalBranch( int32 target_PC,                 bool isLoop);
  void   conditionalBranch( int32 target_PC, oop target_oop, bool isLoop);
  void       indexedBranch( objVectorOop pcs,  int32 pc);

  void descLocals(ScopeInfo scope);
  
  friend class fcompiler_code_generator;
  
  void addExprStack( fint bci, NameNode* nn );
  void addBlock(     fint bci, NameNode* nn );
  void addPcDesc(    fint bci );
  
  void materializeExprStack();
  
  Location pickStackLoc();
  Location pickStackLocAndMove(Location src);

 public:
  void print();

  friend class FVFrameScope;
};
 



class FMethodScope: public FSelfScope {         // normal method
 protected:
  oop _methodHolder_or_map;
 public:
  FMethodScope(bool debugging, MethodLookupKey* key, oop method, oop mh_or_map);

  bool isMethodSelfScope()      { return true; }

  FScope* home()                { return this; }
  FScope* parent()              { return 0; }
  oop  methodHolder_or_map()    { return _methodHolder_or_map; }
  void set_methodHolder_or_map(oop mh) { _methodHolder_or_map = mh; }
  FSelfScope* sender()          { return 0; }
  FScope* lookup(stringOop sel, slotDesc*& sd);

  void loadParentScope(Location /*dst_reg*/, Location) { ShouldNotCallThis(); }

  void genCode();
  void genLocal(FScope* target, FSelfScope* sender, slotDesc* sd,
                fint argc, bool first, Location temp_sp_reg);
  void genDescs();

  void print_short();
  void print();
};

class FLexicalScope: public FSelfScope {                // abstract
 protected:
  FScope* _parent;

 public:
  FLexicalScope(bool dbg, MethodLookupKey* key, oop method, FScope* p);

  bool isLexicalScope() { return true; }
  FScope* parent()      { return _parent; }
  FScope* home()        { return _parent->home(); }
  oop methodHolder_or_map()     { return _parent->methodHolder_or_map(); }
  mapOop selfMapOop()   { return _parent->selfMapOop(); }
  smi homeID()          { return _parent->homeID(); }
  FScope* lookup(stringOop sel, slotDesc*& sd);

  void set_methodHolder_or_map(oop mh) { Unused(mh); ShouldNotCallThis(); }

  void genLocal(FScope* target, FSelfScope* sender, slotDesc* sd,
                fint argc, bool first, Location temp_sp_reg);
  void print();
};

class FBlockScope: public FLexicalScope {       // block method
 public:
  FBlockScope(bool dbg, MethodLookupKey* key, oop method, FScope* p);

  bool isBlockSelfScope() { return true; }
  FSelfScope* sender() { return 0; }

  void loadParentScope(Location dst_reg, Location child_sp_reg);
  void postPrologue();
  void genDescs();

  void genCode();

  void print_short();
};

class FDeadBlockScope: public FBlockScope {
 public:
  FDeadBlockScope(bool dbg, MethodLookupKey* key, oop method);
  void genCode();

  oop methodHolder_or_map() { return 0; }       // so that dummy genDesc works
  mapOop selfMapOop()   { return 0; }
  smi homeID()          { return 0; }

  void loadParentScope(Location, Location) { ShouldNotCallThis(); }
  FScope* home() { ShouldNotCallThis(); return 0; }

  void postPrologue();

  void print_short();
};

class FVFrameScope: public FScope {     // abstract; a scope on execution stack
 protected:
  compiled_vframe* _vf;  

 public:
  FVFrameScope(bool dbg, compiled_vframe* f);
  bool isVFrameScope()  { return true; }
  compiled_vframe* vf()         { return _vf; }
  
  oop method();
  oop methodHolder_or_map();

  void set_methodHolder_or_map(oop mh) {
    Unused(mh);  ShouldNotCallThis(); }
  FSelfScope* sender() { ShouldNotCallThis(); return 0; }
  void genCode() { ShouldNotCallThis(); }
  void genDescs() { ShouldNotCallThis(); }

  void genLocal(FScope* target, FSelfScope* sender, slotDesc* sd,
                fint argc, bool first, Location temp_sp_reg);
  void print();
};

class FVFrameMethodScope: public FVFrameScope {
 public:
  
  FVFrameMethodScope(bool dbg, compiled_vframe* f) : FVFrameScope(dbg, f) {}
    
  bool isVFrameMethodScope() { return true; }
  mapOop receiverMapOop()    { return _vf->receiver()->map()->enclosing_mapOop(); }
  mapOop selfMapOop()   { return _vf->self()->map()->enclosing_mapOop(); }
  smi scopeID()         { return _vf->desc->scopeID(); }
  smi homeID()          { return _vf->desc->scopeID(); }
  FScope* home()        { return this; }
  FScope* parent()      { return 0; }
  FScope* lookup(stringOop sel, slotDesc*& sd);
    
  void loadParentScope(Location, Location) { ShouldNotCallThis(); }

  void print_short();
  void print();
};
  
class FVFrameLexicalScope: public FVFrameScope {        // abstract
 protected:
  FScope* _parent;
 public:
  
  FVFrameLexicalScope(bool dbg, compiled_vframe* f);
    
  bool isLexicalScope() { return true; }
  FScope* parent()      { return _parent; }
  mapOop receiverMapOop()       { return _parent->receiverMapOop(); }
  mapOop selfMapOop()   { return _parent->selfMapOop(); }
  smi scopeID()         { return _vf->desc->scopeID(); }
  FScope* home()        { return _parent->home(); };
  smi homeID()          { return _parent->homeID(); }
  FScope* lookup(stringOop sel, slotDesc*& sd);

  void genLocal(FScope* target, FSelfScope* sender, slotDesc* sd,
                fint argc, bool first, Location temp_sp_reg);

  void print();
};

class FVFrameBlockScope: public FVFrameLexicalScope {
 public:
  
  FVFrameBlockScope(bool dbg, compiled_vframe* f) : FVFrameLexicalScope(dbg, f) {}

  bool isVFrameBlockScope()     { return true; }   
  void loadParentScope(Location dst_reg, Location child_sp_reg);
    
  void print_short();
  void print();
};

extern FVFrameScope* new_FVFrameScope(bool debugging, compiled_vframe* parentVFrame);


// I help out FSelfScope generate code by interpreting the bytecodes.

class fcompiler_code_generator: public abstract_interpreter {
 protected:
  FSelfScope* fscope;

  IntListStream   exprStackBCIs;

 public:
 
  fcompiler_code_generator(FSelfScope* s);
  void interpret_method();


 protected:  
 
  void interpret_bytecode();
  void fetch_and_decode_bytecode();


  void do_SELF_CODE();
  void do_POP_CODE();
  void do_NONLOCAL_RETURN_CODE();
  void do_INDEX_CODE();

  
  void do_literal_code(oop literal);
  void do_DELEGATEE_CODE() {}
  void do_read_write_local_code( bool isWrite );
  void do_send_code( bool isSelfImplicit, stringOop sel, fint arg_count );
  
  void do_branch_code( int32 target_PC, oop target_oop = badOop );
  void do_BRANCH_INDEXED_CODE();
  

  void write_expr_stack_info();
  void write_block_info(BlockLocation*);
  void addPcDesc();
  void define_branch_target();


 public:
 
  void print_short();
};



# endif // FAST_COMPILER
