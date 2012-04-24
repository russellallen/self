/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef FAST_COMPILER

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// The FCompiler structure holds global state associated with the current
// NIC compilation. (NIC stands for "non-inlining compiler"; for historical
// reasons, the NIC's classes & files start with f for "fast".)

extern FCompiler* theCompiler;

class FCompiler:  public AbstractCompiler {
 public:
  int32 countID;
  bool generateDebugCode;               // gen code for single-stepping?
  bool needRegWindowFlushes;            // compile reg-window flushing blocks
  bool containsLoop;                    // method contains _Restart
  CodeGen* codeGen;
  
  int32 stackLocCount;
  int32 extraArgCount;
  int32 stackTempCount() { return stackLocCount + extraArgCount; }
  int32 frameSize();
  int32 verifiedOffset();
  int32 diCheckOffset();
  int32 frameCreationOffset();
  ScopeDescRecorder* scopeDescRecorder();
  Assembler* instructions();

  bool isImpure;                        // code has some inlining

  FCompiler(compilingLookup* k, sendDesc* sd, nmln* d);

  ~FCompiler() { finalize(); }

 protected:
  void initialize();

  void   constantCode();
  void       dataCode();
  void assignmentCode();
  void     methodCode();

  void trace_compile(const char *s);

 public:
  nmethod* compile();
  void finalize();
  fint name()       { return NIC; }
  nm_compiler nmName() { return nm_nic; }
  fint  incoming_arg_count();


  void print();
  void print_short();

# include "_fcompiler_pd.hh.incl"

};


# endif // FAST_COMPILER
