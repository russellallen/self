/* Sun-$Revision: 30.17 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "codeSlotsMap.hh"
# include "_codeSlotsMap.cpp.incl"


slotsOop methodMap::basic_create_method(slotList* slots,
                                         ByteCode* b,
                                         methodMap &m1,
                                         const char* annotation,
                                         bool isBlock) {

  slotsOop method;
  methodMap* m= (methodMap*) create_map(isBlock
                                        ? sizeof(blockMethodMap)
                                        : sizeof(methodMap),
                                        slots, &m1, (oop*)&method);
  m->setFile(b->file);
  m->setLine(b->line);
  m->setLiterals(b->literals);
  m->setSource(b->source);
  m->setCodes(b->codes);
  if (isBlock) {
    blockMethodMap *bmm= (blockMethodMap*)m;
    Memory->store((oop*)&bmm->_sourceOffset, b->sourceOffset);
    Memory->store((oop*)&bmm->_sourceLen,    b->sourceLen);
  }    

  if (*annotation != '\0') m->set_annotation(new_string(annotation));

  return method;
}


oop codeSlotsMap::mirror_names(oop ignored) {
  Unused(ignored);
  objVectorOop r= Memory->objVectorObj->cloneSize(length_nonVM_slots());
  fint i= 0;
  {  // arguments go first, in order of their declaration
    FOR_EACH_SLOTDESC(this, sd) {
      if (sd->is_arg_slot()) {
        r->obj_at_put(smiOop(sd->data)->value(), sd->name);
        ++i;
      }
    }
  }
  {  // other slots
    FOR_EACH_SLOTDESC(this, sd) {
      if (!sd->is_vm_slot() && !sd->is_arg_slot()) {
        r->obj_at_put(i++, sd->name);
        if (sd->is_obj_slot())
          r->obj_at_put(i++, sd->assignment_slot_name());
      }
    }
  }
  return r;
}


// return mirror for enclosing method

oop blockMethodMap::mirror_parent(oop obj) {
  Unused(obj);
  return get_lexical_link()->as_mirror();
}


// set the outer method link in literals

void methodMap::set_outer_method_link_in_literals( slotsOop outerMethod ) {
  // set literals
  // can get here of outerMethod is a blockmethod when fixing up
  //  block method bytecodes after adding/rming slot to block
  
  if ( outerMethod->kind() != OuterMethodType)
    return;

  objVectorOop lits = literals();
  lits = (objVectorOop)lits->copy_add_slot( VMString[METHOD_POINTER], 
                                            vm_obj_slotType,
                                            outerMethod,
                                            Memory->slotAnnotationObj,
                                            true);

  assert(lits->is_objVector(), "copy_add_slot failed!");
  assert(lits != literals(), "need fresh copy of literals");
  setLiterals(lits); 
}


// set my object's lexical link (functional), return new method

slotsOop blockMethodMap::set_lexical_link( slotsOop block_method, 
                                           slotsOop enclosingMethod ) {
  oop block_meth_or_mark=
    block_method->copy_add_slot( VMString[LEXICAL_PARENT],
                                 vm_parent_map_slotType,
                                 enclosingMethod,
                                 Memory->slotAnnotationObj,
                                 true);
  assert_slots(block_meth_or_mark, "add_slot failed");
  slotsOop new_block_meth = slotsOop(block_meth_or_mark);
  blockMethodMap* new_map = (blockMethodMap*) new_block_meth->map();    
  assert(this != new_map,  "must have new map");
  
  if (source() == Memory->stringObj) {
    // set the source offset and length of the old version back to
    // zero as it doesn't have a source string, and we don't want
    // it to trip the verify in blockMethodMap.
    _sourceOffset= _sourceLen= smiOop_zero;
  }
  return new_block_meth;
}


// Walk recursively through blocks and set lexical links
//  Precondition: I am a new method map
//  Postcondition, unless isOKToBashLiteralVector,
//    my literals will be new and bashable, for me and for other routines
//    that follow

void methodMap::set_lexical_links( slotsOop   enclosingMethod,
                                   slotsOop       outerMethod,
                                   stringOop  src,
                                   fint       srcOffset,
                                   bool       isOKToBashLiteralVector) {



  // Setting lexical links will create new blocks to store in the literals
  // Before mutating literals, be sure no other method is sharing it.
  // Only have to worry about outermost method's literals here:
  //  blocks are changed functionally, and create_block creates new lit vector.
  //  (of course copy_add_slots can be used on a block, but then its
  //   method IS the outermost method here)
  // -- dmu 4/96

  if (!isOKToBashLiteralVector)
    setLiterals(literals()->copy());

  // handle blocks referred to by the literal vector
  objVectorOop lits = literals();
  for (fint index = 0; index < lits->length(); index++) {
    oop obj = lits->obj_at(index);
    if (obj->is_block())  {
      slotsOop v = blockOop(obj)->value();
      if (v->has_code()) {
        blockMethodMap* bmm = (blockMethodMap*) v->map();
        slotsOop new_block_meth = bmm->set_lexical_link( v, enclosingMethod );

        // at this stage, have new block_meth, but its literals
        //  point to wrong outer method, and its blocks point to
        //  wrong parent method

        blockOop new_block = create_block(new_block_meth);
        lits->obj_at_put( index, new_block);

        // now fix the block's method, better clone literals because they
        //  may be shared with old block

        ((blockMethodMap*)new_block_meth->map()) 
            -> set_lexical_links( new_block_meth, 
                                  outerMethod, 
                                  src, 
                                  srcOffset, 
                                  false);
      }
    }
  }
}


// pass down src recursively, since for run scripts,
//  the outer method does not have the source, but the enclosing
//  block does -- dmu 12/95

void blockMethodMap::set_lexical_links( slotsOop  enclosingMethod,
                                        slotsOop      outerMethod,
                                        stringOop src,
                                        fint      srcOffset, 
                                        bool      isOKToBashLiteralVector) {
  if (source() == Memory->stringObj) {
    // fix up source and source offset to refer to source of outerMethod
    assert(enclosingMethod->kind() == BlockMethodType,
           "was expecting a nested block method");
    setSource(src);
    srcOffset += _sourceOffset->value();
    _sourceOffset= as_smiOop(srcOffset);
  }
  else
    src = source();

  methodMap::set_lexical_links( enclosingMethod, 
                                outerMethod, 
                                src, 
                                srcOffset, 
                                isOKToBashLiteralVector);
}



// called from create_outer_method_prim, and also
// by VM for creating the prototype outer method,
// by VM for Eval'ing expressions,
// by Object::GenBody for parsing expressions,
// by lookupErrorCode for creating lookup error methods,
// by Process::initialize to create method to start a process
// by evalExpressions in shell for top-level read-eval-print loop

slotsOop methodMap::create_outerMethod( slotList*   slots, 
                                        ByteCode*   b,
                                        const char* annotation,
                                        IntBList*   stack_deltas ) {
  slots = slots->add(VMString[SELF], vm_parent_map_slotType, NULL);
  outerMethodMap m;
  slotsOop method = methodMap::basic_create_method(slots, b, m, annotation, false);
  return (slotsOop) method->fix_up_method(NULL, true, true, stack_deltas);
}


slotsOop blockMethodMap::create_blockMethod( slotList*   slots, 
                                             ByteCode*   b, 
                                             const char* annotation,
                                             IntBList*   stack_deltas) {
  slots = slots->add(VMString[LEXICAL_PARENT], vm_parent_map_slotType, 
                     Memory->lobbyObj);
  blockMethodMap m;
  // since starting from slot list do not have to fix it up
  slotsOop method = methodMap::basic_create_method(slots, b, m, annotation, true);
  // except for stack_deltas!
  return stack_deltas 
    ?  (slotsOop) method->fix_up_method(NULL, true, true, stack_deltas) 
    :             method;
    
}


bool methodMap::verify(oop obj) {
  bool flag = slotsMap::verify(obj);
  if (flag) {
    /* cannot verify this anymore, because
     * methods are now created with byteVectors, 
     * since fix_up copies and canonizes--dmu 11/95
     *
     * if (! obj->codes()->is_string()) {
     *  error1("codes of method oop 0x%lx is not a string", obj);
     *  flag = false;
     * }
     *
     */
    if (! obj->literals()->is_objVector()) {
      error1("literals of method oop 0x%lx is not an objVectorOop", obj);
      flag = false;
    }
    if (! obj->file()->is_string()) {
      error1("file of method oop 0x%lx is not a  string", obj);
      flag = false;
    }
    if (! obj->line()->is_smi()) {
      error1("line of method oop 0x%lx is not a smiOop", obj);
      flag = false;
    }
  }
  return flag;
}

