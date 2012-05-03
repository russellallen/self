/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


extern "C" {
  // print something like "foo:(foo.self:29)")
  void  printName(methodMap* mm, oop selector);
  const char* sprintName(methodMap* mm, oop selector);
  char* sprintValueMethod(oop rcvr);
}

oop printVMObj_prim(oop rcvr);
