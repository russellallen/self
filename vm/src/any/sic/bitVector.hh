/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// Simple bit vectors; space is allocated for maxLength bits, but only
// the portion up to length bits is used.

# ifdef SIC_COMPILER

  typedef void (*intDoFn)(int i);
  
  class BitVector:  public ResourceObj {
   protected:
    int32 maxLength;
    int32 length;       // number of bits, not words
    int32* bits;
    
    int32  indexFromNumber(int32 i) { return i >> LogBitsPerWord; }
    int32 offsetFromNumber(int32 i) { return lowerBits(i, LogBitsPerWord); }
    
    bool getBitInWord(int32 i, int32 o) { return isSet(bits[i], o); }
    void setBitInWord(int32 i, int32 o) {       setNth(bits[i], o); }
    void clearBitInWord(int32 i, int32 o) {   clearNth(bits[i], o); }
    
    int32 bitsLength(int32 l) { return indexFromNumber(l - 1) + 1; }
    
    int32* createBitString(int32 l) {
      int32 blen = bitsLength(l);
      int32* bs = NEW_RESOURCE_ARRAY( int32, blen);
      set_words(bs, blen, 0);
      return bs; }
    int32* copyBitString(int32 len) {
      assert(len >= maxLength, "can't shorten");
      int32 blen = bitsLength(len);
      int32* bs = NEW_RESOURCE_ARRAY( int32, blen);
      int32 blength = bitsLength(maxLength);
      copy_words(bits, bs, blength);
      if (blength < blen) set_words(bs + blength, blen - blength, 0);
      return bs; }
    
  public:
    BitVector(int32 l) {
      assert(l > 0, "should have some length");
      length = maxLength = l; bits = createBitString(l); }
    
  protected:
    BitVector(int32 l, int32 ml, int32* bs) {
      maxLength = ml; length = l; bits = bs; }
    
  public:
    BitVector* copy(int32 len) {
      return new BitVector(length, len, copyBitString(len)); }
    
    bool includes(int32 i) {
      assert(this, "shouldn't be a null pointer");
      assert(i >= 0 && i < length, "not in range");
      bool b = getBitInWord(indexFromNumber(i), offsetFromNumber(i));
      return b; }
    void add(int32 i) {
      assert(this, "shouldn't be a null pointer");
      assert(i >= 0 && i < length, "not in range");
      setBitInWord(indexFromNumber(i), offsetFromNumber(i)); }
    void addFromTo(int32 first, int32 last);    // set bits [first..last]
    void remove(int32 i) {
      assert(this, "shouldn't be a null pointer");
      assert(i >= 0 && i < length, "not in range");
      clearBitInWord(indexFromNumber(i), offsetFromNumber(i)); }
    void removeFromTo(int32 first, int32 last); // clear bits [first..last]

    // union/intersect return true if receiver has changed
    bool unionWith(BitVector* other);           // this |= other
    bool intersectWith(BitVector* other);       // this &= other
    bool isDisjointFrom(BitVector* other);      // (this & other) == {}

    void doForAllOnes(intDoFn f);  // call f for all 1 bits

    void setLength(int32 l) { assert(l <= maxLength, "too big"); length = l; }
    void clear() { set_words(bits, bitsLength(length), 0); }
    
    void print_short();
    void print();

    friend class LongRegisterString;
    friend fint findFirstUnused(LongRegisterString** strings, fint len,
                                fint start);
  };
  
# endif
