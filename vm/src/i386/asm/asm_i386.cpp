# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "asm_i386.hh"
# pragma implementation "asm_inline_i386.hh"  
  
# include "_asm_i386.cpp.incl"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


Assembler* theAssembler;      // current assembler for instructions
  

Assembler::Assembler(int32 instsSize, int32 locsSize, bool pr, bool isInstrs)
  : BaseAssembler(instsSize, locsSize, pr, isInstrs) {
  
  if (bootstrapping)
    return;  // zone does not exist yet
    
  pc_t buf_lo  = instsStart,
       buf_hi  = instsOverflow,
       zone_lo = Memory->code->code_start(), // warning counts on order of iZone and stubs
       zone_hi = Memory->code->code_end();
       
}



  
# ifdef SIC_COMPILER
    void Assembler::unimp(fint n, bool shouldRestart) {
      ud2();
      // add an addrDesc for the unimp instruction so they're easier to find
      int32 mask = offset();
      genLoc(mask | addrDesc::isUncommonTrapMask);
      if (shouldRestart) n |= UncommonRestartBit;
      Data(n);
    }
# endif

// Testing helpers:


static void untested_helper(char* m1, char* m2) {
  lprintf("untested generated code: %s %s\n", m1, m2);  breakpoint();
}


void Assembler::_Untested(const char* m1, const char* m2) {
  // don't use eax, is receiver
  // preserve eax  
  if (!SpendTimeForDebugging)
    return;
    
  bool p = printing;
  if (printing) {
    printing = false;
    asm_lprintf("assembling: %s %s\n", m1, m2);
  }
  pushl(eax);
  pushl(ebx);
  pushl(ecx);
  pushl(edx);
  enter(0);
  andl(~15, NumberOperand, esp);
  leal(esp, -8, NumberOperand, esp);
  pushl((int32)m2, VMAddressOperand);
  pushl((int32)m1, VMAddressOperand);
  // use indirect call to be safe, avoid need to reloc relative dest
  leal(no_reg, (int32)first_inst_addr(untested_helper), VMAddressOperand, eax);
  call(eax);
  leave();
  popl(edx);
  popl(ecx);
  popl(ebx);
  popl(eax);
  printing = p;
}


// General helpers:

void Assembler::printR(RegSize rs, Location r, char* ps) {
  if (printing) asm_lprintf("%s%s", RegisterNamesBySize[rs][r], ps);
}


# if TARGET_OS_VERSION == MACOSX_VERSION  &&  OSX_ASM_RELEASE == PRE_2007_OSX_ASM_RELEASE
  static const bool earlierGCC = true;
# else
  static const bool earlierGCC = false;
# endif


void Assembler::printRM( RegSize rs, Location r, int32 d, OperandType t, Location index, Scale s, char* ps, bool is_call) {
  if (!printing) return;
  if ( t == RegisterOperand ) {
    printR(rs, r, ps);
    return;
  }
  if ( r == no_reg  &&  index == no_reg )   {
    if ( is_call )  asm_lprintf("*");
    printRM_disp(d, t);
    asm_lprintf("%s", ps);
    return;
  }

  if  ( is_call && !earlierGCC )
    asm_lprintf("*");
  if ( d != 0  ||  t != NumberOperand )
    printRM_disp(d, t);
  asm_lprintf("(");
  printR(long_reg, r, "");
  if (index != no_reg)
    asm_lprintf(", %s, %d", RegisterNames[index], 1 << (int)s);
  asm_lprintf(")%s", ps);
}


void Assembler::printRM_disp(int32 d, OperandType t) {
  if (is_testing()) asm_lprintf("0x%x", d);
  else              print_disp(d, t);
}


void Assembler::printDest( int32 dest, OperandType t, Label* L ) {
  if (!printing)  return;
  if (is_testing()) {
    assert(L == NULL, "cannot test labels (yet)");
    int32 relDot = dest - int32(instsEnd);
    asm_lprintf(". %c %d", relDot < 0 ? '-' : '+', abs(relDot));
 }
 else if (L != NULL)
   asm_lprintf("L%d%c", L->id(),  L->isDefined() ? 'b' : 'f');
 else
   print_disp(dest, t);
 asm_lprintf("\n");
} 


void Assembler::printImm( int32 imm, OperandType t, char* ps) {
  if (!printing)    return;
  if (is_testing()) asm_lprintf("$0x%x", imm);
  else            { asm_lprintf("$");  print_disp(imm, t);  }
  asm_lprintf("%s", ps);             
}


void Assembler::addOffset(OperandType t, bool isEmbedded, bool isRelative) {
  if (t == NumberOperand)
    ;
  else if (t == VMAddressOperand  &&  !isRelative)
    ; // don't need a location unless relative
  else
   doAddOffset(t, isEmbedded, (isRelative ? addrDesc::isRelativeMask : 0));
}




