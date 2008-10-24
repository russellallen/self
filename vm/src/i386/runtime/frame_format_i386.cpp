# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "frame_format_i386.hh"

# include "_frame_format_i386.cpp.incl"



void reg_disp_type_of_loc(Location* basep, int32* offsetp, OperandType* tp, Location loc) {
  Location b = IllegalLocation;  int32 d = 0;  OperandType t = NumberOperand;
  
       if (isRegister(loc))  b = loc, d = 0, t = RegisterOperand;
       
  else if (loc == IReceiverReg  || is_IArgLocation(loc))  b = ebp,  d =  index_for_IArgLocation(loc) + 1 +     ircvr_offset;
  else if (loc == LReceiverReg  || is_LArgLocation(loc))  b = esp,  d =  index_for_LArgLocation(loc) + 1 + leaf_rcvr_offset;
  else if (loc ==  ReceiverReg  ||  is_ArgLocation(loc))  b = esp,  d =  index_for_ArgLocation(loc)  + 1 +   rcvr_offset;
  else if (                       is_StackLocation(loc))  b = ebp,  d = -index_for_StackLocation(loc) + first_local_offset;
  else fatal1("don't know how to do %s\n", locationName(loc));

  if (basep) *basep = b;
  if (offsetp) *offsetp = d * oopSize;
  if (tp) *tp = t;
}
# endif // TARGET_ARCH == I386_ARCH
