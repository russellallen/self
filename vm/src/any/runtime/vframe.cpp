/* Sun-$Revision: 30.13 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "vframe.hh"
# include "_vframe.cpp.incl"

# define CHECK                                                                \
  if (e->is_target(obj)) {                                                    \
    Process* p = processes->stackFor(fr)->process;                            \
    e->add_obj(new_vframeOop(p, this)); return;                               \
  }                                                                           \
    
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

dummy_vframe* new_dummy_vframe(frame* sender) {
  // create a dummy vframe for the callee
  if (!sender) sender = currentProcess->last_self_frame(false);
  nmethod* callee = NULL;
  ScopeDesc* desc = NULL;
  // try to fill dummy vf with decent information (get_contents will work
  // anyway, but printing etc will break)
  sendDesc* sd = sender->send_desc();
  if (sd) {
    CacheStub *pic= sd->pic();
    callee= pic ? NULL : sd->get_method();
  }
  return new dummy_vframe(sender, callee, desc, PrologueBCI);
}


void dummy_vframe::print() {
  lprintf("DUMMY ");
  if (desc) {
    compiled_vframe::print();
  } else {
    lprintf("*(dummy_vframe*)%#lx\n", this);
  }
}


void compiled_vframe::set_rl(RegisterLocator* r) {
  assert(r && r->fr() == fr, "");
  rl = r;
}


bool compiled_vframe::is_primCall() {
  // Works only if the vframe is in a call or uncommon trap.
  // Used to distinguish between prim call and failure block. 
  abstract_vframe* bottomVF = new_vframe(fr, reg_loc());
  if (this->EQ(bottomVF)) {
    sendDesc* sd = fr->send_desc();
    return sd && sd->isPrimCall();
  } else {
    // not bottom vframe in frame --> can't be a primitive call
    return false;
  }
}


bool compiled_vframe::is_uncommonTrap() {
  compiled_vframe* bottomVF = new compiled_vframe(fr, reg_loc());
  if (this->EQ(bottomVF)) {
    return fr->return_addr() == currentProcess->uncommonPC();
  } else {
    // not bottom vframe in frame --> can't be an uncommon trap
    return false;
  }
}


// first because of trouble with inlined functions
void compiled_vframe::set_contents(NameDesc* n, oop p) {
  if (n->isLocation()) {
    oop* addr = register_contents_addr(n->location());
    *addr = p;
    oop* addr2 = register_contents_secondary_addr(n->location());
    if (addr2 != NULL)  *addr2 = p;
  } else if (n->isMemoizedBlock()) {
    assert(p->is_block() &&
           blockOop(p)->scope(true) != (frame*) BLOCK_PROTO_SCOPE,
           "should be storing a real block into a memoized block location");
    oop* addr = register_contents_addr(n->location());
    *addr = p;
    oop* addr2 = register_contents_secondary_addr(n->location());
    if (addr2 != NULL)  *addr2 = p;
  } else if (n->isValue()) {
    assert(p == n->value(), "should be the same");
  } else {
    assert(n->isBlockValue(), "unexpected name desc");
    assert(p->is_block() && n->value()->is_block() &&
           blockOop(p)->value() == blockOop(n->value())->value(),
           "should be the same block");
  }
}


int32 compiled_vframe::bciFromDesc(ScopeDesc* dc) {
  PcDesc* d = code->containingPcDesc(fr->return_addr());
  int32 bci = d->byteCode;
  ScopeDesc* s = d->containingDesc(code);
  while (!s->is_equal(dc)) {
    bci = s->senderByteCodeIndex();
    assert(s->sender(), "sender must be present to continue");
    s = s->sender();
  }
  return bci;
}

void compiled_vframe::rlFromFrame() {
    set_rl(RegisterLocator::for_frame(fr));
}

bool compiled_vframe::isCallerOf(ScopeDesc* callee) {
  // true iff both are in same frame and this vframe could have
  // called the callee (note: callee may not be live anymore)
  ScopeDesc* s = callee->sender();
  while (s) {
    if (s->is_equal(desc)) return true;         // yes, I am in caller chain
    s = s->sender();
  }
  return false;
}


abstract_vframe* compiled_vframe::get_sender(bool skipC) {
  ScopeDesc* c = desc->sender();
  if (c != NULL) {
    int32 cbci = desc->senderByteCodeIndex();
    return new compiled_vframe(fr, code, c, cbci, reg_loc());
  }
  return abstract_vframe::get_sender(skipC);
}


// cannot have interp frame as parent

abstract_vframe* compiled_vframe::parent() {
  ScopeDesc* d = desc;
  ScopeDesc* c = d->parent();
  if (c == NULL) {
    if (d->isDeadBlockScope()) {
      // non-LIFO block
      return NULL;
    } else if (d->isTopLevelBlockScope()) {
      return abstract_vframe::parent();
    } else {
      assert(d->isHome(), "unexpected scope kind");
      return NULL;
    }
  } else {
    int32 cbci = bciFromDesc(c);
    return new compiled_vframe(fr, code, c, cbci, reg_loc());
  }
}



oop compiled_vframe::get_contents(NameDesc* n,
                                  bool cloneMemoizedBlock,
                                  bool cloneEliminatedBlock) {
  assert(verify_NameDesc_for_get_contents(n), "just checking");                                
  if (n->isLocation()) {
    Location loc = n->location();
    oop* addr = register_contents_addr(loc);
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
        // can report "oop is marked" during enumerations
        // (*addr)->verify();
    }
#   endif
    return *addr;
  }
  if (n->isValue()) {
    return n->value();
  } 
  if (n->isBlockValue()) {
    return
      cloneEliminatedBlock
      ? blockOop(n->value())->clone_block((smiOop)fr->block_scope_of_home_frame())
      : n->value();
  } 
  assert(n->isMemoizedBlock(), "unexpected name desc");
  oop* bp = register_contents_addr(n->location());
  oop b = *bp;
  if (b != NULL && b != Memory->deadBlockObj) {
    assert(b->is_block(), "should be a block");
    return b;
  }
  b = n->value();
  assert(b->is_block(), "should be a block"); // added for PPCSIC -- dmu 12/02
  // memoized block isn't cloned yet; do it now
  if (!cloneMemoizedBlock) {
    return b;
  }    
  b= blockOop(b)->clone_block((smiOop)fr->block_scope_of_home_frame());
  *bp = b;
  oop* bp2 = register_contents_secondary_addr(n->location());
  if (bp2 != NULL)  *bp2 = b;
  
  return b;
}


static oop* checkAddr;
static void checkAddrFn(oop* p) { if (p == checkAddr) checkAddr = NULL; }

bool compiled_vframe::verify_NameDesc_for_get_contents(NameDesc* n) {
  // check if location is marked live in register mask
      
  // NB: test for is_compiled_self_frame() is necessary because the frame's
  // return address may not have been set yet (e.g. during conversions);
  // isPrimCall covers ubDescs and (possibly non-mask) prims
  if ( ConversionInProgress 
                      // stack_locations_do may break
                      // for last copiedFrame (sender sp may be < own sp)
  ||   isDummy() 
  ||   !n->hasLocation() 
  ||   !fr->is_compiled_self_frame()
  ||   fr->send_desc() == NULL 
  ||   fr->send_desc()->isPrimCall())
          return true;

  frame* fr_to_search = NULL;
  RegisterLocator* rl_to_search = NULL;
  get_search_locations_for_liveness_check(n, fr_to_search, rl_to_search);        
  checkAddr = register_contents_addr(n->location()); 
  fr_to_search->stack_locations_do(checkAddrFn, rl_to_search);
          
  if (checkAddr != NULL) {
    n->print();
    error("location (above) isn't live; repeating for the debugger");        
    checkAddr = register_contents_addr(n->location()); 
    fr_to_search->stack_locations_do(checkAddrFn, rl_to_search);
    fatal("location (above) still isn't live");
  }

  checkAddr = register_contents_secondary_addr(n->location()); 
  if (checkAddr == NULL)
    return true;

  fr_to_search->stack_locations_do(checkAddrFn, rl_to_search);
  if (checkAddr == NULL)
    return true;

  n->print();
  error("location (above) isn't live; repeating for the debugger");        
  checkAddr = register_contents_secondary_addr(n->location()); 
  fr_to_search->stack_locations_do(checkAddrFn, rl_to_search);
  fatal("location (above) still isn't live");
  return false; // silence the compiler
}


void compiled_vframe::createBlock(NameDesc* n, OopOopTable*& blockValues) {
  // if the value described by n is an uncreated block, create it and add
  // it to the table of created blocks
  if (!(n->isBlockValue() || n->isMemoizedBlock())) return;
  oop p = get_contents(n, false);
  assert_block(p, "must be a block");

  oop clone = blockValues->lookup(p);
  if (clone == NULL) {
    if (blockOop(p)->scope(true) == NULL) {
      frame* home = fr->block_scope_of_home_frame();
      clone = blockOop(p)->clone_block(smiOop(home));
    } else {
      assert(n->isMemoizedBlock(), "must be a memoized block");
      clone = p;
    }
    blockValues = blockValues->storeNew(p, clone);
  }
}


void compiled_vframe::get_outgoing_arg_info_from_dummy_callee( 
                        bool               isReceiverExplicit,
                        compiled_vframe*   calleeOrNull,
                        compiled_vframe**  vfs,
                        NameDesc**         nds,
                        fint&              i,
                        smi                len,
                        oop                sel ) {
  // no info on outgoing args in scopeDesc - get them from callee
  // callee is a dummy vframe - must make up fake nameDescs
  // (would be cleaner to make up fake scopeDesc in new_dummy_vframe but
  // that's currently quite hard to do)
  if (isReceiverExplicit) {
    vfs[i] = calleeOrNull;
    nds[i] = new LocationNameDesc(IReceiverReg, 0);
    i++;
  }
  if (sel->is_string()) {
    if (stringOop(sel)->has__Perform__prefix()) {
      // arghhh!  performs are not primitive calls; selector is passed
      // in special register which isn't necessarily live anymore
      
      //  why not check for _PerformResend: too? -- dmu
      vfs[i] = this;
      nds[i] = new IllegalNameDesc();
      i++;
    }
  }
  for (fint argNo = 0; i < len;  i++, argNo++) {
    vfs[i] = calleeOrNull;
    nds[i] = new LocationNameDesc(IArgLocation(argNo), 0);
  }
}


// Only used for conversion...

void compiled_vframe::copyOutgoingArgs( compiled_vframe* vf,
                                        frame* oldBlkHome,
                                        OopOopTable*& blkValues,
                                        bool lastOnly ) {

  // copy the outgoing arguments of the current send; receiver/vf is/was the
  // most recent activation on the stack
  // if lastOnly, copy only the last expr stack element
  
  assert(desc->s_equivalent(vf->desc), "not the same method");

  IntListElem* e;
  bool isUncommon;
  fint startingArgNo; /* -1 for rcvr reg, 0 for first arg reg */
  fint performSelArgNo, performDelArgNo; // if a perform
  prepareToCopyOutgoingArgs(vf,
                            e, isUncommon, startingArgNo, performSelArgNo, performDelArgNo);
  
  dummy_vframe* dummy = new_dummy_vframe(NULL);

  if (lastOnly) 
    for ( ; e != NULL  &&  e->next(); 
            e = e->next(), ++startingArgNo) 
      {}

 for ( fint argNo = startingArgNo;  e;   e= e->next(),  ++argNo) {
    int32 bci2 = e->data();
    NameDesc* nd = desc->exprStackElem(bci2);
    assert(nd->hasLocation(), "cannot handle constants");
    NameDesc* from_nd = vf->desc->exprStackElem(bci2);
    
    if  (  argNo == performSelArgNo 
    ||     argNo == performDelArgNo) {
      copyValue(nd, vf, from_nd, oldBlkHome, blkValues);
      // do not advance argNo at the position of the
      //   selector or delegatee to a _Perform
      //   because will be copied to a special register
      --argNo;  --performSelArgNo;  --performDelArgNo;
    }
    else if ( !from_nd->isIllegal()
         &&   ( isUncommon  ||  argNo >= NumIArgRegisters ) ) {
      copyValue(nd, vf, from_nd, oldBlkHome, blkValues);
    }
    else {
      /* for verifying */
      if (currentProcess->isUncommon())
        fatal("should have legal nameDesc");

      copy_outgoing_arg( argNo,  from_nd,  vf,  dummy, nd,  oldBlkHome,  blkValues);
    }
  }
}


