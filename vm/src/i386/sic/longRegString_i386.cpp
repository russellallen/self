# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# include "abstract_interpreter_inline.hh"
# include "bitVector.hh"
# include "label_inline.hh"
# include "longRegString.hh"
# include "sic.hh"


# ifdef SIC_COMPILER


void LongRegisterString::allocate(Location l) {
  doAllocate(l);
}


# endif // SIC_COMPILER
# endif // TARGET_ARCH == I386_ARCH
