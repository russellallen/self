/* Sun-$Revision: 30.6 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


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

# include "_countPattern_pd.hh.incl"
  };


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

