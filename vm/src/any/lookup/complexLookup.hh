/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// runtime lookup types

// I have a vframe, and can do implicitSelf lookups of locals

class vframeLookup: public simpleLookup {
 public:
  abstract_vframe* sendingVFrame;

  vframeLookup( LookupType l,
                oop rcvr,
                oop sel,
                oop dgt,
                oop smhOrMap,
                abstract_vframe* sendingVf, 
                dependencyList* dps,
                assignableDependencyList* adps );

 protected:

  lookupTarget*     implicit_self_lookup_target();
  lookupTarget*   directed_resend_lookup_target();
};


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

// I go from lookups to nmethods

class compilingLookup: public vframeLookup {
 protected:
  bool needDebug; // do we need to return a debug method?
  sendDesc *sd;
  DIDesc *dc;
  fint compiler;
  bool canReuseNM; // can we reuse a nmethod compiled for a different rcv map?

 public:  
  compilingLookup( oop rcvr,
                   oop sel,
                   oop dgt, 
                   oop smhOrMap,
                   abstract_vframe* sendingVf, 
                   sendDesc *sd,
                   DIDesc *dc,
                   bool debug,
                   bool canReuseNM= true);

  sendDesc *send_desc() { return sd; }
  DIDesc     *di_desc() { return dc; }

  void perform_full_lookup() {
    simpleLookup::perform_full_lookup_n(sd->quick_perform_arg_count()); }
  virtual nmethod* lookupNMethod();

 protected:
  void chooseCompiler();
  virtual nmethod* compileOrReuse();
  nmethod* compileNMethod();
  nmethod* doCompile(nmln* diLink);
  bool isCompilerForced();
  bool isMethodOrBlockInCompileWithSICNames();
  bool isSelectorInCompileWithSICNames(oop selector);
  bool forcedCompilerIsSIC();
  bool mustUseNIC();
  bool mustUseSIC();
  void trace(nmethod *nm);
};


class cacheProbingLookup: public compilingLookup {
 protected:
  MethodLookupKey canonical_key;

 public:
  cacheProbingLookup( oop rcvr,
                      oop sel,
                      oop dgt,
                      oop smh_or_map,
                      abstract_vframe* sendingVf, 
                      sendDesc *sd,
                      DIDesc *dc,
                      bool debug,
                      bool canReuseNM= true);

  nmethod* lookupNMethod();

 protected:
  nmethod* compileOrReuse();
  bool mightBeAbleToReuseNMethod();
  bool shouldCompileReusableNMethod(nmethod* nm);
  nmethod* findMethodToReuse();

  nmethod* probeCache();
  void    updateCache(nmethod *nm, MethodLookupKey *k = NULL);
};




// compile-time lookup types (don't generate code + other restrictions)
// used for looking up sends to be inlined
// This class is for any compiler, currently used only for the SIC

class baseCompileTimeLookup: public simpleLookup {
 protected:
  baseCompileTimeLookup(LookupType l, 
                        oop rcvr,
                        oop sel,
                        oop dgt,
                        oop mh_or_map,
                        dependencyList* dps)
    : simpleLookup(l, rcvr, sel, dgt, mh_or_map, dps) {}
  
 public:
  void perform_lookup();
  bool is_for_inlining() { return true; }

  
 protected:
  lookupTarget*     implicit_self_lookup_target() = 0;
  lookupTarget*          receiver_lookup_target();
  lookupTarget*         delegated_lookup_target();
  lookupTarget* undirected_resend_lookup_target();
  lookupTarget*   directed_resend_lookup_target();
  
  bool check_slot_for_directed_resend(slotDesc*);
};

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)


# ifdef SIC_COMPILER

class SICLookup: public baseCompileTimeLookup {
  protected:
    SCodeScope* scope;
    
  public:
    SICLookup(LookupType l,
              oop rcvr,
              oop sel,
              oop dgt,
              dependencyList* dps,
              SCodeScope* sc );

  protected:
    lookupTarget* implicit_self_lookup_target();
  };

# endif
