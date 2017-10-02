#pragma once
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "generation.hh"
# include "oop_inline.hh"



inline bool newGeneration::is_new(memOop p, char *boundary) {
  return (char*)p < boundary; }

inline bool newGeneration::is_new(oop p, char *boundary) {
  return p->is_mem() && is_new(memOop(p), boundary); }

inline void oldGeneration::check_for_low_space() {
  if ((cached_free < lowSpaceThreshold  ||  !reserve_space)  && !lowOnSpace) {
    lowOnSpace= true;
    needToSignalLowOnSpace= true;
    currentProcess->setupPreemption();
  }
}
