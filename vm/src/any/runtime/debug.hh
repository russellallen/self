/* Sun-$Revision: 30.22 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



// hint: if you change this file, do a "touch *.o; rm {oop,prim,debug}.o"
// to avoid total recompilation; if you have changed other files as well
// and can't remember which ones, also do a "make remove" *before* saving
// debug.h      -Urs 2/93

// use this to temporarily change some debug flag

class FlagSetting {
  bool val;
  bool* flag;
 public:
  FlagSetting(bool& fl, bool newValue) {
    flag = &fl; val = fl; fl = newValue; }
  ~FlagSetting() { *flag = val; }
};

// this for an int
class FlagSettingInt {
  int val;
  int* flag;
 public:
  FlagSettingInt(int& fl, int newValue) {
    flag = &fl; val = fl; fl = newValue; }
  ~FlagSettingInt() { *flag = val; }
};


// template(flagName, flagType, flagTypeName, primReturnType, initialValue,
//          getCurrentValue, checkNewValue, setNewValue, explanation,
//          wizardOnly)

// this next one too big for MW: have to change by hand when you change it

# define FOR_ALL_BOOLEAN_DEBUG_PRIMS(template)                                \
     FOR_ALL_GEN_BOOLEAN_DEBUG_PRIMS(template)                                \
     FOR_ALL_SPARC_BOOLEAN_DEBUG_PRIMS(template)                              \
     FOR_ALL_PPC_BOOLEAN_DEBUG_PRIMS(template)                                \
     FOR_ALL_I386_BOOLEAN_DEBUG_PRIMS(template)                               \
     FOR_ALL_SIC_BOOLEAN_DEBUG_PRIMS(template)                                \
     FOR_ALL_NEW_BOOLEAN_DEBUG_PRIMS(template)

# define FOR_ALL_INTEGER_DEBUG_PRIMS(template)                                \
    FOR_ALL_GEN_INTEGER_DEBUG_PRIMS(template)                                 \
    FOR_ALL_SIC_INTEGER_DEBUG_PRIMS(template)                                 \
    FOR_ALL_NEW_INTEGER_DEBUG_PRIMS(template)
    
# define FOR_ALL_MISC_DEBUG_PRIMS(template)                                   \
                                                                              \
   template(TestAllocateHeap, int32, "<int32>", UnknownPrimType, 4,           \
    Memory->nilObj, flag->is_smi(),                                           \
    (FreeHeap(AllocateHeap(smiOop(flag)->value(), "TestAllocateHeap", true))), \
    "attempt to allocate as many bytes as the argument requests", true)       \
    \
   template(Spy, bool, "<bool>", BooleanPrimType, false,               \
    (TheSpy->is_active() ? Memory->trueObj : Memory->falseObj),                         \
    (flag == Memory->trueObj || flag == Memory->falseObj),                    \
    if (flag == Memory->trueObj) {                                            \
      if (! TheSpy->is_active()) {                                                      \
        TheSpy->activate();                                 \
      }                                                                       \
    } else {                                                                  \
      if (TheSpy->is_active()) {                                                        \
        TheSpy->deactivate();                                               \
      }                                                                       \
    },                                                                        \
    "spy on the system", false)                                               \
                                                                              \
    template(ReuseNICMethods, bool, "<bool>", BooleanPrimType, false,         \
    (ReuseNICMethods ? Memory->trueObj : Memory->falseObj),                   \
    (flag == Memory->trueObj || flag == Memory->falseObj),                    \
    if (flag == Memory->trueObj) {                                            \
      if (!ReuseNICMethods) {                                                 \
        ReuseNICMethods= true;                                                \
        NICInlineDataAccess= false;                                           \
        Memory->code->flush();                                                \
      }                                                                       \
    } else {                                                                  \
      ReuseNICMethods= false;                                                 \
    },                                                                        \
    "reuse NIC methods in preference to customizing", true)                   \
                                                                              \
    template(CanonicalizeMaps, bool, "<bool>", BooleanPrimType, true,         \
    (CanonicalizeMaps ? Memory->trueObj : Memory->falseObj),                  \
    (flag == Memory->trueObj || flag == Memory->falseObj),                    \
    Memory->map_table->set_maps_are_canonical(flag == Memory->trueObj),       \
    "canonicalize maps", true)                                                \
                                                                              \
    template(FlatProfile, bool, "<bool>", BooleanPrimType, false,             \
    (FlatProfile ? Memory->trueObj : Memory->falseObj),                       \
    (flag == Memory->trueObj || flag == Memory->falseObj),                    \
    (FlatProfile = (flag == Memory->trueObj ? true : false),                  \
    SelfFlatProfile(FlatProfile)),                                            \
    "activate Self flat profiler (uses extra memory)", false)                 \
                                                                              \
    template(InlineCache, bool, "<bool>", BooleanPrimType, true,              \
    (InlineCache ? Memory->trueObj : Memory->falseObj),                       \
    (flag == Memory->trueObj || flag == Memory->falseObj),                    \
    (InlineCache = (flag == Memory->trueObj ? true : false),                  \
    InlineCache ? 0 : oop(0)->flush_inline_cache_prim()),                     \
    "inline-cache message send results", false)                               \
                                                                              \
    template(InlineCacheNonStatic, bool, "<bool>", BooleanPrimType, true,     \
    (InlineCacheNonStatic ? Memory->trueObj : Memory->falseObj),              \
    (flag == Memory->trueObj || flag == Memory->falseObj),                    \
    (InlineCacheNonStatic = (flag == Memory->trueObj ? true : false),         \
    InlineCacheNonStatic ? 0 : oop(0)->flush_inline_cache_prim()),            \
    "inline-cache non-static message send results", true)                     \
                                                                              \
    template(CountSends, bool, "<bool>", BooleanPrimType, false,              \
    (CountSends ? Memory->trueObj : Memory->falseObj),                        \
    (flag == Memory->trueObj || flag == Memory->falseObj),                    \
    setCountSends(flag == Memory->trueObj ? true : false),                    \
    "count number and type of non-inlined message sends", true)               \
                                                                              \
    template(EventLogLength, int32, "<int>", IntegerPrimType, 5000,           \
    (as_smiOop(EventLogLength)),                                              \
    (flag->is_smi() && smiOop(flag)->value() >= 100),                         \
    ((EventLogLength = smiOop(flag)->value()), eventLog->resize()),           \
    "length of VM event log (for VM debugging)", true)                        \
                                                                              \
    template(DirPath, const char*, "<str>", StringPrimType, "",               \
    new_string(DirPath), flag->is_byteVector(),                               \
    (selfs_free((void*)DirPath),                                              \
     DirPath = byteVectorOop(flag)->copy_c_heap_null_terminated()),           \
    "directory path for source files and snapshots", false)                   \
                                                                              \
    template(SpyDisplay, const char*, "<str>", StringPrimType,                \
    "", new_string(SpyDisplay), flag->is_byteVector(),                       \
    (SpyDisplay = byteVectorOop(flag)->copy_c_heap_null_terminated()),       \
    "name of display for Spy\n(OSX: use empty string for Mac Toolbox, nonempty for X)", false) \
                                                                              \
    template(SpyFont, const char*, "<str>", StringPrimType, "",               \
    new_string(SpyFont), flag->is_byteVector(),                               \
    (SpyFont = byteVectorOop(flag)->copy_c_heap_null_terminated()),           \
    "name of X font for Spy", false)                                          \
                                                                              \
    template(BugHuntNames, oop, "<vector or nil>", UnknownPrimType,           \
    oop(0), BugHuntNames, true, BugHuntNames = flag,                          \
    "used for bug hunting", true)                                             \
                                                                              \
    template(CompileWithSICNames, oop, "<vector or nil>", UnknownPrimType,    \
    oop(0),  CompileWithSICNames, true, CompileWithSICNames = flag,           \
    "list of selectors that must be compiled with SIC; used during SIC development", true) \
                                                                              \
    template(SpendTimeForDebugging, bool, "<bool>", BooleanPrimType,          \
    SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT,                                      \
    (SpendTimeForDebugging ? Memory->trueObj : Memory->falseObj),             \
    ( flag == Memory->falseObj  ||                                            \
      flag == Memory->trueObj && (GENERATE_DEBUGGING_AIDS                     \
      || (warning("cannot SpendTimeForDebugging unless "                      \
             "VM is compiled with -DGENERATE_DEBUGGING_AIDS=1"), false))),\
    SpendTimeForDebugging =  (flag == Memory->trueObj ? true : false),        \
    "Slow down Self in order to ease VM debugging", true)                    \
                                                                              \
    template(CheckAssertions, bool, "<bool>", BooleanPrimType,                \
    SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT,                                      \
    (CheckAssertions ? Memory->trueObj : Memory->falseObj),                   \
    ( flag == Memory->falseObj  ||                                            \
      flag == Memory->trueObj && (GENERATE_DEBUGGING_AIDS                     \
      || (warning("cannot CheckAssertions unless "                            \
             "VM is compiled with -DGENERATE_DEBUGGING_AIDS=1"), false))),\
    CheckAssertions =  (flag == Memory->trueObj ? true : false),              \
    "turn on assertion checking in VM", true)                                 \
                                                                              \
    template(ZapResourceArea, bool, "<bool>", BooleanPrimType,                \
    SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT,                                      \
    (ZapResourceArea ? Memory->trueObj : Memory->falseObj),                   \
    ( flag == Memory->falseObj  ||                                            \
      flag == Memory->trueObj && (GENERATE_DEBUGGING_AIDS                     \
      || (warning("cannot ZapResourceArea unless "                            \
             "VM is compiled with -DGENERATE_DEBUGGING_AIDS=1"), false))),\
    ZapResourceArea =  (flag == Memory->trueObj ? true : false),              \
    "zap the resource area when deallocated", true)                    


// next macro is too long for MW, so if you change this,
//  also change it in oop.c and prim.c, sigh

# define FOR_ALL_DEBUG_PRIMS(template)                                        \
    FOR_ALL_INTEGER_DEBUG_PRIMS(template)                                     \
    FOR_ALL_BOOLEAN_DEBUG_PRIMS(template)                                     \
    FOR_ALL_PROFILING_DEBUG_PRIMS(template)                                   \
    FOR_ALL_MISC_DEBUG_PRIMS(template)                                

# define BOOLEAN_PRIM_TEMPLATE(template, flagName, initialValue, explanation, wizardOnly) \
    template(flagName, bool, "<bool>", BooleanPrimType, initialValue,         \
    (flagName ? Memory->trueObj : Memory->falseObj),                          \
    (flag == Memory->trueObj || flag == Memory->falseObj),                    \
    flagName = (flag == Memory->trueObj ? true : false),                      \
    explanation, wizardOnly)

# define INTEGER_PRIM_TEMPLATE(                                               \
    template, flagName, initialValue, minValue, explanation, wizardOnly)      \
                                                                              \
    template(flagName, int32, "<int>", IntegerPrimType, initialValue,         \
    as_smiOop(flagName),                                                      \
    (flag->is_smi() && smiOop(flag)->value() >= minValue),                    \
    (flagName = smiOop(flag)->value()), explanation, wizardOnly)

# define SIC_LIMIT_PRIM_TEMPLATE(                                             \
    template, flagName, initialValue, minValue, explanation, wizardOnly)      \
                                                                              \
    template(flagName, int32, "<int>", IntegerPrimType, initialValue,         \
    as_smiOop(flagName),                                                      \
    (flag->is_smi() && smiOop(flag)->value() >= minValue),                    \
    (flagName = smiOop(flag)->value(), read_sic_limits()), explanation, wizardOnly)

# define FLOAT_PRIM_TEMPLATE(                                                 \
    template, flagName, initialValue, minValue, explanation, wizardOnly)      \
                                                                              \
    template(flagName, float, "<float>", FloatPrimType, initialValue,         \
    as_floatOop(flagName),                                                    \
    (flag->is_float() && floatOop(flag)->value() >= minValue),                \
    (flagName = floatOop(flag)->value()), explanation, wizardOnly)

# if TARGET_IS_PROFILED
  /* profiling is possible */
