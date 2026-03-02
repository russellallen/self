/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

# include "_mark_tests.cpp.incl"

VM_TEST(mark, initial) {
  VM_CHECK(initial_markOop->is_mark());
  VM_CHECK_EQ(initial_markOop->hash(), (smi)no_hash);
  VM_CHECK_EQ(initial_markOop->age(), (smi)0);
  VM_CHECK(!initial_markOop->is_objectMarked());
}

VM_TEST(mark, set_hash) {
  smi values[] = {1, 2, 42, 100};
  for (smi v : values) {
    markOop m = initial_markOop->set_hash(v);
    VM_CHECK_EQ(m->hash(), v);
    VM_CHECK(m->is_mark());
  }
  // Setting hash to 0 should bump to first_hash
  markOop m = initial_markOop->set_hash(0);
  VM_CHECK_EQ(m->hash(), (smi)first_hash);
}

VM_TEST(mark, set_age) {
  smi values[] = {0, 1, 5, 10};
  for (smi v : values) {
    markOop m = initial_markOop->set_age(v);
    VM_CHECK_EQ(m->age(), v);
    VM_CHECK(m->is_mark());
  }
}

VM_TEST(mark, incr_age) {
  markOop m = initial_markOop;
  VM_CHECK_EQ(m->age(), (smi)0);
  m = m->incr_age();
  VM_CHECK_EQ(m->age(), (smi)1);
  m = m->incr_age();
  VM_CHECK_EQ(m->age(), (smi)2);

  // At max age, should saturate
  markOop maxed = initial_markOop->set_age(age_mask);
  markOop overflow = maxed->incr_age();
  VM_CHECK_EQ(overflow->age_in_place(), overflow_age_in_place);
}

VM_TEST(mark, object_marked) {
  markOop m = initial_markOop;
  VM_CHECK(!m->is_objectMarked());

  markOop marked = m->with_objectIsMarked();
  VM_CHECK(marked->is_objectMarked());

  markOop cleared = marked->without_objectIsMarked();
  VM_CHECK(!cleared->is_objectMarked());
}
