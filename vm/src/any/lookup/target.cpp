/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "target.hh"
# include "_target.cpp.incl"

lookupTarget* objectLookupTarget::get_target_for_slot(slotDesc* s,
                                                      simpleLookup* L) {
  if ( s->is_map_slot() )
    return new objectLookupTarget( obj->get_slot(s));
  
  if (L->is_for_inlining())
    return NULL;

  objectLookupTarget* target =
    new objectLookupTarget(obj->get_slot(s));

  target->prevTargetSlot = new realSlotRef(this, s);

  L->add_asg_parent_dependency(this, target, s);

  return target;
}

lookupTarget* mapLookupTarget::get_target_for_slot(slotDesc* s,
                                                   simpleLookup* L) {
  Unused(L);
  if ( s->is_map_slot() )
    return new objectLookupTarget( s->data);
  
  return NULL;
}
    
  
lookupTarget*
 vframeLookupTarget::get_target_for_slot(slotDesc* s, simpleLookup* L) {
  Unused(L);
  if (s->name == VMString[LEXICAL_PARENT]) {
    return new vframeLookupTarget(vf->parent(), receiver);
  } else if (s->name == VMString[SELF]) {
    return (new objectLookupTarget(receiver)) -> be_receiver();
  } else {
    assert(s->is_map_slot(), "sorry, can't handle assignable local parents");
    oop p = vf->get_slot(s);
    assert(p != badOop, "sorry, local slot not located");
    return new objectLookupTarget(p);
  }
}

# ifdef SIC_COMPILER
  
  lookupTarget* sicScopeLookupTarget::get_target_for_slot(slotDesc* s,
                                                          simpleLookup* L) {
    Unused(L);
    if (s->name == VMString[LEXICAL_PARENT]) {
      return new sicScopeLookupTarget(scope->parent());
    } else if (s->name == VMString[SELF]) {
      SExpr* t = scope->receiverExpr();
      if (t->isConstantSExpr()) {
        return (new objectLookupTarget(t->constant())) -> be_receiver();
      } else if (t->hasMap()) {
        return ( new mapLookupTarget(t->map())) -> be_receiver();
      } else {
        // don't know the receiver type
        return NULL;
      }
    } else if (! s->is_map_slot()) {
      return NULL;
    } else {
      return new objectLookupTarget(s->data);
    }
  }
# endif


# ifdef SIC_COMPILER
  sicScopeLookupTarget::sicScopeLookupTarget(SScope* s)
  : lookupTarget(s->method()->map()) {
    scope = s;
  }
# endif

assignableSlotLink* assignableSlotLink::add(slotDesc* s,
                                            objectLookupTarget* t) {
  assignableSlotLink* e = new assignableSlotLink(s, t);
  if (this == NULL) return e;
  assignableSlotLink *l, *n;
  for (l = this, n = l->next;
       n;
       l = n, n = l->next)
    ;
  l->next = e;
  return this;
}




// just printing from here on down


void assignableSlotLink::print() {
  printIndent();
  lprintf("{ ");
  bool first = true;
  Indent ++;
  for (assignableSlotLink* l = this; l; l = l->next) {
    if (first) {
      first = false;
    } else {
      lprintf(",\n");
      printIndent();
    }
    lprintf("desc 0x%lx (", (l->slot));
    l->slot->name->string_print();
    lprintf(") -> 0x%lx", (unsigned long)(l->target));
  }
  Indent --;
  lprintf(" }\n");
}

void objectLookupTarget::print() {
  printIndent();
  print_short();
  lprintf(" 0x%lx: ", this);
  obj->print_real_oop();
  lprintf(" (map: 0x%lx)\n", map());
  Indent ++;
  if (prevTargetSlot) {
    printIndent();
    lprintf("prevTarget:\n");
    Indent ++;
    prevTargetSlot->print();
    Indent --;
  }
  if (links) {
    links->print();
  }
  printIndent();
  lprintf("valueConstrained: %s\n", value_constrained ? "yes" : "no");
  Indent --;
}

void objectLookupTarget::print_short() {
  lprintf("objectLookupTarget");
}


void mapLookupTarget::print() {
  printIndent();
  lprintf("mapLookupTarget 0x%lx: map: 0x%lx\n",
         this, map());
}

void vframeLookupTarget::print() {
  printIndent();
  lprintf("vframeLookupTarget 0x%lx: ", this);
  receiver->print_real_oop();
  lprintf(" (map: 0x%lx)\n", map());
  Indent ++;
  vf->print_frame(0);
  Indent --;
}

# ifdef SIC_COMPILER
  void sicScopeLookupTarget::print() {
    printIndent();
    lprintf("sicScopeLookupTarget %#lx: map: 0x%lx scope %#lx\n",
           (long unsigned)this, (long unsigned)map(), (long unsigned)scope);
  }
# endif

oop objectLookupTarget::get_slot(slotDesc* sd) {
  return obj->get_slot(sd);
}

void objectLookupTarget::set_slot(slotDesc* sd, oop x) {
  obj->set_slot(sd, x);
}

oop vframeLookupTarget::get_slot(slotDesc* sd) {
  return vf->get_slot(sd);
}

void vframeLookupTarget::set_slot(slotDesc* sd, oop x) {
  vf->set_slot(sd, x);
}
