/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "key.hh"
# include "_key.cpp.incl"


char* selector_string(oop selector) {
  if (selector->is_string()) {
    return stringOop(selector)->copy_null_terminated();
  } else {
    return "<not a string>";
  }
}


void ScopeLookupKey::set_from(ScopeLookupKey &k) {
  lookupType= k.lookupType;
  selector= k.selector;
  delegatee= k.delegatee;
}


void ScopeLookupKey::print() {
  if (delegatee != NULL) {
    if (delegatee->is_string()) {
      stringOop(delegatee)->string_print();
    } else {
      delegatee->print_real_oop();
    }
    lprintf(".");
  }
  if (selector->is_string()) {
    stringOop(selector)->string_print();
  } else {
    selector->print_real_oop();
  }
}


void MethodLookupKey::set_from(MethodLookupKey &k) {
  ScopeLookupKey::set_from(k);
  _receiverMapOop=         k._receiverMapOop;
  _methodHolder_or_map=   k._methodHolder_or_map;
}


int32 MethodLookupKey::hash() {
  int32 i;

  // Coded for speed - called for every codeTable lookup

  // XOR the identity-hash values of the fields.  For efficiency, just
  // xor the marks and extract hash bits at the end instead of doing
  // this for every field.
  // Also, don't need to check for no_hash: real keys are guaranteed
  // to have an id hash value because init_hash is called before a
  // key is added to the table.  If a lookup key contains oops with
  // no_hash, we'll have a bogus hash value, but we won't find anything
  // anyway.
  i  = (int32)receiverMapOop()->mark();
  if (selector->is_mem())
    i ^= (int32)memOop(selector)->mark();

  // Can't do the optimization for the methodHolder - it might be
  // e.g. a smiOop in the lookupError glue method.
  
  // Not non-zero often enough to hash on
  // (an optimization for speed; Bay's idea)
  //  i ^= (int32)delegatee             ->mark();

  return   (lookupType & ~ImplicitSelfBit)
         ^ markOop(i)->hash()
         ^ methodHolder_or_map()->identity_hash();
}


void MethodLookupKey::init_hash() {
  receiverMapOop()      ->identity_hash();
  methodHolder_or_map()->identity_hash();
  selector              ->identity_hash();
  delegatee             ->identity_hash();
}


void MethodLookupKey::print() {
  printIndent();
  lprintf("MethodLookupKey: rcvMap = 0x%lx, mh = ",
         (long unsigned)receiverMapOop());
  if (methodHolder_or_map() == MH_TBD) {
    lprintf("<to be determined>");
  } else {
    methodHolder_or_map()->print_real_oop();
  }
  lprintf(",\n");
  printIndent();
  lprintf("           sel = ");
  selector->print_real_oop();
  lprintf(", del = ");
  delegatee->print_real_oop();
  lprintf(",\n");
  printIndent();
  lprintf("           type = ");
  printLookupType(lookupType);
  lprintf("\n");
}



void NMethodLookupKey::relocate() {
  RELOCATE_TEMPLATE(&_receiverMapOop);
  RELOCATE_TEMPLATE(&_methodHolder_or_map);
  RELOCATE_TEMPLATE(&selector);
  RELOCATE_TEMPLATE(&delegatee);
}


bool NMethodLookupKey::verify() {
  bool flag = true;
  if (!oop(receiverMapOop())->verify_oop()) {
    lprintf("\tin receiverMap of NMethodLookupKey 0x%lx\n", this);
    flag = false;
  } else if (!receiverMapOop()->is_map()) {
    error1("receiverMapOop() 0x%lx isn't a map", receiverMapOop());
    flag = false;
  }
  if ( methodHolder_or_map() != MH_TBD 
  &&  !methodHolder_or_map()->verify_oop()) {
    lprintf("\tin methodHolder of NMethodLookupKey 0x%lx\n", this);
    flag = false;
  }
  if (selector) {
    if (!selector->verify_oop()) {
      lprintf("\tin selector of NMethodLookupKey 0x%lx\n", this);
      flag = false;
      /* uncommon but legal
      } else if (!selector->is_string()) {
        lprintf("warning: selector ");
        selector->print_oop();
        lprintf(" isn't a string\n");
        flag = false;
        */
      }
  }
  if (delegatee) {
    if (!delegatee->verify_oop()) {
      lprintf("\tin delegatee of NMethodLookupKey 0x%lx\n", this);
      flag = false;
    } else {
      BaseLookupType l = baseLookupType(lookupType);
      if (l == DirectedResendBaseLookupType &&
          ! delegatee->is_string()) {
        error1("delegatee 0x%lx isn't a string", delegatee);
        flag = false;
      }
    }
  }
  return flag;
}


void NMethodLookupKey::scavenge_contents() {
  SCAVENGE_TEMPLATE(&_receiverMapOop);
  SCAVENGE_TEMPLATE(&_methodHolder_or_map);
  SCAVENGE_TEMPLATE(&selector);
  SCAVENGE_TEMPLATE(&delegatee);
}


void NMethodLookupKey::gc_mark_contents() {
  MARK_TEMPLATE(&_receiverMapOop);
  MARK_TEMPLATE(&_methodHolder_or_map);
  MARK_TEMPLATE(&selector);
  MARK_TEMPLATE(&delegatee);
}

void NMethodLookupKey::gc_unmark_contents() {
  UNMARK_TEMPLATE(&_receiverMapOop);
  UNMARK_TEMPLATE(&_methodHolder_or_map);
  UNMARK_TEMPLATE(&selector);
  UNMARK_TEMPLATE(&delegatee);
}

void NMethodLookupKey::switch_pointers(oop from, oop to) {
  SWITCH_POINTERS_TEMPLATE(&_receiverMapOop);
  SWITCH_POINTERS_TEMPLATE(&_methodHolder_or_map);
  SWITCH_POINTERS_TEMPLATE(&selector);
  SWITCH_POINTERS_TEMPLATE(&delegatee);
}

void NMethodLookupKey::oops_do(oopsDoFn f) {
  OOPS_DO_TEMPLATE(&_receiverMapOop,f);
  OOPS_DO_TEMPLATE(&_methodHolder_or_map,f);
  OOPS_DO_TEMPLATE(&selector,f);
  OOPS_DO_TEMPLATE(&delegatee,f);
}


