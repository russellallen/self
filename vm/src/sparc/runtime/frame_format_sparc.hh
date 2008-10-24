/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma interface


const fint frame_word_alignment = 2; // sp must be even-word aligned
const fint frame_alignment_offset = 0; // sp IS FRAME


// For these constants, "top" means "farther from the top of stack (TOS)",
// and "bottom" means "closer to TOS".  That is, if the stack grows
// downwards in memory (as in Unix), "top" pointer > "bottom" ptr.


// stack offsets from stack pointer
const fint    last_register_offset    = 0;

const fint    first_register_offset   = last_register_offset - 1 +
  NumInRegisters + NumLocalRegisters;

// the following lines are *very* dependent on the StackFromRegister array
// They are positions within the saved registers:

const fint    pc_offset               = first_register_offset - 0;
const fint    frame_offset            = first_register_offset - 1;

const fint    lookup_receiver_offset  = first_register_offset - 7;
const fint    parent_offset           = lookup_receiver_offset;  

// offset for outgoing parameters past the sixth:

const fint    extra_arg_offset        = last_register_offset + WindowSize; 
const fint    arg_bottom_offset       = extra_arg_offset;
const fint    top_oop_offset          = arg_bottom_offset;


// stack offsets from frame pointer: these are locals that the Self
//  compiler allocates in every one of its frames

const fint    nmethod_frame_chain_offset      = 0 - 1;
// warning this is duplicated in asmDefs_gcc_sparc.hh
const fint    current_pc_offset       = nmethod_frame_chain_offset - 1;
const fint    patched_frame_saved_outgoing_args_offset = current_pc_offset - 1;
const fint    last_runtime_info_offset = patched_frame_saved_outgoing_args_offset;

// The sparc requires that the total frame size be even.
// Our compilers ensure this by assuming that they just need
// to keep the number of locals they add to a frame even.
// Now the min size of a frame is 16 saved regs, 6 locations
// for C to save register args in, 1 for the C struct result address.
// That's odd! Depending on how many runtime locals (e.g. nmethod_frame_chain
// and current_pc), we might need one more dummy word to keep the whole
// minimum shebang even! That's what first_odd_offset_at_or_after_last_runtime_info_offset
// is for. 

const fint    first_odd_offset_at_or_after_last_runtime_info_offset = 
                  last_runtime_info_offset 
                - (frame_word_alignment-1 - (-last_runtime_info_offset & (frame_word_alignment-1)));

const fint  local_slots_offset = first_odd_offset_at_or_after_last_runtime_info_offset - 1;

const fint  bottom_oop_offset = local_slots_offset;


// limits of frame on stack; a frame contains the words in the interval
// [locals[top_word_offset]..sender->locals[top_word_offset-1]]
const fint    top_word_offset         = last_register_offset;
// true if stored in my sp area, false if stored in piece below
bool isInFrame(Location l);

// The argument is the stack temp count, which consists of the #
// of stack locations needed for temp storage and the # of extra args.
// Add that number to the WindowSize (8 in's/8 out's/1 hidden/6 C-arg reg's).
// Then add 3 (1 for nmethod frame chain + 1 for current PC + 1 for dummy
// for even length for min frame) and you get the frame size.
// (local_slots_offset = -4.  So (-local_slots_offset - 1) = 3)).
// -abdelmalek 9/02
inline int32 stackTempCountToFrameSize(int32 size) {
  return size + WindowSize - local_slots_offset - 1;
}

inline int32 frameSizeToStackTempCount(int32 size) {
  return size - WindowSize + local_slots_offset + 1;
}
int32 spOffset(Location reg, fint totalFrameSize);   // return offset off of sp

# if  GENERATE_DEBUGGING_AIDS
int32 fpOffset_abstract(Location reg, fint frameSize); // return offset off of fp (multiplat)
int32 fpOffset(Location reg, fint frameSize);          // return offset off of fp
#endif

