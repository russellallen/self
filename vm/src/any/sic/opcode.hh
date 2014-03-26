#pragma once
/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "top.hh"



// opcodes used by the new compiler and the SIC

enum BranchOpCode {
  ALBranchOp, // unconditional, allows uncond branch bcs to be consistent
  EQBranchOp, NEBranchOp,
  LTBranchOp, LEBranchOp, LTUBranchOp, LEUBranchOp,
  GTBranchOp, GEBranchOp, GTUBranchOp, GEUBranchOp,
  VSBranchOp, VCBranchOp,
  IsIntTagBranchOp, IsntIntTagBranchOp,
  IsFloatTagBranchOp, IsntFloatTagBranchOp,
  IsMemTagBranchOp, IsntMemTagBranchOp,
  IsDelayedValueBranchOp, IsntDelayedValueBranchOp,
  LastBranchOp
  };

enum ArithOpCode {
  NilArithOp,
  
  // may not set condition codes
  AddArithOp, SubArithOp, MulArithOp, DivArithOp,
  AndArithOp, OrArithOp, XOrArithOp,
  ArithmeticLeftShiftArithOp, LogicalLeftShiftArithOp, 
  ArithmeticRightShiftArithOp, LogicalRightShiftArithOp,

  // set cond codes
  AddCCArithOp, SubCCArithOp, AndCCArithOp, OrCCArithOp,
  
  // check tags
  TAddCCArithOp, TSubCCArithOp, TMulCCArithOp, TDivCCArithOp, TModCCArithOp,
  TALShiftCCArithOp, TARShiftCCArithOp, TLLShiftCCArithOp, TLRShiftCCArithOp,
  TAndCCArithOp, TOrCCArithOp, TXorCCArithOp,
  
  LastArithOp
  };

extern const char* BranchOpName[];    // indexed by BranchOpCode
extern const char*  ArithOpName[];    // indexed by  ArithOpCode

ArithOpCode opcode_for_selector(oop sel);

bool can_fold_rcvr_op_zero_to_zero(ArithOpCode op);
