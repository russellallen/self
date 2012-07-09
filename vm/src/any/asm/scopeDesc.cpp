/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "scopeDesc.hh"
# include "_scopeDesc.cpp.incl"


fint compareBCI(fint bci1, fint bci2) {
  const fint BIG = 99999999;
  assert(bci1 != IllegalBCI && bci2 != IllegalBCI, "can't compare");
  assert(PrologueBCI < 0, "change this code - expects negative PrologueBCI");
  if (bci1 == EpilogueBCI) bci1 = BIG;
  if (bci2 == EpilogueBCI) bci2 = BIG;
  return bci1 - bci2;
}


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


ScopeDesc::ScopeDesc(nmethodScopes* scopes, int32 offset) {
  _scopes     = scopes;
  _offset     = offset;

  _name_desc_offset = offset;

  scopeDescHeaderByte b;
  b.unpack(_scopes->get_next_char(_name_desc_offset));

  lite = b.lite();

  assert(offset != 0 || !lite, "Root scopeDesc cannot be lite");

  if (b.nameDescs()) {
     _exprOffset = _scopes->get_next_half(_name_desc_offset);
    _blockOffset = _scopes->get_next_half(_name_desc_offset);
    _next        = _scopes->get_next_half(_name_desc_offset);
  }
  if (_offset == 0) {
    key.set_from(scopes->my_nmethod()->key);

    senderScopeOffset    = 0;
    _senderByteCodeIndex = IllegalBCI;
  } else {
    key.lookupType= b.lookupIndex()
      ? getCommonLookupTypeAt(b.lookupIndex())
      : _scopes->unpackValueAt(_name_desc_offset);

    key.selector= _scopes->unpackOopAt(_name_desc_offset); 

    key.delegatee= needsDelegatee(key.lookupType)
      ? _scopes->unpackOopAt(_name_desc_offset) : 0;

    senderScopeOffset    = _scopes->unpackValueAt(_name_desc_offset);  
    _senderByteCodeIndex = _scopes->unpackValueAt(_name_desc_offset);
  }
}

bool ScopeDesc::s_equivalent(ScopeDesc* s) {
  return key.equivalent(s->key)
    && (   _senderByteCodeIndex == s->_senderByteCodeIndex
           // don't check senderByteCodeIndex for pseudo BCIs
        || _senderByteCodeIndex < 0
        || s->_senderByteCodeIndex < 0);
}

bool ScopeDesc::l_equivalent(simpleLookup* l) {
  return key.equivalent((ScopeLookupKey&)l->key);
}

ScopeDesc* ScopeDesc::sender() {
  return senderScopeOffset ? _scopes->at(_offset - senderScopeOffset) : NULL; 
}

NameDesc* ScopeDesc::nameDescAt(int32 offset) {
  if (offset < _next)
    return _scopes->unpackNameDescAt(offset);
  else
    return NULL;
}

void ScopeDesc::print() {
  printIndent();
  printName();
  lprintf("ScopeDesc (%d%s): ", offset(), is_lite() ? ", lite" : "");
  key.print();
  if (isCodeScope()) {
    lprintf(" (ID %ld)", long(scopeID()));
  }
  lprintf("\n");
  Indent ++;
  printIndent();
  printMethod();
  printMethodHolder();
  lprintf("\n");
  printSelf();

  if (isCodeScope()) {
    if (!is_lite()) {  
      print_slots();
    }
  } else {
    print_locals();
  }

  if (!is_lite() && isCodeScope()) {
    print_stack();
    print_blocks();
  }

  ScopeDesc* s = sender();
  if (s) {
    printIndent();
    lprintf("sender: (%d) @ %ld", s->offset(), long(senderByteCodeIndex()));
  }
  ScopeDesc* p = parent();
  if (p) {
    if (s) {
      lprintf("; ");
    } 
    else {
      printIndent();
    }
    lprintf("parent: (%d)", p->offset());
  }
  if (s || p) {
    lprintf("\n");
  }
  Indent --;
}


void ScopeDesc::print_slots() {
  NameDesc* nd = getNextNameDesc(NULL);
  FOR_EACH_SLOTDESC(method()->map(), sd) {
    if (sd->is_obj_slot() || sd->is_arg_slot()) {
      assert( nd, "name desc is missing");
      printIndent();
      lprintf("slot \'");
      sd->printAugmentedName();
      lprintf("\'  ");
      nd->print();
      lprintf("\n");
      nd = getNextNameDesc(nd);
    }     
  }
}


