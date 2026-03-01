/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

# include "_tag_tests.cpp.incl"

VM_TEST(tag, constants) {
  VM_CHECK_EQ(Int_Tag, 0);
  VM_CHECK_EQ(Mem_Tag, 1);
  VM_CHECK_EQ(Float_Tag, 2);
  VM_CHECK_EQ(Mark_Tag, 3);
  VM_CHECK_EQ(Tag_Size, 2);
  VM_CHECK_EQ(Tag_Mask, 3);
}

VM_TEST(tag, smi_roundtrip) {
  smi values[] = {(smi)0, (smi)1, (smi)-1, (smi)42, (smi)-1000000};
  for (smi v : values) {
    oop o = as_smiOop(v);
    VM_CHECK(o->is_smi());
    VM_CHECK(!o->is_mem());
    VM_CHECK_EQ(smiOop(o)->value(), v);
  }
}
