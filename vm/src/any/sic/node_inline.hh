#pragma once
/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "node.hh"



# ifdef SIC_COMPILER

    
inline bool BasicNode::isReachable() { 
  return bb() != NULL; // true iff node is on bb's node list
}


inline void PNode::makeUses(BB* bb) {
  _bb = bb;
  assert(!hasSrc()  ||  srcUse || isReturnNode(),  "should have srcUse");
  assert(!hasDest() || destDef || isReturnNode() || _dest->isNoPReg(),
         "should have destDef");
}

inline void LoadNode::makeUses(BB* bb) {
  destDef = bb->addDef(this, _dest); PNode::makeUses(bb); 
}

inline void LoadOffsetNode::makeUses(BB* bb) {
  baseUse = bb->addUse(this, base); LoadNode::makeUses(bb); 
}
inline void LoadOffsetNode::checkUses(PReg* r) {
  base->eliminateDefsIfUnused(r);  LoadNode::checkUses(r);  
}

inline void LoadStackNode::makeUses(BB* bb) {
  frameUse = bb->addUse(this, frame); LoadNode::makeUses(bb); 
}
inline void LoadStackNode::checkUses(PReg* r) {
  frame->eliminateDefsIfUnused(r);  LoadNode::checkUses(r);  
}

inline void StoreNode::makeUses(BB* bb) {
  srcUse = bb->addUse(this, _src); PNode::makeUses(bb); 
}
inline void StoreNode::checkUses(PReg* r) {
  _src->eliminateDefsIfUnused(r);  PNode::checkUses(r);   
}

inline void StoreOffsetNode::makeUses(BB* bb) {
  baseUse = bb->addUse(this, base); StoreNode::makeUses(bb); 
}
inline void StoreOffsetNode::checkUses(PReg* r) {
  base->eliminateDefsIfUnused(r);   StoreNode::checkUses(r);  
}

inline void StoreStackNode::makeUses(BB* bb) {
  frameUse = bb->addUse(this, frame); StoreNode::makeUses(bb); 
}
inline void StoreStackNode::checkUses(PReg* r) {
  frame->eliminateDefsIfUnused(r);   StoreNode::checkUses(r);  
}

inline void AssignNode::makeUses(BB* bb) {
  destDef = bb->addDef(this, _dest); StoreNode::makeUses(bb); 
}

inline void MethodReturnNode::makeUses(BB* bb) {
  srcUse = bb->addUse(this, _src);  destDef = bb->addDef(this, _dest);
  // resultUse models the value's use in the caller
  resultUse = bb->addUse(this, _dest);
  ReturnNode::makeUses(bb);
}
inline void MethodReturnNode::checkUses(PReg* r) {
  _src ->eliminateDefsIfUnused(r); 
  _dest->eliminateDefsIfUnused(r);  // because makeUses adds a use of dest
  // don't need to check resultPR
  ReturnNode::checkUses(r);
}

inline void NonLocalReturnNode::makeUses(BB* bb) {
  // has nor src or dest -- uses hardwired NLR register
  ReturnNode::makeUses(bb);
}

inline void ArithNode::makeUses(BB* bb) {
  srcUse = bb->addUse(this, _src);  destDef = bb->addDef(this, _dest);
  PNode::makeUses(bb); 
}
inline  void ArithNode::checkUses(PReg* r) {
  _src->eliminateDefsIfUnused(r);  PNode::checkUses(r);  
}

inline void ArithRRNode::makeUses(BB* bb) { 
  operUse = bb->addUse(this, oper); ArithNode::makeUses(bb); 
}
inline   void ArithRRNode::checkUses(PReg* r) {
  oper->eliminateDefsIfUnused(r);   ArithNode::checkUses(r);  
}

inline void TArithRRNode::makeUses(BB* bb) { 
  operUse = bb->addUse(this, oper);
  srcUse = bb->addUse(this, _src);  destDef = bb->addDef(this, _dest);
  AbstractBranchNode::makeUses(bb);
}
inline void TArithRRNode::checkUses(PReg* r) { 
  oper->eliminateDefsIfUnused(r);
  _src->eliminateDefsIfUnused(r);
  AbstractBranchNode::checkUses(r);
}
  
