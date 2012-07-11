/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "miscPrims.hh"
# include "_miscPrims.cpp.incl"

# ifndef  NO_LONG_LONG
  typedef          long long int64;
  typedef unsigned long long uint64;
# endif


smi bitSize(char *typeDesc, void *FH) {
  // typeDesc:  string describing a C type or Self primitive type.
  // Return the size in bits of this type.
  if (!strcmp(typeDesc,"self_int"))
    return BitsPerByte * sizeof(smi) - Tag_Size;
  if (!strcmp(typeDesc,"self_float"))
    return BitsPerByte * sizeof(float) - Tag_Size;

  # define GETSIZE(typename,type) {                                           \
    if (!strcmp(typename,typeDesc))                                           \
      return BitsPerByte * sizeof(type);                                      \
  }
  GETSIZE("char",        char)
  GETSIZE("short",       short)
  GETSIZE("int",         int)
  GETSIZE("long",        long)
# ifndef  NO_LONG_LONG
  GETSIZE("long long",   long long)
# endif
  GETSIZE("float",       float)
  GETSIZE("double",      double)
  GETSIZE("long double", long double)
  GETSIZE("void *",      void *)
  # undef GETSIZE
  prim_failure(FH, PRIMITIVEFAILEDERROR);
  return 0;
}


// *************** Storing/retrieving C types in byte vectors *****************

static inline bool moveToRaw(char *raw, char *bytes, smi len,
                             smi idx, smi size, void *FH) {
  // Check that idx and idx+size-1 are valid indices in a byte vector of
  // length len. Return true if all is OK, else set prim error and return
  // false.
  if (idx < 0 || idx + size > len) {
    prim_failure(FH, BADINDEXERROR);
    return false;
  }
  copy_bytes_up(bytes + idx, raw, size);
  return true;
}

static inline bool moveFromRaw(char *raw, char *bytes, smi len,
                               smi idx, smi size, void *FH) {
  // Check that idx and idx+size-1 are valid indices in a byte vector of
  // length len. Return true if all is OK, else set prim error and return
  // false.

  if (idx < 0 || idx + size > len) {
    prim_failure(FH, BADINDEXERROR);
    return false;
  }
  copy_bytes_up(raw, bytes + idx, size);
  return true;
}


double CFloatDouble_At_prim(char *bytes, int len,
                            bool dobble, smi idx, void *FH) {
  // Retrieve float from byte vector given by bytes, len.
  //    dobble:    whether to read a float or a double,
  //    idx:       where to find float in byte vector.

  if (dobble) {
    double f;
    if (moveToRaw((char *)&f, bytes, len, idx, sizeof(f), FH)) return f;
  } else {
    float f;
    if (moveToRaw((char *)&f, bytes, len, idx, sizeof(f), FH)) return f;
  }
  return 0.0;
}


void CFloatDouble_At_Put_prim(char *bytes, int len,
                              bool dobble, smi idx, double val, void *FH) {
  // Store float value into byte vector given by bytes, len.
  //    dobble:    whether to store as float or double,
  //    idx:       where to store in byte vector,
  //    val:       the value to store.

  if (dobble) {
    double f = val;
    moveFromRaw((char *)&f, bytes, len, idx, sizeof(double), FH);
  } else {
    float f = val;
    moveFromRaw((char *)&f, bytes, len, idx, sizeof(float), FH);
  }
}

#define GET_CASE(base, nn)                                                    \
  case nn: { CONC(base, nn) i;                                                \
             if (moveToRaw((char *)&i, bytes, len, idx, sizeof(i), FH))       \
               return i;                                                      \
             break;                                                           \
           }                                                                  \

