# if defined(__ppc__) || defined(__powerpc__)
/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// helper functions to access individual fields of PPC instructions

// xxxx XXXXX CULL this file


typedef int32 inst_t;

 enum OPCD_codes { 
  opcd_Branch = 18,
  opcd_BranchConditional = 16,
  opcd_BranchConditionalToSpecialRegister = 19,
  
  opcd_ConditionRegisterLogical = 19,
  
  opcd_AndImmediate  = 28,
  opcd_AndImmediateShifted = 29,
  opcd_OrImmediate  = 24,
  opcd_OrImmediateShifted = 25,
  opcd_XorImmediate  = 26,
  opcd_XorImmediateShifted = 27,
  
  opcd_CompareImmediate = 11,
  opcd_CompareLogicalImmediate = 10,
  
  opcd_AddImmediate = 14,
  opcd_AddImmediateShifted = 15,
  opcd_AddImmediateCarrying = 12,
  opcd_AddImmediateCarryingAndRecord = 13,
  
  opcd_SubtractFromImmediateCarrying = 8,
  
  opcd_MultiplyLowImmediate = 7,
  
  opcd_LoadByteAndZero = 34,
  opcd_LoadByteAndZeroWithUpdate = 35,
  opcd_LoadHalfwordAndZero = 40,
  opcd_LoadHalfwordAndZeroWithUpdate = 41,
  opcd_LoadHalfwordAlgebraic = 42,
  opcd_LoadHalfwordAlgebraicWithUpdate = 43,
  opcd_LoadWordAndZero = 32,
  opcd_LoadWordAndZeroWithUpdate = 33,
  opcd_LoadDS = 58,
  
  opcd_StoreByte = 38,
  opcd_StoreByteWithUpdate = 39,
  opcd_StoreHalfword = 44,
  opcd_StoreHalfwordWithUpdate = 45,
  opcd_StoreWord = 36,
  opcd_StoreWordWithUpdate = 37,
  opcd_StoreDS = 62,
  
  opcd_LoadMultipleWord = 46,
  opcd_StoreMultipleWord = 47,
  
  opcd_XO = 31,

  opcd_SystemCall = 17,
  
  opcd_TrapWordImmediate = 3,
  opcd_TrapDoublewordImmediate = 2,
  
  opcd_DoublewordRotate = 30,
  opcd_RotateLeftWordThenAndMaskImm = 21,
  opcd_RotateLeftWordThenAndMask = 23,
  opcd_RotateLeftWordImmThenMaskInsert = 20
};

enum XOpExts {
  BcrLinkRegXOp  = 16,
  BcrCountRegXOp = 528,
  
  CrlAndXOp  = 257,
  CrlOrXOp   = 449,
  CrlXorXOp  = 193,
  CrlNandXOp = 225,
  CrlNorXOp  =  33,
  CrlEqvXOp  = 289,
  CrlAndcXOp = 129,
  CrlOrcXOp  = 417,

  LoadByteAndZeroXOp = 87,
  LoadByteAndZeroUpdateXOp = 119,
  LoadHalfwordAndZeroXOp = 279,
  LoadHalfwordAndZeroUpdateXOp = 311,
  LoadHalfwordAlgebraicXOp = 343,
  LoadHalfwordAlgebraicUpdateXOp = 375,
  LoadWordAndZeroXOp = 23,
  LoadWordAndZeroUpdateXOp = 55,
  LoadWordAlgebraicXOp = 341,
  LoadWordAlgebraicUpdateXOp = 373,
  LoadDoublewordXOp = 21,
  LoadDoublewordUpdateXOp = 53,
  
  StoreByteXOp = 215,
  StoreByteUpdateXOp = 247,
  StoreHalfwordXOp = 407,
  StoreHalfwordUpdateXOp = 439,
  StoreWordXOp = 151,
  StoreWordUpdateXOp = 183,
  StoreDoublewordXOp = 149,
  StoreDoublewordUpdateXOp = 181,
  
  LoadHalfwordByteReversedXOp = 790,
  LoadWordByteReversedXOp = 534,
  StoreHalfwordByteReversedXOp = 918,
  StoreWordByteReveresedXOp = 662,

