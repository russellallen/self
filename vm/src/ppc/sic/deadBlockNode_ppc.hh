# if defined(__ppc__) || defined(__powerpc__)
/* Sun-$Revision: 1.5 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// included in node.hh

  class DeadBlockNode : public PrimNode {
   public:
    static PrimDesc* non_lifo_abort;

   public:
    DeadBlockNode(PRegBList* e, SplitSig* signal)
      : PrimNode(non_lifo_abort, NULL, 1, e, signal, NULL) {}

    Node* clone(PReg* from, PReg* to);
    void gen();
  };

  void initDeadBlockNode();
# endif // __ppc__
