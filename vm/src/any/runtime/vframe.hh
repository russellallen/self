/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// vframes are "virtual" frames (as opposed to physical stack frames)

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

class compiled_vframe;
class nvframe;
class dummy_vframe;

typedef void (*vfValueDoFn)(compiled_vframe* vf1,
                            NameDesc* n1,
                            compiled_vframe* vf2,
                            NameDesc* n2);
                            
# endif

class abstract_vframe: public ResourceObj {
 unknown:
  frame* fr;

 unknown:

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

  compiled_vframe* as_compiled() {
    if (this == 0) return 0;
    assert_compiled();
    return (compiled_vframe*)this;
  }
# endif
    
  interpreted_vframe* as_interpreted() {
    if (this == 0) return 0;
    assert_interpreted();
    return (interpreted_vframe*)this;
  }

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

  nvframe* as_n() {
    if (this == 0) return 0;
    assert_n();
    return (nvframe*)this;
  }
  
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

  abstract_vframe* as_abstract() { return (abstract_vframe*) this; }

  void assert_compiled() {
    assert(is_compiled(), "must be compiled vframe"); }
    
  void assert_interpreted() {
    assert(is_interpreted(), "must be interpreted vframe"); }

  void assert_n() {
    assert(is_n(), "must be nvframe"); }

  virtual bool is_n() { return false; };
  
  virtual bool is_compiled() = 0;
  bool is_interpreted() {return !is_compiled();}
    
 protected:
  virtual abstract_vframe* get_sender(bool skipCFrames);

 public:
  virtual bool EQ(abstract_vframe *f) {
    return  this == f  ||  fr == f->fr; }
        
 public:
  virtual smiOop  descOffset() = 0;
  
  virtual int32   real_bci() = 0;
          int32        bci();

  bool  is_prologue(); 

 public:
  abstract_vframe* sendee(abstract_vframe* lastSelfVf = 0);// vframe below the receiver; SLOW!
  
  virtual abstract_vframe* parent();
  abstract_vframe* sender()             { return get_sender(true); }
  abstract_vframe* immediateSender()    { return get_sender(false); }
  virtual abstract_vframe* home();
  virtual abstract_vframe* top();       // top vframe in same frame
  virtual bool is_top() = 0;

  virtual oop  selector()       = 0;
  virtual oop  delegatee()      = 0;
  virtual oop  method()         = 0;
  virtual oop  methodHolder_or_map()    = 0;

  virtual bool isDummy() { return false; }

  virtual int32 scopeID() = 0;

  virtual bool  is_primCall() = 0;          // currently executing a primitive call?
  virtual bool  is_uncommonTrap() = 0;

  bool  is_first_self_vframe() {
    return is_top() && fr->is_first_self_frame(); }

  virtual bool isCallerOf(ScopeDesc* callee) = 0; 

  virtual oop   get_slot(slotDesc* s) = 0;
  virtual void  set_slot(slotDesc* s,  oop x) = 0;

  virtual void get_expr_stack(oop*& stack,
                              smi& len,
                              bool badOopForUnknown = false) = 0;
  virtual oop self()     = 0;
  virtual oop receiver() = 0;
  virtual oop block()    = 0;
  virtual oop methodHolder_object() = 0;

  virtual void createBlocks(abstract_vframe* calleeOrNull,
                            OopOopTable*& blockValues) = 0;

  virtual void enumerate_references(enumeration *e);
  void enumerate_families(enumeration *e);

  virtual bool print_frame(fint curFrame = 0);
  void print_slot(slotDesc* s, oop meth);
  void print() { print_frame(); }
 protected:
  virtual void print_code(fint curFrame) = 0;
  virtual void print_contents();
};


class interpreted_vframe: public abstract_vframe {
 public:
  interpreter* interp() { return fr->get_interpreter(); }

  bool is_compiled() { return false; }

  interpreted_vframe(frame* f);
  interpreted_vframe() {fr = 0;}

 public:
  smiOop  descOffset() { return smiOop_zero; }
  int32   real_bci();

  abstract_vframe* parent();

  bool is_top() { return true; }

  oop  selector();
  oop  delegatee();
  oop  method();
  oop  methodHolder_or_map();

  int32 scopeID()       { return BLOCK_PROTO_DESC->value(); }

  bool  is_primCall();      // currently executing a primitive call?
  bool  is_uncommonTrap() { return false; }
  bool  isCallerOf(ScopeDesc* callee) { Unused(callee);  return false; }

  oop   get_slot(slotDesc* s);
  void  set_slot(slotDesc* s,  oop x);

  void get_expr_stack(oop*& stack,
                      smi& len,
                      bool badOopForUnknown = false);

  oop self();
  oop receiver();
  oop block();
  oop methodHolder_object();