  LoadStringWordXOp = 533,
  StoreStringWordXOp = 661,
  
  LoadStringWordImmediateXOp = 597,
  StoreStringWordImmediateXOp = 725,
  
  LoadWordAndReserveXOp = 20,
  LoadDoublewordAndReserveXOp = 84,
  StoreWordConditionalXOp = 150,
  StoreDoublewordConditionalXOp = 214,

  SynchronizeXOp = 598,
  

  AddXOp = 266,
  SubtractFromXOp = 40,
  AddCarryingXOp = 10,
  SubtractFromCarryingXOp = 8,
  AddExtendedXOp = 138,
  SubtractFromExtendedXOp = 136,
  AddToMinusOneExtendedXOp = 234,
  SubtractFromMinusOneExtendedXOp = 232,
  AddToZeroExtendedXOp = 202,
  SubtractFromZeroExtendedXOp = 200,
  NegateXOp = 104,
  MultiplyLowDoublewordXOp = 233,
  MultiplyLowWordXOp = 235,
  MultiplyHighDoublewordXOp = 73,
  MultiplyHighWordXOp = 75,
  MultiplyHighDoublewordUnsignedXOp = 9,
  MultiplyHighWordUnsignedXOp = 11,
  DivideDoublewordXOp = 489,
  DivideWordXOp = 491,
  DivideDoublewordUnsignedXOp = 457,
  DivideWordUnsignedXOp = 459,
  
  CompareXOp = 0,
  CompareLogicalXOp = 32,
  
  TrapWordXOp = 4,
  TrapDoublewordXOp = 68,
  
  AndXOp = 28,
  OrXOp = 444,
  XorXOp = 316,
  NandXOp = 476,
  NorXOp = 124,
  EquivalentXOp = 284,
  AndWithComplementXOp = 60,
  OrWithComplementXOp = 412,
  
  ExtendSignByteXOp = 954,
  ExtendSignHalfwordXOp = 922,
  ExtendSignWordXOp = 986,
  CountLeadingZerosDoublewordXOp = 58,
  CountLeadingZerosWordXOp = 26,
  
  MoveToSpecialRegXOp = 467,
  MoveFromSpecialRegXOp = 339,
  
  MoveToConditionRegisterXOp = 144,
  MoveToConditionRegisterFromXERXOp = 512,
  MoveFromConditionRegisterXOp = 19,
  
  ShiftLeftDoublewordXOp = 27,
  ShiftLeftWordXOp = 24,
  ShiftRightDoublewordXOp = 539,
  ShiftRightWordXOp = 536,
  ShiftRightAlgebraicDoublewordXOp = 539,
  ShiftRightAlgebraicWordXOp = 792,
  
  ShiftRightAlgebraicDoublewordImmediateXOp = 413,
  ShiftRightAlgebraicWordImmediateXOp = 824
};


enum DSXOp {
  dsx_WordAlgebraic = 2,
  dsx_Doubleword = 0,
  dsx_DoublewordUpdate = 1
};

enum SPR_code {
  spr_XER = 1,
  spr_LR  = 8,
  spr_CTR = 9
};

inline fint OP(inst_t inst)   { return (unsigned int)inst >> 26; }
inline fint XOP1(inst_t inst) { return (inst >> 1) &  ((1 << 10)-1); }
inline fint SPR(inst_t inst)  { 
  int32 i = inst >> 11;
  return  ((i >> 5) & 31)  |  ((i & 31) << 5);
}


inline bool isAddingInst(inst_t inst) {
  // return true if instruction adds si to ra
  switch (OP(inst)) {
     case opcd_LoadByteAndZero:
     case opcd_LoadByteAndZeroWithUpdate:
     case opcd_LoadHalfwordAndZero:
     case opcd_LoadHalfwordAndZeroWithUpdate:
     case opcd_LoadWordAndZero:
     case opcd_LoadWordAndZeroWithUpdate:
     case opcd_LoadHalfwordAlgebraic:
     case opcd_LoadHalfwordAlgebraicWithUpdate:
     
     case opcd_StoreByte:
     case opcd_StoreByteWithUpdate:
     case opcd_StoreHalfword:
     case opcd_StoreHalfwordWithUpdate:
     case opcd_StoreWord:
     case opcd_StoreWordWithUpdate:
     
     case opcd_LoadMultipleWord:
     case opcd_StoreMultipleWord:
     
     case opcd_AddImmediate:
      return true;
      
     default:  return false;
    }
  }
  
   

