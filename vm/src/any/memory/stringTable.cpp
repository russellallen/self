/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "stringTable.hh"
# include "_stringTable.cpp.incl"

# define FOR_ALL_ENTRIES(entry) \
  for (entry = firstBucket(); entry <= lastBucket(); entry ++)

# define FOR_ALL_STRING_ADDR(bucket, var, code)                         \
    { if (bucket->is_string()) {                                        \
         var = (stringOop*) bucket; code;                               \
      } else {                                                          \
        for (stringTableLink* l = bucket->get_link(); l; l = l->next) { \
          var = &l->string; code;                                       \
        }                                                               \
      }                                                                 \
    }


int32 hash(const char* name, int32 len) {
  // hash on at most 32 characters, evenly spaced
  int32 increment;
 
  if (len < 32) {
    increment = 1;
  } else {
    increment = len >> 5;
  }
 
  // hashpjw from Dragon book (ASU p. 436), except increment differently
 
  assert(BitsPerByte * BytesPerWord == 32, "assumes 32-bit words");
  long unsigned h = 0;
  long unsigned g;
  const char* s = name;
  const char* end = s + len;
  for (; s < end; s = s + increment) {
    h = (h << 4) + (long unsigned) *s;
    g = h & 0xf0000000;
    if (g) h ^= g | (g >> 24);
  }
  return h;

}

stringTable::stringTable() {
  for (int32 i = 0; i < string_table_size; i ++) buckets[i].clear();
  free_list = first_free_link = end_block = NULL;
}

stringOop stringTable::basic_add(const char *name, int32 len, int32 hashValue,
                                 bool mustAllocate) {
  stringOop str= make_string(name, len, mustAllocate);
  if (oop(str) != failedAllocationOop) basic_add(str, hashValue);
  return str; }

stringOop stringTable::lookup(const char* name, int32 len, bool mustAllocate) {
  int32 hashValue = hash(name, len);
  stringTableEntry* bucket = bucketFor(hashValue);
  if (bucket->is_string()) {
    if (bucket->get_string()->equals(name, len)) return bucket->get_string();
    return basic_add(name, len, hashValue, mustAllocate);
  } else {
    if (!bucket->get_link())
      return basic_add(name, len, hashValue, mustAllocate);
    for (stringTableLink* l = bucket->get_link(); l; l = l->next) {
      if (l->string->equals(name, len)) {
        return l->string;
      }
    }    
  }
  return basic_add(name, len, hashValue, mustAllocate);
}

void stringTable::add(stringOop s) {
  assert(s->is_string(),
         "adding something that's not a string to the string table");
  assert(s->is_old(), "all strings should be tenured");
  int32 hashValue = hash(s->bytes(),  s->length());
  basic_add(s, hashValue);
}

stringOop stringTable::basic_add(stringOop s, int32 hashValue) {
  assert(s->is_string(),
         "adding something that's not a string to the string table");
  assert(s->is_old(), "all strings should be tenured");
  // Canonical strings must have a hash value (for _IdentityHash) that
  // is a pure function of the chars in the string.  Otherwise, their
  // hash value would change when they are discarded by a GC and re-
  // created later.
  assert(s->mark()->hash() == no_hash, "should not have a hash yet");
  s->set_mark(s->mark()->set_hash(hashValue));
  assert(s->mark()->hash() != no_hash, "should have a hash now");

  stringTableEntry* bucket = bucketFor(hashValue);
  stringTableLink*  old_link;
  if (bucket->is_string()) {
    old_link = Memory->string_table->new_link(bucket->get_string());
  } else {
    old_link = bucket->get_link();
  }
  bucket->set_link(Memory->string_table->new_link(s, old_link));
  return s;
}

void stringTable::switch_pointers(oop from, oop to) {
  if (! from->is_string()) return;
  assert(to->is_string(),
         "cannot replace a string with a non-string");

  findSlotCache.clear();
  stringTableEntry* e;
  FOR_ALL_ENTRIES(e) {
    stringOop* addr;
    FOR_ALL_STRING_ADDR(e, addr, SWITCH_POINTERS_TEMPLATE(addr));
  }
}

void stringTable::gc_mark_contents() {
  // throw out unreachable strings
  stringTableEntry* e;
  FOR_ALL_ENTRIES(e) { 
    if (e->is_string()) {
      if (!e->get_string()->is_gc_marked()) e->clear();
      else MARK_TEMPLATE((stringOop*) e);
    } else {
      stringTableLink* l = e->get_link(), **p = (stringTableLink**) e; 
      while (l) {
        if (!l->string->is_gc_marked()) {
          // unreachable; remove from table
          stringTableLink* d = l;
          *p = l = l->next;
          d->next = NULL;
          Memory->string_table->delete_link(d);
        } else {
          MARK_TEMPLATE(&l->string);
          p = &l->next;
          l = *p;
        }
      }
      if (e->length() == 1) {
        // Compact the bucket
        stringTableLink* l_ = e->get_link();
        e->set_string(l_->string);
        Memory->string_table->delete_link(l_);
      }
    }
  }
}

void stringTable::gc_unmark_contents() {
  stringTableEntry* e;
  FOR_ALL_ENTRIES(e) {
    stringOop* addr;
    FOR_ALL_STRING_ADDR(e, addr, UNMARK_TEMPLATE(addr));
  }
}

#ifdef UNUSED
void stringTableEntry::deallocate() {
  if(!is_string() && get_link()) 
    Memory->string_table->delete_link(get_link());
}
#endif

