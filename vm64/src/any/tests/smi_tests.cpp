/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

# include "_smi_tests.cpp.incl"

VM_TEST(smi, constants) {
  VM_CHECK_EQ(smiOop_zero->value(), (smi)0);
  VM_CHECK_EQ(smiOop_one->value(), (smi)1);
  VM_CHECK(smiOop_min->is_smi());
  VM_CHECK(smiOop_max->is_smi());
  VM_CHECK(smiOop_min->value() < 0);
  VM_CHECK(smiOop_max->value() > 0);
}

VM_TEST(smi, increment_decrement) {
  VM_CHECK_EQ(smiOop_zero->increment(), smiOop_one);
  VM_CHECK_EQ(smiOop_one->decrement(), smiOop_zero);

  smiOop two = smiOop_one->increment();
  VM_CHECK_EQ(two->value(), (smi)2);
  VM_CHECK_EQ(two->decrement(), smiOop_one);
}

VM_TEST(smi, byte_count_roundtrip) {
  smi values[] = {0, 1 << Tag_Size, 100 << Tag_Size};
  for (smi v : values) {
    smiOop o = as_byte_count_smiOop(v);
    VM_CHECK(o->is_smi());
    VM_CHECK_EQ(o->byte_count(), v);
  }
}

VM_TEST(smi, identity_hash) {
  smi values[] = {0, 1, -1, 42, 1000};
  for (smi v : values) {
    VM_CHECK_EQ(as_smiOop(v)->identity_hash(), v);
  }
}
