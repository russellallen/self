/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


typedef bool (*match_func)( int32* matching_cell, int32 hit_num);

extern "C" {
  // Search for cells in the area ([bottom..top-1]) which match one of
  //  the targets (targets[0..num_targets-1]).
  //  For each match the function f is called. If f at some point
  //  returns false the search is aborted.
  void search_area(int32* bottom,  int32* top,
                   int32* targets, int32  num_targets,
                   match_func f);
  
  //Assembly routine for low level search using at most 
  // Vectorfind_max_targets targets.
  // NB: Sentinel is needed for terminating the search.
  int32* vectorfind_next_match(int32* start,
                               int32* targets, int32 num_targets, 
                               int32* hit_num);
  
  // Maximum number of targets the assembly routine vectorfind_next_match
  // can handle.
  extern int32 Vectorfind_max_targets;
  
  // If more than Vectorfind_max_targets targets is used it is faster
  // to search for all targets in small chunks of size Vector_max_chunk_size
  // due to swapping and caching.
  extern int32 Vectorfind_max_chunk_size;
}

# include "_search_pd.hh.incl"  