void ScopeDesc::print_locals() {
  FOR_EACH_LOCAL_NAME_DESC(this, nd) {
    printIndent();
    lprintf("slot ");
    nd->print();
    lprintf("\n");
  }
}


void ScopeDesc::print_stack() {
  fint i = 0;
  nmethod* nm = this->_scopes->my_nmethod();
  bool debugMode = nm->isDebug();
  methodMap* mm= (methodMap*) method()->map();
  IntList* exprStackBCIList= mm->expression_stack_bcis(debugMode);
  IntListElem* e = exprStackBCIList->head();
  FOR_EACH_STACK_EXPR(this, ed) {
    printIndent();
    lprintf("expr stack %2d (bci %2d):", i++, e->data());
    ed->print();
    lprintf("\n");
    e = e->next();
  }
}


void ScopeDesc::print_blocks() {
  fint i = 0;
  methodMap* mm= (methodMap*) method()->map();
  IntList* blockBCIList= mm->all_blocks();
  IntListElem* e = blockBCIList->head();
  FOR_EACH_BLOCK(this, ed) {
    printIndent();
    lprintf("block %2d (bci %2d):", i++, e->data());
    ed->print();
    lprintf("\n");
    e = e->next();
  }
}


void ScopeDesc::doForNames(fint bci, nameDescStringDoFn fn) {
  // for disassembler: call fn on any name vaild at bci
  // quite inefficient, but used only for debugging
  if (isCodeScope()) {
    if (!is_lite()) {  
      NameDesc* nd = getNextNameDesc(NULL);
      FOR_EACH_SLOTDESC(method()->map(), sd) {
        if (sd->is_obj_slot() || sd->is_arg_slot()) {
          assert( nd, "name desc is missing");
          fn(nd, sd->name->copy_null_terminated());
          nd = getNextNameDesc(nd);
        }     
      }
      if (bci >= 0) {
        methodMap* mm = method_map();
        IntList* es = mm->expression_stack(bci, true);
        IntList* bl = mm->blocks_upto(bci);
        for (fint i = 0; i < mm->length_codes(); i++) {
          if (es->nonEmpty() && es->first() == i) {
            es->removeHead();
            NameDesc* n_d = exprStackElem(i);
            char buf[80];  sprintf(buf, "stk %d", i);  fn(n_d, buf);
          } 
          if (bl->nonEmpty() && bl->first() == i) {
            bl->removeHead();
            NameDesc* n_d = blockElem(i);
            char buf[80];  sprintf(buf, "block %d", i);  fn(n_d, buf);
          }
        }
      }
    }
  } else {
    // don't bother for access scopes
  }
}

bool ScopeDesc::verify() {
  // verifies mostly structure, not contents
  bool ok = true;

  if (!is_lite()) {
    FOR_EACH_LOCAL_NAME_DESC(this, n) {
      if (!n->verify()) {
        lprintf("in name desc %ld of ScopeDesc %#lx", long(n->offset),
               (long unsigned)this);
        ok = false;
      }
    }

    FOR_EACH_STACK_EXPR(this, e) {
      if (!e->verify()) {
        lprintf("in expr desc %ld of ScopeDesc %#lx", long(e->offset),
               (long unsigned)this);
        ok = false;
      }
    }
    FOR_EACH_BLOCK(this, b) {
      if (!b->verify()) {
        lprintf("in block desc %ld of ScopeDesc %#lx", long(b->offset),
               (long unsigned)this);
        ok = false;
      }
    }
  }

  // don't do a full verify of parent/sender -- too many redundant verifies
  ScopeDesc* s = sender();
  if (s && !s->shallow_verify()) {
    lprintf("invalid sender %#lx of ScopeDesc %#lx", s,
           (long unsigned)this);
    ok = false;
  }
  ScopeDesc* p = parent();
  if (p && !p->shallow_verify()) {
    lprintf("invalid parent %#lx of ScopeDesc %#lx", p,
           (long unsigned)this);
    ok = false;
  }
  return ok;
}

CodeScopeDesc::CodeScopeDesc(nmethodScopes* scopes, int32 offset)
  : ScopeDesc(scopes, offset) {
  _method              = _scopes->unpackOopAt(_name_desc_offset); 
  _scopeID             = _scopes->unpackValueAt(_name_desc_offset);  
}

bool CodeScopeDesc::s_equivalent(ScopeDesc* s) {
  if (s->isCodeScope() && ScopeDesc::s_equivalent(s)) {
    CodeScopeDesc* sc = (CodeScopeDesc*)s;
    // compare methods, not rcvr maps because of block map cloning
    return _method == sc->_method;
  } else {
    return false;
  }
}

