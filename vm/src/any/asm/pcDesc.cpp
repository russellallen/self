/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "label_inline.hh"
# include "nmethod_inline.hh"
# include "pcDesc.hh"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


void PcDesc::print(nmethod* c) {
  printIndent();
  lprintf("PcDesc 0x%lx: pc: 0x%lx; scope: %5ld; byte code: %ld\n",
         this,
         c->insts() + pc, scope, byteCode);
}

bool PcDesc::verify(nmethod* c) {
  Unused(c);
  return true;
}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