# ifndef NO_LONG_LONG

  long long CSignedIntSize_At_prim(char *bytes, int len,
                              smi bitsize, smi idx, void *FH) {
    // Retrieve signed integer from byte vector given by bytes, len.
    //    bitsize:   size of integer in bits,
    //    idx:       where to find integer in byte vector.
    switch(bitsize) {
      GET_CASE(int,  8)
      GET_CASE(int, 16)
      GET_CASE(int, 32)
#     ifndef NO_LONG_LONG
      GET_CASE(int, 64)
#     endif
      default: prim_failure(FH, BADSIZEERROR);
    }
    return 0;
  }

  unsigned long long CUnsignedIntSize_At_prim(char *bytes, int len,
                                              smi bitsize, smi idx, void *FH) {
    // Retrieve unsigned integer from byte vector given by bytes, len.
    //    bitsize:   size of integer in bits,
    //    idx:       where to find integer in byte vector.
    switch(bitsize) {
      GET_CASE(uint,  8)
      GET_CASE(uint, 16)
      GET_CASE(uint, 32)
#     ifndef NO_LONG_LONG
      GET_CASE(uint, 64)
#     endif
      default: prim_failure(FH, BADSIZEERROR);
    }
    return 0;
  }

  #define PUT_CASE(base, nn)                                                  \
    case nn: { CONC(base, nn) i = val;                                        \
               moveFromRaw((char *)&i, bytes, len, idx, sizeof(i), FH);       \
               break;                                                         \
             }

  void CSignedIntSize_At_Put_prim(char *bytes, int len, smi bitsize,
                                  smi idx, long long val, void *FH) {
    // Store signed integer in byte vector given by bytes, len.
    //    bitsize:   size of integer in bits,
    //    idx:       where to store in byte vector,
    //    val:       the integer value to store.
    switch(bitsize) {
      PUT_CASE(int,  8)
      PUT_CASE(int, 16)
      PUT_CASE(int, 32)
#     ifndef NO_LONG_LONG
      PUT_CASE(int, 64)
#     endif
      default: prim_failure(FH, BADSIZEERROR);
    }
  }


  void CUnsignedIntSize_At_Put_prim(char *bytes, int len, smi bitsize, smi idx,
                                    unsigned long long val, void *FH) {
    // Store unsigned integer in byte vector given by bytes, len.
    //    bitsize:   size of integer in bits,
    //    idx:       where to store in byte vector,
    //    val:       the integer value to store.
    switch(bitsize) {
      PUT_CASE(uint,  8)
      PUT_CASE(uint, 16)
      PUT_CASE(uint, 32)
#     ifndef NO_LONG_LONG
      PUT_CASE(uint, 64)
#     endif
      default: prim_failure(FH, BADSIZEERROR);
    }
}


  long long BigEndianSignedIntSize_At_prim(char *sbp, int len,
                              smi bitsize, smi idx, void *FH) {
    // Retrieve signed integer from byte vector given by bytes, len.
    //    bitsize:   size of integer in bits,
    //    idx:       where to find integer in byte vector.
    typedef long long r_t;
    unsigned char* ubp = (unsigned char*)sbp;
    switch(bitsize) {
      case  8:  return  (r_t)sbp[idx + 0];
      case 16:  return ((r_t)sbp[idx + 0] <<  8) | ((r_t)ubp[idx + 1]);
      case 32:  return ((r_t)sbp[idx + 0] << 24) | ((r_t)ubp[idx + 1] << 16) | ((r_t)ubp[idx + 2] <<  8) | ((r_t)ubp[idx + 3] <<  0);
#     ifndef NO_LONG_LONG
      case 64:  return ((r_t)sbp[idx + 0] << 56) | ((r_t)ubp[idx + 1] << 48) | ((r_t)ubp[idx + 2] << 40) | ((r_t)ubp[idx + 3] << 32)
                     | ((r_t)ubp[idx + 4] << 24) | ((r_t)ubp[idx + 5] << 16) | ((r_t)ubp[idx + 6] <<  8) | ((r_t)ubp[idx + 7] <<  0);
#     endif
      default: prim_failure(FH, BADSIZEERROR);
    }
    return 0;
  }

  unsigned long long BigEndianUnsignedIntSize_At_prim(char *sbp, int len,
                                              smi bitsize, smi idx, void *FH) {
    // Retrieve unsigned integer from byte vector given by bytes, len.
    //    bitsize:   size of integer in bits,
    //    idx:       where to find integer in byte vector.
    // Retrieve signed integer from byte vector given by bytes, len.
    //    bitsize:   size of integer in bits,
    //    idx:       where to find integer in byte vector.
    typedef unsigned long long r_t;
    unsigned char* ubp = (unsigned char*)sbp;
    switch(bitsize) {
      case  8:  return  (r_t)ubp[idx + 0];
      case 16:  return ((r_t)ubp[idx + 0] <<  8) | ((r_t)ubp[idx + 1]);
      case 32:  return ((r_t)ubp[idx + 0] << 24) | ((r_t)ubp[idx + 1] << 16) | ((r_t)ubp[idx + 2] <<  8) | ((r_t)ubp[idx + 3] <<  0);
#     ifndef NO_LONG_LONG
      case 64:  return ((r_t)ubp[idx + 0] << 56) | ((r_t)ubp[idx + 1] << 48) | ((r_t)ubp[idx + 2] << 40) | ((r_t)ubp[idx + 3] << 32)
                     | ((r_t)ubp[idx + 4] << 24) | ((r_t)ubp[idx + 5] << 16) | ((r_t)ubp[idx + 6] <<  8) | ((r_t)ubp[idx + 7] <<  0);
#     endif
      default: prim_failure(FH, BADSIZEERROR);
    }
    return 0;
  }


  void BigEndianSignedIntSize_At_Put_prim(char *bytes, int len, smi bitsize,
                                  smi idx, long long val, void *FH) {
    // Store signed integer in byte vector given by bytes, len.
    //    bitsize:   size of integer in bits,
    //    idx:       where to store in byte vector,
    //    val:       the integer value to store.
    switch(bitsize) {
#     ifndef NO_LONG_LONG
      case 64:  bytes[idx++] = char(val >> 56);
                bytes[idx++] = char(val >> 48);
                bytes[idx++] = char(val >> 40);
                bytes[idx++] = char(val >> 32);
#     endif
      case 32:  bytes[idx++] = char(val >> 24);
                bytes[idx++] = char(val >> 16);
      case 16:  bytes[idx++] = char(val >>  8);
      case  8:  bytes[idx++] = char(val >>  0);
                break;
      default: prim_failure(FH, BADSIZEERROR);
    }
  }


  void BigEndianUnsignedIntSize_At_Put_prim(char *bytes, int len, smi bitsize, smi idx,
                                    unsigned long long val, void *FH) {
    // Store unsigned integer in byte vector given by bytes, len.
    //    bitsize:   size of integer in bits,
    //    idx:       where to store in byte vector,
    //    val:       the integer value to store.
    switch(bitsize) {
#     ifndef NO_LONG_LONG
      case 64:  bytes[idx++] = char(val >> 56);
                bytes[idx++] = char(val >> 48);
                bytes[idx++] = char(val >> 40);
                bytes[idx++] = char(val >> 32);
#     endif
      case 32:  bytes[idx++] = char(val >> 24);
                bytes[idx++] = char(val >> 16);
      case 16:  bytes[idx++] = char(val >>  8);
      case  8:  bytes[idx++] = char(val >>  0);
                break;
      default: prim_failure(FH, BADSIZEERROR);
    }
}

  long long LittleEndianSignedIntSize_At_prim(char *sbp, int len,
                              smi bitsize, smi idx, void *FH) {
    // Retrieve signed integer from byte vector given by bytes, len.
    //    bitsize:   size of integer in bits,
    //    idx:       where to find integer in byte vector.
    typedef long long r_t;
    unsigned char* ubp = (unsigned char*)sbp;
    switch(bitsize) {
      case  8:  return  (r_t)sbp[idx + 0];
      case 16:  return ((r_t)sbp[idx + 1] <<  8) | ((r_t)ubp[idx + 0]);
      case 32:  return ((r_t)sbp[idx + 3] << 24) | ((r_t)ubp[idx + 2] << 16) | ((r_t)ubp[idx + 1] <<  8) | ((r_t)ubp[idx + 0] <<  0);
#     ifndef NO_LONG_LONG
      case 64:  return ((r_t)sbp[idx + 7] << 56) | ((r_t)ubp[idx + 6] << 48) | ((r_t)ubp[idx + 5] << 40) | ((r_t)ubp[idx + 4] << 32)
                     | ((r_t)ubp[idx + 3] << 24) | ((r_t)ubp[idx + 2] << 16) | ((r_t)ubp[idx + 1] <<  8) | ((r_t)ubp[idx + 0] <<  0);
#     endif
      default: prim_failure(FH, BADSIZEERROR);
    }
    return 0;
  }

  unsigned long long LittleEndianUnsignedIntSize_At_prim(char *sbp, int len,
                                              smi bitsize, smi idx, void *FH) {
    // Retrieve unsigned integer from byte vector given by bytes, len.
    //    bitsize:   size of integer in bits,
    //    idx:       where to find integer in byte vector.
    typedef unsigned long long r_t;
    unsigned char* ubp = (unsigned char*)sbp;
    switch(bitsize) {
      case  8:  return  (r_t)ubp[idx + 0];
      case 16:  return ((r_t)ubp[idx + 1] <<  8) | ((r_t)ubp[idx + 0]);
      case 32:  return ((r_t)ubp[idx + 3] << 24) | ((r_t)ubp[idx + 2] << 16) | ((r_t)ubp[idx + 1] <<  8) | ((r_t)ubp[idx + 0] <<  0);
#     ifndef NO_LONG_LONG
      case 64:  return ((r_t)ubp[idx + 7] << 56) | ((r_t)ubp[idx + 6] << 48) | ((r_t)ubp[idx + 5] << 40) | ((r_t)ubp[idx + 4] << 32)
                     | ((r_t)ubp[idx + 3] << 24) | ((r_t)ubp[idx + 2] << 16) | ((r_t)ubp[idx + 1] <<  8) | ((r_t)ubp[idx + 0] <<  0);
#     endif
      default: prim_failure(FH, BADSIZEERROR);
    }
    return 0;
  }


  void LittleEndianSignedIntSize_At_Put_prim(char *bytes, int len, smi bitsize,
                                  smi idx, long long val, void *FH) {
    // Store signed integer in byte vector given by bytes, len.
    //    bitsize:   size of integer in bits,
    //    idx:       where to store in byte vector,
    //    val:       the integer value to store.
    switch (bitsize) {
      case 64: idx += 8;  break;
      case 32: idx += 4;  break;
      case 16: idx += 2;  break;
      case  8: idx += 1;  break;
      default: prim_failure(FH, BADSIZEERROR);
    }      
    switch(bitsize) {
#     ifndef NO_LONG_LONG
      case 64:  bytes[--idx] = char(val >> 56);
                bytes[--idx] = char(val >> 48);
                bytes[--idx] = char(val >> 40);
                bytes[--idx] = char(val >> 32);
#     endif
      case 32:  bytes[--idx] = char(val >> 24);
                bytes[--idx] = char(val >> 16);
      case 16:  bytes[--idx] = char(val >>  8);
      case  8:  bytes[--idx] = char(val >>  0);
    }
  }


  void LittleEndianUnsignedIntSize_At_Put_prim(char *bytes, int len, smi bitsize, smi idx,
                                    unsigned long long val, void *FH) {
    // Store unsigned integer in byte vector given by bytes, len.
    //    bitsize:   size of integer in bits,
    //    idx:       where to store in byte vector,
    //    val:       the integer value to store.
    switch (bitsize) {
      case 64: idx += 8;  break;
      case 32: idx += 4;  break;
      case 16: idx += 2;  break;
      case  8: idx += 1;  break;
      default: prim_failure(FH, BADSIZEERROR);
    }      
    switch(bitsize) {
#     ifndef NO_LONG_LONG
      case 64:  bytes[--idx] = char(val >> 56);
                bytes[--idx] = char(val >> 48);
                bytes[--idx] = char(val >> 40);
                bytes[--idx] = char(val >> 32);
#     endif
      case 32:  bytes[--idx] = char(val >> 24);
                bytes[--idx] = char(val >> 16);
      case 16:  bytes[--idx] = char(val >>  8);
      case  8:  bytes[--idx] = char(val >>  0);
  }
}


