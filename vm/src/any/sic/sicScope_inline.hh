/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# ifdef SIC_COMPILER

inline void SCodeScope::allocateDown(PReg* r, fint start, fint end,
                                     bool okToOverlap) {
  if (start < 0) {
    start = 0; end = ncodes - 1;
  }
  markReg(r, start, end);
  for (fint i = 0; i < subScopes->length(); i++) {
    SSelfScope* s = subScopes->nth(i);
    if (s->senderBCI() >= start && s->senderBCI() <= end) {
      s->allocateDown(r, -1, -1, okToOverlap);
    }
  }
}

# endif
