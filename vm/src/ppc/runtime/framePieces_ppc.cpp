# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# include "framePieces_inline.hh"
# include "label_inline.hh"


oop* ppc_sp::locals() {
  return &as_oops()[linkage_area_end];
}


// cloned from sparc size

ppc_sp* ppc_sp::push_new_sp( char* pc,
                             fint size_in_oops,
                             bool zapAlways ) {
  assert((size_in_oops & 3) == 0, "");
  ppc_sp* sp = (ppc_sp*)( as_oops() - size_in_oops );
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
  return sp;
}
# endif // TARGET_ARCH == PPC_ARCH
