/* Sun-$Revision: 9.1 $ */

# pragma implementation "methodTable.h"

# include "cecil.h"
# include "methodTable.h"
# include "lookup.h"
# include <stdio.h>

// define the global method table

MethodTable theMethodTable;


MethodTable::MethodTable() {
  for (int i=0; i<TABLE_SIZE; i++) {
    buckets[i] = NULL;
  }
}


// getMatchingSet returns a set of all of the methods that
// have the same name and number of arguments.

CecilMethodArray* MethodTable::getMatchingSet(int selector, int nargs) {
  TableElement* bucket = buckets[hash(selector, nargs)];
  while (bucket != NULL) {
    CecilMethodArray* mset = bucket->methods;
    if ((*mset)[0]->match(selector, nargs)) {
      return mset;
    }
    bucket = bucket->next;
  }
  return NULL;
}


// add(cmeth) places the method into the set of methods with the 
// same name and number of arguments. It will allocate a new set
// if this is the first member to be inserted.

void MethodTable::add(CecilMethod* cmeth) {
  int selector = cmeth->getSelector();
  int nargs = cmeth->getNumArgs();

  TableElement** bucketLoc = &buckets[hash(selector, nargs)];
  TableElement* bucket = *bucketLoc;
  while (bucket != NULL) {
    CecilMethodArray* mset = bucket->methods;
    if ((*mset)[0]->match(selector, nargs)) {
      mset->add(cmeth);
      return;
    }
    bucket = bucket->next;
  }
  
  CecilMethodArray* mset = new CecilMethodArray;
  mset->add(cmeth);
  *bucketLoc = new TableElement(mset, *bucketLoc);
}


// print() will dump out the table.

void MethodTable::print() {
  printShort();
  for (int i=0; i<TABLE_SIZE; i++) {
    TableElement* bucket = buckets[i];
    while (bucket != NULL) {
      CecilMethodArray* mset = bucket->methods;
      int klen = mset->length();
      for (int k=0; k<klen; k++) {
	CecilMethod* cmeth = (*mset)[k];
	printf("\t");
	cmeth->prettyPrint();
      }
      bucket = bucket->next;
    }
  }
}

void MethodTable::printShort() {
  printf("TheMethodTable 0x%x\n", this);
}
