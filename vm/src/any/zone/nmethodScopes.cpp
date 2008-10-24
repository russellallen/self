/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "nmethodScopes.hh"

# include "_nmethodScopes.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


ScopeDesc* nmethodScopes::at(fint offset) {
  // Read the first byte and decode the ScopeDesc type at the location.
  assert(offset >= 0  &&  offset < length(), "illegal desc offset");
  scopeDescHeaderByte b;
  b.unpack(peek_next_char(offset));
  ScopeDesc* sd;
  switch (b.code()) {
   case METHOD_CODE:
    sd = new MethodScopeDesc(this, offset);
    break;
   case TOPLEVELBLOCK_CODE:
    sd = new TopLevelBlockScopeDesc(this, offset);
    break;
   case BLOCK_CODE:
    sd = new BlockScopeDesc(this, offset);
    break;
   case DEADBLOCK_CODE:
    sd = new DeadBlockScopeDesc(this, offset);
    break;
   case DATAACCESS_CODE:
    sd = new DataAccessScopeDesc(this, offset);
    break;
   case DATAASSIGNMENT_CODE:
    sd = new DataAssignmentScopeDesc(this, offset);
    break;
   default:
    fatal("Unknown ScopeDesc code in nmethodScopes");
  }
  if (!b.nameDescs()) {
    sd->_exprOffset = sd->_blockOffset = 
      sd->_next = sd->_name_desc_offset;
  }
  return sd;
}

int16  nmethodScopes::get_next_half(int32& offset) {
  int16 v;
  v = get_next_char(offset) << BYTE_WIDTH;
  v = addBits(v, get_next_char(offset));
  return v;
}

inline u_char nmethodScopes::getIndexAt(int32& offset) { 
  return get_next_char(offset);
}


inline oop nmethodScopes::unpackOopFromIndex(u_char index, int32& offset) {
  if (index == 0)  return 0;
  if (index < EXTENDED_INDEX) return oop_at(index-1);
  return oop_at(get_next_half(offset)-1); 
}

inline int32 nmethodScopes::unpackValueFromIndex(u_char index, int32& offset) {
  if (index <= MAX_INLINE_VALUE) return index;
  if (index < EXTENDED_INDEX) return value_at(index-(MAX_INLINE_VALUE+1));
  return value_at(get_next_half(offset)-(MAX_INLINE_VALUE+1)); 
}

oop nmethodScopes::unpackOopAt(int32& offset) {
  u_char index = getIndexAt(offset);
  return unpackOopFromIndex(index, offset);
}

int32 nmethodScopes::unpackValueAt(int32& offset) {
  u_char index = getIndexAt(offset);
  return unpackValueFromIndex(index, offset);
}

NameDesc* nmethodScopes::unpackNameDescAt(int32& offset) {
  int32 startOffset = offset;
  nameDescHeaderByte b;
  b.unpack(get_next_char(offset));
  NameDesc* nd;
  if (b.code() == ILLEGAL_CODE) {
    nd = new IllegalNameDesc;
  } else {
    int32 id = b.hasId() ? unpackValueAt(offset) : 0;
    u_char index;
    index = b.isIndexInlined() ? b.index() : getIndexAt(offset);

    switch(b.code()) {
     case LOCATION_CODE: {
       Location l = Location(unpackValueFromIndex(index, offset));
       nd = new LocationNameDesc(l, id);
       break;
     }
     case VALUE_CODE: {
       oop v = unpackOopFromIndex(index, offset);
       nd = new ValueNameDesc(v, id);
       break;
     }
     case BLOCKVALUE_CODE: {
       oop blk = unpackOopFromIndex(index, offset);
       nd = new BlockValueNameDesc(blk, id);
       break;
     }
     case MEMOIZEDBLOCK_CODE: {
       Location l   = (Location) unpackValueFromIndex(index, offset);
       oop      blk = unpackOopAt(offset);
       nd = new MemoizedBlockNameDesc(l, blk, id);
       break;
     }
     default:
      fatal("no such name desc");
    }
  }
  nd->offset = startOffset;
  nd->next   = offset;
  return nd;
}

# define FOR_EACH_OOPADDR(VAR)                                                \
    for (oop* VAR = oops(), *CONC(VAR, _end) = oops() + oops_size();          \
         VAR < CONC(VAR, _end); VAR++)

bool nmethodScopes::verify() {
  bool verify_result = true;
  // Verify all oops
  FOR_EACH_OOPADDR(addr) {
    VERIFY_TEMPLATE(addr)
  }

  // Verify all scopedesc
  FOR_EACH_SCOPE(this, s) {
    if (!s->verify()) {
      lprintf("\t\tin nmethod at %#lx (scopes)\n",
             (long unsigned)(my_nmethod())); 
      verify_result = false;
    }
  }
  return verify_result;
}

void nmethodScopes::scavenge_contents() {
  FOR_EACH_OOPADDR(addr) {
    SCAVENGE_TEMPLATE(addr);
  }
}

void nmethodScopes::gc_mark_contents() {
  FOR_EACH_OOPADDR(addr) {
    MARK_TEMPLATE(addr);
  }
}

void nmethodScopes::gc_unmark_contents() {
  FOR_EACH_OOPADDR(addr) {
    UNMARK_TEMPLATE(addr);
  }
}

void nmethodScopes::switch_pointers(oop from, oop to,
                                    nmethodBList *nmethods_to_invalidate) {
  Unused(to);
/*
  This is tricky!
  First, since some inlined methods are not included in scopes
  (those that generate no code such as asSmallInteger),
  you might think that this would
  not be needed, since memory is swept and dependencies flushed
  (see space::switch_pointers_in_region).

  But, when nmethods are converted on the stack, zombie nmethods are
  produced. These are obsolete nmethods that carry on the execution of
  active but no longer referenced methods on the stack.
  Since they have no dependencies, they are not found from the heap.
  That is why this code is needed anyway.

  Now, since this info describes the code, you cannot change it,
  instead, you invalidate the nmethod if it has a ref to from in its scopes.
  For example the method oops in the scope determine the activations
  that might be on the stack, and you can't change these, because
  activations are clones of methods. This may be the last reference to
  a currently executing method, must keep it around.

  However, you may be confused by the fact that locs (embedded literals)
  in the code in the method are changed. But, those are just object literals,
  maps of inlined stuff, and are different than the scope oops.

  Although they could possibly be the same, by invalidating any
  match (beyond just the method holder and method) we are safe.
  
  -- dmu 7/93
*/

  if (my_nmethod()->isInvalid()) return;
  
  FOR_EACH_OOPADDR(addr) {
    if (*addr == from) {
      nmethods_to_invalidate->append(my_nmethod());
      return;
    }
  }
}

void nmethodScopes::oops_do(oopsDoFn f) {
  FOR_EACH_OOPADDR(addr) {
    OOPS_DO_TEMPLATE(addr,f);
  }
}

void nmethodScopes::relocate() {
  FOR_EACH_OOPADDR(addr) {
    RELOCATE_TEMPLATE(addr);
  }
}

bool nmethodScopes::is_new() {
  FOR_EACH_OOPADDR(addr) {
    if ((*addr)->is_new()) return true;
  }
  return false;
}

void nmethodScopes::print() {
  ResourceMark m;       // in case methods get printed from gdb
  printIndent();
  lprintf("scopes:\n");
  Indent ++;
  FOR_EACH_SCOPE(this, d)
    d->print();
  Indent --;
}



# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
