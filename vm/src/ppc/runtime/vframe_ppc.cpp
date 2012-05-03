# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// # pragma implementation "vframe_ppc.hh"
# include "_vframe_ppc.cpp.incl"

    
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)


oop* dummy_vframe::register_contents_addr(Location r) {
  fint i = incoming_arg_index(r);
  assert(SaveOutgoingArgumentsOfPatchedFrames, "PPC needs this");
  assert(i + 1  <  OutgoingArgsOfReturnTrapOrRecompileFrame->length(), "bounds");
  oop* argp = OutgoingArgsOfReturnTrapOrRecompileFrame->objs(i + 1);
  assert((*argp)->verify(), "checking arg");
  return argp;
}


int32 compiled_vframe::register_offset(Location r) {
  return spOffset(r, code->frameSize(), code->max_no_of_outgoing_args_and_rcvr()) / oopSize; 
}


# if defined(SIC_COMPILER)
oop* compiled_vframe::special_register_contents_addr(Location r) {
  return NULL; // for SPARC
}
# endif


oop* compiled_vframe::register_contents_addr(Location r) {
  return (oop*) fr->location_addr(r, rl);
}


oop* compiled_vframe::register_contents_secondary_addr(Location r) {
  return (oop*) fr->location_secondary_addr(r, rl);
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

  // On PPC, ReturnTrap asm glue cannot save the outgoing argument,
  // because callee put it in a nonvolatile register. Then when
  // the callee returned, it restored the register, losing the value we want.
  //
  // For now, rely on the fact that PPC is NIC-only, and NIC always has
  // real locations for expression stack values.
  // In future, what? Save values in kill activations primitive?
  // Trap the return one level down??
  // -- dmu 6/99
  
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
  // Cannot find a register locator when this makes a dummy_vframe, so live
  // with less info for recompilation. -- dmu 2/03
  return NULL;
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

# endif // TARGET_ARCH == PPC_ARCH
