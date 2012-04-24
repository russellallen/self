/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// PcDescs map a physical PC (given as offset from start of nmethod) to
// the corresponding source scope and byte code index.

class PcDesc {
 public:
  int32 pc;
  uint16 scope;
  int16 byteCode;       // can be negative (PrologueBCI et al)

  PcDesc(int32 p, uint16 s, int16 b) { pc= p; scope= s; byteCode= b; }
  
  ScopeDesc* containingDesc(nmethod* c) {
    return c->scopes->at( scope); }
# ifdef UNUSED
  bool equals(PcDesc* p) {
    return pc == p->pc && scope == p->scope && byteCode == p->byteCode; }
# endif
  bool source_equals(PcDesc* p) {
    return scope == p->scope && byteCode == p->byteCode; }
  void print(nmethod* c);
  bool verify(nmethod* c);
};

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
