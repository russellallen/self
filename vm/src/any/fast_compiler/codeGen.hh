/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef FAST_COMPILER


# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// code generation interface for the NIC

extern class CodeGen* theCodeGen;

class CodeGen: public ResourceObj {
  pc_t prologueAddr;           // addr of instruction creating stack frame
  fint _incoming_arg_count;

 public:
  Assembler a;                  // instructions
  ScopeDescRecorder* scopeDescs;

  int32 frameSize;
  int32 verifiedOffset;         // entry point after map test
  int32 diCheckOffset;          //   "     "   before di checks

  int32 frameCreationOffset;    //   "     "   before di checks

  compilingLookup* L;           // copies of compiler's stuff for convenience
  sendDesc* send_desc;
  nmln* diLink;
    
  bool needToFlushRegWindow;
  bool haveStackFrame;
  
  CodeGen(compilingLookup* l, sendDesc* sd, nmln* d);
  ~CodeGen() { theCodeGen = NULL; }

  void prologue(bool isAccessMethod, fint nargs);
  Label* postPrologue(RegisterState* s, bool frequentPreemption);
  void   testStackOverflow(RegisterState* s);
  void testStackOverflowForLoop( Label*& dst, Label*& nlr, RegisterState* s); // allocs labels and sets dst and nlr (nlr may be set to NULL)
  void epilogue(Location what = IllegalLocation);
  void fixupFrame(RegisterState* s);
    // to fix up the instruction creating the stack frame

  void assignment(Location receiver, slotDesc* s, Location val);
  void assignment(Location rcvr, realSlotRef* path, Location val,
                  bool isMem = true);
  void loadBlockParent(Location block, Location dst);
  Location flushToStack(Location reg, RegisterState* s);
  void loadSaved(Location dest, Location loc, Location sp, compiled_vframe* src_vf);
  void storeSaved(Location loc, Location sp, compiled_vframe* dst_vf, Location value);
#ifdef UNUSED
  void loadSender(Location dest, Location sp);
#endif
  void recordStore(Location dst);
  void lookup(Location dest, realSlotRef* path, Location receiver);

  // the call functions all return the Label of the NLR jump (if any)
  Label* SendDesc(RegisterState* s, LookupType l,
                  oop selector = badOop, oop delegatee = badOop);
  Label* cPrimCall(PrimDesc* p, RegisterState* s, bool continueNLR, bool trust_fns_arg_count, fint arg_and_rcvr_count);
  Label* selfCall(RegisterState* s, LookupType lookupType,
                  Location receiver, Location self,
                  oop selector, oop delegatee, fint argc);
  Label* perform (RegisterState* s, LookupType lookupType,
                  Location receiver, Location self, fint argc,
                  oop delegatee);
  Label* primFailure(Location failReceiver, Location self, oop failSelector,
                     oop selector, Location successLoc,
                     blockOop failBlock, RegisterState* s);
              
  void nonLifoTrap(RegisterState*);
  void loadOop(Location dest, oop p);
  void loadOop(Location dest_register, Location src_register, slotDesc* s);
  void loadBlockOop(Location dest, slotsOop block, RegisterState* s);
  Location loadPath(Location dest, lookupTarget* target, Location receiver, Location temp_reg);
  void loadImmediate(Location dest, int32 value);
  void loadArg(fint argNo, Location from, bool isPrimCall);

  void zapBlock(Location block, bool memoized);
  void prepareNLR(Location result, Location scope, smi homeID);
  void testAndContinueNLR(smi id);
  void continueNonLocalReturn();
  Label* branch();
  
  Label* unconditionalBranchCode( Label* dst, // allocated by caller
                                  bool allowPreemption, 
                                  RegisterState* s );
  Label*   conditionalBranchCode( Location testMe, 
                                  oop target, 
                                  Label* dst,  // allocated by caller
                                  bool allowPreemption,  
                                  RegisterState* s );
  Label*      indexedBranchCode(  Location testMe, 
                                  LabelList* labels, // allocated by caller
                                  bool allowPreemption, 
                                  RegisterState* s );
                                  
  void assignmentCode(realSlotRef* dataRef);

  fint incoming_arg_count()                     { return _incoming_arg_count; }


 private:
  void initialize_for_platform();
  void checkRecompilation();
  void genCountCode(int32* counter);
  inline void jumpTo(void* target, Location reg, Location link);
  
  void checkOop(Label& generalMissHandler, oop what, Location loc_to_check); // generalMissHandler alloc'ed by caller
  fint verifyParents(objectLookupTarget* target, Location t, fint count);
  
  static PrimDesc *intrCheck(), *blockClone();


# include "_codeGen_pd.hh.incl"
};

# endif // FAST_COMPILER

