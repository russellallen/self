/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "slotsOop.hh"
# include "_slotsOop.cpp.incl"

slotsOop create_slots(fint size) {
  oop *p= Memory->alloc_objs(size);
  slotsOop obj = as_slotsOop(p);
  obj->init_mark();
  return obj;
}


// overall scheme for programming prims:
// the ones in mirrorOop just unwrap and call here
// The ones here, just check the basic types and call
// over to the map, where the real work is done.
// The map side may return marks on error.
// -- dmu 1/92

oop slotsOopClass::add_slots_prim(oop contents, void *FH) {
  return add_slots(contents, false, FH);
}

oop slotsOopClass::add_slots_if_absent_prim(oop contents, void *FH) {
  return add_slots(contents, true, FH);
}


// add a slot to the receiver: always functional


oop slotsOopClass::copy_add_slot_prim(stringOop      name,
                                      oop            contents, 
                                      bool           isP,
                                      bool           isA,
                                      oop            anno,
                                      void *FH) {
  ResourceMark rm;
  // primitives can call here with any oop

  if (!is_slots())              return ErrorCodes::vmString_prim_error(  BADTYPEERROR);
  if (!name->is_string())       return ErrorCodes::vmString_prim_error(  BADTYPEERROR);
  if (!name->is_slot_name())    return ErrorCodes::vmString_prim_error( SLOTNAMEERROR);
  
  // Cannot put a block method into a regular method slot; compilers will not work. -- dmu 7/1
  if (contents->has_code()
  &&  contents->kind() == BlockMethodType
  &&  !is_block())
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
    
  if (isA) {
    if (!is_programmable_slots())              return ErrorCodes::vmString_prim_error( BADTYPEERROR);
    if (!is_method_like() || is_assignment())  return ErrorCodes::vmString_prim_error( BADTYPEERROR);
    if (isP)                                   return ErrorCodes::vmString_prim_error(  PARENTERROR);

  }

  slotType type;
  if (isA) {
    type= arg_slotType;
    contents= as_smiOop(arg_count());
    // could be off by one if there's already an arg slot with this name,
    // but copy_add_argument_slot will deal with this.
  } else {
    // specify map slot here; the underlying map op will make it an obj
    // slot if necessary
    type= isP ? parent_map_slotType : map_slotType;
  }
    
  oop result= copy_add_slot_fixing_up_method(name, type, contents, anno);

  if (result == failedAllocationOop) {
    out_of_memory_failure(FH, size()+1);
    return NULL;
  }
  return result;
}


// do rest of prim & provide a place callable with slotType that
//   still fixes lexical_links, etc in methods

oop slotsOopClass::copy_add_slot_fixing_up_method( stringOop      name,
                                                   slotType       t,
                                                   oop            contents,
                                                   oop            anno,
                                                   bool           mustAllocate) {
  oop result=  copy_add_slot(name, t, contents, anno, mustAllocate);
  if (result == failedAllocationOop)
    return result;
  return  result->fix_up_method(this, false, mustAllocate);
}  
     


oop slotsOopClass::remove_slot_prim(stringOop name, void *FH) {
  oop result= copy_remove_slot_prim(name, FH);
  if (result == failedAllocationOop) {
    out_of_memory_failure(FH, size());
    return NULL;
  }
  if (result->is_mark()) return result;
  return define_prim(result, FH);
}

oop slotsOopClass::copy_remove_slot_fixing_up_method( stringOop name,
                                                      bool mustAllocate) {
  oop res= copy_remove_slot(name, mustAllocate);
  return res == failedAllocationOop
    ? res
    : res->fix_up_method(this, false, mustAllocate);
}


// remove all slots from me -- needed to fileOut proxies and such -- dmu 4/93

oop slotsOopClass::remove_all_slots_prim(void *FH) {
  slotsOop result = this;
  Map* m = map();
  FOR_EACH_SLOTDESC(m, slot) {
    if (slot->is_vm_slot()        ) continue; // leave vm slots alone
    oop result2= result->copy_remove_slot_fixing_up_method(slot->name, CANFAIL);
    if (result2 == failedAllocationOop) {
      out_of_memory_failure(FH, size());
      return NULL;
    }
    if (result2->is_mark()) return result2;
    assert_slots(result2, "result of removing slot must be slotsOop");
    result = slotsOop(result2);
  }
  return define_prim(result, FH);
}


