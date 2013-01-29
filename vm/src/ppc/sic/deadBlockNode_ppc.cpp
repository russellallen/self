# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 1.5 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "deadBlockNode_ppc.hh"

# include "_deadBlockNode_ppc.cpp.incl"

# ifdef SIC_COMPILER

  PrimDesc* DeadBlockNode::non_lifo_abort;

  void initDeadBlockNode() {
    DeadBlockNode::non_lifo_abort
      = getPrimDescOfFunction(fntype(&NLRSupport::non_lifo_abort), true);
  }

# endif // SIC_COMPILER
# endif // TARGET_ARCH == PPC_ARCH
