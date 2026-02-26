/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "simpleLookup.hh"
# pragma implementation "simpleLookup_inline.hh"
# include "_simpleLookup.cpp.incl"


void simpleLookup::assert_static_selector() {
  assert(!isPerform(), "selector should be static"); }

void simpleLookup::assert_static_delegatee() {
  assert(isDelegateeStatic(), "delegatee should be static"); }


static bool isLookupErrorSelector(oop sel) {
  return
    sel == VMString[UNDEFINEDSELECTOR_RECEIVER_TYPE_DELEGATEE_METHODHOLDER_ARGUMENTS_] ||
    sel == VMString[AMBIGUOUSSELECTOR_RECEIVER_TYPE_DELEGATEE_METHODHOLDER_ARGUMENTS_] ||
    sel == VMString[MISSINGPARENTSELECTOR_RECEIVER_TYPE_DELEGATEE_METHODHOLDER_ARGUMENTS_] ||
    sel == VMString[MISMATCHEDARGUMENTCOUNTSELECTOR_RECEIVER_TYPE_DELEGATEE_METHODHOLDER_ARGUMENTS_] ||
    sel == VMString[PERFORMTYPEERRORSELECTOR_RECEIVER_TYPE_DELEGATEE_METHODHOLDER_ARGUMENTS_];
}


simpleLookup::simpleLookup(LookupType type,
                           oop rcvr,
                           oop sel,
                           oop dgt,
                           oop mhOrMap, 
                           dependencyList *dps,
                           assignableDependencyList* adps ) {
  key.lookupType= type;
  key.selector= sel;
  key.delegatee= dgt;
  key.set_methodHolder_or_map( mhOrMap );

  assert(rcvr->verify_oop(), "");
  if (rcvr->is_map()) {
    // all we know is map
    receiver= badOop;
    key._receiverMapOop= mapOop(rcvr);
  } else {
    receiver= rcvr;
    key._receiverMapOop= rcvr->map()->enclosing_mapOop();
  }
  status = foundNone;
  _result = NULL;

  deps = dps;
  adeps = adps;
}


void simpleLookup::add_asg_parent_dependency( objectLookupTarget* otarg,
                                              objectLookupTarget* ntarg,
                                              slotDesc* sd) {
  if ( adeps == NULL ) return;
  
  if (otarg->links == EMPTY)  adeps->add(otarg);
  otarg->links = otarg->links->add(sd, ntarg);
}



// check for perform errors and return status, or foundNone

LookupStatus simpleLookup::perform_error_status(int32 perform_arg_count) {
  
  // check selector first
  if (!isPerformLookupType(lookupType()))
    ; // static is cool
  else if (!selector()->is_string() || !stringOop(selector())->is_slot_name()) 
    return performTypeError;
  else if (arg_count() != perform_arg_count)
    return mismatchedArgCount;

  // check delegatee
  if ( baseLookupType(lookupType()) != DirectedResendBaseLookupType )
    ; // no delegatee needed, cool
  else if (isDelegateeStatic())
    ; // static delegatee, cool
  else if (    !delegatee()->is_string()
           ||  !stringOop(delegatee())->is_slot_name())
    return performTypeError;

  return foundNone;
}


void simpleLookup::perform_full_lookup_n(int32 perform_arg_count) {

  status= perform_error_status(perform_arg_count);
  if (status != foundNone) {
    lookupErrorCode(perform_arg_count);
  } else {
    assert_methodHolder_is_object();
    perform_lookup();
    if (result() == NULL)
      lookupErrorCode(perform_arg_count);
  }
}


void simpleLookup::perform_lookup() {
  lookupTarget* t = create_initial_target();

  if ( t == NULL ) // check for errors
    return;
  
  if ( baseLookupType(lookupType()) == ResendBaseLookupType )
    // special case for undirected resends!!
    parentsLookup(t);
  else
    objectLookup(t);
}


