/* Sun-$Revision: 30.15 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "oop.hh"
# pragma implementation "oop_inline.hh"
# pragma implementation "assignmentOop.hh"
# pragma implementation "bits.hh"
# pragma implementation "config.hh"
# pragma implementation "macros.hh"

# include "_oop.cpp.incl"

oop* oopClass::get_slot_data_address_if_present(char *name, bool &inObj) {
  return get_slot_data_address_if_present(new_string(name), inObj); }

smi oopClass::objectID_prim() {
  return getObjectID(this);
}

oop oopClass::clone_prim(void *FH) {
  oop p= clone(CANFAIL);
  if (p == failedAllocationOop) {
    out_of_memory_failure(FH, size());
    return NULL;
  }
  if (ScavengeInPrimitives && Memory->needs_scavenge()) {
    oop r = Memory->scavenge(p);
    return r;
  } else {
    return p;
  }
}

oop oopClass::print_prim() {
  print();
  return Memory->nilObj; // dont return ``this'', printing it may fail!
}

oop oopClass::all_prim(oop lim){ return enumerate_all_objs(lim); }

void oopClass::print_string(char* buf) {
  fint t = tag();
  if (t == Int_Tag) {
    smiOop(this)->print_string(buf);
  } else if (t == Mem_Tag) {
    memOop(this)->print_string(buf);
  } else if (t == Float_Tag) {
    floatOop(this)->print_string(buf);
  } else {
    assert(t == Mark_Tag, "unknown tag");
    markOop(this)->print_string(buf);
  }
}

void oopClass::print_oop() {
  fint t = tag();
  if (t == Int_Tag) {
    smiOop(this)->print_oop();
  } else if (t == Mem_Tag) {
    memOop(this)->print_oop();
  } else if (t == Float_Tag) {
    floatOop(this)->print_oop();
  } else {
    assert(t == Mark_Tag, "unknown tag");
    markOop(this)->print_oop();
  }
}

char* oopClass::debug_print() {
  const int MaxLen = 30;
  fint t = tag();
  char* s = NEW_RESOURCE_ARRAY(char, MaxLen);
  if (t == Int_Tag) {
    sprintf(s, "%ld", long(smiOop(this)->value()));
  } else if (t == Mem_Tag) {
    if      (this == Memory->trueObj)           sprintf(s, "true");
    else if (this == Memory->falseObj)          sprintf(s, "false");
    else if (this == Memory->nilObj)            sprintf(s, "nil");
    else if (this == Memory->lobbyObj)          sprintf(s, "lobby");
    else if (this == Memory->errorObj)          sprintf(s, "!errorObj!");
    else if (this == Memory->deadBlockObj)      sprintf(s, "deadBlock");
    else if (this == Memory->true_mapOop())
      sprintf(s, "true map");
    else if (this == Memory->false_mapOop())
      sprintf(s, "false map");
    else if (this == Memory->nilObj->map()->enclosing_mapOop())
      sprintf(s, "nil map");
    else if (this == Memory->stringObj->map()->enclosing_mapOop() )
      sprintf(s, "string map");
    else if (this == Memory->objVectorObj->map()->enclosing_mapOop() )
      sprintf(s, "objVector map");
    else if (this == Memory->byteVectorObj->map()->enclosing_mapOop() )
      sprintf(s, "byteVector map");
    else if (this == Memory->smi_map->enclosing_mapOop())    sprintf(s, "smi map");
    else if (this == Memory->float_map->enclosing_mapOop())  sprintf(s, "float map");
    else if (is_string()) 
      sprintf(s, "\"%-.*s\"", MaxLen-2,
              stringOop(this)->copy_null_terminated());
    else sprintf(s, "%#lx", long(this));
  } else if (t == Float_Tag) {
    sprintf(s, "%f", floatOop(this)->value());
  } else {
    assert(t == Mark_Tag, "unknown tag");
    sprintf(s, "Mark#%#lx", long(this));
  }
  return s;
}

void oopClass::print_real_oop() {
  FlagSetting f(PrintOopAddress, true);
  print_oop();
}

void oopClass::print() {
  if (is_mark()) {
    markOop(this)->print();
  } else {
    map()->print(this);
  } 
} 

void oopClass::print_real() {
  FlagSetting f(PrintOopAddress, true);
  print();
}

oop scavenge_prim(oop x) {
  BlockProfilerTicks bpt(include_type);
  return Memory->scavenge(x);
}

oop oopClass::garbage_collect_prim() {
  BlockProfilerTicks bpt(include_type);
  return Memory->garbage_collect(this);
}
oop oopClass::tenure_prim() {
  return Memory->tenure(this);
}

oop oopClass::verify_prim() {
  return Memory->verify() ? this : ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
}

 oop oopClass::compact_prim() {
  Memory->code->compactAll();
  return this;
}

oop oopClass::flush_prim() {
  BlockProfilerTicks bpt(include_type);
  Memory->code->flush();
  return this;
}

oop oopClass::flushUnused_prim() {
  Memory->code->flushUnused();
  return this;
}

oop oopClass::markAllUnused_prim() {
  Memory->code->markAllUnused();
  return this;
}

oop oopClass::flush_inline_cache_prim() {
  Memory->code->flush_inline_cache();
  return this;
}

oop oopClass::print_memory_histogram_prim(smi size) {
  Memory->objectSizeHistogram(min(10000, max(size, 0)));
  return this;
}

oop oopClass::print_nmethod_histogram_prim(smi size) {
  Memory->code->print_nmethod_histogram(min(10000, max(size, 0)));
  return this;
}  

oop oopClass::print_memory_prim() {
  printIndent();
  lprintf("Virtual Machine:\n");
  OS::print_memory();
  Memory->print();
  return this;
}

oop oopClass::print_slot_stats_prim() {
  Memory->printSlotDescStats();
  return this;
}

oop oopClass::print_zone_stats_prim() {
  Memory->code->print_stats();
  return this;
}

oop oopClass::manufacturer_prim() {
  return new_string(OS::get_manufacturer_name());
}

oop oopClass::operating_system_prim() {
  ResourceMark rm;
  return new_string(OS::get_operating_system());
}

oop oopClass::credits_prim() {
  lprintf("\nThis product contains Self, which has been brought to you by\n");
  lprintf("Ole Agesen, Lars Bak, Craig Chambers, Bay-Wei Chang, Robert Duvall\n");
  lprintf("Urs Hoelzle, Ole Lehrmann Madsen, John Maloney, Randy Smith,\n");
  lprintf("David Ungar, and Mario Wolczko.\n\n");
  lprintf("The Self Group would like to thank Elgin Lee, James \"kjx\" Noble,\n");
  lprintf("Christine Ahrens, Jeff Dean, Erik Ernst, Ivan Moore, and\n");
  lprintf("Michael Abd-El-Malek for their contributions.\n\n");
  lprintf("Finally, thanks go to Sun Microsystems Laboratories, Stanford University,\n");
  lprintf("and all other organizations that supported Self (in alphabetical order):\n");
  lprintf("Aarhus University, Apple, Cray, the Danish Research Academy, DEC, IBM,\n");
  lprintf("the National Science Foundation, NCR, the Swiss Nationalfonds, Tandem,\n");
  lprintf("Texas Instruments, and Xerox.\n\n");
  lprintf("Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.\n");
  lprintf("See the LICENSE file for license information.\n\n");
  return new_string("Thanks!");
}




static void print_option_primitives(bool);

oop oopClass::print_option_primitives_prim() { 
  print_option_primitives(false); 
  return this;
}

oop oopClass::print_changed_option_primitives_prim() {
  print_option_primitives(true); 
  return this;
}

void print_option_primitives(bool changedOnly) {
# define ListPrimName(                                                        \
    flagName, flagType, flagTypeName, primReturnType,                         \
    initialValue, getCurrentValue, checkNewValue, setNewValue,                \
    explanation, wizardOnly)                                                  \
                                                                              \
    if ( changedOnly                                                          \
      ? ( flagName != initialValue )                                   \
      : (!wizardOnly || WizardMode )         ) {                              \
      lprintf("_%s: %s = %s\n", XSTR(flagName), flagTypeName, explanation);    \
      lprintf("_%s => ", XSTR(flagName));                                      \
    (getCurrentValue)->print_oop();                                           \
    lprintf("\n\n");                                                           \
  }
    
// CodeWarrer cannot handle the following: FOR_ALL_DEBUG_PRIMS(ListPrimName)
// so use:
    FOR_ALL_INTEGER_DEBUG_PRIMS(ListPrimName)
    FOR_ALL_BOOLEAN_DEBUG_PRIMS(ListPrimName)
    FOR_ALL_PROFILING_DEBUG_PRIMS(ListPrimName)
    FOR_ALL_MISC_DEBUG_PRIMS(ListPrimName)

      
#     undef ListPrimName
  }



oop oopClass::quit_prim() {
# if TARGET_IS_PROFILED
    lprintf("Writing profile statistics...\n");
# endif
  OS::terminate(0);
  return NULL;
}

oop bad_prim(oop rcvr) {
  Unused(rcvr);
  return ErrorCodes::vmString_prim_error(PRIMITIVENOTDEFINEDERROR);
}

mirrorOop oopClass::as_mirror(bool mustAllocate) {
  mirrorOop mirror= mirrorOop(map()->mirror_proto()->clone(mustAllocate));
  if (oop(mirror) != failedAllocationOop) mirror->set_reflectee(this);
  return mirror;
}

// used to be one macro, DefineDebugPrim, I had to split it up for MW -- dmu

# define DefineDebugGetPrim(                                                  \
    flagName, flagType, flagTypeName, primReturnType,                         \
    initialValue, getCurrentValue, checkNewValue, setNewValue,                \
    explanation, wizardOnly)                                                  \
                                                                              \
    oop CONC3(get_,flagName,_prim)(oop rcvr)     {                            \
    Unused(rcvr);                                                             \
    return getCurrentValue;                                                   \
  }
# define DefineDebugSetPrim(                                                  \
    flagName, flagType, flagTypeName, primReturnType,                         \
    initialValue, getCurrentValue, checkNewValue, setNewValue,                \
    explanation, wizardOnly)                                                  \
                                                                              \
    oop CONC3(set_,flagName,_prim)(oop rcvr, oop flag) {                      \
    breakpoint();\
    Unused(rcvr); Unused(flag);                                               \
    if (! (checkNewValue)) return ErrorCodes::vmString_prim_error(BADTYPEERROR); \
    oop oldValue = getCurrentValue;                                           \
    setNewValue;                                                              \
    return oldValue;                                                          \
  }

# if COMPILER != MWERKS_COMPILER
  // too big for MWERKS
  FOR_ALL_DEBUG_PRIMS(DefineDebugGetPrim)
  FOR_ALL_DEBUG_PRIMS(DefineDebugSetPrim)
# else
  FOR_ALL_INTEGER_DEBUG_PRIMS(DefineDebugGetPrim)
  FOR_ALL_GEN_BOOLEAN_DEBUG_PRIMS(DefineDebugGetPrim)
  FOR_ALL_SPARC_BOOLEAN_DEBUG_PRIMS(DefineDebugGetPrim)
  FOR_ALL_PPC_BOOLEAN_DEBUG_PRIMS(DefineDebugGetPrim)
  FOR_ALL_I386_BOOLEAN_DEBUG_PRIMS(DefineDebugGetPrim)
  FOR_ALL_SIC_BOOLEAN_DEBUG_PRIMS(DefineDebugGetPrim)
  FOR_ALL_NEW_BOOLEAN_DEBUG_PRIMS(DefineDebugGetPrim)
  FOR_ALL_PROFILING_DEBUG_PRIMS(DefineDebugGetPrim)
  FOR_ALL_MISC_DEBUG_PRIMS(DefineDebugGetPrim)
  
  FOR_ALL_INTEGER_DEBUG_PRIMS(DefineDebugSetPrim)
  FOR_ALL_GEN_BOOLEAN_DEBUG_PRIMS(DefineDebugSetPrim)
  FOR_ALL_SPARC_BOOLEAN_DEBUG_PRIMS(DefineDebugSetPrim)
  FOR_ALL_PPC_BOOLEAN_DEBUG_PRIMS(DefineDebugSetPrim)
  FOR_ALL_I386_BOOLEAN_DEBUG_PRIMS(DefineDebugSetPrim)
  FOR_ALL_SIC_BOOLEAN_DEBUG_PRIMS(DefineDebugSetPrim)
  FOR_ALL_NEW_BOOLEAN_DEBUG_PRIMS(DefineDebugSetPrim)
  FOR_ALL_PROFILING_DEBUG_PRIMS(DefineDebugSetPrim)
  FOR_ALL_MISC_DEBUG_PRIMS(DefineDebugSetPrim)
# endif                               

# undef DefineDebugPrim

// eval method as if self is receiver

oop oopClass::evaluate_in_context_prim(oop method) {
  if ( !NakedMethods && is_method_like()
  ||   is_vframe())
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  
  if (!method->is_method_like()) return method; // like running 17
  if (method->map()->kind() != OuterMethodType) 
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  if (method->arg_count() != 0) return ErrorCodes::vmString_prim_error(ARGUMENTCOUNTERROR);
  
  oop res = currentProcess->runDoItMethod(this, method);
  currentProcess->cleanup_after_eval_prim(res);
  return res;
}

oop unwind_protect_prim(oop doBlock, oop protectBlock) {
  // send "value" to doBlock;
  //   if this msg returns V normally, then return V as result of primitive.
  //   otherwise, msg returns V with non-local return or abort;
  //     send "value: V" to protectBlock;
  //     if this msg returns V', normally or non-locally, then
  //       continue the original nlr/abort with V' as the value being returned.
  //     if this msg aborts, then continue the abort
  //
  //  I think this function may have a BUG! It compiles without switching
  //  stacks. -- dmu

  { // start a scope for the resource mark
    ResourceMark rm;

    assert(NakedMethods || !doBlock->is_method_like(), "shouldn't be a method");
    assert(NakedMethods || !protectBlock->is_method_like(), "shouldn't be a method");

    // this should be valid across calls to self, right?
    abstract_vframe* vf = new_vframe(currentProcess->last_self_frame(false));

    // lookup nmethod for 1st value message send

#   if defined (FAST_COMPILER) || defined(SIC_COMPILER)
#   define makeALookup(theLookup, r, s) \
      cacheProbingLookup theLookup(r, s, NULL, MH_TBD, vf, sendDesc::first_sendDesc(), \
                                   NULL, false)
#   else
#   define makeALookup(theLookup, r, s) \
      simpleLookup theLookup(NormalLookupType, MH_NOT_A_RESEND, r, s, NULL)
#   endif
        
    makeALookup( L, doBlock, VMString[VALUE] );
    
    nmethod* nm = NULL;
    if (Interpret)
      L.perform_full_lookup_n(0);
    else {
#     if defined (FAST_COMPILER) || defined(SIC_COMPILER)
        nm= L.lookupNMethod();
#     else
        ShouldNotReachHere(); // no compilers: must interpret
#     endif
    }
   oop res, arg;
    {
      preserved p(protectBlock);

      // send the first value message
      
      res = L.evaluateResult(&arg, 0, nm);

      protectBlock = p.value;
    }

    if (!NLRSupport::have_NLR_through_C()) {
      // no nlr; just return
      return res;
    }

    // had a NLR; need to invoke protect block with result as arg

    // first, save target of original NLR
    int32 OriginalNLRHomeFromC   = NLRSupport::NLR_home_from_C();
    int32 OriginalNLRHomeIDFromC = NLRSupport::NLR_home_ID_from_C();

    NLRSupport::reset_have_NLR_through_C();    // forget the old NLR, for now

    bool original_aborting = res->is_mark();
    assert( res == badOop  ||  res == 0  ||  OriginalNLRHomeFromC != NULL,
           "if not aborting, must have a how frame");
    
    // lookup nmethod for 2nd value: message send
    makeALookup( Ltwo, protectBlock, VMString[VALUE_] );
                            
    nmethod* nm2 = NULL;
    if (Interpret)
      Ltwo.perform_full_lookup_n(1);
    else {
#     if defined (FAST_COMPILER) || defined(SIC_COMPILER)
      nm2= Ltwo.lookupNMethod();
#     else
        ShouldNotReachHere(); // no compilers: must interpret
#     endif
    }
    oop res2;
    {
      preserved p(res);

      // send the 2nd value: message
      arg =  original_aborting ? Memory->nilObj : res;
      preservedArray p1(&arg, 1); // interp does not scav args
      res2 = Ltwo.evaluateResult(&arg, 1, nm2);
                
      res = p.value;
    }

    // determine target of nlr
    if (NLRSupport::have_NLR_through_C() && NLRSupport::NLR_home_from_C() == 0) {
      // aborting; use that pseudo nlr target
    } 
    else {
      // use original nlr target
      NLRSupport::set_have_NLR_through_C();
      NLRSupport::set_NLR_home_from_C( OriginalNLRHomeFromC );
      NLRSupport::set_NLR_home_ID_from_C ( OriginalNLRHomeIDFromC );
    }

    // determine result value of nlr
    // use original aborting result or new result
    NLRSupport::set_NLR_result_from_C(original_aborting ? res : res2);

    LOG_EVENT2("*3* continuing: NLR=%#lx, ID=%d",
               (unsigned long)NLRSupport::NLR_home_from_C(),
               NLRSupport::NLR_home_ID_from_C());

  } // end scope for the resource mark
  // return non-locally
  NLRSupport::continue_NLR_into_Self(false);

  ShouldNotReachHere(); // NLRSupport::continue_NLR_into_Self() shouldn't return
  return badOop;
}

void oopClass::switch_pointer(oop* where, oop to) {
  map()->switch_pointer(this, where, to);
}

oop oopClass::define(oop contents) {
  return map()->define(this, contents);
}


// 2 ways of looking at define:
//   1. make receiver be a copy of the argument
//   2. redirect all pointers to receiver to point to a copy of the argument

oop oopClass::define_prim(oop contents, void *FH) {
  oop result= define(contents);
  if (result == failedAllocationOop) {
    out_of_memory_failure(FH, contents->size());
    return NULL;
  }
  if (bootstrapping || result->is_mark()) {
    // can't call convert() while creating lobby!
    // (and don't bother incrementing timestamp, either)
    // not worth calling it on failure, either
  } else {
    processes->convert();
    Memory->increment_programming_timestamp(); 
  }
  return result;
}
