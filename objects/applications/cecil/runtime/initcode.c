/* Sun-$Revision: 9.1 $ */

# pragma implementation "initcode.h"

#include "cecil.h"
#include "initcode.h"

void init_global_objects() {
  GLOBAL(base,cecilMap_any) =
    new CecilMap("any", newOOPList());
  GLOBAL(base,_any) = 
    asTaggedPointer(new CecilMemoryObject(GLOBAL(base,cecilMap_any), 0));

  GLOBAL(base,cecilMap_void) = 
    new CecilMap("void", newOOPList(GLOBAL(base,_any)));
  GLOBAL(base,_void) = 
    asTaggedPointer(new CecilMemoryObject(GLOBAL(base,cecilMap_void), 0));

  GLOBAL(base,cecilMap_closure) = 
    new CecilMap("closure", newOOPList(GLOBAL(base,_any)));
  GLOBAL(base,_closure) = 
    asTaggedPointer(new CecilClosureObject(GLOBAL(base,cecilMap_closure), 0));

  GLOBAL(base,cecilMap_true) = 
    new CecilMap("true", newOOPList(GLOBAL(base,_any)));
  GLOBAL(base,_true) = 
    asTaggedPointer(new CecilMemoryObject(GLOBAL(base,cecilMap_true), 0));

  GLOBAL(base,cecilMap_false) = 
    new CecilMap("false", newOOPList(GLOBAL(base,_any)));
  GLOBAL(base,_false) = 
    asTaggedPointer(new CecilMemoryObject(GLOBAL(base,cecilMap_false), 0));

  GLOBAL(base,cecilMap_integer) = 
    new CecilMap("integer", newOOPList(GLOBAL(base,_any)));
  GLOBAL(base,_integer) =
    asTaggedPointer(new CecilMemoryObject(GLOBAL(base,cecilMap_integer), 0));
  GLOBAL(base,cecilMap_integer_obj) = 
    new CecilMap(NULL, newOOPList(GLOBAL(base,_integer)));

  GLOBAL(base,cecilMap_float) = 
    new CecilMap("float", newOOPList(GLOBAL(base,_any)));
  GLOBAL(base,_float) = 
    asTaggedPointer(new CecilMemoryObject(GLOBAL(base,cecilMap_float), 0));
  GLOBAL(base,cecilMap_float_obj) = 
    new CecilMap(NULL, newOOPList(GLOBAL(base,_float)));

  GLOBAL(base,cecilMap_char) = 
    new CecilMap("char", newOOPList(GLOBAL(base,_any)));
  GLOBAL(base,_char) = 
    asTaggedPointer(new CecilMemoryObject(GLOBAL(base,cecilMap_char), 0));
  GLOBAL(base,cecilMap_char_obj) = 
    new CecilMap(NULL, newOOPList(GLOBAL(base,_char)));

  GLOBAL(base,cecilMap_array) = 
    new CecilMap("array", newOOPList(GLOBAL(base,_any)));
  GLOBAL(base,_array) = 
    asTaggedPointer(new CecilMemoryObject(GLOBAL(base,cecilMap_array), 0));
  GLOBAL(base,cecilMap_array_obj) = 
    new CecilMap(NULL, newOOPList(GLOBAL(base,_array)));

  GLOBAL(base,cecilMap_string) = 
    new CecilMap("string", newOOPList(GLOBAL(base,_any)));
  GLOBAL(base,_string) =
    asTaggedPointer(new CecilMemoryObject(GLOBAL(base,cecilMap_string), 0));
  GLOBAL(base,cecilMap_string_obj) = 
    new CecilMap(NULL, newOOPList(GLOBAL(base,_string)));

  GLOBAL(base,cecilMap_mutable__string) = 
    new CecilMap("mutable_string", newOOPList(GLOBAL(base,_string)));
  GLOBAL(base,_mutable__string) =
    asTaggedPointer(
      new CecilMemoryObject(GLOBAL(base,cecilMap_mutable__string), 0));
  GLOBAL(base,cecilMap_mutable__string_obj) = 
    new CecilMap(NULL, newOOPList(GLOBAL(base,_mutable__string)));
}