# endif

const int dateTimeBufSize = 18;

oop date_time_prim(smi day, smi msec) {
  smi buf[dateTimeBufSize];
  OS::date_time(day, msec, buf);
  objVectorOop res = Memory->objVectorObj->cloneSize(dateTimeBufSize);
  for(int i = 0; i < dateTimeBufSize; i++) {
    res->obj_at_put(i, as_smiOop(buf[i]), false);
  }
  return res;
}

oop convert_to_day_ms_prim(objVectorOop l, void *FH) {
  if (l->length() != 8) {
    prim_failure(FH, BADSIZEERROR);
    return 0;
  }
  for (int i=0; i < 8; i++) {
    if (!l->obj_at(i)->is_smi()) {
      prim_failure(FH, BADTYPEERROR);
      return 0;
    }
  }
  smi msAndDays[2];
  if (!OS::time_to_day_and_ms(l, msAndDays)) {
    prim_failure(FH, PRIMITIVEFAILEDERROR);
    return 0;
  }
  objVectorOop res = Memory->objVectorObj->cloneSize(2);
  res->obj_at_put(0, as_smiOop(msAndDays[0]), false);
  res->obj_at_put(1, as_smiOop(msAndDays[1]), false);
  return res;
}


oop real_time_prim(void *FH) {
  smi buf[2];
  OS::real_time(buf);
  if (as_smiOop(buf[0])->value() != buf[0] ||
      as_smiOop(buf[1])->value() != buf[1]) {
    prim_failure(FH, OVERFLOWERROR);
    return 0;
  }
  objVectorOop res = Memory->objVectorObj->cloneSize(2);
  res->obj_at_put(0, as_smiOop(buf[0]), false);
  res->obj_at_put(1, as_smiOop(buf[1]), false);
  return res;
}

