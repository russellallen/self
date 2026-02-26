# if  TARGET_ARCH == I386_ARCH || TARGET_ARCH == X86_64_ARCH
/* Sun-$Revision: 1.3 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "stubs_amd64.hh"
# include "_stubs_amd64.cpp.incl"

# pragma warn_unusedarg off


// asm routines (only needed for SIC:)



extern "C" {
  oop UncommonBranch(...) { fatal("unimp intel");  return NULL; }
  // Note: do not have a stack frame yet; link is link of caller
  // Also, they must preserve Temp1 and Temp2
  }

// Only needed for interpreter/compiler interoperation:
extern "C" {  oop ReturnResult_stub(...) { fatal("unimp intel");  return NULL; } }
oop ReturnResult_stub_result;

# endif // TARGET_ARCH == I386_ARCH
