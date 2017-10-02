/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "generation_inline.hh"
# include "mapTable.hh"
# include "slotsMapDeps.hh"
# include "space_inline.hh"

/*
  Invariants:

  1. If CanonicalizeMaps is false, the map table is empty and all maps''
     map_chains are empty.
  2. If CanonicalizeMaps is true and maps_are_canonical_in_snapshot is true, 
       for each map M such that M->should_canonicalize() is true,
     2A.  M is in the map table in the correct bucket.
     2B.  M is only in the map table once.
     2C.  There exist no other maps that are equivalent to M.
*/

// # define MONITOR_MAP_SETTING

# ifdef MONITOR_MAP_SETTING
  static int32 numMapsSet = 0;
  static int32 numMapsMerged = 0;
  static int32 numMapsAdded = 0;
# endif

mapTable::mapTable() {
  for (nmln* p = buckets;  p < &buckets[mapTableSize];  ++p)
    p->init();
  CanonicalizeMaps = true;
}

int32 mapTable::hash(int32 length, VtblPtr_t vtbl_value, slotDesc* slot) {
  long unsigned h= (long unsigned)vtbl_value;  
  
  for (slotDesc* end= slot + length; slot < end; ++slot) {
    h += slot->name->identity_hash();
    h += slot->data->identity_hash();
    h += slot->get_annotation()->identity_hash();
  }

  return h % mapTableSize;
}



nmln* mapTable::bucketFor(slotsMapDeps* m) {
  if (!CanonicalizeMaps  ||  !m->should_canonicalize()) return NULL;
  return &buckets[hash(m->length_slots(), m->vtbl_value(), m->slots())];
}

void mapTable::add(slotsMapDeps* m) {
  assert((m->map_chain()->isEmpty()),
         "map being added should not already point to other maps");  
  nmln* head = bucketFor(m);
  if (head == NULL) return;
  head->add(m->map_chain());
}


# ifdef MONITOR_MAP_SETTINGS
static int32 numEquivCalled = 0;
static int32 numCompareCalled = 0;
# endif

slotsMapDeps* mapTable::equivalent_map(slotsMapDeps* currMap) {
  nmln* head_nmln = bucketFor(currMap);
  if (head_nmln == NULL) return currMap;
  nmln* curr_nmln = head_nmln->next;
  
# ifdef MONITOR_MAP_SETTINGS
  numEquivCalled ++;
# endif
  
  // check if we have gotten to the end of the list
  while (curr_nmln != head_nmln) {
    // if it is an equivalent map, return it
    slotsMapDeps* aMap= map_from_map_chain(curr_nmln);
#   ifdef MONITOR_MAP_SETTINGS
      numCompareCalled++;
#   endif
    if (aMap->compare(currMap)) return aMap;
    curr_nmln = curr_nmln->next;
  }
  return NULL;
}


// return the canonical map for the map arg
// if none, canonicalize the arg and return it

slotsMapDeps* mapTable::canonical_map(slotsMapDeps* m) {
  slotsMapDeps* em= equivalent_map(m);
  if (em) {
#   ifdef MONITOR_MAP_SETTING
      ++numMapsMerged;
#   endif
    return em;
  }
  add(m);
#   ifdef MONITOR_MAP_SETTING
    ++numMapsAdded;
#   endif
  return m;
}

bool mapTable::verify_chain(nmln* head) {
  bool r = true;
  if (!CanonicalizeMaps) {
    if (head->notEmpty()) {
      error1("Bucket %d is not empty", head - buckets);
      r = false;
    }
    return r;
  }

  // first verify the list is okay
  r &= head->verify_list_integrity();        
  
  // now check on members of map list
  for (nmln* curr_nmln= head->next;
       curr_nmln != head;
       curr_nmln= curr_nmln->next) {          
    slotsMapDeps* currMap= map_from_map_chain(curr_nmln);
    if (currMap->has_code()) {
      error1("method map %#lx on map chain", (unsigned long)currMap);
      r = false;
    }
    if (!currMap->enclosing_mapOop()->verify()) {
      error1("nmln %#lx is part of a bogus map", (unsigned long)curr_nmln);
      r = false;
    }
    if (bucketFor(currMap) != head) {
      error1("map %#lx is chained off of the wrong bucket",
             (unsigned long)currMap);
      r = false;
    }
  }
  return r;
}