bool outerMethodMap::verify(oop obj) {
  bool flag = methodMap::verify(obj);
  if (flag) {
    if (! obj->source()->is_string()) {
      error1("source of method oop 0x%lx is not a string", obj);
      flag = false;
    }
  }
  return flag;
}

bool blockMethodMap::verify(oop obj) {
  bool flag = methodMap::verify(obj);
  if (flag) {
    if (! source()->is_string()) {
      error1("source of block method oop 0x%lx is not a string", obj);
      flag = false;
    }
    if (! _sourceOffset->is_smi())  {
      error1("source offset of block method oop 0x%lx is not a smallInt", obj);
      flag = false;
    }
    if (! _sourceLen->is_smi())  {
      error1("source length of block method oop 0x%lx is not a smallInt", obj);
      flag = false;
    }
    if (   _sourceOffset->value() < 0
        || _sourceOffset->value() > source()->length())  {
      error1("source offset of block method oop 0x%lx is out of bounds", obj);
      flag = false;
    }
    if (   _sourceLen->value() < 0
        || _sourceOffset->value() + _sourceLen->value() > source()->length()) {
      error1("source length of block method oop 0x%lx is out of bounds", obj);
      flag = false;
    }
  }
  return flag;
}
  
oop methodMap::mirror_codes(oop r)    { Unused(r); return _codes;     }
oop methodMap::mirror_literals(oop r) { Unused(r); return literals(); }
oop methodMap::mirror_source(oop r)   { Unused(r); return source();   }
oop methodMap::mirror_file(oop r)     { Unused(r); return file();     }
oop methodMap::mirror_line(oop r)     { Unused(r); return line();     }



//----------------------------------------------------------------------

// Used to return bci at beginning of statement that arg bci is in.
// Finds points where stack is empty.
// Branch-naive (for now)


class StatementBoundaryBytecodeScanner : public stack_depth_interpreter {
 public:
  fint target_bci;
  fint statement_start;
  fint prev_stack_depth;
  
  StatementBoundaryBytecodeScanner( methodMap* mm, fint tbci )
  : stack_depth_interpreter(mm) {
    target_bci = tbci;
    statement_start = mi.firstBCI();
    prev_stack_depth = 0;
  }
  
  void interpret_method() {
    for (  ;  pc < target_bci;  ++pc ) {
      interpret_bytecode();
      if ( get_error_msg() )
        return;
      if ( get_stack_depth() == 0  
      &&   prev_stack_depth  != 0 )
        statement_start = pc + 1;
      prev_stack_depth = get_stack_depth();
    }
  }
};

fint methodMap::beginningOfStatement(fint bci) {
  StatementBoundaryBytecodeScanner s(this, bci);
  s.interpret_method();
  return s.statement_start;
}


// ----------------------------------------------------------------------


void methodMap::print_string(oop obj, char* buf) {
  Unused(obj);
  sprintf(buf, "<a method>");
}


void methodMap::print_oop(oop obj) {
  lprintf("<a method");
  if (PrintOopAddress) {
    lprintf(" (0x%lx)", (void*)obj);
  }
  lprintf(">");
}


void methodMap::print_source() {
  source()->string_print(); }


void blockMethodMap::print_source() {
  if (_sourceOffset == smiOop_zero)
    source()->string_print();
  else
    source()->string_print(_sourceOffset->value(), _sourceLen->value());
}



// returns the literal index for a bytecode at given bytecode pc
// including any preceeding index bytecodes

fint methodMap::get_index_at(fint byteCodeIndex) {
  u_char* start = start_codes();
  u_char* here = start + byteCodeIndex;
  u_char* p = here;
  for (p = here;
       p > start  &&  getOp(p[-1]) == INDEX_CODE;
       p--)
    ;
  fint x = 0;
  while (p <= here)
    x = x << INDEXWIDTH  |  getIndex(*p++);
  return x;
}

stringOop methodMap::get_selector_at(fint byteCodeIndex) {
  // determine whether this send is a primitive or not
  fint code = start_codes()[byteCodeIndex];
  fint op = getOp(code);
  assert(op == SEND_CODE || op == IMPLICIT_SEND_CODE,
         "expecting a send");
  fint x = get_index_at(byteCodeIndex);
  assert(x >= 0 && x < length_literals(), "literal index out of bounds");
  stringOop sel = (stringOop) start_literals()[x];
  assert_string(sel, "expecting a string message name");
  return sel;
}

