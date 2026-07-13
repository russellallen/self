/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# ifdef DYNLINK_SUPPORTED

  void initDynLinker(int argc, const char *argv[]);

  void *dlopen_wrap(char *path, int mode, void *FH);

  void dlclose_wrap(void *dlHandle, void *FH);
    /* Warning: it is Self level responsibility to make sure that all
       proxies and function proxies depending on the presence of a code file
       are killed when the code file is unloaded. */

  void *dlsym_wrap(void *dlHandle, char *symName, void *FH);

  void *fctLookup(void *dlHandle, char *fctName, void *FH);

  smi noOfArgsFct(void *dlHandle, char *fctName);
  // For a function with given name, guess how many args it takes.
  // May return unknowNoOfArgs.

  void add_dlopen_trust_dir(const char* dir);
  // -T trusted dir (repeatable). No -T = ungated; any -T = only trusted paths load.

  smi init_self_library(void *dlHandle, void *FH);
  // oop-libraries handshake: dlsym+call self_lib_init. Returns ABI minor.

# endif

// Native-code accessor layer interface (impl folded into dynLink.cpp).
// SelfHelpers is defined in selfHelpers.h.
struct SelfHelpers;
const SelfHelpers* plugin_helpers();
extern bool        plugin_in_invocation;
extern const char* plugin_current_module;
void plugin_remember_vm_thread();
void plugin_doorbell_create();
oop  mail_flag_check_and_clear_prim(oop rcvr);

inline void plugin_enter(const char* who) {
  plugin_remember_vm_thread();
  plugin_current_module = who;
  plugin_in_invocation  = true;
}

inline void plugin_leave() {
  plugin_in_invocation  = false;
  plugin_current_module = "?";
}