void Assembler::base_disp_reg( 
    RegSize rs,
    Location reg_operand, 
    Location base_reg, int32 disp, OperandType t, Location index_reg, Scale scale,
    char* suffix,
    bool is_call ) {
    
  assert(index_reg != esp, "esp cannot be index in i386");
  printRM( rs,  base_reg, disp, t, index_reg, scale, suffix, is_call);
    
  if (disp == 0)
    switch(t) {
     default: break;
     case RegisterOperand:
      reg_reg(reg_operand, base_reg, index_reg, scale);
      return;
     case   NumberOperand:  
      if ((base_reg == ebp || base_reg == no_reg) &&  index_reg != no_reg)
        break; // hole in the map to allow for scaled-index + disp32, not noDisp
      base_noDisp_reg(reg_operand, base_reg, index_reg, scale);
      return;
    }

  if (is_disp8(disp, t)  &&   base_reg != no_reg)
    return numberBase_disp8_reg(reg_operand, base_reg, disp, index_reg, scale);

  if (base_reg == no_reg  &&  index_reg == no_reg) {
    mod_rm_reg(0, 5, reg_operand);
  }
  else if ( index_reg == no_reg ) {
    mod_rm_reg(2, base_reg, reg_operand);
    if (base_reg == esp) {
      sib(0, 4, esp);
    }
  }
  else if ( base_reg == no_reg ) {
    mod_rm_reg(0, (Location)4, reg_operand);
    sib(scale, index_reg, (Location)5);
  }
  else {
    mod_rm_reg(2, (Location)4, reg_operand);
    sib(scale, index_reg, base_reg);
  }
  addOffset(t, true, false);
  Data(disp, false);
}




void Assembler::numberBase_disp8_reg(Location reg_operand, Location base_reg, int32 disp, Location index_reg, Scale scale) {

  if (base_reg == no_reg) {
    assert(index_reg != no_reg, "???");
    mod_rm_reg(1, (Location)4, reg_operand);
    sib(scale, index_reg, (Location)5);
  }
  else if (index_reg != no_reg) {
    mod_rm_reg(1, 4, reg_operand);
    sib(int32(scale), index_reg, base_reg);
  }
  else if (base_reg == esp) {
    mod_rm_reg(1, 4, reg_operand);
    sib(0, 4, esp);
  }
  else {
    mod_rm_reg(1, base_reg, reg_operand);
  }
  Byte(disp);
}




// See Vol 2A 2-7 pp 37 of IA-32 Intel Architecture Software Developer's Manual

void Assembler::base_noDisp_reg( Location reg_operand, Location base_reg, Location index_reg, Scale scale ) {
  if (index_reg != no_reg) {
    mod_rm_reg(0, (Location)4, reg_operand);
    sib(int32(scale), index_reg, base_reg);
    return;
  }
  switch (base_reg) {
   default: fatal("???");
   
   case no_reg: fatal("no displacement or base");
   case esp:
     mod_rm_reg(0, 4, reg_operand);
     sib(0, 4, esp);
     break;
     
   case ebp:
     mod_rm_reg(1, ebp, reg_operand);
     Byte(0); // disp 8
     break;
     
   case eax: case ecx: case ebx: case edx: case esi: case edi:
     mod_rm_reg(0, base_reg, reg_operand);
     break;
  }
}


void Assembler::reg_reg(Location reg_operand, Location rm_reg,  Location index_reg, Scale scale) {
  assert(index_reg == no_reg, "???");
  mod_rm_reg(3, rm_reg, reg_operand);
}





// Jumps



void Assembler::word_branch_target(int32 dest, OperandType t, Label* L) {
  assert(L == NULL  ||  dest == 0  &&  t == NumberOperand, "???");
  if (L == NULL)
    ;
  else if (L->isDefined()) {
    dest = (int32)L->target();
    t = NumberOperand;
  }
  else {
    dest = 0;
    L->unify(new Label(printing, addr()));
    t = NumberOperand;
  }
  addOffset(t, true, true);
  int32 rel = dest - (int32(instsEnd) + sizeof(int32));
  Data(rel, false);
}


void Assembler::std_jmp_or_loop(char* j_or_loop, char* ccs, int32 op8, int32 op32, int32 dest, OperandType disp_type, Label* L, bool add_0f_prefix) {
  if (printing)  {
    asm_lprintf("%s%s ", j_or_loop, ccs);
  }
  int32 rel8 = (L == NULL  ?  dest  :  (int32)L->target() )  -  ((int32)instsEnd + 2);
  
  if ( L == NULL  &&  is_disp8( rel8, disp_type)  &&  op8 != -1) {
    if (printing) {
      asm_lprintf(
       	   !is_testing() ? "<byte> "  
        :  TARGET_OS_VERSION == LINUX_VERSION  ?  ""  :  "/* byte */");
      printDest(dest, disp_type, L);
    }
    Byte(op8);
    Byte(rel8);
  }
  else if (op32 != -1) {
    printDest(dest, disp_type, L);
    if (add_0f_prefix)
      Byte(0x0f);
    Byte(op32);
    word_branch_target(dest, disp_type, L);
  }  
  else fatal("not in I386");
}