# define FOR_ALL_PROFILING_DEBUG_PRIMS(template)                              \
    BOOLEAN_PRIM_TEMPLATE(template, VMProfileCompaction, false,               \
    "profile zone compaction", true)                                          \
    BOOLEAN_PRIM_TEMPLATE(template, VMCompilerProfiling, false,               \
    "VM-level profiling of the compiler", true)                               \
    BOOLEAN_PRIM_TEMPLATE(template, VMSICProfiling, false,                    \
    "VM-level profiling of the SIC", true)                                    \
    BOOLEAN_PRIM_TEMPLATE(template, VMSICLongProfiling, false,                \
    "VM-level profiling of the SIC (long compiles only)", true)               \
    BOOLEAN_PRIM_TEMPLATE(template, VMNICProfiling, false,                    \
    "VM-level profiling of the NIC", true)                                    \
    template(VMProfiling, bool, "<bool>", BooleanPrimType, false,             \
    (VMProfiling ? Memory->trueObj : Memory->falseObj),                       \
    (flag == Memory->trueObj || flag == Memory->falseObj),                    \
    (VMProfiling = (flag == Memory->trueObj ? true : false),                  \
    OS::profile(VMProfiling)),                                                    \
    "VM-level profiling", true) 
    
# else // ! TARGET_IS_PROFILED

  /* profiling impossible */
