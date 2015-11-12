/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "proxyOop.hh"
#include "_proxyOop.cpp.incl"
#include <sys/mman.h>

// Magic number, stored in proxyOop's cObject field, when it is killed.
// safer to make it smiOop -- dmu
const void *deadProxyObject = (void *)0x109b1500;


bool proxyOopClass::verify() {
  return foreignOopClass::verify() && addr()->type_seal.verify();
}

oop proxyOopClass::allocate_bytes_prim(smi l, void *FH) {
    // This primitive allocates a region on the c heap of
    // the requested size. It also marks the memory
    // as being executable so that we can later call it.

  // Allocate
  // malloc tries to reuse what it thinks are unused parts of allocated pages, which can be clobbered by the VM. 
  // So we ask for completely new pages, at the expense of a little more memory.
  uint32* m = (uint32*) mmap(0, l, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANON, -1, 0);
  
    
  if (m == NULL) {
    // malloc failed
    prim_failure(FH, OUTOFMEMORYERROR);
    return NULL;
  }

  // Set pointer
  foreignOopClass::set_pointer((void*)m);

  // Save size into typeseal and go live
  set_size_of_allocated_memory(l);

  return this;
}

oop proxyOopClass::free_bytes_prim(void *FH){
    // Guards
    if (!is_live()) {
      prim_failure(FH, DEADPROXYERROR);
      return NULL;
    }

    free(foreignOopClass::get_pointer());
    foreignOopClass::kill_foreign();

    return this;
}

oop proxyOopClass::load_bytevector_at_offset_prim(byteVectorOop bv, smi offset, void *FH){
    // Guards
    if (!is_live()) {
      prim_failure(FH, DEADPROXYERROR);
      return NULL;
    }

    char* b =         bv->bytes();
    int   l = (int)   bv->length();
    memcpy((char *)get_pointer() + offset, b, l);
    return this;
}

oop proxyOopClass::read_bytevector_at_offset_prim(byteVectorOop bv, smi offset, void *FH){
    // Guards
    if (!is_live()) {
      prim_failure(FH, DEADPROXYERROR);
      return NULL;
    }

    char* b =         bv->bytes();
    int   l = (int)   bv->length();
    memcpy(b, (char *)get_pointer() + offset, l);
    return this;
}

smi proxyOopClass::get_size_of_allocated_memory_prim(void *FH){
    // Guards
    if (!is_live()) {
      prim_failure(FH, DEADPROXYERROR);
      return NULL;
    }

    return get_size_of_allocated_memory();
}
