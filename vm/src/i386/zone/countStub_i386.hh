# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


  inline void CountStub::set_count_addr(CountCodePattern* patt, int32 addr) {
    int32* p = (int32*)(int32(insts()) + patt->countAddr_offset);
    *p = addr;
  }
  
  inline int32 CountStub::count_addr(CountCodePattern* patt) {
    int32* p = (int32*)(int32(insts()) + patt->countAddr_offset);
    return *p;
  }
  
  inline void CountStub::set_callee(CountCodePattern* patt, int32 addr) {
    int32* p = (int32*)(int32(insts()) + patt->nmAddr_offset);
    *p = addr - int32(p) - sizeof(int32);
  }

  

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // __i386__
