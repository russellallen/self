# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */
  
# pragma implementation "regs_i386.hh"
  
# include "_regs_i386.cpp.incl"

const char** RegisterNamesBySize[] = {ByteRegisterNames, ShortRegisterNames, RegisterNames};

// change Location enum in regs_ppc.h if you change this!
const char* RegisterNames[] = {
    "%eax", "%ecx", "%edx", "%ebx", "%esp", "%ebp", "%esi", "%edi",
    "",
    
    "*UnAllocated*"
};
const char* ByteRegisterNames[] = {
    "%al", "%cl", "%dl", "%bl", "%ah", "%ch", "%dh", "%bh",
    "",
    
    "*UnAllocated*"
};
const char* ShortRegisterNames[] = {
    "%ax", "%cx", "%dx", "%bx", "%sp", "%bp", "%si", "%di",
    "",
    
    "*UnAllocated*"
};
    
    



const char *locationName(Location l) {
  const char* c;
  int num;
  
       if          ( is_IArgLocation(l)) {   c = "I";  num = index_for_IArgLocation(l); }
  else if          ( is_LArgLocation(l)) {   c = "L";  num = index_for_LArgLocation(l); }
  else if          ( is_ArgLocation(l)) {    c = "";   num = index_for_ArgLocation(l); }
  else if          ( is_StackLocation(l)) { c = "S";  num = index_for_StackLocation(l); }
  else if          ( l == IReceiverReg ) { c = "I"; num = -1; }
  else if          ( l == LReceiverReg ) { c = "L"; num = -1; }
  else if          ( l == ReceiverReg ) { c = "R"; num = -1; }
  else {
    assert(isRegister(l), "");
    return RegisterNames[l];
  }
  char* s= new char [30]; // known leak NEW_RESOURCE_ARRAY(char, 30);
  sprintf(s, "%s%ld", c, long(num));
  return s;
}
    

# if defined(SIC_COMPILER)
  Location TempRegs[] = { eax, edx, esi, edi };
    
# define X(arg) -99999999     /* to make the following table look nicer */
  fint RegToTempNo[/* indexed by Location */] = {
    0, X("ecx"), 1, X("ebx"), X("esp"), X("ebp"), 2, 3 
  };

  Location CalleeSavedRegs[] = {
  };

  void regs_i386_init() {
    // The SIC uses Temp1 and Temp2 during code generation, that's why they
    // aren't listed as general temp regs above.
    assert(Temp1 == ebx && Temp2 == ecx, "change this");
    for (fint i = 0; i < NumTempRegs; i++) {
      assert(TempRegs[i] != Temp1 && TempRegs[i] != Temp2,
             "Temp1 and Temp2 are reserved for the code generator");
      assert(RegToTempNo[TempRegs[i]] == i, "wrong RegToTempNo entry");
    }
  }

# else

void regs_i386_init() {}

# endif
# endif // TARGET_ARCH == I386_ARCH
