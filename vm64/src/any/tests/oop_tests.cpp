/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

# include "_oop_tests.cpp.incl"

VM_TEST(oop, tag_dispatch) {
  oop s = as_smiOop(42);
  VM_CHECK_EQ(s->tag(), Int_Tag);

  floatOop f = as_floatOop(1.0f);
  VM_CHECK_EQ(f->tag(), Float_Tag);

  VM_CHECK_EQ(initial_markOop->tag(), Mark_Tag);
}

VM_TEST(oop, is_predicates) {
  oop s = as_smiOop(0);
  VM_CHECK(s->is_smi());
  VM_CHECK(!s->is_mem());
  VM_CHECK(!s->is_float());
  VM_CHECK(!s->is_mark());

  oop f = (oop)as_floatOop(1.0f);
  VM_CHECK(!f->is_smi());
  VM_CHECK(!f->is_mem());
  VM_CHECK(f->is_float());
  VM_CHECK(!f->is_mark());

  oop m = (oop)initial_markOop;
  VM_CHECK(!m->is_smi());
  VM_CHECK(!m->is_mem());
  VM_CHECK(!m->is_float());
  VM_CHECK(m->is_mark());
}

VM_TEST(oop, markify_memify) {
  oop s = as_smiOop(42);
  markOop m = s->markify();
  VM_CHECK_EQ(m->tag(), Mark_Tag);
  // payload preserved: same bits except tag
  VM_CHECK_EQ(clearTag(m), clearTag(s));

  memOop mem = s->memify();
  VM_CHECK_EQ(mem->tag(), Mem_Tag);
  VM_CHECK_EQ(clearTag(mem), clearTag(s));
}
