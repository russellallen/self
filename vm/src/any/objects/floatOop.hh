/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// Forward-declaration for friend
floatOop as_floatOop(float value);

class floatOopClass: public oopClass {
 public:
  // constructor
  friend floatOop as_floatOop(float value);
  
  // accessors
  float value();
  
  smi identity_hash() { return int32(this) >> Tag_Size; }
  
  Map* map() { return Memory->float_map; }
  
  // printing
  void make_print_string(char* buf, const char* format = "%g");   // private
  void print_oop();
  void print() { print_oop(); lprintf("\n"); }
  void print_string(char* buf);
  
  // primitives
  char *print_string_prim();
  char *print_string_precision_prim(smi precision);
};

extern floatOop infinityOop;

oop float_add_prim(floatOop x, floatOop y);
oop float_sub_prim(floatOop x, floatOop y);
oop float_mul_prim(floatOop x, floatOop y);
oop float_div_prim(floatOop x, floatOop y);
oop float_mod_prim(floatOop x, floatOop y);

oop as_int_prim(floatOop x);
oop as_float_prim(smiOop x);
oop float_floor_prim(floatOop x);
oop float_ceil_prim(floatOop x);
oop float_round_prim(floatOop x);
oop float_truncate_prim(floatOop x);

oop float_lt_prim(floatOop x, floatOop y);
oop float_le_prim(floatOop x, floatOop y);
oop float_eq_prim(floatOop x, floatOop y);
oop float_ne_prim(floatOop x, floatOop y);
oop float_gt_prim(floatOop x, floatOop y);
oop float_ge_prim(floatOop x, floatOop y);


# ifdef FAST_FLOATS
  union floatHolder {
    float f;
    uint32 i;
  };
  
  inline floatOop as_floatOop(float value) {
    // this trashes the least significant mantissa bits
    // might want to kill exponent bits
    floatHolder x;
    x.f = value;
    uint32 i = (x.i & ~Tag_Mask) | Float_Tag;
    return floatOop(i);
  }
  
  inline float floatOopClass::value() {
    floatHolder x;
    x.i = uint32(this) - Float_Tag;
    return x.f;
  }
# endif
