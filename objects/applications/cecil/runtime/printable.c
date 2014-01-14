/* Sun-$Revision: 9.1 $ */

# pragma implementation "printable.h"

#include "printable.h"
#include "cecil.h"

void pp(void* p) {
  if (p == NULL) {
    printf("0x0");
  } else if (p == UNINITIALIZED_OOP) {
    printf("UNINITIALIZED");
  } else if (((CecilTaggedPointerClass*)p)->tag() == MemTag) {
    ((CecilTaggedPointerClass*)p)->asBaseObj()->print();
  } else {  // Guess that it's a printable object
    ((Printable*)p)->print();
  }
  printf("\n");
}

void pp_short(void* p) {
  if (p == NULL) {
    printf("0x0");
  } else if (((CecilTaggedPointerClass*)p)->tag() == MemTag) {
    ((CecilTaggedPointerClass*)p)->asBaseObj()->printShort();
  } else {  // Guess that it's a printable object
    ((Printable*)p)->printShort();
  }
}

void Printable::print() {
  printShort();
}

void Printable::printShort() {
  printf("%#lx", this);
}

void Printable::printZero() {
  if (this == NULL) {
    printf("0x0");
  } else {
    print();
  }
}

void Printable::printShortZero() {
  if (this == NULL) {
    printf("0x0");
  } else {
    printShort();
  }
}