int32 methodMap::debug_size(oop p) {
  int32 s = (p->size() + size()) * oopSize;             // method obj and map
  s += codes()->size() * oopSize + codes()->length();   // byte codes
  s += literals()->size()* oopSize;                     // literal vector
  for (fint i = literals()->length() - 1; i >= 0; i--) {
    oop l = literals()->obj_at(i);
    if (l->is_mem()) s += literals()->obj_at(i)->size() * oopSize;
  }
  return s;
}


fint codeSlotsMap::arg_count() {
  fint argc = 0;
  FOR_EACH_SLOTDESC(this, slot) {
    if (slot->is_arg_slot()) argc++;
  }
  assert(has_code() || argc == 0, "only objects with code can have arg slots");
  return argc;
}


// a helper

class oldMapList: public ResourceObj {
 public:
  methodMap*  method_map;
  oldMapList* lexicalParent;

  oldMapList(methodMap* m) {
    method_map = m;
    if (m == NULL) {
      lexicalParent = NULL;
      return;
    }
    methodMap* mm = m->get_lexical_link_map();
    if (mm == NULL) 
      lexicalParent = NULL;
    else
      lexicalParent = new oldMapList(mm);
  }
  
  oldMapList(methodMap* m, oldMapList* n) {
    method_map = m;
    lexicalParent = n;
  }
  methodMap* ancestor(fint n) {
    assert(this != NULL, "ancestors past null");
    return n == 0 ? method_map : lexicalParent->ancestor(n - 1);
  }
};
  

// called after doing a functional programming primitive
//  to fix up the backpointers, and local access bytecodes;
// obj had better be a brand-new method never executed
//  cause we change the map without invalidating code or stack frames
//
// Pass in old optimized method (or NULL) to fix up local access bytecodes.
//  -- dmu

oop methodMap::fix_up_method( oop       new_obj,
                              oop       old_optimized_method,
                              bool      isOKToBashLiteralVector,
                              bool      mustAllocate,
                              IntBList* stack_deltas ) {
  // get a new map in case some other method uses the same map
  // set_lexical_links will be changing it, I think
  // do not rely on lexical links of old method, because
  //  e.g. copy_remove_slots does not preserve them

  assert_slots(new_obj, "obj must have this for its map");
  slotsOop new_meth = slotsOop(new_obj);

  methodMap* new_map = (methodMap*)copy(mustAllocate);
  if (new_map == NULL) return failedAllocationOop;
  new_map->enclosing_mapOop()->init_mark();

  new_meth->set_map(new_map);

  new_map->set_lexical_links( new_meth, new_meth, new_meth->source(), 0,
                              isOKToBashLiteralVector);
  // set_lexical_links has insured that literals in new_meth
  //   and all its contained block-methods are new
  //   (if isOKToBaseLiteralVector then literals in top-level method
  //    were new and need not have been cloned)

  methodMap* old_map = NULL;
  if (old_optimized_method != NULL) {
    Map* m = old_optimized_method->map();
    assert(m->has_code(), "must be a methodMap");
    old_map = (methodMap*)m;
  }
  ResourceMark rm;
  oldMapList* old_maps = new oldMapList(old_map);
  new_map->fix_local_bytecodes_and_links( old_optimized_method == NULL
                                            ? NULL
                                            : old_maps,
                                          new_meth,
                                          stack_deltas);
  return new_meth;
}


// a slot has been added or removed to a method;
//  given the method's old map, replace the local access bytecodes
//  for the old map with ones for me. (oldMap may be null)

void methodMap::fix_local_bytecodes_and_links( oldMapList* old_maps,
                                               slotsOop   outerMethod,
                                               IntBList*  stack_deltas ) {
  fix_local_bytecodes_and_links_of_my_blocks( old_maps, outerMethod);
  fix_local_bytecodes_and_links_in_myself(    old_maps, outerMethod, 
                                              stack_deltas);
}


class BytecodeFixerUpper : public abstract_interpreter {
  oldMapList* old_maps;
  BoolBList* branchTargets;
  IntBList* stack_deltas;
public:
  ByteCode bcode;

  BytecodeFixerUpper(methodMap *mm, oldMapList *oml, IntBList* sds) 
    : abstract_interpreter(mm), bcode(true) {
    old_maps= oml;
    bool gotOne;
    mm->branch_targets(gotOne, &branchTargets); 
    stack_deltas= sds;
  }
    
 protected:
  void define_label() {
    if (stack_deltas) {
      int32 d = stack_deltas->nth(pc);
      for ( ; d > 0;  --d )  do_SELF_CODE();
      for ( ; d < 0;  ++d )  do_POP_CODE();
    }
    if ( pc < branchTargets->length()  &&  branchTargets->nth(pc)) {
      bool ok = bcode.GenLabelDefinition(as_smiOop(pc));
      if (!ok)
        fatal1("The parser and bytecode verifier should have screened out"
               " the label error below:\n%s\n", bcode.errorMessage);
    }
  }
  
 public:
    
  void interpret_method() {
    abstract_interpreter::interpret_method();
    define_label();
  }

  void interpret_bytecode() {
    define_label();
    abstract_interpreter::interpret_bytecode();
  }

protected:
  void do_SELF_CODE() { bcode.GenSelfByteCode(0, 0); }
  void do_POP_CODE()  { bcode.GenPopByteCode( 0, 0); }
  void do_NONLOCAL_RETURN_CODE() { bcode.GenNonLocalReturnByteCode(0, 0); }
  
  void do_BRANCH_CODE()          { 
    bool ok = bcode.GenBranchByteCode( 0, 0, as_smiOop(get_branch_pc()));
    assert(ok, "should not have any branch errors here"); 
  }
  void do_BRANCH_TRUE_CODE()     { 
    bool ok = bcode.GenBranchTrueByteCode(  0, 0, as_smiOop(get_branch_pc()));
    assert(ok, "should not have any branch errors here"); 
  }
  void do_BRANCH_FALSE_CODE()    { 
    bool ok = bcode.GenBranchFalseByteCode(  0, 0, as_smiOop(get_branch_pc())); 
    assert(ok, "should not have any branch errors here"); 
  }
  void do_BRANCH_INDEXED_CODE()  { 
    bool ok = bcode.GenBranchIndexedByteCode(0, 0, get_branch_vector()); 
    assert(ok, "should not have any branch errors here"); 
  }

  void do_literal_code(oop lit) { bcode.GenLiteralByteCode(0, 0, lit); }
  