# define FOR_ALL_PROFILING_DEBUG_PRIMS(template)                              \
    template(VMProfileCompaction, bool, "<bool>", BooleanPrimType, false,     \
    Memory->falseObj, (flag == Memory->falseObj), 0,                          \
    "no profiling of zone compaction (cannot be changed)", true)              \
    template(VMProfiling, bool, "<bool>", BooleanPrimType, false,             \
    Memory->falseObj, (flag == Memory->falseObj), 0,                          \
    "no VM-level profiling (cannot be changed)", true)                        \
    template(VMCompilerProfiling, bool, "<bool>", BooleanPrimType, false,     \
    Memory->falseObj, (flag == Memory->falseObj), 0,                          \
    "no VM-level profiling of the compiler (cannot be changed)", true)        \
    template(VMSICProfiling, bool, "<bool>", BooleanPrimType, false,          \
    Memory->falseObj, (flag == Memory->falseObj), 0,                          \
    "no VM-level profiling of the SIC (cannot be changed)", true)             \
    template(VMSICLongProfiling, bool, "<bool>", BooleanPrimType, false,      \
    Memory->falseObj, (flag == Memory->falseObj), 0,                          \
    "no VM-level profiling of the SIC (cannot be changed)", true)             \
    template(VMNICProfiling, bool, "<bool>", BooleanPrimType, false,          \
    Memory->falseObj, (flag == Memory->falseObj), 0,                          \
    "no VM-level profiling of the NIC (cannot be changed)", true)

# endif // TARGET_IS_PROFILED