bool stringTableEntry::verify(fint i) {
  bool flag = true;
  if (is_string()) {
    if (!get_string()->is_string()) {
      error1("entry 0x%lx in string table isn't a string", get_string());
      flag = false;
    }
  } else {
    if (get_link()) flag = get_link()->verify(i);
  }
  return flag;
}

bool stringTable::verify() {
  bool r = findSlotCache.verify();
  for (fint i = 0; i < string_table_size; i ++)
    if (!buckets[i].verify(i)) {
      lprintf("\tof bucket %ld of string table\n", long(i));
      r = false;
    }
  return r;
}

void stringTable::read_snapshot(FILE* file) {
  stringTableEntry* e;
  // Read entries
  FOR_ALL_ENTRIES(e) {
    int32 len = 0;
    OS::FRead_swap(&len, sizeof(int32), file);
    if (len == 0) e->clear();
    else {
      stringOop s;
      OS::FRead_swap(&s, oopSize, file);
      if (len == 1) e->set_string(s);
      else {
        stringTableLink* head = Memory->string_table->new_link(s);
        stringTableLink* tail = head;
        for (; len > 1; len --) {
          OS::FRead_swap(&s, oopSize, file);
          tail->next = Memory->string_table->new_link(s);
          tail       = tail->next;
        }
        e->set_link(head);
      }
    }
  }
}

void stringTable::write_snapshot(FILE* file) {
  stringTableEntry* e;
  FOR_ALL_ENTRIES(e) {
    stringOop* addr;
    int32 len = e->length();
    OS::FWrite(&len, sizeof(int32), file);
    FOR_ALL_STRING_ADDR(e, addr, OS::FWrite(addr, oopSize, file));
  }
}

void stringTable::relocate() {
  stringTableEntry* e;
  FOR_ALL_ENTRIES(e) {
    stringOop* addr;
    FOR_ALL_STRING_ADDR(e, addr, RELOCATE_TEMPLATE(addr));
  }
}

bool stringTableLink::verify(fint i) {
  bool flag = true;
  for (stringTableLink* l = this; l; l = l->next) {
    if (! l->string->is_string()) {
      error1("entry 0x%lx in string table isn't a string", l->string);
      flag = false;
    } else if (hash(l->string->bytes(), l->string->length()) 
               % string_table_size != i) {
      error1("entry 0x%lx in string table has wrong hash value", l->string);
      flag = false;
    } else if (!l->string->is_old()) {
      error1("entry 0x%lx in string table isn't tenured", l->string);
      flag = false;
    }
  }
  return flag;
}

fint stringTableEntry::length() {
  if (is_string()) return 1;
  if (!get_link()) return 0;
  fint count = 0;
  for (stringTableLink* l = get_link(); l; l = l->next) count ++;
  return count;
}

stringTableLink* stringTable::new_link(stringOop s, stringTableLink* n) {
  stringTableLink* res;
  if (free_list) {
    res = free_list;
    free_list = free_list->next;
  } else {
    const fint block_size = 500;
    if (first_free_link == end_block) {
      first_free_link = NEW_C_HEAP_ARRAY(stringTableLink, block_size);
      end_block = first_free_link + block_size;
    }
    res = first_free_link++;
  } 
  res->string = s;
  res->next   = n;
  return res;
}

void stringTable::delete_link(stringTableLink* l) {
  // Add the link to the freelist
  stringTableLink* end = l;
  while(end->next) end = end->next;
  end->next = free_list;
  free_list = l;
}

// much of this comes from the print_histogram routine in mapTable.c,
// so if bug fixes are made here, also make them in mapTable.c.
void stringTable::print_histogram() {
  const int32 results_length = 100;
  int32 results[results_length], i, j;
  
  // initialize results to zero
  for (j = 0; j < results_length; j++) {
    results[j] = 0;
  }

  int32 total = 0;
  int32 min_strings = 0;
  int32 max_strings = 0;
  int32 out_of_range = 0;
  lprintf("%8s %6s\n", "BUCKET", "COUNT");
  for (i = 0; i < string_table_size; i++) {
    stringTableEntry curr = buckets[i];
    int32 counter = curr.length();
    total += counter;
    if (counter < results_length) {
      results[counter]++;
    } else {
      out_of_range++;
    }
    min_strings = min(min_strings, counter);
    max_strings = max(max_strings, counter);
  }
  lprintf("%14s %6d\n", "TOTAL STRINGS", total);
  lprintf("%8s %6d\n", "MINIMUM", min_strings);
  lprintf("%8s %6d\n", "MAXIMUM", max_strings);
  lprintf("%8s %6d\n", "AVERAGE", (total / string_table_size));
  lprintf("%20s\n", "HISTOGRAM");
  lprintf("%14s %30s\n", "LENGTH", "NUMBER CHAINS THAT LENGTH");
  for (i = 0; i < results_length; i++) {
    if (results[i] > 0) {
      lprintf("%14d %20d\n ", i, results[i]);
    }
  }
  int32 line_length = 70;    
  lprintf("%14s %30s\n", "LENGTH", "NUMBER CHAINS THAT LENGTH");
  for (i = 0; i < results_length; i++) {
    if (results[i] > 0) {
      lprintf("%4d", i);
      for (j = 0; (j < results[i]) && (j < line_length);  j++) {
        lprintf("%1s", "*");
      }
      if (j == line_length) {
        lprintf("%1s", "+");
      }
      lprintf("\n");
    }
  }  
  lprintf("%30s %5d %20d\n", "NUMBER CHAINS LONGER THAN",
         results_length, out_of_range);
}
