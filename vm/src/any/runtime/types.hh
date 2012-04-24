/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
  See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// This file contains some global types, plus many partial definitions
// to reduce include file dependencies.  (If foo.h contains a bar* and
// class bar is defined here, foo.h need not depend on bar.h.)

# define unknown public /* so we can gradually move towards privacy */


//
// Base types from which all derived integer types should be obtained.
//

typedef char             int8;          // signed integer with >= 7 bits
typedef unsigned char   uint8;          // unsigned integer with >= 8 bits
typedef short           int16;          // signed integer with >= 15 bits
typedef unsigned short  uint16;         // unsigned integer with >= 16 bits
typedef int              int32;         // signed integer with >= 31 bits
typedef unsigned int    uint32;         // unsigned integer with >= 32 bits


# if  TARGET_ARCH == SPARC_ARCH  \
  ||  TARGET_ARCH ==   PPC_ARCH  \
  ||  TARGET_ARCH ==  I386_ARCH
  typedef int32         fint;           // fastest precision-irrelevant int
# elif  TARGET_ARCH == M68K_ARCH
  //typedef int16               fint;   // fastest precision-irrelevant int
  typedef int32         fint;           // portablest precision-irrelevant int
# endif

typedef int32 smi;
typedef unsigned char u_char;
typedef   signed char s_char;
typedef u_char bool8;

# if COMPILER == MWERKS_COMPILER 
  typedef long int sigset_t; // for interruptedContext
  
  // enable bool support in project file

# elif COMPILER == GCC_COMPILER // worse: built-in bool is an int!

# elif COMPILER == CC_COMPILER
  const bool false = 0;
  const bool true  = 1;
# endif

const fint BitsPerByte = 8;
const fint BytesPerWord = 4;
const fint BitsPerWord = BitsPerByte * BytesPerWord;

const fint LogBitsPerByte = 3;
const fint LogBytesPerWord = 2;
const fint LogBitsPerWord = LogBitsPerByte + LogBytesPerWord;


// pointer to a vtbl of a map

typedef void* VtblPtr_t; 


// oop hierarchy
// This hierarchy is a representation hierarchy, i.e. if A is a superclass
// of B, A's representation is a prefix of B's representation.

typedef class  oopClass                                *oop;
typedef class    smiOopClass                           *smiOop;
typedef class    floatOopClass                         *floatOop;
typedef class    markOopClass                          *markOop;
typedef class    memOopClass                           *memOop;
typedef class      oopsOopClass                        *oopsOop;
typedef class        mapOopClass                       *mapOop;
typedef class        slotsOopClass                     *slotsOop;
typedef class          objVectorOopClass               *objVectorOop;
typedef class          byteVectorOopClass              *byteVectorOop;
typedef class            stringOopClass                *stringOop;
typedef class          mirrorOopClass                  *mirrorOop;
typedef class          blockOopClass                   *blockOop;
typedef class          processOopClass                 *processOop;
typedef class          profilerOopClass                *profilerOop;
typedef class          vframeOopClass                  *vframeOop;
typedef class          foreignOopClass                 *foreignOop;
typedef class            proxyOopClass                 *proxyOop;
typedef class              fctProxyOopClass            *fctProxyOop;
typedef class          assignmentOopClass              *assignmentOop;

// map hierarchy
// This hierarchy is a subtype (IS-A) hierarchy, e.g. an objVectorMap is
// a kind of a slotsMap.

class  Map;
class    blockMap;
class    immediateMap;
class      smiMap;
class      floatMap;
class    mapMap;
class    markMap;
class    slotsMap;
class      codeSlotsMap;
class        methodMap;
class          outerMethodMap;
class          blockMethodMap;
class      slotsMapDeps;
class        objVectorMap;
class        byteVectorMap;
class          stringMap;
class        codeLikeSlotsMap;
class          assignmentMap;
class          vframeMap;
class            ovframeMap;
class            bvframeMap;
class        mirrorMap;
class        processMap;
class        profilerMap;
class        foreignMap;
class          proxyMap;
class            fctProxyMap;

class  universe;
class  space;
class    newSpace;
class    oldSpace;
class  generation;
class    newGeneration;
class    oldGeneration;
class  rSet;
class  stringTable;
class  mapTable;
class  ageTable;
class  oTable;
class  VMObj;
class    CHeapObj;
class    ResourceObj;
class    StackObj;
class      preservedVmObj;
class        preserved;
class        preservedObj;
class         PreservedList;