void compiled_vframe::prepareToCopyOutgoingArgs(
                         compiled_vframe* vf,
                         IntListElem*& e, bool& isUncommon,
                         fint& startingArgNo, fint& performSelArgNo, fint& performDelArgNo) {

  methodMap* mm = (methodMap*) method()->map();
  IntList* bcs = mm->expression_stack(bci(), true);
  isUncommon = vf->fr->send_desc() == NULL;
  fint op = getOp(mm->start_codes()[_bci]);
  startingArgNo = (op == SEND_CODE) ? -1 : 0;    // explicit or implicit self?
  stringOop sel= mm->get_selector_at(_bci);
  
  const fint none = -2;
  performSelArgNo= sel->has__Perform_prefix()                ?    startingArgNo + 1  :  none;
  performDelArgNo= sel->has__Perform_DelegatingTo__prefix()  ?  performSelArgNo + 1  :  none; 
    
  // nargs: # of args to copy (one more if explicit receiver)
  fint nargs= sel->arg_count() - startingArgNo;
  e= bcs->head();
  for (fint i = bcs->length() - nargs;  i > 0;  i--) {
    // pop all expr stack entries not belonging to current send
    e= e->next();
  }
}



void compiled_vframe::copyValue( NameDesc* n,
                                 compiled_vframe* fromVF,
                                 NameDesc* fromNd,
                                 frame* oldBlockHome,
                                 OopOopTable* blockValues) {
  copyValueTo(n, fromVF->copyValueFrom( this,
                                        fromNd,
                                        oldBlockHome,
                                        blockValues));
}


