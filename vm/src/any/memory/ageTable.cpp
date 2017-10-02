/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "ageTable.hh"
# include "generation_inline.hh"
# include "space_inline.hh"

ageTable::ageTable() { clear(); }

int32 ageTable::tenure_size(fint age) {
  int32 total = 0;
  for (; age < age_table_size; age ++) {
    total += sizes[age];
  }
  return total;
}

fint ageTable::tenuring_threshold(int32 size) {
  int32 age, total = 0;
  for (age = 1; age < age_table_size; age ++) {
    total += sizes[age];
    if (total > size)
      // zero will promote too much garbage
      return age == 1  ?  1  :  age - 1;
  }
  return age;
}