inline void CallNode::makeUses(BB* bb) {
  destDef = bb->addDef(this, _dest); 
  AbstractBranchNode::makeUses(bb); 
}

inline void TypeTestNode::makeUses(BB* bb) {
  srcUse = bb->addUse(this, _src); AbstractBranchNode::makeUses(bb);
  // don't store uses - usually don't eliminate type tests
  for (fint i = mapPRs->length() - 1; i >= 0; i--) {
    ConstPReg* rr = mapPRs->nth(i);
    if (rr->constant != Memory->  smi_map->enclosing_mapOop() &&
        rr->constant != Memory->float_map->enclosing_mapOop()) 
      bb->addUse(this, rr);     // int/float map isn't needed for check
  }
}
inline void TypeTestNode::checkUses(PReg* r) {
  AbstractBranchNode::checkUses(r);
  _src->eliminateDefsIfUnused(r); 
  // other uses are ConstPReg's; no percentage in eliminating them
}

inline void IndexedBranchNode::makeUses(BB* bb) {
  srcUse = bb->addUse(this, _src); AbstractBranchNode::makeUses(bb);
}
inline void IndexedBranchNode::checkUses(PReg* r) {
  AbstractBranchNode::checkUses(r);
  _src->eliminateDefsIfUnused(r); 
}

inline void TBranchNode::makeUses(BB* bb) {
  srcUse  = bb->addUse(this, _src);
  argUse  = bb->addUse(this, arg);
  BranchNode::makeUses(bb);
}
inline void TBranchNode::checkUses(PReg* r) {
  _src->eliminateDefsIfUnused(r);  
  arg ->eliminateDefsIfUnused(r);  
  BranchNode::checkUses(r);
}

inline ConstPReg* BlockCloneNode::deadPR() {
  // the call of new_ConstPReg is to make sure we get the right scope
  deadBlockPR = new_ConstPReg(_scope, oop(Memory->deadBlockObj));
  return deadBlockPR;
}
inline void BlockCloneNode::makeUses(BB* bb) {
  PrimNode::makeUses(bb);
  deadPR();         // make sure deadPR exists - block may be memoized later
                  // (e.g. if it has no hard uses)
  if (isMemoized()) deadBlockUse = bb->addUse(this, deadBlockPR);
}
inline void BlockCloneNode::checkUses(PReg* r) { 
  PrimNode::checkUses(r);
  deadBlockPR->eliminateDefsIfUnused(r);
}

inline void BlockCreateNode::makeUses(BB* bb) {
  BlockCloneNode::makeUses(bb);
  if (isMemoized()) srcUse = bb->addUse(this, _dest);
}
inline void BlockCreateNode::checkUses(PReg* r) {
  BlockCloneNode::checkUses(r);
  _dest->eliminateDefsIfUnused(r);  
}

inline void BlockZapNode::makeUses(BB* bb) {
  destDef = bb->addDef(this, _dest); PNode::makeUses(bb); 
}

inline void AbstractArrayAtNode::makeUses(BB* bb) {
  srcUse = bb->addUse(this, _src); destDef = bb->addDef(this, _dest);
  argUse = bb->addUse(this, arg);
  errorDef = error ? bb->addDef(this, error) : NULL;
  AbstractBranchNode::makeUses(bb);
}
inline void AbstractArrayAtNode::checkUses(PReg* r) { 
  _src->eliminateDefsIfUnused(r);  
  arg ->eliminateDefsIfUnused(r);  
  AbstractBranchNode::checkUses(r);
}  

inline void AbstractArrayAtPutNode::makeUses(BB* bb) {
  elemUse = bb->addUse(this, elem); 
  AbstractArrayAtNode::makeUses(bb);
}
inline void AbstractArrayAtPutNode::checkUses(PReg* r) { 
  elem->eliminateDefsIfUnused(r);  
  AbstractArrayAtNode::checkUses(r);
}  

