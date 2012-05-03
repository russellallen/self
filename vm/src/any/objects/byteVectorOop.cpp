/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "byteVectorOop.hh"
# include "_byteVectorOop.cpp.incl"


byteVectorOop byteVectorOopClass::copy(fint s, bool mustAlloc,
                                       oop genObj, bool cs) {
  fint l= lengthWords();
  char* nb;
  oop* x= genObj
    ? genObj->my_generation()->alloc_objs_and_bytes(s, l, nb, mustAlloc)
      : Memory->alloc_objs_and_bytes(s, l, nb, mustAlloc);
  if (x == NULL)
    return byteVectorOop(failedAllocationOop);
  copy_oops(oops(), x, s);
  copy_words((int32*) bytes(), (int32*) nb, l);
  byteVectorOop r = as_byteVectorOop(x);
  r->set_bytes(nb);
  if (cs) r->fix_generation(s);
  return r;
}

byteVectorOop byteVectorOopClass::grow_bytes(fint delta, bool mustAllocate) {
  fint s = size();
  fint nlen = length() + delta;
  fint l= lengthWords();
  fint nl= ::lengthWords(nlen);
  char* nb;
  oop* x= Memory->alloc_objs_and_bytes(s, nl, nb, mustAllocate);
  if (x == NULL)
    return byteVectorOop(failedAllocationOop);
  copy_oops(oops(), x, s);
  copy_words((int32*) bytes(), (int32*) nb, l);
  byteVectorOop r = as_byteVectorOop(x);
  r->set_length(nlen);
  r->set_bytes(nb);
  r->fix_generation(s);
  return r;
}

byteVectorOop byteVectorOopClass::shrink_bytes(fint delta, bool mustAllocate) {
  fint s = size();
  fint nlen = length() - delta;
  assert(nlen >= 0, "shrinking below size zero");
  fint nl= ::lengthWords(nlen);
  char* nb;
  oop* x= Memory->alloc_objs_and_bytes(s, nl, nb, mustAllocate);
  if (x == NULL)
    return byteVectorOop(failedAllocationOop);
  copy_oops(oops(), x, s);
  copy_words((int32*) bytes(), (int32*) nb, nl);
  byteVectorOop r = as_byteVectorOop(x);
  r->set_length(nlen);
  r->set_bytes(nb);
  r->fix_generation(s);
  return r;
}

byteVectorOop byteVectorOopClass::insert(fint s, fint change_point,
                                         fint delta, bool mustAllocate,
                                         bool sameGen) {
  assert(s == size(), "should be the right size");
  fint ns = s + delta;
  fint l= lengthWords();
  char* nb;
  oop* x= sameGen
    ? my_generation()->alloc_objs_and_bytes(ns, l, nb, mustAllocate)
      : Memory->alloc_objs_and_bytes(ns, l, nb, mustAllocate);
  if (x == NULL) 
    return byteVectorOop(failedAllocationOop);
  oop* p = oops();
  copy_oops(p, x, change_point);
  copy_oops(p + change_point, x + change_point + delta, s - change_point);
  copy_words((int32*) bytes(), (int32*) nb, l);
  byteVectorOop r = as_byteVectorOop(x);
  r->set_bytes(nb);
  // can't do fix_generation(), since inserted space isn't initialized yet
  return r;
}

byteVectorOop byteVectorOopClass::remove(fint s, fint change_point,
                                         fint delta, bool mustAllocate,
                                         bool sameGen) {
  assert(s == size(), "should be the right size");
  fint ns = s - delta;
  assert(ns >= sizeof(byteVectorOopClass)/oopSize,
         "shrinking below empty byte vector size");
  fint l= lengthWords();
  char* nb;
  oop* x= sameGen
    ? my_generation()->alloc_objs_and_bytes(ns, l, nb, mustAllocate)
      : Memory->alloc_objs_and_bytes(ns, l, nb, mustAllocate);
  if (x == NULL)
    return byteVectorOop(failedAllocationOop);
  oop* p = oops();
  copy_oops(p, x, change_point);
  copy_oops(p + change_point + delta, x + change_point,
            s - change_point - delta);
  copy_words((int32*) bytes(), (int32*) nb, l);
  byteVectorOop r = as_byteVectorOop(x);
  r->set_bytes(nb);
  r->fix_generation(ns);
  return r;
}

