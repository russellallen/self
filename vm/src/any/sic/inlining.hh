#pragma once
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "types.hh"

// helper functions to support various inlining strategies, cost estimates etc.

# ifdef SIC_COMPILER



  typedef bool (*checkLocalSendFn)(stringOop sel);
  enum InlineFnType {
    NormalFn,               // normal method
    BlockArgFn,             // method with one or more block args
    BlockFn                 // block method (value, value: etc)
  };
  
  bool isCheapMessage(stringOop selector); // common and cheap message?
  bool isCheapMessage(stringOop selector, mapOop map);
  bool isReallyCheapMessage(stringOop selector, mapOop map); 
  bool isCriticalMessage(oop selector);    // "critical" for recompilation?
  bool isSmalltalkInlined(oop selector);   // msg inlined in ST-80?

  class CostParam {        // parameters of cost function
   public:
    fint localSendCost;     // local access / assign
    fint cheapSendCost;     // "cheap" send (see isCheapMessage)
    fint selfSendCost;      // implicit-self send (but not local/cheap)
    fint unknownSendCost;   // everything else
    fint blockArgPenalty;   // penalty if non-cheap/local send has block arg(s)
    fint primCallCost;      // primitive call

    CostParam(fint l, fint c, fint s, fint u, fint b, fint p) {
      localSendCost = l; cheapSendCost = c; selfSendCost = s;
      unknownSendCost = u; blockArgPenalty = b; primCallCost = p;
    }
  };

  fint methodCost(oop meth, checkLocalSendFn f, CostParam* cp,
                  fint cutoff);
    // computes estimated cost of inlining mm and its blocks
    // f is used to determine if a send is a local slot access

# ifdef SIC_COMPILER
    extern CostParam* costP;            // normal sends
    extern CostParam* failCostP;        // prim. failures

    // compute cost as estimated by the SIC
    fint sicCost(oop meth, SCodeScope* s, CostParam* cp);
# endif
  
# endif
