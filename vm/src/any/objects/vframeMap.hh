#pragma once
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "codeLikeSlotsMap.hh"



class vframeMap : public codeLikeSlotsMap {
 public:
  bool is_vframe()              { return true; }
  bool is_killable()            { return true; }
  bool is_programmable_slots()  { return false; }

  // cloning
  oop basic_clone(oop obj, bool mustAllocate= true, oop genObj= NULL) {
    return slotsMapDeps::clone(obj, mustAllocate, genObj); }
  oop clone(oop obj, bool mustAllocate= true, oop genObj= NULL);
  bool can_inline_clone() { return false; }
  oop cloneSize(oop obj, fint length, bool mustAllocate= true,
                oop filler= NULL);
  
  // mirror operations
  oop mirror_names(oop r);
  oop mirror_name_at(oop obj, smi inx);
  oop mirror_contents_at(oop r, stringOop name);
  oop mirror_is_parent_at(oop r, stringOop name);
  oop mirror_is_argument_at(oop r, stringOop name);
  oop mirror_is_assignable_at(oop r, stringOop name);
  
  oop mirror_codes(oop obj);
  oop mirror_literals(oop obj);
  oop mirror_source(oop obj);
  oop mirror_source_length(oop obj);
  oop mirror_source_offset(oop obj);
  oop mirror_file(oop obj);
  oop mirror_line(oop obj);

  oop mirror_sender(oop obj);
  oop mirror_parent(oop obj);
  oop mirror_receiver(oop obj);
  oop mirror_expr_stack(oop obj);
  oop mirror_methodHolder(oop obj);
  oop mirror_selector(oop obj);
  oop mirror_bci(oop obj);

  oop mirror_annotation_at(oop obj, stringOop name);
  
  bool verify(oop obj);
  
  // sizing
  fint empty_object_size();

  // killable functions
  void    kill(oop vfp);
  bool is_live(oop vfp);
  
  // printing
  void print_string(oop obj, char* buf);
  void print(oop obj);
  void print_oop(oop obj);

  // enumerating
  virtual bool  is_enumerable(oop obj,  oop* matching_cell);

  // profiler operation
  void dummy_initialize(oop obj, oop filler);
};


class ovframeMap : public vframeMap {
 public:
  mirrorOop mirror_proto()      { return Memory->outerActivationMirrorObj; }
  VtblMapType vtblMapType()     { return MAP_TYPE_NAME(ovframeMap); }
};

class bvframeMap : public vframeMap {
 public:
  mirrorOop mirror_proto()      { return Memory->blockActivationMirrorObj; }
  VtblMapType vtblMapType()     { return MAP_TYPE_NAME(bvframeMap); }
};