inline void FlushNode::makeUses(BB* bb) {
  // Add a "soft" source use for uplevel-read (because compiler can
  // handle uplevel accesses to constant-folded names).  But if the
  // variable is uplevel-written, we must not constant-fold it,
  // therefore we'll add a "hard" use.
  
  // I do not understand this at all.
  // In fact, I have a bug where the result of an inlined subtrace
  // is passed down as an arg to an inlined method, which
  // invokes a real block.
  // The arg is flushed, but since it is a soft use, it is later
  // eliminated! I am disabling this optimization for now. -- dmu 11/3/96

  // Here is what Urs had to say:

  // Well, uplevel accesses to constants get compiled as constants in the
  // accessing block, so the bug must be somewhere else.  (When compiling
  // the block the uplevel access finds a ValueNameDesc with the constant.)
  // 
  // So I'm not sure what happens in your case.  In theory, when a PReg is
  // eliminated its cpReg() should contain the replacement, and when it is
  // uplevel-read and optimized away the replacement should be set to
  // uplevel-read too.  But I just browsed my version and it looks like
  // that code isn't there.  But wait...if you look at FlushNode::gen it
  // checks the register's cpReg() and flushes that one (no comment there,
  // sorry) so that's ok, *unless* that node gets deleted when the PReg is
  // eliminated.  But the deleted flag is never set (see
  // FlushNode::eliminate) so things should be ok and I don't understand
  // what's going wrong... [ end of Urs' quote ]
  
  // I am opting to leave the optimization disabled, since
  // I still suspect there would be a problem with it. -- dmu 11/96
  
  assert(_src == _dest, "should be same");
  srcUse = bb->addUse(this, _src, 
                     /* (see comment above) !_src->uplevelW */ 
                     false);
  if (!readOnly) destDef = bb->addDef(this, _dest);
  PNode::makeUses(bb); 
}


inline void FlushNode::checkUses(PReg* r) {
  _src ->eliminateDefsIfUnused(r); 
  PNode::checkUses(r);
}



// removeUses: remove all uses and defs
inline void PNode::removeUses(BB* bb) { 
  assert(_bb == bb, "wrong BB"); 
}
inline void LoadNode::removeUses(BB* bb) {
  _dest->removeDef(bb, destDef); PNode::removeUses(bb); 
}
inline void LoadOffsetNode::removeUses(BB* bb) {
  base->removeUse(bb, baseUse); LoadNode::removeUses(bb); 
}
inline void LoadStackNode::removeUses(BB* bb) {
  frame->removeUse(bb, frameUse); LoadNode::removeUses(bb); 
}

inline void StoreNode::removeUses(BB* bb) {
  _src->removeUse(bb, srcUse); PNode::removeUses(bb); 
}
inline void StoreOffsetNode::removeUses(BB* bb) {
  base->removeUse(bb, baseUse); StoreNode::removeUses(bb); 
}
inline void StoreStackNode::removeUses(BB* bb) {
  frame->removeUse(bb, frameUse); StoreNode::removeUses(bb); 
}

inline void AssignNode::removeUses(BB* bb) {
  _dest->removeDef(bb, destDef); StoreNode::removeUses(bb); 
}

inline void MethodReturnNode::removeUses(BB* bb) {
  _src->removeUse(bb, srcUse); _dest->removeDef(bb, destDef);
  _dest->removeUse(bb, resultUse);
  ReturnNode::removeUses(bb); 
}
inline void NonLocalReturnNode::removeUses(BB* bb) {
  ReturnNode::removeUses(bb); 
}

inline void ArithNode::removeUses(BB* bb) {
  _src->removeUse(bb, srcUse); _dest->removeDef(bb, destDef);
  PNode::removeUses(bb);
}
inline void ArithRRNode::removeUses(BB* bb) { 
  oper->removeUse(bb, operUse); ArithNode::removeUses(bb); 
}

inline void TArithRRNode::removeUses(BB* bb) { 
  oper->removeUse(bb, operUse);
  _src->removeUse(bb, srcUse); _dest->removeDef(bb, destDef);
  PNode::removeUses(bb);
}

