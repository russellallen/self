/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "longRegString.hh"

# include "_longRegString.cpp.incl"


# ifdef SIC_COMPILER

  inline fint tempToIndex(Location temp) { return index_for_StackLocation(temp) + 32; }
  inline Location indexToTemp(fint temp) {
    return Location(StackLocation_for_index(temp - 32));
  }

  LongRegisterString::LongRegisterString() {
    bv = new BitVector(128);
  }

  void LongRegisterString::doAllocate(Location l) {
    if (isRegister(l)) {
      bv->add(l);
    } else {
      assert(isStackRegister(l), "should be stack reg");
      fint i = tempToIndex(l);
      if (i >= bv->length) grow(i);
      bv->add(i);
    }
  }

# ifdef UNUSED
  void LongRegisterString::deallocate(Location l) {
    if (isRegister(l)) {
      bv->remove(l);
    } else {
      assert(isStackRegister(l), "should be stack reg");
      fint i = tempToIndex(l);
      bv->remove(i);
    }
  }
# endif
    
  bool LongRegisterString::isAllocated(Location l) {
    if (isRegister(l)) {
      return bv->includes(l);
    } else {
      assert(isStackRegister(l), "should be stack reg");
      fint i = tempToIndex(l);
      if (i < bv->length) {
        return bv->includes(i);
      } else {
        return false;
      }
    }
  }

  RegisterString LongRegisterString::regs() {
    return bv->bits[0];
  }

  void LongRegisterString::grow(fint desiredIndex) {
    if (desiredIndex < bv->maxLength) {
      bv->setLength(desiredIndex + 1);
      return;
    }
    fint newMaxLength = bv->maxLength * 2;
    while (desiredIndex >= newMaxLength)  newMaxLength *= 2;
    bv = bv->copy(newMaxLength);
    bv->setLength(desiredIndex + 1);
  }

  void LongRegisterString::print() {
  }


  // find the first bit >= start that is unused in all strings[0..len-1]
  fint findFirstUnused(LongRegisterString** strings, fint len,
                       fint start) {
    // currently quite unoptimized
    BitVector* b = strings[0]->bv->copy(strings[0]->bv->maxLength);
    fint i;
    for (i = 1; i < len; i++) {
      b->unionWith(strings[i]->bv);
    }
    for (i = start; i < b->length; i++) {
      if (!b->includes(i)) break;
    }
    return i;
  }

  Location findFirstUnusedTemp(LongRegisterString** strings, fint len) {
    fint i = findFirstUnused(strings, len, tempToIndex(StackLocation_for_index(0)));
    return indexToTemp(i);
  }

# endif // SIC_COMPILER
