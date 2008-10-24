/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// AbstractCompiler is the abstract base class for all Self compilers

class AbstractCompiler : public ResourceObj {
 public:

  compilingLookup* L;           // the lookup that found me
  nmln* diLink;                 // for DI methods ( or NULL)
 
   // We choose to not support compilation of block methods whose
  //  homes are interpeted. This is so that the compiler will not have to know
  //  how to compile code to access locals that are interpreted. -- dmu
  compiled_vframe* parentVFrame;  // vframe of parent (for block methods)
  sendDesc* send_desc;          // sending inline cache
  
  bool debugging;
  
  virtual int32 verifiedOffset() = 0;
  virtual int32 diCheckOffset() = 0;
  virtual int32 frameCreationOffset() = 0;
  virtual int32 frameSize() = 0;
  virtual ScopeDescRecorder* scopeDescRecorder() = 0;
  virtual Assembler* instructions() = 0;

  // lookup and doIt entry point
  AbstractCompiler(compilingLookup* k, sendDesc* sd, nmln* d);

  virtual ~AbstractCompiler(){}

  virtual nmethod* compile() = 0;
  virtual void finalize();
  virtual fint level();         // optimization level of new nmethod
  virtual fint version();       // version ("nth recompilation") of new nmethod
  virtual fint name() = 0;      // NIC, SIC etc.
  virtual nm_compiler nmName() = 0;

 protected:
  void initBugHunt();
  void dispatchToCode();

  virtual void   constantCode() = 0;
  virtual void       dataCode() = 0;
  virtual void assignmentCode() = 0;
  virtual void     methodCode() = 0;

 public:
  // the method found by the lookup
  oop method();
  
  // holder of top-level method; (map means it's the receiver)
  oop methodHolder_or_map();
  
  virtual fint  incoming_arg_count() = 0;

  
# include "_aCompiler_pd.hh.incl"

};

// Points to the active compiler during compilation.
// Set and reset by doCompile in nmethod.c (used by profiler)
extern AbstractCompiler* activeCompiler;

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
