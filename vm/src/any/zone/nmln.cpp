/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "allocation.hh"
# include "cacheStub_inline.hh"
# include "codeTable.hh"
# include "countStub.hh"
# include "diDesc.hh"
# include "label_inline.hh"
# include "mapTable.hh"
# include "nmethod_inline.hh"
# include "nmln.hh"
# include "os_includes.hh"
# include "sendDesc.hh"
# include "zone.hh"


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

// This nmln is about to move by delta; adjust all links.
void nmln::shift(int32 diff, NCodeBase* m) {
  if (isEmpty()) {
    // an empty list; shift myself
    next = (nmln*) ((char*) next + diff);
    prev = (nmln*) ((char*) prev + diff);
  } else {
    // shift next-door neighbors
    nmln* l = prev;
    if (m->encompasses(l)) {
      // prev is in this nmethod; shift my prev instead
      prev = (nmln*) ((char*) l + diff);
    } else {
      // make prev's next point to where I will be
      l->next = (nmln*) ((char*) l->next + diff);
    }
    l = next;
    if (m->encompasses(l)) {
      // next is in this nmethod; shift my next instead
      next = (nmln*) ((char*) l + diff);
    } else {
      // make next's prev point to where I will be
      l->prev = (nmln*) ((char*) l->prev + diff);
    }
  }
}

# endif

// traverse a chain and init every nmln

void nmln::init_chain() {
  nmln *c, *n;
  for (  c = next;  c != this;  c = n) {
    n = c->next;
    c->init();
  }
  init();
}
  

# define IgnoreBits  3
# define MapBits     15

inline int32 nmln::hash() {
  return (int32(this) >> IgnoreBits) & nthMask(MapBits);
}

static nmln** nmlnCache = NULL;
// direct-mapped cache of 2^MapBits nmlns to speed up verify

# if GENERATE_DEBUGGING_AIDS
  static int32 nmlnConflicts = 0;
  static int32 nmlnVerifies = 0;
# endif

void initNmlnCache() {
  nmlnCache = NEW_RESOURCE_ARRAY( nmln*, 1 << MapBits);
  memset((char*)nmlnCache, 0, sizeof(nmln*) * (1 << MapBits));
}

void resetNmlnCache() { nmlnCache = NULL; }

void nmln::print() {
  lprintf("0x%lx: prev: 0x%lx, next: 0x%lx",
         this, prev, next);
}



bool nmln::verify_list_integrity() {
  bool flag = true;
  int32 count = 0;
  for (nmln *p = next; p != this; p = p->next) {
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      nmlnVerifies++;
    }
#   endif
    if (nmlnCache) {
      int32 hash = p->hash();
      if (nmlnCache[hash] == p) {
        break;                  // already verified
      } else {
#       if GENERATE_DEBUGGING_AIDS
          if (CheckAssertions  &&  nmlnCache[hash]) nmlnConflicts++;
#       endif      
        nmlnCache[hash] = p;
      }
    }
    if (++count > 100000) {
      error2("bad nmln list: figure six bug around 0x%lx in list 0x%lx",
             p, this);
      flag = false;
      break;
    }
#   if  defined(FAST_COMPILER) || defined(SIC_COMPILER)
#ifdef broken
    // with nmlns in the codeTableEntries, there is no fast test
    else if (! Memory->code->contains(p) &&
             ! Memory->code->stubs->contains(p) &&
             ! Memory->is_obj_heap((oop*)p) &&
             ! Memory->code->table->contains(p) &&
             ! Memory->code->debugTable->contains(p) &&
             ! Memory->map_table->contains(p) &&
             p != &Memory->code->rememberLink &&
             p != &Memory->code->replCandidates &&
             p != &Memory->code->zombies) {
      error2("bad nmln list: 0x%lx is out of bounds in list 0x%lx", p, this);
      flag = false;
      break;
    }
#endif
#   endif
    /* Too slow! and too specific!
    else if (Memory->code->contains(p) && ! nmethod::findNMethod(p)->encompasses(p)) {
      error2("bad nmln list: 0x%lx not in a valid method in list 0x%lx",
             p, this);
      flag = false;
      break;
    }
    */
    /* caught by figure six bug
    else if (p == p->next) {
      error2("bad nmln list: p == p->next at 0x%lx in list 0x%lx", p, this);
      flag = false;
      break;
    }
    */
    /* need to check only one direction
    else if (p->prev->next != p) {
      error2("bad nmln list: p->prev->next != p at 0x%lx in list 0x%lx",
             p, this);
      flag = false;
      break;
    }
    */
    else if (p->next->prev != p) {
      error2("bad nmln list: p->next->prev != p at 0x%lx in list 0x%lx",
             p, this);
      flag = false;
      break;
    }
  }
  if (next == this) flag = (prev == this);
  return flag;
}

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

