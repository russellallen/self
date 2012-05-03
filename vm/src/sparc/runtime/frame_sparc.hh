/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// This file is INCLUDED into the middle of the frame class.



# pragma interface

// sparc frame layout:

/*
                                 prev frame
  %fp-> ----------------------------------------------
    %fp - offset: space for automatic arrays, aggregates, and addressable
                  scalar automatics.
                  (Self compiled frames alloc extras here for
                  frame chains and currentPCs)
                  -------------------------------
                  space dynamically allocated via alloca(), if any
    alloca()-> ----------------------------
                  space if needed for compiler temps and saved floating
    %sp + offset  -point registers
               ----------------------------
    %sp + offset  outgoing params past the sixth, if any
               -----------------------------
    %sp + offset  6 words into which callee may store reg args
               -----------------------------
    %sp + offset  one-word hidden param (addr where callee should store
                    aggregate return value)
               -----------------------------
    %sp + offset  16 words in which to save register window (in and locals)
  %sp-> ------------------------------------------------
                              next frame
*/



friend class sparc_fp;
friend class sparc_sp;

protected:

// accessing the pieces of this frame:

sparc_sp* callees_sp() { return (sparc_sp*) this; }
sparc_sp* my_sp()      { return callees_sp()->link()->as_callers_sp(); }
sparc_fp* my_fp()      { return my_sp()->link(); }


protected:

frame* frameFromSP(sparc_sp* sp);
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  sendDesc* slow_send_desc(int32* callp);
# endif
