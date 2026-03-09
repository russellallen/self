/* Copyright 2024-2026 Russell Allen.
   See the LICENSE file for license information. */

# pragma implementation "interpreterPICTable.hh"
# include "_interpreterPICTable.cpp.incl"
# include <cstdint>


# if TARGET_IS_64BIT

InterpreterPICTable* interpreter_pic_table = NULL;


InterpreterPICTable::InterpreterPICTable() {
  memset(buckets, 0, sizeof(buckets));
  _count = 0;
}


InterpreterPICTable::~InterpreterPICTable() {
  flush_all();
}


int32 InterpreterPICTable::hash(oop method) {
  // Use oop address shifted right to remove tag bits.
  // Addresses move during GC, so we rebuild after GC.
  uintptr_t h = (uintptr_t)method;
  h = (h >> 3) ^ (h >> 17);
  return (int32)(h % TABLE_SIZE);
}


InterpreterPICData* InterpreterPICTable::lookup(oop method) {
  int32 idx = hash(method);
  for (InterpreterPICData* d = buckets[idx]; d; d = d->next) {
    if (d->method == method)
      return d;
  }
  return NULL;
}


InterpreterPICData* InterpreterPICTable::lookup_or_create(
    oop method, int32 num_codes, u_char* codes) {

  InterpreterPICData* d = lookup(method);
  if (d) return d;

  // Count send sites
  int32 num_sends = 0;
  for (int32 i = 0; i < num_codes; i++) {
    int op = getOp(codes[i]);
    if (op == SEND_CODE || op == IMPLICIT_SEND_CODE)
      num_sends++;
  }
  if (num_sends == 0)
    return NULL;

  // Allocate new entry
  d = (InterpreterPICData*)malloc(sizeof(InterpreterPICData));
  d->method   = method;
  d->num_pics = num_sends;
  d->map_len  = num_codes;

  d->pc_to_pic = (int16_t*)malloc(num_codes * sizeof(int16_t));
  for (int32 i = 0; i < num_codes; i++)
    d->pc_to_pic[i] = -1;

  if (num_sends > INT16_MAX)
    num_sends = INT16_MAX;  // cap to avoid int16_t overflow; excess sends won't be cached

  d->pics = (InterpreterPIC*)malloc(num_sends * sizeof(InterpreterPIC));
  memset(d->pics, 0, num_sends * sizeof(InterpreterPIC));

  // Fill pc_to_pic map
  int32 pic_idx = 0;
  for (int32 i = 0; i < num_codes; i++) {
    int op = getOp(codes[i]);
    if (op == SEND_CODE || op == IMPLICIT_SEND_CODE) {
      if (pic_idx < num_sends)
        d->pc_to_pic[i] = (int16_t)pic_idx;
      pic_idx++;
    }
  }

  // Insert at head of bucket
  int32 idx = hash(method);
  d->next = buckets[idx];
  buckets[idx] = d;
  _count++;

  return d;
}


void InterpreterPICTable::invalidate_all() {
  for (int32 i = 0; i < TABLE_SIZE; i++) {
    for (InterpreterPICData* d = buckets[i]; d; d = d->next) {
      for (int32 j = 0; j < d->num_pics; j++)
        d->pics[j].count = 0;
    }
  }
}


void InterpreterPICTable::flush_all() {
  for (int32 i = 0; i < TABLE_SIZE; i++) {
    InterpreterPICData* d = buckets[i];
    while (d) {
      InterpreterPICData* next = d->next;
      free(d->pc_to_pic);
      free(d->pics);
      free(d);
      d = next;
    }
    buckets[i] = NULL;
  }
  _count = 0;
}


void InterpreterPICTable::rebuild_hash() {
  // Collect all entries, then re-insert.
  // Needed because oop addresses change during GC.
  InterpreterPICData* all = NULL;
  for (int32 i = 0; i < TABLE_SIZE; i++) {
    InterpreterPICData* d = buckets[i];
    while (d) {
      InterpreterPICData* next = d->next;
      d->next = all;
      all = d;
      d = next;
    }
    buckets[i] = NULL;
  }
  while (all) {
    InterpreterPICData* next = all->next;
    int32 idx = hash(all->method);
    all->next = buckets[idx];
    buckets[idx] = all;
    all = next;
  }
}


