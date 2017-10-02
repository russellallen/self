/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# include "generation_inline.hh"
# include "map.hh"
# include "mapTable.hh"
# include "memOop_inline.hh"
# include "oop_inline.hh"
# include "slotsMapDeps.hh"
# include "space_inline.hh"
# include "vmStrings.hh"


Map* memOopClass::map() { return addr()->_map->map_addr(); }

void memOopClass::set_map(Map* m, bool cs) {
  mapOop mp = m->enclosing_mapOop();
  if (cs) Memory->store((oop*)&addr()->_map, mp);
  else    addr()->_map = mp; 
}


void memOopClass::print_string(char* buf) {
  if (this == memOop(badOop)) {
    sprintf(buf, "badOop");
  }
  else
    map()->print_string(this, buf);
}

void memOopClass::print_oop() {
  if (this == memOop(badOop)) {
    lprintf("badOop");
  }
  else
    map()->print_oop(this);
}

int32 memOopClass::compute_derived_offset() {
  int32 i = 1;
  oop* p = ((oop*) addr()) - i;
  while (!is_object_start(*p)) {
    i ++, p --;
  }
  return i;
}

oop memOopClass::scavenge() {
  if (! Memory->should_scavenge(this)) {
    return this;
  } else if (this->is_forwarded()) {
    return oop(this->forwardee());
  } else {
    return map()->scavenge(this);
  }
}

bool memOopClass::verify_oop(bool expectErrorObj) {
  bool flag = Memory->verify_oop(this, expectErrorObj);
  if (flag && ! mark()->is_mark()) {
    error1("memOop 0x%lx doesn't point to a mark", this);
    flag = false;
  }
  return flag;
}

bool memOopClass::verify() {
  bool flag = verify_oop(this == Memory->errorObj);
  if (flag) {
    markOop m = mark();
    if (! oop(m)->is_mark()) {
      error1("mark of memOop 0x%lx isn't a markOop", this);
      if (! m->verify_oop())
        error1(" mark of memOop 0x%lx isn't even a legal oop", this);
      flag = false;
    }
    else if (is_objectMarked()) {
      error1("memOop 0x%lx is marked!", this);
      flag = false;
    }
    mapOop p = map()->enclosing_mapOop();
    if (! oop(p)->verify_oop()) {
      error1("map of memOop 0x%lx isn't a legal oop", this);
      flag = false;
    } else if (! p->is_map()) {
      error1("map of memOop 0x%lx isn't a mapOop", this);
      flag = false;
    } else if (map()->should_canonicalize()) {
      // put this test here so we only check maps actually used in objs--dmu
      Memory->map_table->verify_map((slotsMapDeps*)(map()));
    }
  }
  return flag;
}

void memOopClass::set_canonical_map(Map* new_map) {
  // check if there is an existing equivalent map.
  // if so, set the map to that instead of the current map.

  // Note that we don't check if the map has dependents.
  // If it does, we rely on garbage collection for cleaning up.

  set_map(new_map->should_canonicalize()
          ? (Map*) (Memory->map_table->canonical_map((slotsMapDeps*)new_map))
          : new_map);
}

void memOopClass::canonicalize_map() {
  // Called when reading a snapshot to get all maps in objects
  // in the map table & to canonicalize the objects' map fields.
  // We use an optimization: if the map is already canonical,
  //  don't have to do anything.  -- dmu 12/9/93

  Map* m = map();
  if (m->should_canonicalize() && ((slotsMapDeps*)m)->map_chain()->isEmpty())
    set_canonical_map(m);
}

void memOopClass::set_identity_hash(smi h) {
  set_mark(mark()->set_hash(h));
}
