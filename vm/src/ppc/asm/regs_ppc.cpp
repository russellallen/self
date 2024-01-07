# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */
  
# pragma implementation "regs_ppc.hh"
  
# include "_regs_ppc.cpp.incl"


// change Location enum in regs_ppc.h if you change this!
const char *RegisterNames[] = {
    "r0",  "sp",  "rtoc", "r3",   "r4",  "r5",  "r6",  "r7",
    "r8",  "r9",  "r10",  "r11",  "r12", "r13", "r14", "r15",
    "r16", "r17", "r18",  "r19",  "r20", "r21", "r22", "r23",
    "r24", "r25", "r26",  "r27",  "r28", "r29", "r30", "r31",
    
    "*UnAllocated*"
};
    
const char * const StackArgRegisterNames[] = {
  "A0", "A1", "A2", "A3", "A4", "A5", "A6", "A7", 
  "A8", "A9", "A10", "A11", "A12", "A13", "A14", "A15"
};

const char * const StackIArgRegisterNames[] = {
  "I0", "I1", "I2", "I3", "I4", "I5", "I6", "I7", 
  "I8", "I9", "I10", "I11", "I12", "I13", "I14", "I15"
};
    
const char * const StackLocationNames[] = {
  "S0", "S1", "S2", "S3", "S4", "S5", "S6", "S7", 
  "S8", "S9", "S10", "S11", "S12", "S13", "S14", "S15"
};
    
Location ArgRegisters[] = {
    Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7,
    IllegalLocation
};

Location IArgRegisters[] = {
    R30, R29, R28, R27, R26, R25, R24, R23,
    IllegalLocation
};

  
static const char* locationNameHelper(Location base, int num) {
  char c;
  const char * const *tbl;
  switch (base) {
    case  ArgStackLocations:     tbl=   StackArgRegisterNames;  c= 'A';  break;
    case IArgStackLocations:     tbl=  StackIArgRegisterNames;  c= 'I';  break;
    case     StackLocations:     tbl=      StackLocationNames;  c= 'S';  break;
    default: ShouldNotReachHere();
  }
  if (num < sizeof(StackArgRegisterNames)/sizeof(StackArgRegisterNames[0])) {
    return tbl[num];
  }
  char* s= new char [30]; // known leak NEW_RESOURCE_ARRAY(char, 30);
  sprintf(s, "%c%ld",c, long(num));
  return s;
}

const char *locationName(Location l) {
  Location base;
  int num;
  
  if          ( is_IArgStackLocation(l)) { base = IArgStackLocations;  num= l - base; }
  else if     (  is_ArgStackLocation(l)) { base =  ArgStackLocations;  num= l - base; }
  else if     (     is_StackLocation(l)) { base =     StackLocations;  num= l - base; }
  else if     ( l == PerformSelectorLoc) { return "(perform selector)" ; }
  else if     (l == PerformDelegateeLoc) { return "(perform delegatee)"; }
  else {
    assert(isRegister(l), "");
    return RegisterNames[l];
  }
  return locationNameHelper(base, num);
}
    

# if defined(SIC_COMPILER)
  Location TempRegs[] = { R3, R4, R5, R6, R7, R8, R9, R10 };
    
# define X(arg) -99999999     /* to make the following table look nicer */
    
  fint RegToTempNo[/* indexed by Location */] = {
    X("R0"), X("SP"), X("RTOC"), 0, 1, 2, 3, 4,
    5, 6, 7, X("R11"), X("R12"), X("R13"), X("R14"), X("R15"),
    X("R16"), X("R17"), X("R18"), X("R19"), X("R20"), X("R21"), X("R22"), X("R23"),
    X("R24"), X("R25"), X("R26"), X("R27"), X("R28"), X("R29"), X("R30"), X("R31")
  };

  Location CalleeSavedRegs[] = {
    R31, R30, R29, R28, R27, R26, R25, R24, R23,
    R22, R21, R20, R19, R18, R17, R16, LowestLocalNonVolReg
  };

  void regs_ppc_init() {
    // The SIC uses r11 and r12 during code generation, that's why they
    // aren't listed as general temp regs above.
    assert(Temp1 == R11 && Temp2 == R12, "change this");
    for (fint i = 0; i < NumTempRegs; i++) {
      assert(TempRegs[i] != R11 && TempRegs[i] != R12,
             "R11 and R12 are reserved for the code generator");
      assert(RegToTempNo[TempRegs[i]] == i, "wrong RegToTempNo entry");
    }
  }


# else

void regs_ppc_init() {}

# endif
# endif // TARGET_ARCH == PPC_ARCH