# define FOR_ALL_GEN_BOOLEAN_DEBUG_PRIMS(template)                            \
    BOOLEAN_PRIM_TEMPLATE(template, GenArgCountBytecode, true, \
    "Generate and argument count bytecode (set to false to use old bytecode set)", false) \
    BOOLEAN_PRIM_TEMPLATE(template, BlockSignalsForXGlue, false,      \
    "safer but slower X calls, an attempt to fix OSX missing updates", false)  \
    BOOLEAN_PRIM_TEMPLATE(template, FastMethodDefines, false,                 \
    "experimental optimization of method defines", false)                     \
    BOOLEAN_PRIM_TEMPLATE(template, ReportLostComments, false,                \
    "report comments outside of code", false)                                 \
    BOOLEAN_PRIM_TEMPLATE(template, ConvertCommentsIntoAnnotations, false,    \
    "Bind comments as object and slot annotations", false)                    \
    BOOLEAN_PRIM_TEMPLATE(template, AddFileAnnotationsToSlots, false,         \
    "Add the annotation File:<filename> to each slot", false)                 \
    \
    BOOLEAN_PRIM_TEMPLATE(template, Inline, true,                             \
    "inline messages", false)                                                 \
    BOOLEAN_PRIM_TEMPLATE(template, Trace, false,                             \
    "trace message sends", false)                                             \
    BOOLEAN_PRIM_TEMPLATE(template, CatchInterprocessReturns, false,          \
    "catch non-local returns to a different process", false)                  \
    BOOLEAN_PRIM_TEMPLATE(template, SilentTrace, false,                       \
    "silently trace message sends (in event buffer)", false)                  \
    BOOLEAN_PRIM_TEMPLATE(template, PrintVMMessages, true,                    \
    "print VM debug messages to stderr", true)                                \
    BOOLEAN_PRIM_TEMPLATE(template, LogVMMessages, false,                     \
    "log VM debug messages to a file", true)                                  \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintPeriod, false,                       \
    "print a period when reading a file", false)                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintScriptName, true,                    \
    "print the file name when reading a file", false)                         \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintScavenge, false,                     \
    "print each scavenge", false)                                             \
    BOOLEAN_PRIM_TEMPLATE(template, PrintNewMapListScavengeStats, false,      \
    "print stats on new maps at each scavenge", false)                        \
    BOOLEAN_PRIM_TEMPLATE(template, PrintGC, false,                           \
    "print each garbage collection", false)                                   \
    BOOLEAN_PRIM_TEMPLATE(template, VerifyBeforeScavenge, false,              \
    "verify before each scavenge", true)                                      \
    BOOLEAN_PRIM_TEMPLATE(template, VerifyAfterScavenge, false,               \
    "verify after each scavenge", true)                                       \
    BOOLEAN_PRIM_TEMPLATE(template, VerifyBeforeGC, false,                    \
    "verify before each full garbage collection", true)                       \
    BOOLEAN_PRIM_TEMPLATE(template, VerifyAfterGC, false,                     \
    "verify after each full garbage collection", true)                        \
    BOOLEAN_PRIM_TEMPLATE(template, VerifyBeforeConversion, false,            \
    "verify before each frame conversion", true)                              \
    BOOLEAN_PRIM_TEMPLATE(template, VerifyAfterConversion, false,             \
    "verify after each frame conversion", true)                               \
    BOOLEAN_PRIM_TEMPLATE(template, VerifyAfterRecompilation, false,          \
    "verify after each recompilation that replaces nmethods on stack", true)  \
    BOOLEAN_PRIM_TEMPLATE(template, VerifyZoneOften, false,                   \
    "verify nmethod allocation a lot", true)                                  \
    BOOLEAN_PRIM_TEMPLATE(template, ScavengeAfterRecompilation, false,        \
    "scavenge after each recompilation (to trigger bugs)", true)              \
    BOOLEAN_PRIM_TEMPLATE(template, ScavengeInPrimitives, true,               \
    "allow scavenges within primitives", true)                                \
    BOOLEAN_PRIM_TEMPLATE(template, MemoryAutomaticGC, true,                  \
    "VM automatically GCs when space is low and scheduler is not running",    \
                          false)                                              \
    BOOLEAN_PRIM_TEMPLATE(template, MemoryAutomaticHeapExpansion, true,       \
    "VM automatically expands heap when space is low and scheduler is "       \
    "not running", false)                                                     \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintInlineCacheInvalidation, false,      \
    "print each inline cache invalidation", true)                             \
    BOOLEAN_PRIM_TEMPLATE(template, PrintMethodFlushing, false,               \
    "print each compiled method flush", true)                                 \
    BOOLEAN_PRIM_TEMPLATE(template, PrintMethodInvalidation, false,           \
    "print compiled methods invalidated after a change", true)                \
    BOOLEAN_PRIM_TEMPLATE(template, UseLRUInterrupts, true,                   \
    "use interrupt-driven LRU scheme", true)                                  \
    BOOLEAN_PRIM_TEMPLATE(template, GenerateLRUCode, true,                    \
    "generate LRU code in method prologue", true)                             \
    BOOLEAN_PRIM_TEMPLATE(template, PrintLRUSweep, false,                     \
    "print each LRU sweep", true)                                             \
    BOOLEAN_PRIM_TEMPLATE(template, PrintLRUSweep2, false,                    \
    "print each LRU sweep in great detail", true)                             \
    BOOLEAN_PRIM_TEMPLATE(template, PrintCodeReclamation, false,              \
    "print each compiled code compaction or flushing", true)                  \
    BOOLEAN_PRIM_TEMPLATE(template, PrintCodeCompaction, false,               \
    "print details of compiled code compaction", true)                        \
    BOOLEAN_PRIM_TEMPLATE(template, GenerateAllPcDescs, true,                 \
    "generate complete PcDesc mapping (for source-level profiling)", true)    \
    BOOLEAN_PRIM_TEMPLATE(template, NICInlineDataAccess, true,                \
    "inline data access in the receiver", true)                               \
    BOOLEAN_PRIM_TEMPLATE(template, NICDelayPrimFailBlocks, true,             \
    "don't create prim fail blocks unless needed (NIC)", true)                \
    BOOLEAN_PRIM_TEMPLATE(template, GenerateLiteScopeDescs, true,             \
    "generate scope descs for accurate profiling", true)                      \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PIC, true,                                \
    "use polymorphic inline caches", true)                                    \
    BOOLEAN_PRIM_TEMPLATE(template, UsePICRecompilation, true,                \
    "use PIC-based recompilation", true)                                      \
    BOOLEAN_PRIM_TEMPLATE(template, UseAgingStubs, true,                      \
    "use Aging stubs (reset this for debugging)", true)                       \
    BOOLEAN_PRIM_TEMPLATE(template, ClearTripNMUseCount, true,                \
    "on recompilation, clear (vs. halve) tripping nmethod's use count", true) \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, Interpret, false,                         \
    "use the interpreter (experimental)", true)                               \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, UseLocalAccessBytecodes, true,            \
    "use the local access bytecodes (experimental)", true)                    \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintTokens, false,                       \
    "print scanned tokens", true)                                             \
    BOOLEAN_PRIM_TEMPLATE(template, PrintParsedExpressions, false,            \
    "print parsed expressions before evaluation", true)                       \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, GenerateCountCode, false,                 \
    "generate code counting # messages sent", true)                           \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, GenerateZapCode, true,                    \
    "generate block zap code", true)                                          \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, DeferUncommonBranches, true,              \
    "don't compile uncommon branches at first", true)                         \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintUncommonBranches, false,             \
    "print message when uncommon branch happens (SIC)", true)                 \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintNICSource, false,                    \
    "print source of NIC methods", false)                                     \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintCompilation, false,                  \
    "print each compilation", false)                                          \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintLongCompilation, false,              \
    "print each compilation exceeding MaxCompilePause", true)                 \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintRecompilation, false,                \
    "print each recompilation", true)                                         \
    BOOLEAN_PRIM_TEMPLATE(template, PrintRecompilation2, false,               \
    "print details about recompilations", true)                               \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintCompilationStatistics, false,        \
    "print compilation statistics", true)                                     \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, SpyShowLongTerm, true,                    \
    "show long-term CPU averages in spy", false)                              \
    BOOLEAN_PRIM_TEMPLATE(template, SpyShowSends, false,                      \
    "show sends / block invocations in spy (see _GenerateCountCode)", false)  \
    BOOLEAN_PRIM_TEMPLATE(template, PrintSpyXErrors, false,                   \
    "print X errors caused by the spy", false)                                \
    BOOLEAN_PRIM_TEMPLATE(template, SilentSpy, false,                         \
    "suppress spy's X output (useful with Spy log)", false)                   \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintPIC, false,                          \
    "print each PIC creation, deletion etc.", true)                           \
    BOOLEAN_PRIM_TEMPLATE(template, PrintCountStub, false,                    \
    "print each count stub creation, deletion etc.", true)                    \
    BOOLEAN_PRIM_TEMPLATE(template, PrintMegamorphism, false,                 \
    "print a message when a PIC becomes megamorphic", true)                   \
    BOOLEAN_PRIM_TEMPLATE(template, PrintInlining, false,                     \
    "print each inlining", true)                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintCompiledCode, false,                 \
    "print generated code", true)                                             \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintResourceAllocation, false,           \
    "print resource area allocation", true)                                   \
    BOOLEAN_PRIM_TEMPLATE(template, PrintResourceChunkAllocation, false,      \
    "print resource area chunk allocation", true)                             \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintOopAddress, false,                   \
    "print address of object in addition to reference number", true)          \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintFrameConversion, false,              \
    "print conversion of invalidated stack frames", true)                     \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintFrameConversion2, false,             \
    "print details of conversion of invalidated stack frames", true)          \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, WizardMode, SPEND_TIME_FOR_DEBUGGING_BY_DEFAULT, \
    "wizard debugging mode", false)                                           \
    BOOLEAN_PRIM_TEMPLATE(template, WizardAbortMode, false,                   \
    "preserve fatal stack for better VM debugging", true)                     \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, AllowOffsetCheckStores, true,             \
    "allow store checks to adjacent cards", true)                             \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, ProfilerUseLastStack, true,               \
    "use computed result from last collected stack", true)                    \
    BOOLEAN_PRIM_TEMPLATE(template, ProfilerUsePatch, false,                  \
    "patch return addresses on stack", true)                                  \
    BOOLEAN_PRIM_TEMPLATE(template, ProfilerUseFold, false,                   \
    "fold call graph in case of recursion", true)                             \
    BOOLEAN_PRIM_TEMPLATE(template, ProfilerDumpCallGraph, true,              \
    "dump the call graph when _ProfilerPrint", true)                          \
    BOOLEAN_PRIM_TEMPLATE(template, PrintProfiling, false,                    \
    "print extra information during profiling", true)                         \
    BOOLEAN_PRIM_TEMPLATE(template, ProfilerIgnoreCallGraph, false,           \
    "avoid collecting the callgraph during profiling", true)                  \
    \
    BOOLEAN_PRIM_TEMPLATE(template, NakedMethods, false,                      \
    "allow unfiring methods in read/write slots", false)                      \
    BOOLEAN_PRIM_TEMPLATE(template, AllowLocalAccessInCreatedMethods, false, \
    "allow Self code to directly create methods with local read/write bcs", false) \
    BOOLEAN_PRIM_TEMPLATE(template, SaveOutgoingArgumentsOfPatchedFrames, false, \
    "capture outgoing arguments of patched frames (needed for PPC SIC, broken for SPARC)", true) \


