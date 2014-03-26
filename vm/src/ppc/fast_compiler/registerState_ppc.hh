#pragma once
# ifdef __ppc__
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */



# ifdef FAST_COMPILER

public:
 fint number_of_saved_nonvolatile_registers() { return _number_of_saved_nonvolatile_registers; }
 
private:
 fint _number_of_saved_nonvolatile_registers;

# endif // FAST_COMPILER
# endif // __ppc__
