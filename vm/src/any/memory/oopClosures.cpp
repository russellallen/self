/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# include "blockOop.hh"
# include "generation_inline.hh"
# include "oopClosures.hh"
# include "space_inline.hh"

void OopBlockAdjuster::do_oop(oop* p) { 
  blockOop b = (blockOop)*p;
  if (b->is_block() && b->scope(true) == olds) { 
    b->setScope(news);
    b->identity_hash();   /* for debugging; see remap() */
  }
}  