# if TARGET_ARCH == SPARC_ARCH                                                
# define FOR_ALL_SPARC_BOOLEAN_DEBUG_PRIMS(template)                          \
    BOOLEAN_PRIM_TEMPLATE(template, FastMapTest, true,                        \
    "do fast map tests", true)                                                
# else
# define FOR_ALL_SPARC_BOOLEAN_DEBUG_PRIMS(template)
# endif    
   
# if TARGET_ARCH == PPC_ARCH
# define FOR_ALL_PPC_BOOLEAN_DEBUG_PRIMS(template)                            \
    BOOLEAN_PRIM_TEMPLATE(template, FastMapTest, true,                        \
    "do fast map tests", true)                                                \
    BOOLEAN_PRIM_TEMPLATE(template, UseByteMapBaseReg, true,                  \
    "use register to hold the byte map base", true)                           \
    BOOLEAN_PRIM_TEMPLATE(template, UseSPLimitReg, false,                     \
    "use register to hold the stack pointer limit (risky, relies on C not using this register)", true) \
    BOOLEAN_PRIM_TEMPLATE(template, UseShortBranches, true,                   \
    "Use PPC one-word (relative) branches to call self & prims", true)        \

# else
# define FOR_ALL_PPC_BOOLEAN_DEBUG_PRIMS(template)
# endif

