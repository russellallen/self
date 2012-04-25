/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "slotDesc.hh"
# include "_slotDesc.cpp.incl"

stringOop slotDesc::assignment_slot_name() {
  ResourceMark rm;
  assert(is_obj_slot(), "only obj slots are assignable");
  int32 len= name->length();
  char* sn= NEW_RESOURCE_ARRAY(char, len + 2);
  copy_bytes(name->bytes(), sn, len);
  sn[len    ] = ':';
  sn[len + 1] = '\0';
  return new_string(sn, len + 1); }

bool slotDesc::is_assignment_slot_name(stringOop n) {
  if (!is_obj_slot()) return false;
  fint l1= name->length(), l2= n->length();
  if (l1 + 1 != l2  ||  n->bytes()[l2-1] != ':') return false;
  return strncmp(name->bytes(), n->bytes(), l1)==0; }

bool slotDesc::verify(Map* m) {
  bool flag = true;
  if (!bootstrapping && !name->is_string()) {
    error1("slot 0x%lx name isn't a string", this);
    flag = false;
  }
  if (!oop(type)->is_smi()) {
    error1("slot 0x%lx type isn't a smiOop", this);
    flag = false;
  } else {
    smiOop offset;
    switch (type->slot_type()) {
     case obj_slot_type:
      offset = smiOop(data);
      if (!offset->is_smi()) {
        error1("slot 0x%lx offset isn't a smiOop", this);
        flag = false;
      } else if (m && ! m->is_slots()) {
        error1("slot 0x%lx is in the object of a non-slots map", this);
        flag = false;
      } else if (offset->value() < 0 || 
                 (m && 
                 offset->value() >= ((slotsMap*) m)->object_length->value())) {
        error1("slot 0x%lx offset is out of range", this);
        flag = false;
      }
      break;
     case map_slot_type:
      break;
     case arg_slot_type:
      offset = smiOop(data);
      if (!offset->is_smi()) {
        error1("slot 0x%lx argument index isn't a smiOop", this);
        flag = false;
      } else if (offset->value() < 0) {
        error1("slot 0x%lx argument index is negative", this);
        flag = false;
      }
      break;
     default:
      error1("slot 0x%lx type isn't a legal slot type", this);
      flag = false;
    }
  }
  return flag;
}



void slotDesc::printAugmentedName() { lprintf("%s", augmentedName()); }

char* slotDesc::augmentedName() {
  char* buf = NEW_RESOURCE_ARRAY(char, 80);
  buf[0] = '\0';
  if (is_arg_slot()) strcat(buf, ":");
  strcat(buf, name->copy_null_terminated());
  if (is_parent()) strcat(buf, "*");
  return buf;
}


bool slotDesc::compare(slotDesc* sd) {
  //INPUT a slotDesc, sd
  //OUTPUT true if sd is equivalent to this, otherwise false

  assert(   name == sd->name
         ||     name->is_unary() &&     is_assignment_slot_name(sd->name)
         || sd->name->is_unary() && sd->is_assignment_slot_name(    name),
         "compared slots must have the same name");
  
  // are slot types the same?
  if (type             != sd->type            ) return false;
  if (get_annotation() != sd->get_annotation()) return false;

  switch (type->slot_type()) {
  case obj_slot_type: // assignable slot; slots match
    assert(data == sd->data, "offsets should match");
    return true;
  case map_slot_type: // constant slot:  make sure constants are same
    return data == sd->data;
  case arg_slot_type: // argument slot: shouldn't be comparing methods
  default:            // bad slot type
    break;
  }
  ShouldNotReachHere();
  return false;
}
