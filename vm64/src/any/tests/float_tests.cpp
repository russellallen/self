/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

# include "_float_tests.cpp.incl"

VM_TEST(float_oop, tag) {
  floatOop f = as_floatOop(1.0f);
  VM_CHECK(f->is_float());
  VM_CHECK(!f->is_smi());
  VM_CHECK(!f->is_mem());
  VM_CHECK(!f->is_mark());
}

VM_TEST(float_oop, roundtrip) {
  float values[] = {0.0f, 1.0f, -1.0f, 100.0f};
  for (float v : values) {
    floatOop f = as_floatOop(v);
    VM_CHECK(f->is_float());
    VM_CHECK_EQ(f->value(), v);
  }
}

VM_TEST(float_oop, zero_sign) {
  floatOop pos = as_floatOop(0.0f);
  floatOop neg = as_floatOop(-0.0f);
  VM_CHECK_EQ(pos->value(), 0.0f);
  VM_CHECK_EQ(neg->value(), -0.0f);
}
