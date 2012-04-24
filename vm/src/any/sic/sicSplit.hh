/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# ifdef SIC_COMPILER

  // various SIC functionality associated with splitting

  // A split signature encodes the position of a SplitPReg or a node;
  // 0 means the node/preg isn't involved in any split, 1 means it is in
  // the first split path, etc.

  const fint MaxSplitDepth = 7;

  class SplitSig {
    // "this" encodes 7 split 4-bit IDs plus nesting level in lowest bits
    // this == 0 means top level, not in any split
    static const uint32 LevelMask;
   public:
    SplitSig()            { ShouldNotCallThis(); }
    SplitSig(SplitSig &s) { ShouldNotCallThis(); }
    friend SplitSig* new_SplitSig(SplitSig* current, fint splitID);

    fint level()        { return uint32(this) & LevelMask; }
    bool contains(SplitSig* other) {
      // other sig is in same branch iff the receiver is a prefix of other
      // NB: this is not symmetric, i.e. it's like <=, not ==
      fint shift = (MaxSplitDepth - level() + 1) << 2;
      if (shift == 32) return true;     // because x >> 32 is undefined
      return ((uint32(this) ^ uint32(other)) >> shift) == 0;
    }
    void print();
    char* prefix(char* buf);
  };

# endif
