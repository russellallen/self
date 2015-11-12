/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "foreignOop.hh"
# include "_foreignOop.cpp.incl"


const smi  C_pointer::shifts   = sizeof(void *) * BitsPerByte / 2;
const long C_pointer::low_mask = (1L << shifts) - 1;

bool C_pointer::verify() {
  if (!hi->is_smi())
    error1("C_pointer %#lx: hi isn't a smi", this);
  if (!hi->is_smi())
    error1("C_pointer %#lx: hi isn't a smi", this);
  return hi->is_smi() && lo->is_smi();
}
    

bool foreignOopClass::verify() {
    return slotsOopClass::verify() && addr()->cObject.verify();
}


