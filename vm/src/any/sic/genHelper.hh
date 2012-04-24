/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// helper functions for SIC code generation

# if defined(SIC_COMPILER)

  class SICGenHelper : public ResourceObj {
   public:
    Assembler* a;

    SICGenHelper();

    fint spOffset(Location l);              // for current code we're compiling
    fint spOffset(Location l, nmethod* nm); // for another method/block

    void   smiOop_prologue(char* miss);
    void floatOop_prologue(char* miss);
    void   memOop_prologue(mapOop receiverMapOop, char* miss);

#   ifdef UNUSED
    void checkRecompilation(fint countID);
#   endif

    void jumpTo(void* target, Location reg, Location link);

    void checkOop(Label& general, oop what, Location reg);

    void genCountCode(int32* counter);

    Location loadImmediateOop(ConstPReg* p, Location dest, bool mustMove);
    void     loadImmediateOop(       oop p, Location dest, bool isInt = false);

    void load( Location src, fint srcOffset, Location dest); // reg[dest] = *(reg[src] + srcOffset)
    void store(Location src, fint dstOffset, Location dest); // *(reg[dest] + dstOffset) = reg[src]

    void moveRegToReg(Location srcReg, Location destReg);
    void moveRegToLoc(Location srcReg, Location dest);
    void moveLocToReg(Location src, Location destReg);

    Location moveToReg(PReg* r, Location tempReg);

    void setToZeroA(void* addr, Location tempReg); // addr must be a VMAddressOperand
    void setToZero(Location dest);


    fint verifyParents(objectLookupTarget* target,
                       Location t, fint count);

    Location loadPath(Location dest,
                      lookupTarget* target,
                      Location receiver);

    void lookup(Location dest,
                realSlotRef* path,
                Location receiver);

# include "_genHelper_pd.hh.incl"
  };

  extern SICGenHelper* genHelper;

# endif // SIC_COMPILER
