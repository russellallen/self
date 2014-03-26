#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "table.hh"



extern "C" {
  // print something like "foo:(foo.self:29)")
  void  printName(methodMap* mm, oop selector);
  const char* sprintName(methodMap* mm, oop selector);
  const char* sprintValueMethod(oop rcvr);
}

oop printVMObj_prim(oop rcvr);
