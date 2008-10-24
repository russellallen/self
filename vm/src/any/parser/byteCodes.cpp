/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "byteCodes.hh"
# include "_byteCodes.cpp.incl"

// generation routines

void AbstractByteCode::GenLiteralByteCode(fint offset, fint length,
                                          oop literal) { 
  GenCode(offset, length,
          BuildCode(LITERAL_CODE, GenIndex(offset, length,
                                           GenLiteral(literal)))); 
        ++stack_depth;
}


void AbstractByteCode::GenUndirectedResendByteCode(fint offset, fint length) {
  GenCode(offset, length,
          BuildCode( NO_OPERAND_CODE, UNDIRECTED_RESEND_CODE));
}


void AbstractByteCode::GenDelegateeByteCode(fint offset, fint length, stringOop delegatee) {
  GenCode(offset, length,
          BuildCode(DELEGATEE_CODE, GenIndex(offset, length,
                                           GenLiteral(delegatee)))); 
}


void AbstractByteCode::GenSendByteCode( fint offset, fint length,
                                        stringOop selector, 
                                        bool isSelfImplicit,
                                        bool isUndirectedResend, 
                                        stringOop resendTarget) {
                                        
  if (resendTarget != NULL) {
    GenDelegateeByteCode(offset, length, resendTarget);
  }
  else if ( isUndirectedResend )
     GenUndirectedResendByteCode(offset, length);

  fint argc = selector->arg_count();
  if (GenArgCountBytecode  &&  argc != 0)
    GenCode(offset, length, 
            BuildCode( ARGUMENT_COUNT_CODE, 
                       GenIndex(offset, length, argc)));
    
  GenCode(offset, length,
          BuildCode( isSelfImplicit ? IMPLICIT_SEND_CODE : SEND_CODE, 
                     GenIndex(offset, length,
                              GenLiteral(selector))));
                              
  if (!isSelfImplicit)
    --stack_depth;
  stack_depth -= argc;
  assert(stack_depth >= 0, "negative stack?");
  ++stack_depth;
}


void AbstractByteCode::GenRWLocalByteCode( fint offset, fint length,
                                           bool isRead,
                                           int32 lexicalLevel,
                                           int32 index) {
  assert(lexicalLevel >= 0  && index >= 0, "just checkin'");
  if ( lexicalLevel > 0 )
    GenCode(offset, length,
            BuildCode(LEXICAL_LEVEL_CODE,
                      GenIndex( offset, length, lexicalLevel )));
  
  GenCode(offset, length,
          BuildCode(isRead ? READ_LOCAL_CODE : WRITE_LOCAL_CODE,
                    GenIndex( offset, length, index )));
                    
  if ( isRead )
    ++stack_depth;
}
  

void AbstractByteCode::GenSelfByteCode(fint offset, fint length) {
  GenCode(offset, length, BuildCode(NO_OPERAND_CODE, SELF_CODE));
  ++stack_depth;
}

void AbstractByteCode::GenPopByteCode(fint offset, fint length) {
  GenCode(offset, length, BuildCode(NO_OPERAND_CODE, POP_CODE));
  --stack_depth;
  assert(stack_depth >= 0, "negative stack?");
}

void AbstractByteCode::GenNonLocalReturnByteCode(fint offset, fint length) {
  GenCode(offset, length, BuildCode(NO_OPERAND_CODE, NONLOCAL_RETURN_CODE));
}       


bool AbstractByteCode::GenSimpleBranchByteCode( fint offset,
                                                fint length,
                                                oop label,
                                                ByteCodeKind op ) {
  int32 literalIndex = labelSet->RecordLabelInfo( this, label, 
                                                  stack_depth, simpleBranch,
                                                  bci() );
  if ( literalIndex == -1 )
    return false;
  branchSet->RecordBranch( false, literalIndex, label );
  GenCode(offset, length, BuildCode(op, 
    GenIndex( offset, length, literalIndex)));
  return true;
}
                                       

bool AbstractByteCode::GenBranchByteCode( fint offset, 
                                          fint length,
                                          oop label) {
  bool r= GenSimpleBranchByteCode( offset, length, label, BRANCH_CODE);
  return r;
}


bool AbstractByteCode::GenBranchTrueByteCode( fint offset, 
                                              fint length,
                                              oop label) {
  
  --stack_depth;
  assert(stack_depth >= 0, "negative stack?");
  if ( !GenSimpleBranchByteCode( offset, length, label, BRANCH_TRUE_CODE))
    return false;
  return true;
}


bool AbstractByteCode::GenBranchFalseByteCode( fint offset, 
                                               fint length,
                                               oop label) {
  --stack_depth;
  assert(stack_depth >= 0, "negative stack?");
  if ( !GenSimpleBranchByteCode( offset, length, label, BRANCH_FALSE_CODE))
    return false;
  return true;
}


bool AbstractByteCode::GenBranchIndexedByteCode( fint offset, 
                                                 fint length,
                                                 objVectorOop labels) {
                                                 
  --stack_depth;
  assert(stack_depth >= 0, "negative stack?");
  int32 literalIndex = 
    labelSet->RecordLabelVectorInfo( this, labels, stack_depth, bci() );
  if ( literalIndex == -1 )
    return false;
  branchSet->RecordBranch( true, literalIndex, literals->obj_at(literalIndex) );
  GenCode(offset, length, BuildCode(BRANCH_INDEXED_CODE, 
    GenIndex( offset, length, literalIndex)));
  return true;
}
 

void AbstractByteCode::GenInstructionSetSelectionByteCode( fint offset, fint length,
                                                           InstructionSetKind k) {
  assert(0 <= k  &&  k <= LAST_INSTRUCTION_SET,  "bad instruction set");
  GenCode(offset, length, BuildCode(INSTRUCTION_SET_SELECTION_CODE, k));
}


