# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "fcompiler_ppc.hh"
# include "_fcompiler_ppc.cpp.incl"

# ifdef FAST_COMPILER
 
fint   FCompiler::max_no_of_outgoing_args_and_rcvr() {
  return codeGen->max_no_of_outgoing_args_and_rcvr();
}


fint   FCompiler::number_of_saved_nonvolatile_registers() {
  return codeGen->number_of_saved_nonvolatile_registers();
}


fint   FCompiler::number_of_memory_locals() {
  return codeGen->number_of_memory_locals();
}


bool FCompiler::are_register_arguments_saved_on_stack() {
  return codeGen->need_to_save_args_on_stack();
}


# endif // FAST_COMPILER
# endif // TARGET_ARCH == PPC_ARCH
