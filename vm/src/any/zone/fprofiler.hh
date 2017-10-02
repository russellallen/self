#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "nmethod_inline.hh"




// primitives
oop  ResetFlatProfile_prim(oop rcvr);
oop  PrintFlatProfile_prim(oop rcvr, smi lines);
void SelfFlatProfile(bool on);

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

class FlatProfiler: public CHeapObj {
 public:
  int32 flushed;
  FlatProfiler();
  void  clear(char* startPC, char* endPC);
  void  flush(char* startPC, char* endPC);
  void  move(char* startPC, char* endPC, char* toPC);
};

extern FlatProfiler* flatProfiler;


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