oop slotsOopClass::copy_remove_slot_prim(stringOop name, void *FH) {
  if (!is_slots() || !name->is_string()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  oop result= copy_remove_slot_fixing_up_method(name, CANFAIL);
  if (result == failedAllocationOop) {
    out_of_memory_failure(FH, size());
    return NULL;
  }
  return result;
}

oop slotsOopClass::create_block_prim() {
   if (!is_slots()  ||  !is_method_like()  || is_assignment())
     return ErrorCodes::vmString_prim_error(BADTYPEERROR);
   return create_block(this);
 }

// ---------------------------------------------------

# define DO_0(x)
# define DO_1(x) DO_0(x) x(0)
# define DO_2(x) DO_1(x) x(1)
# define DO_3(x) DO_2(x) x(2)
# define DO_4(x) DO_3(x) x(3)
# define DO_5(x) DO_4(x) x(4)
# define DO_6(x) DO_5(x) x(5)
# define DO_7(x) DO_6(x) x(6)
# define DO_8(x) DO_7(x) x(7)
# define DO_9(x) DO_8(x) x(8)

# define COPY_TEMPLATE(x)                                                     \
    ((oop*) b)[x + EMPTY_SLOTS_OOP_SIZE] = ((oop*) p)[x + EMPTY_SLOTS_OOP_SIZE];

# if GENERATE_DEBUGGING_AIDS
#  define ALLOC_CHECK(N)                                                      \
    if (CheckAssertions  &&  b == (slotsOopClass*)catchThisOne) {                                  \
      warning1("clone" #N "_prim caught 0x%lx", b);                           \
    }
# else
#  define ALLOC_CHECK(N)
# endif


# define cloneN(N)                                                            \
  oop CONC3(clone,N,_prim)(slotsOop rcvr) {                                   \
    assert_slots(rcvr, "must clone a slotsOop");                              \
    assert(rcvr->map()->empty_object_size() == EMPTY_SLOTS_OOP_SIZE,          \
           "embedded constants assume this");                                 \
    assert(rcvr->map()->can_inline_clone(), "shouldn't use this function");   \
    slotsOopClass* p = rcvr->addr();                                          \
    const int32 size = sizeof(slotsOopClass)/oopSize + N;                     \
      /* Would be cleaner (but slightly slower in the fast case) to do */     \
      /*  b= Memory->alloc_objs(size); */                                     \
      /*  if (Memory->new_gen->eden_space->contains(b)) ... */                \
    slotsOopClass* b= (slotsOopClass*)                                        \
       Memory->new_gen->eden_space->alloc_objs_local(size);                   \
    slotsOop b1;                                                              \
    if (b) {                                                                  \
      ALLOC_CHECK(N);                                                         \
      b1 = as_slotsOop(b);                                                    \
      b1->init_mark();                                                        \
      COPY_TEMPLATE(-1)                                                       \
      CONC(DO_,N)(COPY_TEMPLATE)                                              \
    } else {                                                                  \
      b = (slotsOopClass*) Memory->alloc_objs(size);                          \
      b1 = as_slotsOop(b);                                                    \
      b1->init_mark();                                                        \
      COPY_TEMPLATE(-1)                                                       \
      CONC(DO_,N)(COPY_TEMPLATE)                                              \
      if (b1->is_old())                                                       \
        Memory->record_multistores(((oop*) b) + EMPTY_SLOTS_OOP_SIZE - 1,     \
                                   ((oop*) b) + EMPTY_SLOTS_OOP_SIZE + N);    \
    }                                                                         \
    return b1;                                                                \
  }


cloneN(0)
cloneN(1)
cloneN(2)
cloneN(3)
cloneN(4)
cloneN(5)
cloneN(6)
cloneN(7)
cloneN(8)
cloneN(9)