oop current_time_string_prim() {
  ResourceMark rm;
  return new_string(OS::current_time_string());
}


// Returns a vector containing all primitives names.
oop primitive_list_prim(void *FH) {
  ResourceMark rm;
  char prim_name[BUFSIZ];
  int num_of_prim  = 0;

  PrimDesc* e;
  PrimDesc** ft;
  for (ft = primDescTable(); *ft; ft++)
    for (e = *ft; e->name(); e++)
      if (e->type() != InternalPrimitive)
        num_of_prim++;

  objVectorOop result= Memory->objVectorObj->cloneSize(num_of_prim, CANFAIL);
  if (oop(result) == failedAllocationOop) {
    out_of_memory_failure(FH, Memory->objVectorObj->size() + num_of_prim);
    return 0;
  }

  int index = 0;
  for (ft = primDescTable(); *ft; ft++)
    for (e = *ft; e->name(); e++)
      if (e->type() != InternalPrimitive) {
        strcpy(prim_name, "_");
        strcat(prim_name, e->name());
        oop string= oop(new_string_or_fail(prim_name));
        if (string == oop(failedAllocationOop)) {
          out_of_memory_failure(FH);
          return 0;
        }
        result->obj_at_put(index++, string);
      }
  return result;
}

// Returns the documentation for a primitive
oop primitive_documentation(const char *prim_name) {
  if (!str_is_prim_name(prim_name)) return 0;
  const char* name = &prim_name[1];
  PrimDesc* e;
  for (PrimDesc** ft = primDescTable(); *ft; ft++)
    for (e = *ft; e->name(); e++)
      if (e->type() != InternalPrimitive)
        if (strcmp(e->name(), name) == 0) {
          const char* doc = e->docString();
          return new_string(doc ? doc : "");
        }
  return 0;
}

