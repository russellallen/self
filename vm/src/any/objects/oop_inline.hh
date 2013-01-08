/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


inline Map* oopClass::map() {
  fint t = tag();
  if (t == Int_Tag) {
    return smiOop(this)->map();
  } else if (t == Mem_Tag) {
    return memOop(this)->map();
  } else if (t == Float_Tag) {
    return floatOop(this)->map();
  } else {
    assert(t == Mark_Tag, "unknown tag");
    return markOop(this)->map();
  }
}

inline smi oopClass::identity_hash() {
  fint t = tag();
  if (t == Int_Tag) {
    return smiOop(this)->identity_hash();
  } else if (t == Mem_Tag) {
    return memOop(this)->identity_hash();
  } else if (t == Float_Tag) {
    return floatOop(this)->identity_hash();
  } else {
    assert(t == Mark_Tag, "unknown tag");
    return markOop(this)->identity_hash();
  }
}

inline oop oopClass::relocate() {
  if (is_mem()) {
    return oop(memOop(this)->relocate());
  } else {
    return this;
  }
}

inline bool oopClass::verify_oop(bool expectErrorObj) {
  fint t = tag();
  if (t == Mem_Tag) {
    return memOop(this)->verify_oop(expectErrorObj);
  } else if (t == Mark_Tag) {
    error1("oop 0x%x is a mark", this);
    return false;
  } else {
    return true;
  }
}

inline bool oopClass::verify_oop_mark_ok() {
  if (is_mark()) {
    return true;
  } else {
    return verify_oop();
  }
}

inline oop oopClass::scavenge() {
  if (is_mem()) {
    return memOop(this)->scavenge();
  } else {
    return this;
  }
}

inline oop oopClass::gc_mark() {
  if (is_mem()) {
    return memOop(this)->gc_mark();
  } else {
    return this;
  }
}

inline oop oopClass::gc_mark_derived(oop* ptr, int32 offset) {
  if (is_mem()) {
    return memOop(this)->gc_mark_derived(ptr, offset);
  } else {
    return this;
  }
}

inline oop oopClass::gc_unmark() {
  if (is_mem()) {
    return memOop(this)->gc_unmark();
  } else {
    return this;
  }
}

inline oop oopClass::gc_unmark_derived(oop* ptr) {
  if (is_mem()) {
    return memOop(this)->gc_unmark_derived(ptr);
  } else {
    return this;
  }
}

inline void oopClass::markThisObject() {
  if (is_mem()) memOop(this)->markThisObject();
}
inline void oopClass::unmarkThisObject() {
  if (is_mem()) memOop(this)->unmarkThisObject();
}
inline bool oopClass::is_objectMarked() {
  return is_mem() ? memOop(this)->is_objectMarked() : false;
}

inline int32 oopClass::derived_offset() {
  if (is_mem()) {
    return memOop(this)->derived_offset();
  } else {
    return 0;
  }
}

inline bool oopClass::is_old() {
  return is_mem() && memOop(this)->is_old();
}
inline bool oopClass::is_new() {
  return is_mem() && memOop(this)->is_new();
}

inline generation* oopClass::my_generation() {
  return Memory->generation_containing(this);
}

inline bool oopClass::is_assignment() { return map()->is_assignment();  }
inline bool oopClass::is_block()      { return map()->is_block();       }
inline bool oopClass::is_byteVector() { return map()->is_byteVector();  }
inline bool oopClass::is_map()        { return map()->is_map();         }
inline bool oopClass::is_mirror()     { return map()->is_mirror();      }
inline bool oopClass::is_process()    { return map()->is_process();     }
inline bool oopClass::is_method_like(){ return map()->is_method_like(); }
inline bool oopClass::is_foreign()    { return map()->is_foreign();     }
inline bool oopClass::is_killable()   { return map()->is_killable();    }
inline bool oopClass::is_proxy()      { return map()->is_proxy();       }
inline bool oopClass::is_fctProxy()   { return map()->is_fctProxy();    }
inline bool oopClass::is_vframe()     { return map()->is_vframe();      }
inline bool oopClass::is_objVector()  { return map()->is_objVector();   }
inline bool oopClass::is_slots()      { return map()->is_slots();       }
inline bool oopClass::is_string()     { return map()->is_string();      }
inline bool oopClass::is_profiler()   { return map()->is_profiler();    }