void Assembler::jcc( char* ccs, jump_conds::conds cc, jump_ops::ops op, int32 d, OperandType t, Label* L) {
  std_jmp_or_loop("j", ccs, 0x70 | op, 0x80 | op, d, t, L);
}



void Assembler::call( int32 dest, OperandType t, Label* L ) {
  if (printing) {
    asm_lprintf("call ");
    printDest(dest, t, L);
  }
  Byte(opcd_ImmCall);
  word_branch_target(dest, t, L);
}


void Assembler::jmp(   int32 d, OperandType t, Label* L ) { std_jmp_or_loop(   "j",   "mp", 0xeb, 0xe9, d, t, L, false); }
void Assembler::jecxz( int32 d, OperandType t, Label* L ) { std_jmp_or_loop(   "j", "ecxz", 0xe3,   -1, d, t, L       ); }
void Assembler::loop(  int32 d, OperandType t, Label* L ) { std_jmp_or_loop("loop",     "", 0xe2,   -1, d, t, L       ); }
void Assembler::loope( int32 d, OperandType t, Label* L ) { std_jmp_or_loop("loop",    "e", 0xe1,   -1, d, t, L       ); }
void Assembler::loopne(int32 d, OperandType t, Label* L ) { std_jmp_or_loop("loop",   "ne", 0xe0,   -1, d, t, L       ); }


# define J(cond) \
 void Assembler::CONC(j,cond)( int32 d, OperandType t, Label* L ) { \
   jcc(STR(cond), jump_conds::cond, jump_ops::cond, d, t, L); \
 } 
 
 
# define T(name) \
 void Assembler::name( Label* L ) { \
   name( 0, NumberOperand, L ); \
 }
 
J(a) J(ae) J(b) J(be) J(c) J(e) J(g) J(ge) J(l) J(le) J(na) J(nae) J(nb) J(nbe) J(nc)
J(ne) J(ng) J(nge) J(nl) J(nle) J(no) J(np) J(ns) J(nz) J(o) J(p) J(pe) J(po) J(s) J(z)

T(ja) T(jae) T(jb) T(jbe) T(jc) T(je) T(jg) T(jge) T(jl) T(jle) T(jna) T(jnae) T(jnb) T(jnbe) T(jnc)
T(jne) T(jng) T(jnge) T(jnl) T(jnle) T(jno) T(jnp) T(jns) T(jnz) T(jo) T(jp) T(jpe) T(jpo) T(js) T(jz)

T(jmp) T(jecxz) T(call)
T(loop) T(loope) T(loopne)

# undef J
# undef T



void Assembler::call( Location base, int32 disp, OperandType t, Location index_reg, Scale s) {
  if  (printing)  asm_lprintf("call ");
  Byte(0xff);
  base_disp_reg(long_reg, Location(2), base, disp, t, index_reg, s, "\n", true);
}

void Assembler::jmp(Location base, int32 disp, OperandType t, Location index_reg, Scale s) {
  if  (printing)  asm_lprintf("jmp ");
  Byte(0xff);
  base_disp_reg(long_reg, Location(4), base, disp, t, index_reg, s, "\n", true);  
}



// ADD-like instructions

// helpers:

bool Assembler::do_special_shifts(int32 op_imm_rm, int32 imm) {
  if ((op_imm_rm & ~1) != 0xc0)                                   return false;
  if (imm == 1                 ) { Byte(0xd0 | (op_imm_rm & 1));  printImm(1, NumberOperand, ", "); return true; }
  if (imm == shift_by_count_reg) { Byte(0xd2 | (op_imm_rm & 1));  printR(     byte_reg, ecx, ", "); return true; }
                                                                  return false;
} 


void Assembler::like_add8_imm(char* name, int32 imm, Location dst_reg, int32 dst_disp, OperandType dt, 
               Location index, Scale s, int32 op_imm8_al, int32 op_imm8_rm8, int32 opExt) {
  if (printing)
    asm_lprintf("%sb ", name);
    
  if (do_special_shifts(op_imm8_rm8, imm)) {
      base_disp_reg( byte_reg, Location(opExt), dst_reg, dst_disp, dt, index, s, "\n");
      return;
  }

  printImm(imm, NumberOperand, ", ");

  if (dst_reg == eax  &&  dt == RegisterOperand  &&  op_imm8_al != -1) {
    Byte(op_imm8_al);
    printR(byte_reg, dst_reg, "\n");
  }
  else if (dt == RegisterOperand  && op_imm8_rm8 == 0xc6) { /* mov */
    Byte(0xb0 + dst_reg);
    printR(byte_reg, dst_reg, "\n");
  }
  else {
    assert(op_imm8_rm8 != -1, "should not be here");
    Byte(op_imm8_rm8);
    base_disp_reg(byte_reg,  Location(opExt), dst_reg, dst_disp, dt, index, s, "\n");
  }
  assert(0 <= imm  &&  imm < 256, "imm range");
  Byte(imm);
}