void nmln::flush() {
  while (next != this) {
    nmethod *n;
    slotsMapDeps *ignored;
    Memory->code->findNMethodOrMap(next, n, ignored);
    if (n) {
      // flush an nmethod (also removes the nmethod from the list)
      n->flush();
    } else {
      // remove any other map links from the list, too
      next->remove();
    }
  }
}


// the asXXX functions are not inlined to reduce .h dependencies
CacheStub* nmln::asCacheStub() {
  NCodeBase* s =
    Memory->code->stubs->contains(this) ? findStub(this) : NULL;
  return s && s->isCacheStub() ? (CacheStub*)s : NULL;
}

CountStub* nmln::asCountStub() {
  NCodeBase* s =
    Memory->code->stubs->contains(this) ? findStub(this) : NULL;
  return s && s->isCountStub() ? (CountStub*)s : NULL;
}

sendDesc* nmln::asSendDesc_or_null() {
  return
    Memory->code->contains(this) 
      ?  sendDesc::sendDesc_from_nmln(this)
      :  NULL;
}

sendDesc* nmln::asSendDesc() {
  return sendDesc::sendDesc_from_nmln(this);
}

sendDesc* nmln::callingSendDesc() {
  sendDesc* sd = asSendDesc_or_null();
  if (sd) return sd;

  CacheStub* s = asCacheStub();
  if (s) return s->sd();

  CountStub* cs = asCountStub();
  if (cs) return cs->sd();

  ShouldNotReachHere(); // what is it?
  return NULL;
}

DIDesc* nmln::asDIDesc() {
  return (DIDesc*)((char*)this - DIDesc::di_depend_offset);
}

nmethod* nmln::asSender() {
  // the receiver is in an inline cache / stub; find the calling nmethod
  NCodeBase* s = findThing(this);
  if (s->isCountStub()) {
    return ((CountStub*)s)->sender();
  } else if (s->isNMethod()) {
    // was in an inline cache
    return (nmethod*)s;
  } else if (s->isCacheStub()) {
    return ((CacheStub*)s)->sender();
  } else {
    ShouldNotReachHere(); // what is it?
  }
  return NULL;
}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)


void nmln::invalidate() {
  while (next != this) {
    nmethod *n;
    slotsMapDeps *ignored;
    Memory->code->findNMethodOrMap(next, n, ignored);
    if (n) {
      // flush an nmethod (also removes the nmethod from the list)
      n->invalidate();
    } else {
      // remove any other map links from the list, too
      next->remove();
    }
  }
}

fint nmln::length() {
  fint counter = 0;
  FOR_EACH_NMLN(this, elem, counter++);
  return counter;
}

void print_chain(nmln* p) {     // for debugging
  nmln* first = p;
  nmln* prev = p->prev;
  do {
    // handle broken chains
    printf("%#lx <-> ", (long unsigned)p); 
    if (p->prev != prev || p->next->prev != p) {
      lprintf("## list is broken");
      break;
    }
    prev = p;
    p = p->next;
  } while (p != first);
  lprintf("%#lx\n", first); 
}

