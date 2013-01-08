/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "regs.hh"
# include "_regs.cpp.incl"


void printLocation(Location l) {
  lprintf("%s", locationName(l));
}


Location LocationOfSavedOutgoingArgInSendee(fint argNo /* -1 for rcvr*/) {
  return argNo < 0  ?  IReceiverReg  :  IArgLocation(argNo);
}
