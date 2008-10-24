# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



/*

Copy PPC layout

stack overview:

stack grows down: \/

                 _________
parameter area            | - caller allocs, and sets, rcvr pushed on last, end is quadword aligned
saved PC         _________| - caller allocs and saves its own PC here
saved ebp                 | - callee saves old ebp here
local variables           | - callee allocs and puts locals here
stack locations           |
padding                   |
parameter area            | - callee allocs and uses for extra outgoing parms
linkage area     _________| - callee allocs half

*/

const fint    frame_word_alignment = 4;
const fint frame_alignment_offset = 2; // rcvr is what is aligned -- push pc, bp, and THAT is frame*

// stack offsets from base pointer after frame creation
const fint                        first_iarg_offset  =  3;
const fint                             ircvr_offset  =  2;
const fint                          saved_pc_offset  =  1;  // store link reg here before frame creation
const fint                          saved_bp_offset  =  0;  // store bp here after frame creation
const fint                        current_pc_offset  = -1;  // extra word for pc when frame is patched
const fint               nmethod_frame_chain_offset  = -2;
const fint  patched_frame_saved_outgoing_args_offset = -3; // when patching return use this word to save ptr to vector of outgoing args
const fint                        last_extra_offset  = patched_frame_saved_outgoing_args_offset;
const fint                       first_local_offset  = last_extra_offset - 1;

const fint   num_extra_locals_for_runtime = - last_extra_offset;

// stack offsets for outgoing args wrt sp:

const fint                    rcvr_offset = 0;
const fint               first_arg_offset = 1;

// The extra stuff that's pushed on the stack from a call and a frame creation:
const fint              linkage_area_size = ircvr_offset - rcvr_offset;

// stack offsets for incoming args BEFORE frame creation:

const fint     first_leaf_arg_offset = 2;
const fint          leaf_rcvr_offset = 1;
const fint            leaf_pc_offset = 0;

// ebp offsets for saved arg part of stack (parent's frame)
inline int32 rcvr_and_argument_offset(fint i /* 0 = rcvr */) {
  return ircvr_offset + i;
}


// esp offsets for stack locations i is index counting from first local = 0
inline int32 local_and_stack_location_offset(fint i) {
  return first_local_offset - i;
}



# if defined(SIC_COMPILER)
  inline int32 stackTempCountToFrameSize(int32 size) {
    // input: stackLocCount + extraArgCount
    // output: after frame creation, from sp to bp
    int32 r = num_extra_locals_for_runtime + size + linkage_area_size;
    return roundTo(r, frame_word_alignment);
  }

  inline int32 frameSizeToStackTempCount(int32 size) {
    fatal("unused for Intel");
    // wrong because of padding: return size - linkage_area_size - num_extra_locals_for_runtime;
    return 0;
  }
# endif


void reg_disp_type_of_loc(Location* basep, int32* offsetp,  OperandType *t,  Location loc);


const fint PerformSelectorLoc_sp_offset  =  5 * oopSize;
const fint PerformDelegateeLoc_sp_offset =  6 * oopSize;

# endif // __i386__