inline bool oopClass::is_programmable_slots() {
  return map()->is_programmable_slots();
}

inline fint oopClass::size() { return map()->object_size(this); }

inline fint oopClass::byte_size() { return map()->object_byte_size(this); }

inline fint oopClass::arg_count() { return map()->arg_count(); }

inline slotDesc* oopClass::find_slot(stringOop name) {
  return map()->find_slot(name);
}
inline slotDesc* oopClass::find_nonVM_slot(stringOop name) {
  return map()->find_nonVM_slot(name);
}

inline oop oopClass::get_slot(slotDesc* slot) {
  return *get_slot_data_address(slot); 
}

inline oop* oopClass::get_slot_data_address(slotDesc* slot) {
  slotType t = slot->type;
  if (t->is_map_slot()) {
    return &slot->data;
  } else {
    assert(t->is_obj_slot(), "cannot get the contents of a non-data slot");
    assert_smi(slot->data, "data slot contents isn't an offset");
    return oopsOop(this)->oops(smiOop(slot->data)->value());
  }
}

inline oop* oopClass::get_slot_data_address(stringOop name) {
  return get_slot_data_address(find_slot(name));
}

inline oop* oopClass::get_slot_data_address_if_present(stringOop name,
                                                       bool &inObj) {
  slotDesc *s= find_slot(name);
  return s ? inObj= s->is_obj_slot(), get_slot_data_address(s) : NULL;
}

inline oop oopClass::get_slot(stringOop name) {
  return *get_slot_data_address(name);
}

inline oop oopClass::add_slots(oop contents, bool new_only, void *FH) {
  return contents->map()->add_slots_to(contents, this, new_only, FH);
}

inline oop oopClass::copy_add_slot(stringOop name,
                                   slotType type,
                                   oop contents,
                                   oop anno,
                                   bool mustAllocate) {
  return map()->copy_add_slot(this, name, type, contents, anno, mustAllocate);
}


inline oop oopClass::copy_remove_slot(stringOop name, bool mustAllocate) {
  return map()->copy_remove_slot(this, name, mustAllocate); }


inline oop oopClass::fix_up_method( oop old_optimized_method,
                                    bool isOKToBashLiteralVector,
                                    bool mustAllocate,
                                    IntBList* stack_deltas) {
  return map()->fix_up_method( this, 
                               old_optimized_method, 
                               isOKToBashLiteralVector,
                               mustAllocate,
                               stack_deltas);
}


inline fint oopClass::length_obj_array() {
  return map()->length_obj_array(this);
}
inline void oopClass::obj_at_put(fint which, oop contents) {
  map()->obj_at_put(this, which, contents);
}

inline char oopClass::byte_at(fint which) {
  return map()->byte_at(this, which);
}

inline bool               oopClass::has_code() { return map()->has_code(); }
inline byteVectorOop      oopClass::codes()    { return map()->codes();    }
inline objVectorOop       oopClass::literals() { return map()->literals(); }
inline stringOop          oopClass::file()     { return map()->file();     }
inline smiOop             oopClass::line()     { return map()->line();     }
inline stringOop          oopClass::source()   { return map()->source();   }
inline MethodKind         oopClass::kind()     { return map()->kind();     }
 
inline bool oopClass::is_enumerable(oop* matching_cell) {
  return map()->is_enumerable(this, matching_cell);
}


inline oop oopClass::clone_into_same_gen(oop obj, bool mustAllocate) {
  return map()->clone(this, mustAllocate, obj);
}
inline oop oopClass::clone(bool mustAllocate) {
  return map()->clone(this, mustAllocate); //"Clone me, Mr. Memory, clone me!" 
}
inline oop oopClass::cloneSize(fint length, bool mustAllocate, oop filler) {
  return map()->cloneSize(this, length, mustAllocate, filler);
}