// Returns command line arguments
oop command_line_prim(void *FH) {
  objVectorOop result= Memory->objVectorObj->cloneSize(prog_argc, CANFAIL);
  if (oop(result) == failedAllocationOop) {
    out_of_memory_failure(FH, Memory->objVectorObj->size() + prog_argc);
    return 0;
  }

  for (int index= 0; index < prog_argc; index++) {
    oop argi= new_string_or_fail((char*)prog_argv[index]);
    if (argi == failedAllocationOop) {
      out_of_memory_failure(FH);
      return 0;
    }
    result->obj_at_put(index, argi);
  }
  return result;
}

// ***************** objVector and byteVector copying prims *****************

#define BV_OV_COPY(name, kind, check, copy_action)                            \
  oop name(oop dst, oop dstPos, oop src, oop srcPos, oop len) {               \
    if (!dst->CONC(is_, kind)() ||                                            \
        !src->CONC(is_, kind)() ||                                            \
        check                                                                 \
        !dstPos->is_smi()       ||                                            \
        !dst->CONC(is_, kind)() ||                                            \
        !srcPos->is_smi()       ||                                            \
        !len->is_smi()) return ErrorCodes::vmString_prim_error(BADTYPEERROR); \
    CONC(kind, Oop) dst0 = CONC(kind, Oop)(dst);                              \
    CONC(kind, Oop) src0 = CONC(kind, Oop)(src);                              \
    smi dstPos0 = smiOop(dstPos)->value();                                    \
    smi srcPos0 = smiOop(srcPos)->value();                                    \
    smi len0    = smiOop(len)->value();                                       \
    if (dstPos0 < 0 || srcPos0 < 0 || len0 < 0 ||                             \
        dstPos0 + len0 > dst0->length() ||                                    \
        srcPos0 + len0 > src0->length()) return ErrorCodes::vmString_prim_error(BADINDEXERROR); \
    copy_action                                                               \
    return dst;                                                               \
  }