lookupTarget* simpleLookup::create_initial_target() {
  switch (baseLookupType(lookupType())) {
   case        NormalBaseLookupType:  return isImplicitSelf()
                                              ?  implicit_self_lookup_target()
                                              :       receiver_lookup_target();

   case      DelegatedBaseLookupType: return         delegated_lookup_target();
   case         ResendBaseLookupType: return undirected_resend_lookup_target();
   case DirectedResendBaseLookupType: return   directed_resend_lookup_target();

   default:
    ShouldNotReachHere(); // unexpected base lookup type
    return NULL;
  }
}


lookupTarget* simpleLookup::receiver_lookup_target() {
  return (new objectLookupTarget(receiver))->be_receiver();
}
      

lookupTarget* simpleLookup::delegated_lookup_target() {
  return new objectLookupTarget(delegatee());
}


lookupTarget* simpleLookup::undirected_resend_lookup_target() {
  assert_methodHolder_is_object();
  return new objectLookupTarget(methodHolder_or_map());
}


lookupTarget* simpleLookup::directed_resend_lookup_target() {
  assert_string(delegatee(), "should be a string");
  Map* rm= methodHolder_map();
  slotDesc* desc= rm->find_slot(stringOop(delegatee()));
  add_dependency(desc, rm);

  if (desc == NULL || desc->is_vm_slot()) {
    // didn't find parent to delegate through
    status = delegateeNotFound;
    return NULL;
  }
  if ( ! check_slot_for_directed_resend(desc) )
    return NULL;
  
  oop delegatee= methodHolder_or_map()->get_slot(desc);
  return new objectLookupTarget(delegatee);
}


bool simpleLookup::check_slot_for_directed_resend(slotDesc* desc){
  Unused(desc);
  return true;
}


bool simpleLookup::objectLookup(lookupTarget* target) {
  if (target->check_cycle_mark()) {
    // we've been here before -- break out of the cycle
    return false;
  }

  assert_string(selector(), "should be a string");
  slotDesc* desc= target->map()->find_slot(stringOop(selector()));
  target->add_dependency(desc, this);

  if (!desc || desc->is_vm_slot()) {          // no matching slot
    target->set_cycle_mark();
    bool found = parentsLookup(target);
    target->clear_cycle_mark();
    return found;
  }

  realSlotRef* slot = new realSlotRef(target, desc);

  if (result() != NULL  &&  slot->EQsr(result()->as_real())) {
    // found same slot, no change
    return true;
  }

  switch (status) {
   case foundNone:
    status = foundOne;
    _result = slot;
    break;

   case foundOne:
    status = foundSeveral;
    _result = NULL;
    break;

   case foundSeveral:
    ShouldNotReachHere();

   case foundAssignableParent:
   case resendUndecidable:
    _result = NULL;
    break;

   case delegateeNotFound:
   case mismatchedArgCount:
   case performTypeError:
   default:
    ShouldNotReachHere();
  }
  return true;
}



bool simpleLookup::parentsLookup(lookupTarget* target) {
  bool found = false;
  
  target->add_slot_dependency(this);
  
  FOR_EACH_SLOTDESC(target->map(), s) {
    if (! s->is_parent()) {
      continue;
    }

    target->add_dependency(s, this);    // record a dependency
    
    lookupTarget* parent = target->get_target_for_slot(s, this);
    if (parent == NULL) {
      status = foundAssignableParent;       // can only occur at compile-time
      _result = NULL;
      return true;
    }
    
    found |= objectLookup(parent);
    
    switch (status) {
     case foundNone:
     case foundOne:
      continue;
      
     case foundSeveral:
     case foundAssignableParent:
     case resendUndecidable:
      return true;      // lookup has failed along this path, so quit search
      
     case delegateeNotFound:
     case mismatchedArgCount:
     case performTypeError:
     default:
      ShouldNotReachHere(); // bad lookup status
    }
  }
  return found;
}



// make error method, and change lookup to point to it

void simpleLookup::lookupErrorCode(int32 perform_arg_count) {
  LOG_EVENT1("lookup error %#lx", selector());
  if (isLookupErrorSelector(selector())) {
    handleRecursiveLookupError();
  }
  breakpoint(); // for debugging

  generateLookupErrorMethod(perform_arg_count);
}



