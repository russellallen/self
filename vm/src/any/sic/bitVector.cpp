/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef SIC_COMPILER

# pragma implementation "bitVector.hh"
# include "_bitVector.cpp.incl"

  bool BitVector::unionWith(BitVector* other) {
    if (length < other->length) {
      if (other->length <= maxLength)
        setLength(other->length);
      else {
        *this = *copy(other->length);
      }
    }
    bool changed = false;
    for (fint i = indexFromNumber(other->length-1); i >= 0; i--) {
      int32 old = bits[i];
      bits[i] |= other->bits[i];
      changed |= old != bits[i];
    }
    return changed;
  }

  bool BitVector::intersectWith(BitVector* other) {
    bool changed = false;
    for (fint i = indexFromNumber(min(length, other->length)-1); i >= 0; i--) {
      int32 old = bits[i];
      bits[i] &= other->bits[i];
      changed |= old != bits[i];
    }
    return changed;
  }

  bool BitVector::isDisjointFrom(BitVector* other) {
    for (fint i = indexFromNumber(min(length, other->length)-1); i >= 0; i--) {
      if ((bits[i] & other->bits[i]) != 0) return false;
    }
    return true;
  }

  void BitVector::addFromTo(int32 first, int32 last) {
    // mark bits [first..last]
    assert(first >= 0 && first < length, "wrong index");
    assert(last >= 0 && last < length, "wrong index");
    fint startIndex = indexFromNumber(first);
    fint   endIndex = indexFromNumber(last);
    if (startIndex == endIndex) {
      assert(last - first < BitsPerWord, "oops");
      int32 mask = nthMask(last - first + 1);
      bits[startIndex] |= mask << offsetFromNumber(first);
    } else {
      bits[startIndex] |= AllBits << offsetFromNumber(first);
      for (fint i = startIndex + 1; i < endIndex; i++) bits[i] = AllBits;
      bits[endIndex] |= nthMask(offsetFromNumber(last) + 1);
    }
#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions)
        for (fint i = first; i <= last; i++) {
          assert(includes(i), "bit should be set");
        }
#   endif
  }

#ifdef UNUSED
  void BitVector::removeFromTo(int32 first, int32 last) {
    assert(first >= 0 && first < length, "wrong index");
    assert(last >= 0 && last < length, "wrong index");
    fint startIndex = indexFromNumber(first);
    fint   endIndex = indexFromNumber(last);
    if (startIndex == endIndex) {
      assert(last - first < BitsPerWord, "oops");
      int32 mask = ~nthMask(last - first + 1);
      bits[startIndex] &= mask << offsetFromNumber(first);
    } else {
      bits[startIndex] &= ~(AllBits << offsetFromNumber(first));
      for (fint i = startIndex + 1; i < endIndex; i++) bits[i] = 0;
      bits[endIndex] &= ~nthMask(offsetFromNumber(last) + 1);
    }
#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions)
        for (fint i = first; i <= last; i++)
          assert(!includes(i), "bit shouldn't be set");
#   endif
  }
#endif

  void BitVector::print_short() { lprintf("BitVector %#lx", this); }
  
  void BitVector::doForAllOnes(intDoFn f) {
    for (fint i = indexFromNumber(length-1); i >= 0; i--) {
      int32 b = bits[i];
      for (fint j = 0; j < BitsPerWord; j++) {
        if (isSet(b, j)) {
          f(i * BitsPerWord + j);
          clearNth(b, j);
          if (!b) break;
        }
      }
    }
  }
  
  void BitVector::print() {
    print_short();
    lprintf(": {");
    fint i, last = -1;
    for (i = 0; i < length; i++) {
      if (includes(i)) {
        if (last < 0) {
          lprintf(" %ld", (void*)i);    // first bit after string of 0s
          last = i;
        }
      } else {
        if (last >= 0) lprintf("..%ld", (void*)(i - 1)); // ended a group
        last = -1;
      }
    }
    if (last >= 0) lprintf("..%ld", (void*)(i - 1));
    lprintf(" }");
  }
  
# endif
