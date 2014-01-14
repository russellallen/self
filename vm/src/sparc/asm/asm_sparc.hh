/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma interface

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


const int32 maxImmediate = lowMask;
const int32 maxOffset = maxImmediate;
const int32 maxBranch = nthMask(21) << 2;


inline bool isImmediate(smiOop value) {
  return (int)value < maxImmediate && (int)value > -maxImmediate;
}

enum CondType {
  NEVER, EQ, LE, LT, LEU, CS, NEG, VS,
  ALWAYS, NE, GT, GE, GTU, CC, POS, VC,
  LTU = CS, GEU = CC
  };

extern char* CondNames[];

struct Assembler: BaseAssembler {
  Assembler(int32 instsSize, int32 locsSize,
            bool pr, bool isInstrs)
    : BaseAssembler(instsSize, locsSize, pr, isInstrs) {}

  int32 BranchOffset(int32 o) { return o - offset(); }

  inline void assemble(uint32 instr);
  inline void addOffset(OperandType t, bool isEmbedded = false,
                        bool isDelay = false);
  inline void SetHiX(int32 s, OperandType t, Location d); // sets bits [13..31]
  inline void SetHiX2(int32 s, OperandType t, Location d); // sets bits [10..31]
  inline void CallX(int32 s, OperandType t);
  inline void ArithR(char* name, fint op, fint op3,
                     Location s1, Location s2, Location d);
  inline void ArithX(char* name, fint op, fint op3, Location s1,
                     int32 s2, OperandType t, bool noSetHi, Location d);
  inline void TccR(CondType t, Location s1, Location s2);
  inline void TccX(CondType t, Location s1, int32 s2, OperandType ot, bool noSetHi);
  inline void ReadPC(Location d);
  inline void Bcc(CondType t, Label* target, bool annul);
  inline Label* BccForward(CondType t, bool annul);
  inline void Backpatch(char* instr, char* target);

#   define ExpandSetHiXTemplates(template)                                    \
      template(I, int32, NumberOperand)                                       \
      template(O, oop,   OopOperand)                                          \
      template(A, void*, VMAddressOperand)                                    \
      template(P, void*, PVMAddressOperand)                                   \
      template(C, void*, CodeAddressOperand)                                  \
      template(D, void*, DIVMAddressOperand)                                  \


#   define DeclareSetHiXTemplate(X, type, dataType)                           \
      inline void CONC(SetHi,X)(type, Location);

#   define DefineSetHiXTemplate(X, type, dataType)                            \
      inline void Assembler::CONC(SetHi,X)(type s, Location d) {              \
        SetHiX((int32)s, dataType, d); }

    ExpandSetHiXTemplates(DeclareSetHiXTemplate)

#   define DeclareSetHiX2Template(X, type, dataType)                          \
      inline void CONC3(SetHi,X,2)(type, Location);

#   define DefineSetHiX2Template(X, type, dataType)                           \
      inline void Assembler::CONC3(SetHi,X,2)(type s, Location d) {           \
        SetHiX((int32)s, dataType, d); }

    ExpandSetHiXTemplates(DeclareSetHiX2Template)


#   define ExpandCallXTemplates(template)                                     \
      template(A,   VMAddressOperand)                                         \
      template(P,  PVMAddressOperand)                                         \
      template(C, CodeAddressOperand)                                         \
      template(B, BPVMAddressOperand)                                         \
      template(D, DIVMAddressOperand)                                         \
      template(N,      NumberOperand) /* for indexed branch */

#   define DeclareCallXTemplate(X, type)                                      \
      inline void CONC(Call,X)(void* s);

#   define DefineCallXTemplate(X, type)                                       \
      inline void Assembler::CONC(Call,X)(void* s) {                          \
        CallX((int32)s, type); }

