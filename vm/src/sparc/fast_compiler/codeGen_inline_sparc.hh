/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# if !GENERATE_DEBUGGING_AIDS
# pragma interface
# endif


# if defined(FAST_COMPILER)

  inline void CodeGen::jumpTo(void* target, Location reg, Location link) {
    a.SetHiP(target, reg);
    a.JmpLP(reg, target, link);
  }

  inline void CodeGen::move(Location dest, Location src, bool delay) {
    // *if dest and src are registers...
    //    or g0, src, dest
    // *else...
    //   *if src is a stack/excess arg/incoming excess arg temp...
    //      load FP, offset, t/dest
    //   *end
    //   *if dest is a stack temp etc...
    //      store FP, offset, t/src
    //   *end
    // *end
    
    if (src == dest) {
      if (delay) a.Nop();
    } else if (isRegister(dest) && isRegister(src)) {
      a.OrR(G0, src, dest);
    } else {
      moveComplicated(dest, src, delay);
    }
  }

  inline Location CodeGen::moveToReg(Location what, Location reg) {
    Location t;
    if (isRegister(what)) {
      t = what;
    } else {
      t = reg;
      move(t, what);
    }
    return t;
  }
  
  inline void CodeGen::flushRegisterWindows() {
    // ta g0, ST_FLUSH_WINDOWS
    a.TrapI(G0, ST_FLUSH_WINDOWS);    // flush register windows
  }

# endif // FAST_COMPILER
