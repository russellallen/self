/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
  
# pragma implementation "regs_sparc.hh"

# include "_regs_sparc.cpp.incl"


Location IArgRegisters[] = {
  IArg1, IArg2, IArg3, IArg4, IArg5,
  IllegalLocation
  };

Location ArgRegisters[] = {
  Arg1, Arg2, Arg3, Arg4, Arg5,
  IllegalLocation
  };

Location CArgRegisters[] = {
  O1, O2, O3, O4, O5,
  IllegalLocation
  };

Location AnyRegisters[] = {
  G1, G2, G3, G4, G5,
  O0, O1, O2, O3, O4, O5,
  I0, I1, I2, I3, I4, I5,
  L0, L1, L2, L3, L4, L5, L6, L7,
  IllegalLocation
  };

Location NoFrameAnyRegisters[] = {
  G1, G2, G3, G4, G5,
  I0, I1, I2, I3, I4, I5,
  IllegalLocation
  };

Location CallKilledRegisters[] = {
  G1, G2, G3, G4, G5,
  O0, O1, O2, O3, O4, O5,
  IllegalLocation  
  };

Location NoFrameKilledRegisters[] = {
  O0, O1, O2, O3, O4, O5,
  L0, L1, L2, L3, L4, L5, L6, L7,
  IllegalLocation
  };

Location MoveKilledRegisters[] = {
  ReservedAnyRegister1,
  IllegalLocation
  };

Location RegisterFromStack[] = {
  I7, I6, I5, I4, I3, I2, I1, I0,
  L7, L6, L5, L4, L3, L2, L1, L0
  };

fint StackFromRegister[] = {
  // G0 - G7
  IllegalLocation, IllegalLocation, IllegalLocation, IllegalLocation,
  IllegalLocation, IllegalLocation, IllegalLocation, IllegalLocation,
  // O0 - O7
  IllegalLocation, IllegalLocation, IllegalLocation, IllegalLocation,
  IllegalLocation, IllegalLocation, IllegalLocation, IllegalLocation,
  15, 14, 13, 12, 11, 10, 9, 8,       // L0 - L7
  7, 6, 5, 4, 3, 2, 1, 0              // I0 - I7
  };

Location IRegisterFromORegister[] = {
  // G0 - G7
  IllegalLocation, IllegalLocation, IllegalLocation, IllegalLocation,
  IllegalLocation, IllegalLocation, IllegalLocation, IllegalLocation,
  // O0 - O7
  I0, I1, I2, I3, I4, I5, I6, I7,
  // L0 - L7
  IllegalLocation, IllegalLocation, IllegalLocation, IllegalLocation,
  IllegalLocation, IllegalLocation, IllegalLocation, IllegalLocation,
  // I0 - I7
  IllegalLocation, IllegalLocation, IllegalLocation, IllegalLocation,
  IllegalLocation, IllegalLocation, IllegalLocation, IllegalLocation
  };

const char* RegisterNames[] = {
  "g0", "g1", "g2", "g3", "g4", "g5", "g6", "g7",
  "o0", "o1", "o2", "o3", "o4", "o5", "sp", "o7",
  "l0", "l1", "l2", "l3", "l4", "l5", "l6", "l7",
  "i0", "i1", "i2", "i3", "i4", "i5", "fp", "i7",
  "*UnAllocated*", "*Temp*", "*StackTemp*",
  "*AnyLocation*", "*AnyRegister*"
};

static const int staticNames = 16;
  
const char* StackRegisterNames[staticNames] = {
  "T0", "T1", "T2", "T3", "T4", "T5", "T6", "T7", 
  "T8", "T9", "T10", "T11", "T12", "T13", "T14", "T15"
};