  void do_read_write_local_code(bool isWrite) {
    slotDesc *sd= old_maps->ancestor(is.lexical_level)->getLocalSlot(0, is.index);
    assert(sd->name != VMString[SELF],  "never really send self");
    stringOop selector=
      isWrite  ?  sd->assignment_slot_name()  :  sd->name;
    mi.map()->GenSendOrLocal(&bcode, selector); }
    
  void do_SEND_CODE() {
    bcode.GenSendByteCode( 0, 0, get_selector(), false, false, NULL); }
    
  void do_IMPLICIT_SEND_CODE() {
    if ( is.is_undirected_resend || is.delegatee ) {
      bcode.GenSendByteCode( 0, 0, get_selector(), true,
                           is.is_undirected_resend, is.delegatee);
    }
    else {
      mi.map()->GenSendOrLocal( &bcode, get_selector());
    }
  }
};



void methodMap::fix_local_bytecodes_and_links_in_myself( oldMapList* old_maps,
                                                         slotsOop outerMethod,
                                                         IntBList* stack_deltas )
{
  if (old_maps != NULL)
    assert(codes() == old_maps->method_map->codes(),
           "old map should have same codes");

  BytecodeFixerUpper b(this, old_maps, stack_deltas);
  b.interpret_method();
  if ( !b.bcode.Finish() )
    fatal("should have passed parser already");
  setLiterals(b.bcode.literals);
  set_outer_method_link_in_literals(outerMethod);
  setCodes(new_string(b.bcode.codes->bytes(), b.bcode.codes->length()));
}




void methodMap::fix_local_bytecodes_and_links_of_my_blocks(oldMapList* old_maps,
                                                           slotsOop   outerMethod) {
  
  oop* new_litp = start_literals();
  oop* new_lit_end = new_litp + length_literals();

  for ( ;  new_litp < new_lit_end;  ++new_litp ) {
    if ((*new_litp)->is_block_with_code()) {

      blockMethodMap* nm = 
        (blockMethodMap*) blockOop(*new_litp)->value()->map();
        
      // since block code is fixed when the block method was created,
      //  dont have to pass down old maps here

      oldMapList* old_maps_out = new oldMapList(nm, old_maps);
      nm->fix_local_bytecodes_and_links(old_maps_out, outerMethod);
    }
  }
}


void methodMap::GenSendOrLocal( ByteCode *bc,
                                stringOop sel) {
  stringOop selOfSlot = NULL;
  methodMap* m = this;

  if ( UseLocalAccessBytecodes  &&  sel->is_unary() )
    selOfSlot = sel;  // reading
  else if ( UseLocalAccessBytecodes  &&  sel->is_1arg_keyword() )
    selOfSlot = sel->unary();  // writing
  else
    m = NULL; // don't even try

  fint lexicalLevel = 0;
  for ( ;
        m != NULL;
        ++lexicalLevel,  m = m->get_lexical_link_map()) {
    slotDesc* sd = m->find_nonVM_slot(selOfSlot);
    if ( sd != NULL 
         // check for write of const slot
         && (sel == selOfSlot  ||  sd->is_obj_slot())) {
      bc->GenRWLocalByteCode( 0, 0,
                              sel == selOfSlot,
                              lexicalLevel,
                              sd - m->slots());
      return;
    }
  }
  bc->GenSendByteCode(0, 0, sel, true, false, NULL);
}
  

// return contents of my lexical link
slotsOop blockMethodMap::get_lexical_link() {
  slotDesc* lps = find_slot(VMString[LEXICAL_PARENT]);
  assert(lps != NULL, "block must have lexical link");
  assert(lps->is_map_slot(), "only have map");
  oop r = lps->data;
  assert_slots(r, "lexical parent must be a method");
  return slotsOop(r);
}
  

// return contents of my lexical link
methodMap* blockMethodMap::get_lexical_link_map() {
  Map* m = get_lexical_link()->map();
  return m->has_code() ? (methodMap*)m : NULL;
}
  

slotDesc* methodMap::getLocalSlot( fint lexicalLevel, fint index ) {
  methodMap* m = this;
  for (fint i = 0;  i < lexicalLevel; i++) {
    m = m->get_lexical_link_map();
    assert(m != NULL, "bad lexical level");
  }
  return m->slot(index);
}


//----------------------------------------------------------------------

// need only for simplistic stack alloc nic hack

class BytecodeBranchScanner : public abstract_interpreter {
public:
  bool hasBranch;

  BytecodeBranchScanner(methodMap *m) : abstract_interpreter(m) {
    hasBranch= false; }

protected:
  void do_branch_code( int32 /* target_PC */, oop /* target_oop */ = badOop ) {
    hasBranch= true;
    pc= mi.length_codes; // look no further
  }
  void do_BRANCH_INDEXED_CODE() {
    hasBranch= true;
    pc= mi.length_codes; // look no further
  }
};


bool methodMap::containsBranch() {
  BytecodeBranchScanner sc(this);
  sc.interpret_method();
  return sc.hasBranch;
}


//----------------------------------------------------------------------

class BytecodeLoopScanner : public abstract_interpreter {
public:
  bool hasLoop;

  BytecodeLoopScanner(methodMap *m) : abstract_interpreter(m) {
    hasLoop= false; }

protected:
  void do_branch_code( int32 target_PC, oop target_oop = badOop ) {
    Unused(target_oop);
    if (target_PC <= pc) {
      hasLoop= true;
      pc= mi.length_codes; // look no further
    }
  }
  void do_BRANCH_INDEXED_CODE() {
    objVectorOop v= get_branch_vector();
    for ( int32 i = 0, n = v->length();  i < n;  ++i )
      if ( smiOop( v->obj_at(i) )->value() <= pc) {
        hasLoop= true;
        pc= mi.length_codes;
        return;
      }
  }
};


bool methodMap::containsLoop() {
  BytecodeLoopScanner sc(this);
  sc.interpret_method();
  return sc.hasLoop;
}


//----------------------------------------------------------------------


class BytecodeNLRScanner : public abstract_interpreter {
public:
  bool hasNLR;

  BytecodeNLRScanner(methodMap *m) : abstract_interpreter(m) {
    hasNLR= false; }

protected:
  void do_NONLOCAL_RETURN_CODE() {
    if (mi.map()->kind() == BlockMethodType)
      hasNLR= true; }

  void do_literal_code(oop lit) {
    if (lit->is_block_with_code()) {
      blockOop b= blockOop(lit);
      BytecodeNLRScanner sub((methodMap*)b->value()->map());
      sub.interpret_method();
      if (sub.hasNLR) {
        hasNLR= true;
        pc= mi.length_codes; // look no further
      }
    }
  }
};


bool methodMap::containsNLR() {
  BytecodeNLRScanner sc(this);
  sc.interpret_method();
  return sc.hasNLR;
}


