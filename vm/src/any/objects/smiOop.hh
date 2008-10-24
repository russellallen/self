/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// 0, 1 in smiOop format

# define smiOop_zero  smiOop((0L << Tag_Size) + Int_Tag)
# define smiOop_one   smiOop((1L << Tag_Size) + Int_Tag)

// minimum and maximum smiOops
# define smiOop_min   smiOop((1L << (BitsPerWord - 1)) + Int_Tag)
# define smiOop_max   smiOop(lowerBits((AllBits << Tag_Size) + Int_Tag,       \
    BitsPerWord - 1))

class smiOopClass: public oopClass {
 public:
  // constructors
  friend inline smiOop as_smiOop(smi value) {
    return smiOop((value << Tag_Size) + Int_Tag); }
  friend inline smiOop as_byte_count_smiOop(smi value) {
    assert(lowerBits(value, Tag_Size) == 0, "not a legal byte count");
    return smiOop(value + Int_Tag); }
  
  // accessors
  smi value() { return (smi(this) - Int_Tag) >> Tag_Size; }
  smi byte_count() { return smi(this) - Int_Tag; }
  
  smi identity_hash() { return value(); }
  
  // arithmetic
  smiOop increment() { return smiOop(smi(this) + smi(smiOop_one)); }
  smiOop decrement() { return smiOop(smi(this) - smi(smiOop_one)); }
  
  // all oop functions
  Map* map() { return Memory->smi_map; }
  
  // printing
  void print_oop() { lprintf("%ld", (void*)(long) value()); }
  void print_string(char* buf) { sprintf(buf, "%ld", (long) value()); }
  void print() { print_oop(); lprintf("\n"); }
  
  // primitives
  float as_float_prim()      { return  value(); }
  oop as_object_prim();
  oop address_as_oop_prim();

};

oop smi_lt_prim(oop rcvr, oop arg);
oop smi_le_prim(oop rcvr, oop arg);
oop smi_eq_prim(oop rcvr, oop arg);
oop smi_ne_prim(oop rcvr, oop arg);
oop smi_ge_prim(oop rcvr, oop arg);
oop smi_gt_prim(oop rcvr, oop arg);