void Assembler::like_add32_imm(char* name, int32 imm, OperandType st,
                               Location dst_reg, int32 dst_disp, OperandType dt,
                               Location index, Scale s, int32 op_imm32_eax, int32 op_imm8_rm32, int32 op_imm32_rm32, int32 opExt ) {
  if (printing)
    asm_lprintf("%sl ", name);

  if (do_special_shifts(op_imm8_rm32, imm)) {
      base_disp_reg( long_reg, Location(opExt), dst_reg, dst_disp, dt, index, s, "\n");
      return;
  }
  printImm(imm, st, ", ");
  if ( is_disp8(imm, st) &&  op_imm8_rm32 != -1) {
    Byte(op_imm8_rm32);
    base_disp_reg( long_reg, Location(opExt), dst_reg, dst_disp, dt, index, s, "\n");
    Byte(imm);
    return;
  }
  
  if (dt == RegisterOperand  &&  dst_reg == eax  &&  op_imm32_eax != -1) {
    printR(long_reg, dst_reg, "\n");
    Byte(op_imm32_eax);
  }
  else if (dt == RegisterOperand  &&  op_imm32_rm32 == 0xc7) { /* mov */
    printR(long_reg, dst_reg, "\n");
    Byte(0xb8 + dst_reg);
  }
  else {
    assert(op_imm32_rm32 != -1, "should not be here");
    Byte(op_imm32_rm32);
    base_disp_reg( long_reg, Location(opExt), dst_reg, dst_disp, dt, index, s, "\n");
  }
  addOffset(st, true, false);
  Data(imm, false);
}  


static inline bool gcc_optimizes_mov(int32 op) {
  return !earlierGCC
      || (op & 1); // earlier gcc only optimizes movl, not movb
}

void Assembler::like_add_r_rm(char* name, char bOrL, Location src, Location dst_base, int32 dst_disp, OperandType dt, Location index, Scale s, int32 op) {
  if (printing)   asm_lprintf("%s%c ", name, bOrL);
  printR(bOrL == 'l' ? long_reg : byte_reg,  src, ", ");
  // mov has special codes for just disp
  if ( (op & ~1) == 0x88  &&  dst_base == no_reg  &&  index == no_reg  &&  src == eax  &&  gcc_optimizes_mov(op) ) {
    // movb moffs8, al
    // movl moffs32, eax
    Byte(0xa2 | (op & 1));
    addOffset(dt, true, false);
    Data(dst_disp, false);
    printRM(bOrL == 'l' ? long_reg : byte_reg, dst_base, dst_disp, dt, index, s, "\n");
  }
  else {
    assert(op != -1, "should not be here");
    Byte(op);
    base_disp_reg(bOrL == 'l' ? long_reg : byte_reg, src, dst_base, dst_disp, dt, index, s, "\n");
  }
}


void Assembler::like_add_rm_r(char* name, char bOrL, Location src_base, int32 src_disp, OperandType st, Location index, Scale s, Location dst, int32 op) {
  if (printing)  asm_lprintf("%s%c ", name, bOrL);
  // mov has special codes for just disp
  if ( (op & ~1) == 0x8a  &&  src_base == no_reg  &&  index == no_reg  &&  dst == eax  &&  gcc_optimizes_mov(op) ) {
    // movb moffs8, al
    // movl moffs32, eax
    Byte(0xa0 | (op & 1));
    addOffset(st, true, false);
    Data(src_disp, false);
    printRM(bOrL == 'l' ? long_reg : short_reg, src_base, src_disp, st, index, s, ", ");
  }
  else {
    assert(op != -1, "should not be here");
    Byte(op);
    base_disp_reg(bOrL == 'l' ? long_reg : byte_reg, dst, src_base, src_disp, st, index, s, ", ");
  }
  printR(bOrL == 'l' ? long_reg : byte_reg, dst, "\n");
}


// Other instructions


void  Assembler::pushl(int32 src_imm, OperandType disp_type) {
  if (printing) {
    asm_lprintf("pushl ");
    printImm(src_imm, disp_type, "\n");
  }
  if (is_disp8(src_imm, disp_type)) {
    Byte(0x6a);
    Byte(src_imm);
  }
  else {
    Byte(0x68);
    addOffset(disp_type, true, false);
    Data(src_imm, false);
  }
}




void Assembler::ret( int32 stack_incr) {
  if (printing) {
    asm_lprintf("ret");
    asm_lprintf(stack_incr ? " $%d\n" : "\n", stack_incr);
  }
  if (stack_incr == 0) {
    Byte(0xc3);
  }
  else {
    Byte(0xc2);
    Short(stack_incr);
  }
}
  


// Junk
  


                               

 
  