BV_OV_COPY(copyRange_prim, objVector,,                                        \
  oop *from = src0->objs(srcPos0);                                            \
  oop *to   = dst0->objs(dstPos0);                                            \
  copy_oops_overlapping(from, to, len0);                                      \
  Memory->record_multistores(from, from + len0);                              \
)

BV_OV_COPY(copyByteRange_prim, byteVector, dst->is_string() ||,               \
  copy_bytes_overlapping(src0->bytes(srcPos0), dst0->bytes(dstPos0), len0);)


// ***************** Primitives for 32/64 bit integers *****************

#define CONC4(a,b,c,d) a##b##c##d

typedef class {public: int32 s[2];} two_int32s;

inline static void memorycopy(void *to, void *from, int size) {
  if (size == 4)
    *(int32 *)to = *(int32 *)from;
  else if (size == 8)
    /* Cannot transfer the value by casting to int64 -- aligment of
       Self byte vectors is insufficient, resulting in a bus error. */
    *(two_int32s *)to = *(two_int32s *)from;
  else
    fatal("unsupported size");
}

#define CONVERT_ARG(ctype, arg_in, arg_out)                                   \
  if (arg_in->is_smi()) {                                                     \
    *arg_out = (ctype)smiOop(arg_in)->value();                                \
  } else if (arg_in->is_byteVector()) {                                       \
    if (byteVectorOop(arg_in)->length() < sizeof(ctype))                      \
      return ErrorCodes::vmString_prim_error(BADINDEXERROR);                  \
    memorycopy(arg_out, byteVectorOop(arg_in)->bytes(), sizeof(ctype));       \
  } else                                                                      \
    return ErrorCodes::vmString_prim_error(BADTYPEERROR);                     \

#define CONVERT_1_ARG(ctype)                                                  \
  static oop CONC(convert1arg_, ctype)(oop o1, ctype *a1) {                   \
    CONVERT_ARG(ctype, o1, a1)                                                \
    return 0;                                                              \
  }

