#pragma once
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "machineCache.hh"
# include "machineCache.hh"
# include "top.hh"



# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

// These hold enough information to read or write a value embedded
// in the instructions of an nmethod.
// Such values include oops, nmethod entry points, and for the SPARC,
// the target of any call instruction.
// They are used to update information when things move.

// The offset encodes the part of a nmethod that an addrDesc points to:
// 0..instsLen-1:                       instructions
// instsLen..instsLen+scopesLen-1:      scopes
// >= instsLen+scopesLen:               pcs


class addrDesc {
 public:
  enum {
    isSendDescMask            = nthBit(BitsPerWord - 1),
    isDIDescMask              = nthBit(BitsPerWord - 2),
    isPrimitiveMask           = nthBit(BitsPerWord - 4),
    isEmbeddedMask            = nthBit(BitsPerWord - 5),
    architectureSpecificMask  = nthBit(BitsPerWord - 6),
    # ifdef SIC_COMPILER
      isUncommonTrapMask      = nthBit(BitsPerWord - 7),
    # endif
    isRelativeMask            = nthBit(BitsPerWord - 8),
    offsetMask                = nthMask(BitsPerWord - 9)
  };
 unknown:
  int32 desc;
  
  // shouldn't be constructed
  addrDesc()                    { ShouldNotCallThis(); } 
  addrDesc(addrDesc &)          { ShouldNotCallThis(); } 
  
  int32 offset() { return maskBits(desc, offsetMask); }
  void setOffset(int32 offset) {
    assert(offset >= 0 && offset <= offsetMask, "illegal offset");
    clearBits(desc, offsetMask);
    desc += offset; }
  
  bool isSendDesc()             { return anySet(desc, isSendDescMask); }
  bool isPrimitive()            { return anySet(desc, isPrimitiveMask); }
  bool isCall()                 { return isPrimitive() || isSendDesc(); }
  bool isDIDesc()               { return anySet(desc, isDIDescMask); }
  bool isEmbedded()             { return anySet(desc, isEmbeddedMask); }
  bool isRelative()             { return anySet(desc, isRelativeMask); }
  bool isOop()                  { return !(isCall() || isUncommonTrap() || isDIDesc()); }

# ifdef SIC_COMPILER
  bool isUncommonTrap()         { return anySet(desc, isUncommonTrapMask); }
# else
  bool isUncommonTrap()         { return false; }
# endif

  bool isShiftNeededAfterMovingMe(OopNCode* m);
  
  pc_t* addr(OopNCode* m);
  
  sendDesc* asSendDesc(OopNCode* m);
  sendDesc* asPrimitiveSendDesc(OopNCode* m);
    // note that it's not really an inline cache, just a primitive call
  
  DIDesc* asDIDesc(nmethod* m);
  
  pc_t instr_referent(OopNCode* m);
  void  set_instr_referent(OopNCode* m, void* newVal);
  
  pc_t referent(OopNCode* m) {
    return isEmbedded() ? instr_referent(m) : *addr(m) + (isRelative() ? int32(addr(m)) + BytesPerWord : 0); }
  
  void  set_referent(OopNCode* m, void* newVal) {
    if (isEmbedded()) {
      set_instr_referent(m, newVal);
    } else {
      char **a= addr(m);
      *a= (pc_t)newVal - (isRelative() ? int32(a + 1): 0);
      MachineCache::flush_instruction_cache_word(a);
    }
  }
 
  void  relocateTarget(OopNCode* m, int32 delta);
  
  void  shift(OopNCode* m, int32 delta) {
    relocateTarget(m, delta);
  }
  
  void  initialShift(OopNCode* m, int32 delta, int32 delta1) {
    setOffset(offset() + delta1);
    shift(m, delta); }
  
  bool  verify(nmethod* m);
  bool  verify(CacheStub* m);
  
  void  print(nmethod* c);
  
# if defined(__ppc__)
# include "addrDesc_ppc.hh"
# elif defined(__i386__)
# include "addrDesc_i386.hh"
# else
# include "addrDesc_sparc.hh"
# endif
};

# endif // FAST_COMPILER or SIC_COMPILER
