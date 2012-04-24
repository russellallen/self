/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// included in node.hh

  class DeadBlockNode : public PNode {
   public:
    DeadBlockNode(PRegBList* e, SplitSig* signal) {
     Unused(e); Unused(signal);
   }

    Node* clone(PReg* from, PReg* to);
    void gen();
    void markAllocated(fint* use_count, fint* def_count) {
      Unused(use_count); Unused(def_count); }
    bool hasSideEffects()      { return true; }
    char* print_string(char* buf, bool printAddr = true);
  };

  void initDeadBlockNode();