  void createBlocks(abstract_vframe* calleeOrNull, OopOopTable*& blockValues);

  void enumerate_references(enumeration *e);

 protected:
  void print_code(fint curFrame) {Unused(curFrame);}
};


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

class compiled_vframe: public abstract_vframe {
 unknown:
  nmethod* code;
  ScopeDesc* desc;
  RegisterLocator* rl;

 protected:
  int32 _bci;
  
 private:
  void set_rl(RegisterLocator* _rl);

 public:
  bool is_compiled() { return true; }
  RegisterLocator* reg_loc() { return rl; }
  void fix_frame(frame* f);

 unknown:
  
  void codeFromFrame() { code = fr->code(); }
  void descFromCode() {
    PcDesc* d = code->containingPcDesc(fr->return_addr());
    desc = d->containingDesc(code); _bci = d->byteCode; }

  int32 bciFromDesc(ScopeDesc* dc);
  void descFromOffset(smiOop offset) {
    desc = code->scopes->at(offset); _bci = bciFromDesc(desc); }
    
  void rlFromFrame();

  // constructors
  
  compiled_vframe() { fr = 0, code = 0, desc = 0, rl = 0, _bci = 0; }
  
  compiled_vframe(frame* f, nmethod* c, ScopeDesc* d, fint b, RegisterLocator* _r) {
    fr = f; code = c; desc = d; _bci = b; set_rl( _r); }

  compiled_vframe(frame* f, nmethod* c, ScopeDesc* d, fint b) {
    assert( f->is_aligned(), "alignment");
    fr = f; code = c; desc = d; _bci = b; rlFromFrame(); }

  compiled_vframe(frame* f, RegisterLocator* _rl) {
    assert( f->is_aligned(), "alignment");
    fr = f; codeFromFrame(); descFromCode(); set_rl(_rl); }

  compiled_vframe(frame* f) {
    assert( f->is_aligned(), "alignment");
    fr = f; codeFromFrame(); descFromCode(); rlFromFrame(); }

  compiled_vframe(frame* f, smiOop offset, RegisterLocator* r) {
    assert( f->is_aligned(), "alignment");
    fr = f; codeFromFrame(); descFromOffset(offset); set_rl(r); }

  compiled_vframe(frame* f, smiOop offset) {
    assert( f->is_aligned(), "alignment");
    fr = f; codeFromFrame(); descFromOffset(offset); rlFromFrame(); }

  compiled_vframe(frame* f, nmethod* c, smiOop offset) {
    assert( f->is_aligned(), "alignment");
    fr = f; code = c; descFromOffset(offset);  rlFromFrame(); }
  


  bool EQ(abstract_vframe *f) {
    return 
      this == f
      ||     (fr == f->fr
         &&  desc->is_equal(f->as_compiled()->desc)); }

  
 protected:
  abstract_vframe* get_sender(bool skipCFrames);
  
 public:
  int32   real_bci()            { return _bci; }

  smiOop  descOffset()          {
    return as_smiOop(code->scopes->offsetTo(desc)); 
  }

  abstract_vframe* parent();

  oop  selector()       { return desc->key.selector; }
  oop  delegatee()      { return desc->key.delegatee; }
  oop  method()         { return desc->method(); }
  oop  methodHolder_or_map()    { return desc->methodHolder_or_map(); }

  int32 scopeID();

  bool  is_primCall();      // currently executing a primitive call?
  bool  is_uncommonTrap();  // currently executing an uncommon trap?
  bool  is_top();
  bool isCallerOf(ScopeDesc* callee);
  

  // only for compiled_vframe's
  
  NameDesc* get_name_desc(slotDesc* s, bool canFail = false);
  
  NameDesc* get_self_name();
  NameDesc* get_cachedSelf_name();
  NameDesc* get_receiver_name();
  NameDesc* get_block_name();
  NameDesc* get_cachedBlock_name();
  
  int32 register_offset(Location r);
  
  virtual oop* register_contents_addr(Location r);
  virtual oop* register_contents_secondary_addr(Location r);
  # if defined(SIC_COMPILER)
   protected:
    oop* special_register_contents_addr(Location r);
   public:
# endif
  oop register_contents(Location r) { return *register_contents_addr(r); }
 public:
  oop  get_contents(NameDesc* n, bool cloneMemoizedBlocks = true,
                    bool cloneEliminatedBlocks = false);
 protected:
  bool verify_NameDesc_for_get_contents(NameDesc*);
  void get_search_locations_for_liveness_check(NameDesc* n, frame*& fr_to_search, RegisterLocator*& rl_to_search);
 
 public:
  void set_contents(NameDesc* n, oop p);

  oop  get_slot(slotDesc* s);
  // this one is just for compiled frames
  oop  get_slot2(slotDesc* s, bool clone1, bool clone2);