    ExpandCallXTemplates(DeclareCallXTemplate)


#   define ExpandArithXTemplates(template,           Name, name, op, op3)      \
      template(I,  int32, NumberOperand,      false, Name, name, op, op3)      \
      template(O,  oop,   OopOperand,         false, Name, name, op, op3)      \
      template(LO, oop,   OopOperand,         true,  Name, name, op, op3)      \
      template(A,  void*, VMAddressOperand,   false, Name, name, op, op3)      \
      template(C,  void*, CodeAddressOperand, false, Name, name, op, op3)      \
      template(P,  void*, PVMAddressOperand,  false, Name, name, op, op3)      \
      template(B,  void*, BPVMAddressOperand, false, Name, name, op, op3)      \
      template(D,  void*, DIVMAddressOperand, false, Name, name, op, op3) 

#   define DeclareArithXTemplate(X, type, dataType, noSetHi, Name, name, op, op3) \
      inline void CONC(Name,X)(Location s1, type s2, Location d);

#   define DefineArithXTemplate(X, type, dataType, noSetHi, Name, name, op, op3) \
      inline void Assembler::CONC(Name,X)(Location s1, type s2, Location d) { \
        ArithX(name, op, op3, s1, (int32)s2, dataType, noSetHi, d); }

#   define ExpandArithRTemplates(template)                                    \
      template(Load,    "load",    03, 000)                                   \
      template(Store,   "store",   03, 004)                                   \
      template(StoreD,  "stored",  03, 007)                                   \
      template(LoadUB,  "loadub",  03, 001)                                   \
      template(LoadSB,  "loadsb",  03, 011)                                   \
      template(StoreB,  "storeb",  03, 005)                                   \
      template(Add,     "add",     02, 000)                                   \
      template(AddCC,   "addcc",   02, 020)                                   \
      template(TAddCC,  "taddcc",  02, 040)                                   \
      template(Sub,     "sub",     02, 004)                                   \
      template(SubCC,   "subcc",   02, 024)                                   \
      template(TSubCC,  "tsubcc",  02, 041)                                   \
      template(MulsCC,  "mulscc",  02, 044)                                   \
      template(And,     "and",     02, 001)                                   \
      template(AndCC,   "andcc",   02, 021)                                   \
      template(AndN,    "andn",    02, 005)                                   \
      template(AndNCC,  "andncc",  02, 025)                                   \
      template(Or,      "or",      02, 002)                                   \
      template(OrCC,    "orcc",    02, 022)                                   \
      template(OrN,     "orn",     02, 006)                                   \
      template(OrNCC,   "orncc",   02, 026)                                   \
      template(Xor,     "xor",     02, 003)                                   \
      template(XorCC,   "xorcc",   02, 023)                                   \
      template(Nxor,    "nxor",    02, 007)                                   \
      template(NxorCC,  "nxorcc",  02, 027)                                   \
      template(Sll,     "sll",     02, 045)                                   \
      template(Srl,     "srl",     02, 046)                                   \
      template(Sra,     "sra",     02, 047)                                   \
      template(Save,    "save",    02, 074)                                   \
      template(Restore, "restore", 02, 075)                                   \
      template(JmpL,    "jmpl",    02, 070)                                   \

#   define DeclareArithRTemplate(Name, name, op, op3)                         \
      inline void CONC(Name,R)(Location s1, Location s2, Location d);         \
      ExpandArithXTemplates(DeclareArithXTemplate, Name, name, op, op3)

#   define DefineArithRTemplate(Name, name, op, op3)                          \
      inline void Assembler::CONC(Name,R)                                     \
                                   (Location s1, Location s2, Location d) {   \
                                      ArithR(name, op, op3, s1, s2, d); }     \
    ExpandArithXTemplates(DefineArithXTemplate, Name, name, op, op3)

    ExpandArithRTemplates(DeclareArithRTemplate)

    inline void Nop();

# ifdef SIC_COMPILER
    void Unimp(fint n, bool shouldRestart);
# endif


#   define DefineTccTemplate(Name, cond)                                      \
      inline void Assembler::CONC(Name,R)(Location s1, Location s2) {         \
        TccR(cond, s1, s2); }                                                 \
      inline void Assembler::CONC(Name,I)(Location s1, int32 s2) {            \
        TccX(cond, s1, s2, NumberOperand, false); }

#   define DeclareTccTemplate(Name, cond)                                     \
      inline void CONC(Name,R)(Location s1, Location s2);                     \
      inline void CONC(Name,I)(Location s1, int32    s2);

#   define ExpandTccTemplates(template)                                       \
      template(Trap, ALWAYS)                                                  \
      template(Teq,  EQ)                                                      \
      template(Tne,  NE)                                                      \
      template(Tlt,  LT)                                                      \
      template(Tle,  LE)                                                      \
      template(Tge,  GE)                                                      \
      template(Tgt,  GT)                                                      \
      template(Tltu, LTU)                                                     \
      template(Tleu, LEU)                                                     \
      template(Tgeu, GEU)                                                     \
      template(Tgtu, GTU)                                                     \
      template(Tvs,  VS)                                                      \
      template(Tvc,  VC)                                                      \
      template(Tcs,  CS)                                                      \
      template(Tcc,  CC)

    ExpandTccTemplates(DeclareTccTemplate)

#   define DefineBccTemplate(Name, cond)                                      \
      inline void  Assembler::Name(Label* l, bool annul) {                    \
        Bcc(cond, l, annul); }                                                \
      inline Label* Assembler::CONC(Name,Forward)(bool annul) {               \
        return BccForward(cond, annul); }

#   define DeclareBccTemplate(Name, cond)                                     \
      inline void   Name(Label* l, bool annul);                               \
      inline Label* CONC(Name,Forward)(bool annul);

#   define ExpandBccTemplates(template)                                       \
      template(Bra,  ALWAYS)                                                  \
      template(Beq,  EQ)                                                      \
      template(Bne,  NE)                                                      \
      template(Blt,  LT)                                                      \
      template(Ble,  LE)                                                      \
      template(Bge,  GE)                                                      \
      template(Bgt,  GT)                                                      \
      template(Bltu, LTU)                                                     \
      template(Bleu, LEU)                                                     \
      template(Bgeu, GEU)                                                     \
      template(Bgtu, GTU)                                                     \
      template(Bvs,  VS)                                                      \
      template(Bvc,  VC)                                                      \
      template(Bcs,  CS)                                                      \
      template(Bcc,  CC)                                                             

    ExpandBccTemplates(DeclareBccTemplate)

#   ifdef SIC_COMPILER
      // for statistics
      void startTypeTest(fint ncases, bool prologueCheck, bool immedOnly);
      void doOneTypeTest();
      void endTypeTest();
      void markTagTest(fint nvalues, bool intArith = false);
#   endif

  };
  
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
