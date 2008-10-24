/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "deadBlockNode_sparc.hh"

# include "_deadBlockNode_sparc.cpp.incl"

# ifdef SIC_COMPILER


  char* DeadBlockNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "DeadBlockTrap");
    if (printAddr) mysprintf(buf, "      p *(DeadBlockNode*)%#lx", this);
    return b;
  }

  void initDeadBlockNode() {} // nothing to do

# endif // SIC_COMPILER