oop compiled_vframe::copyValueFrom( compiled_vframe* toVF,
                                    NameDesc* fromNd,
                                    frame* oldBlockHome,
                                    OopOopTable* blockValues) {
  assert(oldBlockHome, "need old block home frame");
  // NB: don't create block in get_contents because all blocks should
  // have been created at the beginning of the conversion process
  oop p = get_contents(fromNd, false);
  if (p->is_block() && !isDummy()) {
    if (fromNd->isBlockValue() || fromNd->isMemoizedBlock()) {
      // wasn't a real block in original frame; must be in blockValues
      oop clone = blockValues->lookup(p);
      assert(clone, "not found in blockValues");
      p = clone;
    } 
    frame* home = blockOop(p)->scope(true);
    if (home == NULL) {
      // dead block - don't touch it
      // should translate it's map, but it doesn't really matter so why bother
      assert(fromNd->hasLocation(), "must have a location");
    } else if (home == oldBlockHome &&
               desc->is_equal( code->scopes->at(blockOop(p)->desc()))) {
      // the block's home was in the old (now converted) frame and belonged
      // to my scope
      // need to translate block map & home pointer
      blockOop(p)->remap(toVF->code, toVF->fr);
    } else {
      // do nothing; a block from another frame
    }
  }
  return p;
}