inline void TypeTestNode::removeUses(BB* bb) {
  _src->removeUse(bb, srcUse); AbstractBranchNode::removeUses(bb); 
}

inline void IndexedBranchNode::removeUses(BB* bb) {
  _src->removeUse(bb, srcUse); AbstractBranchNode::removeUses(bb); 
}

inline void TBranchNode::removeUses(BB* bb) {
  _src->removeUse(bb, srcUse); arg->removeUse(bb, argUse);
  BranchNode::removeUses(bb); 
}

inline void BlockCloneNode::removeUses(BB* bb) {
  PrimNode::removeUses(bb);
  if (isMemoized()) deadBlockPR->removeUse(bb, deadBlockUse); 
}
inline void BlockCreateNode::removeUses(BB* bb) {
  BlockCloneNode::removeUses(bb);
  if (isMemoized()) _dest->removeUse(bb, srcUse); 
}
inline void BlockZapNode::removeUses(BB* bb) {
  _dest->removeDef(bb, destDef); PNode::removeUses(bb); 
}


inline void AbstractArrayAtNode::removeUses(BB* bb) {
  _src->removeUse(bb, srcUse); _dest->removeDef(bb, destDef);
  arg->removeUse(bb, argUse); 
  if (error) error->removeDef(bb, errorDef);
  AbstractBranchNode::removeUses(bb);
}
inline void FlushNode::removeUses(BB* bb) {
  _src->removeUse(bb, srcUse);
  if (!readOnly) _dest->removeDef(bb, destDef);
  PNode::removeUses(bb);
  _bb = bb;         // restore bb (PNode::removeUses trashes it)
}

// markAllocated: for all PRegs used/defined by the node, increment the
// corresponding counters if the PReg is already allocated

# define U_CHECK(r) if ( isRegister(r->loc)) use_count[r->loc]++
  
# define D_CHECK(r) if ( isRegister(r->loc)) def_count[r->loc]++

  
inline void LoadNode::markAllocated(fint* use_count, fint* def_count) {
  Unused(use_count);
  D_CHECK(_dest);
}
inline void LoadOffsetNode::markAllocated(fint* use_count, fint* def_count) {
  U_CHECK(base); LoadNode::markAllocated(use_count, def_count);
}
inline void LoadStackNode::markAllocated(fint* use_count, fint* def_count) {
  U_CHECK(frame); LoadNode::markAllocated(use_count, def_count);
}

inline void StoreNode::markAllocated(fint* use_count, fint* def_count) {
  Unused(def_count);
  U_CHECK(_src);
}
inline void StoreOffsetNode::markAllocated(fint* use_count, fint* def_count) {
  U_CHECK(base); StoreNode::markAllocated(use_count, def_count);
}
inline void StoreStackNode::markAllocated(fint* use_count, fint* def_count) {
  U_CHECK(frame); StoreNode::markAllocated(use_count, def_count);
}
inline void AssignNode::markAllocated(fint* use_count, fint* def_count) {
  U_CHECK(_src); D_CHECK(_dest);
}

inline void MethodReturnNode::markAllocated(fint* use_count, fint* def_count) {
  U_CHECK(_src); D_CHECK(_dest);
  ReturnNode::markAllocated(use_count, def_count);
}
inline void ArithNode::markAllocated(fint* use_count, fint* def_count) {
  U_CHECK(_src); D_CHECK(_dest); 
}
inline void ArithRRNode::markAllocated(fint* use_count, fint* def_count) {
  U_CHECK(oper); ArithNode::markAllocated(use_count, def_count);
}
inline void CallNode::markAllocated(fint* use_count, fint* def_count) {
  Unused(use_count);
  D_CHECK(_dest);
}
inline void BlockCreateNode::markAllocated(fint* use_count, fint* def_count) {
  BlockCloneNode::markAllocated(use_count, def_count);
  if (isMemoized()) D_CHECK(_dest);
}
inline void BlockZapNode::markAllocated(fint* use_count, fint* def_count) {
  Unused(use_count);
  D_CHECK(_dest);
}

