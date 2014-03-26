/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

 
# include "abstract_interpreter_inline.hh"
# include "asm_inline.hh"
# include "fcompiler.hh"
# include "label_inline.hh"

 
# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


bool BaseAssembler::do_the_tests = false;
const char* BaseAssembler::test_file_c   = "asm_test.c";
const char* BaseAssembler::test_file_co  = "asm_test.o";
const char* BaseAssembler::test_file_s   = "asm_test_asm.s";
const char* BaseAssembler::test_file_so  = "asm_test_asm.o";
const char* BaseAssembler::test_file_out = "asm_test_out";


BaseAssembler::BaseAssembler(int32 instsSize, int32 locsSize,
                             bool pr, bool isMain) {
  instsStart    = instsEnd =  NEW_RESOURCE_ARRAY( char, instsSize);
  instsOverflow = instsStart + instsSize;
  locsStart = locsEnd = (addrDesc*) NEW_RESOURCE_ARRAY( char, locsSize);
  locsOverflow = (addrDesc*) ((pc_t) locsStart + locsSize);
  printing = pr; isInstructions = isMain;
  if (isMain) {
    assert(theAssembler == NULL, "forgot to reset theAssembler");
    theAssembler = (Assembler*)this;
    currentLabelID = 0;
  }
  assert(initLabels(), "init label verification");
  lastBackpatch = 0;
  
  lprintf_file = stderr;
}


void BaseAssembler::printX(int32 d, OperandType t, bool imm) {
  if (imm) {
    if (d < 0)  asm_lprintf("%d",  d); 
    else        asm_lprintf("%#x", d);
    return;
  }
  if (t == RegisterOperand)
    lprintf("%s", RegisterNames[d]);
  else print_disp(d, t);
}


void BaseAssembler::print_disp(int32 d, OperandType t) {
  switch (t) {
   case RegisterOperand:
    lprintf("");
    break;
   case NumberOperand:
    lprintf("#%ld", d);
    break;
   case OopOperand:
    lprintf("0x%lx", d);
    if (oop(d)->is_smi()) {
      lprintf(" (%ld)",  smiOop(d)->value());
    } else if (oop(d)->is_float()) {
      lprintf(" (%g)", floatOop(d)->value());
    } else if (oop(d)->is_string()) {
      lprintf(" ('");
      stringOop(d)->string_print();
      lprintf("')");
    }
    break;
   case VMAddressOperand:
    lprintf("0x%lx <%s>", d, getPrimName((pc_t)d));
    break;
   case PVMAddressOperand:
    lprintf("0x%lx <%s> (p)", d, getPrimName((pc_t)d));
    break;
   case BPVMAddressOperand:
    lprintf("0x%lx <%s> (bp)", d, getPrimName((pc_t)d));
    break;
   case CodeAddressOperand: {
    nmethod * nm = nmethod::nmethodContaining((pc_t) d, NULL);
    lprintf("0x%lx <%s>", d, nm->key.selector_string());
    break; }
   case DIVMAddressOperand:
    lprintf("0x%lx <%s> (di)", d, getPrimName((pc_t)d));
    break;
   default:
    ShouldNotReachHere();
  }
}


const char* OperandTypeNames[] = {
  "RegisterOperand",
  "NumberOperand",
  "OopOperand",
  "VMAddressOperand",
  "PVMAddressOperand",
  "CodeAddressOperand",
  "DIVMAddressOperand"
  };
  
  

void BaseAssembler::genLoc(int32 x) {
  assert(sizeof(addrDesc) == sizeof(int32), "change this code");
  int32* p = (int32*)locsEnd;
  *p = x;
  locsEnd++;
  if (locsEnd >= locsOverflow) fatal("routine is too long to compile");
}

void BaseAssembler::doAddOffset(OperandType t, bool isEmbedded,
                                int32 mask) {
  if (is_testing())  return; // use locs for testing
                                  
  mask |= offset();
  switch (t) {
   case    RegisterOperand:  break;
   case      NumberOperand:  break;
   case         OopOperand:  break;
   case   VMAddressOperand:  break;
   case  PVMAddressOperand:  mask |= addrDesc::isPrimitiveMask;  break;
   case BPVMAddressOperand:  mask |= addrDesc::isSendDescMask;   break;
   case CodeAddressOperand:  mask |= addrDesc::isSendDescMask;   break;
   case DIVMAddressOperand:  mask |= addrDesc::isDIDescMask;     break;
  }
  if (isEmbedded) {
    mask |= addrDesc::isEmbeddedMask;
  } 
  genLoc(mask);
}