void compiled_vframe::copyValueTo( NameDesc* n,  oop p ) {
  set_contents(n, p);
  LOG_EVENT2("compiled_vframe::copyValue %s %#lx",
             locationName(n->location()), p);
  assert(get_contents(n) == p, "contents not set correctly");
}


static frame* oldBlockHome;
static OopOopTable* blockValues;
static void copyValueFn( compiled_vframe* vf1, NameDesc* n1,
                         compiled_vframe* vf2, NameDesc* n2) {
  // copy a value from vf2 to vf1
  if (vf2) {
    vf1->copyValue(n1, vf2, n2, oldBlockHome, blockValues);
  } else {
    // must be an argument to the call that just returned - don't set
  }
}


void compiled_vframe::copyValuesFrom(
                                     compiled_vframe* vf,
                                     compiled_vframe* callee,
                                     frame* oldBlkHome,
                                     OopOopTable*& blkValues,
                                     bool wasInInterruptCheck) {
  oldBlockHome = oldBlkHome;
  blockValues  = blkValues;
  valuesDo(vf, callee, copyValueFn, wasInInterruptCheck);
  blkValues = blockValues;
}


static void createBlkFn(compiled_vframe* vf1,
                        NameDesc* n1,
                        compiled_vframe* vf2,
                        NameDesc* n2) {
  Unused(vf2); Unused(n2);
  vf1->createBlock(n1, blockValues);
}

void compiled_vframe::createBlocks(abstract_vframe* calleeOrNull,
                                   OopOopTable*& blkValues) {
  blockValues = blkValues;
  // wont work if callee is interp XXXX
  valuesDo(this, calleeOrNull->as_compiled(), 
           createBlkFn, false);
  blkValues = blockValues;
}




void compiled_vframe::valuesDo(compiled_vframe* vf,
                               compiled_vframe* calleeOrNull,
                               vfValueDoFn fn,
                               bool wasInInterruptCheck) {
  // call fn on all NameDescs in the receiver, passing along the corresponding
  // NameDesc in vf
  
  assert(desc->s_equivalent(vf->desc), "not the same method");
  fn(this, get_self_name(), vf, vf->get_self_name());
  fn(this, get_cachedSelf_name(), vf, vf->get_cachedSelf_name()); // may do redundant work on SPARC
  if (desc->isBlockScope()) {
    // copy over block receiver, too
    fn(this, get_block_name(),       vf, vf->get_block_name());
    fn(this, get_cachedBlock_name(), vf, vf->get_cachedBlock_name());
  }

  NameDesc* nd1 =     desc->getNextNameDesc(NULL);
  NameDesc* nd2 = vf->desc->getNextNameDesc(NULL);
  while (nd1 != NULL) {
     assert( nd2, "name desc length differs");
     fn(this, nd1,  vf, nd2);
     nd1 =     desc->getNextNameDesc(nd1);
     nd2 = vf->desc->getNextNameDesc(nd2);
  }
  assert( !nd2, "name desc length differs");

  // expression stack
  methodMap* mm = (methodMap*) method()->map();

  // don't visit arguments of sends if no callee is supplied; these
  // shouldn't be needed by the receiver vframe if/when resumed (extracting
  // them from optimized vframes requires looking at the called vf).
  // However: if returning from interruptCheck, still need to visit args.
  bool includeArgs = wasInInterruptCheck || calleeOrNull != NULL;
  assert(!wasInInterruptCheck || calleeOrNull==NULL,
         "interrupt check implies no callee");
  IntList* bcs = mm->expression_stack(bci(), includeArgs);
  assert(real_bci() != PrologueBCI  ||  bcs->length() == 0,
         "no expression stack elements when in prologue");
  compiled_vframe** fromVF;
  NameDesc** fromND;
  smi len;
  vf->get_exprStackInfo(calleeOrNull, fromVF, fromND, len, includeArgs);
  assert(len == bcs->length(), "oops");
  fint i = 0;
  IntListElem* e;
  for (e = bcs->head(); e; e = e->next(), i++) {
    int32 bci2 = e->data();
    NameDesc* n = desc->exprStackElem(bci2, false);
    if (n) {
      if (fromND[i]->isIllegal()) {
        // outgoing arg
      } else {
        fn(this, n, fromVF[i], fromND[i]);
      }
    } else {
      // trivial byte code, already set (e.g. incoming arg, const)
      assert(!code->isDebug(), "debug code should have real nameDesc");
    }
  }

  // live blocks
  bcs = mm->blocks_upto(bci());
  for (e = bcs->head(); e; e = e->next()) {
    int32 bci2 = e->data();
    NameDesc* n  =     desc->blockElem(bci2);
    NameDesc* n1 = vf->desc->blockElem(bci2);
    fn(this, n, vf, n1);
  }
}


