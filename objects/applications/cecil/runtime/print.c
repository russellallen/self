/* Sun-$Revision: 9.1 $ */

# include "printable.h"
# include "cecil.h"

void printChar(char c) {
  switch (c) {
   case '\n':
    printf("\\n");
    break;
   case '\t':
    printf("\\t");
    break;
   default:
    if (((int)c >= 32) && ((int)c <= 126)) {
      printf("%c", c);
    } else {
      printf("\\%d", (int)c);
    }
  }
}

void CecilTaggedPointerClass::printShort() {
  printf("OOP 0x%x: ", this);
  if (isInt()) {
    printf("%d", unBoxInteger(this));
  } else if (this == UNINITIALIZED_OOP) {
    printf("UNINITIALIZED_OOP");
  } else {
    asBaseObj()->printShort();
  }
}

void CecilTaggedPointerClass::print() {
  printf("OOP 0x%x: ", this);
  if (isInt()) {
    printf("%d", unBoxInteger(this));
  } else if (this == UNINITIALIZED_OOP) {
    printf("UNINITIALIZED_OOP");
  } else {
    asBaseObj()->print();
  }
}

void CecilBaseObject::printHeader(char* typeString) {
  char* n = name();
  printf("%s(%s) 0x%x", typeString, n ? n : "No name", this);
}

OOP CecilBaseObject::basicPrintString() {
  return makeStringObj("No basicPrintString defined");
}

void CecilBaseObject::printShort() {
  printHeader("CecilBaseObject");
}

void CecilMemoryObject::printShort() {
  printHeader("CecilMemoryObject");
}

void CecilFloatObject::printShort() {
  printHeader("CecilFloatObject");
  printf(" (%f)", value);
}

OOP CecilFloatObject::basicPrintString() {
  char s[80];
  sprintf(s, "%f", value);
  return makeStringObj(s);
}

void CecilCharObject::printShort() {
  printHeader("CecilCharObject");
  printf(" ('%c':%d)", ch, ch);
}

OOP CecilCharObject::basicPrintString() {
  char s[2];
  s[0] = ch;
  s[1] = '\0';
  return makeStringObj(s);
}

void CecilImmutableStringObject::printShort() {
  printHeader("CecilImmutableStringObject");
}

void CecilMutableStringObject::printShort() {
  printHeader("CecilMutableStringObject");
}

void CecilArrayObject::printShort() {
  printHeader("CecilArrayObject");
}

void CecilClosureObject::printShort() {
  printHeader("CecilClosureObject");
}

void CecilClosureObject::print() {
  printShort();
  printf("\nEnvironment: 0x%x", environment);
}

void CecilBaseObject::print() {
  CecilMap* m = map();
  printShort();
  printf("\nmap: ");
  m->printShort();
  printf("\nparents: ");
  m->printParents();
}

void CecilMemoryObject::print() {
  CecilMap* m = map();
  CecilBaseObject::print();
  int numF = m->fields.length();
  if (numF > 0) printf("\n%d fields:\n", numF);
  for (int f = 0; f < numF; f++) {
    FieldEntry* fEntry = m->fields[f];
    printf("\t%s, offset %d: ", fEntry->fieldName, fEntry->offset);
    OOP p = ((OOP)(&numFields)[fEntry->offset+1]);
    p->printShort();
    printf("\n");
  }
}

void CecilStringObject::print() {
  printShort();
  printf("\n\tlen = %d, bytes = \"", numBytes);
  char* s = bytes();
  for (int i = 0; i < numBytes; i++) {
    printChar(s[i]);
  }
  printf("\"\n");
}

void CecilArrayObject::print() {
  printShort();
  printf("\n\tlen = %d, elements:\n", numElements);
  OOP* e = elements();
  for (int i = 0; i < numElements; i++) {
    printf("\n\t[%d] = ", i);
    e[i]->printShort();
  }
}

void FieldEntry::printShort() {
  printf("('%s'->%d)", fieldName, offset);
}

void CecilMap::printParents() {
  parents->printShort();
}

void CecilMap::printShort() {
  printf("CecilMap 0x%x", this);
}

void CecilMap::print() {
  printShort();
  printf("\nparents: ");
  parents->printShort();
  printf("\nfields: ");
  fields.printShort();
  if (predicateTest) {
    printf("\npredicateTest: %0lx", predicateTest);
  }
}

void CecilEnv::printShort() {
  printf("CecilEnv 0x%x, dynamic: 0x%x, static: 0x%x, %d locals",
	 this, dynamicEnv, staticEnv, numLocals);
}

void CecilEnv::print() {
  printShort();
  OOP* l = locals();
  for (int i = 0; i < numLocals; i++) {
    printf("\n\tlocal %d: 0x%x", i, l[i]);
  }
}