//----------------------------------------------------------------------

// Used to find selectors of all sends that could uplevel-access local slots 
// (i.e. all implicit-self sends with 0 or 1 args that don't match
// a local slot); includes nested blocks

class AccessedLocalsBytecodeScanner : public abstract_interpreter {
  bool includeMySends;
public:
  StringOopList *selectors;

  AccessedLocalsBytecodeScanner(methodMap *m) : abstract_interpreter(m) {
    assert(!UseLocalAccessBytecodes, "relic of the past");
    includeMySends= m->kind() != OuterMethodType;
    selectors= EMPTY; }

protected:
  void do_SELF_CODE() {
    if (includeMySends) selectors= selectors->add(VMString[SELF]);
  }

  void do_literal_code(oop lit);

  void do_send_code(bool isImplicitSelf, stringOop selector, fint argc) {
    if (   !isImplicitSelf
        || !includeMySends
        || selector->is_prim_name())
      return;
    if (argc == 0  ||  (argc == 1 && !is_punct(selector->bytes()[0]))) {
      addName(selector, mi.map());
    }
  }

  void addName(stringOop selector, Map *map);

};



void AccessedLocalsBytecodeScanner::do_literal_code(oop lit) {
 
  if (!lit->is_block_with_code()) return;

  blockOop b= blockOop(lit);
  blockMethodMap* bmm= (blockMethodMap*)b->value()->map();
  AccessedLocalsBytecodeScanner sub(bmm);
  sub.interpret_method();

  Map *bm= b->map();

  for (StringOopListElem* e= sub.selectors->head(); e; e= e->next()) {
    stringOop selector= e->data();
    addName(selector, bm);
  }
}


void AccessedLocalsBytecodeScanner::addName(stringOop selector, Map *map) {
  // add selector to list if it is not already there and if it does not
  // match a local slot
  assert(!selector->is_prim_name(), "should not have one of these");

  if (selectors->includes(selector))
    return;

  FOR_EACH_SLOTDESC(map, slot) {
    if (slot->is_vm_slot()) continue;
    if (   slot->name == selector
        || slot->is_assignment_slot_name(selector))
      return;
  }
  selectors= selectors->append(selector);
}


IntList* methodMap::accessedSlots(blockMethodMap *bmm) {
  // get locals accessed by bmm
  AccessedLocalsBytecodeScanner sc(bmm);
  sc.interpret_method();

  // translate list of names to list of slot indices
  IntList* slotIndices= EMPTY;
  for (StringOopListElem* e= sc.selectors->head(); e; e= e->next()) {
    stringOop selector= e->data();
    FOR_EACH_SLOTDESC_N(this, s, i) {
      if (s->is_vm_slot()) continue;
      if (s->name == selector || s->is_assignment_slot_name(selector)) {
        slotIndices= slotIndices->append(i);
        break;
      }
    }
  }
  return slotIndices;
}

//----------------------------------------------------------------------

// Used to find indices of slots in enclosing block/method of a block that are
// uplevel-accessed.

class UplevelAccessedLocalsBytecodeScanner : public abstract_interpreter {
  fint targetLexicalLevel;
  methodMap *parentMap;

public:
  IntList *indices;

  UplevelAccessedLocalsBytecodeScanner(blockMethodMap *bmm, methodMap *pm,
                                       fint tll = -1);

protected:
  void do_literal_code(oop lit);
  void do_read_write_local_code(bool isWrite);
};




UplevelAccessedLocalsBytecodeScanner::UplevelAccessedLocalsBytecodeScanner(
  blockMethodMap *bmm, methodMap *pm, fint tll)
  : abstract_interpreter(bmm) {

  assert(UseLocalAccessBytecodes, "relic of the future");

  parentMap= pm;
  indices= EMPTY;

  if (tll >= 0) {
    targetLexicalLevel= tll;
  }
  else {
    targetLexicalLevel= 0;
    for (methodMap* m= mi.map(); 
         m != parentMap;
         m= m->get_lexical_link_map()) {
      ++targetLexicalLevel;
      if (m == NULL)
        ShouldNotReachHere(); // could not find parent
    }
  }
}

void UplevelAccessedLocalsBytecodeScanner::do_literal_code(oop lit) {
  if (!lit->is_block_with_code()) return;

  blockMethodMap *bmm= (blockMethodMap*) blockOop(lit)->value()->map();
  UplevelAccessedLocalsBytecodeScanner sub(bmm, parentMap,
                                           targetLexicalLevel + 1);
  sub.interpret_method();
  for (IntListElem *e= sub.indices->head(); e; e= e->next()) {
    fint index= e->data();
    if (!indices->includes(index))
      indices= indices->append(index);
  }
}

void UplevelAccessedLocalsBytecodeScanner::do_read_write_local_code(bool isW) {
  Unused(isW);
  if (   is.lexical_level == targetLexicalLevel
      && !indices->includes(is.index))
    indices= indices->append(is.index);
}


IntList* blockMethodMap::uplevel_accessed_slots(methodMap* parentMap) {
  UplevelAccessedLocalsBytecodeScanner sc(this, parentMap);
  sc.interpret_method();
  return sc.indices;      
}

//----------------------------------------------------------------------

// I record the bci's of expression stack values
// that are used, not just popped.
// If not debugMode, don't record "trivial" ones.
// hack: push negative PCs for debug-only values

class ExprStackBCIsBytecodeScanner : public stacking_interpreter {
  bool debugMode;
  bool onlyForDebug;
  IntList* bcis;
  char* used_bci_flags; // need flags cause used_bcis must be sorted
  IntList* used_bcis;
  
 public:

  ExprStackBCIsBytecodeScanner(methodMap *mm, bool debug)
    : stacking_interpreter(mm) {
    debugMode= debug; 
    bcis= EMPTY;
    used_bci_flags = NEW_RESOURCE_ARRAY(char, mi.length_codes);
    for (fint i = 0,  n = mi.length_codes;  
              i < n;  
              used_bci_flags[i++] = '\0')  { }
    used_bcis= EMPTY;
  }

 protected:

  void push() { 
    bcis= bcis->push(onlyForDebug ? -pc : pc); }
      
  void* pop(fint n = 1) { 
    assert(n >= 0, "just checking");
    for ( ; n > 0;  --n ) {
      int bci= bcis->pop(); 
      if ( bci < 0  &&  !debugMode ) {
        // toss it, debugOnly bci but not in debugMode
      }
      else
        used_bci_flags[ bci < 0  ?  -bci  :  bci] = '\1';
    }
    return NULL; 
  }
  
