#pragma once
/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "mapOop.hh"
# include "memOop_inline.hh"
# include "universe.hh"



inline space* universe::survivor_space(memOop p,
                                       fint size,
                                       fint bsize,
                                       bool &is_new) {
  if (p->mark()->age() < tenuring_threshold /* young */
          && new_gen->to_space->would_fit(size, bsize)) {
        is_new= true;
        return new_gen->to_space;
  } else {
    is_new= false;
    return old_gen->tenuring_space_for(size, bsize);
  } 
}

inline Map *universe:: true_map()      { return oop( trueObj)->map(); }
inline Map *universe::false_map()      { return oop(falseObj)->map(); }