void compiled_vframe::get_expr_stack(oop*& stack,
                                     smi& len,
                                     bool badOopForUnknown) {
  // Return the expression stack as seen by the user (i.e. including the
  // arguments to the current send which aren't actually stored in the
  // debugging info expression stack).

  // Don't return an objVector because this is used during _PrintProcessStack
  // and we don't want to disturb the Self heap when printing the stack.
  // stack[0] = oldest elem, stack[len-1] = most recent (top) elem
  compiled_vframe** vfs;
  NameDesc** nds;
  
  compiled_vframe* s = sendeeOrNULL_for_get_expr_stack();
  get_exprStackInfo(s, vfs, nds, len);

  stack = NEW_RESOURCE_ARRAY(oop, len);

  for (fint i = 0; i < len; i++) {
    compiled_vframe* vf = vfs[i];
    NameDesc*        nd = nds[i];
    stack[i] =  vf && !nd->isIllegal()  ?  vf->get_contents(nd)
              : badOopForUnknown        ?  oop(badOop)
                                        :  new_string("<unknown>");
  }
}
  
  
bool  compiled_vframe::is_top()  { return desc->isTop(); }
int32 compiled_vframe::scopeID() { return desc->scopeID(); }


NameDesc* compiled_vframe::get_name_desc(slotDesc* s, bool canFail) {
    return desc->slot(s, canFail); 
}
oop compiled_vframe::get_slot(slotDesc* s) {
  return get_contents(get_name_desc(s)); }

oop compiled_vframe::get_slot2(slotDesc* s, bool clone1, bool clone2) { 
  return get_contents(get_name_desc(s), clone1, clone2);
}
void compiled_vframe::set_slot(slotDesc* s,  oop x) {
    set_contents(get_name_desc(s), x); 
}
NameDesc* compiled_vframe::get_self_name() { return desc->self(); }
NameDesc* compiled_vframe::get_cachedSelf_name() { return desc->cachedSelf(); }
NameDesc* compiled_vframe::get_receiver_name() { return desc->receiver(); }
NameDesc* compiled_vframe::get_block_name() { return desc->block(); }
NameDesc* compiled_vframe::get_cachedBlock_name() { return desc->cachedBlock(); }


void compiled_vframe::get_exprStackInfo(compiled_vframe* calleeOrNull,
                                        compiled_vframe**& vfs,
                                        NameDesc**& nds,
                                        smi& len,
                                        bool includeArgs) {
  // return vframes and corresponding NameDescs needed to recover the
  // expression stack; on return, vfs[i] is either the receiver or the
  // vframe below the receiver (for outgoing args); if an expr stack
  // entry is unknown (e.g. for arguments to primitives), the corresponding
  // NameDesc is an IllegalNameDesc
  // elem 0 = oldest elem, elem len-1 = most recent (top) elem
  
  methodMap* mm = (methodMap*) method()->map();

  // bcs marks the descs which the debugging info can handle; bcsArgs
  // is the "logical" stack (including the args of the current send
  // if desired)
  IntList* bcs = mm->expression_stack(bci(), code->isDebug());
  bool same = code->isDebug() == includeArgs;
  IntList* bcsArgs =  same  ?  bcs  
                            :  mm->expression_stack(bci(), includeArgs);

  len             = bcsArgs->length();
  vfs             = NEW_RESOURCE_ARRAY(compiled_vframe*, len);
  nds             = NEW_RESOURCE_ARRAY(NameDesc*, len);
  IntListElem* e  = bcs->head();
  IntListElem* e2 = bcsArgs->head();
  int32 nargs     = same ? 0 : len - bcs->length();

  // get base expr stack from debugging info
  fint i;
  for (i = 0;  i < len && e;  e = e->next(), e2 = e2->next(), i++) {
    int32 bci2 = e->data();
    nds[i] = desc->exprStackElem(bci2);
    vfs[i] = this;
  }

  // push the args of the current send (if any)
  if (nargs > 0) {
    get_exprStackInfo_outgoing_args( mm,
                                     calleeOrNull,                                     
                                     vfs,
                                     nds,
                                     i,                                     
                                     len,
                                     e2);

  }
  else if (i != len) fatal("expr stack: wrong length?");
} 


void compiled_vframe::get_exprStackInfo_outgoing_args(
                        methodMap*          mm,
                        compiled_vframe*    calleeOrNull,
                        compiled_vframe**   vfs,
                        NameDesc**          nds,
                        fint                i,
                        smi                 len,
                        IntListElem*        e2) {
                        
  oop sel = mm->start_literals()[mm->get_index_at(bci())];
  ByteCodeKind op = getOp(mm->start_codes()[bci()]);
  bool isReceiverExplicit = op == SEND_CODE;
  
  if (   !currentProcess->isUncommon()
  &&     calleeOrNull
  &&     calleeOrNull->desc == NULL) {
  
    get_outgoing_arg_info_from_dummy_callee( isReceiverExplicit, 
                                             calleeOrNull,
                                             vfs, nds, i, len, sel );
  } 
  else if ( calleeOrNull == NULL
       ||   calleeOrNull->desc == NULL
       ||   calleeOrNull->desc->is_lite()
       ||   (isSendOp(op)  &&  sel->is_string() 
                          &&  stringOop(sel)->is_prim_name())) {
                          
    get_outgoing_arg_info_no_sendee( vfs, nds, i, len, e2 );
  } 
  else {
    get_outgoing_arg_info_from_sendee( isReceiverExplicit, 
                                       calleeOrNull,
                                       vfs, nds, i );
  }
  if (i != len) fatal("expr stack: wrong number of args?");
}