inline void TBranchNode::markAllocated(fint* use_count, fint* def_count) {
  Unused(def_count);
  U_CHECK(_src); 
  U_CHECK(arg);
}
inline void TypeTestNode::markAllocated(fint* use_count, fint* def_count) {
  Unused(def_count);
  U_CHECK(_src);
}
inline void IndexedBranchNode::markAllocated(fint* use_count, fint* def_count) {
  Unused(def_count);
  U_CHECK(_src);
}
inline void AbstractArrayAtPutNode::markAllocated(fint* use_count,
                                                  fint* def_count) {
  if (elem) U_CHECK(elem);
  AbstractArrayAtNode::markAllocated(use_count, def_count);
}
inline void FlushNode::markAllocated(fint* use_count, fint* def_count) {
  U_CHECK(_src); if (!readOnly) D_CHECK(_dest);
}

// eliminateNode: the receiver has just been removed because its
// result was not used.  Propagate this to all nodes whose use count
// has now become zero, too.  The register passed in is the one
// causing the elimination (passed in to catch recursive elimination
// of the same register).
// It is an error to call eliminateNode() if removing is false and
// hasSideEffects() is true.
// If removing is false, the node may eliminated because of copy propagation; in
// this case it's ok to eliminateNode defs of uplevelW pregs because the
// def has been moved to another node (i.e. wasn't really eliminated).
// The other reason to be called if removing is false is because the
// result is never used (elininateUnneededResults).
// But then, since that flow passes through eliminatePR, which
// calls canReconstructDebuggingInfo, we won't get here if uplevelW is true.
// If removing is true, we're removing dead code (e.g. a branch of a type
// case that will never be executed)

// if called as a consequence of eliminatePR, r will be the pr that is being eliminated
// if called as a consequence of removing unreachable nodes, removing will be true


inline void PNode::eliminateNode(BB* bb, PReg* r, bool removing, void* misc) {
  Unused(r);
  Unused(misc);
  assert(!deleted, "eliminateNodeAndUsedPRs should have caught this");
  if (PrintSICEliminateUnneededNodes) {
    char buf[1024];
    lprintf("*%s node N%ld: %s\n", removing ? "removing" : "eliminating",
            (void*)id(), print_string(buf));
  }
  assert( !hasSideEffects() || removing, 
          "shouldn't eliminate this node unless it can never be executed");
          
  assert( nSuccessors() <= 1,  
          "This code only handles one successor, "
          "others should have been removed by now");
          
  bb->remove(this);
}


inline void AbstractBranchNode::eliminateNode(BB* bb, PReg* r, bool removing,
                                              void* misc) {
  // need this method to allow =0 in class to force subclasses to override me
  BranchNodeClass::eliminateNode(bb, r, removing, misc);
}


inline void TArithRRNode::eliminateNode(BB* bb, PReg* r, bool removing,
                                        void* misc) {
  // Only get here if removing (in which case removeUpToMerge has already
  // pruned successors),
  // or if I have no side effects and my result is unused.
  // (in which case I must have only one successor, since
  //  a potential failure would be a side effect).
  //  Need no assertions here, cause base class methods have them
  //  -- dmu 8/96
  AbstractBranchNode::eliminateNode(bb, r, removing, misc);
}


inline void CallNode::eliminateNode(BB* bb, PReg* r, bool removing,
                                    void* misc) {
  // See comment in TArithRRNode above.
  // Now, CallNodes always have side effects, but its subclasses
  // (e.g. a PrimNode for a prim that cannot fail) may not have side effects.
  //  -- dmu 8/96
  AbstractBranchNode::eliminateNode(bb, r, removing, misc);
}


inline void BranchNode::eliminateNode(BB* bb, PReg* r, bool removing,
                                      void* misc) {
  assert(removing,
    "Branch nodes do not get eliminated for copy-propagation or for "
    "unused result elimination because they have no results.");
  AbstractBranchNode::eliminateNode(bb, r, removing, misc);
}


# endif // SIC_COMPILER
