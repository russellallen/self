#pragma once
/* Sun-$Revision: 30.6 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "allocation.hh"
# include "kinds.hh"



# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

  class CountCodePattern : public CHeapObj {
   public:
    static const fint BadOffset;
    fint instsSize;             // code length in bytes
    char* pattern;              // code pattern

    CountCodePattern(CountType ct) {
      if (ct == Counting) initCounting(); else initComparing(); }
   protected:
    void initCounting();
    void initComparing();

# if defined(__ppc__)
# include "countPattern_ppc.hh"
# elif defined(__i386__)
# include "countPattern_i386.hh"
# else
# include "countPattern_sparc.hh"
# endif
  };


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

