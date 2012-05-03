/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



smi bitSize(char *typeDesc, void *FH);
  // typeDesc:  string describing a C type or Self primitive type.
  // Return the size in bits of this type.


double CFloatDouble_At_prim(char *bytes, int len,
                            bool dobble, smi idx, void *FH);
  // Retrieve float from byte vector given by bytes, len.
  //    dobble:    whether to read a float or a double,
  //    idx:       where to find float in byte vector.


void CFloatDouble_At_Put_prim(char *bytes, int len,
                              bool dobble, smi idx, double val, void *FH);
  // Store float value into byte vector given by bytes, len.
  //    dobble:    whether to store as float or double,
  //    idx:       where to store in byte vector,
  //    val:       the value to store.


# ifndef  NO_LONG_LONG // no long long in CW

long long            CSignedIntSize_At_prim(char *bytes, int len, smi bitsize, smi idx, void *FH);
long long    BigEndianSignedIntSize_At_prim(char *bytes, int len, smi bitsize, smi idx, void *FH);
long long LittleEndianSignedIntSize_At_prim(char *bytes, int len, smi bitsize, smi idx, void *FH);
  // Retrieve signed integer from byte vector given by bytes, len.
  //    bitsize:   size of integer in bits,
  //    idx:       where to find integer in byte vector.


unsigned long long            CUnsignedIntSize_At_prim(char *bytes, int len, smi bitsize, smi idx, void *FH);
unsigned long long    BigEndianUnsignedIntSize_At_prim(char *bytes, int len, smi bitsize, smi idx, void *FH);
unsigned long long LittleEndianUnsignedIntSize_At_prim(char *bytes, int len, smi bitsize, smi idx, void *FH);
  // Retrieve unsigned integer from byte vector given by bytes, len.
  //    bitsize:   size of integer in bits,
  //    idx:       where to find integer in byte vector.


void            CSignedIntSize_At_Put_prim(char *bytes, int len, smi bitsize, smi idx, long long val, void *FH);
void    BigEndianSignedIntSize_At_Put_prim(char *bytes, int len, smi bitsize, smi idx, long long val, void *FH);
void LittleEndianSignedIntSize_At_Put_prim(char *bytes, int len, smi bitsize, smi idx, long long val, void *FH);
  // Store signed integer in byte vector given by bytes, len.
  //    bitsize:   size of integer in bits,
  //    idx:       where to store in byte vector,
  //    val:       the integer value to store.



void            CUnsignedIntSize_At_Put_prim(char *bytes, int len, smi bitsize, smi idx, unsigned long long val, void *FH);
void    BigEndianUnsignedIntSize_At_Put_prim(char *bytes, int len, smi bitsize, smi idx, unsigned long long val, void *FH);
void LittleEndianUnsignedIntSize_At_Put_prim(char *bytes, int len, smi bitsize, smi idx, unsigned long long val, void *FH);
  // Store signed integer in byte vector given by bytes, len.
  //    bitsize:   size of integer in bits,
  //    idx:       where to store in byte vector,
  //    val:       the integer value to store.
  
# endif


oop date_time_prim(smi day, smi msec);

oop convert_to_day_ms_prim(objVectorOop l, void *FH);

oop current_time_string_prim();

oop real_time_prim(void *FH);


inline smi monitor_height_prim() { return TheSpy->max_height(); }

oop primitive_documentation(const char *prim_name);

oop primitive_list_prim(void *FH);

oop command_line_prim(void *FH);

oop copyByteRange_prim(oop dst, oop dstPos, oop src, oop srcPos, oop len);
oop     copyRange_prim(oop dst, oop dstPos, oop src, oop srcPos, oop len);
  

// ***************** Primitives for 32/64 bit integers *****************

oop int32_add_prim (oop proto, oop o1, oop o2);
oop int32_sub_prim (oop proto, oop o1, oop o2);
oop int32_mul_prim (oop proto, oop o1, oop o2);
oop int32_div_prim (oop proto, oop o1, oop o2);
oop int32_rem_prim (oop proto, oop o1, oop o2);
oop int32_and_prim (oop proto, oop o1, oop o2);
oop int32_or_prim  (oop proto, oop o1, oop o2);
oop int32_xor_prim (oop proto, oop o1, oop o2);
oop int32_shl_prim (oop proto, oop o1, oop o2);
oop int32_shr_prim (oop proto, oop o1, oop o2);
oop int32_ushr_prim(oop proto, oop o1, oop o2);
oop int32_cmp_prim (oop proto, oop o1, oop o2);

oop int64_add_prim (oop proto, oop o1, oop o2);
oop int64_sub_prim (oop proto, oop o1, oop o2);
oop int64_mul_prim (oop proto, oop o1, oop o2);
oop int64_div_prim (oop proto, oop o1, oop o2);
oop int64_rem_prim (oop proto, oop o1, oop o2);
oop int64_and_prim (oop proto, oop o1, oop o2);
oop int64_or_prim  (oop proto, oop o1, oop o2);
oop int64_xor_prim (oop proto, oop o1, oop o2);
oop int64_shl_prim (oop proto, oop o1, oop o2);
oop int64_shr_prim (oop proto, oop o1, oop o2);
oop int64_ushr_prim(oop proto, oop o1, oop o2);
oop int64_cmp_prim (oop proto, oop o1, oop o2);

oop int8_from_int32_prim (oop proto, oop o1);
oop int16_from_int32_prim(oop proto, oop o1);