  fint get_stack_depth() { return bcis->length(); }

  void do_SELF_CODE() {
    onlyForDebug = true;
    stacking_interpreter::do_SELF_CODE();
  }
  void do_POP_CODE() {
    onlyForDebug = true; 
    stacking_interpreter::do_POP_CODE();
  }
  // don't do anything for nonlocal return code;
  //   previous push will have genererated expr bci
  void do_literal_code(oop lit);
  void do_read_write_local_code(bool isWrite);
  void do_send_code(bool isImp, stringOop sel, fint arg_count);
  
 public:
  IntList* result_bcis() { 
    for (fint i = mi.firstBCI(),  n = mi.length_codes;  
              i < n;  
              ++i ) {
      if (used_bci_flags[i])
        used_bcis= used_bcis->append(i);
    }
    return used_bcis; 
  }
  
  void interpret_method() {
    stacking_interpreter::interpret_method();
    check_and_pop(); // want bci of bytecode computing result that method returns
  }
};


void ExprStackBCIsBytecodeScanner::do_literal_code(oop lit) {
  if (lit->is_block_with_code()) {
    // even if blocks are just popped, the old version of this method
    // reported them, so keep that behavior -- dmu
    used_bci_flags[ pc ] = '\1';
  }
  onlyForDebug = !lit->is_block_with_code();
  stacking_interpreter::do_literal_code(lit);
}

void ExprStackBCIsBytecodeScanner::do_read_write_local_code(bool isWrite) {
  if (isWrite) {
    onlyForDebug = true;
  }
  else {
    // do not need to duplicate arg slot name descs
    // handled by CodeScopeDesc::exprStackElem
    onlyForDebug =
        is.lexical_level == 0
    &&  mi.map()->getLocalSlot(is.lexical_level, is.index)->is_arg_slot();
  }
  stacking_interpreter::do_read_write_local_code(isWrite);
}

void ExprStackBCIsBytecodeScanner::do_send_code(bool isImp, stringOop sel, fint arg_count) {
  slotDesc* s;
  
  // don't need to duplicate arg slot name descs
  onlyForDebug = 
      !UseLocalAccessBytecodes  
  &&   isImp  
  &&  (s= mi.map()->find_slot(sel)) != NULL
  && s->is_arg_slot();

  stacking_interpreter::do_send_code(isImp, sel, arg_count);
}


// return a list of bcis that push things on the stack that
//  will need to be recorded/visible for debugging

IntList* methodMap::expression_stack_bcis(bool debugMode) {
  ExprStackBCIsBytecodeScanner sc(this, debugMode || containsBranch() );
  sc.interpret_method();
  return sc.result_bcis();
}



//----------------------------------------------------------------------

class ExprStackBytecodeScanner : public stacking_interpreter {
  fint bci;
  bool keepArgs;
public:
  IntList *stack;

  ExprStackBytecodeScanner(methodMap *mm, fint b, bool keep, fint startBCI)
    : stacking_interpreter(mm) {
    bci= b;
    keepArgs= keep;
    pc= startBCI;
    stack= EMPTY;

    if ( /* !CheckAssertions  ||  */ 
         startBCI <= bci  ||  (bci == 0  &&  startBCI <= 1) )
      ;
    else
      fatal2("start(%d) > target(%d)  is OK only for first bytecode -- dmu 5/03",
              startBCI, bci);
    }

  void interpret_method() {
    while ( pc < mi.length_codes ) {
      interpret_bytecode();
      ++pc;
    }
  }


 protected:

  int   get_stack_depth() { return stack->length(); }
  void  push() { stack= stack->push(pc); }
  void* pop(fint n = 1) { stack->pop(n); return NULL; }
  
  void interpret_bytecode() {
    // at bci, stop if not a send
    //    if it is a send, do send then stop
    
    fetch_and_decode_bytecode();
    if (pc < bci)
      dispatch_bytecode();
    else if ( pc == bci
         &&   ( bc.op == SEND_CODE  ||  bc.op == IMPLICIT_SEND_CODE ) ) {
      dispatch_bytecode();
      pc= mi.length_codes;
    }
    else
      pc= mi.length_codes;
  }

  void do_send_code(bool isImp, stringOop sel, fint arg_count);
};

void ExprStackBytecodeScanner::do_send_code(bool isImp, stringOop sel, fint arg_count) {
  if (pc < bci) {
    stacking_interpreter::do_send_code(isImp, sel, arg_count);
  }
  else if (!keepArgs) {
    // pop off args (do not want args anyway)
    stacking_interpreter::do_send_code(isImp, sel, arg_count);
    pop();  // but pop result, send is suspended
  }
}



IntList* methodMap::expression_stack(fint bci, bool keepArgs,
                                     fint startBCI) {
  // returns the byte code indices making up the current expression stack
  // bci = current position; except for sends, it means we are suspended just 
  // before executing bytecode bci.  For sends, we are "during" the send, and
  // keepArgs determines whether the send's arguments should be included
  // or not.
  // oldest expr stack elem is first in list, most recent is last
  
  ExprStackBytecodeScanner sc(this, bci, keepArgs, startBCI);
  sc.interpret_method();
  return sc.stack->reverse();
}


//----------------------------------------------------------------------


// In order to make it easier to generate bytecodes,
// the checker allows the bytecodes after an unconditional branch
// to have a different expression stack height, as long at it matches
// all branches to the point after the unconditional branch.
// Since the compilers require the height to match,
// the bytecode checker returns a list of integers, indexed by pc.
// This list is the deltas required.
// In other words, a 1 means that a push self must be added before this
// code when fixing up the codes, a -1 means a pop must be added, etc.

// How the method is traversed:
//  when a branch is encountered, its destination(s) are
//  added to bb_heads_to_do.
//  If the branch is conditional, traversal continues in a straight line.

class BytecodeChecker : public stack_depth_interpreter {
 protected:
  IntBList* stack_depths; // for checking branch target stack depths
  IntBList* bb_heads_to_do; // for nonlinear traversal to compute deltas
  bool*     bcs_done;       // true if already checked this bc
  
public:
  IntBList* stack_deltas;
public:

  BytecodeChecker(byteVectorOop codes, objVectorOop literals)
  : stack_depth_interpreter(codes, literals) {
    stack_depths   = new IntBList( mi.length_codes + 1);
    stack_deltas   = new IntBList( mi.length_codes + 1);
    bb_heads_to_do = new IntBList( mi.length_codes );
    bcs_done = NEW_RESOURCE_ARRAY( bool, mi.length_codes );
    memset(bcs_done, 0, sizeof(bool) * mi.length_codes );
    
    for (fint i = 0;  i <= mi.length_codes;  ++i) {
      stack_depths->nthPut(i, -1, true); // set to do not care
      stack_deltas->nthPut(i,  0, true);
     }
    if (mi.length_codes > 0)
      bb_heads_to_do->push(mi.firstBCI());
  }

    
  
protected:
  
