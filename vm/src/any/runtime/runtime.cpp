/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "runtime.hh"

// This file holds C-level things that some platforms put in
//  their runtime_foo.s 's.


// Well, all platforms need this here.
// It is used by asm glue for trap handling
char* continuePC;


// a routine that assembly glue can call if a process returns off the top

extern "C" void ReturnOffTopOfProcess() {
  fatal("Self process returned past top");
}