oop float_from_int32_prim(oop o1);
oop int32_from_float_prim(oop proto, oop o1);


# ifndef  NO_LONG_LONG

  oop int64_from_int32_prim(oop proto, oop o1);

  oop int8_from_int64_prim (oop proto, oop o1);
  oop int16_from_int64_prim(oop proto, oop o1);
  oop int32_from_int64_prim(oop proto, oop o1);

  oop int64_from_float_prim(oop proto, oop o1);

  oop float_from_int64_prim(oop o1);

# endif

#define ENTRY(primName, fctName, comment, primType)                           \
{                                                                             \
 primName, fntype(&fctName),                                                  \
 ExternalPrimitive, primType,                                                 \
 true, true, true, false, false, false,                                       \
 comment                                                                      \
},

#define I_ENTRY(primName, fctName, comment)                                   \
  ENTRY(primName, fctName, comment, IntegerPrimType)

#define F_ENTRY(primName, fctName, comment)                                   \
  ENTRY(primName, fctName, comment, FloatPrimType)

#define U_ENTRY(primName, fctName, comment)                                   \
  ENTRY(primName, fctName, comment, UnknownPrimType)


# ifdef NO_LONG_LONG
# define LARGE_LARGE_INT_PRIM_TABLE_ENTRIES
# else
# define LARGE_LARGE_INT_PRIM_TABLE_ENTRIES                                   \
U_ENTRY("Int64:Add:",    int64_add_prim,  "64 bit int add")                   \
U_ENTRY("Int64:Sub:",    int64_sub_prim,  "64 bit int sub")                   \
U_ENTRY("Int64:Mul:",    int64_mul_prim,  "64 bit int mul")                   \
U_ENTRY("Int64:Div:",    int64_div_prim,  "64 bit int div")                   \
U_ENTRY("Int64:Rem:",    int64_rem_prim,  "64 bit int remainder")             \
U_ENTRY("Int64:And:",    int64_and_prim,  "64 bit int bitwise and")           \
U_ENTRY("Int64:Or:",     int64_or_prim,   "64 bit int bitwise or")            \
U_ENTRY("Int64:Xor:",    int64_xor_prim,  "64 bit int bitwise xor")           \
U_ENTRY("Int64:Shl:",    int64_shl_prim,  "64 bit int left shift")            \
U_ENTRY("Int64:Shr:",    int64_shr_prim,  "64 bit int right shift")           \
U_ENTRY("Int64:Ushr:",   int64_ushr_prim, "64 bit int unsigned left shift")   \
I_ENTRY("Int64:Cmp:",    int64_cmp_prim,  "64 bit int comparison")            \
                                                                              \
U_ENTRY("Int64FromInt32:", int64_from_int32_prim, "32 to 64 bit int conv.")   \
                                                                              \
I_ENTRY("Int8FromInt64:",  int8_from_int64_prim,  "64 to 8 bit int conv.")    \
I_ENTRY("Int16FromInt64:", int16_from_int64_prim, "64 to 16 bit int conv.")   \
U_ENTRY("Int32FromInt64:", int32_from_int64_prim, "64 to 32 bit int conv.")   \
                                                                              \
U_ENTRY("Int64FromFloat:", int64_from_float_prim, "float to 64 bit int conv.")\
F_ENTRY("FloatFromInt64",  float_from_int64_prim, "64 bit int to float conv.")\

# endif

#define LARGE_INT_PRIM_TABLE_ENTRIES                                          \
U_ENTRY("Int32:Add:",    int32_add_prim,  "32 bit int add")                   \
U_ENTRY("Int32:Sub:",    int32_sub_prim,  "32 bit int sub")                   \
U_ENTRY("Int32:Mul:",    int32_mul_prim,  "32 bit int mul")                   \
U_ENTRY("Int32:Div:",    int32_div_prim,  "32 bit int div")                   \
U_ENTRY("Int32:Rem:",    int32_rem_prim,  "32 bit int remainder")             \
U_ENTRY("Int32:And:",    int32_and_prim,  "32 bit int bitwise and")           \
U_ENTRY("Int32:Or:",     int32_or_prim,   "32 bit int bitwise or")            \
U_ENTRY("Int32:Xor:",    int32_xor_prim,  "32 bit int bitwise xor")           \
U_ENTRY("Int32:Shl:",    int32_shl_prim,  "32 bit int left shift")            \
U_ENTRY("Int32:Shr:",    int32_shr_prim,  "32 bit int right shift")           \
U_ENTRY("Int32:Ushr:",   int32_ushr_prim, "32 bit int unsigned left shift")   \
I_ENTRY("Int32:Cmp:",    int32_cmp_prim,  "32 bit int comparison")            \
                                                                              \
I_ENTRY("Int8FromInt32:",  int8_from_int32_prim,  "32 to 8 bit int conv.")    \
I_ENTRY("Int16FromInt32:", int16_from_int32_prim, "32 to 16 bit int conv.")   \
                                                                              \
F_ENTRY("FloatFromInt32",  float_from_int32_prim, "32 bit int to float conv.")\
                                                                              \
U_ENTRY("Int32FromFloat:", int32_from_float_prim, "float to 32 bit int conv.")\
LARGE_LARGE_INT_PRIM_TABLE_ENTRIES


oop test_args_prim(oop rcvr, oop a1, oop a2, oop a3, oop a4, oop a5, oop a6, oop a7,
                   oop a8, oop a9, oop a10, oop a11, oop a12, oop a13, oop a14, oop a15, oop a16);
