# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.5 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "sendDesc_i386.hh"
# include "_sendDesc_i386.cpp.incl"

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

extern "C" { char *firstSelfFrame_nmlns; }; // for assertion checking

void sendDesc::init_platform() {
  assert( (int(firstSelfFrame_nmlns) & 0x3) == 0, "sendDesc alignment incorrect");
}

 
char* sendDesc::jump_addr() {
  inst_t* c = (inst_t*)jump_addr_addr();
  return get_target_of_Self_call_site(c);
}

void sendDesc::set_jump_addr(char* t) {
  inst_t* jaa = (inst_t*)jump_addr_addr();
  set_target_of_Self_call_site(jaa, (void*)t);
}


void printMask(RegisterString mask) {
  assert(mask == 0, "unused for Intel");
}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // TARGET_ARCH == I386_ARCH
