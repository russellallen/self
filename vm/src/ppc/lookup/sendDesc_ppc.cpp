# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "sendDesc_ppc.hh"
# include "_sendDesc_ppc.cpp.incl"

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)


void sendDesc::init_platform() {}


char* sendDesc::jump_addr() {
  int32* c = (int32*)jump_addr_addr();
  return get_target_of_Self_call_site(c);
}

void sendDesc::set_jump_addr(char* t) {
  char** jaa = jump_addr_addr();
  set_target_of_Self_call_site((int32*)jaa, (void*)t);
}


void printMask(RegisterString mask) {
  RegisterString regs = mask << R0;
  printAllocated(regs);
  lprintf("+{");
  // r will always be zero, only have registers in mask right now -- dmu 7/1
  // uint32 r = uint32(mask) >> NumRegistersInMask;
  // bool first = true;
  // for (fint d = 0; r; d++, r >>= 1) {
  //   if (isSet(r, 0)) {
  //     if (first) {
  //       first = false;
  //     } else {
  //       lprintf(",");
  //     }
  //     lprintf("T%ld", long(d));
  //     Location d1 = Location(d);
  //     while(isSet(r, 0)) { d ++, r >>= 1; }
  //     if (d - 1 > d1) lprintf("-T%ld", long(d - 1));
  //   }
  // }
  lprintf("}");
}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // TARGET_ARCH == PPC_ARCH
