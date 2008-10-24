/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


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



class sparc_fp;
class sparc_sp;
class frame;

class sparc_fp {
  friend class frame;
  friend class FrameIterator;
  friend class sparc_sp;

  sparc_fp()            { ShouldNotCallThis(); }
  sparc_fp(sparc_fp &s) { ShouldNotCallThis(); }
  
  // coercions
  
  oop*      as_oops()       { return (oop*)     this; }
  sparc_sp* as_callers_sp() { return (sparc_sp*)this; }

  // nmethod frame chain operations:
  //  this is a word allocated by the Self compiler to allow
  //   frames that use an nmethod to be linked
  
  frame** nmethod_frame_chain_addr() {
    return &((frame**) this)[nmethod_frame_chain_offset]; }
  
  objVectorOop* patched_frame_saved_outgoing_args_addr() {
    return &((objVectorOop*) this)[patched_frame_saved_outgoing_args_offset]; }

  char**     currentPC_addr() {
    return &((char**    ) this)[current_pc_offset]; }

};


class Conversion;
class Recompilation;

class sparc_sp {
  friend class sparc_fp;
  friend class frame;
  friend class FrameIterator;
  friend class Conversion; // this is sparc-specific for now
  friend class Recompilation; // this is sparc-specific for now
  
  sparc_sp()            { ShouldNotCallThis(); }
  sparc_sp(sparc_sp &s) { ShouldNotCallThis(); }

  // coercions

  sparc_fp* as_callees_fp() { return (sparc_fp*)this; }
  frame*    as_callers_frame() { return (frame*)this; }
  oop*      as_oops() { return (oop*)this; }

  // what is stored here:

  // link is a low-level machine-dependent concept about how
  //  frames are stiched together (senders are high-level)
  
  // could use location_addr but this is faster:

  sparc_fp**       link_addr() { return &((sparc_fp**) this)[frame_offset]; }
  sparc_fp*        link() { return *link_addr(); }
  void         set_link(sparc_fp* x) { *link_addr() = x; }
  void      adjust_link(int32 delta) { *(char**)link_addr() += delta; }

  // return address, no patch/real distinction here

  char**        return_addr_addr() { return &((char**) this)[pc_offset]; }
  char*         return_addr() { return *return_addr_addr(); }
  void      set_return_addr(char* x) { *return_addr_addr() = x; }
  

  void** location_addr(Location r);

 public:
  sparc_sp* push_new_sp( char* pc,
                         fint size_in_oops = 0,
                         bool zapAlways = false);

};
