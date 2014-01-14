/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation  "nmethod_sparc.hh"

# include "_nmethod_sparc.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

void nmethod::get_platform_specific_data(AbstractCompiler* ) {}

void nmethod::print_platform_specific_data() {}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
