/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "search.hh"
# include "_search.cpp.incl"

# undef  MIN
# define MIN(a,b) ((a) < (b) ? (a) : (b) )
# define CHUNK_SIZE (Vectorfind_max_chunk_size/sizeof(smi))



// searches [bottom, top), uses sentinel at *top, but that is OK
//   given how it is called -- dmu

static void search_chunk(smi bottom[],  smi* top,
                         smi targets[], smi num_targets,
                         match_func f) {
  assert( bottom  <=  top, "size of chunk is negative");

  smi *sentinel_cell = top;
  smi saved_value    = *sentinel_cell; // save to undo sentinel;
  smi hit_num;

  smi  start_target = 0;
  bool   proceed      = true;
  while (start_target < num_targets) {
    smi used_targets = MIN(Vectorfind_max_targets, num_targets-start_target);

    for (smi* objp = bottom;
         objp < sentinel_cell && proceed;
         ++objp) {

      *sentinel_cell = targets[start_target]; // place sentinel
      objp = vectorfind_next_match(objp,
                                   &targets[start_target],
                                   used_targets,
                                   &hit_num);

      assert( *objp == targets[hit_num+start_target],
              "Wrong target for match");
      assert( bottom <= objp && objp <= top, "objp outside area");

      *sentinel_cell = saved_value; // restore sentinel_cell

      if (objp == sentinel_cell) // just found sentinel
        break;

      if (!f( objp, hit_num))
        return;
    }
    start_target += used_targets;
  }
}


// searches in [bottom, top)
// uses sentinel, but only within [bottom, top)

void search_area(smi* bottom,  smi* top,
                 smi* targets,  smi num_targets,
                 match_func f) {
  if (bottom >= top )
    return;

  if (num_targets <= Vectorfind_max_targets)
    search_chunk(bottom, top-1, targets, num_targets, f);
  else {
    smi *chunk_bottom  = bottom;
    smi *chunk_top     = MIN(bottom + CHUNK_SIZE, top-1);
    while ( chunk_bottom < top-1 ) {
      search_chunk(chunk_bottom, chunk_top, targets, num_targets, f);
      chunk_bottom = chunk_top;
      chunk_top    = MIN(chunk_bottom + CHUNK_SIZE, top-1);
    }
  }
  // Since the cell top-1 has been checked (sentinel) targets
  //  are checked against contents of top-1.
  for (smi i = 0;  i < num_targets;  ++i) {
    if (*(top-1) == targets[i]) {
      if (!f( top-1, i)) return;
    }
  }
}

# if  ! HAVE_PLATFORM_SEARCH_FUNCTIONS
  // simple C implementation

  smi Vectorfind_max_targets = 1 << 24;       // value isn't really important
  smi Vectorfind_max_chunk_size = 64 * 1024;  // ditto

  smi* vectorfind_next_match(smi* start,
                               smi* targets, smi num_targets,
                               smi* hit_num) {
    for ( ; ; ++start) {
      for (smi index = 0; index < num_targets; ++index) {
        if (*start == targets[index]) { *hit_num = index; return start; }
      }
    }
  }

  extern "C" {
    // enumeration:   // simple C implementation

    oop* find_this_object(oop* middle) {
      for ( ; !(*middle)->is_mark(); --middle) {} return middle; }

    oop* find_next_object(oop* middle) {
     for ( ++middle; !(*middle)->is_mark(); ++middle) {} return middle; }

    oop* find_prior_reference(oop* middle, oop target) {
     for ( ; (*middle) != target; --middle) {} return middle; }
  }

# endif
