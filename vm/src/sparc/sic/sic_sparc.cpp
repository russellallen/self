/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# pragma implementation "sic_sparc.hh"
# include "_sic_sparc.cpp.incl"


# ifdef SIC_COMPILER
 
// On SPARC, can save registers in their usual window-flush place.
// So, don't have to keep uplevel-read pregs in memory,
// can put them in registers and flush them to memory when
// needed. -- dmu 12/02
bool SICAllocator::keepUplevelRPRegsInMemory = false; 

void SICompiler::initializeForPlatform() { }


int32 SICompiler::stackTempCount() {
  return stackLocCount + nonRegisterArgCount();
}


void SICompiler::check_flushability(PReg*) {}
void SICompiler::cope_with_uplevel_access_to(PReg*) {}


# endif // SIC_COMPILER
