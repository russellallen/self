/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "vmStrings.hh"
# include "_vmStrings.cpp.incl"

stringOop VMString[LAST_VM_STRING];

void vmStrings_init() {
  // called during universe::universe
# define VMStrings_Init_Template(x,s)                                         \
    VMString[x] = new_string(s);
    
    VMStrings_DO(VMStrings_Init_Template)
}

# define VMStrings_LOOP(name,template)                                        \
  void CONC(VMStrings_,name) {                                        \
    for (stringOop* p = &VMString[0];                                 \
      p < &VMString[LAST_VM_STRING];                                          \
      p ++)                                                                   \
      template                                                                \
}


static void read_one(stringOop* p, FILE* file) {
# ifdef had_to_debug_this_once
  int w = ftell(file);
# endif

  OS::FRead_swap(p, oopSize, file);
# ifdef had_to_debug_this_once

  lprintf("VString: %d 0x%x 0x%x\n", p - VMString, *p, w);
# endif
  if (*p == NULL)
    fatal1("entry %d of VMString was read as Null", p - VMString);
}

static void write_one(stringOop* p, FILE* file) {
# ifdef had_to_debug_this_once
  lprintf("VString: %d 0x%x 0x%x\n", p - VMString, *p, ftell(file));
# endif

  OS::FWrite(p, oopSize, file);
}
  


VMStrings_LOOP(oops_do(oopsDoFn f),OOPS_DO_TEMPLATE((oop*)p,f))
VMStrings_LOOP(gc_mark_contents(),MARK_TEMPLATE(p))
VMStrings_LOOP(gc_unmark_contents(),UNMARK_TEMPLATE(p))
VMStrings_LOOP(switch_pointers(oop from, oop to),SWITCH_POINTERS_TEMPLATE(p))
VMStrings_LOOP( read_snapshot(FILE* file),read_one(p, file);)
VMStrings_LOOP(write_snapshot(FILE* file),write_one(p, file);)
VMStrings_LOOP(relocate(),RELOCATE_TEMPLATE(p))
VMStrings_LOOP(verify(bool& r),if (oop(*p)->verify_oop() && !(*p)->is_string()) { error1("entry %#lx of vm string table isn't a string", *p); r = false; })
