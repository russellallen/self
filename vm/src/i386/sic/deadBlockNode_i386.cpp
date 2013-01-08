# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.3 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "deadBlockNode_i386.hh"

# include "_deadBlockNode_i386.cpp.incl"

# ifdef SIC_COMPILER

  PrimDesc* DeadBlockNode::non_lifo_abort;

  void initDeadBlockNode() {
    DeadBlockNode::non_lifo_abort
      = getPrimDescOfFunction(fntype(&NLRSupport::non_lifo_abort), true);
  }

# endif // SIC_COMPILER
# endif // TARGET_ARCH == I386_ARCH