// Update all oop pointers after scavenging (new-space objects may have moved)
void InterpreterPICTable::scavenge_contents() {
  bool need_rehash = false;
  for (int32 i = 0; i < TABLE_SIZE; i++) {
    for (InterpreterPICData* d = buckets[i]; d; d = d->next) {
      oop old_method = d->method;
      d->method = d->method->scavenge();
      if (d->method != old_method)
        need_rehash = true;

      for (int32 j = 0; j < d->num_pics; j++) {
        InterpreterPIC& pic = d->pics[j];
        for (int32 k = 0; k < pic.count; k++) {
          *(oop*)&pic.entries[k].cachedMap =
              oop(pic.entries[k].cachedMap)->scavenge();
          if (pic.entries[k].cachedMethod)
            pic.entries[k].cachedMethod =
                pic.entries[k].cachedMethod->scavenge();
          if (pic.entries[k].cachedHolder)
            pic.entries[k].cachedHolder =
                pic.entries[k].cachedHolder->scavenge();
        }
      }
    }
  }
  if (need_rehash)
    rebuild_hash();
}


// Mark all oop pointers during mark-sweep GC
void InterpreterPICTable::gc_mark_contents() {
  bool need_rehash = false;
  for (int32 i = 0; i < TABLE_SIZE; i++) {
    for (InterpreterPICData* d = buckets[i]; d; d = d->next) {
      oop old_method = d->method;
      d->method = d->method->gc_mark();
      if (d->method != old_method)
        need_rehash = true;

      for (int32 j = 0; j < d->num_pics; j++) {
        InterpreterPIC& pic = d->pics[j];
        for (int32 k = 0; k < pic.count; k++) {
          *(oop*)&pic.entries[k].cachedMap =
              oop(pic.entries[k].cachedMap)->gc_mark();
          if (pic.entries[k].cachedMethod)
            pic.entries[k].cachedMethod =
                pic.entries[k].cachedMethod->gc_mark();
          if (pic.entries[k].cachedHolder)
            pic.entries[k].cachedHolder =
                pic.entries[k].cachedHolder->gc_mark();
        }
      }
    }
  }
  if (need_rehash)
    rebuild_hash();
}


// Unmark all oop pointers after mark-sweep GC
void InterpreterPICTable::gc_unmark_contents() {
  bool need_rehash = false;
  for (int32 i = 0; i < TABLE_SIZE; i++) {
    for (InterpreterPICData* d = buckets[i]; d; d = d->next) {
      oop old_method = d->method;
      d->method = d->method->gc_unmark();
      if (d->method != old_method)
        need_rehash = true;

      for (int32 j = 0; j < d->num_pics; j++) {
        InterpreterPIC& pic = d->pics[j];
        for (int32 k = 0; k < pic.count; k++) {
          *(oop*)&pic.entries[k].cachedMap =
              oop(pic.entries[k].cachedMap)->gc_unmark();
          if (pic.entries[k].cachedMethod)
            pic.entries[k].cachedMethod =
                pic.entries[k].cachedMethod->gc_unmark();
          if (pic.entries[k].cachedHolder)
            pic.entries[k].cachedHolder =
                pic.entries[k].cachedHolder->gc_unmark();
        }
      }
    }
  }
  if (need_rehash)
    rebuild_hash();
}


// Update any oop that matches 'from' to 'to' (used during programming)
void InterpreterPICTable::switch_pointers(oop from, oop to) {
  bool need_rehash = false;
  for (int32 i = 0; i < TABLE_SIZE; i++) {
    for (InterpreterPICData* d = buckets[i]; d; d = d->next) {
      if (d->method == from) {
        d->method = to;
        need_rehash = true;
      }
      for (int32 j = 0; j < d->num_pics; j++) {
        InterpreterPIC& pic = d->pics[j];
        for (int32 k = 0; k < pic.count; k++) {
          if (oop(pic.entries[k].cachedMap) == from)
            *(oop*)&pic.entries[k].cachedMap = to;
          if (pic.entries[k].cachedMethod && pic.entries[k].cachedMethod == from)
            pic.entries[k].cachedMethod = to;
          if (pic.entries[k].cachedHolder && pic.entries[k].cachedHolder == from)
            pic.entries[k].cachedHolder = to;
        }
      }
    }
  }
  if (need_rehash)
    rebuild_hash();
}

# endif // TARGET_IS_64BIT
