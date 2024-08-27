/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// helper functions to access individual fields of SPARC instructions

// bug: the sethi stuff should be cleaned up; currently, sethi only sets
// 19 bits, and the subsequent add fills in the other 13.  It would be
// cleaner if the division was 22/10 as in the architecture.  But for
// that to work, we would have to distinguish between normal adds
// and "setLo" adds...so for now, only sethi2 does the full 22 bits.
// Also, the args to toHigh/Low should be considered bit patterns, not
// signed numbers.          -Urs 2/93


typedef int32 inst_t;

const uint32 lowWidth = 13;
const uint32 highShift = 10;
const uint32 displacementShift = 2;
const uint32 relativeShift = 2;

const uint32 lowSignBitMask = nthBit(lowWidth - 1);
const uint32 lowMask = nthMask(lowWidth - 1);
const uint32 highMask = ~ lowMask;

const uint32 MaxUnimpImm = 1 << 22;  // size of unimp immediate
const uint32 UncommonRestartBit = MaxUnimpImm >> 1;

# define LOWMASK  ((1 << highShift) - 1)   /* bits set to 0 by SetHi */

inline uint32 toLow(int32 i) {
  return (uint32(i) & lowMask) | (i < 0 ? lowSignBitMask : 0);
}

inline uint32 toHigh(int32 i) {
  return uint32(i - int32((uint32(i) & lowMask) | (i < 0 ? highMask : 0)))
    >> highShift;
}

inline uint32 toHigh2(uint32 i) {   // sets 22 high bits
  return i >> highShift;
}

inline uint32 toDisplacement(int32 i) {
  return uint32(i) >> displacementShift;
}

#ifdef UNUSED
inline uint32 toRelative(int32 i) {
  return uint32(i) >> relativeShift;
}

inline int32 fromRelative(uint32 i) {
  return int32(i << relativeShift);
}
#endif

inline int32 op(int32* instp)  {return uint32(*instp) >> 30  &  3;}
inline int32 op2(int32* instp) {return uint32(*instp) >> 22  &  7;}
inline int32 op3(int32* instp) {return uint32(*instp) >> 19  &  0x3f;}
inline int32 imm(int32* instp) {return uint32(*instp) >> 13  &  1;}
inline int32 rs1(int32* instp) {return uint32(*instp) >> 14  &  0x1f;}
inline int32 rd (int32* instp) {return uint32(*instp) >> 25  &  0x1f;}

inline int32 disp(int32* instp) {return int32(uint32(*instp) << 10) >> 10;}
inline void  setDisp(int32* instp, fint disp) {
  disp &= nthMask(22);
  *instp = (*instp & ~nthMask(22)) | disp; }
inline int32 cond(int32* instp) {return uint32(*instp) >> 25 & 0xf;}
inline bool annulled(int32* instp) {return (uint32(*instp) >> 29 & 1) != 0;}

inline bool isLoadStore(int32* instp) {return op(instp) == 3;}
inline bool isLoadWord(int32* instp) {        // ld [reg + offset], reg
  return op(instp) == 3 && op3(instp) == 0 && imm(instp); }
inline bool isCall     (int32* instp) {return op(instp) == 1;}

inline bool isSetHi(int32* instp) {return op(instp) == 0 && op2(instp) == 4;}
inline bool isBranch(int32* instp) {return op(instp) == 0 && op2(instp) == 2;}
inline bool isConditionalBranch(int32* instp) {
  assert(isBranch(instp), "should be a branch");
  return cond(instp) != 0x8 && cond(instp) != 0x0;
}

inline bool isArith(int32* instp) {return op(instp) == 2;}

inline bool isAdd (int32* instp) {return isArith(instp) && op3(instp) == 0;}
inline bool isOr  (int32* instp) {return isArith(instp) && op3(instp) == 2;}
inline bool isJump(int32* instp) {return isArith(instp) && op3(instp) ==0x38;}

inline bool isUnimp(int32* instp) {return op(instp) == 0 && op2(instp) == 0;}

inline bool isImmed(int32* instp) {return imm(instp) == 1;}

inline Location getArithS1(int32* instp) {
  return Location(uint32(*instp) >> 14  &  0x1f);
}

inline int32 getArithImm(int32* instp) {
  return (*instp & (1 << 12)  ?  -(1 << 13) : 0)  | (*instp & ((1 << 13) - 1));
}

inline void setArithImm(int32* instp, int32 val) {
  *instp = (*instp & ~0xfff) | (val & 0x3ff);
  MachineCache::flush_instruction_cache_word(instp);
}

inline int32 getSetHiImm(int32* instp) {
  return *instp << 10;
}

inline void setSetHiImm(int32* instp, int32 val) {
  *instp = (*instp & 0xffc00000) | (uint32(val) >> 10);
  MachineCache::flush_instruction_cache_word(instp);
}

inline Location getSetHiD(int32* instp) {
  return Location(uint32(*instp) >> 25  &  0x1f);
}

inline int32 getCallImm(int32* instp) {
  assert(isCall(instp), "not a call");
  return (*instp << 2) + int32(instp);
}

inline void  setCallImm(int32* instp, int32 val) {
  assert(isCall(instp), "not a call");
  *instp = 0x40000000 | ((uint32(val) - uint32(instp)) >> 2);
  MachineCache::flush_instruction_cache_word(instp);
}

inline int32* getBranchTarget(int32* instp) {
  return instp + disp(instp);
}

int32 getJumpImm(int32* instp);
void setJumpImm(int32* instp, int32 val);
