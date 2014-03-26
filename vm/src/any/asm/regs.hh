#pragma once
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "bits.hh"
# include "top.hh"
# include "types.hh"




# if defined(__ppc__)
# include "regs_ppc.hh"
# elif defined(__i386__)
# include "regs_i386.hh"
# else
# include "regs_sparc.hh"
# endif


extern "C" {                            // extern "C" for easier debugging
  void printLocation(Location l);
  const char* locationName(Location l);       // what printLocation prints
}




// machine-specific implementations:

extern const char* RegisterNames[];

// WARNING: duplicated in asmDefs_ppc.h
const fint NumNonVolRegisters       = HighestNonVolReg - LowestNonVolReg      + 1;
const fint NumLocalNonVolRegisters  = HighestNonVolReg - LowestLocalNonVolReg + 1;
const fint NumGlobalNonVolRegisters = LowestLocalNonVolReg - LowestNonVolReg;

inline bool isGloballyAllocatedRegister(Location r) {
  return isSet(GloballyAllocatedMask, r);
}

# ifdef SIC_COMPILER
inline bool isTrashedReg(Location r) { // true if r is trashed by calls
  return isRegister(r) && isSet(AllTrashedMask, r);
}
# endif

Location LocationOfSavedOutgoingArgInSendee(fint argNo /* -1 for rcvr*/);
