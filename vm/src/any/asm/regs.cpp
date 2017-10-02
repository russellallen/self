/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "allocation.hh"
# include "process.hh"
# include "regs.hh"


void printLocation(Location l) {
  lprintf("%s", locationName(l));
}


Location LocationOfSavedOutgoingArgInSendee(fint argNo /* -1 for rcvr*/) {
  return argNo < 0  ?  IReceiverReg  :  IArgLocation(argNo);
}
