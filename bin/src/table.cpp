/* Sun-$Revision: 30.6 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation

# include <stdio.h>
# include <string.h>
# include "table.hh"

int hash(char* name, int len) {
  // hash on at most 16 characters, evenly spaced
  int increment;
  
  if (len < 16) {
    increment = 1;
  } else {
    increment = len >> 4;
  }
  
  // hashpjw from Dragon book (ASU p. 436), except increment differently
  
  long unsigned h = 0;
  long unsigned g;
  char* s = name;
  char* end = s + len;
  for (; s < end; s = s + increment) {
    h = (h << 4) + (long unsigned) *s;
    if (g = h & 0xf0000000) h ^= g | (g >> 24);
  }
  return h % string_table_size;
}

stringTable::stringTable() {
  for (int i = 0; i < string_table_size; i ++) buckets[i] = 0;
}

stringNode* stringTable::lookup(char* name) {
  int hashValue = hash(name, strlen(name));
  stringNode** bucket = &buckets[hashValue];
  for (stringNode* l = *bucket; l; l = l->next) {
    if ( strcmp( l->string, name) == 0 ) {
      return l;
    }
  }
  return NULL;
}

void stringTable::add(char* string, char *version) {
  int hashValue = hash(string,  strlen( string));
  stringNode** bucket = &buckets[hashValue];
  *bucket = new stringNode(string, version, *bucket);
}

int stringTable::enumerate( node_func f) {
  int count = 0;
  for (int i = 0; i < string_table_size; i++)
    for (stringNode* l = buckets[i]; l; l = l->next) {
      count++;
      if (!f( l)) return count; 
    }
  return count; 
}
