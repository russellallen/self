/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "label.hh"
# pragma implementation "label_inline.hh"
# include "_label.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


fint currentLabelID = 0;

Label* Label::unify(Label* other) {
  if (this == NULL) return other;
  if (other == NULL) return this;
  if (isDefined()) {
    other->define(_target, this);
  } 
  else if (other->isDefined()) {
    define(other->target(), other);
  } 
  else {
    Label* l = this;
    while(l->next) l = l->next;
    l->next = other;
  }
  return this;
}

void Label::define() { define(theAssembler->addr()); }

void Label::define(char* t, Label* other) {
  _target = t;
  if (patch) theAssembler->Backpatch(patch, t);
  if (theAssembler->printing) {
    if (other) {
      lprintf("L%ld = L%ld \n", (void*)id(), (void*)other->id());
    } else if (t != theAssembler->addr()) {
      lprintf("L%ld = %#lx\n", (void*)id(), t);
    } else {
      lprintf("L%ld: \n", (void*)id());
    }
  }
  if (next) next->define(t, other);
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
