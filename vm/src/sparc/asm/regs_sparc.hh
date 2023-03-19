/* Sun-$Revision: 30.13 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// CAVEAT: the info here is redundantly contained in other files, including
// sun4.format.h !!!!

enum Location {
  // change RegisterNames[] if you change this enum!
  G0, G1, G2, G3, G4, G5, G6, G7,
  O0, O1, O2, O3, O4, O5, O6, O7,
  L0, L1, L2, L3, L4, L5, L6, L7,
  I0, I1, I2, I3, I4, I5, I6, I7,

  UnAllocated,        // unused or not yet allocated
  Temp,               // survives calls, reg or stack
  StackTemp,          // temp on stack

  AnyLocation,
  AnyRegister,
  DataRegister    = AnyRegister,
  AddressRegister = AnyRegister,
  
  StackLocations,

  ExtraIArgLocations = -10,
  ExtraArgLocations  = -1000,
  
  IllegalLocation = -1,

  IReceiverReg = I0,
  IResultReg   = IReceiverReg,
  IArg1 = I1,
  IArg2 = I2,
  IArg3 = I3,
  IArg4 = I4,
  IArg5 = I5,
  FP = I6,
  ReturnAddr = I7,
  
  ReceiverReg = O0,
  LReceiverReg = ReceiverReg, // same for leaf and outgoing
  ResultReg = ReceiverReg,
  Arg1 = O1,
  Arg2 = O2,
  Arg3 = O3,
  Arg4 = O4,
  Arg5 = O5,
  SP = O6,
  CalleeReturnAddr = O7,

  // SIC: Temp1..3 are scratch regs available to the code generator
  Temp1 = G5,
  Temp2 = G4,
  Temp3 = G3,
#   ifdef SIC_COMPILER
    // additional temp, but must be reserved.  on SIC, we do this through the
    // markAllocated function.  See AbstractArrayAtNode::markAllocated (either on
    // SPARC or PPC).  When markAllocated changes the use/def count of the temp register,
    // it won't be used in the temporary register allocation.  -mabdelmalek 12/02
    //
    // Also need to define canCopyPropagateFrom. See AbstractArrayAtNode::canCopyPropagateFrom
    //  -- dmu 1/03
    Temp4 = G2,
#   endif
  ByteMapBaseReg = G6,
  SPLimitReg = G7,
  
  ReservedAnyRegister1 = Temp1,
  ReservedAnyRegister2 = Temp2,
  ReservedAnyRegister3 = Temp3,
  ReservedDataRegister = Temp1,
  ReservedAddressRegister = Temp1,
  
   CReceiverReg      =  ReceiverReg,
  ICReceiverReg      = IReceiverReg,
   CResultReg        =  ResultReg,
  ICResultReg        = IResultReg,
  ExtraCArgLocations = ExtraArgLocations,
  
  FrameReg = SP,              // reg containing frame->block_scope_of_home_frame()

  NoReg = G0, // used as a temp data register in SIC

  
  // for recompiles
  RecompileLinkReg = G5,
  
  // for generating code for performs (regs on SPARC, not on other platforms)
    PerformSelectorLoc = G1,
   IPerformSelectorLoc = PerformSelectorLoc,
   PerformDelegateeLoc = G2,
  IPerformDelegateeLoc = PerformDelegateeLoc,
  
  // for grabbing perform info from the SendMessage frame
  nonvolatile_selector_for_performs = L0,

  
  // for di lookups
  DILinkReg          = G1,
  DICountReg         = G2,
  DIRecompileLinkReg = G3,
  
  // for non-local returns
  // warning: the NLR definitions are duplicated in sun4.asmDefs.h
  NLRResultReg = G1,
  NLRHomeReg   = G2,
  NLRHomeIDReg = G3,
  NLRTempReg   = G4,

  // not actually used on SPARC:
   LowestNonVolReg = IllegalLocation,
   LowestLocalNonVolReg = IllegalLocation,
  HighestNonVolReg = LowestNonVolReg - 1,
  };

inline bool isRegister(Location r) { return r >= G0 && r <= I7; }

const fint NumGlobalRegisters = 8;
const fint NumInRegisters = 8;
const fint NumLocalRegisters = 8;
const fint NumOutRegisters = 8;
const fint NumRegisters =
  NumGlobalRegisters + NumInRegisters + NumLocalRegisters + NumOutRegisters;

const fint NumArgRegisters = 5;
const fint NumRcvrAndArgRegisters = NumArgRegisters + 1;
const fint NumIArgRegisters = 5;
const fint NumCArgRegisters = 5;

inline bool isArgRegister(Location loc) {
  return O0 <= loc && loc <= O0 + NumArgRegisters; }
inline bool isIArgRegister(Location loc) {
  return I0 <= loc && loc <= I0 + NumIArgRegisters; }

const fint NumAnyRegisters = 24;
# define NumDataRegisters NumAnyRegisters
# define NumAddressRegisters NumAnyRegisters

extern Location ArgRegisters[];
extern Location IArgRegisters[];
extern Location CArgRegisters[];

// The next value includes the size of everthing that's required
//  by a basic SPARC (C) register window:
// 8 ins, 8 locals, + 6 for callee reg args + 1 for addr of aggr return
//  Since NumCArgRegisters is only 5, I guess we add 2! -- dmu

const fint WindowSize =
  NumInRegisters + NumLocalRegisters + NumCArgRegisters + 2;

extern Location AnyRegisters[];
extern Location NoFrameAnyRegisters[];
extern Location CallKilledRegisters[];
extern Location NoFrameKilledRegisters[];

# define DataRegisters AnyRegisters
# define AddressRegisters AnyRegisters

# define SmallCallKilledRegisters CallKilledRegisters
# define SendKilledRegisters CallKilledRegisters

extern Location RegisterFromStack[];
extern fint StackFromRegister[];
extern Location IRegisterFromORegister[];
extern const char* RegisterNames[];
extern fint NoFrameRegisterNumbers[];

const RegisterString LocalMask =
  nthBit(I0) | nthBit(I1) | nthBit(I2) | nthBit(I3) | nthBit(I4) | nthBit(I5) |
  nthBit(L0) | nthBit(L1) | nthBit(L2) | nthBit(L3) | nthBit(L4) | nthBit(L5) |
  nthBit(L6) | nthBit(L7);

const RegisterString GloballyAllocatedMask =
  nthBit(FP) | nthBit(SP) | nthBit(ReturnAddr) |
  nthBit(G0) |
  nthBit(G1) |
  nthBit(G2) |
  nthBit(G3) |
  nthBit(G4) |
  nthBit(G5) |
  nthBit(G6) |
  nthBit(G7);

# ifdef SIC_COMPILER
  const fint NumTempRegs = 8;         // regs that can be used within BBs
                                      // but do not survive calls
  extern Location TempRegs[];
  extern fint RegToTempNo[];          // inverse of TempRegs[]
  
  inline bool isTempReg(Location r) { // true if r is in TempRegs[]
    return isRegister(r) && RegToTempNo[r] >= 0;
  }

  const RegisterString AllTrashedMask =
     nthBit(O0) | nthBit(O1) | nthBit(O2) | nthBit(O3) | 
     nthBit(O4) | nthBit(O5) | nthBit(O6) | nthBit(O7) | 
                  nthBit(G1) | nthBit(G2) | nthBit(G3) | 
     nthBit(G4) | nthBit(G5) | nthBit(G6) | nthBit(G7);
  
  const fint NumCalleeSavedRegs = 14;
  extern Location CalleeSavedRegs[];

# endif

inline Location ArgLocation(fint i) {
  if (i < NumArgRegisters) {
    return ArgRegisters[i];
  } else {
    return Location(ExtraArgLocations - (i - NumArgRegisters));
  }
}

inline Location IArgLocation(fint i) {
  return  i < NumIArgRegisters 
            ?  IArgRegisters[i]
            :  Location(ExtraIArgLocations - (i - NumIArgRegisters));
}

inline fint arg_index_for_IArgRegister(Location x) {
  return x - IReceiverReg - 1;
}
  
inline bool isStackRegister(Location r) { return r >= StackLocations; }

inline bool isExtraArgRegister(Location r) { return r <= ExtraArgLocations; }

inline bool isExtraIArgRegister(Location r) {
return r <= ExtraIArgLocations && r > ExtraArgLocations; }

inline fint incoming_arg_index(Location r) {
  return  isIArgRegister(r)  ?  arg_index_for_IArgRegister(r)  :  ExtraIArgLocations - r + NumIArgRegisters;
}


extern const char *StackRegisterNames[];
extern const char *ExtraArgRegisterNames[];
extern const char *ExtraIArgRegisterNames[];



inline bool is_StackLocation(Location r) { return r >= StackLocations; }
inline fint index_for_StackLocation(Location r) { return r - StackLocations; }
inline Location StackLocation_for_index(fint i) { return Location(StackLocations + i); }

inline bool isInitializedInFillValues(Location loc) {
  return  O0 <= loc  &&  loc <= O7
      ||  G0 <= loc  &&  loc <= G7;
}

