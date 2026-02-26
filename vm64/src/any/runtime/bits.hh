/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# if TARGET_IS_64BIT
  # define AllBits      ~0ULL
  # define NoBits       0ULL
  # define OneBit       1ULL
# else
  # define AllBits      ~0u
  # define NoBits       0u
  # define OneBit       1u
# endif

# define addBits(x, m)  ((x) | (m))
# define setBits(x, m)  ((x) |= (m))
# define clearBits(x, m) ((x) &= ~(m))
# define maskBits(x, m) ((x) & (m))
# define anySet(x, m)   (maskBits((x), (m)) != NoBits)
# define nthBit(n)      (OneBit << (n))
# define addNth(x, n)   addBits((x), nthBit(n))
# define setNth(x, n)   setBits((x), nthBit(n))
# define clearNth(x, n) clearBits((x), nthBit(n))
# define isSet(x, n)    anySet((x), nthBit(n))
# define nthMask(n)     (n == BitsPerWord ? AllBits : (nthBit(n) - OneBit))
# define lowerBits(x, n) maskBits((x), nthMask(n))

# define roundMask(x, m) (((x) + (m)) & ~(m))
# define roundBits(x, n) roundMask((x), nthMask(n))
# define roundTo(x, v)  roundMask((x), (v) - OneBit)