void simpleLookup::handleRecursiveLookupError() {
  // avoid infinite recursion
  lprintf("A lookup error happened while sending the message\n\t");

  frame *f= currentProcess->last_self_frame(false);
  abstract_vframe* v= new_vframe(f);
  oop failSel= v->selector();

  if (failSel->is_string()) {
    stringOop(failSel)->string_print();
  } else {
    failSel->print_oop();
  }  
  
  lprintf("\nto\n\t");
 
  v->receiver()->print_oop();

  lprintf(".\nSubsequently, the lookup error message\n\t");
  stringOop(this->selector())->string_print();

  lprintf("\nwas sent to\n\t");
  receiver->print_oop();

  lprintf(",\nand was also not understood, causing the process to be aborted"
         " by the Self VM.\n\n");
# if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions) {
    breakpoint();
  }
# endif

  currentProcess->stack()->print();
  
  remove_all_deps();
  Process::abort_process();
}
  

void simpleLookup::selectorAndSourceForLookupError(stringOop& sel,
                                                   const char*& source) {
  switch (status) {

   case foundNone:
    sel = VMString[UNDEFINEDSELECTOR_RECEIVER_TYPE_DELEGATEE_METHODHOLDER_ARGUMENTS_];
    source = "\n\"undefined selector error;\nthis method was automatically generated by the VM.\"\n";
    break;

   case foundSeveral:
    sel = VMString[AMBIGUOUSSELECTOR_RECEIVER_TYPE_DELEGATEE_METHODHOLDER_ARGUMENTS_];
    source = "\n\"ambiguous selector error;\nthis method was automatically generated by the VM.\"\n";
    break;

   case delegateeNotFound:
    sel = VMString[MISSINGPARENTSELECTOR_RECEIVER_TYPE_DELEGATEE_METHODHOLDER_ARGUMENTS_];
    source = "\n\"missing parent error;\nthis method was automatically generated by the VM.\"\n";
    break;

   case foundOne:
    ShouldNotReachHere(); // failing w/o an error condition

   case foundAssignableParent:
   case resendUndecidable:
    ShouldNotReachHere(); // run-time lookup failing w/ a compile-time condition

   case mismatchedArgCount:
    sel = VMString[MISMATCHEDARGUMENTCOUNTSELECTOR_RECEIVER_TYPE_DELEGATEE_METHODHOLDER_ARGUMENTS_];
    source = "\n\"mismatched argument count error;\nthis method was automatically generated by the VM.\"\n";
    break;

   case performTypeError:
    sel = VMString[PERFORMTYPEERRORSELECTOR_RECEIVER_TYPE_DELEGATEE_METHODHOLDER_ARGUMENTS_];
    source = "\n\"perform type error;\nthis method was automatically generated by the VM.\"\n";
    break;

   default:
    ShouldNotReachHere(); // unknown status
  }
}


stringOop simpleLookup::messageTypeForLookupError() {
  switch (baseLookupType(lookupType())) {
   case NormalBaseLookupType:
     return VMString[isImplicitSelf() ? IMPLICITSELF : NORMAL];
   case ResendBaseLookupType:
     return VMString[RESEND];
   case DirectedResendBaseLookupType:
     return VMString[DIRECTEDRESEND];
   case DelegatedBaseLookupType:
     return VMString[DELEGATED];
   default:
     ShouldNotReachHere();  // bad lookup type
     return NULL;
  }
}


int32 simpleLookup::argCountForLookupError(int32 perform_arg_count) {
  int32 argc;

  if (isPerform()) {
    assert(perform_arg_count >= 0,
           "should have a static selector or a perform arg count");
    argc= perform_arg_count;
  } else {
    assert_string(selector(), "should be a string if static");
    argc= stringOop(selector())->arg_count();
  }
  assert(argc >= 0 && argc < 100, "bad arg count");
  return argc;
}


