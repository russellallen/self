/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "floatOop.hh"
# include "_floatOop.cpp.incl"

DO_NOT_CROSS_COMPILE
  
/* float formats:
   IEEE_float = { int sign:1; int fract: 23; int exp: 8 }

   Normally:
   Self_float = { int sign:1; int fract: 23; int exp: 6; int tag: 2}

   if FAST_FLOATS is defined
   Self_float = { int sign:1; int fract: 21; int exp: 8; int tag: 2}
*/
  
static const fint fractSize = 23;
static const fint expSize = 8;
static const fint expOffset = fractSize;

# ifdef FAST_FLOATS
  floatOop infinityOop = floatOop(nthMask(expSize) << expOffset
                                  |  Float_Tag);
# else

  static const fint signSize = 1;
  static const fint signOffset = fractSize + expSize;
  
  static const fint selfExpSize   = fint(expSize   - Tag_Size);
  static const fint selfExpOffset = fint(expOffset + Tag_Size);
  
  static const fint bias = nthBit(expSize) / 2  -  1;
  static const fint selfBias = nthBit(selfExpSize) / 2  -  1;
  
  floatOop infinityOop = floatOop(nthMask(selfExpSize) << selfExpOffset
                                  |  Float_Tag);
  
  floatOop floatOopClass::as_floatOop(float value) {
    union { float f; uint32 i; } x;
    x.f = value;
    uint32 i = x.i;
    int32 exp     = i >> expOffset  &  nthMask(expSize);
    int32 selfExp = exp - bias + selfBias;
    int32 fract   = i & nthMask(fractSize);
    int32 r       = (i & (nthMask(signSize) << signOffset)) | Float_Tag;
    
    if (selfExp <= 0) {
      // underflow - round towards zero
    } else if (selfExp >= nthMask(selfExpSize)) {
      if (exp < nthMask(expSize)) {
        // warning1("converting float %g to Inf", value);
        r |= nthMask(selfExpSize) << selfExpOffset;
      } else if (fract == 0) {
        r |= int32(infinityOop);
      } else { // NaN
        r |= (nthMask(selfExpSize) << selfExpOffset) | (fract << Tag_Size);
      }
    } else {
      r |= (selfExp << selfExpOffset) | (fract << Tag_Size);
    }
    return floatOop(r);
  }
  
  
  float floatOopClass::value() {
    uint32 i = uint32(this);
    int32 selfExp = i >> selfExpOffset  &  nthMask(selfExpSize);
    int32 fract   = i >> Tag_Size  &  nthMask(fractSize);
    int32 exp     = selfExp - selfBias + bias;
    int32 r       = i & (nthMask(signSize) << signOffset);
    
    if (selfExp == 0) {
      assert(fract == 0, "self float is denormalized");
      // zero
    } else if (selfExp >= nthMask(selfExpSize)) {
      if (fract == 0) {
        r |= nthMask(expSize) << expOffset; // infinity
      } else {
        r |= (nthMask(expSize) << expOffset) | fract; // NaN
      }
    } else {
      r |= (exp << expOffset) | fract;
    }
    
    union { float f; uint32 i; } x;
    x.i = r;
    return x.f;
  }
# endif


# define CHECK_XY                                                             \
    if (!x->is_float() || !y->is_float()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);

# define FLOAT_PRIM(name, op)                                                 \
  oop name(floatOop x, floatOop y) {                                          \
    CHECK_XY;                                                                 \
    return as_floatOop(x->value() op y->value());                             \
  }

FLOAT_PRIM(float_add_prim, +)
FLOAT_PRIM(float_sub_prim, -)
FLOAT_PRIM(float_mul_prim, *)
      
oop float_div_prim(floatOop x, floatOop y) {
  CHECK_XY;
  float xv = x->value();
  float yv = y->value();
  if (yv == 0)
    return ErrorCodes::vmString_prim_error(DIVISIONBYZEROERROR);

  float quo = xv / yv;
  return as_floatOop(quo);
}

oop float_mod_prim(floatOop x, floatOop y) {
  CHECK_XY;
  const float xv = x->value();
  const float yv = y->value();
  if (yv == 0) {
    return ErrorCodes::vmString_prim_error(DIVISIONBYZEROERROR);
  }
  double res= fmod(xv, yv);
  return as_floatOop(res);
}

oop as_int_prim(floatOop x) {
  if (!x->is_float()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  float xv = x->value();
  if (xv < smiOop_min->value() || xv > smiOop_max->value()) {
    return ErrorCodes::vmString_prim_error(OVERFLOWERROR);
  } else {
    return as_smiOop((smi)rint(xv));
  }
}

oop as_float_prim(smiOop x) {
  if (!x->is_smi()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  return as_floatOop(x->as_float_prim());
}

inline float float_trunc(float x) {
  return x > 0 ? floor(x) : -(floor(-x));
}

# define FLOAT_FUN_PRIM(name, fun)                                            \
  oop name(floatOop x) {                                                      \
    if (!x->is_float()) return ErrorCodes::vmString_prim_error(BADTYPEERROR); \
    return as_floatOop(fun(x->value()));                                      \
  }

FLOAT_FUN_PRIM(float_floor_prim, floor)
FLOAT_FUN_PRIM(float_round_prim, rint)
FLOAT_FUN_PRIM(float_ceil_prim,  ceil)
FLOAT_FUN_PRIM(float_truncate_prim, float_trunc)


# define FLOAT_CMP_PRIM(name, op)                                             \
  oop name(floatOop x, floatOop y) {                                          \
    CHECK_XY;                                                                 \
    return (x->value() op y->value()) ? Memory->trueObj : Memory->falseObj;   \
  }

FLOAT_CMP_PRIM(float_lt_prim, <)
FLOAT_CMP_PRIM(float_le_prim, <=)
FLOAT_CMP_PRIM(float_eq_prim, ==)
FLOAT_CMP_PRIM(float_ne_prim, !=)
FLOAT_CMP_PRIM(float_gt_prim, >)
FLOAT_CMP_PRIM(float_ge_prim, >=)



# define MaxFloatString 20

void floatOopClass::make_print_string(char* buf, const char* format) {
  sprintf(buf, format, value());
  char c = buf[0];
  if ((c >= '0' && c <= '9') || (c == '-' && buf[1] >= '0' && buf[1] <= '9')) {
    char *p;
    for (p = &buf[0]; c= *p, c != '\0' ; p++)
      if (c == '.' || c == 'e' || c == 'E')
        return;
    *p++ = '.';
    *p++ = '0';
    *p = '\0';
    assert(p < &buf[MaxFloatString], "too many digits");
  }
}

void floatOopClass::print_string(char* buf) {
  make_print_string(buf);
}

void floatOopClass::print_oop() {
  char buf[MaxFloatString];
  make_print_string(buf);
  lprintf("%s", buf);
}

char *floatOopClass::print_string_prim() {
  static char buf[MaxFloatString];
  make_print_string(buf);
  return buf;
}

char *floatOopClass::print_string_precision_prim(smi precision) {
  char format[15];
  sprintf(format, "%%.%df", precision);
  static char buf[MaxFloatString];
  sprintf(buf, format, value());        // don't append .0 if 0 precision
  return buf;
}