void compiled_vframe::get_outgoing_arg_info_no_sendee( 
                        compiled_vframe**  vfs,
                        NameDesc**         nds,
                        fint&              i,
                        smi                len,
                        IntListElem*       e2 ) {
  // prim call / conversion / ucommon / recursive lookup error -- no sendee
  // [NB: calleeOrNull == NULL isn't sufficient because some prims call
  // Self]
  // can't read the args out of O registers because (1) C code might reuse
  // these regs, and (2) they're not scavenged, and (3) they might not
  // contain what we want (e.g. uncommon branches have no callee)
  for (; i < len;  e2 = e2->next(), i++) {
    vfs[i] = this;
    nds[i] = desc->exprStackElem(e2->data());
  }
}


void compiled_vframe::get_outgoing_arg_info_from_sendee( 
                        bool               isReceiverExplicit, 
                        compiled_vframe*   calleeOrNull,
                        compiled_vframe**  vfs, 
                        NameDesc**         nds, 
                        fint&              i ) {
  // extract args from sendee
  if (isReceiverExplicit) {
    vfs[i] = calleeOrNull;
    nds[i] = calleeOrNull->get_receiver_name();
    i++;
  }
  const fint base= i;
  FOR_EACH_SLOTDESC(calleeOrNull->method()->map(), s) {
    if (s->is_arg_slot()) {
      oop ind= s->data;
      assert_smi(ind, "bad index");
      fint argIndex= smiOop(ind)->value();
      vfs[base+argIndex]= calleeOrNull;
      nds[base+argIndex]= calleeOrNull->get_name_desc(s);
      i++;
    }
  }
}


bool compiled_vframe::print_frame(fint curFrame) {
  if (desc->isDataAccessScope() || desc->isDataAssignmentScope()) return false;
  return abstract_vframe::print_frame(curFrame);
}
  

void compiled_vframe::enumerate_references(enumeration* e) {
  if (desc->isDataAccessScope() || desc->isDataAssignmentScope()) return;

  abstract_vframe::enumerate_references(e);

  oop meth = method();
  methodMap* mm = (methodMap*) meth->map();

  IntList* bcs = mm->expression_stack(bci(), code->isDebug());
  for (IntListElem* el = bcs->head(); el; el = el->next()) {
    int32 bci2 = el->data();
    NameDesc* n = desc->exprStackElem(bci2);
    oop obj = get_contents(n);
    CHECK;
  }

  IntList* bbcs = mm->blocks_upto(bci());
  for (IntListElem* b = bbcs->head();  b;  b = b->next()) {
    int32 bci2 = b->data();
    NameDesc* n = desc->blockElem(bci2);
    oop obj = get_contents(n);
    CHECK;
  }
}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

interpreted_vframe::interpreted_vframe(frame* f) {
  assert(f->is_interpreted_self_frame(), "must be right frame");
  fr = f;
}

bool interpreted_vframe::is_primCall() {
  return interp()->selToSend->is_string() && stringOop(interp()->selToSend)->is_prim_name();
}


fint abstract_vframe::bci() {
  methodMap* mm = (methodMap*) method()->map();
  if (real_bci() == PrologueBCI) {
    return abstract_interpreter_method_info(mm).firstBCI();
  } else if (real_bci() == EpilogueBCI) {
    return mm->length_codes();
  } else {
    return real_bci();
  }
}

bool abstract_vframe::is_prologue() {
  return real_bci() == PrologueBCI;
}


abstract_vframe* abstract_vframe::get_sender(bool skipC) {
  frame* f = skipC ? fr->selfSender() : fr->sender();
  if ( f == NULL  ||  !f->is_self_frame() )
    return NULL;
  return  new_vframe(f, is_compiled() ? as_compiled()->reg_loc()->climb_to_frame(f) : NULL);
}

// factor out common case

abstract_vframe* abstract_vframe::parent() {
  blockOop b = (blockOop) block();
  assert(b->is_block(), "should be a block");
  frame* bs = b->scope(true);
  return
    bs == NULL
      ?  NULL
      :  new_vframe( bs->home_frame_of_block_scope(),
                     b->desc(),
                     NULL); // do NOT pass in rl of this vframe; may not be same stack
}


abstract_vframe* interpreted_vframe::parent() {
  if (interp()->mi.map()->kind() != BlockMethodType)
    return NULL;
  return interp()->parentVF();
}

    
// returns NULL if not found

abstract_vframe* abstract_vframe::sendee(abstract_vframe* last) {
  if (!last) {
#   if defined(FAST_COMPILER) || defined(SIC_COMPILER)

    if (    RecompilationInProgress 
        &&  (     currentProcess->stack()->contains((char*)fr->vfo_locals_of_home_frame()) 
             ||  resources.contains((char*)fr->vfo_locals_of_home_frame()))
        && this->EQ(  new_vframe( currentProcess->last_self_frame(false) )   )) {
      // special case to cover expr. stack of youngest vframe (incl.
      // outgoing args)
      // create a dummy vframe for the nmethod overflowing its counter;
      // the assembly glue (Recompile_stub)
      // guarantees that incoming args are ok
      frame* vmfr = currentProcess->stack()->first_VM_frame();
      last = new_dummy_vframe(vmfr);
      return last;
    }
#   endif //  defined(FAST_COMPILER) || defined(SIC_COMPILER)

    frame* f = processes->stackFor(fr)->last_self_frame(true);
    last = new_vframe(f);
  }
  // find right frame first
  frame* next = NULL;
  frame* lastFr;
  for ( lastFr = last->fr;
       lastFr && lastFr != fr && (next = lastFr->selfSender()) != fr;
       lastFr = next) ;
  if (lastFr == NULL) return NULL; // rcvr must be in copied frame (conversion)
  if (lastFr != last->fr) last = new_vframe(lastFr);
  // now find right vframe
  abstract_vframe* vf = last;
  abstract_vframe* vfs;
  for ( vfs = vf->sender();
       vfs && !vfs->EQ(this);
       vf = vfs, vfs = vfs->sender()) ;
  return vfs == NULL ? NULL : vf;
}