bool CodeScopeDesc::l_equivalent(simpleLookup* l) {
  return ScopeDesc::l_equivalent(l)
                 && l->result()->as_real()->desc->data == _method;
}

NameDesc* CodeScopeDesc::slot(stringOop name, bool canFail) {
  if (name == VMString[SELF]) return self();

  NameDesc* nd = getNextNameDesc(NULL);
  FOR_EACH_SLOTDESC(method()->map(), s) {
    if (s->is_vm_slot()) continue;
    if (s->is_map_slot()) {
      if (s->name == name) return new ValueNameDesc(s->data);
    } else {
      if (s->name == name) return nd;
      nd = getNextNameDesc(nd);
    }     
  }
  if (!canFail) ShouldNotReachHere(); // slot not found
  return NULL;
}


// -----------------------------------------------------------


class trivialExprStackElemFinder: public abstract_interpreter {
 public:
  CodeScopeDesc* csd;
  NameDesc* result;
  
  trivialExprStackElemFinder( oop meth, CodeScopeDesc* c, int32 bci) 
   : abstract_interpreter(meth ) {  pc = bci;  csd= c;  result =NULL; }
   
  void do_SELF_CODE() { result= csd->self(); }
  void do_READ_LOCAL_CODE();
  void do_WRITE_LOCAL_CODE()  { result= csd->self(); }
  
  void do_IMPLICIT_SEND_CODE();
  void do_LITERAL_CODE();
};


void trivialExprStackElemFinder::do_READ_LOCAL_CODE() {
    if ( pc > 0  
    &&   getOp(mi.codes[pc - 1]) == LEXICAL_LEVEL_CODE)
      is.lexical_level = mi.map()->get_index_at(pc - 1);
    
  // slot() below does not handle slots in an enclosing scope
  if (is.lexical_level > 0) 
    return;
    
  is.index = mi.map()->get_index_at(pc);
    
  slotDesc* s= mi.map()->getLocalSlot(is.lexical_level, is.index);
  if (s->is_arg_slot()) {
    // don't need to duplicate arg slot name descs
    // return name desc of local slot
    result= csd->slot(s->name);
  }
}


void trivialExprStackElemFinder::do_IMPLICIT_SEND_CODE() {
  if ( UseLocalAccessBytecodes)
    return;
    
  is.index= mi.map()->get_index_at(pc); 
  stringOop sel= get_selector();
  slotDesc* s= mi.map()->find_slot(sel);
  if ( s &&  s->is_arg_slot() ) {
    // don't need to duplicate arg slot name descs
    // return name desc of local slot
    result= csd->slot(sel);
  }
}


void trivialExprStackElemFinder::do_LITERAL_CODE() {
  is.index= mi.map()->get_index_at(pc);
  oop lit= get_literal();
  if ( !lit->has_code()  &&  !lit->is_block_with_code()) {
    // make up a nameDesc for this constant
    result= new ValueNameDesc(lit);
  }
}


NameDesc* CodeScopeDesc::exprStackElem(int32 bci, bool includeTrivial) {
  // Find NameDesc describing result of byte code bci.
  // If includeTrivial is set, fill in the information for trivial bcs
  // (e.g. literals) which isn't actually stored; see
  // methodMap::expression_stack_bcis.

  bool debugMode = _scopes->my_nmethod()->isDebug();
  oop m = method();
  methodMap* mm = (methodMap*) m->map();
    
  // exprStackBCIList contains the bcis who are described in the scopeDesc
  // so if we find our pc there, we can use its NameDesc
  IntList* exprStackBCIList = mm->expression_stack_bcis(debugMode);
  NameDesc* nd = getNextExprDesc(NULL);
  for (IntListElem* e = exprStackBCIList->head(); e; e = e->next()) {
    if (e->data() == bci) {
      // assert(!nd->isIllegal(), "shouldn't be accessing illegal name desc");
      // don't break too eagerly - e.g. disassembler may access illegals
      return nd;
    }
    nd = getNextExprDesc(nd);
  }

  // haven't found it in the ScopeDesc, so it must be a trivial byte code
  if (!includeTrivial) return NULL;
  
  trivialExprStackElemFinder esf(m, this, bci);
  esf.interpret_bytecode();
  NameDesc* r = esf.result;
  assert(r, "did not find name desc");
  return r;
}