bool mapTable::verify() {
  bool r = true;
  for (fint i = 0; i < mapTableSize; i++) {
    r &= verify_chain(&buckets[i]);
  }

  // now, do quadratic search (with n log n compare in the inner loop!)
  // to ensure complete canonicalization
  for (fint i= 0; i < mapTableSize; i++) {
    nmln *head= &buckets[i];
    for (nmln *curr_nmln= head->next;
         curr_nmln != head;
         curr_nmln= curr_nmln->next) {          
      slotsMapDeps* currMap= map_from_map_chain(curr_nmln);

      nmln* n= curr_nmln->next;
      for (fint j= i; j < mapTableSize; j++) {
        nmln *head2= &buckets[j];
        if (i != j) n= head2->next;
        for (; n != head2; n= n->next) {
          slotsMapDeps* m= map_from_map_chain(n);
          if (currMap->compare(m)) {
            error3("map 0x%1x is same as map 0x%1x in bucket at 0x%1x", 
                   currMap, m, head);
            r = false;
          }
        }
      }
    }
  }
  return r;
}

void mapTable::print_bucket(int32 bucket_num) {
  nmln* head = &buckets[bucket_num];
  nmln* curr = head->next;
  slotsMapDeps* aMap;
  while (curr != head) {
    aMap = map_from_map_chain(curr);
    aMap->print_map();
    curr = curr->next;
  }
}

// if bug fixes are made here, also make them to the print_histogram
// routine in stringTable.c.
void mapTable::print_histogram() {
  const int32 results_length = 100;
  int32 results[results_length];
  
  // initialize results to zero
  int32 j;
  for ( j = 0; j < results_length; j++) {
    results[j] = 0;
  }

  int32 total = 0;
  int32 min_maps = 0;
  int32 max_maps = 0;
  int32 out_of_range = 0;
  lprintf("%8s %6s\n", "BUCKET", "COUNT");
  int32 i;
  for (i = 0; i < mapTableSize; i++) {
    nmln* head = &buckets[i];
    nmln* curr = head->next;
    int32 counter = 0;
    while (curr != head) {
      counter++;
      total++;
      curr = curr->next;
    }
    if (counter < results_length) {
      results[counter]++;
    } else {
      out_of_range++;
    }
    min_maps = min(min_maps, counter);
    max_maps = max(max_maps, counter);
    if (counter > 0) {
      lprintf("%8d %6d\n", i, counter);
    }
  }
  lprintf("%12s %6d\n", "TOTAL MAPS", total);
  lprintf("%8s %6d\n", "MINIMUM", min_maps);
  lprintf("%8s %6d\n", "MAXIMUM", max_maps);
  lprintf("%8s %6d\n", "AVERAGE", (total / mapTableSize));
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
      int32 j;
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


bool mapTable::verify_map(slotsMapDeps* m) {
  bool r = true;
  slotsMapDeps* em= equivalent_map(m);
  if (!CanonicalizeMaps) {
    if (m->map_chain()->notEmpty()) {
      error1("Map 0x%1x has non-empty map_chain", m);
      r = false;
    }
    return r;
  }
  if (em == NULL) {
    error1("Map 0x%1x is not in the map table", m);
    m->print_map();
    r = false;
  }
  if (em != m  &&  maps_are_canonical_in_snapshot) {
    error2("Map 0x%1x has a duplicate (0x%1x) in the map table", m, em);
     m->print_map();
    em->print_map();
    r = false;
  }
  return r;
}


bool mapTable::set_maps_are_canonical(bool f)
{
  if (CanonicalizeMaps == f) // no change
    return CanonicalizeMaps;

  if (f) { // must find and canonicalize all maps
    warning("In order to reenable map canonicalization, you must restart the VM and read in a snapshot");
    return false;
  } 

  // must clear maps out of table
  for (fint i = 0;  i < mapTableSize;  i++)
    buckets[i].init_chain();
  CanonicalizeMaps = false;
  return true;
}


void mapTable::set_maps_are_canonical_in_snapshot(bool f) {
  maps_are_canonical_in_snapshot = f;
}

void mapTable::add_map_from_snapshot(slotsMapDeps *m) {
  // an optimization
  if (maps_are_canonical_in_snapshot)
    add(m);
  else
    canonical_map(m);
}
