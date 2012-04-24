/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


extern oop sneaky_method_argument_to_interpret;


extern "C" {
  oop interpret( oop rcv,
                 oop sel,
                 oop del,
                 oop meth,
                 oop _mh,
                 oop* _args,
                 int32 _nargs );
  oop interpret_from_compiled_sender();
}


enum ReturnPatchReason { not_patched, patched_for_profiling, patched };

class interpreter: public abstract_interpreter {
  friend class interpreted_vframe; // needs mi.literals, etc
  friend class InterpreterIterator;

 public:
  // WARNING all oops here must appear in ITERATOR below
  oop receiver;
  // next 2 are not redundant because of performs:
  oop selector;
  oop delegatee;
  oop method_object; 
  
 protected:
  oop _methodHolder;
  
 public:
  oop* args;
  int32 length_args;

  oop* locals;
  int32 _length_locals;
  int32 minOffset;
  bool hasParentLocalSlot;
  oop* cloned_blocks; // NULL or cloned block
  oop* stack;
  int32 sp;
  oop self;

  // put next two in here instead of locals so that
  //  they will get scavenged; they have to survive a send
  //  when a prim fails
        oop rcvToSend;
  oop       selToSend; // could be anything if a perform
  int32     arg_count; // for the send, not for me
  
  // unlilke compiled frames, cannot patch the return address
  //  because that would lose the call used to verify that this is
  //  an interpreted frame. Instead, save the address that WOULD
  //  be installed here, and check it upon return.

  ReturnPatchReason  return_patch_reason;
  bool               restartSend;
  
  interpreter* parentI; // interp of lexical parent or NULL
  
 protected:
   frame* _block_scope_or_NLR_target;
   
   inline frame* block_scope_or_NLR_target();

 public:
  interpreter( oop rcv,
               oop sel,
               oop del,
               oop meth,
               oop _mh,
               oop* _args,
               int32 _nargs);

  oop top() { return stack[sp-1]; }
  
  inline int32 length_cloned_blocks();
  inline void     set_cloned_blocks(void* p);

  inline int32    length_stack() { return mi.length_codes; }
  inline void     set_stack(void* p);

  inline int32 length_locals() { return _length_locals; }
  inline void  set_locals(void* p);

               
  PrimDesc* current_primDesc; // for stack walking
  
  PrimDesc* getPrimDesc() { return current_primDesc; } 

  void set_restartSend(bool b) {restartSend = b;}
  
  void interpret_method();
  
  oop methodHolder() {
    assert( ! _methodHolder->is_map(), "interp mh always object");
    return _methodHolder;
  }
  
  void set_methodHolder(oop mh) { _methodHolder= mh; }

  // frame oop iterators need this one (via INTERPRETER_ITERATOR below):

  oop* methodHolder_addr() { return &_methodHolder; }
  
  abstract_vframe* parentVF();
  
 protected: 
 
  void do_SELF_CODE();
  void do_POP_CODE();
  void do_NONLOCAL_RETURN_CODE();
  void do_literal_code(oop lit);
  void do_read_write_local_code(bool isWrite);
  void do_send_code(bool isSelfImplicit, stringOop selector, fint arg_count);
  
  void do_branch_code( int32 target_PC, oop target_oop = badOop );
  void do_BRANCH_INDEXED_CODE();

  
  
 public:
  void send( LookupType, oop delegatee, fint arg_count );
  oop lookup_and_send( LookupType,
                       oop mh,
                       oop delegatee);
                      
  oop send_prim( );
  
 public:
  oop try_perform_prim( bool hasFailBlock,
                        bool& is_perform );

  oop  get_slot(slotDesc* sd);
  void set_slot(slotDesc* sd, oop x);

  
 protected:
 
  fint return_pc()  { return mi.length_codes - 1; }
  fint restart_pc() { return mi.length_codes;     }
  void local_slot_desc(interpreter*& interp, abstract_vframe*& vf, slotDesc*& sd);
  void block_scope_and_desc_of_home( frame*& block_scope_frame, int32& block_desc);


  
 public:
  bool is_return_patched() { return return_patch_reason != not_patched; }
  void patch_return(ReturnPatchReason x) { return_patch_reason = x; }
  ReturnPatchReason get_return_patch_reason() { 
    return return_patch_reason; }
    
