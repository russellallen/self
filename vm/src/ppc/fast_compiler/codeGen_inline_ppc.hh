#pragma once
# ifdef __ppc__
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# if   !GENERATE_DEBUGGING_AIDS


# endif


# if defined(FAST_COMPILER)

  inline void CodeGen::jumpTo(void* target, Location reg, Location link = UnAllocated ) {
    a.branch_to((pc_t)target, PVMAddressOperand, reg, link == LinkRegister); 
  }

  inline void CodeGen::move(Location dest, Location src, bool set_cc) {
    // dest may be R0
    if (src == dest) {
      if (set_cc) {
        if (isRegister(src))
          a.cmpwi(src, 0, NumberOperand);
        else
          move(Temp1, src, true);
      }
    }
    else if (isRegister(dest) && isRegister(src))
      if (set_cc) a.mr_(dest, src);
      else        a.mr(dest, src);
    else {
      moveComplicated(dest, src, set_cc);
    }
  }

  inline Location CodeGen::moveToReg(Location what, Location reg, bool set_cc) {
    // reg may be R0
    Location t;
    if (isRegister(what)) {
      t = what;
      if (set_cc)
        a.cmpwi(t, 0, NumberOperand);
    } else {
      t = reg;
      move(t, what, set_cc);
    }
    return t;
  }
  

# endif // FAST_COMPILER

# endif // __ppc__
