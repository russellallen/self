/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "assignmentMap.hh"
# include "_assignmentMap.cpp.incl"

static bool createdAssignment = false;

assignmentOop assignmentMap::create_assignment() {
  if (createdAssignment)
    ShouldNotReachHere(); // should create only one assignment obj
  createdAssignment= true;
  assignmentMap m1;
  assignmentOop p;
  (void)create_map(sizeof(assignmentMap), NULL, &m1, (oop*)&p);
  return p;
}

oop assignmentMap::cloneSize(oop obj, fint length, bool mustAllocate,
                             oop filler) {
  return slotsMapDeps::cloneSize(obj, length, mustAllocate, filler); }


