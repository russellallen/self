/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "blockMap.hh"
# include "_blockMap.cpp.incl"

void blockMap::init(stringOop name, slotsOop method) {
  Memory->store((oop*)&valueMethodName, oop(name));
  Memory->store((oop*)&valueMethod, oop(method));
}

blockOop create_block(slotsOop meth) {
  stringOop name;
  fint arg_count = meth->map()->arg_count();
  switch (arg_count) {
   case 0: name= VMString[VALUE]; break;
   case 1: name= VMString[VALUE_]; break;
   case 2: name= VMString[VALUE_WITH_]; break;
   case 3: name= VMString[VALUE_WITH_WITH_]; break;
   case 4: name= VMString[VALUE_WITH_WITH_WITH_]; break;
   default:
    char* slot =  NEW_RESOURCE_ARRAY( char, arg_count * 5 + 2);
    char* s = slot;
    strncpy(s, "value:With:With:With:With:", 26);
    for (s += 26, arg_count -= 5; arg_count > 0; arg_count --, s += 5) {
      strncpy(s, "With:", 5);
    }
    *s = '\0';
    name= new_string(slot);
  }
  
  blockMap m1;
  oop ignored;
  blockMap* b= (blockMap*)create_map(sizeof(blockMap), NULL, &m1, &ignored);
  b->setDesc(BLOCK_PROTO_DESC);
  b->init(name, meth);
  blockOop block= (blockOop)create_slots(b->empty_object_size());
  slotsOop(block)->set_map(b);
  ((blockOopClass*)block->addr())->setHomeFr(BLOCK_PROTO_SCOPE);
  return block;
}


slotDesc* blockMap::find_slot(stringOop name) {
  if (name == valueMethodName) {
    setSlots();
    return &block_slots[1];
  }
  if (name == VMString[PARENT])
    return &block_slots[0];
  return NULL;
}
    

void blockMap::switch_pointer_in_map(oop* where,  oop to) {
  if (where == (oop*)&valueMethod) {
    Memory->store((oop*)&valueMethod, to);
    return;
  }
}


void blockMap::kill(oop p) {
  blockOop(p)->kill_block();
}
 
bool blockMap::is_live(oop p) {
  return blockOop(p)->is_live_block();
}

oop blockMap::scavenge(oop obj) {
  // use :: to avoid another virtual function call
  return slotsOop(obj)->scavenge(blockMap::object_size(obj)); 
}

// BUG: verifying block homes is optional because the current system doesn't
// always kill blocks correctly.  Known bugs are:
// - dead blocks are returned by vframe::get_contents if the block was
//   completely optimized away (BlockValueDesc)  (all compilers except
//   NIC which doesn't have such blocks)
// - recompilation & on-stack replacement may leave unkilled blocks
//   (should only happen for "primFailBlock" blocks)
// Urs 4/93

static bool VerifyBlockHomes = false;

bool blockMap::verify(oop obj) {
  bool flag= slotsOop(obj)->verify();
  if (flag) {
    frame* bs = blockOop(obj)->scope(true);
    if (! oop(bs)->is_smi()) {
      error1("scope of blockOop %#lx isn't a smiOop", obj);
      flag = false;
    }
    // verify scope bs
    if (flag && bs && VerifyBlockHomes) {
      Stack* stk = processes->stackFor(bs);
      if (stk == NULL) {
        error1("scope of blockOop %#lx isn't in any stack", obj);
        flag = false;
      } else {
        frame* f = stk->last_self_frame(false);
        while (f && f != bs)  f = f->selfSender();
        if (f == NULL) {
          error1("scope of blockOop %#lx isn't a valid frame pointer", obj);
          flag = false;
        }
      }
    }
    if (! blockOop(obj)->desc()->is_smi()) {
      error1("desc of blockOop %#lx isn't a smiOop", obj);
      flag = false;
    }
  }
  return flag;
}

void blockMap::print(oop obj) {
  if (obj->is_map()) {
    blockMap *m= (blockMap*)(mapOop(obj)->map_addr());
    lprintf("block map (desc=%d, ", m->desc()->value());
    m->valueMethodName->print();
    lprintf(" method %#lx\n", (unsigned long)(m->valueMethod));
    return;
  }
  printObjectID(obj);
  lprintf(": ");
  Map::print(obj);
}


oop blockMap::mirror_parent(oop obj) {
  ResourceMark rm;
  frame* scope = blockOop(obj)->scope(true);
  if (scope) {
    abstract_vframe* vf = new_vframe(
      scope->home_frame_of_block_scope(),
      blockOop(obj)->desc());
    Process* p = processes->stackFor(scope)->process;
    return new_vframeOop(p, vf)->as_mirror();
  } else {
    return ErrorCodes::vmString_prim_error(NOPARENTERROR);
  }
}

void blockMap::dummy_initialize(oop obj, oop filler) {
  Unused(filler);
  assert( obj->is_block(), "a blockOop is expected");
  kill(obj);
}

oop blockMap::dummy_obj(oop filler) {
  slotsOop obj= create_slots(empty_object_size());
  obj->set_map(this);
  dummy_initialize(obj, filler);
  return obj;
}