# if TARGET_ARCH == I386_ARCH
  static const bool UseByteMapBaseReg = false; // doesn't seem worth it for I386 -- dmu 5/06
  static const bool FastMapTest       = false; // cannot do this, no alignment error -- dmu 5/06
  
# define FOR_ALL_I386_BOOLEAN_DEBUG_PRIMS(template)                            
# else
# define FOR_ALL_I386_BOOLEAN_DEBUG_PRIMS(template)
# endif


# define FOR_ALL_GEN_INTEGER_DEBUG_PRIMS(template)                            \
    INTEGER_PRIM_TEMPLATE(template, StackPrintLimit, 20, 1,                   \
    "limit the number of stack frames printed", false)                        \
    INTEGER_PRIM_TEMPLATE(template, VectorPrintLimit, 20, 1,                  \
    "limit the number of vector elements printed", false)                     \
    INTEGER_PRIM_TEMPLATE(template, TinyFnSourceSize, 6, 1,                   \
    "max source length of \"tiny\" methods (during recompilee search)", true) \
    INTEGER_PRIM_TEMPLATE(template, TinyBlockSourceSize, 60, 1,               \
    "max length of \"tiny\" block methods (during recompilee search)", true)  \
    INTEGER_PRIM_TEMPLATE(template, TinyFnObjSize, 160, 1,                    \
    "max object code length of \"tiny\" methods (bytes, w/o prologue)", true) \
    SIC_LIMIT_PRIM_TEMPLATE(template, MaxBlockInlineSize, 75, 0,              \
    "max length of \"short\" block methods", true)                            \
    SIC_LIMIT_PRIM_TEMPLATE(template, MaxFnInlineSize, 8, 0,                  \
    "max length of \"short\" methods ", true)                                 \
    SIC_LIMIT_PRIM_TEMPLATE(template, MaxBlockFnInlineSize, 10, 0,            \
    "max length of \"short\" methods w/ block args", true)                    \
    INTEGER_PRIM_TEMPLATE(template, BlockLiteralPenalty, 0, 0,                \
    "additional penalty for block literals", true)                            \
    INTEGER_PRIM_TEMPLATE(template, MaxRecursionUnroll, 3, 1,                 \
    "max recursions to unroll", true)                                         \
    INTEGER_PRIM_TEMPLATE(template, MaxCompilePause, 500, 10,                 \
    "max. compile time (in ms); the compiler will *attempt* to not exceed this\n\t\t(at the expense of code quality)", true)    \
    INTEGER_PRIM_TEMPLATE(template, MaxCompilationPercentage, 100, 0,         \
    "max %CPU to use for compiler (per-second average)", true)                \
    template(NumObjectIDs, int32, "<int>", IntegerPrimType, 1000,             \
    as_smiOop(NumObjectIDs),                                                  \
    (flag->is_smi() && smiOop(flag)->value() >= 2),                           \
    (SetNumObjectIDs(smiOop(flag)->value())),                                 \
    "number of object id's", false)                                           \
    template(CurrentObjectID, int32, "<int>", IntegerPrimType, 0,             \
    as_smiOop(CurrentObjectID),                                               \
    (flag->is_smi() && smiOop(flag)->value() >= 0),                           \
    (CurrentObjectID = smiOop(flag)->value()),                                \
    "object id of next object reference ", false)                             \
    INTEGER_PRIM_TEMPLATE(template, MaxPICSize, 25, 1,                        \
    "max. number of cases in a PIC (do a _Flush after changing this)", true)  \
    FLOAT_PRIM_TEMPLATE(template, LRUDecayFactor, 1.2, 1.0,                   \
    "decay factor for invocation counts", true)                               \
    INTEGER_PRIM_TEMPLATE(template, LRUMaxVisited, 2000, 1,                   \
    "max. nmethods to visit during LRU sweep", true)                          \
    INTEGER_PRIM_TEMPLATE(template, NumberOfLookups, 0, 0,                    \
    "total number of run-time lookups", true)                                 \
    INTEGER_PRIM_TEMPLATE(template, NumberOfDILookups, 0, 0,                  \
    "number of DI lookups", true)                                             \
    INTEGER_PRIM_TEMPLATE(template, NumberOfFastLookupHits, 0, 0,             \
    "number of hits with fast lookup cache function", true)                   \
    INTEGER_PRIM_TEMPLATE(template, NumberOfFastLookupMisses, 0, 0,           \
    "number of misses with fast lookup cache function", true)                 \
    INTEGER_PRIM_TEMPLATE(template, NumberOfICMisses, 0, 0,                   \
    "total number of inline cache misses", true)                              \
    INTEGER_PRIM_TEMPLATE(template, NumberOfMegamorphicPICMisses, 0, 0,       \
    "number of PIC misses because of megamorphism", true)                     \
    INTEGER_PRIM_TEMPLATE(template, NumberOfPerformMisses, 0, 0,              \
    "number of inline cache misses because of _Performs", true)               \
    INTEGER_PRIM_TEMPLATE(template, NumberOfDIMisses, 0, 0,                   \
    "number of DI cache misses", true)                                        \
    INTEGER_PRIM_TEMPLATE(template, NumberOfPICSends, 0, 0,                   \
    "number of polymorphic sends performed by Self code", true)               \
    INTEGER_PRIM_TEMPLATE(template, NumberOfMethodCalls, 0, 0,                \
    "number of method calls performed by Self code", true)                    \
    INTEGER_PRIM_TEMPLATE(template, NumberOfBlockClones, 0, 0,                \
    "number of block clones Self code", true)                                 \
    INTEGER_PRIM_TEMPLATE(template, NumberOfBlockMethodCalls, 0, 0,           \
    "number of block method invocations performed by Self code", true)        \
    INTEGER_PRIM_TEMPLATE(template, NumberOfAccessMethodCalls, 0, 0,          \
    "number of access method calls performed by Self code", true)             \
    INTEGER_PRIM_TEMPLATE(template, NumberOfDIMethodCalls, 0, 0,              \
    "number of DI calls performed by Self code", true)                        \
                                                                              \
    INTEGER_PRIM_TEMPLATE(template, MaxRecompilationDepth, 30, 1,             \
    "max. distance between block rcvr/arg and home (recompilation)", true)    \
    INTEGER_PRIM_TEMPLATE(template, MapLoadTrapLimit, 5, 1,                   \
    "recompile to eliminate map load trap after this many traps", true)       \

