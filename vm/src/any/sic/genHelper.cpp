/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "genHelper.hh"

# include "_genHelper.cpp.incl"


# if defined(SIC_COMPILER)


  SICGenHelper* genHelper;

  SICGenHelper::SICGenHelper() { a = theAssembler; }

  void SICGenHelper::moveRegToLoc(Location srcReg, Location dest) {
    assert(isRegister(srcReg), "not a register");
    if (isRegister(dest))
      moveRegToReg(srcReg, dest);
    else
      store(srcReg, spOffset(dest), SP);
  }
  
  void SICGenHelper::moveLocToReg(Location src, Location destReg) {
    assert(isRegister(destReg), "not a register");
    if (isRegister(src))
      moveRegToReg(src, destReg);
    else
      load(SP, spOffset(src), destReg);
  }

  Location SICGenHelper::moveToReg(PReg* r, Location tempReg) {
    assert(isRegister(tempReg), "not a register");
    Location l = r->loc;
    if (isRegister(l)) {
      return l;
    } else if (l == UnAllocated) {
      assert(r->isConstPReg(), "only consts can be unallocated");
      return loadImmediateOop((ConstPReg*)r, tempReg, false);
    } else {
      load(SP, spOffset(l), tempReg);
      return tempReg;
    }
  }
  
  Location SICGenHelper::loadPath(Location dest,
                                  lookupTarget* target,
                                  Location receiver) {
    // *if root of path...
    //   *if holder is receiver...
    //     <move receiver, dest/t>
    //   *else...
    //     <loadImmediateOop obj, dest/t>
    //   *end
    // *else...
    //   <lookup dest/t, previousPath, receiver>
    // *end
      
    Location t = isRegister(dest) ? dest : Temp1;
    if (target->is_receiver()) {
      if (isRegister(receiver)) {
        t = receiver;
      } else {
        // Before the Intel port, the following was store(t, spOffset(receiver), SP);
        // I think it was wrong. -- dmu 5/06
        load(SP, spOffset(receiver), t);
      }
    } else {
      assert(target->is_object(), "must be an object path search");
      objectLookupTarget* otarget = (objectLookupTarget*) target;
      if (otarget->prevTargetSlot) {
        lookup(Temp1, otarget->prevTargetSlot, receiver);
        t = Temp1;
      } else {
        loadImmediateOop(otarget->obj, t);    // load oop
      }
    }
    return t;
  }


  void SICGenHelper::lookup(Location dest,
                            realSlotRef* path,
                            Location receiver) {
    // <loadPath dest, path, receiver>
    // load receiver/dest/t, offset - Mem_Tag, dest/t
    // <move t, dest>
      
    Location t = isRegister(dest) ? dest : Temp1;
    if (path->holder->is_object_or_map()) {
      Location t1 = loadPath(t, path->holder, receiver);
      load(t1, smiOop(path->desc->data)->byte_count() - Mem_Tag, t);
      // load data slot
    } else {
      fatal("don't support vframe lookups");
    }
    if (!isRegister(dest)) {
      store(t, spOffset(dest), SP);
    }
  }
    

# endif // SIC_COMPILER
