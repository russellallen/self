/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "smiOop.hh"
# include "_smiOop.cpp.incl"

oop smiOopClass::as_object_prim() {
  int32 id = value();
  if (id < CurrentObjectID - NumObjectIDs ||
      id >= CurrentObjectID ||
      id < 0)
    return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
  return Memory->objectIDArray->obj_at(id % NumObjectIDs);
}

oop smiOopClass::address_as_oop_prim() {
  oop p = oop(value());
  if (p->is_mark() || 
      p->is_mem() && !Memory->really_contains(p) ||
      !p->verify_oop())
    return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR);
  return p;
}

oop smi_div_prim(smiOop rcvr,  smiOop arg) {
  if (!rcvr->is_smi())   return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  if (! arg->is_smi())   return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  smi r = rcvr->value();
  smi a = arg->value();
  if ((r == smiOop_min->value()) &&  a == -1) return ErrorCodes::vmString_prim_error(OVERFLOWERROR);
  if (a == 0)                                 return ErrorCodes::vmString_prim_error(DIVISIONBYZEROERROR);
  smi quo = (r / a);
  assert( abs(quo) == abs(r) / abs(a), "smi_div_prim is wrong on this platform");
  return as_smiOop(quo);
}

oop smi_mod_prim(smiOop rcvr,  smiOop arg) {
  if (!rcvr->is_smi())   return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  if (! arg->is_smi())   return ErrorCodes::vmString_prim_error(BADTYPEERROR);
  smi r = rcvr->value();
  smi a = arg->value();
  smi aa = a >= 0  ?  a  :  -a;
  if (a == 0) return ErrorCodes::vmString_prim_error(DIVISIONBYZEROERROR);
  int32 res = r % a;
  assert( smiOop(smi_div_prim(rcvr, arg))->value() * a   +  res  ==  r,
          "smi_mod_prim incorrect on this platform");
  return as_smiOop(res);
}

# define relational(name, op)                                                 \
  oop name(oop rcvr, oop arg) {                                               \
    if (rcvr->is_smi() && arg->is_smi()) {                                    \
      return ((smi)rcvr op (smi)arg) ? Memory->trueObj : Memory->falseObj;    \
    } else {                                                                  \
      return ErrorCodes::vmString_prim_error(BADTYPEERROR);                 \
    }                                                                         \
  }                                                                           \

relational(smi_lt_prim, <)
relational(smi_le_prim, <=)
relational(smi_eq_prim, ==)
relational(smi_ne_prim, !=)
relational(smi_ge_prim, >=)
relational(smi_gt_prim, >)