void simpleLookup::generateLookupErrorMethod(int32 perform_arg_count) {
  stringOop sel;
  const char* source;
  selectorAndSourceForLookupError(sel, source);
  stringOop msgType = messageTypeForLookupError();
  int32 argc = argCountForLookupError(perform_arg_count);

  // Create a method sending the lookup error message to the
  // current process.
  ByteCode b(true);
  slotList* slots = EMPTY;

  // push the receiver of the method send
  b.GenSendByteCode(0, 0, new_string("_ThisProcess"), true, false, NULL);

  // push the arguments
  
  // First push the selector. Must put it in a slot because
  // for a perform type error, it might be a block with an uplevel access.
  // That confuses the fixup code, which expects block literals to be lexically part of this method.
  // So, replaced   b.GenLiteralByteCode(0, 0, selector()); 
  // with: (dmu 1/03)
  stringOop attemptedSelector = new_string("selector");
  slots = slots->add( attemptedSelector, map_slotType, selector());
  b.GenSendByteCode(0, 0, attemptedSelector, true, false, NULL);

  b.GenSelfByteCode(0, 0);
  
  b.GenLiteralByteCode(0, 0, msgType);
  
  b.GenLiteralByteCode(0, 0,
                       delegatee() == NULL ? Memory->nilObj : delegatee());
  
  assert_methodHolder_is_object();
  assert(!methodHolder_or_map()->has_code(),
         "method holder shouldn't have code");
  
  stringOop del = new_string("delegatee");
  slots = slots->add( del, map_slotType,
                      isResendLookupType(lookupType())
                      ? methodHolder_or_map() : Memory->nilObj);
  b.GenSendByteCode(0, 0, del, true, false, NULL);
  
  // create vector to hold args: "vector _Clone: arc _FillingWith: nil"
  b.GenLiteralByteCode(0, 0, Memory->objVectorObj);
  b.GenLiteralByteCode(0, 0, as_smiOop(argc));
  b.GenLiteralByteCode(0, 0, Memory->nilObj);
  b.GenSendByteCode(0, 0, VMString[_CLONE_FILLER_], false, false, NULL);
  
  // also cons up arg names, add arg slots, get args into stack
  for (fint i = 0; i < argc; i++) {
    // make argNameOop
    char argName[20];
    sprintf(argName, "arg%ld", (long)i + 1);
    stringOop arg = new_string(argName);
    
    // make slot and store arg in vector
    slots = slots->add(arg, arg_slotType, as_smiOop(i));
    
    // <vector> at: i Put: <arg>
    b.GenLiteralByteCode(0, 0, as_smiOop(i));
    b.GenSendByteCode(0, 0, arg, true, false, NULL);
    b.GenSendByteCode(0, 0, VMString[_AT_PUT_], false, false, NULL);
  }
  
  // send the message to the receiver.
  b.GenSendByteCode(0, 0, sel, false, false, NULL);
  
  // NB: don't change <error> below without consulting recompile.c;
  // the code there uses it to recognize these weird methods.  Should
  // really be a flag somewhere
  bool ok = b.Finish("<error>", source);
  assert(ok, "no errors here");

  slotsOop method= create_outerMethod(slots, &b);
  setResult(method);
}


void simpleLookup::print() {
  printIndent();
  lprintf("simpleLookup: status = %s\n", lookupStatusString(status));
  printIndent();
  lprintf("rcvMap = 0x%lx, mh = ",
         receiverMapOop());
  if (methodHolder_or_map() == MH_NOT_A_RESEND) {
    lprintf("<not a resend>");
  } else {
    methodHolder_or_map()->print_real_oop();
  }
  lprintf(",\n");
  printIndent();
  lprintf("           sel = ");
  selector()->print_real_oop();
  lprintf(", del = ");
  delegatee()->print_real_oop();
  lprintf(",\n");
  printIndent();
  lprintf("           type = ");
  printLookupType(lookupType());
  lprintf("\n");
}


const char* lookupStatusString(LookupStatus status) {
  switch (status) {
   case foundNone:                    return "not found";
   case foundOne:                     return "found one";
   case foundSeveral:                 return "message ambiguous";
   case foundAssignableParent:        return "found assignable parent";
   case resendUndecidable:            return "resend undecidable";
   case delegateeNotFound:            return "delegatee not found";
   case mismatchedArgCount:           return "mismatched arg count";
   case performTypeError:             return "selector isn't a string";
   default:
    fatal("unknown lookup failure status");
  }
  return NULL;
}
