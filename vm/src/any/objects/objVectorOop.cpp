/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "enumeration.hh"
# include "glueSupport.hh"
# include "label_inline.hh"
# include "mirrorOop.hh"
# include "objVectorMap.hh"
# include "objVectorOop.hh"
# include "proxyOop.hh"
# include "slotDesc.hh"
# include "vframe.hh"
# include "vframeOop.hh"
# include "vmStrings.hh"

objVectorOop objVectorOopClass::grow(fint delta, bool mustAllocate) {
  objVectorOop v= (objVectorOop) slotsOopClass::grow(size(), delta,
                                                     mustAllocate);
  if (oop(v) != failedAllocationOop) v->set_length(length() + delta);
  return v;
}

objVectorOop objVectorOopClass::shrink(fint delta, bool mustAllocate) {
  objVectorOop v= (objVectorOop) slotsOopClass::shrink(size(), delta,
                                                       mustAllocate);
  if (oop(v) != failedAllocationOop) v->set_length(length() - delta);
  return v;
}

objVectorOop objVectorOopClass::create_objVector(oop parent) {
  slotList* slist = new slotList(VMString[PARENT],
                                 parent_map_slotType,
                                 parent); 
  return ::create_objVector(slist);
}

objVectorOop objVectorOopClass::create_objVector(fint size) {
  objVectorOop obj = (objVectorOop) create_slots(size);
  obj->set_length(0);
  return obj;
}

bool objVectorOopClass::verify() {
  bool flag = slotsOopClass::verify();
  if (flag) {
    int32 l = length();
    if (l < 0) {
      error1("objVectorOop 0x%lx has negative length", this);
      flag = false;
    }
  }
  return flag;
}

oop objVectorOopClass::ov_size_prim(oop rcvr) {
  if (!rcvr->is_objVector()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  return as_smiOop(objVectorOop(rcvr)->length());
}

oop objVectorOopClass::ov_at_prim(oop rcvr, oop indexOop) {
  if (!rcvr->is_objVector())
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  if (!indexOop->is_smi())
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  smi index = smiOop(indexOop)->value();
  if (unsigned(index) >= unsigned(objVectorOop(rcvr)->length()))
    return ErrorCodes::vmString_prim_error(BADINDEXERROR);
  return objVectorOop(rcvr)->obj_at(index);
}

oop objVectorOopClass::ov_at_put_prim(oop rcvr, oop indexOop, oop contents) {
  if (!rcvr->is_objVector()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  if (!indexOop->is_smi()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  smi index = smiOop(indexOop)->value();
  if (unsigned(index) >= unsigned(objVectorOop(rcvr)->length()))
    return ErrorCodes::vmString_prim_error(BADINDEXERROR);
  objVectorOop(rcvr)->obj_at_put(index, contents);
  return rcvr;
}

oop objVectorOopClass::ov_clone_prim(smi size, oop filler, void *FH) {
  oop c= cloneSize(size, CANFAIL, filler);
  if (c == failedAllocationOop) {
    out_of_memory_failure(FH, map()->empty_object_size() + size);
    return NULL;
  }    
  // test for scavenging
  if (ScavengeInPrimitives && Memory->needs_scavenge()) {
    return Memory->scavenge(c);
  } else {
    return c;
  }
}

oop objVectorOopClass::methodPointer() {
  slotDesc* methodPointerSlot = find_slot( VMString[METHOD_POINTER]);
  return methodPointerSlot != NULL
    ? get_slot(methodPointerSlot)
    : badOop;
}

oop objVectorOopClass::ov_methodPointer_prim() {
  oop mp = methodPointer();
  return mp != badOop
    ? mp->as_mirror()
    : (oop)ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
}

oop objVectorOopClass::ov_references_prim(oop limit) {
  return referencesEnumeration::enumerate_vector_references( this, limit);
}

oop objVectorOopClass::ov_implementors_prim(oop limit) {
  return implementorsEnumeration::enumerate_vector_implementors( this, limit);
}

int32* objVectorOopClass::convertIntArray() {
  oop*   src    = objs();
  oop*   end    = src + length();
  int32* result = NEW_RESOURCE_ARRAY( int32, length());
  int32* dst    = result;
  while (src < end) {
    oop s = *src++;
    if (!s->is_smi())
      return NULL;
    *dst++ = smiOop(s)->value();
  }
  return result;
}


short* objVectorOopClass::convertShortArray() {
  oop*   src    = objs();
  oop*   end    = src + length();
  short* result = NEW_RESOURCE_ARRAY( short, length());
  short* dst    = result;
  while (src < end) {
    oop s = *src++;
    if (!s->is_smi())
      return NULL;
    int32 v = smiOop(s)->value();
    if (int32(short(v)) != v)
      return NULL;
    *dst++ = short(v);
  }
  return result;
}


unsigned short* objVectorOopClass::convertUnsignedShortArray() {
  oop*   src    = objs();
  oop*   end    = src + length();
  unsigned short* result = NEW_RESOURCE_ARRAY( unsigned short, length());
  unsigned short* dst    = result;
  while (src < end) {
    oop s = *src++;
    if (!s->is_smi())
      return NULL;
    int32 v = smiOop(s)->value();
    if (int32((unsigned short)v) != v)
      return NULL;
    *dst++ = (unsigned short)v;
  }
  return result;
}


float* objVectorOopClass::convertFloatArray() {
  oop*   src    = objs();
  oop*   end    = src + length();
  float* result = NEW_RESOURCE_ARRAY( float, length());
  float* dst    = result;
  while (src < end) {
    oop s = *src++;
    if (s->is_smi())
      *dst++ = float(smiOop(s)->value());
    else if (s->is_float())
      *dst++ = floatOop(s)->value();
    else
      return NULL;
  }
  return result;
}


void* objVectorOopClass::convertProxyArray(const void* seal) {
  oop*   src    = objs();
  oop*   end    = src + length();
  void** result = NEW_RESOURCE_ARRAY( void*, length());
  void** dst    = result;
  while (src < end) {
    oop s = *src++;
    proxyOop p = proxyOop(s);
    if ( !s->is_proxy()  
    ||   !p->is_live()  
    ||    p->get_type_seal() != seal)
      return NULL;

    *dst++ = proxyOop(s)->get_pointer();
  }
  return result;
}
