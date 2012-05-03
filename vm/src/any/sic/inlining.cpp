/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# pragma implementation "inlining.hh"
# include "_inlining.cpp.incl"

# ifdef SIC_COMPILER

/* JAD - 4/15/92.  Checks to see if the given selector is one of a list
   which is recognized as both common and cheap.  This is kind of hack.   */

  bool isCheapMessage(stringOop selector) {
    return
        selector == VMString[OR] || selector == VMString[AND] ||
        selector == VMString[XOR] ||
        selector == VMString[IF_TRUE_] ||
        selector == VMString[IF_FALSE_] ||
        selector == VMString[IF_TRUE_FALSE_] ||
        selector == VMString[IF_FALSE_TRUE_] ||
        selector == VMString[NOT] ||
        selector == VMString[PLUS] || selector == VMString[MINUS] ||
        selector == VMString[TIMES] || selector == VMString[DIVIDE] ||
        selector == VMString[PERCENT] ||
        selector == VMString[EQUAL] ||
        selector == VMString[NOT_EQUAL] ||
        selector == VMString[LESS_THAN] ||
        selector == VMString[LESS_EQUAL] || 
        selector == VMString[GREATER_EQUAL] ||
        selector == VMString[GREATER_THAN] ||
        selector == VMString[COMPARE_LESS_EQUAL_GREATER_] ||
        selector == VMString[TO_DO_] || 
        selector == VMString[TO_BY_DO_] || 
        selector == VMString[UP_TO_DO_] || 
        selector == VMString[UP_TO_BY_DO_] || 
        selector == VMString[DOWN_TO_DO_] || 
        selector == VMString[DOWN_TO_BY_DO_] || 
        selector == VMString[SUCCESSOR] ||
        selector == VMString[SUCC] ||
        selector == VMString[PREDECESSOR] ||
        selector == VMString[PRED] ||
        selector == VMString[NEGATE] ||
        selector == VMString[COMPLEMENT] ||
        selector == VMString[INVERSE] ||
        selector == VMString[AS_FLOAT] ||
        selector == VMString[ASSMALLINTEGER] ||
        selector == VMString[AT_] ||
        selector == VMString[AT_PUT_] ||
        selector == VMString[SIZE];
  }

  bool isCheapMessage(stringOop selector, mapOop map) {
    // same as above, but checks receiver map
            if (
                selector == VMString[OR] || selector == VMString[AND] ||
                selector == VMString[XOR] ||
                selector == VMString[IF_TRUE_] ||
                selector == VMString[IF_FALSE_] ||
                selector == VMString[IF_TRUE_FALSE_] ||
                selector == VMString[IF_FALSE_TRUE_] ||
                selector == VMString[NOT]) {
      return map == Memory->true_mapOop() || map == Memory->false_mapOop();
    } else if (
               selector == VMString[PLUS] || selector == VMString[MINUS] ||
               selector == VMString[TIMES] || selector == VMString[DIVIDE] ||
               selector == VMString[PERCENT] ||
               selector == VMString[EQUAL] ||
               selector == VMString[NOT_EQUAL] ||
               selector == VMString[LESS_THAN] ||
               selector == VMString[LESS_EQUAL] || 
               selector == VMString[GREATER_EQUAL] ||
               selector == VMString[GREATER_THAN] ||
               selector == VMString[COMPARE_LESS_EQUAL_GREATER_] ||
               selector == VMString[TO_DO_] || 
               selector == VMString[TO_BY_DO_] || 
               selector == VMString[UP_TO_DO_] || 
               selector == VMString[UP_TO_BY_DO_] || 
               selector == VMString[DOWN_TO_DO_] || 
               selector == VMString[DOWN_TO_BY_DO_] || 
               selector == VMString[SUCCESSOR] ||
               selector == VMString[SUCC] ||
               selector == VMString[PREDECESSOR] ||
               selector == VMString[PRED] ||
               selector == VMString[NEGATE] ||
               selector == VMString[COMPLEMENT] ||
               selector == VMString[INVERSE] ||
               selector == VMString[AS_FLOAT] ||
               selector == VMString[ASSMALLINTEGER]) {
      Map* m = map->map_addr();
      return m == Memory->smi_map;
    } else if (
               selector == VMString[AT_] ||
               selector == VMString[AT_PUT_] ||
               selector == VMString[SIZE]) {
      Map* m = map->map_addr();
      return m->is_objVector() || m->is_byteVector();
    } else {
      return false;
    }
  }

  bool isReallyCheapMessage(stringOop selector, mapOop map) {
    // a stripped-down version of isCheapMessage that is safer (i.e., checks
    // the map as well as the selector)
    // it is used to figure out whether to allow further inlining even if
    // total size limit for nmethod has been reached
           if (
               selector == VMString[OR] || selector == VMString[AND] ||
               selector == VMString[XOR] ||
               selector == VMString[IF_TRUE_] ||
               selector == VMString[IF_FALSE_] ||
               selector == VMString[IF_TRUE_FALSE_] ||
               selector == VMString[IF_FALSE_TRUE_] ||
               selector == VMString[NOT]) {
      return map == Memory->true_mapOop() || map == Memory->false_mapOop();
    } else if (
               selector == VMString[PLUS] || selector == VMString[MINUS] ||
               selector == VMString[TIMES] || selector == VMString[DIVIDE] ||
               selector == VMString[PERCENT] ||
               selector == VMString[EQUAL] ||
               selector == VMString[NOT_EQUAL] ||
               selector == VMString[LESS_THAN] ||
               selector == VMString[LESS_EQUAL] || 
               selector == VMString[GREATER_EQUAL] ||
               selector == VMString[GREATER_THAN] ||
               selector == VMString[COMPARE_LESS_EQUAL_GREATER_] ||
               
               selector == VMString[SUCCESSOR] ||
               selector == VMString[SUCC] ||
               selector == VMString[PREDECESSOR] ||
               selector == VMString[PRED] ||
               selector == VMString[NEGATE] ||
               selector == VMString[COMPLEMENT] ||
               selector == VMString[INVERSE] ||
               selector == VMString[ASSMALLINTEGER]) {
      Map* m = map->map_addr();
      return m == Memory->smi_map;
    } else if (
               selector == VMString[AT_] ||
               selector == VMString[AT_PUT_] ||
               selector == VMString[SIZE]) {
      Map* m = map->map_addr();
      return m->is_objVector() || m->is_byteVector();
    } else {
      return false;
    }
  }

  // If these methods are NIC_compiled, the invocation counts of the subsequent
  // "value" sends make it harder to recognize what to recompile.  Essentially,
  // the problem is that the top few block methods below loop belong to the
  // control structure (whileTrue), and part of them to the actual user code.
  // Inlining these blocks away eliminates the distortion (and makes loops go
  // somewhat faster).
  // Strictly speaking, only whileTrue is critical; the rest are here for
  // better speed / less block cloning.
  bool isCriticalMessage(oop selector) {
    return
        selector == VMString[IF_TRUE_] ||
        selector == VMString[IF_FALSE_] ||
        selector == VMString[WHILETRUE_] ||
        selector == VMString[WHILEFALSE_] ||
        selector == VMString[UNTILTRUE_] ||
        selector == VMString[UNTILFALSE_] ||
        selector == VMString[TO_BY_DO_] ||
        selector == VMString[TO_BYPOSITIVE_DO_] ||
        selector == VMString[TO_BYNEGATIVE_DO_] ||
        selector == VMString[UP_TO_DO_] ||
        selector == VMString[UP_TO_BY_DO_] ||
        selector == VMString[DOWN_TO_DO_] ||
        selector == VMString[DOWN_TO_BY_DO_];
  }

  bool isSmalltalkInlined(oop selector) {
    // for comparison with PP ST; everything *whithin* these messages is
    // also inlined if possible
    return
        selector == VMString[IF_TRUE_] ||
        selector == VMString[IF_FALSE_] ||
        selector == VMString[IF_TRUE_FALSE_] ||
        selector == VMString[IF_FALSE_TRUE_] ||
        selector == VMString[WHILETRUE_] ||
        selector == VMString[WHILEFALSE_] ||
        selector == VMString[TO_BY_DO_] ||
        selector == VMString[PLUS] || selector == VMString[MINUS];
  }

  static MapBList* methodStack;

  static bool checkLocalSlot(stringOop sel, checkLocalSendFn isLocal) {
    assert(!UseLocalAccessBytecodes, "relic of the past");
    for (fint i = methodStack->length() - 1; i >= 0; i--) {
      if (methodStack->nth(i)->find_slot(sel) != NULL) return true;
    }
    return isLocal(sel);
  }
  
  
  class methodAppraiser: public abstract_interpreter {
   public:
   
    checkLocalSendFn isLocal;
    CostParam*       cp;
    fint             cutoff;
    BoolBList        penaltyStack;  // to keep track of block args
    fint                                           cost;
    fint                   failLen;
   
    methodAppraiser( oop meth,
                     checkLocalSendFn isLoc,
                     CostParam* cp_arg,
                     fint cutoff_arg);
                     
    void interpret_method();
                     
    void do_SELF_CODE() { penaltyStack.push(false);  failLen= 0; }
    void do_POP_CODE()  { penaltyStack.pop();        failLen= 0; }
    void do_DELEGATEE_CODE() { failLen= 0; }
    void do_UNDIRECTED_RESEND_CODE() { failLen= 0; }
    void do_read_write_local_code(bool isWrite);
    void do_send_code( bool isSelfImplicit, stringOop selector, fint arg_count);
    void do_literal_code( oop lit);
    
    void do_BRANCH_CODE()          { failLen= 0; }
    void do_BRANCH_TRUE_CODE()     { penaltyStack.pop();  failLen= 0; }
    void do_BRANCH_FALSE_CODE()    { penaltyStack.pop();  failLen= 0; }
    void do_BRANCH_INDEXED_CODE()  { penaltyStack.pop();  failLen= 0; }

    
    void check_penalty_stack();      
  };


  methodAppraiser::methodAppraiser( oop meth,
                                    checkLocalSendFn isLoc,
                                    CostParam* cp_arg,
                                    fint cutoff_arg) 
  : abstract_interpreter(meth), 
    penaltyStack( mi.length_codes) {
    isLocal= isLoc;
    cp= cp_arg;
    cutoff= cutoff_arg;
    cost= failLen= 0;
  }
  
  
  void methodAppraiser::interpret_method() {
    methodStack->push(mi.map());
    abstract_interpreter::interpret_method();
#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        check_penalty_stack();
      }
