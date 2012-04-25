/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "vframeMap.hh"
# include "_vframeMap.cpp.incl"

// all routines that call this macro that are called by primitives must
// have the canWalkStack flag set in the primitive table so the
// nonvols will be saved for the vframe creation -- dmu 6/99

# define TEST                                                                 \
    ResourceMark rm;                                                          \
    vframeOop vfo = vframeOop(obj);                                           \
    if (!vfo->is_live()) return ErrorCodes::vmString_prim_error(NOACTIVATIONERROR);  \
    /* must check for dead vfos if current process */                         \
    if (vfo->process() == currentProcess)                                     \
      currentProcess->killVFrameOopsAndSetWatermark(NULL);

# define SLOTS_PRIM(name)                                                     \
    oop vframeMap::name(oop obj,  stringOop nam) {                            \
    TEST;                                                                     \
    return vfo->method()->name(nam);                                          \
  }                                                                           \
    
oop vframeMap::mirror_names(oop obj) {
  TEST;
  return vfo->method()->mirror_names();
}

oop vframeMap::mirror_name_at(oop obj, smi inx) {
  TEST;
  return vfo->method()->mirror_name_at(inx);
}

SLOTS_PRIM(mirror_is_parent_at)
SLOTS_PRIM(mirror_is_argument_at)
SLOTS_PRIM(mirror_is_assignable_at)

void vframeMap::kill(oop vfp)    { vframeOop(vfp)->kill_vframe(); }
bool vframeMap::is_live(oop vfp) { return vframeOop(vfp)->is_live_vframe(); }

bool vframeMap::verify(oop obj) { return vframeOop(obj)->verify(); }

oop vframeMap::mirror_codes(oop obj) {
  return vframeOop(obj)->method()->mirror_codes(); }
oop vframeMap::mirror_literals(oop obj) {
  return vframeOop(obj)->method()->mirror_literals(); }
oop vframeMap::mirror_source(oop obj) {
  return vframeOop(obj)->method()->mirror_source(); }
oop vframeMap::mirror_source_length(oop obj) {
  return vframeOop(obj)->method()->mirror_source_length(); }
oop vframeMap::mirror_source_offset(oop obj) {
  return vframeOop(obj)->method()->mirror_source_offset(); }
oop vframeMap::mirror_file(oop obj) {
  return vframeOop(obj)->method()->mirror_file(); }
oop vframeMap::mirror_line(oop obj) {
  return vframeOop(obj)->method()->mirror_line(); }

oop vframeMap::mirror_contents_at(oop obj, stringOop name) {
  TEST;
  slotDesc* sd = vfo->method()->find_nonVM_slot(name);
  if (sd == NULL) return ErrorCodes::vmString_prim_error(SLOTNAMEERROR);
  if (sd->is_obj_slot() && name->is_1arg_keyword())
    return Memory->assignmentMirrorObj;
  abstract_vframe* vf = vfo->as_vframe();
  oop contents = vf->get_slot(sd);
  return contents->as_mirror();
}

# define VFRAME_PRIM(name, what)                                              \
  oop vframeMap::name(oop obj) {                                              \
    TEST;                                                                     \
    abstract_vframe* vf = vfo->as_vframe();                                           \
    return what;                                                              \
  }                                                                           \
    
VFRAME_PRIM(mirror_bci, as_smiOop(vf->bci()))
VFRAME_PRIM(mirror_methodHolder, vf->methodHolder_object()->as_mirror())

oop vframeMap::mirror_receiver(oop obj) {
  TEST;
  return vfo->as_vframe()->receiver()->as_mirror();
}

oop vframeMap::mirror_parent(oop obj) {
  TEST;
  abstract_vframe* parent = vfo->as_vframe()->parent();
  if (!parent) return ErrorCodes::vmString_prim_error(NOPARENTERROR);
  assert(vfo->process() == vmProcess || !parent->is_first_self_vframe(),
         "doIt of a process cannot have blocks!");
  vframeOop nvfo = new_vframeOop(vfo->process(), parent);
  return nvfo->as_mirror();
}

oop vframeMap::mirror_sender(oop obj) {
  TEST;
  abstract_vframe* vf = vfo->as_vframe();
  abstract_vframe* sender = vf->sender();
  if (! sender ||
      (vfo->process() != vmProcess && sender->is_first_self_vframe()))
    return ErrorCodes::vmString_prim_error(NOSENDERERROR);
  
  vframeOop nvfo = new_senderVFrameOop(vfo->process(), vfo, sender);

  return nvfo->as_mirror();
}

