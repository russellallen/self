/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "proxyOop.hh"
#include "_proxyOop.cpp.incl"

// Magic number, stored in proxyOop's cObject field, when it is killed.
// safer to make it smiOop -- dmu
const void *deadProxyObject = (void *)0x109b1500; 


bool proxyOopClass::verify() {
  return foreignOopClass::verify() && addr()->type_seal.verify();
}