NameDesc* CodeScopeDesc::blockElem(int32 bci) {
  // Find NameDesc describing block cloned at bci.
  // methodMap::all_blocks gives possible bci's

  oop m = method();
  methodMap* mm = (methodMap*) m->map();
    
  IntList* blockBCIList = mm->all_blocks();
  NameDesc* nd = getNextBlockDesc(NULL);
  for (IntListElem* e = blockBCIList->head();  e;  e = e->next()) {
    if (e->data() == bci) {
      // assert(!nd->isIllegal(), "shouldn't be accessing illegal name desc");
      // don't break too eagerly - e.g. disassembler may access illegals
      return nd;
    }
    nd = getNextBlockDesc(nd);
  }
  fatal("did not find block");
  return NULL;
}

  
// ----------------------------------------------------------------

void CodeScopeDesc::printMethod() {
  lprintf("method: 0x%lx", (method()));
}

bool MethodScopeDesc::s_equivalent(ScopeDesc* s) {
  return s->isMethodScope() && CodeScopeDesc::s_equivalent(s);
  // don't check self_type or method holder
}

bool MethodScopeDesc::l_equivalent(simpleLookup* l) {
  // xxx miw
  return CodeScopeDesc::l_equivalent(l) && selfMapOop()->equal(l->receiverMapOop());
  // note: don't check _methodHolder_or_map == l->methodHolder because l->mh is
  // the sending mh, not the receiving mh
}

MethodScopeDesc::MethodScopeDesc(nmethodScopes* scopes, 
                                 int32 offset)
  : CodeScopeDesc(scopes, offset) {
  self_name         = _scopes->unpackNameDescAt(_name_desc_offset);
  self_type         = _scopes->unpackOopAt(_name_desc_offset);  
  _methodHolder_or_map     = _scopes->unpackOopAt(_name_desc_offset);  
}

void MethodScopeDesc::printName() {
  lprintf("Method");
}

void MethodScopeDesc::printSelf() {
  printIndent();
  lprintf("self: ");
  self()->print();
  lprintf("; self type: ");
  self_type->print_real_oop();
  lprintf("\n");
}

void MethodScopeDesc::printMethodHolder() {
  lprintf("; method holder: ");
  _methodHolder_or_map->print_real_oop();
  bool b = _methodHolder_or_map->is_map();
  if (b) {
    lprintf(" (same as receiver)");
  }
}


TopLevelBlockScopeDesc::TopLevelBlockScopeDesc(nmethodScopes* scopes,
                                               int32 offset)
  : LexicalScopeDesc(scopes, offset) {
  self_name         = _scopes->unpackNameDescAt(_name_desc_offset);
  cachedSelf_name   = _scopes->unpackNameDescAt(_name_desc_offset);
  self_type         = _scopes->unpackOopAt(_name_desc_offset);  
  _methodHolder_or_map     = _scopes->unpackOopAt(_name_desc_offset);  
  blockName         = _scopes->unpackNameDescAt(_name_desc_offset);
  blockName_cached  = _scopes->unpackNameDescAt(_name_desc_offset);
  _receiverMapOop   = (mapOop)_scopes->unpackOopAt(_name_desc_offset);
  assert_map(receiverMapOop(), "should be a map");
}

void TopLevelBlockScopeDesc::printMethodHolder() {
  lprintf("; method holder: ");
  _methodHolder_or_map->print_real_oop();
  bool b = _methodHolder_or_map->is_map();
  if (b) {
    lprintf(" (same as receiver)");
  }
}

void LexicalScopeDesc::printSelf() {
  printIndent();
}

void TopLevelBlockScopeDesc::printSelf() {
  LexicalScopeDesc::printSelf(); 
  lprintf("self: ");
  self()->print();
  lprintf("; self type: ");
  self_type->print_real_oop();
  lprintf("; rcvr type: ");
  receiverMapOop()->print_real_oop();
  lprintf("\n");
}

void BlockScopeDesc::printSelf() {
  LexicalScopeDesc::printSelf();
  lprintf("; rcvr type: ");
  receiverMapOop()->print_real_oop();
  lprintf("\n");
}

bool TopLevelBlockScopeDesc::s_equivalent(ScopeDesc* s) {
  // programming can tranform a nested block to a top-level block
  return s->isBlockScope() && CodeScopeDesc::s_equivalent(s);
}

void TopLevelBlockScopeDesc::printName() {
  lprintf("TopLevelBlock");
}


BlockScopeDesc::BlockScopeDesc(nmethodScopes* scopes, int32 offset)
  : LexicalScopeDesc(scopes, offset) {
  parentScopeOffset = _scopes->unpackValueAt(_name_desc_offset);
  blockName         = _scopes->unpackNameDescAt(_name_desc_offset);
  _receiverMapOop   = (mapOop)_scopes->unpackOopAt(_name_desc_offset);
  assert_map(receiverMapOop(), "must be a map");
}

