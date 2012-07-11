# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// # pragma implementation "vframe_i386.hh"
# include "_vframe_i386.cpp.incl"

    
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)


oop* dummy_vframe::register_contents_addr(Location r) {
  fint i = index_for_IArgLocation(r);
  assert(SaveOutgoingArgumentsOfPatchedFrames, "I386 needs this");
  assert(i + 1  <  OutgoingArgsOfReturnTrapOrRecompileFrame->length(), "bounds");
  oop* argp = OutgoingArgsOfReturnTrapOrRecompileFrame->objs(i + 1);
  assert((*argp)->verify(), "checking arg");
  return argp;
}


int32 compiled_vframe::register_offset(Location r) {
  fatal("Unused Intel; don't save registers in frames"); 
  return 0;
}


# if defined(SIC_COMPILER)
oop* compiled_vframe::special_register_contents_addr(Location r) {
  return 0; // for SPARC
}
# endif


oop* compiled_vframe::register_contents_addr(Location r) {
  return (oop*) fr->location_addr(r, rl);
}


oop* compiled_vframe::register_contents_secondary_addr(Location r) {
  return 0; // only in one place on I386
}
  
  
void compiled_vframe::print_code(fint curFrame) {
  lprintf("#%ld", (long) curFrame);
  if (!WizardMode) return;

  lprintf(" <%#lx%c@ %#lx%c%s # %ld",
         (long unsigned)fr,
         fr->return_addr() != fr->real_return_addr() ? '*' : ' ',
         (long unsigned)code,
         code->isInvalid() ? '!' : ' ',
         code->isDebug()
           ? "deb" : VMString[code->compiler()]->copy_null_terminated(),
         long(code->scopes->offsetTo(desc)));

  lprintf(">");
}


void compiled_vframe::fix_frame(frame* ) { } // for sparc


void compiled_vframe::get_search_locations_for_liveness_check(NameDesc*, frame*& fr_to_search, RegisterLocator*& rl_to_search) {
  fr_to_search = fr;
  rl_to_search = rl;
}


void compiled_vframe::copy_outgoing_arg(fint argNo, NameDesc* nd2, compiled_vframe* vf, dummy_vframe* dummy, 
                                        NameDesc* nd, frame* oldBlkHome, OopOopTable* blkValues) {

  // we're restarting a send (e.g. after recompilation that left most
  // recent frame invalid); outgoing args were saved by assembly glue

  // On I386, ReturnTrap asm glue does not save the outgoing arguments.
  
  // Used to be:
  // if (!nd2->isIllegal())
  //   copyValue(nd, vf, nd2, oldBlkHome, blkValues); // get value from caller if possible
  // else
  //   copyValueTo(nd, new_string("<unknown outgoing argument>")); 

  Location loc= LocationOfSavedOutgoingArgInSendee(argNo);
  NameDesc* fromNd = new LocationNameDesc(loc, 0);
  if (!nd2->isIllegal()) {
    // verify that args were saved correctly
    oop val1 = vf->get_contents(nd2, false);
    oop val2 = dummy->get_contents(fromNd);
    if (val1 != val2)
      fatal3("inconsistent outgoing arg %d: %#lx vs. %#lx",
             argNo, val1, val2);
  }
  copyValue(nd, dummy, fromNd, oldBlkHome, blkValues);
}


compiled_vframe* compiled_vframe::sendeeOrNULL_for_get_expr_stack() {
  // From former PPC: Cannot find a register locator when this makes a dummy_vframe, so live
  // with less info for recompilation. -- dmu 2/03
  //
  // Could maybe fix this for Intel.
  return 0;
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

# endif // TARGET_ARCH == I386_ARCH
