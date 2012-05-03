# ifdef __i386__
/* Sun-$Revision: 1.6 $ */

/* Copyright 1992-2012 AUTHORS.x
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// CAVEAT: the info here is redundantly contained in other files, including
// i386.format.h !!!!


# if  TARGET_ARCH == I386_ARCH

  const      fint NumRegisters = 8; 
  const      fint NumArgRegisters = 0; 
  const      fint NumRcvrAndArgRegisters = 0;
  const      fint NumIArgRegisters = 0;
  const      fint NumRegistersInMask = 0; 

  extern const char* ByteRegisterNames[];
  extern const char* ShortRegisterNames[];
  
  enum RegSize { byte_reg, short_reg, long_reg };
  
  extern const char** RegisterNamesBySize[];

  enum Location {
    // change RegisterNames[] and ByteRegisterNames[] if you change this enum!
    eax, ecx, edx, ebx, esp, ebp, esi, edi,
    ah = esp, ch = ebp, dh = esi, bh = edi, // for byte instructions
    al = eax, cl = ecx, dl = edx, bl = ebx, // for byte instructions
    ax = eax, dx = edx, bx = ebx, sp = esp, bp = ebp, si = esi, di = edi, // 16-bits
    no_reg, 
    
    SP = esp, NoReg = no_reg,

    UnAllocated = -10, // unused or not yet allocated, needs to be unique
    // Temp, survives calls, reg or stack
         
    PerformSelectorLoc = esi,
    PerformDelegateeLoc = edi,

    StackLocations = 100, // used to represent expr stack locations and locals
    EndStackLocations = 9999,

    ReceiverReg     = 10000, // not a reg at all!
    ArgLocations    = 10001, // outgoing args on the stack
    EndArgLocations = 19999,
    
    // where post-frame-creation incoming args are stored:
    IReceiverReg       = 20000,
    IArgLocations      = 20001, // incoming args on stack (in caller's frame)
    EndIArgLocations   = 29999,

    // for Leaf methods
    LReceiverReg       = 30000,
    LArgLocations      = 30001,
    EndLArgLocations   = 39999,    

    IllegalLocation = -1,
    
    ResultReg = eax,
    
    // Warning: Temp1, Temp2, Lowest/HighestNonVolReg are duplicated in asmDefs_i386.hh
    Temp1 = ebx,
    Temp2 = ecx,
#   ifdef SIC_COMPILER
    // additional temp, but must be reserved.  on SIC, we do this through the
    // markAllocated function.  See AbstractArrayAtNode::markAllocated (either on
    // SPARC or PPC).  When markAllocated changes the use/def count of the temp register,
    // it won't be used in the temporary register allocation.  -mabdelmalek 12/02
    //
    // Also need to define canCopyPropagateFrom, as in node_ppc.cpp -- dmu 1/03
    Temp3 = eax,
    Temp4 = edx,
#   endif


      
    CResultReg   = ResultReg,
    
    FrameReg = ebp,

    // for di lookups: these must be distinct and not arg regs
    DICountReg         = Temp1,
    DIInlineCacheReg   = Temp2,

    // while doing an NLR, store important "return values" in registers
    // Duplicated in asmDefs_i386.h, these must not overlap Temp[12]
    // ReturnTrap depends on the exact binding of these:
    // Home and Result must not coincide with Temp1 because of zapBlock
     
    NLRHomeIDReg    =     ecx,
    NLRHomeReg      =     edx,
    NLRResultReg    =     eax,
    NLRTempReg      =     ebx,
    
    ByteMapBaseReg  =  no_reg,  // doesn't seem worthwhile on Intel
    
      LowestNonVolReg =   0,
     HighestNonVolReg = - 1,
 LowestLocalNonVolReg = 0,
 };
  

    
inline bool  is_IArgLocation(Location r) { return  IArgLocations <= r  &&  r <   EndIArgLocations; }
inline bool  is_LArgLocation(Location r) { return  LArgLocations <= r  &&  r <   EndLArgLocations; }
inline bool   is_ArgLocation(Location r) { return   ArgLocations <= r  &&  r <    EndArgLocations; }
inline bool is_StackLocation(Location r) { return StackLocations <= r  &&  r <  EndStackLocations; }


inline bool isRegister(Location r) { return  eax <= r  &&  r <= edi; }
inline bool isStackRegister(Location r) {return is_StackLocation(r); }



// 0 = first arg, -1 = rcvr
inline Location  IArgLocation(fint i)  {  return Location(  IArgLocations + i); }
inline Location  LArgLocation(fint i)  {  return Location(  LArgLocations + i); }
inline Location   ArgLocation(fint i)  {  return Location(   ArgLocations + i); }
inline Location StackLocation_for_index(fint i)  {  return Location( StackLocations + i); }

inline fint index_for_IArgLocation( Location x) { return x - IArgLocations; }
inline fint index_for_LArgLocation( Location x) { return x - LArgLocations; }
inline fint index_for_ArgLocation(  Location x) { return x - ArgLocations; }
inline fint index_for_StackLocation(Location x) { return x - StackLocations; }

  
const RegisterString GloballyAllocatedMask = 0;
const RegisterString LocalMask = 0;
  


# ifdef SIC_COMPILER
  const fint NumTempRegs = 4; // regs that can be used within BB's
                              // but do not survive calls
  extern Location TempRegs[];
  extern fint RegToTempNo[]; // inverse of TempRegs[]

  inline bool isTempReg(Location r) {
    return isRegister(r) && RegToTempNo[r] >= 0;
  }

  const RegisterString AllTrashedMask =
    nthBit(eax)  | nthBit(ebx)  | nthBit(ecx) | nthBit(edx)  |
    nthBit(esp)  | nthBit(ebp)  | nthBit(esi) | nthBit(edi);


  const fint NumCalleeSavedRegs = 0;
  extern Location CalleeSavedRegs[];
  
  inline bool isInitializedInFillValues(Location loc) {
    fatal("unimplemented for PPC");
    return false;
  }
  
  inline bool isArgRegister(Location) { return false; }


# endif





# endif
# endif // __i386__
