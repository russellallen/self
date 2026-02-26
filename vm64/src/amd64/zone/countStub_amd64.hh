# if defined(__i386__) || defined(__x86_64__)
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


  inline void CountStub::set_count_addr(CountCodePattern* patt, int32 addr) {
    int32* p = (int32*)(smi(insts()) + patt->countAddr_offset);
    *p = addr;
  }

  inline int32 CountStub::count_addr(CountCodePattern* patt) {
    int32* p = (int32*)(smi(insts()) + patt->countAddr_offset);
    return *p;
  }

  inline void CountStub::set_callee(CountCodePattern* patt, int32 addr) {
    int32* p = (int32*)(smi(insts()) + patt->nmAddr_offset);
    *p = addr - smi(p) - sizeof(int32);
  }



# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // defined(__i386__) || defined(__x86_64__)
