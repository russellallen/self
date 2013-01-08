/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif




// Conversions handle the conversion of invalidated stack frames / nmethods
// to new (unoptimized) frames/methods.  

class OopOopTable;

class Conversion: public ResourceObj {
private:
  oop   result;                 // result returned by last msg send
  char* sp;                     // current SP of stack to be converted
  bool  nlr;                    // true --> was NLR, not normal return
  frame* nlrHome;               // contents of NLRHomeReg
  int32 nlrHomeID;              // contents of NLRHomeIDReg
  Stack* stk;                   // our stack
  frame* convertFrame;          // frame to be converted
  RegisterLocator* convertFrame_rl;  // saved reg addrs for frame to be converted
  frame* convertLocals;         // saved copy of convertFrame's locals
  frame* oldBlockHome;          // saved copy of convertFrame's block home
  frame* lastFrame;             // fake Self frame (see fixConversionStack)
  sendDesc* sd;                 // call site for current msg send
  bool isInterpreting;          // "converting" an interpreted frame

  OopOopTable* blockValues;     // to convert block maps
  int32 vdepth;                 // # of vframes in convertFrame
  
  frame* newFr;                 // current new frame
  frame* rlFr;                  // frame below current new frame
  RegisterLocator* newFrRl;     // register locator for new frame
  
  ResourceMark* rm;             // because rm can't be on the stack
  
  

public:
  Conversion(oop r, char* s, bool n, frame* h, int32 id,
             ResourceMark* mark,
             bool isInterp) {
    result = r; sp = s; nlr = n; nlrHome = h; nlrHomeID = id; sd = NULL;
    rm = mark;
    isInterpreting = isInterp; }

  void doit();                  // do the conversion
  void convert();
  
  void returnToSelf(oop result, char* sp, bool nlr, frame* nlrHome,
                    int32 nlrHomeID, sendDesc* sd,  bool isInterpreting);
                    
 private: // returnToSelf helpers:
  void return_to_interpreted_self(frame* dest_self_fr, bool restartSend,
                                   char* self_sparc_fp_or_ppc_sp, oop res, frame* nlrHome_arg, int32 nlrHomeID_arg);
  void return_to_compiled_self(  oop res, bool restartSend, bool nlr_arg,
                                  bool wasUncommon, int32* uncommonPC,
                                  frame* dest_self_fr, sendDesc* self_sd,
                                  char* self_sparc_fp_or_ppc_sp);
 public:
  void nlr_to_compiled_self( oop res, bool restartSend, frame* nlrHome_arg, int32 nlrID_arg,
                             sendDesc* self_sd, char* self_sparc_fp_or_ppc_sp);

    
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

  public:
    nmethod* convertNM;         // nmethod to be converted
    compiled_vframe** vf;               // old vframes
    compiled_vframe** newVF;    // new (converted) vframes
    nmethod** nms;              // new nmethods
    
    RegisterLocator* nonvols_for_caller;  // contains copies of nonvol register values needed by caller

  private:
    void init();
    void build_vfs_to_convert();
    void create_previously_optimized_blocks();
    void retarget_vfs_to_convert(frame* copiedFrame, RegisterLocator* rl);
    void copy_caller();
    void convertVFrames();
    void finish();
    void ensure_death_of_conversion_nmethods();
    void patch_caller();
  
    void setup_compiled_restart( char*& continuationPC,
                                 oop&   res,
                                 bool nlr_arg,
                                 sendDesc* sd_arg,
                                 bool wasUncommon,
                                 int32* uncommonPC);

    void setup_compiled_restart_for_uncommon_prim(
                                char*& continuationPC,
                                oop&   res,
                                bool nlr_arg,
                                sendDesc* sd_arg,
                                int32* uncommonPC );

    nmethod* newCodeForVframe(fint i);
    bool createFrame(fint i, nmethod *newNM);
    void copyVFrame(fint i, nmethod *newNM, bool wasInInterruptCheck);
    char* copyArgsAndGetContinuationPC(sendDesc *sd_arg);
    
    void fix_new_vfs();
    void fixConversionStack_for_vframe_conversion();
    frame* fixConversionStack_for_returning_to_self( char* self_sparc_fp_or_ppc_sp, sendDesc* self_sd );
    void continue_after_return_trap_with_result( oop res, char* continuationPC, char* self_sparc_fp_or_ppc_sp );
    oop  get_result();
# endif

  void fixConversionStack(char* pc, char* sp);
# include "_conversion_pd.hh.incl"
};

