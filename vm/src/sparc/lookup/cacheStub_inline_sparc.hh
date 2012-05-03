/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma interface

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


inline void CacheStub::jump(char* addr) {
  a->SetHiX(int32(addr), CodeAddressOperand, Temp2);
  a->JmpLC(Temp2, addr, G0);
  // endTypeTest is not first because of delay slot business; also can't be
  // before Jmp because it would separate sethi & jmp
  if (SICCountTypeTests) a->endTypeTest(); 
}

# endif  // defined(FAST_COMPILER) || defined(SIC_COMPILER)