# ifdef SIC_COMPILER
    // for statistics
    // encode type tests with trigger instructions; when changing these, be
    // sure to change 1st instr of SendMessage_stub as well

    void Assembler::startTypeTest(fint ncases, bool prologueCheck,
                                  bool immedOnly) {
      fatal("unimp intel");
    }
    
    void Assembler::doOneTypeTest() { fatal("unimp intel"); }
    void Assembler::endTypeTest()   { fatal("unimp intel"); }
    void Assembler::markTagTest(fint n, bool isArith) {
      fatal("unimp intel");
    }
    
# endif




# define FOR_ALL_IMM8s(imm8) \
  for (int32 imm8 = 0; \
             imm8 != 256; \
             imm8 = imm8 ==    0 ?  1 : \
                    imm8 ==    1 ?  255 : 256)

# define FOR_ALL_REGS(x) \
  for (Location x = eax;  x <= edi;  ++*(int*)&x)
  
# define FOR_ALL_BASES(x) \
  for (Location x = eax;  x <= no_reg;  x = Location((int)x + 1))


OperandType test_ots[] = {NumberOperand, RegisterOperand, VMAddressOperand}; 
# define FOR_ALL_INTERESTING_OPERAND_TYPES(ot) \
  for (OperandType ot = RegisterOperand;  \
                   ot != OperandType(-1); \
                   ot = (ot == RegisterOperand \
                         ? NumberOperand \
                         :   ot == NumberOperand ? VMAddressOperand : OperandType(-1))) 
  
int32 test_disps[] = {0, 1, -1, 127, -128, 0x10000000, -0x10000000};
# define FOR_ALL_DISPS(x, xx, ot) \
  for (int xx = 0, x = 0;  \
           xx < sizeof(test_disps) / sizeof(test_disps[0]) \
             ? (x = test_disps[xx], true) : false; \
         ++xx) \
    if (ot == RegisterOperand && x != 0) {} /* dont bother, x will be ignored */\
    else if (ot != NumberOperand  &&  is_disp8(x)) {} /* gcc will give us a short disp */\
    else
         
# define FOR_ALL_INDICES(reg, scale, operand_type) \
  if (operand_type == RegisterOperand) {} \
  else \
    FOR_ALL_BASES(reg) \
      for (Scale scale = by_one;  \
                 scale <= (reg == no_reg ? by_one : by_eight); \
       ++*(int*)&scale) \
         if (reg == esp) {} else
     
# define FOR_ALL_RM32(base, disp, type, index, scale) \
  FOR_ALL_INTERESTING_OPERAND_TYPES(type) \
    FOR_ALL_INDICES(index, scale, type) \
      FOR_ALL_DISPS(disp, dispi, type) \
        FOR_ALL_BASES(base) \
          if (base == no_reg  &&  disp == 0  &&  index == no_reg) {} \
          else
    
# define FOR_ALL_IMM32s(imm32, type) \
  FOR_ALL_INTERESTING_OPERAND_TYPES(type) \
    FOR_ALL_DISPS(imm32, imm32i, type)
  
# define FOR_ALL_BIT_INDICES(x) \
  for (int x = 0;  x < 32;  x += 31)
  
void Assembler::generate_test_instructions() {
  tally();

  leal(esp, -8, NumberOperand, esp);  tally();
  
  enter(0);  tally();
  leave();   tally();
  ret();     tally();
  ret(16);   tally();
  ret(252);  tally();
  cwde();    tally();
  cld();     tally();
  clc();     tally();
  cmc();     tally();
  hlt();     tally();
  nop();     tally();
  stc();     tally();
  std();     tally();
  ud2();     tally();

  gen_movccs_setccs_movsxs_movzxss();
  gen_jmps();
  gen_imm32_only();
  gen_imm_reg();
  gen_rm();
  gen_imuls();
  gen_shifts();
}    


