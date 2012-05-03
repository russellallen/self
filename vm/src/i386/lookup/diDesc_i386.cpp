# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "diDesc_i386.hh"
# include "_diDesc_i386.cpp.incl"

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

pc_t DIDesc::jump_addr() {
  return (pc_t)get_target_of_Self_call_site((inst_t*)jump_addr_addr());
}


void DIDesc::set_jump_addr(pc_t insts) {
  pc_t* addr = jump_addr_addr();
  set_target_of_Self_call_site((inst_t*)addr, insts);
}
  
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // TARGET_ARCH == I386_ARCH