#define CONVERT_2_ARGS(ctype)                                                 \
  static oop CONC(convert2args_, ctype)                                       \
                         (oop o1, oop o2, ctype *a1, ctype *a2) {             \
    CONVERT_ARG(ctype, o1, a1)                                                \
    CONVERT_ARG(ctype, o2, a2)                                                \
    return 0;                                                              \
  }

#define CONVERT_INTEGER_RESULT(ctype)                                         \
  oop CONC(convert_result_, ctype)(oop proto, ctype cres) {                   \
    smiOop smiRes = as_smiOop(cres);                                          \
    if (cres == smiRes->value()) return smiRes;                               \
    if (!proto->is_byteVector()) return ErrorCodes::vmString_prim_error(BADTYPEERROR);             \
    byteVectorOop res = byteVectorOop(proto)->cloneSize(sizeof(ctype));       \
    memorycopy(res->bytes(), &cres, sizeof(ctype));                           \
    return res;                                                               \
  }

#define SMI_RESULT(ctype, exp)                                                \
  ctype cres = exp;                                                           \
  assert(cres == (ctype)as_smiOop(cres)->value(), "smi overflow");            \
  return as_smiOop(cres);

#define INT_RESULT(ctype, exp)                                                \
  return CONC(convert_result_, ctype)(proto, exp);

#define FLOAT_RESULT(ctype, exp)                                              \
  return as_floatOop((float)(exp));

#define CMP_RESULT                                                            \
  Unused(proto);                                                              \
  if (a1  > a2) return smiOop_one;                                            \
  if (a1 == a2) return smiOop_zero;                                           \
  return as_smiOop(-1);

#define INT_PRIM(name, ctype, exp, check)                                     \
  BINARY_PRIM(name, ctype, exp, check, INT_RESULT(ctype, exp))

#define CMP_PRIM(ctype)                                                       \
  BINARY_PRIM(cmp, ctype, , , CMP_RESULT)

#define DIV_0_CHECK if(a2 == 0) return ErrorCodes::vmString_prim_error(DIVISIONBYZEROERROR);
#define MASK32      (a2 & 0x1F)
#define MASK64      (a2 & 0x3F)
#define FAST_CONV   if(o1->is_smi()) return o1;

#define BINARY_PRIM(name, ctype, exp, check, result)                          \
  oop CONC4(ctype, _, name, _prim)(oop proto, oop o1, oop o2) {               \
    ctype a1, a2;                                                             \
    oop conv = CONC(convert2args_, ctype)(o1, o2, &a1, &a2);                  \
    if (conv) return conv;                                                    \
    check                                                                     \
    result                                                                    \
  }

#define CONVERSION_PRIM(to_ctype, from_ctype, fast, result)                   \
  oop CONC4(to_ctype, _from_, from_ctype, _prim)(oop proto, oop o1) {         \
    Unused(proto);                                                            \
    fast                                                                      \
    from_ctype a1;                                                            \
    oop conv = CONC(convert1arg_, from_ctype)(o1, &a1);                       \
    if (conv) return conv;                                                    \
    result(to_ctype, (to_ctype)a1)                                            \
  }

#define FLOAT_FROM_INT_CONVERSION(ctype)                                      \
  oop CONC3(float_from_, ctype, _prim)(oop o1) {                              \
    ctype a1;                                                                 \
    oop conv = CONC(convert1arg_, ctype)(o1, &a1);                            \
    if (conv) return conv;                                                    \
    FLOAT_RESULT(ctype, (float)a1)                                            \
  }

#define INT_FROM_FLOAT_CONVERSION(ctype)                                      \
  oop CONC(ctype, _from_float_prim)(oop proto, oop o1) {                      \
    if (!o1->is_float()) return ErrorCodes::vmString_prim_error(BADTYPEERROR); \
    INT_RESULT(ctype, (ctype)floatOop(o1)->value())                           \
  }

