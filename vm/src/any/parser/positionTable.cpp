/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "generation_inline.hh"
# include "positionTable.hh"
# include "space_inline.hh"
# include "stringMap.hh"

void ByteCodePositionTable::GenCode(fint offset, fint length, fint c) {
  Unused(c);
  if (maxCodeIndex <= codeIndex + 1) {
    maxCodeIndex *= 2;
    positions= positions->cloneSize(maxCodeIndex);
  }
  positions->obj_at_put(codeIndex++, as_smiOop(offset));
  positions->obj_at_put(codeIndex++, as_smiOop(length));
}