  bool check(aiCheckFn fn, oop p = NULL) {
    (*fn)(this, p);
    return !error_msg;
  }

  void check_stack_depth(int32 tpc) {
    int32 d= stack_depths->nth(tpc);
    if (d == -1) { // haven't checked it yet
      // was prev code an uncond branch?
      // if so, calc stack delta
      if ( tpc > 0  
      &&  getOp(mi.codes[tpc-1]) == BRANCH_CODE
      &&  stack_depths->nth(tpc-1) != -1 )
        stack_deltas->nthPut(tpc, get_stack_depth() - stack_depths->nth(tpc-1));
      stack_depths->nthPut(tpc, get_stack_depth());
    }
    else if (d != get_stack_depth()) {
      static char buf[BUFSIZ];
      sprintf(buf, "stack depth mismatch: %d vs %d, pcs %d vs %d",
              get_stack_depth(), d, pc, tpc);
      set_error_msg(buf);
    }
    if ( tpc == mi.length_codes  // ensure stack had entry at end of method
    &&   get_stack_depth() != 1) {
      static char buf[BUFSIZ];
      sprintf( buf, 
               "stack must be one deep at end of method, depth is %d",
               get_stack_depth());
      set_error_msg(buf);
    }
  }
  
    
  void do_BRANCH_CODE() {
    stacking_interpreter::do_BRANCH_CODE();
    if (error_msg)
      return;
    // handle successor of uncond branch
    // this even works if this bc is the last one
    // because can have branches to one past last bytecode
    int32 d = stack_depths->nth(pc+1);
    if (d != -1)
      stack_deltas->nthPut(pc+1, d - get_stack_depth());
    pc = mi.length_codes; // NOT mi.length_codes-1
  }
  
  
  void do_branch_code( int32 target_PC, oop target_oop = badOop ) {
    bb_heads_to_do->push( target_PC );
    stacking_interpreter::do_branch_code( target_PC, target_oop);
    if (error_msg)
      return;
    check_stack_depth( target_PC );
  }  
  
  
  void do_BRANCH_INDEXED_CODE()  { 
    stacking_interpreter::do_BRANCH_INDEXED_CODE();
    if (error_msg)
      return;
    objVectorOop v = get_branch_vector(); 
    for (int32 i = 0,  n = v->length();  i < n;  ++i) {
      assert_smi(v->obj_at(i), "should have been checked by get_branch_vector");
      int tpc= smiOop(v->obj_at(i))->value();
      bb_heads_to_do->push( tpc );
      check_stack_depth( tpc );
      if (error_msg)
        return;
    }
  }
  
  void do_NONLOCAL_RETURN_CODE() {
    if (pc + 1 != mi.length_codes) 
      set_error_msg("return is not last bytecode"); 
  }
   
  // self-level defined methods should not have these local codes in them;
  //  at self level cannot know the required indices, so VM adds these codes later
  void do_read_write_local_code(bool isWrite) { 
    if (!AllowLocalAccessInCreatedMethods)
      set_error_msg("read/write local are illegal (VM will insert them automatically)");
    stack_depth_interpreter::do_read_write_local_code(isWrite);
  }
  void do_LEXICAL_LEVEL_CODE()   { 
    if (!AllowLocalAccessInCreatedMethods)
      set_error_msg("illegal lexical level code"); 
    stack_depth_interpreter::do_LEXICAL_LEVEL_CODE();
  }
  void do_illegal_code()         { set_error_msg("undefined byte code"); }

  
 public:
  void interpret_method() {
    // must check stack depth before each code and after last one
    // NOT sequential
    while ( bb_heads_to_do->nonEmpty()) {
      for (  pc = bb_heads_to_do->pop(),
             set_stack_depth( 
               pc == mi.firstBCI()
                 ? 0                       // first bc starts w/ empty stack
                 : stack_depths->nth(pc)); // was set by branch to me
             pc < mi.length_codes
             &&  !bcs_done[pc];  // stop if already been here
             ++pc ) {
        check_stack_depth(pc);
        interpret_bytecode();
        bcs_done[pc] = true;
        if (get_error_msg())
          return;
      }
      if (pc == mi.length_codes) {
        // just fell off end of method, check stack
        check_stack_depth(pc);
        pre_NONLOCAL_RETURN_CODE(); // checks zero index, etc.
      }
    }
  }
  
};


// Returns null iff the byte codes and literals are OK -- dmu 2/93
// Sets the errorIndex to the position of the bad bytecode, or -1.
  
const char* methodMap::check_byteCodes_and_literals( smi&            errorIndex,
                                                     IntBList*&      stack_deltas,
                                                     byteVectorOop   codes,
                                                     objVectorOop    literals ) {
  BytecodeChecker ch(codes, literals);
  ch.interpret_method();
  errorIndex= ch.pc;
  stack_deltas= ch.stack_deltas;
  if (ch.get_error_msg())
    return ch.get_error_msg();
  return NULL;
}


//----------------------------------------------------------------------

class BlockBytecodeScanner : public abstract_interpreter {
  fint bci;
public:
  IntList* blks;
  OopList* blkLiterals;

  BlockBytecodeScanner(methodMap *mm, fint b)
    : abstract_interpreter(mm) {
    blks= EMPTY;
    blkLiterals= EMPTY;
    bool hasLoop = mm->containsLoop();
    // If method contains a backwards branch, must consider
    // all blocks as live everywhere, not just up to the pc.
    // (The NIC will allocate locations and init them in prologue.)
    // Sic does not do branches yet. -- dmu
    bci=  hasLoop ? mi.length_codes : b;
  }

  void interpret_method() {
    for (pc= mi.firstBCI();  pc < bci;  ++pc)
      interpret_bytecode(); 
  }

protected:
  void do_literal_code(oop lit) {
    if (lit->is_block_with_code()) {
      blks= blks->append(pc);
      blkLiterals= blkLiterals->append(lit);
    }
  }
};


IntList* methodMap::blocks_upto(fint bci,  OopList** literals) {

  // if method has a branch, all block locs will be
  //  initialized at start, therefore, must include all blocks
  //  lest frame copying neglect to zero out an inited
  //  but not cloned block -- dmu 10/96
  if (  bci != length_codes()
  &&    containsBranch() )
    bci = length_codes();
    
  BlockBytecodeScanner sc(this, bci);
  sc.interpret_method();
  if (literals != NULL)
    *literals = sc.blkLiterals;
  return sc.blks;
}

