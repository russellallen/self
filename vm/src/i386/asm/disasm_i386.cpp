# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "disasm_i386.hh"

# include "_disasm_i386.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


void print_code(nmethod* /*nm*/, CORE_ADDR start, CORE_ADDR end) {
  warning2("unimp intel (no disasm) start = 0x%x, end = 0x%x", start, end);   
}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // TARGET_ARCH == I386_ARCH
