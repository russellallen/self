#pragma once
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "process.hh"
# include "top.hh"
# include "universe.hh"



// preserved objects are used to protect oops (or objects containing oops)
// against garbage collections that happen during execution of some C code
// (GCs may happen when C code calls Self)

class preservedVmObj: public StackObj {
 public:
  preservedVmObj()  { currentProcess->preserve(this); }
  ~preservedVmObj() { currentProcess->un_preserve(this); }
  // virtual void oops_do(oopsDoFn f) = 0; declared in base class VMObj
};

class preserved: public preservedVmObj {
public:
  oop value;
  
  preserved(oop v) { value = v; }
  void oops_do(oopsDoFn f) { OOPS_DO_TEMPLATE(&value,f) }
  
  MACOSX_DESTRUCTOR_BUG(preserved)
};

class preservedObj: public preservedVmObj {
public:
  VMObj* value;
  
  preservedObj(VMObj* v) { value = v; }
  void oops_do(oopsDoFn f) { if (value) value->oops_do(f); }
};


class preservedArray: public preservedVmObj {
public:
  oop* oops;
  int32 length;

  preservedArray(oop* p, int32 n) { oops = p; length = n; }
  void oops_do(oopsDoFn f) {
    for ( int32 i = 0;  i < length;  ++i) {
      OOPS_DO_TEMPLATE(&oops[i],f) }}
};
