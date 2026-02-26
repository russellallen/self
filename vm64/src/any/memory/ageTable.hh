/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// Age table for feedback-mediated tenuring (generation scavenging).

const int32 age_table_size = age_mask + 1;

class ageTable: public CHeapObj {
 public:
  // instance variables
  int32 sizes[age_table_size];
  
  // constructor
  ageTable();
  
  // operations
  void clear() { set_words(sizes, age_table_size, 0); }
  void add(memOop p) {
    int32 age = p->mark()->age();
    assert(age >= 0 && age < age_table_size, "invalid age of object");
    sizes[age] += p->size(); }
  
  int32 tenure_size(fint age);
  fint tenuring_threshold(int32 size);
};