# if GENERATE_DEBUGGING_AIDS  // for gdb convenience
void printAsm() { theAssembler->printing = true; }

bool BaseAssembler::verifyLabels() {
  for (fint i = labels->length() - 1; i >= 0; i--) {
    Label* l = labels->nth(i);
    if (l && l->patch && !l->isDefined()) {
      error1("Label %#lx: referenced but not defined", l);
    }
  }
  return true;
}
# endif

// Automated testing:

void BaseAssembler::test() {
  Assembler* a = new Assembler(
    10000000, 10000000, true, true);
  a->self_test();
}    

# include <stdarg.h>

void BaseAssembler::asm_lprintf(lprint_format_t msg, ...) {
  va_list ap;
  va_start(ap, msg);
  
  if (lprintf_file == stderr)    vlprintf(msg, ap);
  else                           vfprintf(lprintf_file, msg, ap);
  va_end(ap);
}


void BaseAssembler::self_test() {
  prepare_to_test(); // need to do .origin
  ((Assembler*)this)->generate_test_instructions();
  assemble_test_file();
  compare_results(get_assembled_bytes());
  finalize();
  printf("The assembler looks good.\n");
}


static const char *underscoreOrNot =
  TARGET_OS_VERSION == LINUX_VERSION  ?  ""  :  "_";

void BaseAssembler::prepare_to_test() {
  lprintf_file = fopen(test_file_s, "w");
  asm_lprintf(" /*.org %d*/\n .globl %sstart\n %sstart: \n", instsStart,
	underscoreOrNot, underscoreOrNot);
  FILE *f = fopen(test_file_c, "w");
  fprintf(f,
   "int main() {\n"
      "\t extern char start, end; \n"
      "\t write(1, &start, &end - &start); \n"
    "} \n");
  fclose(f);    
}

void BaseAssembler::assemble_test_file() {
  asm_lprintf(".globl %send\n %send: \n", underscoreOrNot, underscoreOrNot);
  fclose(lprintf_file);
  lprintf_file = stderr;
  char buf[1000];
  sprintf(buf, "cc -c %s; cc %s -c %s; cc %s %s; ./a.out>%s", 
    test_file_c,
    # if TARGET_OS_VERSION == LINUX_VERSION
	"",
    # else
	"-arch i386",
    # endif
    test_file_s, test_file_co, test_file_so, test_file_out);
  lprintf( "Testing assembler by running: %s\n", buf);
  int ret = system(buf);
  if(ret != 0) {
    fprintf(stderr, "Cannot run command `%s'", buf);
    exit(ret);
  }
}


char* BaseAssembler::get_assembled_bytes() {
  int fd = open(test_file_out, O_RDONLY, 0);
  if (fd == -1) {
    perror("open test file");
    fatal("testing");
  }
  test_file_size = lseek(fd, 0, SEEK_END); lseek(fd, 0, SEEK_SET);
  char* buf = new char[test_file_size];
  for (int i = 0, r = 0;  i < test_file_size; i += r) {
    r = read(fd, buf + i, test_file_size - i);
    if (r <= 0)  { perror("read"); fatal("read"); }
  }
  close(fd);
  return buf;
}

void BaseAssembler::compare_results(char* buf) {
  int n = min(instsLen(), test_file_size);
  for (int i = 0;  i < n;  ++i)
    if (buf[i] != instsStart[i]) {
      addrDesc* j;
      for ( j = locsStart;  j->offset() <= i;  ++j)
        if (j >= locsEnd)  fatal("could not find loc, perhaps forgot to tally() after test instruction");
      fatal5("assembler flunked at byte %d, instruction %d, started at %d\n"
      "x/i 0x%x\nx/i 0x%x", 
      i, j - locsStart - 1, j[-1].offset(), buf + j[-1].offset(), instsStart + j[-1].offset());
    }
  if (instsLen() != test_file_size)
    fatal2("Self assembler generated %d bytes, but Unix assembler generated %d bytes\n",
           instsLen(), test_file_size);
}

// override me
void BaseAssembler::generate_test_instructions() {fatal("no automated tests for this platform");}


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

