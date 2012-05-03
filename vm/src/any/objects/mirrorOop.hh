/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// Forward-declaration for friend
oop as_mirror_prim(oop obj);

class mirrorOopClass: public slotsOopClass {
  
 protected:
  oop _reflectee;
  mirrorOopClass* addr() {return (mirrorOopClass*)slotsOopClass::addr();}
  
 public:
  mirrorOop clone(bool mustAllocate= true) {
    return (mirrorOop) slotsOopClass::clone(mustAllocate); }
  oop       reflectee()         { return addr()->_reflectee;}
  mirrorOop set_reflectee(oop r) {
    Memory->store(&addr()->_reflectee, r);
    return this;}
  
  friend oop as_mirror_prim(oop obj);
  
  oop codes_prim()               { return reflectee()->mirror_codes();        }
  oop literals_prim()            { return reflectee()->mirror_literals();     }
  oop source_prim()              { return reflectee()->mirror_source();       }
  oop source_offset_prim()       { return reflectee()->mirror_source_offset();}
  oop source_length_prim()       { return reflectee()->mirror_source_length();}
  oop file_prim()                { return reflectee()->mirror_file();         }
  oop line_prim()                { return reflectee()->mirror_line();         }
  oop size_prim()                { return as_smiOop(reflectee()->byte_size());}

  oop get_reflectee_prim()       { return reflectee()->mirror_reflectee();    }
  oop names_prim()      { return reflectee()->mirror_names();       }
  oop name_at_prim(smi inx)  { return reflectee()->mirror_name_at(inx); }

  oop contents_at_prim(stringOop n)    { 
    return reflectee()->mirror_contents_at(n); }
  oop is_parent_at_prim(stringOop n)   {
    return reflectee()->mirror_is_parent_at(n); }
  oop is_argument_at_prim(stringOop n) {
    return reflectee()->mirror_is_argument_at(n); }

  oop is_assignable_at_prim(stringOop n) {
    return reflectee()->mirror_is_assignable_at(n); }


  // programming primitives
  oop define_prim(mirrorOop contMir, void *FH);
  oop copy_add_slot_prim(stringOop name, mirrorOop contMirror,
                         bool isP, bool isA,
                         oop anno, void *FH);
  oop copy_remove_prim(stringOop name, void *FH);
  oop evaluate_in_context_prim(mirrorOop methodMirror);
  void switch_reflectee(oop* where, oop to);

  oop create_block_prim() {  // mirror contains block method
    return slotsOop(reflectee())->create_block_prim();
  }

  // annotation primitives
  oop  get_annotation_prim() { 
    return reflectee()->mirror_get_annotation() ; }
  oop copy_set_annotation_prim(oop a, void *FH);
  oop annotation_at_prim(stringOop n) { 
    return reflectee()->mirror_annotation_at(n); }

  // activation mirror primitives
 public:
  oop sender_prim()              { return reflectee()->mirror_sender();       }
  oop parent_prim()              { return reflectee()->mirror_parent();       }
  oop receiver_prim()            { return reflectee()->mirror_receiver();     }
  oop expr_stack_prim()          { return reflectee()->mirror_expr_stack();   }
  oop methodHolder_prim()        { return reflectee()->mirror_methodHolder();}
  oop selector_prim()            { return reflectee()->mirror_selector();     }
  oop bci_prim()                 { return reflectee()->mirror_bci();          }
};

oop reflectee_eq_prim(mirrorOop rcvr, oop anotherMirror);
oop reflectee_id_hash_prim(mirrorOop rcvr);
