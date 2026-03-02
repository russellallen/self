/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

# include "_bits_tests.cpp.incl"

VM_TEST(bits, mask_and_set) {
  VM_CHECK_EQ(maskBits(0xFF, 0x0F), 0x0Fu);
  VM_CHECK_EQ(addBits(0xF0, 0x0F), 0xFFu);
  VM_CHECK(anySet(0xFF, 0x01));
  VM_CHECK(!anySet(0xF0, 0x0F));
}

VM_TEST(bits, nth_bit) {
  VM_CHECK_EQ(nthBit(0), OneBit);
  VM_CHECK_EQ(nthBit(3), 8u);

  unsigned long x = 0;
  setNth(x, 3);
  VM_CHECK(isSet(x, 3));
  VM_CHECK(!isSet(x, 2));
  clearNth(x, 3);
  VM_CHECK(!isSet(x, 3));
}

VM_TEST(bits, nth_mask) {
  VM_CHECK_EQ(nthMask(0), NoBits);
  VM_CHECK_EQ(nthMask(8), 0xFFu);
  VM_CHECK_EQ(nthMask(BitsPerWord), AllBits);
}

VM_TEST(bits, lower_bits) {
  VM_CHECK_EQ(lowerBits(0xFF, 4), 0x0Fu);
  VM_CHECK_EQ(lowerBits(0xFFFF, 8), 0xFFu);
}

VM_TEST(bits, rounding) {
  VM_CHECK_EQ(roundTo(5, 4), 8u);
  VM_CHECK_EQ(roundTo(8, 4), 8u);
  VM_CHECK_EQ(roundTo(0, 4), 0u);
  VM_CHECK_EQ(roundTo(1, 4), 4u);
}
