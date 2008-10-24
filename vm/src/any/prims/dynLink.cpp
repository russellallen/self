/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "dynLink.hh"
# include "_dynLink.cpp.incl"
  
# ifdef DYNLINK_SUPPORTED

  void initDynLinker(int argc, const char *argv[]) {
    Unused(argv); Unused(argc);
  }
  
  void *dlopen_wrap(char *path, int mode, void *FH) {
    void *dlHandle = dlopen(path, mode);
    if (!dlHandle) 
      failure(FH, dlerror());    /* Indicate error return. */
    return dlHandle;
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
    
# endif    /* DYNLINK_SUPPORTED. */

# ifndef DYNLINK_SUPPORTED
    // dummy functions to enable static linking of Self
    extern "C" void* dlopen(char*, int) { return NULL; }
    extern "C" void* dlsym(void*, char*) { return NULL; }
    extern "C" int   dlclose(void*) { return -1; }
    extern "C" char* dlerror() { return "dynamic linking not available"; }
# endif