const char* ExtraArgRegisterNames[staticNames] = {
  "E0", "E1", "E2", "E3", "E4", "E5", "E6", "E7", 
  "E8", "E9", "E10", "E11", "E12", "E13", "E14", "E15"
};
const char *ExtraIArgRegisterNames[staticNames] = {
  "I0", "I1", "I2", "I3", "I4", "I5", "I6", "I7",
  "I8", "I9", "I10", "I11", "I12", "I13", "I14", "I15"
};

fint NoFrameRegisterNumbers[] = {
  0, 1, 2, 3, 4, 5, 6, 7,
  IllegalLocation, IllegalLocation, IllegalLocation, IllegalLocation,
  IllegalLocation, IllegalLocation, IllegalLocation, IllegalLocation,
  IllegalLocation, IllegalLocation, IllegalLocation, IllegalLocation,
  IllegalLocation, IllegalLocation, IllegalLocation, IllegalLocation,
  8, 9, 10, 11, 12, 13, 14, 15
};
  
static const char* locationNameHelper(Location base, int num) {
  if (num  <  staticNames) {
    const char **tbl;
    switch (base) {
      case StackLocations:     tbl=     StackRegisterNames; break;
      case ExtraArgLocations:  tbl=  ExtraArgRegisterNames; break;
      # if TARGET_ARCH != PPC_ARCH // same for ppc
      case ExtraIArgLocations: tbl= ExtraIArgRegisterNames; break;
      # endif
      default: ShouldNotReachHere();
    }
    return tbl[num];
  } else {
    char* s= new char [30]; // known leak NEW_RESOURCE_ARRAY(char, 30);
    sprintf(s, "%c%ld",
              base==StackLocations     ? 'T'
            : base==ExtraArgLocations  ? 'E'
            : base==ExtraIArgLocations ? 'I'
            : 0, // shouldn't get to this
            long(num));
    return s;
  }
}

const char *locationName(Location l) {
  Location base;
  int num;
  if          (isStackRegister(l)) { base= StackLocations;     num= l - base; }
  else if  (isExtraArgRegister(l)) { base= ExtraArgLocations;  num= base - l; }
  else if (isExtraIArgRegister(l)) { base= ExtraIArgLocations; num= base - l; }
  else {
    assert(isRegister(l) || l == AnyLocation || l == AnyRegister ||
           l == UnAllocated || l == Temp || l == StackTemp ||
           l == DataRegister || l == AddressRegister, "unexpected location");
    return RegisterNames[l];
  }
  return locationNameHelper(base, num);
}


# if defined(SIC_COMPILER)
    Location TempRegs[] = { G1, G2, O0, O1, O2, O3, O4, O5 };
    
#   define X(arg) -99999999     /* to make the following table look nicer */
    
    fint RegToTempNo[/* indexed by Location */] = {
      X("g0"),       0,       1, X("g3"), X("g4"), X("g5"), X("g6"), X("g7"),
            2,       3,       4,       5,       6,       7, X("sp"), X("o7"),
      X("l0"), X("l1"), X("l2"), X("l3"), X("l4"), X("l5"), X("l6"), X("l7"),
      X("i0"), X("i1"), X("i2"), X("i3"), X("i4"), X("i5"), X("fp"), X("i7")
    };

    Location CalleeSavedRegs[] = {
      I0, I1, I2, I3, I4, I5,
      L0, L1, L2, L3, L4, L5, L6, L7
    };

    void regs_sparc_init() {
      // The SIC uses g3-g5 during code generation, that's why they
      // aren't listed as general temp regs above.
      assert(Temp1 == G5 && Temp2 == G4 && Temp3 == G3, "change this");
      for (fint i = 0; i < NumTempRegs; i++) {
        assert(TempRegs[i] != G5 && TempRegs[i] != G4 && TempRegs[i] != G3,
               "G3-G5 are reserved for the code generator");
        assert(RegToTempNo[TempRegs[i]] == i, "wrong RegToTempNo entry");
      }
    } 
    

# else // defined(SIC_COMPILER)
    void regs_sparc_init() {}
# endif
  

