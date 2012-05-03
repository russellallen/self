/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "sendDesc_sparc.hh"
# include "_sendDesc_sparc.cpp.incl"

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

void sendDesc::init_platform() {}


char* sendDesc::jump_addr() {
 int32* c = (int32*)jump_addr_addr();
 return (char*) getCallImm(c);
}

void sendDesc::set_jump_addr(char* t) {
  char** jaa = jump_addr_addr();
  setCallImm((int32*)jaa, int32(t));
}


void printMask(RegisterString mask) {
  RegisterString regs = mask << L0;
  printAllocated(regs);
  lprintf("+{");
  bool first = true;
  unsigned r = unsigned(mask) >> (NumInRegisters + NumLocalRegisters);
  for (fint d = 0; r; d++, r >>= 1) {
    if (isSet(r, 0)) {
      if (first) {
        first = false;
      } else {
        lprintf(",");
      }
      lprintf("T%ld", long(d));
      Location d1 = Location(d);
      while(isSet(r, 0)) { d ++, r >>= 1; }
      if (d - 1 > d1) lprintf("-T%ld", long(d - 1));
    }
  }
  lprintf("}");
}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