# ifdef SIC_COMPILER

#   define FOR_ALL_SIC_BOOLEAN_DEBUG_PRIMS(template)                          \
    BOOLEAN_PRIM_TEMPLATE(template, PrintSICCompilation, false,               \
    "print each SIC compilation", false)                                      \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, SICDebug, false,                          \
    "enable various features for debugging the SIC", true)                    \
    BOOLEAN_PRIM_TEMPLATE(template, InlinePrimitives, true,                   \
    "inline some primitives", true)                                           \
    BOOLEAN_PRIM_TEMPLATE(template, InlineSTMessages, false,                  \
    "inline messages inlined by ST-80 (even when inlining turned off)", true) \
    BOOLEAN_PRIM_TEMPLATE(template, SICDontUseRegs, false,                    \
    "don't use registers except for temps (SIC)", true)                       \
    BOOLEAN_PRIM_TEMPLATE(template, SICAllocConstants, false,                 \
    "try to allocate constants to registers (SIC)", true)                     \
    BOOLEAN_PRIM_TEMPLATE(template, SICEliminateUnneededNodes, true,          \
    "eliminate nodes whose results are unused", true)                         \
    BOOLEAN_PRIM_TEMPLATE(template, PrintPICScopes, false,                    \
    "print scopes constructed from PICs and recompilee (SIC) ", true)         \
    BOOLEAN_PRIM_TEMPLATE(template, SICLocalCopyPropagate, true,              \
    "perform local copy propagation", true)                                   \
    BOOLEAN_PRIM_TEMPLATE(template, SICGlobalCopyPropagate, true,             \
    "perform globcal copy propagation", true)                                 \
    BOOLEAN_PRIM_TEMPLATE(template, SICSplitting, true,                       \
    "do splitting in SIC", true)                                              \
    BOOLEAN_PRIM_TEMPLATE(template, SICMultipleSplitting, false,              \
    "do multiple splitting of save value in SIC (experimental)", true)        \
    BOOLEAN_PRIM_TEMPLATE(template, SICBranchSplitting, true,                 \
    "do branch bc splitting in SIC", true)                                    \
    BOOLEAN_PRIM_TEMPLATE(template, SICRegTargeting, true,                    \
    "perform register targeting in SIC", true)                                \
    BOOLEAN_PRIM_TEMPLATE(template, SICCSEConstants, true,                    \
    "do CSE of oop constants in SIC", true)                                   \
    BOOLEAN_PRIM_TEMPLATE(template, SICDeferUncommonBranches, true,           \
    "use uncommon branch strategy in SIC", true)                              \
    BOOLEAN_PRIM_TEMPLATE(template, SICReplaceOnStack, true,                  \
    "replace unoptim. nmethods on stack after recompilation", true)           \
    BOOLEAN_PRIM_TEMPLATE(template, SICMultipleRecompilation, true,           \
    "allow multiple recompilations when using SICReplaceOnStack", true)       \
    BOOLEAN_PRIM_TEMPLATE(template, SICRecompileTopDown, false,               \
    "determine top recompilee in top-down fashion", true)                     \
    BOOLEAN_PRIM_TEMPLATE(template, SICUseOptimizedSDFlag, false,             \
    "use Optimized flag in sendDescs (SIC)", true)                            \
    BOOLEAN_PRIM_TEMPLATE(template, SICAdjustLimits, true,                    \
    "adjust inlining limits based on source size (SIC)", true)                \
    BOOLEAN_PRIM_TEMPLATE(template, SICOptimizeTypeTests, false,              \
    "try to optimize (eliminate) type tests (SIC)", false)                    \
    BOOLEAN_PRIM_TEMPLATE(template, SICCountTypeTests, false,                 \
    "generate marker instrs for type tests (SIC)", true)                      \
    BOOLEAN_PRIM_TEMPLATE(template, SICCountIntTagTests, false,               \
    "generate marker instrs for int tag tests (SIC)", true)                   \
                                                                              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintSICTempRegisterAllocation, false,    \
    "print assignments of temporary register PRegs (SIC)", true)              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintSICCode, false,                      \
    "print SIC intermediate code", true)                                      \
    BOOLEAN_PRIM_TEMPLATE(template, PrintSICCompiledCode, false,              \
    "print SIC assembly code", true)                                          \
    BOOLEAN_PRIM_TEMPLATE(template, PrintSICCopyPropagation, false,           \
    "print local copy propagation", true)                                     \
    BOOLEAN_PRIM_TEMPLATE(template, PrintSICRegAlloc, false,                  \
    "print SIC's global register allocation", true)                           \
    BOOLEAN_PRIM_TEMPLATE(template, PrintSICRegTargeting, false,              \
    "print SIC's register targeting", true)                                   \
    BOOLEAN_PRIM_TEMPLATE(template, PrintSICMarkers, false,                   \
    "print info about SIC's restart marker nodes", true)                      \
    BOOLEAN_PRIM_TEMPLATE(template, PrintSICReplacement, false,               \
    "print info about SIC's on-stack replacement of nmethods", true)          \
    BOOLEAN_PRIM_TEMPLATE(template, PrintSICEliminateUnneededNodes, false,    \
    "print elimination of nodes whose results are unused", true)              \
    BOOLEAN_PRIM_TEMPLATE(template, PrintSICExposed, false,                   \
    "print exposed-block computation", true)                                  \
    BOOLEAN_PRIM_TEMPLATE(template, PrintSICDominators, false,                \
    "print dominator computation", true)                                      \
    BOOLEAN_PRIM_TEMPLATE(template, PrintSICTypeTestOpt, false,               \
    "print type test optimization", true)                                     \
    BOOLEAN_PRIM_TEMPLATE(template, PrintSICBranchSplitting, false,           \
    "print SIC branch bc splitting", true)                                    \

