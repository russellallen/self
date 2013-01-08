# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "disasm_ppc.hh"

# include "_disasm_ppc.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


void print_code(nmethod* /*nm*/, CORE_ADDR /*start*/, CORE_ADDR /*end*/) {
  warning("unimp mac");   
}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // TARGET_ARCH == PPC_ARCH
