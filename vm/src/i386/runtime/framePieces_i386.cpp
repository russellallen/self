# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# include "framePieces_inline.hh"
# include "label_inline.hh"

i386_sp* i386_sp::push_new_sp( char* pc,
                             fint size_in_oops,
                             bool zapAlways ) {
  assert((size_in_oops & (frame_word_alignment - 1)) == 0, "alignment");
  assert( ((frame*)this)->is_aligned(), "alignment");
  i386_sp* sp = (i386_sp*)( ((oop*)this) - size_in_oops );
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      zapAlways = true;
    }
# endif
  if (zapAlways)
    // If errorObj starts showing up where it shouldn't, I recommend
    // substituting 0xfffffffe for it below: (dmu)
    set_oops(sp->as_oops(), size_in_oops, (oop)Memory->errorObj);
  sp->set_link(this);
  sp->set_return_addr(pc);
  assert( ((frame*)sp)->is_aligned(), "alignment");
  return sp;
}
# endif // TARGET_ARCH == I386_ARCH
