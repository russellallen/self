/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "dynLink.hh"
# include "_dynLink.cpp.incl"

/* Struct/type defs only; SELF_PLUGIN_IMPL suppresses the library macros/poison. */
# define SELF_PLUGIN_IMPL
# include "../../../../vm-plugins/include/selfHelpers.h"

# ifdef DYNLINK_SUPPORTED

  void initDynLinker(int argc, const char *argv[]) {
    Unused(argv); Unused(argc);
  }

  // -T trusted-dir gate: no -T = permissive; any -T = lockdown.

  static const int MaxTrustDirs = 16;
  static char* trust_dirs[MaxTrustDirs];
  static int   n_trust_dirs = 0;
  static bool  trust_mode   = false;   // any -T given -> lockdown active

  void add_dlopen_trust_dir(const char* dir) {
    trust_mode = true;                 // lockdown on, even if this dir is bad
    if (n_trust_dirs >= MaxTrustDirs) {
      lprintf("Self VM warning: too many -T dirs; ignoring %s\n", dir);
      return;
    }
    char* real = realpath(dir, NULL);
    if (real == NULL) {
      lprintf("Self VM warning: -T %s: cannot resolve; this dir will not be "
              "trusted (loads stay gated by any other -T dirs)\n", dir);
      return;
    }
    struct stat st;
    if (stat(real, &st) == 0 && (st.st_mode & S_IWOTH))
      lprintf("Self VM warning: -T %s is world-writable\n", real);
    trust_dirs[n_trust_dirs++] = real;
  }

  static bool path_within_trusted(const char* real) {
    for (int i = 0; i < n_trust_dirs; i++) {
      size_t l = strlen(trust_dirs[i]);
      if (strncmp(real, trust_dirs[i], l) != 0) continue;
      // Require a dir boundary after the prefix so /opt/trusted != /opt/trusted-evil.
      if (real[l] == '/' || (l > 0 && trust_dirs[i][l - 1] == '/'))
        return true;
    }
    return false;
  }

  void *dlopen_wrap(char *path, int mode, void *FH) {
    // Empty/NULL path = dlopen(NULL): VM's own builtin-glue symbols, no new code -> allowed.
    if (path == NULL || path[0] == '\0') {
      void *h = dlopen(NULL, mode);
      if (!h) failure(FH, dlerror());
      return h;
    }
    if (!trust_mode) {                 // permissive: unchanged historical path
      void *h = dlopen(path, mode);
      if (!h) failure(FH, dlerror());
      return h;
    }
    // Lockdown: vet and load the SAME resolved file.
    char *real = realpath(path, NULL);
    if (real == NULL) {
      failure(FH, "untrusted library path: cannot resolve");
      return NULL;
    }
    if (!path_within_trusted(real)) {
      free(real);
      failure(FH, "untrusted library path: no -T directory contains it");
      return NULL;
    }
    void *h = dlopen(real, mode);      // load the vetted path, not the caller's
    free(real);
    if (!h) failure(FH, dlerror());
    return h;
  }
  
  void dlclose_wrap(void *dlHandle, void *FH) {
    /* Warning: it is Self level responsibility to make sure that all 
      proxies and function proxies depending on the presence of a code file
        are killed when the code file is unloaded. */
    if (dlclose(dlHandle))
      failure(FH, dlerror());
  }
  
  void *dlsym_wrap(void *dlHandle, char *symName, void *FH) {
    void *sym = dlsym(dlHandle, symName);
    if (!sym)
      failure(FH, dlerror());
    return sym;
  }
  
  void *fctLookup(void *dlHandle, char *fctName, void *FH) {
    // This function is similar to dlsym. However, it returns a fctProxy, 
    // rather than just a proxy. 
    void *sym = dlsym(dlHandle, fctName);
    if (!sym)
      failure(FH, dlerror());
    return sym;
  }
  
  smi noOfArgsFct(void *dlHandle, char *fctName) {
    smi *argcP = (smi *)dlsym(dlHandle, nameOfArgc(fctName));
    if (argcP && *argcP >= 0 && *argcP <= 100) {
      /* Check that it is reasonable! */
      return *argcP;
    } else {
      return unknownNoOfArgs;
    }
  }

  smi init_self_library(void *dlHandle, void *FH) {
    // oop-libraries handshake: dlsym self_lib_init, hand it the SelfHelpers table; returns ABI minor.
    typedef int (*self_lib_init_fn)(int, const SelfHelpers*);
    self_lib_init_fn init = (self_lib_init_fn) dlsym(dlHandle, "self_lib_init");
    if (init == NULL) {
      failure(FH, "no self_lib_init symbol in library");
      return 0;
    }
    plugin_remember_vm_thread();
    plugin_doorbell_create();   // any library that can raise has a doorbell
    int minor = init(SELF_PLUGIN_ABI_MAJOR, plugin_helpers());
    if (minor < 0) {
      failure(FH, "library refused the helpers handshake (ABI major mismatch?)");
      return 0;
    }
    return (smi) minor;
  }

