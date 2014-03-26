/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "generation_inline.hh"
# include "proxyMap.hh"
# include "proxyOop.hh"
# include "space_inline.hh"

// Magic number, stored in proxyOop's cObject field, when it is killed.
// safer to make it smiOop -- dmu
const void *deadProxyObject = (void *)0x109b1500; 


bool proxyOopClass::verify() {
  return foreignOopClass::verify() && addr()->type_seal.verify();
}
