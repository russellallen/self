/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "stringOop.hh"
# include "_stringOop.cpp.incl"


stringOop new_string(const char* bytes, int32 len, bool mustAllocate) {
  assert(bytes != NULL, "new_string: null bytes");
  return Memory->string_table->lookup(bytes, len, mustAllocate); }

bool stringOopClass::is_unary(fint upToLen) {
  char *s= bytes();
  char c= *s++;
  if (!is_id_alpha(c)) return false;
  for (upToLen--; upToLen > 0; upToLen--)
    if (*s++ == ':')
      return false;
  return true;
}

stringOop create_string(fint size) {
  char* nb;
  oop *p= Memory->old_gen->alloc_objs_and_bytes(size, 0, nb);
  stringOop obj= as_stringOop(p);
  obj->init_mark();
  obj->set_length(0);
  obj->set_bytes(nb);
  return obj;
}

stringOop stringOopClass::make_string(const char* value, fint len,
                                      bool mustAllocate) {
  fint s= size();
  fint l= ::lengthWords(len);
  char* nb;
  oop* x= Memory->old_gen->alloc_objs_and_bytes(s, l, nb, mustAllocate);
  if (x == NULL)
    return stringOop(failedAllocationOop);
  copy_oops(oops(), x, s);
  copy_bytes(value, nb, len);   // value maybe not word-aligned
  stringOop r = as_stringOop(x);
  assert(r->is_old(), "should be allocated in old space");
  r->init_mark();
  r->set_length(len);
  r->set_bytes(nb);
  r->fix_generation(s);
  return r;
}

stringOop stringOopClass::scavenge() {
  ShouldNotCallThis(); // shouldn't be scavenging canonical strings
                       // (should be tenured);
  return NULL;
}

bool stringOopClass::verify() {
  bool flag = byteVectorOopClass::verify();
  if (flag) {
    if (!is_old()) {
      error1("stringOop 0x%lx isn't tenured", this);
      flag = false;
    }
    stringOop s = Memory->string_table->lookup(bytes(), length());
    if (s != this) {
      error1("stringOop 0x%lx isn't canonical", this);
      flag = false;
    }
    if (!flag) {
      lprintf("It contains: ");
      string_print();
      lprintf("\n");
    }
  }
  return flag;
}