# endif    /* DYNLINK_SUPPORTED. */

# ifndef DYNLINK_SUPPORTED
    // dummy functions to enable static linking of Self
    extern "C" void* dlopen(char*, int) { return NULL; }
    extern "C" void* dlsym(void*, char*) { return NULL; }
    extern "C" int   dlclose(void*) { return -1; }
    extern "C" char* dlerror() { return "dynamic linking not available"; }
# endif

// ---------------------------------------------------------------------------
// The native-code accessor layer (SelfHelpers table + invocation guard + mail
// doorbell). Interface is in dynLink.hh; selfHelpers.h (the SelfHelpers struct)
// is already included above.
// ---------------------------------------------------------------------------

bool          plugin_in_invocation = false;
const char*   plugin_current_module = "?";
static pthread_t plugin_vm_thread;
static bool      plugin_vm_thread_set = false;

void plugin_remember_vm_thread() {
  if (!plugin_vm_thread_set) {
    plugin_vm_thread     = pthread_self();
    plugin_vm_thread_set = true;
  }
}

static inline void guard_accessor(const char* who) {
  if (plugin_vm_thread_set && !pthread_equal(pthread_self(), plugin_vm_thread)) {
    fatal2("library '%s' called %s from a non-VM thread",
           plugin_current_module, who);
    abort();
  }
  if (!plugin_in_invocation) {
    fatal2("library '%s' called %s outside an invocation",
           plugin_current_module, who);
    abort();
  }
}

static inline oop      to_oop(self_oop o)  { return (oop)o; }
static inline self_oop to_self(oop o)      { return (self_oop)o; }

static int api_is_smi(self_oop o)        { guard_accessor("is_smi");        return to_oop(o)->is_smi(); }
static int api_is_float(self_oop o)      { guard_accessor("is_float");      return to_oop(o)->is_float(); }
static int api_is_byteVector(self_oop o) { guard_accessor("is_byteVector"); return to_oop(o)->is_byteVector(); }

static intptr_t api_smi_value(self_oop o) {
  guard_accessor("smi_value");
  oop v = to_oop(o);
  if (!v->is_smi()) { lprintf("[library] smi_value on a non-smi oop\n"); return 0; }
  return (intptr_t) smiOop(v)->value();
}
static self_oop api_smi(intptr_t v) {
  guard_accessor("smi");
  return to_self(as_smiOop((smi)v));
}
static int api_smi_fits(intptr_t v) {
  guard_accessor("smi_fits");
  smi s = (smi)v;
  return ((s << Tag_Size) >> Tag_Size) == s;
}
static double api_float_value(self_oop o) {
  guard_accessor("float_value");
  oop v = to_oop(o);
  if (!v->is_float()) { lprintf("[library] float_value on a non-float oop\n"); return 0.0; }
  return (double) floatOop(v)->value();
}
static self_oop api_flt(double d) {
  guard_accessor("float");
  return to_self(as_floatOop((float)d));
}

static intptr_t api_bv_length(self_oop o) {
  guard_accessor("bv_length");
  oop v = to_oop(o);
  if (!v->is_byteVector()) return -1;
  return (intptr_t) byteVectorOop(v)->length();
}

static int api_bv_copy_out(self_oop o, intptr_t off, intptr_t len, void* buf) {
  guard_accessor("bv_copy_out");
  oop v = to_oop(o);
  if (!v->is_byteVector()) return -1;
  intptr_t n = byteVectorOop(v)->length();
  if (off < 0 || len < 0 || off > n || len > n - off) return -1;
  memcpy(buf, byteVectorOop(v)->bytes((fint)off), (size_t)len);
  return 0;
}