abstract_vframe* abstract_vframe::home() {
  abstract_vframe* v = this;
  for (abstract_vframe* p = v->parent(); p; p = p->parent()) {
    v = p;
  }
  return v;
}

abstract_vframe* abstract_vframe::top() {
  abstract_vframe* topVF = this;
  while (!topVF->is_top()) topVF = topVF->sender();
  return topVF;
}


oop interpreted_vframe::get_slot(slotDesc* sd) {
  return interp()->get_slot(sd);
}

void interpreted_vframe::set_slot(slotDesc* sd, oop x) {
  interp()->set_slot(sd, x);
}

void interpreted_vframe::createBlocks(abstract_vframe* calleeOrNull,
                                      OopOopTable*& blkValues) {
  Unused(calleeOrNull);
  for ( int32 i = 0;  i < interp()->mi.length_literals;  ++i) {
    oop b = interp()->mi.literals[i];
    if (!b->is_block()) continue;
    oop* p = &interp()->cloned_blocks[i];
    if (*p == NULL) {
      frame* home = fr->block_scope_of_home_frame();
      *p = blockOop(b)->clone_block(smiOop(home));
    }
    blkValues = blkValues->storeNew(b, *p);
  }
}

void interpreted_vframe::get_expr_stack(oop*& stack,
                                     smi& len,
                                     bool badOopForUnknown) {
  // Return the expression stack as seen by the user.

  // Don't return an objVector because this is used during _PrintProcessStack
  // and we don't want to disturb the Self heap when printing the stack.
  // stack[0] = oldest elem, stack[len-1] = most recent (top) elem

  Unused(badOopForUnknown);
  len = interp()->sp;
  stack = NEW_RESOURCE_ARRAY(oop, len);
  copy_oops(interp()->stack, stack, len);
}



bool abstract_vframe::print_frame(fint curFrame) {
  oop meth = method();
  methodMap* mm = (methodMap*) meth->map();
  print_code(curFrame);
  
  stringOop file = mm->file();
  if (file->length() > 0) {
    lprintf(" (");
    file->string_print();
    lprintf(":%ld): ", long(mm->line()->value()));
  } else {
    lprintf(" ");
  }
  
  if (selector()->is_string()) {
    stringOop(this->selector())->string_print();
  } else {
    selector()->print_oop();
  }
  
  lprintf(" = ");

  print_contents();
  
  if ( WizardMode
      && (    is_interpreted()  
#       if defined(FAST_COMPILER) || defined(SIC_COMPILER)
           || !as_compiled()->desc->is_lite()
#       endif
     )) {
    smi len;
    oop* stack;
    get_expr_stack(stack, len);
    if (len) {
      lprintf("    expression stack: { ");
      for (smi i = 0; i < len; i++) {
        stack[i]->print_oop();
        if (i < len - 1) lprintf(", ");
      }
      lprintf(" }\n");
    }
    lprintf("    current byte code:\n\t%ld: ", long(real_bci()));
    if (bci() == real_bci()) mm->print_byteCode_at(bci());
    lprintf("\n");
  }  
  lprintf("\n");
  
  OS::check_events();  // Try to catch interruptions sooner 
  return true;
}


void abstract_vframe::print_contents() {
  bool first = true;
  methodMap* mm = (methodMap*) method()->map();
  if (mm->kind() != OuterMethodType) {
    lprintf("[ ");
    if (WizardMode) {
      first = false;
      lprintf("| []* = ");
      if (parent() == NULL ) {
        lprintf("<dead>. ");
      } else {
        if (ConversionInProgress) {
          // cannot walk the stack to get parent
          lprintf(" N/A ");
        } else {
          abstract_vframe* v = parent();
          if (v) {
            lprintf("<%#lx", (v->fr));
#           if defined(FAST_COMPILER) || defined(SIC_COMPILER)
              if (v->is_compiled())
                lprintf(" # %lx",
                       (long unsigned)(v->as_compiled()->desc->offset()));
#           endif
            lprintf(">. ");
          } else {
            // shouldn't really happen, but be robust for better debugging
            lprintf("<dead>. ");
          }
        }
      }
    }
  } else {
    lprintf("( ");
    if (mm->kind () == OuterMethodType) {
      slotDesc *s= mm->find_slot(VMString[SELF]);
      if (s) {
        first = false;
        lprintf("| ");
        print_slot(s, method());
      }
    }
  }
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  if (is_compiled()  &&  as_compiled()->desc->is_lite()) {
    lprintf("<# LITE #>");
  }
  else
# endif
  {
    // print arg slots in order
    fint argc= mm->arg_count();
    for (fint argIndex=0;  argIndex < argc;  ++argIndex) {
      FOR_EACH_SLOTDESC(mm, s) {
        if (s->is_arg_slot() && argIndex == smiOop(s->data)->value()) {
          if (first) {
            first= false;
            lprintf("| ");
          }
          print_slot(s, method());
          break;
        }
      }
    }
      
    FOR_EACH_SLOTDESC(mm, s) {
      if (s->is_vm_slot() || s->is_arg_slot()) continue;
      if (first) {
        first = false;
        lprintf("| ");
      }
      print_slot(s, method());
    }
    if (! first) lprintf("| ");
  }
  
  mm->print_source();
  
  if (mm->kind() != OuterMethodType) {
    lprintf(" ]\n");
  } else {
    lprintf(" )\n");
  }
  lprintf("\n");
}
  

