# if defined(__ppc__) || defined(__powerpc__)
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

// included into class codeGen

private:
  AddressList* frame_size_patchees;     // instructions whose immediate fields need to be incremented by frame size
  AddressList* frame_size_neg_patchees; // instructions whose immediate fields need to be decremented by frame size
  AddressList* lmw_patchees;    // instructions that restore nonvols and need to be patched
  AddressList* outgoing_arg_patchees;   // instructions whose immediate fields need to be incremented by the # words reserved for outgoing args (& rcvr) in my frame

  pc_t prologueEndAddr; // where to add stack-clearing code

  fint num_reg_args_and_rcvr;

  void restore_frame_and_return(fint byte_offset);
  Location get_SPLimit(Location);
  void     reload_ByteMapBaseReg(PrimDesc*);
  inline Location moveToReg(Location what, Location reg, bool set_cc = false);
  
  void   smiOop_prologue();
  void floatOop_prologue();
  void   memOop_prologue();


private:
  fint _max_no_of_outgoing_args_and_rcvr;
  fint _number_of_saved_nonvolatile_registers;
  fint _number_of_memory_locals;
  bool _need_to_save_args_on_stack;
  bool _includes_call_to_untrusted_C;
 
public:
  fint max_no_of_outgoing_args_and_rcvr()       { return _max_no_of_outgoing_args_and_rcvr;       }
  fint number_of_saved_nonvolatile_registers()  { return _number_of_saved_nonvolatile_registers; }
  fint number_of_memory_locals()                { return _number_of_memory_locals; }
  bool need_to_save_args_on_stack()             { return _need_to_save_args_on_stack; }

  fint getOffset_in_my_frame(Location src);
  
  inline void move(Location dest, Location src, bool set_cc = false);
  void moveComplicated(Location dest, Location src, bool set_cc);
# endif // __ppc__
