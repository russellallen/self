# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// included in genHelper.hh

public:
  void moveToExactlyThisReg(PReg* pr, Location reg);                         

private:

  void verifyOneImmediateParent(assignableSlotLink* l, 
                                Location parentOopReg,
                                Location scratchReg,
                                fint count);

  void verifyConstrainedOopOfParent(oop targetOop, 
                                    Location parentOopReg, 
                                    Label* ok);
  void verifyMapOfParent(Map* targetMap,
                         Location parentOopReg, 
                         Location regForMap, 
                         Label* ok);
                         

  Location    leaf_rcvr_base;
  int32       leaf_rcvr_disp;
  OperandType leaf_rcvr_type;
# endif // __i386__
