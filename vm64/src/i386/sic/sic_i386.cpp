# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "sic_i386.hh"
# include "_sic_i386.cpp.incl"

# ifdef SIC_COMPILER


bool SICAllocator::keepUplevelRPRegsInMemory = true; 

void SICompiler::initializeForPlatform() {
  nlrLabel = NULL;
}


int32 SICompiler::stackTempCount() {
  return number_of_memory_locals()
       + max_no_of_outgoing_args_and_rcvr();
}



fint SICompiler::max_no_of_outgoing_args_and_rcvr() {
  return argCount + 1 /* for rcvr */;
}


fint SICompiler::number_of_memory_locals() {
  return stackLocCount;
}

void SICompiler::check_flushability(PReg* p) {
}

void SICompiler::cope_with_uplevel_access_to(PReg* pr) {
}



# endif // SIC_COMPILER
# endif // TARGET_ARCH == I386_ARCH
