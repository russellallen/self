/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# ifdef SIC_COMPILER
  // code generation utility functions for the SIC

  extern NodeGen* theNodeGen;

  class NodeGen : public ResourceObj {
    SSelfScopeBList* scopeStack;// stack of active scopes
   public:
    Node* start;                // start of code
    Node* current;
    
    compilingLookup* L; // copies of compiler's stuff for convenience
    sendDesc* send_desc;
    nmln* diLink;
    bool haveStackFrame;        // create stack frame?

    NodeGen(compilingLookup* k, sendDesc* sd, nmln* d);
    ~NodeGen() { theNodeGen = NULL; }

    // fixed registers
    PReg  *delPR, *selPR,
          *nlrHomePR, *nlrHomeIDPR, *nlrResultPR, *nlrTempPR,
          *framePR, *noPR;
    
    void enterScope(SSelfScope* s);
    void exitScope (SSelfScope* s);
    SSelfScope* currentScope() {
      return scopeStack->isEmpty() ? NULL : scopeStack->top(); }
    Node* append(Node* n);
    Node* comment(char* s);
    
    void prologue(bool needToFlushRegWindow, bool isAccessMethod, fint nargs);
    void testStackOverflow(PRegBList* exprStack, SplitSig* s);
    
    void loadBlockParent(PReg* block, PReg* dst);
   public:
    void loadSaved(PReg* frame, nmethod* nm, NameDesc* nd, PReg* dest,
                   oop name);
    void storeSaved(PReg* value, PReg* frame, nmethod* nm, NameDesc* nd,
                    oop name);
#   ifdef UNUSED
    void loadSender(PReg* sp, PReg* dest);
#   endif

    void pathAssign(PReg* rcvr,
                    realSlotRef* path,
                    PReg* val,
                    bool checkStore);
    void pathLookup(realSlotRef* path,
                    PReg* receiver,
                    PReg* dest);
   protected:
    PReg* loadPath(lookupTarget* target,
                   PReg* receiver,
                   PReg* dest);
   public:
    Node* restart(MergeNode* loopStart, PRegBList* exprStack, SplitSig* s);
    
    Node* selfCall(SCodeScope* sc, LookupType l, PReg* self, oop sel,
                   oop del, oop mh, MergeNode* nlrPoint, fint argc,
                   PRegBList* exprStack, SplitSig* s);
    Node* perform (SCodeScope* sc, LookupType l, PReg* self, fint argc,
                   oop del, oop mh, MergeNode* nlrPoint, PRegBList* exprStack,
                   SplitSig* s);
    PrimNode* primCall(SCodeScope* sc, PrimDesc* p, MergeNode* nlrPoint,
                       fint argc, PRegBList* exprStack, 
                       SplitSig* s, BlockPReg* failBlock);
    Node* uncommonBranch(PRegBList* exprStack, bool restartSend);
    
    void nonLifoTrap(PRegBList* exprStack, SplitSig* s);
    void deadEnd();
    void loadOop(oop p, PReg* dest);
    void loadBlockOop(BlockPReg* b, SplitSig* s);
   public:
    void move(PReg* from, PReg* to);
    void loadArg(fint argNo, PReg* from, bool isPrimCall);
                                    // load arg into argument register argNo
    void loadArg(PReg* from, PReg* to);         // load arg into register to
    
    void materializeBlock(PReg* r, SplitSig* s, PRegBList* materialized,
                          bool recursive = false);
        // must be called before loadArg to create memoized blocks
    void zapBlock(BlockPReg* block);
    void prepareNLR(PReg* result, PReg* scope, smi homeID);
    Node* testNLR(smi id);
    void continueNonLocalReturn();
    void branch(MergeNode* target);
    
    
    void branchCode( MergeNode*           targetNode,
                     bool                 isBackwards,
                     PReg*                targetPR,
                     SExpr*               testExpr,
                     BranchBCTargetStack* targetStack,
                     SExprStack*          exprStack,
                     PRegBList*           exprStackPRs, 
                     SplitSig*            s );
                     
    char* splitCondBranch( MergeNode*           targetNode,
                           bool                 isBackwards,
                           PReg*                targetPR,
                           SExpr*               testExpr,
                           BranchBCTargetStack* targetStack,
                           SExprStack*          exprStack,
                           PRegBList*           exprStackPRs, 
                           SplitSig*            s );
                          
    void branchIndexedCode( int32                 nCases,
                            MergeNode**           targetNode,
                            bool*                 isBackwards,
                            PReg*                 testPR,
                            BranchBCTargetStack** targetStacks,
                            SExprStack*           exprStack,
                            PRegBList*            exprStackPRs, 
                            SplitSig*             s );
                           
   protected:
     void appendBranchCodeNodes( int32                whichSucc, 
                                 bool                 isBackwards,
                                 MergeNode*           target,
                                 BranchBCTargetStack* targetStack,
                                 SExprStack*          exprStack,
                                 PRegBList*           exprStackPRs,
                                 SplitSig*            s );

    
   private:
    void jumpTo(void* target, PReg* reg, PReg* link);
    PReg* moveToReg(PReg* what, PReg* reg);

   public:
    void print_short();
  };

# endif

