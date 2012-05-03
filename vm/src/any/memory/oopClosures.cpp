/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation  "oopClosures.hh"

# include "_oopClosures.cpp.incl"

void OopBlockAdjuster::do_oop(oop* p) { 
  blockOop b = (blockOop)*p;
  if (b->is_block() && b->scope(true) == olds) { 
    b->setScope(news);
    b->identity_hash();   /* for debugging; see remap() */
  }
}  
