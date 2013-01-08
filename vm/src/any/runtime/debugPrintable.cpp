/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "debugPrintable.hh"

# include "_debugPrintable.cpp.incl"

# if  GENERATE_DEBUGGING_AIDS
void pp(void* p) {
  FlagSetting fl(PrintVMMessages, true);
  if (p == NULL) {
    lprintf("0x0");
  } else if (int32(p) < 10000 && int32(p) > -10000) {
    // guess that it's a location
    printLocation(*(Location*) &p); // use addr to silence warning
  } else if (oop(p)->is_mem() || oop(p)->is_mark()) {
    // guess that it's an oop
    oop(p)->print_real();
  } else if (oop(p)->is_float()) {
    // guess that it's a floatOop (C++ objects should be word-aligned)
    oop(p)->print_real();
  } else {
    // guess that it's a VMObj*
    ((VMObj*) p)->print_zero();
  }
  lprintf("\n");
}

void pp_prev(void* p) {
  Unused(p);
}

void pp_next(void* p) {
  Unused(p);
}
#endif

void pp_short(void* p) {
  FlagSetting fl(PrintVMMessages, true);
  if (p == NULL) {
    lprintf("0x0");
  } else if (int32(p) < 10000 && int32(p) > -10000) {
    // guess that it's a location
    printLocation(*(Location*) &p); // extra indirection to silence warning
  } else if (oop(p)->is_mem()) {
    // guess that it's a memOop
    oop(p)->print_real_oop();
  } else {
    // guess that it's a VMObj*
    ((VMObj*) p)->print_short_zero();
  }
}

# if  GENERATE_DEBUGGING_AIDS
void pr(oop p) {
  FlagSetting fl(PrintVMMessages, true);
  p->print_real();
}

void pm(Map* p) {
  FlagSetting fl(PrintVMMessages, true);
  p->print_map();
}
#endif
