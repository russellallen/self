#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "asserts.hh"



# define AllBits        ~0
# define NoBits         0
# define OneBit         1

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
# define nthMask(n)     (n == 32 ? AllBits : (nthBit(n) - OneBit))
# define lowerBits(x, n) maskBits((x), nthMask(n))

# define roundMask(x, m) (((x) + (m)) & ~(m))
# define roundBits(x, n) roundMask((x), nthMask(n))
# define roundTo(x, v)  roundMask((x), (v) - OneBit)
