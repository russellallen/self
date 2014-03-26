#pragma once
/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma interface

# ifdef FAST_COMPILER

  AddressList* maskList;              // addresses of generated ic masks

 public:
  void fixupMasks(fint stackTempSize);  // fix up masks

# endif // FAST_COMPILER
