/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


class slotList: public ResourceObj {
 public:
  slotDesc desc;
  slotList* next;
  
  slotList(stringOop name, slotType type, oop contents,
     oop anno, slotList* x= NULL)
    : desc(name, type, contents, anno) {
    next= x; 
  }
  slotList(stringOop name, slotType type, oop contents)
    : desc(name, type, contents, Memory->slotAnnotationObj) {
    next= NULL;
  }
  slotList* add(stringOop name, slotType type, oop contents) {
    return add(name, type, contents, Memory->slotAnnotationObj);
  }
  slotList* add(stringOop name, slotType type, oop contents, oop anno);
  
  fint length();
  fint obj_count();
  void oops_do(oopsDoFn f);

  stringOop name() { return desc.name; }
  slotType type()  { return desc.type; }
  oop contents()   { return desc.data; }
  oop annotation() { return desc.annotation; }
};