void Assembler::gen_movccs_setccs_movsxs_movzxss() {
  FOR_ALL_RM32(b, d, t, i, s) {
    seta(b, d, t, i, s);          tally();
    FOR_ALL_REGS(dst) {
      cmova(b, d, t, i, s, dst);  tally();

      movsbl(b, d, t, i, s, dst);  tally();
      movzbl(b, d, t, i, s, dst);  tally();
      movswl(b, d, t, i, s, dst);  tally();
      movzwl(b, d, t, i, s, dst);  tally();
    }
  }
  cmova( ebx, eax);  tally();
  cmovae(ecx, 17, NumberOperand, edx);  tally();
  cmovb( ebx, eax);  tally();
  cmovbe(ebx, eax);  tally();
  cmovc( ebx, eax);  tally();
  cmove( ebx, eax);  tally();
  cmovg( ebx, eax);  tally();
  cmovge(ebx, eax);  tally();
  cmovl(ebx, eax);  tally();
  cmovle(ebx, eax);  tally();
  cmovna(ebx, eax);  tally();
  cmovnae(ebx, eax);  tally();
  cmovnb(ebx, eax);  tally();
  cmovnbe(ebx, eax);  tally();
  cmovnc(ebx, eax);  tally();
  cmovne(ebx, eax);  tally();
  cmovng(ebx, eax);  tally();
  cmovnge(ebx, eax);  tally();
  cmovnl(ebx, eax);  tally();
  cmovnle(ebx, eax);  tally();
  cmovno(ebx, eax);  tally();
  cmovnp(ebx, eax);  tally();
  cmovns(ebx, eax);  tally();
  cmovnz(ebx, eax);  tally();
  cmovo(ebx, eax);  tally();
  cmovp(ebx, eax);  tally();
  // not in gcc cmovpe(ebx, eax);  tally();
  // not in gcc cmovpo(ebx, eax);  tally();
  cmovs(ebx, eax);  tally();
  // not in gcc cmovz(ebx, eax);  tally();

  seta( ebx);  tally();
  setae(edx);  tally();
  setb( ebx);  tally();
  setbe(ebx);  tally();
  setc( ebx);  tally();
  sete( ebx);  tally();
  setg( ebx);  tally();
  setge(ebx);  tally();
  setl( ebx);  tally();
  setle(ebx);  tally();
  setna(ebx);  tally();
  setnae(ebx);  tally();
  setnb(ebx);  tally();
  setnbe(ebx);  tally();
  setnc(ebx);  tally();
  setne(ebx);  tally();
  setng(ebx);  tally();
  setnge(ebx);  tally();
  setnl(ebx);  tally();
  setnle(ebx);  tally();
  setno(ebx);  tally();
  setnp(ebx);  tally();
  setns(ebx);  tally();
  setnz(ebx);  tally();
  seto(ebx);  tally();
  setp(ebx);  tally();
  // not in gcc setpe(ebx);  tally();
  // not in gcc setpo(ebx);  tally();
  sets(ebx);  tally();
  // not in gcc setz(ebx);  tally();
}


void Assembler::gen_jmps() {
    jecxz(int32(instsEnd),        NumberOperand);  tally(); 
    jecxz(int32(instsEnd) + 100,  NumberOperand);  tally(); 
    jecxz(int32(instsEnd) - 100,  NumberOperand);  tally();

    loop(  int32(instsEnd),        NumberOperand);  tally(); 
    loope( int32(instsEnd) + 100,  NumberOperand);  tally(); 
    loopne(int32(instsEnd) - 100,  NumberOperand);  tally();

# define T(name) \
    name(                    0,  NumberOperand);  tally(); \
    name(int32(instsEnd),        NumberOperand);  tally(); \
    name(int32(instsEnd) + 100,  NumberOperand);  tally(); \
    name(int32(instsEnd) - 100,  NumberOperand);  tally();
    
  T(ja) T(jae) T(jb) T(jbe) T(jc) T(je) T(jg) T(jge) T(jl) T(jle) T(jna) T(jnae) T(jnb) T(jnbe) T(jnc)
  T(jne) T(jng) T(jnge) T(jnl) T(jnle) T(jno) T(jnp) T(jns) T(jnz) T(jo) T(jp) T(jpe) T(jpo) T(js) T(jz)

  T(jmp)
  T(call)
  # undef T
}  


void Assembler::gen_imm32_only() {
  FOR_ALL_INTERESTING_OPERAND_TYPES(type) \
    FOR_ALL_DISPS(disp, dispi, type) { \
      pushl( disp, type);  tally();
    }        
}


void Assembler::gen_imm_reg() {  
  FOR_ALL_REGS(reg) {
    bswap(reg);  tally();
    
    FOR_ALL_IMM8s(imm8) {
      addb(  imm8,  reg);  tally(); 
      adcb(  imm8,  reg);  tally(); 
      subb(  imm8,  reg);  tally();
      sbbb(  imm8,  reg);  tally();
      cmpb(  imm8,  reg);  tally();
      andb(  imm8,  reg);  tally();
       orb(  imm8,  reg);  tally();
      xorb(  imm8,  reg);  tally();
      testb( imm8,  reg);  tally();
      movb(  imm8,  reg);  tally();
    }
    FOR_ALL_IMM32s(imm32, imm_type) {
      addl(  imm32,  imm_type, reg);  tally(); 
      adcl(  imm32,  imm_type, reg);  tally(); 
      subl(  imm32,  imm_type, reg);  tally();
      sbbl(  imm32,  imm_type, reg);  tally();
      cmpl(  imm32,  imm_type, reg);  tally();
      andl(  imm32,  imm_type, reg);  tally();
       orl(  imm32,  imm_type, reg);  tally();
      xorl(  imm32,  imm_type, reg);  tally();
      testl( imm32,  imm_type, reg);  tally();
      movl(  imm32,  imm_type, reg);  tally();
    }
  }
}

