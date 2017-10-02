/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# include "abstract_interpreter_inline.hh"
# include "nlrSupport.hh"
# include "node.hh"
# include "prim.hh"

# ifdef SIC_COMPILER


  char* DeadBlockNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "DeadBlockTrap");
    if (printAddr) mysprintf(buf, "      p *(DeadBlockNode*)%#lx", this);
    return b;
  }

  void initDeadBlockNode() {} // nothing to do

# endif // SIC_COMPILER
