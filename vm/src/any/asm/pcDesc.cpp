/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "pcDesc.hh"
# include "_pcDesc.cpp.incl"

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
