/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "opcode.hh"
# include "_opcode.cpp.incl"

const char* BranchOpName[] = {
  "Bra",
  "Beq", "Bne",
  "Blt", "Ble", "Bltu", "Bleu",
  "Bge", "Bgt", "Bgeu", "Bgtu",
  "Bvs", "Bvc",
  "BrIfIntTag", "BrIfNotIntTag",
  "BrIfFloatTag", "BrIfNotFloatTag",
  "BrIfMemTag", "BrIfNotMemTag",
  "BrIfDelayedValue", "BrIfNotDelayedValue",
  "Last (INVALID)"
  };

const char* ArithOpName[] = {
  "Nil (INVALID)",
  "Add", "Sub", "Mul", "Div",
  "And", "Or", "XOr",
  "Asl", "Lsl",
  "Asr", "Lsr",

  "AddCC", "Cmp", "AndCC", "OrCC",
  "TAddCC", "TSubCC", "TMulCC", "TDivCC", "TModCC",
  "TALShiftCC", "TARShiftCC", "TLLShiftCC", "TLRShiftCC",
  "TAndCC", "TOrCC", "TXorCC",
  
  "Last (INVALID)"
  };

void opcode_init() {
  if (sizeof(BranchOpName) / sizeof(char*) != LastBranchOp + 1)
    fatal("forgot to change BranchOpName after changing BranchOpCode");
  if (sizeof(ArithOpName) / sizeof(char*) != LastArithOp + 1)
    fatal("forgot to change ArithOpName after changing ArithOpCode");
}


ArithOpCode opcode_for_selector(oop sel) {
  return
       sel == VMString[_INT_ADD_    ]    ?        TAddCCArithOp
  :    sel == VMString[_INT_AND_    ]    ?        TAndCCArithOp
  :    sel == VMString[_INT_ALSHIFT_]    ?    TALShiftCCArithOp
  :    sel == VMString[_INT_MOD_    ]    ?        TModCCArithOp
  :    sel == VMString[_INT_ARSHIFT_]    ?    TARShiftCCArithOp
  :    sel == VMString[_INT_DIV_    ]    ?        TDivCCArithOp
  :    sel == VMString[_INT_LLSHIFT_]    ?    TLLShiftCCArithOp
  :    sel == VMString[_INT_LRSHIFT_]    ?    TLRShiftCCArithOp
  :    sel == VMString[_INT_MUL_    ]    ?        TMulCCArithOp
  :    sel == VMString[_INT_OR_     ]    ?         TOrCCArithOp  
  :    sel == VMString[_INT_SUB_    ]    ?        TSubCCArithOp
  :    sel == VMString[_INT_XOR_    ]    ?        TXorCCArithOp
  :                                                  NilArithOp;
}

bool can_fold_rcvr_op_zero_to_zero(ArithOpCode op) {
  switch (op) {
   case  TALShiftCCArithOp:  return true;
   case  TARShiftCCArithOp:  return true;
   case  TLLShiftCCArithOp:  return true;
   case  TLRShiftCCArithOp:  return true;
   case       TOrCCArithOp:  return true;
   case      TAddCCArithOp:  return true;
   case      TSubCCArithOp:  return true;
   case      TXorCCArithOp:  return true;
   default:                  return false;
  }
}
