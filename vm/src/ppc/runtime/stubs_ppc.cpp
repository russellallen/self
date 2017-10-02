# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# include "generation_inline.hh"
# include "oop_inline.hh"
# include "space_inline.hh"

# pragma warn_unusedarg off


// asm routines (only needed for SIC:)

extern "C" {
  oop UncommonBranch(...) { fatal("unimp mac");  return NULL; }
  // Note: do not have a stack frame yet; link is link of caller
  // Also, they must preserve Temp1 and Temp2
  }

// Only needed for interpreter/compiler interoperation:
extern "C" {  oop ReturnResult_stub(...) { fatal("unimp mac");  return NULL; } }
oop ReturnResult_stub_result;

# endif // TARGET_ARCH == PPC_ARCH