byteVectorOop create_byteVector(oop parent) {
  slotList* slist = new slotList(VMString[PARENT],
                                 parent_map_slotType,
                                 parent); 
  return create_byteVector(slist);
}

byteVectorOop create_byteVector(fint size) {
  char* nb;
  oop *p= Memory->alloc_objs_and_bytes(size, 0, nb);
  byteVectorOop obj= as_byteVectorOop(p);
  obj->init_mark();
  obj->set_length(0);
  obj->set_bytes(nb);
  return obj;
}

byteVectorOop byteVectorOopClass::scavenge(fint size) {
  assert(Memory->should_scavenge(this) && !is_forwarded(), 
         "shouldn't be scavenging"); 
  bool is_new;
  fint l= lengthWords();
  space *copySpace= Memory->survivor_space(this, size, l, is_new);
  char *nb;
  oop *x= copySpace->alloc_objs_and_bytes_local(size, l, nb);
  if (x == NULL) fatal("out of space in scavenge");
  copy_oops(oops(), x, size);
  copy_words((int32*) bytes(), (int32*) nb, l);
  byteVectorOop r = as_byteVectorOop(x);
  r->set_bytes(nb);
  if (is_new) { 
    r->set_mark(r->mark()->incr_age()); 
    Memory->age_table->add(r); 
  } 
  forward_to(r); 
  return r;
}

void byteVectorOopClass::relocate_bytes(space* s) {
  set_bytes(s->relocate_bytes(bytes()));
}

bool byteVectorOopClass::verify() {
  bool flag = slotsOopClass::verify();
  if (flag) {
    int32 l = length();
    if (l < 0) {
      error1("byteVectorOop 0x%lx has negative length", this);
      flag = false;
    }
    if (bytes() == NULL) {
      error1("byteVectorOop 0x%lx has a zero bytes part", this);
      flag = false;
    }
  }
  return flag;
}

bool byteVectorOopClass::verifyBytesPart(char*& b) {
  bool flag = true;
  char* bs = bytes();
  if (bs + roundTo(length(), oopSize) == b) {
    // adjust last bytes part
    b = bs;
  } else {
    error1("byteVectorOop 0x%lx has out-of-order bytes part", this);
    flag = false;
  }
  return flag;
}


char* byteVectorOopClass::copy_null_terminated(int &Clength) {
  // Copy the bytes() part. Always add trailing '\0'. If byte vector
  // contains '\0', these will be escaped in the copy, i.e. "....\0...".
  // Clength is set to length of the copy (may be longer due to escaping).
  // Presence of null chars can be detected by comparing Clength to length().

  assert_byteVector(this, "should be a byte vector");
  Clength = length();
  char *res = copy_string(bytes(), Clength);
  if (strlen(res) == Clength) 
    return res;                   // Simple case, no '\0' in byte vector.
  
  // Simple case failed ...
  smi t = length();               // Copy and 'escape' null chars.
  smi i;
  for (i = length()-1; i >= 0; i--) 
    if (byte_at(i) == '\0') t++; 
  // t is total length of result string.
  res = NEW_RESOURCE_ARRAY( char, t + 1);
  res[t--] = '\0';
  Clength  = t;
  for (i = length()-1; i >= 0; i--) {
    if (byte_at(i) != '\0') {
      res[t--] = byte_at(i);
    } else {
      res[t--] = '0';
      res[t--]   = '\\';
    }
  }
  assert(t == -1, "sanity check");
  return res;
}