static int api_bv_copy_in(self_oop o, intptr_t off, intptr_t len, const void* buf) {
  guard_accessor("bv_copy_in");
  oop v = to_oop(o);
  if (!v->is_byteVector() || v->is_string()) return -1;
  intptr_t n = byteVectorOop(v)->length();
  if (off < 0 || len < 0 || off > n || len > n - off) return -1;
  memcpy(byteVectorOop(v)->bytes((fint)off), buf, (size_t)len);
  return 0;
}

static char* api_bv_bytes(self_oop o) {
  guard_accessor("bv_bytes");
  oop v = to_oop(o);
  if (!v->is_byteVector() || v->is_string()) return NULL;
  return byteVectorOop(v)->bytes();
}

static const char* api_bv_bytes_ro(self_oop o) {
  guard_accessor("bv_bytes_ro");
  oop v = to_oop(o);
  if (!v->is_byteVector()) return NULL;
  return byteVectorOop(v)->bytes();
}

static VMStringsIndex map_err(int code) {
  switch (code) {
    case SELF_ERR_PRIMITIVEFAILED: return PRIMITIVEFAILEDERROR;
    case SELF_ERR_BADTYPE:         return BADTYPEERROR;
    case SELF_ERR_BADINDEX:        return BADINDEXERROR;
    case SELF_ERR_IMMUTABLE:       return BADTYPEERROR;
    case SELF_ERR_LENGTHMISMATCH:  return BADSIZEERROR;
    case SELF_ERR_OUTOFMEMORY:     return OUTOFMEMORYERROR;
    default:                       return PRIMITIVEFAILEDERROR;
  }
}

static int doorbell_rd = -1;
static int doorbell_wr = -1;

void plugin_doorbell_create() {
  if (doorbell_rd >= 0) return;
  int fds[2];
  if (pipe(fds) < 0) return;
  doorbell_rd = fds[0];
  doorbell_wr = fds[1];

  fcntl(doorbell_rd, F_SETFD, FD_CLOEXEC);
  fcntl(doorbell_wr, F_SETFD, FD_CLOEXEC);

  fcntl(doorbell_rd, F_SETOWN, getpid());
  fcntl(doorbell_rd, F_SETFL, O_NONBLOCK | O_ASYNC);
  fcntl(doorbell_wr, F_SETFL, O_NONBLOCK);
}

oop mail_flag_check_and_clear_prim(oop rcvr) {
  (void) rcvr;
  char buf[256];
  smi n = 0;
  if (doorbell_rd >= 0) {
    for (;;) {
      ssize_t got = read(doorbell_rd, buf, sizeof buf);
      if (got <= 0) break;
      n += (smi) got;
    }
  }
  return as_smiOop(n);
}

static int api_raise_flag(void) {
  if (doorbell_wr >= 0) {
    char c = 'x';
    ssize_t ignored = write(doorbell_wr, &c, 1);
    (void) ignored;
  }
  return 0;
}

static self_oop api_error_value(int code) {
  guard_accessor("error_value");
  return to_self(ErrorCodes::vmString_prim_error(map_err(code)));
}

static int api_identity_eq(self_oop a, self_oop b) {
  guard_accessor("identity_eq");
  return to_oop(a) == to_oop(b);
}

static int api_should_abort(void) {
  guard_accessor("should_abort");
  return PendingSelfSignals::keyboard_signals() != 0 ? 1 : 0;
}

static int api_bv_kind(self_oop o) {
  guard_accessor("bv_kind");
  oop v = to_oop(o);
  if (!v->is_byteVector())  return SELF_BV_NONE;
  if (v->is_string())       return SELF_BV_CANONICAL;
  if (v->map() == Memory->byteVectorObj->map()) return SELF_BV_BYTEVECTOR;
  return SELF_BV_MUTABLE;
}

// Generated from SELF_HELPERS: slot N is always api_<field N>, so struct and table can't drift.
static const SelfHelpers the_helpers = {
  SELF_PLUGIN_ABI_MINOR,
  (int) sizeof(SelfHelpers),
# define X(ret, field, pub, decls, args)  api_##field,
  SELF_HELPERS(X)
# undef X
};

const SelfHelpers* plugin_helpers() { return &the_helpers; }
