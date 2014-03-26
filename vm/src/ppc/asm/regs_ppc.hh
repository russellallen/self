#pragma once
# ifdef __ppc__
/* Sun-$Revision: 30.15 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */



// CAVEAT: the info here is redundantly contained in other files, including
// ppc.format.h !!!!


# if  TARGET_ARCH == PPC_ARCH

  const      fint NumRegisters = 32;  
  const      fint NumArgRegisters = 7; // excludes receiver
  const      fint NumRcvrAndArgRegisters = NumArgRegisters + 1;
  const      fint NumIArgRegisters = 7; // excludes receiver
  const      fint NumRegistersInMask = 32;
  
  // Note: cr2 - cr4 are nonvol

  enum Location {
    // change RegisterNames[] if you change this enum!
    R0,  SP,  RTOC, R3,  R4,  R5,  R6,  R7,  // R3 - R10 are vol, used for outgoing args
    R8,  R9,  R10,  R11, R12, R13, R14, R15,
    R16, R17, R18,  R19, R20, R21, R22, R23, // R16 - R31 are non vol, callee save
    R24, R25, R26,  R27, R28, R29, R30, R31,
    
    LinkRegister,   
    CounterRegister,
    UnAllocated,        // unused or not yet allocated
        
    // PPC uses memory locations to store these:
    // sel = sp -4, del = sp -8 (see frame_format_ppc.hh)
    PerformSelectorLoc,
    PerformDelegateeLoc,

    StackLocations = 100, // used to represent expr stack locations

    ArgStackLocations = -10000, // outgoing args on the stack
    ExtraArgStackLocations = ArgStackLocations + NumArgRegisters,
    EndArgStackLocations = 0,
    
    // where post-frame-creation incoming args are stored:
    IArgStackLocations = -20000, // incoming args on stack (in caller's frame)
    ExtraIArgStackLocations = IArgStackLocations + NumIArgRegisters,
    EndIArgStackLocations = ArgStackLocations,
    

    
    FirstArgRegister = R4,
    LastArgRegister = R10, // must be FirstArgRegister + NumArgRegisters - 1
    
    // after frame creation, args are cached in r30 - r24
    FirstIArgRegister = R30,
    LastIArgRegister  = R24, // must be FirstArgRegister - NumArgRegisters + 1
    
    IllegalLocation = -1,

    ReceiverReg = R3,
    LReceiverReg = ReceiverReg, // same for leaf as outgoing
    IReceiverReg = R31,
    ResultReg = R3,
    Arg1 = R4,
    Arg2 = R5,
    Arg3 = R6,
    Arg4 = R7,
    Arg5 = R8,
    Arg6 = R9,
    Arg7 = R10,
    
    // Warning: Temp1, Temp2, Lowest/HighestNonVolReg are duplicated in asmDefs_ppc.h
    Temp1 = R11,
    Temp2 = R12, // asm manual says that R13 is nonvol, so don't use another temp, even though MW C thinks that R16 is first nonvol
#   ifdef SIC_COMPILER
    // additional temp, but must be reserved.  on SIC, we do this through the
    // markAllocated function.  See AbstractArrayAtNode::markAllocated (either on
    // SPARC or PPC).  When markAllocated changes the use/def count of the temp register,
    // it won't be used in the temporary register allocation.  -mabdelmalek 12/02
    //
    // Also need to define canCopyPropagateFrom, as in node_ppc.cpp -- dmu 1/03
    Temp3 = R3,
    Temp4 = R4,
#   endif

    // WARNING: duplicated in runtime_asm_gcc_ppc.s
    # define SaveSelfNonVolRegs_entry_point_register Temp1
    # define SaveSelfNonVolRegs_arg_count_register   Temp2


    LowestNonVolReg = R13,   // WARNING: duplicated in asmDefs_ppc.h
    ByteMapBaseReg = LowestNonVolReg,
    SPLimitReg = ByteMapBaseReg + 1,
    LowestLocalNonVolReg = SPLimitReg + 1, // prev ones are global, WARNING: duplicated on LocalMask
    HighestNonVolReg = R31, // WARNING: duplicated in asmDefs_ppc.h
    
    CReceiverReg = R3,
    CResultReg   = ResultReg,
    
    FrameReg = SP,

    NoReg = R0, // used as a temp data register in SIC

    // for recompiles
    RecompileLinkReg = Temp1,
    RecompileTempReg = Temp2,

    // for di lookups: these must be distinct and not arg regs
    DICountReg         = R0,
    DILinkReg          = Temp1,
    DITempReg          = Temp2, 
    
    // while doing an NLR, store important "return values" in registers
    // Duplicated in asmDefs_ppc.h, these must not overlap Temp[12]
    // ReturnTrap depends on the exact binding of these:
     
    NLRHomeIDReg    =     R5,
    NLRHomeReg      =     R4,
    NLRResultReg    =     R3,
    NLRTempReg      =     Temp1 // NIC uses Temp1 for this; probably safe.
                                // double check though -mabdelmalek 11/16/02.
  };
  
    