typedef class slotTypeClass* slotType;
class  slotDesc;

class frame;
class  FrameIterator;
class  OopClosure;
class  abstract_vframe;
class    interpreted_vframe;
class    compiled_vframe;
class   Stack;
class   RegisterLocator;

class   Process;
class   Processes;

class  EventBuffer;

class  Profiler;

typedef int32 RegisterString;
class LongRegisterString;

class  ScopeLookupKey;
class    MethodLookupKey;
class      NMethodLookupKey;

class    simpleLookup; // kind of ResourceObject
class     vframeLookup;
class       compilingLookup;
class         cacheProbingLookup;
class     baseCompileTimeLookup;
class       SICLookup;

class  lookupTarget;
class    objectLookupTarget;

class  abstractSlotRef;
class    nonexistentSlotRef;
class    counterfactualSlotRef;
class    realSlotRef;

class  dependencyList;
class  assignableDependencyList;


class  nmln;
class   IDManager;
class   NCodeBase;
class     OopNCode;
class       nmethod;
class       CacheStub;
class     CountStub;
class   sendDesc;
class DIDesc;

class   Stubs;
class   zone;
class   Heap;
class  codeTable;
class  addrDesc;
class  PcDesc;
class   PrimDesc;
class   ScopeDesc;
class  NameDesc;

class  nmethodScopes;
class  PcDesc;
class  ScopeDescRecorder;
class  NameNode;
typedef class ScopeInfoClass   *ScopeInfo;
typedef class PcDescInfoClass  *PcDescInfo;
class  ScopeDescRecorder;

class  Scanner;
class    FileScanner;
class    InteractiveScanner;
class  Token;
class  Parser;
class  AbstractByteCode;

class  enumeration;
class  enumeration_list;

class call_graph_node;
class call_graph_edge;

// type of runtime functions
typedef oop         (*fntype)(...);
typedef void    (*oopsDoFn)(oop* p);
typedef void    (*framesDoFn)(frame* p, RegisterLocator* rl);
typedef void    (*vframesDoFn)(abstract_vframe* p);
typedef void    (*processesDoFn)(Process* p);
typedef void    (*nmethodDoFn)(nmethod* p);
typedef void    (*primDoFn)(PrimDesc* p);
typedef void    (*nameDescDoFn)(NameDesc* p);
typedef void    (*nameDescStringDoFn)(NameDesc* p, char* name);
typedef void    (*doFn)();



# define EMPTY 0

// compiler classes
class AbstractCompiler;

class FCompiler;
class CodeGen;
class BaseAssembler;
class Assembler;
class Label;
class RegisterState;

class FScope;

# ifdef SIC_COMPILER
  
  class AbstractBB;
  class   BB;
  class     BranchBB;
  class     MergeBB;
  class BBIterator;
  
  class Node;
  class   ConstInitNode;
  class   MergeNode;
  class   CallNode;
  class     PrimNode;
  class   MarkerNode;
  
  class NodeGen;
  class PReg;
  class   BlockPReg;
  class   ConstPReg;
  class   NoPReg;
  class   SAPReg;
  class     SplitPReg;

  class SICompiler;
  class SScope;
  class   SCodeScope;
  class     SSelfScope;
  class   SAccessScope;

  class SplitSig;
    
  class SExpr;
  class   MapSExpr;
  class   ConstantSExpr;
  class   MergeSExpr;
  class   UnknownSExpr;
  class SExprStack;
  
  class PDefUse;
  class   PUse;
  class   PDef;
  class PRegBBIndex;
  class DUInfo;
  class BitVector;
  class CPInfo;
  class RegCandidate;
  class RegisterEqClass;
  
  class RUncommonBranch;
  class RScope;
  class   RSelfScope;
  class   RPICScope;
  class     RUntakenScope;
  class VScope;

  class SendInfo;
  
  typedef void    (*pregDoFn)(PReg* r1, PReg* r2, bool);
  typedef void    (*defDoFn)(PDef* d);
  typedef void    (*useDoFn)(PUse* d);
  
# endif

template<class T> class BoundedListTemplate;
typedef BoundedListTemplate<fint> IntBList;
typedef BoundedListTemplate<Map*> MapBList;

class OopOopTable;

class IntList;
class IntListElem;

class OopList;
class OopListElem;

class interpreter;

class InterruptedContext;
class sigcontext;
class SignalBlocker;


typedef char* pc_t; // machine-indep code pointer

