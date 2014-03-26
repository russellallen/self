#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "oop_inline.hh"
# include "top.hh"



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

# endif
