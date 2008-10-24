/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "diDesc_sparc.hh"
# include "_diDesc_sparc.cpp.incl"

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

pc_t DIDesc::jump_addr() {
  return (pc_t) getJumpImm((int32*)jump_addr_addr());
}


void DIDesc::set_jump_addr(pc_t insts) {
  pc_t* addr = jump_addr_addr();
  setJumpImm((int32*) addr, int32(insts));
}
  
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