# define FOR_ALL_SIC_INTEGER_DEBUG_PRIMS(template)                            \
    INTEGER_PRIM_TEMPLATE(template, SICInstructionsSize, 100000, 10240,       \
    "max. length of compiled methods (hard limit)", true)                     \
    INTEGER_PRIM_TEMPLATE(template, SICTypeCaseLimit, 5, 1,                   \
    "max. # of maps allowed for type-cases (SIC)", true)                      \
    INTEGER_PRIM_TEMPLATE(template, PICTrustLimit, 3, 1,                      \
    "max. # of callers for considering nmethod's PICs trustworthy", true)     \
    INTEGER_PRIM_TEMPLATE(template, UntrustedPICLimit, 2, 1,                  \
    "max. # of cases in untrusted PIC before ignoring PIC info", true)        \
    INTEGER_PRIM_TEMPLATE(template, UncommonTrapLimit, 5, 1,                  \
    "recompile to eliminate uncommon trap after this many traps", true)       \
    INTEGER_PRIM_TEMPLATE(template, MaturityInvocationLimit, 512, 1,          \
    "min. invoc. before considering newly optimized nmethod mature", true)    \
    INTEGER_PRIM_TEMPLATE(template, MaturityScalingFactor, 8, 1,              \
    "scaling factor for exponential back-off of Mat.InvocationLimit", true)   \
    INTEGER_PRIM_TEMPLATE(template, MinPrimFailureInvocations, 1000, 1,       \
    "min. # primitive failures before inlining non-trivial fail blocks", true)\
    INTEGER_PRIM_TEMPLATE(template, MaxTrivialPrimFailureCost, 1, 0,          \
    "max. cost of \"trivial\" primitive failure blocks", true)                \
    INTEGER_PRIM_TEMPLATE(template, NormalMethodLen, 25, 0,                   \
    "max. length of \"normal\" source methods", true)                         \
                                                                              \
    INTEGER_PRIM_TEMPLATE(template, SICCompilationCount, 0, 0,                \
    "number of SIC compilations", true)                                       \
    INTEGER_PRIM_TEMPLATE(template, SICMinCompilationCount, -1, -1,           \
    "first SICCompilation to perform (-1 = all)", true)                       \
    INTEGER_PRIM_TEMPLATE(template, SICMaxCompilationCount, -1, -1,           \
    "last SICCompilation to perform (-1 = all)", true)                        \
    
# else // ! SIC_COMPILER

#   define FOR_ALL_SIC_BOOLEAN_DEBUG_PRIMS(template)                         
#   define FOR_ALL_SIC_INTEGER_DEBUG_PRIMS(template)    
                    
# endif

# define FOR_ALL_NEW_BOOLEAN_DEBUG_PRIMS(template)                           
# define FOR_ALL_NEW_INTEGER_DEBUG_PRIMS(template)                          

# define DeclareFlags(                                                        \
    flagName,     flagType,        flagTypeName,  primReturnType,             \
    initialValue, getCurrentValue, checkNewValue, setNewValue,                \
    explanation,  wizardOnly)                                                 \
    extern flagType flagName;

FOR_ALL_DEBUG_PRIMS(DeclareFlags)

# undef DeclareFlags
