# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "frame_format_ppc.hh"

# include "_frame_format_ppc.cpp.incl"


// return offset (in bytes) off of sp
int32 spOffset(Location loc,  fint frameSize, fint max_no_of_outgoing_args_and_rcvr) {
  int32 nWords;
  if (is_IArgStackLocation(loc)) {
    // incoming arguments are on my caller's stack frame, so add frameSize
    nWords = frameSize +
             rcvr_and_argument_offset(loc - IArgStackLocations + 1 /* rcvr */);
  }
  else if (is_ArgStackLocation(loc)) {
    nWords = rcvr_and_argument_offset(loc - ArgStackLocations + 1 /* rcvr */);
  }
  else if (is_StackLocation(loc)) {
    nWords = stackLocation_offset(index_for_StackLocation(loc), max_no_of_outgoing_args_and_rcvr);
  }
  else if (isIArgRegister(loc)) {
    nWords = frameSize + rcvr_and_argument_offset(IReceiverReg - loc);
  }
  else if (loc == PerformSelectorLoc)  return PerformSelectorLoc_sp_offset;
  else if (loc == PerformDelegateeLoc) return PerformDelegateeLoc_sp_offset;
  else
    fatal1("spOffset: don't know how to flush location %s\n", locationName(loc));

  return oopSize * nWords;
}
# endif // TARGET_ARCH == PPC_ARCH
