# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "fcompiler_i386.hh"
# include "_fcompiler_i386.cpp.incl"

# ifdef FAST_COMPILER
 

fint   FCompiler::number_of_memory_locals() {
  return codeGen->number_of_memory_locals();
}


# endif // FAST_COMPILER
# endif // TARGET_ARCH == I386_ARCH