bool BlockScopeDesc::s_equivalent(ScopeDesc* s) {
  return s->isBlockScope() && LexicalScopeDesc::s_equivalent(s);
}

void BlockScopeDesc::printName() {
  lprintf("Block");
}

ScopeDesc* BlockScopeDesc::parent() {
  return parentScopeOffset ? _scopes->at(_offset - parentScopeOffset) : NULL; 
}


DeadBlockScopeDesc::DeadBlockScopeDesc(nmethodScopes* scopes,
                                       int32 offset)
  : CodeScopeDesc(scopes, offset) {
  blockName         = _scopes->unpackNameDescAt(_name_desc_offset);
}

void DeadBlockScopeDesc::printMethodHolder() {
  // none
}

void DeadBlockScopeDesc::printSelf() {
  printIndent();
  lprintf("block: ");
  block()->print();
  lprintf("\n");
}

bool DeadBlockScopeDesc::s_equivalent(ScopeDesc* s) {
  return s->isBlockScope() && CodeScopeDesc::s_equivalent(s);
}

void DeadBlockScopeDesc::printName() {
  lprintf("DeadBlock");
}


NameDesc* AccessScopeDesc::slot(stringOop name, bool canFail) {
  Unused(name); Unused(canFail);
  assert(name == VMString[SELF], "can only access the self slot");
  return self();
}

void AccessScopeDesc::printMethodHolder() {
  lprintf("method holder: ");
  _methodHolder_or_map->print_real_oop();
  bool b = _methodHolder_or_map->is_map();
  if (b) {
    lprintf(" (same as receiver)");
  }
}

AccessScopeDesc::AccessScopeDesc(nmethodScopes* scopes, int32 offset)
  : ScopeDesc(scopes, offset) {
  self_name     = _scopes->unpackNameDescAt(_name_desc_offset);
  self_type     = _scopes->unpackOopAt(_name_desc_offset);  
  _methodHolder_or_map = _scopes->unpackOopAt(_name_desc_offset); 
}

bool AccessScopeDesc::l_equivalent(simpleLookup* l) {
  // xxx miw
  return ScopeDesc::l_equivalent(l) && selfMapOop()->equal(l->receiverMapOop());
  // _methodHolder_or_map != l->methodHolder; see above
}

bool DataAccessScopeDesc::s_equivalent(ScopeDesc* s) {
  return s->isDataAccessScope() && AccessScopeDesc::s_equivalent(s);
}

void DataAccessScopeDesc::printName() {
  lprintf("DataAccess");
}

bool DataAssignmentScopeDesc::s_equivalent(ScopeDesc* s) {
  return s->isDataAssignmentScope() && AccessScopeDesc::s_equivalent(s);
}

void DataAssignmentScopeDesc::printName() {
  lprintf("DataAssignment");
}


# ifdef SIC_COMPILER
  static SExpr* getSExpr(oop self_type) {
    if (self_type->is_map()) {
      if (self_type == Memory->true_mapOop()) {
        return new ConstantSExpr(Memory->trueObj, NULL, NULL);
      } else if (self_type == Memory->false_mapOop()) {
        return new ConstantSExpr(Memory->falseObj, NULL, NULL);
      } else {
        return new MapSExpr(mapOop(self_type), NULL, NULL);
      }
    } else {
      return new ConstantSExpr(self_type, NULL, NULL);
    }
  }
  
  SExpr* MethodScopeDesc::selfExpr() { return getSExpr(self_type); }
  SExpr* TopLevelBlockScopeDesc::selfExpr() { return getSExpr(self_type); }
  SExpr* AccessScopeDesc::selfExpr() { return getSExpr(self_type); }

  SExpr* TopLevelBlockScopeDesc::rcvrExpr() {
    nmethod* nm = this->_scopes->my_nmethod();
    return getSExpr(nm->reusable()
                    ? mapOop(badOop) : nm->key.receiverMapOop()); // xxx miw
  }
  SExpr* BlockScopeDesc::rcvrExpr() {
    return getSExpr(receiverMapOop());
  }
# endif

static mapOop getSelfMap(oop self_type) {
  if (self_type->is_map()) {
    return (mapOop)self_type;
  } else {
    return self_type->map()->enclosing_mapOop();
  }
}
  
mapOop MethodScopeDesc::selfMapOop() { return getSelfMap(self_type); }
mapOop TopLevelBlockScopeDesc::selfMapOop() { return getSelfMap(self_type); }
mapOop AccessScopeDesc::selfMapOop() { return getSelfMap(self_type); }


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