bool AbstractByteCode::GenLabelDefinition( oop label) {
  return 
    -1  !=  labelSet->RecordLabelInfo( this, label, stack_depth, 
                                       defineLabel, bci());
}


bool AbstractByteCode::ResolveBranches() {
  return branchSet->ResolveBranches(this, labelSet, literals);
}


// generation helpers

fint AbstractByteCode::GenIndex(fint offset, fint length, fint x) {
  return x <= MAXINDEX ? x : GenExtendedIndex(offset, length, x);
}
  
void ByteCode::GenCode(fint offset, fint length, fint c) {
  Unused(offset); Unused(length);
  if (codeIndex == maxCodeIndex) {
    maxCodeIndex *= 2;
    codes= codes->cloneSize(maxCodeIndex);
  }
  codes->byte_at_put(codeIndex++, (char)c);
}

fint AbstractByteCode::GenLiteral(oop p) {
  for (fint i = 0; i < literalIndex; i ++) {
    if (literals->obj_at(i) == p) {
      return i;
    }
  }
  if (literalIndex == maxLiteralIndex) {
    maxLiteralIndex *= 2;
    literals= literals->cloneSize(maxLiteralIndex);
  }
  literals->obj_at_put(literalIndex, p);
  return literalIndex++;
}


fint AbstractByteCode::GenExtendedIndex(fint offset, fint length, fint x) {
  assert(x > MAXINDEX, "shouldn't be calling");
  GenCode(offset, length, BuildCode(INDEX_CODE, GenIndex(offset, length,
                                                         x >> INDEXWIDTH)));
  return x & MAXINDEX;
}

oop create_outer_method_prim(oop ignore,
                             byteVectorOop bv,
                             objVectorOop lits,
                             stringOop file,
                             smiOop line,
                             stringOop source) {
  Unused(ignore);
  ResourceMark rm;

  if (bv->length() == 0)
    return ErrorCodes::general_prim_error("Error: empty byte code vector");

  smi errorIndex;
  IntBList* stack_deltas;
  const char* errorMsg = check_byteCodes_and_literals( errorIndex, stack_deltas,
                                                       bv, lits );
  if (errorMsg) {
    char buf[BUFSIZ];
    (void) sprintf(buf, "Error: bad byte code at: %d <%s>", 
                   errorIndex, errorMsg);
    return ErrorCodes::general_prim_error(buf);
  }
  // clone bv & lits for cheap insurance
  // also must clone literals because create_outerMethod will set
  //   the methodPointer in it
  ByteCode b(false, new_string(bv->bytes(), bv->length()),
             lits->clone(), file, line, source);
  oop m = create_outerMethod(0, &b, "", stack_deltas);
  return m->as_mirror();
}


bool ByteCode::Finish() {
  if ( !ResolveBranches())
    return false;
  codes= codes->cloneSize(codeIndex, mustAllocate);
  literals= literals->cloneSize(literalIndex, mustAllocate);
  if ( codes == failedAllocationOop ) {
    errorMessage= "out of memory for codes in ByteCode::Finish";
    ranOutOfMemory= true;
    return false;
  }
  if ( literals == failedAllocationOop) {
    errorMessage= "out of memory for literals in ByteCode::Finish";
    ranOutOfMemory= true;
    return false;
  }
  return true;
}


bool ByteCode::Finish(char* fname, fint sourceLine,
                      char* srcStart, fint srcLen) {
  if (!Finish())
    return false;
  file= mustAllocate ? new_string(fname) : new_string_or_fail(fname);
  line= as_smiOop(sourceLine);
  source= new_string(srcStart, srcLen, mustAllocate);
  if ( file == failedAllocationOop ) {
    errorMessage= "out of memory for file in ByteCode::Finish";
    ranOutOfMemory= true;
    return false;
  }
  if ( source == failedAllocationOop ) {
    errorMessage= "out of memory for source in ByteCode::Finish";
    ranOutOfMemory= true;
    return false;
  }
  return true;
}


bool ByteCode::Finish(char* fname, char* src) {
  return Finish(fname, 1, src, strlen(src));
}


bool ByteCode::Finish(char* fname, fint sourceLine, fint srcOffset, fint srcLen) {
  bool r = Finish();
  if (!r) return false;
  if ((file= new_string(fname)) == failedAllocationOop) {
    errorMessage= "out of memory for file in ByteCode::Finish";
    ranOutOfMemory = true;
    return false;
  }
  line= as_smiOop(sourceLine);
  source= Memory->stringObj;
  sourceOffset= as_smiOop(srcOffset);
  sourceLen=    as_smiOop(srcLen);
  return r;
}


oop create_block_method_prim(oop ignore,
                             byteVectorOop bv,
                             objVectorOop lits,
                             stringOop file,
                             smiOop line,
                             stringOop source) {
  Unused(ignore);
  ResourceMark rm;

  if (bv->length() == 0)
    return ErrorCodes::general_prim_error("Error: empty byte code vector");

  smi errorIndex;
  IntBList* stack_deltas;
  const char* errorMsg = check_byteCodes_and_literals( errorIndex, stack_deltas,
                                                       bv, lits );
  if ( errorMsg ) {
    char buf[BUFSIZ];
    (void) sprintf(buf, "Error: bad byte code at: %d <%s>",
                   errorIndex, errorMsg);
    return ErrorCodes::general_prim_error(buf);
  }
  // clone bv & lits for cheap insurance
  ByteCode b(false, new_string(bv->bytes(), bv->length()),
             lits->clone(), file, line, source);
  oop m = create_blockMethod(NULL, &b, "", stack_deltas);

  return m->as_mirror();
}
