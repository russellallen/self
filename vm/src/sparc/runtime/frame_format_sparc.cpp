/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "frame_format_sparc.hh"

# include "_frame_format_sparc.cpp.incl"



# if  GENERATE_DEBUGGING_AIDS
int32 fpOffset(Location reg, fint frameSize) {
  // return offset (in bytes) off of fp
    if (isRegister(reg)) {
      assert((reg >= I0 && reg < I0 + NumInRegisters) ||
             (reg >= L0 && reg < L0 + NumLocalRegisters),
             "can't access this register");
      return ((first_register_offset - StackFromRegister[reg]) - frameSize)
             * oopSize;
    }
    return fpOffset_abstract(reg, frameSize);
}
#endif


bool isInFrame(Location l) {
  return !isRegister(l)
       || (l >= I0 && l < I0 + NumInRegisters)
       || (l >= L0 && l < L0 + NumLocalRegisters);
}


int32 spOffset(Location reg, fint totalFrameSize) {
  // return offset (in bytes) off of sp
  if (isRegister(reg)) {
    assert(isInFrame(reg), "can't access this register");
    return (first_register_offset - StackFromRegister[reg]) * oopSize;
  }
  else if (isStackRegister(reg)) {
    return (totalFrameSize + local_slots_offset + StackLocations - reg)
           * oopSize;
  } else if (isExtraArgRegister(reg)) {
   return (extra_arg_offset + ExtraArgLocations - reg) * oopSize;
  } else {
    assert(isExtraIArgRegister(reg), "not a stack register");
    // reg is <= ExtraIArgLocations, arg_bottom_offset is from sp
    return (totalFrameSize + arg_bottom_offset + ExtraIArgLocations - reg) * oopSize;
  }
}


int32 fpOffset_abstract(Location reg, fint frameSize) {
  // return offset (in bytes) off of fp
  if (isStackRegister(reg)) {
    return (local_slots_offset + StackLocations - reg) * oopSize;
  } else if (isExtraArgRegister(reg)) {
    return (local_slots_offset - frameSize + ExtraArgLocations - reg + 1)
           * oopSize;
  } else {
    assert(isExtraIArgRegister(reg), "not a stack register");
    return (arg_bottom_offset + ExtraIArgLocations - reg) * oopSize;
  }
}