void Assembler::gen_rm() {    
  FOR_ALL_RM32(     base, disp, type, index, scale) {
    decb(           base, disp, type, index, scale);  tally();
    decl(           base, disp, type, index, scale);  tally();
    incb(           base, disp, type, index, scale);  tally();
    incl(           base, disp, type, index, scale);  tally();
    divb(           base, disp, type, index, scale);  tally();
    divl(           base, disp, type, index, scale);  tally();
    idivb(          base, disp, type, index, scale);  tally();
    idivl(          base, disp, type, index, scale);  tally();
    mulb(           base, disp, type, index, scale);  tally();
    mull(           base, disp, type, index, scale);  tally();
    negb(           base, disp, type, index, scale);  tally();
    negl(           base, disp, type, index, scale);  tally();
    notb(           base, disp, type, index, scale);  tally();
    notl(           base, disp, type, index, scale);  tally();
    pushl(          base, disp, type, index, scale);  tally();
    popl(           base, disp, type, index, scale);  tally();
    call(           base, disp, type, index, scale);  tally();
    jmp(            base, disp, type, index, scale);  tally();
    
    gen_imm8_rm8(   base, disp, type, index, scale);
    gen_imm32_rm32( base, disp, type, index, scale);
    gen_reg_rm(     base, disp, type, index, scale);
    gen_bit_rm(     base, disp, type, index, scale);
  }
}
  
  
void Assembler::gen_imm8_rm8( Location base, int32 disp, OperandType type, Location index, Scale scale) {
  FOR_ALL_IMM8s(imm8) {
    addb(  imm8,  base, disp, type, index, scale);  tally(); 
    adcb(  imm8,  base, disp, type, index, scale);  tally(); 
    subb(  imm8,  base, disp, type, index, scale);  tally();
    sbbb(  imm8,  base, disp, type, index, scale);  tally();
    cmpb(  imm8,  base, disp, type, index, scale);  tally();
    andb(  imm8,  base, disp, type, index, scale);  tally();
     orb(  imm8,  base, disp, type, index, scale);  tally();
    xorb(  imm8,  base, disp, type, index, scale);  tally();
    testb( imm8,  base, disp, type, index, scale);  tally();
    movb(  imm8,  base, disp, type, index, scale);  tally();
  }
}


void Assembler::gen_imm32_rm32( Location base, int32 disp, OperandType type, Location index, Scale scale) {
  FOR_ALL_IMM32s(imm32, imm_type) {
    addl(  imm32,  imm_type, base, disp, type, index, scale);  tally(); 
    adcl(  imm32,  imm_type, base, disp, type, index, scale);  tally(); 
    subl(  imm32,  imm_type, base, disp, type, index, scale);  tally();
    sbbl(  imm32,  imm_type, base, disp, type, index, scale);  tally();
    cmpl(  imm32,  imm_type, base, disp, type, index, scale);  tally();
    andl(  imm32,  imm_type, base, disp, type, index, scale);  tally();
     orl(  imm32,  imm_type, base, disp, type, index, scale);  tally();
    xorl(  imm32,  imm_type, base, disp, type, index, scale);  tally();
    testl( imm32,  imm_type, base, disp, type, index, scale);  tally();
    movl(  imm32,  imm_type, base, disp, type, index, scale);  tally();
  }
}


void Assembler::gen_reg_rm(Location base, int32 disp, OperandType type, Location index, Scale scale) {    
  FOR_ALL_REGS(reg) {
    addb(  reg,  base, disp, type, index, scale);  tally(); 
    adcb(  reg,  base, disp, type, index, scale);  tally(); 
    subb(  reg,  base, disp, type, index, scale);  tally();
    sbbb(  reg,  base, disp, type, index, scale);  tally();
    cmpb(  reg,  base, disp, type, index, scale);  tally();
    andb(  reg,  base, disp, type, index, scale);  tally();
     orb(  reg,  base, disp, type, index, scale);  tally();
    xorb(  reg,  base, disp, type, index, scale);  tally();
    testb( reg,  base, disp, type, index, scale);  tally();
    movb(  reg,  base, disp, type, index, scale);  tally();
    
    addl(  reg,  base, disp, type, index, scale);  tally(); 
    adcl(  reg,  base, disp, type, index, scale);  tally(); 
    subl(  reg,  base, disp, type, index, scale);  tally();
    sbbl(  reg,  base, disp, type, index, scale);  tally();
    cmpl(  reg,  base, disp, type, index, scale);  tally();
    andl(  reg,  base, disp, type, index, scale);  tally();
     orl(  reg,  base, disp, type, index, scale);  tally();
    xorl(  reg,  base, disp, type, index, scale);  tally();
    testl( reg,  base, disp, type, index, scale);  tally();
    movl(  reg,  base, disp, type, index, scale);  tally();
    
    addb(   base, disp, type, index, scale, reg);  tally();
    adcb(   base, disp, type, index, scale, reg);  tally();
    subb(   base, disp, type, index, scale, reg);  tally();
    sbbb(   base, disp, type, index, scale, reg);  tally();
    cmpb(   base, disp, type, index, scale, reg);  tally();
    andb(   base, disp, type, index, scale, reg);  tally();
     orb(   base, disp, type, index, scale, reg);  tally();
    xorb(   base, disp, type, index, scale, reg);  tally();
    movb(   base, disp, type, index, scale, reg);  tally();
    
    addl(   base, disp, type, index, scale, reg);  tally();
    adcl(   base, disp, type, index, scale, reg);  tally();
    subl(   base, disp, type, index, scale, reg);  tally();
    sbbl(   base, disp, type, index, scale, reg);  tally();
    cmpl(   base, disp, type, index, scale, reg);  tally();
    andl(   base, disp, type, index, scale, reg);  tally();
     orl(   base, disp, type, index, scale, reg);  tally();
    xorl(   base, disp, type, index, scale, reg);  tally();
    movl(   base, disp, type, index, scale, reg);  tally();
    
    leal(   base, disp, type, index, scale, reg);  tally();

    btl(    reg, base, disp, type, index, scale);  tally();
    btrl(   reg, base, disp, type, index, scale);  tally();
    btsl(   reg, base, disp, type, index, scale);  tally();
    btcl(   reg, base, disp, type, index, scale);  tally();
  }
}    


