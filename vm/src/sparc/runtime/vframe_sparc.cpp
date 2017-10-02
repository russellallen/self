/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "allocation.hh"
# include "byteCodes.hh"
# include "codeSlotsMap.hh"
# include "debug.hh"
# include "enumeration.hh"
# include "fields.hh"
# include "interpreter.hh"
# include "recompile.hh"
# include "registerLocator.hh"
# include "search.hh"
# include "sendDesc.hh"
# include "table.hh"
# include "vframe.hh"
# include "vframeOop.hh"
# include "vmStrings.hh"

    
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)




oop* dummy_vframe::register_contents_addr(Location r) {
  const bool traceRCA = false;
  oop* old_result = NULL;
  if (isIArgRegister(r)) {
    // the nameDesc specifies an i register, but the actual contents are
    // in saved_outregs
    old_result = &saved_outregs[r - I0];
  } else if (isExtraIArgRegister(r)) {
    // extra incoming args are ok, too
    old_result = compiled_vframe::register_contents_addr(r);
  }
  else
    ShouldNotReachHere(); // shouldn't ask dummy vframe for this register
  
  if (!SaveOutgoingArgumentsOfPatchedFrames)
    return old_result;
    
  fint i = incoming_arg_index(r);
  assert(i + 1  <  OutgoingArgsOfReturnTrapOrRecompileFrame->length(), "bounds");
  oop* argp = OutgoingArgsOfReturnTrapOrRecompileFrame->objs(i + 1);
  assert((*argp)->verify(), "checking arg");
  if (traceRCA)
    lprintf("***** vframe::register_contents_addr i = %d,  old_result = 0x%x,  argp = 0x%x\n",
            i, *old_result, *argp);
  assert(*argp == *old_result, "checking old vs. new");
  return argp;
}


oop* compiled_vframe::register_contents_secondary_addr(Location r) {
  return NULL; // never on SPARC
}


int32 compiled_vframe::register_offset(Location r) {
  return spOffset(r, fr->frame_size()) / oopSize; 
}


# if defined(SIC_COMPILER)
oop* compiled_vframe::special_register_contents_addr(Location r) {
  // get the contents of an out or global register -- works only during
  // recompilation/uncommon trap
  assert(RecompilationInProgress || ConversionInProgress ||
         currentProcess->isUncommon(), "can't get this register");
  if (O0 <= r && r <= O7) {
    // get out reg's content from frame below
    return (oop*)fr->location_addr(r, rl);
  } else {
    assert(G0 <= r && r <= G7, "expected a global register");
    return &saved_globals[r - G0];
  }
}


oop* compiled_vframe::register_contents_addr(Location r) {
    if (!isInFrame(r) 
        && (RecompilationInProgress || ConversionInProgress ||
            currentProcess->isUncommon())) {
        return special_register_contents_addr(r);
      }
  return (oop*) fr->location_addr(r, rl);
}
# endif // SIC_COMPILER
  
  
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

  if (!ConversionInProgress && this->EQ(new_vframe(fr))) {
    // bottom vframe of this frame - show sendDesc
    int32* instp = (int32*)fr->real_return_addr();
    if (!isUnimp(instp)) {
      lprintf(", pc=%#lx", (fr->send_desc()));
    }
  }

  lprintf(">");
}

void compiled_vframe::fix_frame(frame* f) { fr = f;  reg_loc()->fix_frame(f); }

void compiled_vframe::get_search_locations_for_liveness_check(NameDesc* n, frame*& fr_to_search, RegisterLocator*& rl_to_search) {
  // these guys are in caller frame in SPARC
  fr_to_search = isExtraIArgRegister(n->location()) ? fr->sender() : fr;
  rl_to_search = isExtraIArgRegister(n->location()) ? rl->sender() : rl;
}


void compiled_vframe::copy_outgoing_arg(fint argNo, NameDesc* nd2, compiled_vframe* vf, dummy_vframe* dummy, 
                                        NameDesc* nd, frame* oldBlkHome, OopOopTable* blkValues) {

  // we're restarting a send (e.g. after recompilation that left most
  // recent frame invalid); outgoing args were saved by assembly glue

  // Use the value saved by the ReturnTrap asm glue (saved_outregs on SPARC)
  // But verify it against the expression stack entry of the caller.
  // For a SIC method, the latter may not be available for verification.
  // -- dmu 6/99
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

