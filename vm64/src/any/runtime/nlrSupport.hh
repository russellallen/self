/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



class NLRSupport /* AllStatic */ {
 private:
  // When the compiled code for an NLR
  static bool _have_NLR_through_C;            // set before Self returns to C
  
 public:
  static bool       have_NLR_through_C() { return _have_NLR_through_C; }
  static void reset_have_NLR_through_C() { _have_NLR_through_C = false; }
  static void   set_have_NLR_through_C() { _have_NLR_through_C = true;  }

  // accessors for NLR vars above:
  static oop    NLR_result_from_C();
  static smi    NLR_home_from_C();
  static int32  NLR_home_ID_from_C();

  static void   set_NLR_result_from_C(oop x);
  static void   set_NLR_home_from_C(smi x);
  static void   set_NLR_home_ID_from_C(int32 x);


  // for non-local returns coming from C
  static void volatile continue_NLR_into_Self(bool removePatches);
                                                   // to continue the NLR after C cleanup

  static void save_NLR_results(oop res, smi targetFrame = 0, int32 targetID = 0);

  static bool is_bad_home_reference(char* addr);
  
  static void volatile unwind_stack_to_kill_process(oop res);
  
  // Handling nonlifo block NLRs from compiled code  
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  static void non_lifo_abort_from_continuePC();
  static void non_lifo_abort(pc_t contPC);
 private:
  static void fix_current_return_address(char* addr);
# endif

 public:

  
 private:
  static volatile void continue_NLR_into_interpreted_Self();
  static volatile void continue_NLR_from_compiled_nonLIFO_block(frame* vmf);
  static volatile void continue_NLR_into_compiled_Self(bool remove_patches, frame* vmf);
};
