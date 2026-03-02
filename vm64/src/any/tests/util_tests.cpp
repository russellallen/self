/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

# include "_util_tests.cpp.incl"

VM_TEST(util, compare_bytes_equal) {
  VM_CHECK_EQ(compare_bytes("abc", 3, "abc", 3), 0);
  // Different lengths, same prefix
  VM_CHECK_NE(compare_bytes("abc", 3, "ab", 2), 0);
}

VM_TEST(util, compare_bytes_order) {
  VM_CHECK(compare_bytes("abc", 3, "abd", 3) < 0);
  VM_CHECK(compare_bytes("abd", 3, "abc", 3) > 0);
}

VM_TEST(util, compare_slot_names) {
  // foo: should sort before foo0
  VM_CHECK(compare_slot_names("foo:", 4, "foo0", 4) < 0);
  // Basic equality
  VM_CHECK_EQ(compare_slot_names("foo", 3, "foo", 3), 0);
  // Length difference
  VM_CHECK_NE(compare_slot_names("foo", 3, "foobar", 6), 0);
}
