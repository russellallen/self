# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# include "abstract_interpreter_inline.hh"
# include "bitVector.hh"
# include "label_inline.hh"
# include "longRegString.hh"
# include "sic.hh"


# ifdef SIC_COMPILER


void LongRegisterString::allocate(Location l) {
  theSIC->update_number_of_saved_nonvolatile_registers_for(l);
  doAllocate(l);
}


# endif // SIC_COMPILER
# endif // TARGET_ARCH == PPC_ARCH
