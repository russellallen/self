/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

/* C implementations of SMI arithmetic primitives for x86_64.
   Replaces i386/prims/asmPrims_i386.S */

# include "config.hh"
# if TARGET_ARCH == X86_64_ARCH

# include "_smiOop.cpp.incl"


// All smi primitives receive tagged smiOop values.
// Int_Tag is 0, so a smiOop's raw bit pattern is (value << Tag_Size).
// Addition and subtraction of two smiOops directly produces a correct
// smiOop result (since (a<<2) + (b<<2) == (a+b)<<2).
// Overflow is detected using GCC builtins.

static inline oop overflow_error() {
  return ErrorCodes::vmString_prim_error(OVERFLOWERROR);
}

static inline oop badtype_error() {
  return ErrorCodes::vmString_prim_error(BADTYPEERROR);
}


// =====================================================================
// Addition
// =====================================================================

extern "C" oop smi_add_prim(smiOop rcvr, smiOop arg) {
  // Type check
  if (!oop(rcvr)->is_smi()) return badtype_error();
  if (!oop(arg)->is_smi())  return badtype_error();

  // Add tagged values directly: (a<<2) + (b<<2) = (a+b)<<2
  smi a = smi(rcvr);
  smi b = smi(arg);
  smi result;
  if (__builtin_add_overflow(a, b, &result))
    return overflow_error();
  return oop(result);
}


// =====================================================================
// Subtraction
// =====================================================================

extern "C" oop smi_sub_prim(smiOop rcvr, smiOop arg) {
  if (!oop(rcvr)->is_smi()) return badtype_error();
  if (!oop(arg)->is_smi())  return badtype_error();

  smi a = smi(rcvr);
  smi b = smi(arg);
  smi result;
  if (__builtin_sub_overflow(a, b, &result))
    return overflow_error();
  return oop(result);
}


// =====================================================================
// Multiplication
// =====================================================================

extern "C" oop smi_mul_prim(smiOop rcvr, smiOop arg) {
  if (!oop(rcvr)->is_smi()) return badtype_error();
  if (!oop(arg)->is_smi())  return badtype_error();

  // Cannot multiply tagged values directly ((a<<2)*(b<<2) = ab<<4).
  // Extract values, multiply, check overflow, re-tag.
  smi a = smiOop(rcvr)->value();
  smi b = smiOop(arg)->value();
  smi result;
  if (__builtin_mul_overflow(a, b, &result))
    return overflow_error();

  // Check that the result fits in the smi range (Tag_Size bits lost)
  smi tagged = result << Tag_Size;
  if ((tagged >> Tag_Size) != result)
    return overflow_error();

  return oop(as_smiOop(result));
}


// =====================================================================
// Bitwise AND
// =====================================================================

extern "C" oop smi_and_prim(smiOop rcvr, smiOop arg) {
  if (!oop(rcvr)->is_smi()) return badtype_error();
  if (!oop(arg)->is_smi())  return badtype_error();

  // AND of two tagged smi values: tag bits are 0 for both, so result tag is 0
  return oop(smi(rcvr) & smi(arg));
}


// =====================================================================
// Bitwise OR
// =====================================================================

extern "C" oop smi_or_prim(smiOop rcvr, smiOop arg) {
  if (!oop(rcvr)->is_smi()) return badtype_error();
  if (!oop(arg)->is_smi())  return badtype_error();

  // OR of two tagged smi values: tag bits are 0 | 0 = 0, correct
  return oop(smi(rcvr) | smi(arg));
}


// =====================================================================
// Bitwise XOR
// =====================================================================

extern "C" oop smi_xor_prim(smiOop rcvr, smiOop arg) {
  if (!oop(rcvr)->is_smi()) return badtype_error();
  if (!oop(arg)->is_smi())  return badtype_error();

  // XOR of two tagged smi values: tag bits are 0 ^ 0 = 0, correct
  return oop(smi(rcvr) ^ smi(arg));
}


// =====================================================================
// Bitwise complement
// =====================================================================

extern "C" oop smi_complement_prim(smiOop rcvr) {
  if (!oop(rcvr)->is_smi()) return badtype_error();

  // Complement flips all bits including tag.  Fix the tag bits.
  smi result = ~smi(rcvr);
  result &= ~Tag_Mask;  // clear tag bits (set Int_Tag = 0)
  return oop(result);
}


// =====================================================================
// Arithmetic shift left
// =====================================================================

extern "C" oop smi_arithmetic_shift_left_prim(smiOop rcvr, smiOop arg) {
  if (!oop(rcvr)->is_smi()) return badtype_error();
  if (!oop(arg)->is_smi())  return badtype_error();

  smi value = smiOop(rcvr)->value();
  smi shift = smiOop(arg)->value();

  if (shift < 0 || shift >= (BitsPerWord - Tag_Size))
    return overflow_error();

  // Check for overflow: value must survive the shift
  smi result = value << shift;
  if ((result >> shift) != value)
    return overflow_error();

  return oop(as_smiOop(result));
}


// =====================================================================
// Logical shift left
// =====================================================================

extern "C" oop smi_logical_shift_left_prim(smiOop rcvr, smiOop arg) {
  if (!oop(rcvr)->is_smi()) return badtype_error();
  if (!oop(arg)->is_smi())  return badtype_error();

  smi value = smiOop(rcvr)->value();
  smi shift = smiOop(arg)->value();

  if (shift < 0 || shift >= (BitsPerWord - Tag_Size))
    return overflow_error();

  // Logical shift left is the same as arithmetic shift left for positive shifts
  smi result = value << shift;
  if ((result >> shift) != value)
    return overflow_error();

  return oop(as_smiOop(result));
}


// =====================================================================
// Arithmetic shift right
// =====================================================================

extern "C" oop smi_arithmetic_shift_right_prim(smiOop rcvr, smiOop arg) {
  if (!oop(rcvr)->is_smi()) return badtype_error();
  if (!oop(arg)->is_smi())  return badtype_error();

  smi value = smiOop(rcvr)->value();
  smi shift = smiOop(arg)->value();

  if (shift < 0 || shift >= (BitsPerWord - Tag_Size))
    return overflow_error();

  // Arithmetic right shift preserves sign bit
  smi result = value >> shift;
  return oop(as_smiOop(result));
}


// =====================================================================
// Logical shift right
// =====================================================================

extern "C" oop smi_logical_shift_right_prim(smiOop rcvr, smiOop arg) {
  if (!oop(rcvr)->is_smi()) return badtype_error();
  if (!oop(arg)->is_smi())  return badtype_error();

  smi value = smiOop(rcvr)->value();
  smi shift = smiOop(arg)->value();

  if (shift < 0 || shift >= (BitsPerWord - Tag_Size))
    return overflow_error();

  // Logical right shift uses unsigned to fill with zeros
  typedef unsigned long long usmi;
  usmi uvalue = (usmi)value;
  // Mask to smi-width bits before shifting
  usmi mask = (OneBit << (BitsPerWord - Tag_Size)) - OneBit;
  uvalue &= mask;
  smi result = (smi)(uvalue >> shift);
  return oop(as_smiOop(result));
}


# endif // TARGET_ARCH == X86_64_ARCH