void abstract_vframe::print_slot(slotDesc* s, oop meth) {
  s->printAugmentedName();
  lprintf(s->is_obj_slot() ? " <- " : " = ");
  oop p = get_slot(s);
  p->print_oop();
  if (s->is_obj_slot()) {
    oop orig_p = meth->get_slot(s);
    if (orig_p != p) {
      lprintf(" \"");
      orig_p->print_oop();
      lprintf("\"");
    }
  }
  lprintf(". ");
}

void abstract_vframe::enumerate_references(enumeration* e) {
  oop meth = method();
  methodMap* mm = (methodMap*) meth->map();
  
  {
    oop obj = methodHolder_object();
    CHECK;
    obj = receiver();
    CHECK;
    obj = selector();
    CHECK;
    if (delegatee() != NULL) {
      obj = delegatee();
      CHECK;
    }
    obj = as_smiOop(bci());
    CHECK;
  }
  FOR_EACH_SLOTDESC(mm, s) {
    if (s->is_obj_slot()) {
      if (e->targets_has_assignments()) {
        Process* p = processes->stackFor(fr)->process;
        e->add_obj(new_vframeOop(p, this));
        return;
      }
    } else if (!s->is_vm_slot()) {
      oop obj = get_slot(s);
      CHECK;
    }
  }
}


void interpreted_vframe::enumerate_references(enumeration* e) {

  abstract_vframe::enumerate_references(e);

  for (oop* p = interp()->stack;  p < &interp()->stack[interp()->sp];  ++p) {
    oop obj = *p;
    CHECK;
  }
}

void abstract_vframe::enumerate_families(enumeration* e) {
  mapOop m      = method()->map()->enclosing_mapOop();
  oop* maps     = e->get_maps();
  smi  num_maps = e->get_num_maps();
  smi  hit_num;

  maps[num_maps] = m; // Place sentinel
  oop* matching_cell = (oop*) vectorfind_next_match((int32*) maps, 
                                                    (int32*) &m, 1,
                                                    (int32*) &hit_num);
  assert( matching_cell <= &maps[num_maps], "match out of area");
  if (matching_cell != &maps[num_maps]) {
    Process* p = processes->stackFor(fr)->process;
    e->add_obj(new_vframeOop(p, this));
  }
}

abstract_vframe* new_vframe(frame* f, RegisterLocator* r) {
  if ( f->is_interpreted_self_frame() )
    return  new interpreted_vframe(f);

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

  assert(f->is_compiled_self_frame(), "f must be a self frame");
  if ( r == NULL )
    r = RegisterLocator::for_frame(f);
  return  new compiled_vframe(f, r);

# else

  ShouldNotReachHere();
  return (abstract_vframe*)NULL;

# endif
}


abstract_vframe* new_vframe(frame* f, smiOop offset, RegisterLocator* r) {
  if ( f->is_interpreted_self_frame() )
    return  (new interpreted_vframe(f) ) -> as_abstract();

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

    assert(f->is_compiled_self_frame(), 
           "must not call with in-between C frame");
    if ( r == NULL )
      r = RegisterLocator::for_frame(f);
    RegisterLocator* rr = r == NULL  ?  RegisterLocator::for_frame(f)  :  r->climb_to_frame(f);
    return (new compiled_vframe(f, offset, rr)) -> as_abstract();

# else

    ShouldNotReachHere();
    Unused(offset);
    return NULL;

# endif
}


int32 interpreted_vframe::real_bci() { return interp()->pc; }

oop  interpreted_vframe::selector()     { return interp()->selector; }
oop  interpreted_vframe::delegatee()    { return interp()->delegatee; }
oop  interpreted_vframe::method()       { return interp()->method_object; }
oop  interpreted_vframe::methodHolder_or_map() {
  abstract_vframe* p = parent();
  return p == NULL ? interp()->methodHolder() : p->home()->methodHolder_or_map(); }

oop interpreted_vframe::self()     { return interp()->self; }
oop interpreted_vframe::receiver() { return interp()->receiver; }
oop interpreted_vframe::block()    { return interp()->receiver; }
oop interpreted_vframe::methodHolder_object(){ return methodHolder_or_map(); }