char* byteVectorOopClass::copy_c_heap_null_terminated() {
  // Copy the bytes() part. Always add trailing '\0'. If byte vector
  // contains '\0', these will be escaped in the copy, i.e. "....\0...".
  // NOTE: The resulting string is allocated in Cheap
  
  assert_byteVector(this, "should be a byte vector");
  smi t = length();               // Copy and 'escape' null chars.
  smi i;
  for (i = length()-1; i >= 0; i--) 
    if (byte_at(i) == '\0') t++; 
  // t is total length of result string.
  char* res = NEW_C_HEAP_ARRAY( char, t + 1);
  res[t--] = '\0';
  for (i = length()-1; i >= 0; i--) {
    if (byte_at(i) != '\0') {
      res[t--] = byte_at(i);
    } else {
      res[t--] = '0';
      res[t--]   = '\\';
    }
  }
  assert(t == -1, "sanity check");
  return res;
}

// byte vector primitives

oop bv_size_prim(oop rcvr) {
  if (!rcvr->is_byteVector()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  return as_smiOop(byteVectorOop(rcvr)->length());
}

oop bv_compare_prim(oop rcvr,  oop arg) {
  if (!rcvr->is_byteVector()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  if (!arg ->is_byteVector()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  return as_smiOop(
                   compare_bytes(
                                 byteVectorOop(rcvr)->bytes(),
                                 byteVectorOop(rcvr)->length(),
                                 byteVectorOop(arg )->bytes(),
                                 byteVectorOop(arg )->length()));
}

oop byteVectorOopClass::bv_concatenate_prim(byteVectorOop arg,
                                            byteVectorOop proto, void *FH) {
  if (proto->is_string())
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  smi len1= this->length();
  smi len2= arg->length();
  // the code below is similar to copy_size
  smi len= len1 + len2;
  fint l= ::lengthWords(len);
  // NB: copy proto, not receiver -- otherwise, would create a
  // string if rcvr is a string (but then the result should be old and
  // canonicalized, and that's undesirable)
  fint s= proto->size();

  char* nb;
  oop* x= Memory->alloc_objs_and_bytes(s, l, nb, false);
  if (x == NULL) {
    out_of_memory_failure(FH, s, l);
    return NULL;
  }
  copy_oops(proto->oops(), x, s);
  copy_bytes(this->bytes(), nb,        len1);
  copy_bytes(arg ->bytes(), nb + len1, len2);
  byteVectorOop r = as_byteVectorOop(x);
  r->set_length(len);
  r->set_bytes(nb);
  r->fix_generation(s);
  return r;
}

oop bv_at_prim(oop rcvr, oop indexOop) { 
  if (!rcvr->is_byteVector()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  if (!indexOop->is_smi())    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  smi index = smiOop(indexOop)->value();
  if (unsigned(index) >= unsigned(byteVectorOop(rcvr)->length()))
    return ErrorCodes::vmString_prim_error(BADINDEXERROR);
  return as_smiOop(u_char(byteVectorOop(rcvr)->byte_at(index)));
}


oop bv_at_put_prim(oop rcvr, oop indexOop, oop contents) {
  if (!rcvr->is_byteVector() || rcvr->is_string())
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  if (!indexOop->is_smi()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  smi index = smiOop(indexOop)->value();
  if (unsigned(index) >= unsigned(byteVectorOop(rcvr)->length()))
    return ErrorCodes::vmString_prim_error(BADINDEXERROR);
  if (!contents->is_smi()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  smi cval = smiOop(contents)->value();
  if (unsigned(cval) > 255) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  byteVectorOop(rcvr)->byte_at_put(index, char(cval));
  return rcvr;
}


oop byteVectorOopClass::bv_clone_prim(smi size, u_char filler, void *FH) {
  assert(size >= 0, "bad size");
  if (is_string())
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  oop c= cloneSize(size, CANFAIL, as_smiOop(filler));
  if (c == failedAllocationOop) {
    out_of_memory_failure(FH, this->size(), size);
    return NULL;
  }    
  // test for scavenging
  if (ScavengeInPrimitives && Memory->needs_scavenge()) {
    return Memory->scavenge(c);
  } else {
    return c;
  }
}

// string-like primitives

oop byteVectorOopClass::string_canonicalize_prim() {
  return new_string(bytes(), length());
}

oop byteVectorOopClass::string_print_prim() {
  string_print();
  return this;
}

oop byteVectorOopClass::run_script_prim() {
  ResourceMark rm;
  oop res;
  { preserved pres(this);

    FileScanner scanner(copy_null_terminated());
  
    if (scanner.fileError)
      return ErrorCodes::os_prim_error(scanner.fileError);

    if (PrintPeriod) {
      lprintf(".");
    }
    if (PrintScriptName) {
      lprintf("reading %s...\n", scanner.fullName());
    }
      
    res = evalExpressions(&scanner);
    currentProcess->cleanup_after_eval_prim(res);
    return res;
  }
}

oop byteVectorOopClass::parseObject_prim(char* fn, oop errorObj, void *FH) {
  ResourceMark rm;
  oop res = NULL;
  fint line, col, len;

  // Check to see if allocation would fail
  // This is a crude check based on the size of the source string,
  // and is only designed to catch evaluation of giant strings.
  // A thorough-going fix would be to have all the inner ops fail if an
  // allocation failed, and propagate this out to the Self level.
  if (Memory->old_gen->bytes_free() - Memory->old_gen->get_VM_reserved_mem()
      < 4 * length()) {
    out_of_memory_failure(FH, 2 * size(), 2 * length());
    return NULL;
  }    

  // need a copy because Eval can cause GC before source is captured.
  const char* source= copy_null_terminated(len);
  
  StringScanner scanner(source, len, fn, 1, 1);
  Parser parser(&scanner, true);
  Object* o = parser.readBody(line, col, source, len);
  if (o == NULL) {
    res = badOop;
  } 
  else {
    preservedObj x(o);
    if (ScavengeInPrimitives && Memory->needs_scavenge()) {
      Memory->scavenge();
    }
    res = o->Eval(false, true, false);
  }

  if (res == failedAllocationOop) {
    out_of_memory_failure(FH, 4*length()); // wild guess
    return NULL;
  }
  if (res == badOop && !NLRSupport::have_NLR_through_C()) {
    parser.fillErrorObj(errorObj);
    prim_failure(FH, PRIMITIVEFAILEDERROR); // receiver had syntax errors
    return NULL;
  }

  currentProcess->cleanup_after_eval_prim(res);
  if (!res->is_mark()) {
    res = res->as_mirror();
  }
  return res;
}


oop byteVectorOopClass::parseObjectIntoPositionTable_prim() {
  ResourceMark rm;
  fint line, col, len;

  // need a copy because Eval can cause GC.
  const char* source= copy_null_terminated(len);

  StringScanner scanner(source, len, "<position table primitive>");
  Parser parser(&scanner, true); // make parser silent (for Klein) 7/04 dmu

  Object* o = parser.readBody(line, col, source, len);
  if (!o)
    return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);

  // Do scavenge if necessary
  preservedObj x(o);
  if (ScavengeInPrimitives && Memory->needs_scavenge()) {
    Memory->scavenge();
  }
  ByteCodePositionTable p(false);
  o->body->GenByteCodes(&p, o);
  oop r = p.Finish();
  if (p.ranOutOfMemory)
    return ErrorCodes::vmString_prim_error(OUTOFMEMORYERROR);

  return r;
}


oop byteVectorOopClass::write_snapshot_prim(void *FH) {
  return full_write_snapshot_prim(Memory->nilObj, this,
                                  Memory->nilObj, Memory->nilObj,
                                  false, FH); }

oop byteVectorOopClass::primitive_documentation_prim(void *FH) {
  ResourceMark rm;
  oop result = primitive_documentation(copy_null_terminated());
  if (result == NULL) prim_failure(FH, PRIMITIVEFAILEDERROR);
  return result;
}


byteVectorOop byteVectorOopClass::verify_opts_prim() {
  return Memory->verifyOpts(copy_c_heap_null_terminated());
}