# ifdef NO_LONG_LONG
# define INT_PRIMS_LL(name, exp, check)
# else
# define INT_PRIMS_LL(name, exp, check)  INT_PRIM(name, int64, exp, check)
# endif

#define INT_PRIMS(name, exp, check)                                           \
  INT_PRIM(name, int32, exp, check)                                           \
  INT_PRIMS_LL(name, exp, check)


/* Instantiate the argument and result converter helper functions.

   Although it would be easier to just have macroes that does the
   conversions inline, we call functions for these conversions
   because they are needed in many places (having zillions of copies
   of code boxing/unboxing  ints takes up valuable memory, not to
   mention cache space. A quick measurement of performance indicates
   some 2-3% slower execution of a primitive like int64_add(0,0) when
   calling functions.
*/

CONVERT_1_ARG(int32)
CONVERT_2_ARGS(int32)
CONVERT_INTEGER_RESULT(int32)

# ifndef NO_LONG_LONG
  CONVERT_1_ARG(int64)
  CONVERT_2_ARGS(int64)
  CONVERT_INTEGER_RESULT(int64)
# endif

/* Now instantiate the primitives themselves. */

INT_PRIMS(add,  a1 + a2, )
INT_PRIMS(sub,  a1 - a2, )
INT_PRIMS(mul,  a1 * a2, )
INT_PRIMS(div,  a1 / a2, DIV_0_CHECK)
INT_PRIMS(rem,  a1 % a2, DIV_0_CHECK)
INT_PRIMS(and,  a1 & a2, )
INT_PRIMS(or,   a1 | a2, )
INT_PRIMS(xor,  a1 ^ a2, )

INT_PRIM(shl,  int32, a1 << MASK32, )
INT_PRIM(shr,  int32, a1 >> MASK32, )
INT_PRIM(ushr, int32, (uint32)a1 >> MASK32, )

# ifndef NO_LONG_LONG
  INT_PRIM(shl,  int64, a1 << MASK64, )
  INT_PRIM(shr,  int64, a1 >> MASK64, )
  INT_PRIM(ushr, int64, (uint64)a1 >> MASK64, )
# endif

CMP_PRIM(int32)
# ifndef NO_LONG_LONG
  CMP_PRIM(int64)
# endif

CONVERSION_PRIM(int8,  int32,          , SMI_RESULT)
CONVERSION_PRIM(int16, int32,          , SMI_RESULT)
# ifndef NO_LONG_LONG
  CONVERSION_PRIM(int64, int32, FAST_CONV, INT_RESULT)
  CONVERSION_PRIM(int8,  int64,          , SMI_RESULT)
  CONVERSION_PRIM(int16, int64,          , SMI_RESULT)
  CONVERSION_PRIM(int32, int64, FAST_CONV, INT_RESULT)
# endif

FLOAT_FROM_INT_CONVERSION(int32)
INT_FROM_FLOAT_CONVERSION(int32)

# ifndef NO_LONG_LONG
  INT_FROM_FLOAT_CONVERSION(int64)
  FLOAT_FROM_INT_CONVERSION(int64)
# endif


oop test_args_prim(oop rcvr, oop a1, oop a2, oop a3, oop a4, oop a5, oop a6, oop a7,
                   oop a8, oop a9, oop a10, oop a11, oop a12, oop a13, oop a14, oop a15, oop a16) {
  rcvr->verify();  rcvr->print();
  a1 ->verify();  a1 ->print();
  a2 ->verify();  a2 ->print();
  a3 ->verify();  a3 ->print();
  a4 ->verify();  a4 ->print();
  a5 ->verify();  a5 ->print();
  a6 ->verify();  a6 ->print();
  a7 ->verify();  a7 ->print();
  a8 ->verify();  a8 ->print();
  a9 ->verify();  a9 ->print();
  a10->verify();  a10->print();
  a11->verify();  a11->print();
  a12->verify();  a12->print();
  a13->verify();  a13->print();
  a14->verify();  a14->print();
  a15->verify();  a15->print();
  a16->verify();  a16->print();
  return rcvr;
}