inline bool oopClass::verify() {
  return map()->verify(this);
}
inline bool oopClass::verifyBytesPart(char*& b) {
  return map()->verifyBytesPart(this, b);
}

inline oop oopClass::mirror_reflectee() {
  return map()->mirror_reflectee(this);
}
inline oop oopClass::mirror_codes() {
  return map()->mirror_codes(this);
}
inline oop oopClass::mirror_literals() {
  return map()->mirror_literals(this);
}
inline oop oopClass::mirror_source() {
  return map()->mirror_source(this);
}
inline oop oopClass::mirror_source_length() {
  return map()->mirror_source_length(this);
}
inline oop oopClass::mirror_source_offset() {
  return map()->mirror_source_offset(this);
}
inline oop oopClass::mirror_file() {
  return map()->mirror_file(this);
}
inline oop oopClass::mirror_line() {
  return map()->mirror_line(this);
}

inline oop oopClass::mirror_contents_at(stringOop name) {
  return map()->mirror_contents_at(this, name);
}
inline oop oopClass::mirror_names() {
  // Note: any callers in primitives must set canWalkStack flag for PPC.
  // Why? This might be a vframeOop and then we will end up calling Process::killVFrameOopsAndSetWatermark
  // which needs to make vframes which needs to have nonvols saved.
  // - dmu 6/99
  return map()->mirror_names(this);
}
inline oop oopClass::mirror_name_at(smi inx) {
  return map()->mirror_name_at(this, inx);
}
inline oop oopClass::mirror_is_parent_at(stringOop name) {
  return map()->mirror_is_parent_at(this, name);
}
inline oop oopClass::mirror_is_argument_at(stringOop name) {
  return map()->mirror_is_argument_at(this, name);
}
inline oop oopClass::mirror_is_assignable_at(stringOop name) {
  return map()->mirror_is_assignable_at(this, name);
}

inline oop oopClass::mirror_sender() {
  return map()->mirror_sender(this);
}
inline oop oopClass::mirror_parent() {
  return map()->mirror_parent(this);
}
inline oop oopClass::mirror_selector() {
  return map()->mirror_selector(this);
}
inline oop oopClass::mirror_bci() {
  return map()->mirror_bci(this);
}
inline oop oopClass::mirror_receiver() {
  return map()->mirror_receiver(this);
}
inline oop oopClass::mirror_expr_stack() {
  return map()->mirror_expr_stack(this);
}
inline oop oopClass::mirror_methodHolder() {
  return map()->mirror_methodHolder(this);
}
inline oop oopClass::mirror_get_annotation() {
  return map()->mirror_get_annotation(this);
}
inline oop oopClass::mirror_copy_set_annotation(oop a,  bool mustAllocate) {
  return map()->mirror_copy_set_annotation(this, a, mustAllocate);
}
inline oop oopClass::mirror_annotation_at(stringOop name) {
  return map()->mirror_annotation_at(this, name); 
}


// killable functions

inline void oopClass::kill() {
  /* NB: It is tempting to test is_live() before calling map->kill() here
     thereby ensuring idempotency. However this fails for processes or any
     other killable thing which dereferences C pointers during is_live():
     after reading in a snapshot, these C pointers are bogus and may cause a
     bus error. */
  map()->kill(this);
  /* Check the contract - after calling kill, the object is no longer live. */
  assert(!is_live(), "should be dead");
}
 
inline bool oopClass::is_live() { return map()->is_live(this); }

inline int32 oopClass::debug_size() { return map()->debug_size(this); }

inline void universe::store(oop* p, oop contents, bool cs) {
  *p = contents;  
  if (cs && contents->is_new()) remembered_set->record_store(p);
}


inline void oopClass::set_slot(slotDesc* sd, oop x) {
  Memory->store(get_slot_data_address(sd), x);
}