oop vframeMap::mirror_expr_stack(oop obj) {
  TEST;
  smi len;
  oop* vec;
  vfo->as_vframe()->get_expr_stack(vec, len);
  objVectorOop objVec= Memory->objVectorObj->cloneSize(len);
  for (smi i = 0; i < len; i++) objVec->obj_at_put(i, vec[i]);    
  return objVec;
}

oop vframeMap::mirror_selector(oop obj) {
  TEST;
  return vfo->as_vframe()->selector();
}

oop vframeMap::clone(oop obj, bool mustAllocate, oop genObj) {
  vframeOop theClone= vframeOop(obj)->basic_clone(mustAllocate, genObj);
  if (oop(theClone) != failedAllocationOop && theClone->is_live()) {
    // link clone into list after the original
    vframeOop(obj)->set_next(theClone);
  }
  return theClone;
}

oop vframeMap::cloneSize(oop obj, fint length, bool mustAllocate, oop filler) {
  return slotsMapDeps::cloneSize(obj, length, mustAllocate, filler); }

fint vframeMap::empty_object_size() {
  return sizeof(vframeOopClass) / oopSize; 
}

void vframeMap::print(oop obj) {
  ResourceMark rm;
  lprintf("vframe ");
  if (WizardMode && !obj->is_map()) {
    vframeOop vfo = vframeOop(obj);
    if (vfo->is_live()) {
      abstract_vframe* vf = vfo->as_vframe();
      const char* sel = vf->selector() ?
        stringOop(vf->selector())->copy_null_terminated() : "...";
      lprintf("(%s / %#lx %#lx) ", sel, vfo->fr(),
             vfo->locals());
    } else {
      lprintf("(DEAD)");
    }
  }
  slotsMapDeps::print(obj);
}

void vframeMap::print_string(oop obj, char* buf) {
  bool live = vframeOop(obj)->is_live();
  sprintf(buf, "<a%s activation object>", live ? "n" : " dead");
}


void vframeMap::print_oop(oop obj) {
  bool live = vframeOop(obj)->is_live();
  lprintf("<a%s activation object", live ? "n" : " dead");
  if (WizardMode && live) {
    ResourceMark rm;
    abstract_vframe* vf = vframeOop(obj)->as_vframe();
#   if defined(FAST_COMPILER) || defined(SIC_COMPILER)
      if (vf->is_compiled()) {
        compiled_vframe* v = vf->as_compiled();
        lprintf(" <%#lx @ %#lx # %ld>", 
               vf->fr,
               v->code,
               (void*)long(v->descOffset()->value()));
      }
#   endif
    methodMap *mm = (methodMap*) vf->method()->map();
    stringOop file = mm->file();
    if (file->length() > 0) {
      lprintf(" (");
      file->string_print();
      lprintf(":%ld): ", mm->line()->value());
    } else {
      lprintf(" ");
    }
#   if defined(FAST_COMPILER) || defined(SIC_COMPILER)
      if (vf->is_compiled()) {
        compiled_vframe* v = vf->as_compiled();
        if (v->desc->key.selector->is_string()) {
          stringOop(v->desc->key.selector)->string_print();
        } else {
          v->desc->key.selector->print_oop();
        }
      }
#   endif
  } else if (PrintOopAddress) {
    lprintf(" (%#lx) ", obj);
  }
  lprintf(">");
}

oop vframeMap::mirror_annotation_at(oop obj, stringOop name) {
  return vframeOop(obj)->method()->map()->
    mirror_annotation_at(obj, name);
}

// enumerating
bool vframeMap::is_enumerable(oop obj,  oop* matching_cell) {
  return  matching_cell >=     vframeOop(obj)->oops(empty_object_size())
    ||   *matching_cell ==     vframeOop(obj)->method()
    ||   *matching_cell == oop(vframeOop(obj)->process());
};

void vframeMap::dummy_initialize(oop obj, oop filler) {
  assert( obj->is_vframe(), "a vframeOop is expected");
  vframeOop(obj)->set_next(NULL);
  vframeOop(obj)->set_method(filler);
  vframeOop(obj)->set_locals(NULL);
  vframeOop(obj)->set_process(NULL);
  vframeOop(obj)->set_descOffset(0);
}