inline inst_t signExtend(int32 field_bit_size, int32 i) {
  return   i
        | (i   &   1 << (field_bit_size-1)
           ?   ~0u << field_bit_size
           :    0u ); 
}


const int li_bits = 26;
const int bd_bits = 16;
const int ui_bits = 16;
const int si_bits = 16;
const int li_mask = ((1 << li_bits) - 1) & ~3;
const int bd_mask = ((1 << bd_bits) - 1) & ~3;
const int ui_mask = 0xffff;
const int si_mask = 0xffff;


const int MaxUnimpImm = 1 << li_bits;
const int UncommonRestartBit = MaxUnimpImm >> 1;

inline inst_t linkBit(inst_t inst) { return inst & 1; }
inline inst_t absoluteBit(inst_t inst) { return inst & 2; }
inline inst_t RA(inst_t inst) { return (inst >> 16) & 0x1f; }
inline inst_t RT(inst_t inst) { return (inst >> 21) & 0x1f; }
inline inst_t RS(inst_t inst) { return RT(inst); }

inline inst_t UI(inst_t i) { return i & ui_mask; }

inline void  set_ui(inst_t* instp, uint16 newVal) {
  *instp = newVal | (*instp & 0xffff0000);
  MachineCache::flush_instruction_cache_word(instp);
  assert(UI(*instp) == newVal, "oops");
}

inline int32 SI(inst_t i) { i &= si_mask;  return (i & 0x8000) ? (0xffff0000 | i) : i; }
inline void  set_si(inst_t* instp, int16 newVal) {
  set_ui(instp, uint16(newVal));
  MachineCache::flush_instruction_cache_word(instp);
  assert(SI(*instp) == newVal, "oops");
}
  
inline bool fits_within_li(int32 i) {
  return -(1 << (li_bits-1)) <= i  &&  i < (1 << (li_bits-1));
}

inline bool fits_within_si(int32 i) {
  return -(1 << (si_bits-1)) <= i  &&  i < (1 << (si_bits-1));
}

inline bool isImmediate(smiOop value) {
  return fits_within_si(int32(value));
}

inline bool fits_within_ui(int32 i) {
  return 0 <= i  &&  i <= ui_mask;
}

bool is_immediate_pair(inst_t* instp);
int32 immediate_pair_target(inst_t* instp);

inline bool isBranch(inst_t* instp) {
  fint opp = OP(*instp);
  switch (opp) {
    case opcd_Branch:
    case opcd_BranchConditional:
    case opcd_BranchConditionalToSpecialRegister:
      return true;
  }
  return false;
}


inline bool isImmediateBranch(inst_t* instp) {
  fint opp = OP(*instp);
  switch (opp) {
    case opcd_Branch:
    case opcd_BranchConditional:
      return true;
  }
  return false;
}

inline bool is_ori(inst_t inst) {
  return OP(inst) == opcd_OrImmediate;
}

inline bool is_oris(inst_t inst) {
  return OP(inst) == opcd_OrImmediateShifted;
}

inline bool is_branch_to_ctr(inst_t inst) {
  return OP(inst) == opcd_BranchConditionalToSpecialRegister  &&  XOP1(inst) == BcrCountRegXOp;
}

inline bool is_branch_to_lr(inst_t inst) {
  return OP(inst) == opcd_BranchConditionalToSpecialRegister  &&  XOP1(inst) == BcrLinkRegXOp;
}

inline bool is_addi(inst_t inst) {
  return OP(inst) == opcd_AddImmediate;
}
inline bool is_addis(inst_t inst) {
  return OP(inst) == opcd_AddImmediateShifted;
}

inline bool is_lis(inst_t inst) {
  return is_addis(inst)  &&  RA(inst) == 0;
}

