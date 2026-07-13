/* Copyright 2026 AUTHORS.
   See the LICENSE file for license information. */

#ifndef SELF_HELPERS_H
#define SELF_HELPERS_H

#include <stdint.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

#define SELF_PLUGIN_ABI_MAJOR 1
#define SELF_PLUGIN_ABI_MINOR 0

typedef void* self_oop;

enum {
  SELF_ERR_PRIMITIVEFAILED = 0,
  SELF_ERR_BADTYPE,
  SELF_ERR_BADINDEX,
  SELF_ERR_IMMUTABLE,
  SELF_ERR_LENGTHMISMATCH,
  SELF_ERR_OUTOFMEMORY
};

enum {
  SELF_BV_NONE       = -1,
  SELF_BV_BYTEVECTOR = 0,
  SELF_BV_MUTABLE    = 1,
  SELF_BV_CANONICAL  = 2
};

/* Generates the struct fields, self_* wrappers, and api_ table. Cols: ret|field|public|decls|args. */
#define SELF_HELPERS(X) \
  X(int,         is_smi,        is_smi,        (self_oop o),                (o)) \
  X(int,         is_float,      is_float,      (self_oop o),                (o)) \
  X(int,         is_byteVector, is_byteVector, (self_oop o),                (o)) \
  X(intptr_t,    smi_value,     smi_value,     (self_oop o),                (o)) \
  X(self_oop,    smi,           smi,           (intptr_t v),                (v)) \
  X(int,         smi_fits,      smi_fits,      (intptr_t v),                (v)) \
  X(double,      float_value,   float_value,   (self_oop o),                (o)) \
  X(self_oop,    flt,           float,         (double d),                  (d)) \
  X(intptr_t,    bv_length,     bv_length,     (self_oop o),                (o)) \
  X(int,         bv_copy_out,   bv_copy_out,   (self_oop o, intptr_t off, intptr_t len, void* buf),       (o, off, len, buf)) \
  X(int,         bv_copy_in,    bv_copy_in,    (self_oop o, intptr_t off, intptr_t len, const void* buf), (o, off, len, buf)) \
  X(char*,       bv_bytes,      bv_bytes,      (self_oop o),                (o)) \
  X(const char*, bv_bytes_ro,   bv_bytes_ro,   (self_oop o),                (o)) \
  X(self_oop,    error_value,   error,         (int err_code),              (err_code)) \
  X(int,         identity_eq,   identity_eq,   (self_oop a, self_oop b),    (a, b)) \
  X(int,         should_abort,  should_abort,  (void),                      ())  \
  X(int,         bv_kind,       bv_kind,       (self_oop o),                (o)) \
  X(int,         raise_flag,    raise_flag,    (void),                      ())

typedef struct SelfHelpers {
  int version;
  int struct_size;
# define X(ret, field, pub, decls, args)  ret (*field) decls;
  SELF_HELPERS(X)
# undef X
} SelfHelpers;

extern const SelfHelpers* self_ctx;

#ifndef SELF_PLUGIN_IMPL

# define X(ret, field, pub, decls, args) \
    static inline ret self_##pub decls { return self_ctx->field args; }
  SELF_HELPERS(X)
# undef X

/* derived, not 1:1 forwarders */
static inline int self_is_raw_byteVector(self_oop o)   { return self_bv_kind(o) == SELF_BV_BYTEVECTOR; }
static inline int self_is_mutable_string(self_oop o)   { return self_bv_kind(o) == SELF_BV_MUTABLE; }
static inline int self_is_canonical_string(self_oop o) { return self_bv_kind(o) == SELF_BV_CANONICAL; }

#endif

#if defined(__GNUC__) && !defined(SELF_PLUGIN_IMPL)
# pragma GCC poison exit _exit abort fork system signal sigaction \
                 setitimer chdir setlocale fesetround fesetenv
#endif

#ifdef __cplusplus
}
#endif

#endif
