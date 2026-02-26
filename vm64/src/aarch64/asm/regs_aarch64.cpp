# if TARGET_ARCH == AARCH64_ARCH
/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

/* Minimal register function implementations for aarch64 (interpreter-only). */

# include "_regs_aarch64.cpp.incl"

const char* RegisterNames[] = { "*UnAllocated*" };

Location TempRegs[] = {};
fint RegToTempNo[] = {};
Location CalleeSavedRegs[] = {};


const char *locationName(Location l) {
  const char* c;
  int num;

       if ( is_IArgLocation(l)) {   c = "I";  num = index_for_IArgLocation(l); }
  else if ( is_LArgLocation(l)) {   c = "L";  num = index_for_LArgLocation(l); }
  else if ( is_ArgLocation(l))  {   c = "";   num = index_for_ArgLocation(l); }
  else if ( is_StackLocation(l)){   c = "S";  num = index_for_StackLocation(l); }
  else if ( l == IReceiverReg ) {   c = "I";  num = -1; }
  else if ( l == LReceiverReg ) {   c = "L";  num = -1; }
  else if ( l == ReceiverReg )  {   c = "R";  num = -1; }
  else {
    return "*unknown*";
  }
  char* s = new char[30];
  sprintf(s, "%s%ld", c, long(num));
  return s;
}


void regs_amd64_init() {
  // No JIT register setup on aarch64
}

# endif // TARGET_ARCH == AARCH64_ARCH
