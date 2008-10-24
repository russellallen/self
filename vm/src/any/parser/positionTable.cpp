/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "positionTable.hh"
# include "_positionTable.cpp.incl"

void ByteCodePositionTable::GenCode(fint offset, fint length, fint c) {
  Unused(c);
  if (maxCodeIndex <= codeIndex + 1) {
    maxCodeIndex *= 2;
    positions= positions->cloneSize(maxCodeIndex);
  }
  positions->obj_at_put(codeIndex++, as_smiOop(offset));
  positions->obj_at_put(codeIndex++, as_smiOop(length));
}