#   endif
    methodStack->pop();    
  }
  
  
  void methodAppraiser::do_read_write_local_code( bool isWrite) {
    if (isWrite)
      penaltyStack.pop();
      
    cost += cp->localSendCost;
    failLen= 0;
    penaltyStack.push(false);
  }
  
  
  void methodAppraiser::do_literal_code( oop lit ) {
    bool isBlk= lit->is_block_with_code();
    penaltyStack.push(isBlk);
    if (isBlk) {
      failLen= methodCost( blockOop(lit)->value(), isLocal, cp, cutoff);
      cost += failLen;
    }
  }
  
  
  void methodAppraiser::do_send_code( bool isSelfImplicit, stringOop sel, fint argc) {
                if (!isSelfImplicit) ++argc; // Explicit receiver
                bool penaltyFlag = false;
                for (fint argnum = 0; argnum < argc; argnum++) {
                  penaltyFlag |= penaltyStack.pop();
                }
                if (sel->is_prim_name()) {
                  // a primitive; don't count the previous fail block in total length
                  cost -= failLen;
                  cost += cp->primCallCost;
                } 
                else if (isCheapMessage(sel)) {
                  cost += cp->cheapSendCost;
                } 
                else if (!UseLocalAccessBytecodes
                       &&  isSelfImplicit
                       &&  !( is.is_undirected_resend || is.delegatee )
                       &&  checkLocalSlot(sel, isLocal)) {
      // a local slot access
                  cost += cp->localSendCost;
                } else {
                  cost += isSelfImplicit ? cp->selfSendCost : cp->unknownSendCost;
                  if (penaltyFlag)  cost += cp->blockArgPenalty;
                }
                failLen = 0;
                penaltyStack.push(false);  // penalties already taken into account
  }
    
    
  void methodAppraiser::check_penalty_stack() {
    assert(penaltyStack.length() == 1, 
           "Penalty stack should have only last expr.");
  }
  
  
  // remove isLocal argument when UseLocalAccessBytecodes is always true

  fint methodCost(oop meth, checkLocalSendFn isLocal,
                  CostParam* cp, fint cutoff) {
    methodAppraiser ma(meth, isLocal, cp, cutoff);
    ma.interpret_method();
    return ma.cost;
  }

  CostParam* costP;
  CostParam* failCostP;

  static SCodeScope* checkLocal_scope; // remove when UseLocalAccessBytecodes is always true
  static bool checkLocal(stringOop sel) {
    assert(!UseLocalAccessBytecodes, "relic of the past");
    slotDesc* sd;
    return checkLocal_scope->lookup(sel, sd) != NULL;
  }

  fint sicCost(oop meth, SCodeScope* s, CostParam* cp) {
    checkLocal_scope = s;
    return methodCost(meth, checkLocal, cp, 9999);
  }
    

  void inlining_init() {
    methodStack = new MapBList(100, true);
      costP     = new CostParam(0, 1, 1, 1, 2, 1);            // normal sends
      failCostP = new CostParam(1, 2, 2, 4, 2, 2);            // prim failure blks
  }

# else // SIC_COMPILER
 void inlining_init() {}
# endif