  void  set_slot(slotDesc* s,  oop x);

  void get_expr_stack(oop*& stack,
                      smi& len,
                      bool badOopForUnknown = false);

  // only for compiled
  void get_exprStackInfo(compiled_vframe* calleeOrNull,
                         compiled_vframe**& vfs,
                         NameDesc**& nds,
                         smi& len,
                         bool includeArgs = true);

 protected:
  // plat-specific:
  compiled_vframe* sendeeOrNULL_for_get_expr_stack();
  
  // helpers for get_exprStackInfo
  void get_exprStackInfo_outgoing_args(
                        methodMap*          mm,
                        compiled_vframe*    calleeOrNull,
                        compiled_vframe**   vfs,
                        NameDesc**          nds,
                        fint                i,
                        smi                 len,
                        IntListElem*        e2 );
                        
  void get_outgoing_arg_info_from_dummy_callee( 
                        bool               isReceiverExplicit,
                        compiled_vframe*   calleeOrNull,
                        compiled_vframe**  vfs,
                        NameDesc**         nds,
                        fint&              i,
                        smi                len,
                        oop                sel );
                        
 void get_outgoing_arg_info_no_sendee( 
                        compiled_vframe**  vfs,
                        NameDesc**         nds,
                        fint&              i,
                        smi                len,
                        IntListElem*       e2 );
                        
  void get_outgoing_arg_info_from_sendee( 
                        bool               isReceiverExplicit, 
                        compiled_vframe*   calleeOrNull,
                        compiled_vframe**  vfs, 
                        NameDesc**         nds, 
                        fint&              i );

 
 public:
  oop self()  { return get_contents(get_self_name()); }
  oop receiver() { return get_contents(get_receiver_name()); }
  oop block() { return get_contents(get_block_name()); }
  
  oop methodHolder_object() {
    if (desc->isDeadBlockScope())
      return self(); // methodHolder_or_map() would fail -- dmu 6/99
    oop mh = methodHolder_or_map();
    if (mh->is_map()) {
      // method holder is the same as self
      return self();
    } else {
      return mh;
    } }

  
  // conversion functions
  // XXXXX not done yet for interp

  // (internal)
  
  oop  copyValueFrom( compiled_vframe* toVF, NameDesc* fromNd, frame* oldBlockHome, OopOopTable* blockValues);
  
  void copyValueTo( NameDesc* n, oop x );
  
  void copyValue(NameDesc* n, compiled_vframe* vf2, NameDesc* n2, frame* f,
                 OopOopTable* blockValues);

  void valuesDo( compiled_vframe* vf,
                 compiled_vframe* calleeOrNull,
                 vfValueDoFn fn,
                 bool wasInInterruptCheck);

  void createBlock(NameDesc* n, OopOopTable*& blockValues);

  // (external)
  
  void copyValuesFrom  (compiled_vframe* vf,
                        compiled_vframe* callee,
                        frame* blockHome,
                        OopOopTable*& blockValues,
                        bool wasInInterruptCheck);
  void copyOutgoingArgs(compiled_vframe* vf,
                        frame* oldBlockHome,
                        OopOopTable*& blockValues,
                        bool lastOnly);
 protected:
  void prepareToCopyOutgoingArgs(
                         compiled_vframe* vf, 
                         IntListElem*& e, bool& isUncommon,
                         fint& startingArgNo, fint& performSelArgNo, fint& performDelArgNo);
  
  void copy_outgoing_arg( fint argNo,          // -1 for rcvr
                          NameDesc* nd2,       // for src caller's expr stack elem
                          compiled_vframe* vf, // src caller's vframe
                          dummy_vframe* dummy, // old callee
                          NameDesc* nd,        // dst nameDesc
                          frame* oldBlkHome, 
                          OopOopTable* blkValues);
 
 public:
  void createBlocks(abstract_vframe* calleeOrNull, OopOopTable*& blockValues);

  
  void enumerate_references(enumeration *e);
  
  bool print_frame(fint curFrame = 0);
 protected:
  void print_code(fint curFrame);
};

// used to represent the callee of the actual last vframe (to get at out-
// going args)...somewhat hacky - only get_contents is guaranteed to work
class dummy_vframe : public compiled_vframe {
 public:
  friend dummy_vframe* new_dummy_vframe(frame* sender);
  dummy_vframe(frame* f, nmethod* c, ScopeDesc* d, fint b)
    : compiled_vframe(f, c, d, b) {}
  oop* register_contents_addr(Location r);
  bool isDummy() { return true; }
  void print();
};


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)


extern abstract_vframe* new_vframe(frame* f, RegisterLocator* _rl = 0);
extern abstract_vframe* new_vframe(frame* f, smiOop offset, RegisterLocator* _rl = 0);