void Assembler::gen_bit_rm(Location base, int32 disp, OperandType type, Location index, Scale scale) {    
  FOR_ALL_BIT_INDICES(b) {
    btl(   b, base, disp, type, index, scale);  tally();
    btrl(  b, base, disp, type, index, scale);  tally();
    btsl(  b, base, disp, type, index, scale);  tally();
    btcl(  b, base, disp, type, index, scale);  tally();
  }
}


void Assembler::gen_imuls() {
  FOR_ALL_RM32(base, disp, type, index, scale) {
    imulb(base, disp, type, index, scale);  tally();
    imull(base, disp, type, index, scale);  tally();
    FOR_ALL_REGS(dst) {
      imull(base, disp, type, index, scale, dst);  tally();
    }
  }
  FOR_ALL_IMM32s(imm32, it)
    FOR_ALL_RM32(base, disp, type, index, scale)
      FOR_ALL_REGS(r) {
        imull(imm32,  it, base, disp, type, index, scale, r);  tally();
      }
}      


void Assembler::gen_shifts() {
  FOR_ALL_RM32(base, disp, type, index, scale) {
    salb(shift_by_count_reg, base, disp, type, index, scale);  tally();
    sarb(shift_by_count_reg, base, disp, type, index, scale);  tally();
    shlb(shift_by_count_reg, base, disp, type, index, scale);  tally();
    shrb(shift_by_count_reg, base, disp, type, index, scale);  tally();
    
    rclb(shift_by_count_reg, base, disp, type, index, scale);  tally();
    rcrb(shift_by_count_reg, base, disp, type, index, scale);  tally();
    rolb(shift_by_count_reg, base, disp, type, index, scale);  tally();
    rorb(shift_by_count_reg, base, disp, type, index, scale);  tally();
        
    sall(shift_by_count_reg, NumberOperand, base, disp, type, index, scale);  tally();
    sarl(shift_by_count_reg, NumberOperand, base, disp, type, index, scale);  tally();
    shll(shift_by_count_reg, NumberOperand, base, disp, type, index, scale);  tally();
    shrl(shift_by_count_reg, NumberOperand, base, disp, type, index, scale);  tally();
    
    rcll(shift_by_count_reg, NumberOperand, base, disp, type, index, scale);  tally();
    rcrl(shift_by_count_reg, NumberOperand, base, disp, type, index, scale);  tally();
    roll(shift_by_count_reg, NumberOperand, base, disp, type, index, scale);  tally();
    rorl(shift_by_count_reg, NumberOperand, base, disp, type, index, scale);  tally();
    
    FOR_ALL_BIT_INDICES(imm8) {
      salb(imm8, base, disp, type, index, scale);  tally();
      sarb(imm8, base, disp, type, index, scale);  tally();
      shlb(imm8, base, disp, type, index, scale);  tally();
      shrb(imm8, base, disp, type, index, scale);  tally();
      
      rclb(imm8, base, disp, type, index, scale);  tally();
      rcrb(imm8, base, disp, type, index, scale);  tally();
      rolb(imm8, base, disp, type, index, scale);  tally();
      rorb(imm8, base, disp, type, index, scale);  tally();
          
      sall(imm8, NumberOperand, base, disp, type, index, scale);  tally();
      sarl(imm8, NumberOperand, base, disp, type, index, scale);  tally();
      shll(imm8, NumberOperand, base, disp, type, index, scale);  tally();
      shrl(imm8, NumberOperand, base, disp, type, index, scale);  tally();
      
      rcll(imm8, NumberOperand, base, disp, type, index, scale);  tally();
      rcrl(imm8, NumberOperand, base, disp, type, index, scale);  tally();
      roll(imm8, NumberOperand, base, disp, type, index, scale);  tally();
      rorl(imm8, NumberOperand, base, disp, type, index, scale);  tally();
    }
  }
}
      

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // TARGET_ARCH == I386_ARCH
