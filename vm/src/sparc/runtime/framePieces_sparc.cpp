/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "framePieces_sparc.hh"

# include "_framePieces_sparc.cpp.incl"



// used to be frameFromStackLocals, dummyFrameFor
// don't use this if locals isn't the very last sparc_sp on the stack!
// I am the last sparc_sp on the stack, and there is no frame for it;
// construct a dummy sp frame

sparc_sp* sparc_sp::push_new_sp( char* pc,
                                 fint size_in_oops,
                                 bool zapAlways ) {
  // ( this was 1024 in one previous version and 64 in another!)
  if (size_in_oops == 0) {
    size_in_oops = stackTempCountToFrameSize(0);
    size_in_oops += size_in_oops & (frame_word_alignment-1); // make even
  }
  assert((size_in_oops & 1) == 0, "sparc frames must be even length");
  sparc_sp* sp = (sparc_sp*)( as_oops() - size_in_oops );
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      zapAlways = true;
    }
# endif
  if (zapAlways)
    // If errorObj starts showing up where it shouldn't, I recommend
    // substituting 0xfffffffe for it below: (dmu)
    set_oops(sp->as_oops(), size_in_oops, (oop)Memory->errorObj);
  sp->set_link(as_callees_fp());
  sp->set_return_addr(pc);
  assert(sp->link() == (sparc_fp*)this, "just checkin'");
  return sp;
}



void** sparc_sp::location_addr(Location r) {
  assert( isInFrame(r),  "bounds check");
  fint offset = spOffset(r,  link()->as_oops() - this->as_oops()) / oopSize;
  return &((void**) this)[offset];
}
