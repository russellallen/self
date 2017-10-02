#pragma once
# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// included into class codeGen


 private:
  void restore_frame_and_return(fint byte_offset);
  void     reload_ByteMapBaseReg(PrimDesc*);
  
  Location    leaf_rcvr_base;
  int32       leaf_rcvr_disp;
  OperandType leaf_rcvr_type;
  
  pc_t callPatchAddr, endCallPatchAddr;
  
  Location moveToReg(Location what, Location reg);

  
  void   smiOop_prologue();
  void floatOop_prologue();
  void   memOop_prologue();


 private:
  // fint _max_no_of_outgoing_args_and_rcvr;
  fint _number_of_memory_locals;


public:
  // fint max_no_of_outgoing_args_and_rcvr()       { return _max_no_of_outgoing_args_and_rcvr;       }
  fint number_of_memory_locals()                { return _number_of_memory_locals; }


  

 public:
  void move(Location dest, Location srcLocation, Location tempReg = no_reg, bool setcc = false );

  
 private:

# endif // __i386__
