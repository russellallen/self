/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


extern nmethod* recompilee;             // method being recompiled

# if defined(SIC_COMPILER)

// recompiler <--> SIC data exchange
class AbstractRecompilation : public ResourceObj {
 public:
  VScopeBList* recompileeVScopes;       // recompilee's vscope and all callees
  MarkerNodeBList* markers;             // position markers (set by SIC)
  MarkerNode* activeMarker;             // marker to be used (if any)
  bool isReplacementSimple;             // is replacing recompilee simple?
  AbstractRecompilation() {
    recompileeVScopes = 0; markers = 0; activeMarker = 0;
    isReplacementSimple = true;
  }
};

extern AbstractRecompilation* theRecompilation;

extern bool RecompilationInProgress;

extern fint nstages;            // # of recompilation stages
extern fint* compilers;         // compilers indexed by stage
const fint MaxRecompilationLevels = 16; // max. # recompilation levels, max nmethod level is one less
const fint MaxVersions = 4 - 1; // desired max. # nmethod recompilations

extern "C" {
  // entry point for run-time system (counter overflow & uncommon traps)
  char* Recompile(sendDesc* ic, frame* lookupFrame, oop receiver,
                    char* diChild, char* caller);

  // called when young nmethod has reached maturity
  char* MakeOld(sendDesc* ic, frame* lookupFrame, oop receiver,
                  char* diChild, char* caller);
}
// entry point for lookup system
// (also_ prefix because of g++ 2.3.3 bug - "conflicting language contexts"
nmethod* also_Recompile( sendDesc* send_desc,
                         compilingLookup* L,
                         nmethod* recompilee );

void countCompilation();            // bump counter in compileCounts
bool needRecompileCode(fint level); // insert code to check for recompilation?
fint recompileLimit(fint level);    // # invocations before recompile
fint recompileLevel();              // current recompilation level
fint currentCompiler();             // compiler that should be used
bool allowedToRecompile();          // are we currently allowed to recompile?

oop get_compilers_prim(oop);
oop get_compile_counts_prim(oop);
oop get_recompile_limits_prim(oop);
oop set_recompilation_prim(oop, objVectorOop compilers, objVectorOop limits,
                           void* FH);
oop recompile_prim(oop);

# else

# define theRecompilation 0
# define RecompilationInProgress false

oop get_compilers_prim(oop);
oop get_compile_counts_prim(oop);
oop get_recompile_limits_prim(oop);

inline oop set_recompilation_prim(oop, objVectorOop, objVectorOop, void*) {
  return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR); }
inline oop recompile_prim(oop) {
  return ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR); }


nmethod* also_Recompile( sendDesc*         send_desc,
                         compilingLookup*  L,
                         nmethod*          reCompilee);
                         
inline void countCompilation() {}
inline fint recompileLimit(fint ) { return 2; }
inline fint recompileLevel() { return 0; }

const fint MaxRecompilationLevels = 1;     // max. # recompilation levels
const fint MaxVersions = 1; // desired max. # nmethod recompilations

inline bool needRecompileCode(fint ) { return false; }



# endif // defined(SIC_COMPILER)
