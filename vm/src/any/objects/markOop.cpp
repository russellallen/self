/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "markOop.hh"
# include "_markOop.cpp.incl"

void markOopClass::print() {
  lprintf("Mark#0x%lx: hash: %ld; age: %ld",
         this,  hash(),  age());
  
  if (is_objectMarked()) lprintf("; object_is_marked");
  lprintf("\n");
}

int32 assign_hash(markOop& m) {
  m = m->set_hash(currentProcess->current_hash++);
  return m->hash();
}
