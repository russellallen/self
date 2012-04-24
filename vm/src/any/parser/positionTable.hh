/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


class ByteCodePositionTable: public AbstractByteCode {
 public:
  
  // instance variables
  objVectorOop positions;

  fint codeIndex;
  fint maxCodeIndex;

  // constructor
  ByteCodePositionTable(bool ma)
  : AbstractByteCode(ma) {
    maxCodeIndex = 50;
    codeIndex = 0;
    positions= Memory->objVectorObj->cloneSize(maxCodeIndex);
           
    if (GenArgCountBytecode) {
      // Use new Iset from now now -- dmu 10/01
      GenInstructionSetSelectionByteCode(0, 0, TWENTIETH_CENTURY_PLUS_ARGUMENT_COUNT_INSTRUCTION_SET);
    }

  }
  
  oop Finish() {
    if (!ResolveBranches())
      return ErrorCodes::general_prim_error(errorMessage);
    return positions->cloneSize(codeIndex);
  }

  // helpers
  
  bool isPositionTable() { return true; }
  
  void GenCode(fint offset, fint length, fint c);
  
  fint bci() { return codeIndex; }
  
  // preserve operation
  void oops_do(oopsDoFn f) {     
    AbstractByteCode::oops_do(f);
    (*f)((oop*)&positions); }
};

