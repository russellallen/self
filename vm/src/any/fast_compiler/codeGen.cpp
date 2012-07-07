/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */



# pragma implementation "codeGen.hh"
# include "_codeGen.cpp.incl"

# ifdef FAST_COMPILER

  // don't make the constants below too small - the space is used only
  // during NIC-compilation, and there are some fairly big methods
  // out there -- Urs 8/93

  static const int32 FInstructionsSize  = 100 * K;
  static const int32 FInstLocationsSize =  20 * K;
  
  static const int32 FScopeDesc_size    = 20 * K;
  static const int32 FPcDesc_size       =  2 * K;
  
CodeGen::CodeGen(compilingLookup* l, sendDesc* sd, nmln* d) 
  : a(FInstructionsSize, FInstLocationsSize, PrintCompiledCode, true) {
  scopeDescs = new ScopeDescRecorder(FScopeDesc_size, FPcDesc_size);
  needToFlushRegWindow = haveStackFrame = false;
  frameSize = verifiedOffset = diCheckOffset = 0;
  L = l; send_desc = sd; diLink = d;
  theCodeGen = this;
  initialize_for_platform();
}

PrimDesc* CodeGen::intrCheck() {
  static PrimDesc* intCk = NULL;
  if (intCk == NULL)
    intCk = getPrimDescOfSelector(VMString[INTERRUPT_CHECK], true);
  return intCk;
}

PrimDesc* CodeGen::blockClone() {
  static PrimDesc* blkClone = NULL;
  if (blkClone == NULL)
    blkClone = getPrimDescOfSelector(VMString[BLOCK_CLONE], true);
  return blkClone;
}


Location CodeGen::loadPath(Location dest,
                           lookupTarget* target,
                           Location receiver,
                           Location temp_reg) {
  // *if root of path...
  //   *if holder is receiver...
  //     <move receiver, dest/t>
  //   *else...
  //     <loadOop obj, dest/t>
  //   *end
  // *else...
  //   <lookup dest/t, previousPath, receiver>
  // *end
  
  // Since I am called from CodeGen::assignment, I cannot clobber Temp2
  // Note called from codeGen::prologue, CodeGen::verifyParents, CodeGen:assignment, CodeGen::lookup
  // constrants: no frame in prologue case, 
    
  a.Comment("loadPath");
  Location t;
  t = isRegister(dest) ? dest : temp_reg;
  if (target->is_receiver()) {
    if (isRegister(receiver))     t = receiver;
    else                          move(t, receiver);
  } 
  else {
    assert(target->is_object(), "must be an object path search");
    objectLookupTarget* otarget = (objectLookupTarget*) target;
    if (otarget->prevTargetSlot) {
      lookup(temp_reg, otarget->prevTargetSlot, receiver);
      t = temp_reg;
    } 
    else {
      loadOop(t, otarget->obj);    // load oop
    }
  }
  a.Comment("end loadPath");
  return t;
}

# endif // FAST_COMPILER
