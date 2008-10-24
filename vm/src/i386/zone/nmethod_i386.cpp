# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation  "nmethod_i386.hh"

# include "_nmethod_i386.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

void nmethod::get_platform_specific_data(AbstractCompiler* c) {
  _number_of_memory_locals               = c->number_of_memory_locals();
}

void nmethod::print_platform_specific_data() {
  ++Indent;
  lprintf( "number_of_memory_locals               = %d\n", number_of_memory_locals() );
  --Indent;
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // TARGET_ARCH == I386_ARCH
