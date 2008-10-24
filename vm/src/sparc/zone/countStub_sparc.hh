/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma interface


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


  inline void CountStub::set_count_addr(CountCodePattern* patt, int32 addr) {
    int32* p = (int32*)insts();
    assert(isSetHi(p + patt->countAddr_offset), "wrong pattern");
    assert(isLoadStore(p + patt->ld_offset), "wrong pattern");
    assert(isLoadStore(p + patt->st_offset), "wrong pattern");
    setSetHiImm(p + patt->countAddr_offset, addr);
    setArithImm(p + patt->ld_offset, addr);
    setArithImm(p + patt->st_offset, addr);
    if (patt->countAddr_offset2 != CountCodePattern::BadOffset) {
      assert(isSetHi(p + patt->countAddr_offset2), "wrong pattern");
      setSetHiImm(p + patt->countAddr_offset2, addr);
    }
  }
  
  inline int32 CountStub::count_addr(CountCodePattern* patt) {
    int32* p = (int32*)insts();
    assert(isSetHi(p + patt->countAddr_offset), "wrong pattern");
    assert(isLoadStore(p + patt->ld_offset), "wrong pattern");
    int32 addr = getSetHiImm(p + patt->countAddr_offset);
    return addr + getArithImm(p + patt->ld_offset);
  }
  
  inline void CountStub::set_callee(CountCodePattern* patt, int32 addr) {
    int32* p = (int32*)insts();
    assert(isSetHi(p + patt->nm_sethi_offset), "wrong pattern");
    assert(isJump (p + patt->nm_jmp_offset), "wrong pattern");
    setSetHiImm(p + patt->nm_sethi_offset, addr);
    setArithImm(p + patt->nm_jmp_offset, addr);
  }

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