  void print();

 public: // should be prot but friend doesn't work
  void setup_for_method( );
  void setup_for_block(  );
 protected:
  void start_NLR(oop res);
  void continue_NLR();
};

extern void InterpreterLookup_cont( simpleLookup *L, int32 arg_count);



// for scavenging, see frame.c
// Don't do:
//    for (p = is->args;  p < &is->args[is->length_args];  p++) { template; }
// because when args are passed from interpreter, they are iterated
// in its stack anyway. This means that non-interp calling interp
// must arrange to scavenge, etc the top-level args.

# define INTERPRETER_ITERATOR(interp, template, zap, reinit) \
  { \
    ABSTRACT_INTERPRETER_ITERATOR(interp, template, zap, reinit) \
    \
    oop* p; \
    \
    p =       &(interp)->receiver;      template; \
    p = (oop*)&(interp)->selector;      template; \
    p = (oop*)&(interp)->delegatee;     template; \
    p = (oop*)&(interp)->method_object; template; \
    p =       &(interp)->self;          template; \
    p = (interp)->methodHolder_addr();  template; \
    \
    for ( p =  (interp)->locals;  \
          p < &(interp)->locals[(interp)->length_locals()]; \
        ++p) { \
      template; \
    } \
    for ( p = (interp)->cloned_blocks;  \
          p < &(interp)->cloned_blocks[(interp)->mi.length_literals]; \
        ++p) { \
      if (*p != NULL) { template; }  \
    } \
    for (p = (interp)->stack;  p < &(interp)->stack[(interp)->sp];  p++) { \
      template; \
    } \
    if (zap) for ( ; p < &(interp)->stack[(interp)->length_stack()]; p++) { \
      *p = badOop; \
    } \
    p =       &(interp)->rcvToSend;  template; \
    p = (oop*)&(interp)->selToSend;  template; \
  } 
  
  
// new style:

class InterpreterIterator: public StackObj {
 private:
  interpreter* interp;
  OopClosure* oop_closure;
  bool zap;
  bool reinit;
  
 public:
  InterpreterIterator(interpreter* i, OopClosure* oc, bool z, bool r) {
    interp = i;  oop_closure = oc;  zap = z;  reinit = r;
    do_all();
  }
 private:
  void do_all() {
    ABSTRACT_INTERPRETER_ITERATOR(interp, oop_closure->do_oop(p), zap, reinit) 
    
    oop* p; 
    
    p =       &(interp)->receiver;             oop_closure->do_oop(p); 
    p = (oop*)&(interp)->selector;             oop_closure->do_oop(p); 
    p = (oop*)&(interp)->delegatee;            oop_closure->do_oop(p); 
    p = (oop*)&(interp)->method_object;        oop_closure->do_oop(p); 
    p =       &(interp)->self;                 oop_closure->do_oop(p); 
    p =        (interp)->methodHolder_addr();  oop_closure->do_oop(p);
    
    for ( p =  (interp)->locals;  
          p < &(interp)->locals[(interp)->length_locals()]; 
        ++p) { 
      oop_closure->do_oop(p); 
    }
    for ( p = (interp)->cloned_blocks;   
          p < &(interp)->cloned_blocks[(interp)->mi.length_literals];
        ++p) { 
      if (*p != NULL) { oop_closure->do_oop(p); } 
    }
    for (p = (interp)->stack;  p < &(interp)->stack[(interp)->sp];  p++) { 
      oop_closure->do_oop(p);
    } 
    if (zap) for ( ; p < &(interp)->stack[(interp)->length_stack()]; p++) { 
      *p = badOop;
    }
    p =       &(interp)->rcvToSend;  oop_closure->do_oop(p);
    p = (oop*)&(interp)->selToSend;  oop_closure->do_oop(p);
  }
};  
    