inline bool is_mtctr(inst_t inst) {
  return XOP1(inst) == MoveToSpecialRegXOp  &&  OP(inst) == opcd_XO  &&  SPR(inst) == spr_CTR;
}

inline bool is_mtlr(inst_t inst) {
  return XOP1(inst) == MoveToSpecialRegXOp  &&  OP(inst) == opcd_XO  &&  SPR(inst) == spr_LR;
}
  
inline bool is_mflr(inst_t inst) {
  return XOP1(inst) == MoveFromSpecialRegXOp  &&  OP(inst) == opcd_XO  &&  SPR(inst) == spr_LR;
}

inline bool isCall(inst_t* instp) {
  inst_t inst = *instp;
  return isBranch(instp)
  &&     linkBit(inst); 
}

inline bool isImmediateCall(inst_t* instp) {
  inst_t inst = *instp;
  return isImmediateBranch(instp)
  &&     linkBit(inst); 
}

inline bool isBranchAbsolute(inst_t inst) {
  // instruction is branch I or cond branch
  assert(OP(inst) == opcd_Branch  ||  OP(inst) == opcd_BranchConditional,
         "must be branch");
  return absoluteBit(inst);
}

inline bool is_lmw (pc_t x) { return OP(*(inst_t*)x) == opcd_LoadMultipleWord;  }
inline bool is_stmw(pc_t x) { return OP(*(inst_t*)x) == opcd_StoreMultipleWord; }
  
inline bool is_stw (inst_t i) { return OP(i) == opcd_StoreWord; }
inline bool is_stwu(inst_t i) { return OP(i) == opcd_StoreWordWithUpdate; }

inline bool is_lwz(inst_t i) { return OP(i) == opcd_LoadWordAndZero; }

inline bool is_cmplwi(inst_t i) { return OP(i) == opcd_CompareLogicalImmediate; }
inline bool is_cmpwi( inst_t i) { return OP(i) == opcd_CompareImmediate; }

inline bool is_load_store_immediate(inst_t i) {
  int32 op = OP(i);
  return 32 <= op  &&  op <= 58; // from the book
}

inline bool isUnimp(int32* instp) {
  return *instp == 0; // see 1.8.2 Illegal Instruction Class
}

inline bool isUnconditionalImmediateBranch(inst_t inst) {
  return OP(inst) == opcd_Branch;
}

inline int32 unconditionalImmediateBranch_target(inst_t* instp) {
  return  (absoluteBit(*instp) ? 0 : int32(instp)) + signExtend(li_bits, *instp & li_mask );
}

inline int32 conditionalImmediateBranch_target(inst_t* instp) {
  return  (absoluteBit(*instp) ? 0 : int32(instp)) + signExtend(bd_bits, *instp & bd_mask );
}

inline void set_unconditionalImmediateBranch_target(inst_t* instp, int32 nv) {
  inst_t inst = *instp;
  if (!absoluteBit(inst)) nv -= int32(instp);  
  *instp = (inst & ~li_mask)  |  (li_mask & nv);
  MachineCache::flush_instruction_cache_word(instp);
}
inline void   set_conditionalImmediateBranch_target(inst_t* instp, int32 nv) {
  inst_t inst = *instp;
  if (!absoluteBit(inst)) nv -= int32(instp);
  *instp = (inst & ~bd_mask)  |  (bd_mask & nv);
  MachineCache::flush_instruction_cache_word(instp);
}

void set_immediate_pair_target(inst_t *instp, int32 nv);


inline int32 displacementBits(inst_t inst) {
  switch (OP(inst)) {
   case opcd_Branch:             return li_bits;
   case opcd_BranchConditional:  return bd_bits;
   default:
     fatal("not a branch");
  }
  return 0;
}

pc_t get_target_of_branch_instruction(inst_t* instp);
pc_t get_target_of_Self_call_site(    inst_t* instp);
pc_t get_target_of_C_call_site(       inst_t* instp);

void set_target_of_branch_instruction(inst_t* instp,  void* target);
void set_target_of_Self_call_site(    inst_t* instp,  void* target);

# endif // __ppc__