extern Location ArgRegisters[], IArgRegisters[];

inline bool isRegister(Location r) { return R0 <= r  &&  r <= R31; }
inline bool isIArgRegister(Location r) { return LastIArgRegister <= r  &&  r <= IReceiverReg; }
inline bool isNonVolatileRegister(Location r) { return LowestNonVolReg <= r  &&  r <= HighestNonVolReg; }
inline bool isLocalNonVolatileRegister(Location r) { return LowestLocalNonVolReg <= r  &&  r <= HighestNonVolReg; }

    
inline bool is_IArgStackLocation(Location r) { 
  return   IArgStackLocations <= r  &&  r < EndIArgStackLocations;
}

    
inline bool isExtraIArgRegister(Location r) { // sparcish name
  return ExtraIArgStackLocations <= r  &&  r < EndIArgStackLocations;
}

// 0 = first arg
inline Location IArgStackLocation(fint i) {
  return Location(IArgStackLocations + i);
}

inline Location IArgRegister(fint i) {
  Location r = Location(FirstIArgRegister - i);
  assert( FirstIArgRegister >= r  &&  r >= LastIArgRegister, "oops");
  return r;
}

// 0 = first argument
inline Location IArgLocation(fint i) {
  return i < NumIArgRegisters ? IArgRegister(i) : IArgStackLocation(i);
}

inline fint arg_index_for_IArgRegister(Location x) {
  return IReceiverReg - x - 1;
}
  
inline fint arg_index_for_IArgStackLocation(Location x) {
  return x - IArgStackLocations;
}
   
inline bool is_ArgStackLocation(Location r) { 
  return   ArgStackLocations <= r  &&  r < EndArgStackLocations;
}

inline Location ArgStackLocation(fint i) {
  return Location(ArgStackLocations + i);
}

inline bool isArgRegister(Location loc) {
  return FirstArgRegister <= loc && loc <= LastArgRegister;
}

// 0 = first arg
inline Location ArgRegister(fint i) {
  Location r = Location(FirstArgRegister + i);
  assert(isArgRegister(r), "");
  return r;
}

inline fint arg_index_for_ArgStackLocation(Location x) {
  assert(is_ArgStackLocation(x), "bad location for arg_index_for_ArgStackLocation");
  return x - ArgStackLocations;
}


inline fint incoming_arg_index(Location r) {
  return  isIArgRegister(r) ? arg_index_for_IArgRegister(r) : arg_index_for_IArgStackLocation(r);
}


// 0 = first arg
inline Location ArgLocation(fint i) {
  return i < NumArgRegisters ? ArgRegister(i) : ArgStackLocation(i);
}


inline bool isStackRegister(Location r) { return r >= StackLocations; }

inline bool is_StackLocation(Location r) { return r >= StackLocations; }
inline fint index_for_StackLocation(Location r) { return r - StackLocations; }
inline Location StackLocation_for_index(fint i) { return Location(StackLocations + i); }

  

// used for NIC to pick local registers
//  also prim failure code on sparc, literals (pickStackLoc)
//  and expression stack

// Also used for pickPermanent (NIC):
//  self in a block, blocks (later zapped), materialized expr stacks

const RegisterString LocalMask =
  // omit R31 because it is used for receiver
                  nthBit(R30) | nthBit(R29) | nthBit(R28) 
  | nthBit(R27) | nthBit(R26) | nthBit(R25) | nthBit(R24) 
  | nthBit(R23) | nthBit(R22) | nthBit(R21) | nthBit(R20) 
  | nthBit(R19) | nthBit(R18) | nthBit(R17) | nthBit(R16)
  | nthBit(LowestLocalNonVolReg);
  
// do not zap these registers even if not live!
const RegisterString GloballyAllocatedMask    = nthBit(R0) | nthBit(SP) | nthBit(RTOC) | nthBit(ByteMapBaseReg); 

# ifdef SIC_COMPILER
  const fint NumTempRegs = 8; // regs that can be used within BB's
                              // but do not survive calls
  extern Location TempRegs[];
  extern fint RegToTempNo[]; // inverse of TempRegs[]

  inline bool isTempReg(Location r) {
    return isRegister(r) && RegToTempNo[r] >= 0;
  }

  const RegisterString AllTrashedMask =
    nthBit(R0)  | nthBit(SP)  | nthBit(RTOC) | nthBit(R3)  |
    nthBit(R4)  | nthBit(R5)  | nthBit(R6)   | nthBit(R7)  |
    nthBit(R8)  | nthBit(R9)  | nthBit(R10)  | nthBit(R11) |
    nthBit(R12) | nthBit(R13) | nthBit(R14);

  const fint NumCalleeSavedRegs = 17;
  extern Location CalleeSavedRegs[];
  
  inline bool isInitializedInFillValues(Location loc) {
    fatal("unimplemented for PPC");
    return false;
  }


# endif


# endif
# endif // __ppc__
