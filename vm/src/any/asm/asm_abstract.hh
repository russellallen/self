/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// base class for assembler (see BaseAssembler::doAddOffset)

enum OperandType {
  RegisterOperand, 
  NumberOperand,                // Just a number, not even tracked in locs()
  OopOperand,
  VMAddressOperand,             // VM address (e.g. variable), not tracked if not embedded
  PVMAddressOperand,            // address of primitive, sets IsPrimitive() in loc
  BPVMAddressOperand,           // backpatched VM addr, e.g. SendMessage_stub, sets isSendDesc() in loc
  CodeAddressOperand,           // another nmethod, also sets IsSendDesc() in loc
  DIVMAddressOperand            // for DIDescs, sets IsDIDesc() in loc
};

extern char* OperandTypeNames[];


class BaseAssembler: public ResourceObj {
public:
  pc_t instsStart;
  pc_t instsEnd;
  pc_t instsOverflow;
  
  addrDesc* locsStart;
  addrDesc* locsEnd;
  addrDesc* locsOverflow;

  pc_t   savedInsts;           // for excursions
  addrDesc* savedLocs;
  
  bool printing;
  bool isInstructions;          // used to generate instructions?
  
  pc_t lastBackpatch;
  
  BaseAssembler(int32 instsSize, int32 locsSize,
                bool printing, bool isInstructions);
  void finalize();
  
  int32 instsLen()      { return instsEnd - instsStart; }
  int32 locsLen()       { return (locsEnd - locsStart) * sizeof(addrDesc); }
  int32 len()           { return instsLen() + locsLen(); }

  void genLoc(int32 x);
  void doAddOffset(OperandType t, bool isEmbedded, int32 mask = 0);
  
  void Byte(int32);
  void Short(int32);
  void Data(int32 p, bool print = true);
  void Data(oop p, bool print = true);
  void Zero();

  void Comment(pc_t s);
  void printX(int32 x, OperandType t, bool imm = false);
  void print_disp(int32 x, OperandType t);
  
  int32 offset()                { return instsEnd - instsStart; }
  void setOffset(int32 offset)  { instsEnd = instsStart + offset; }
  
  int32 offset(pc_t a) { 
    assert(a >= instsStart && a < instsOverflow, "illegal address");
    return a - instsStart; }
  
  pc_t addr(int32 offset)      { return instsStart + offset; }
  pc_t addr()                  { return instsEnd; }

  void saveExcursion(pc_t gotoAddr) {
    savedInsts = instsEnd; savedLocs = locsEnd;
    instsEnd = gotoAddr;
  }

  void endExcursion() {
    assert(savedLocs == locsEnd, "shouldn't generate locs in excursions");
    instsEnd = savedInsts;
  }

# if GENERATE_DEBUGGING_AIDS
  LabelList* labels;

  bool initLabels() {
    labels = new LabelList(1000);
    return true;
  }

  void trackLabel(Label* l) { labels->append(l); }
  void untrackLabel(Label* l) {
    assert(labels->nth(l->id()) == l, "wrong id");
    labels->nthPut(l->id(), NULL);
  }

  bool verifyLabels();
# endif

// automated testing system: currently only for Intel -- dmu 3/6

 public:
  static bool do_the_tests;
  static void test();
 public:
  void generate_test_instructions();
 private:
  void self_test();
  void prepare_to_test();
  void assemble_test_file();
  char* get_assembled_bytes();
  void compare_results(char*);
 protected:
  void asm_lprintf(lprint_format_t msg, ...);
  void tally() {genLoc(offset()); } // for testing only
 private:
  FILE* lprintf_file;
  int32 test_file_size;
  static const char* test_file_c;
  static const char* test_file_co;
  static const char* test_file_s;
  static const char* test_file_so;
  static const char* test_file_out;
 public:
  bool is_testing() { return lprintf_file != stderr; }
};


# define Alloc(type)                                                          \
    type* data = (type*) instsEnd;                                            \
    instsEnd += sizeof(type);                                                 \
    if (instsEnd > instsOverflow) fatal("routine is too long to compile");   




# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)