IntList* methodMap::all_blocks(OopList** literals) {
  return blocks_upto(length_codes(), literals);
}


//----------------------------------------------------------------------


// return a blist 
// that contains the true for every branch bytecode
// it goes one past the end for branches to returns -- dmu

class BranchTargetFinder: public abstract_interpreter {
 public:
  BoolBList*  branch_targets;
  BoolBList*  backwards_branch_targets;
  bool        separateDirections;
  bool        got_one;
  
  BranchTargetFinder(methodMap *mm, bool sepDirs) : abstract_interpreter(mm) {
    separateDirections = sepDirs;
    branch_targets = new BoolBList(mi.length_codes + 1);
    backwards_branch_targets =   separateDirections
      ?  new BoolBList(mi.length_codes + 1)
      :  NULL;
    for (int32 i = 0;  i < mi.length_codes + 1;  ++i) {
      branch_targets->push(NULL);
      if (separateDirections)
        backwards_branch_targets->push(NULL);
    }
    got_one= false;
  }
  
  void target(int32 t) {
    got_one= true;
   ( separateDirections &&  t <= pc  
        ?  backwards_branch_targets  
        :  branch_targets )
     ->nthPut(t, true, true);
  }
  
  void do_branch_code( int32 target_PC, oop target_oop = badOop ) {
    Unused(target_oop);
    target(target_PC);
  }
  
  void do_BRANCH_INDEXED_CODE() {
    objVectorOop v= get_branch_vector();
    for (int32 i = 0,  n = v->length();  i < n;  ++i)
      target(smiOop(v->obj_at(i))->value());
  }
};



// if bacwkards_branch_targets is omitted (NULL)
// return bcis that are branch bc targets in branch_targets.
// If not null, return targets of fwd branches in branch_targets
// and targets of backwards branches in last argument.

void methodMap::branch_targets( bool& got_one,  
                                BoolBList** branch_targets,
                                BoolBList** backwards_branch_targets) {
  bool discriminateDirection = backwards_branch_targets != NULL;
  BranchTargetFinder btf(this, discriminateDirection);
  btf.interpret_method();
  *branch_targets=  btf.branch_targets;
  if (discriminateDirection)
    *backwards_branch_targets= btf.backwards_branch_targets;
  got_one= btf.got_one;
}



//----------------------------------------------------------------------

class BytecodePrinter : public abstract_interpreter {
public:

  BytecodePrinter(methodMap *mm, fint startBCI = 0)
    : abstract_interpreter(mm) {
    pc= startBCI == 0 ? mi.firstBCI() : startBCI;
    is.index= mm->get_index_at(startBCI) >> INDEXWIDTH;
    do_print = true;
  }

  void interpret_method() {
    for ( pc= mi.firstBCI();  pc < mi.length_codes;  ++pc) {
      lprintf("\t\t%d: ", pc);
      interpret_bytecode();
      lprintf("\n");
      if (error_msg) {
        lprintf( "*** %s in preceeding bytecode\n", error_msg);
      }
      error_msg = NULL;
    }
  }

  void setup_state() {
    // sets index, arg count, etc.
    do_print = false;
    fint startBCI = pc;
    for (pc= mi.firstBCI();  pc < startBCI;  ++pc) {
      interpret_bytecode();
      error_msg = NULL;
    }
    pc = startBCI;
    do_print = true;
  }
    
protected:

  bool do_print;

  bool check(aiCheckFn fn, oop p = NULL) {
    (*fn)(this, p);
    return !error_msg;
  }

  void do_SELF_CODE()               { if (do_print)  lprintf("self"); }
  void do_POP_CODE()                { if (do_print)  lprintf("pop"); }
  void do_NONLOCAL_RETURN_CODE()    { if (do_print)  lprintf("non-local return"); }
  void do_UNDIRECTED_RESEND_CODE()  { if (do_print)  lprintf("undirected-resend"); }
  void do_INDEX_CODE()              { if (do_print)  lprintf("index %d", bc.x); }

  void do_BRANCH_CODE()          {
    if (do_print) {
      lprintf("branch: ");
      get_literal()->print_oop(); 
    }
  }
  void do_BRANCH_TRUE_CODE()     {
    if (do_print) {
      lprintf("branch if true: ");
      get_literal()->print_oop(); 
    }
  }
  void do_BRANCH_FALSE_CODE()    {
    if (do_print) {
      lprintf("branch if false: ");
      get_literal()->print_oop(); 
    }
  }
  void do_BRANCH_INDEXED_CODE()  {
    if (do_print) {
      lprintf("branch indexed: ");
      get_literal()->print_oop();
    }
  }

  void do_LEXICAL_LEVEL_CODE()      { if (do_print)  lprintf("lexical level %d",  is.index); }
  void do_ARGUMENT_COUNT_CODE()     { if (do_print)  lprintf("argument count %d", is.index); }

  void do_send_code(bool isSelfImplicit, stringOop sel, fint arg_count) {
    if (do_print) {
      lprintf("%ssend: ", isSelfImplicit ? "implicit self " : "");
      sel->string_print();
      lprintf(" %d arguments", arg_count);
    }
  }
  void do_read_write_local_code(bool isWrite) {
    if (do_print)
      lprintf("%s local: %d",
             isWrite ? "write" : "read",
             is.index); 
  }
  void do_DELEGATEE_CODE() {
    if (do_print) {
      lprintf("delegatee: ");
      get_literal()->print_oop(); 
    }
  }

  void do_literal_code(oop lit) {
    if (do_print) {
      lprintf("literal: ");
      lit->print_oop(); 
    }
  }
};


void methodMap::print_byteCode_at(fint bci) {
  BytecodePrinter sc(this, bci);
  sc.setup_state();
  sc.interpret_bytecode();
}


void methodMap::print_code(oop obj) {
  Unused(obj);
  lprintf("\n");
  stringOop f = file();
  smiOop ln = line();
  if (f->length() > 0) {
    lprintf("\tFile (%#lx):\t", f);
    f->string_print();
    lprintf(", line: %ld\n", long(ln->value()));
  }
  lprintf("\tSource (%#lx):\t", source());
  print_source();
  lprintf("\n");
  lprintf("\tLiterals (%#lx)\n", literals());
  lprintf("\tByte codes (%#lx):\n", codes());
  
  BytecodePrinter sc(this);
  sc.interpret_method();
}
