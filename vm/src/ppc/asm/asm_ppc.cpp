# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.14 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "asm_ppc.hh"
# pragma implementation "asm_inline_ppc.hh"  
  
# include "_asm_ppc.cpp.incl"

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
       if (  buf_hi <= zone_lo )  li_branches_will_fit = fits_within_li( zone_hi -  buf_lo );
  else if ( zone_hi <= buf_lo  )  li_branches_will_fit = fits_within_li(  buf_hi - zone_lo );
  else fatal("zone and buffer overlap");
  
}
  
# ifdef SIC_COMPILER
    void Assembler::unimp(fint n, bool shouldRestart) {
      // add an addrDesc for the unimp instruction so they're easier to find
      int32 mask = offset();
      genLoc(mask | addrDesc::isUncommonTrapMask);
      assert(n < MaxUnimpImm / 2, "unimp immediate too large");
      if (shouldRestart) n |= UncommonRestartBit;
      Data(n);
    }
# endif

  
// branch and link to arbitrary address, temp may be any GPR
// Some callers (e.g. the branch to SendDIMessage_Stub)
// count on the fact that I do NOT disturb the link register.
void Assembler::branch_to(pc_t dest, OperandType t, Location temp, bool link) {
  bool use_short = false; // can we use a relative branch? (be conservative, assume it will be backpatched)

  if   (!UseShortBranches)        use_short = false;
  else {
    // have to check
    // branch will eventually be in zone
    char* lo = Memory->code->code_start();
    char* hi = Memory->code->code_end();
    if (dest > hi)
      use_short = fits_within_li(dest - lo);
    else if (dest < lo)
      use_short = fits_within_li(hi - dest);
    else
      use_short = fits_within_li(hi - lo);
      
    assert(!use_short || fits_within_li(hi - lo), "");
    // have to get to dest from inst assembly location, too
    if (use_short)
      use_short = fits_within_li(dest > addr()  ?  dest - addr()  :  addr() - dest);
  }

  if ( use_short )   short_branch_to(dest, t, temp, link);
  else                long_branch_to(dest, t, temp, link);
}

  
  
// branch and link to arbitrary address, temp may be any GPR
// Some callers (e.g. the branch to SendDIMessage_Stub)
// count on the fact that I do NOT disturb the link register.
void Assembler::long_branch_to(pc_t dest, OperandType t, Location temp, bool link) {
  load_immediate( temp, (int32)dest, t);
  mtctr(temp); // use count register so we can use this in method prologue before link is saved
  if (link)   balwctrl(); 
  else        balwctr();
}

  
  
// short branch and link to arbitrary address, temp may be any GPR
// Some callers (e.g. the branch to SendDIMessage_Stub)
// count on the fact that I do NOT disturb the link register.

// To speed the compiler, it calls this routine directly.
// But, if the spans become too large (because the resource area is too far away),
// it could always call branch_to. -- dmu 6/99

void Assembler::short_branch_to(pc_t dest, OperandType t, Location /*temp*/, bool link) {
  Label L(printing);
  L.define(dest);
  if (link)   bl(L, t); 
  else        b (L, t);
}


void Assembler::load_immediate( Location dest, int32 data, OperandType t ) {
  assert( isRegister(dest), "must be register");
  bool data_could_change = t == OopOperand  &&  oop(data)->is_mem()   ||   t == CodeAddressOperand;
  if ( !data_could_change  &&  fits_within_si(data)) {
    // NumberOperand instead of t because we know data cannot change
    // If we used t, then add_offset would fail because
    // it only knows that data is an oop, so it thinks it needs to 
    // relocate it (even though it is an immedate oop).
    // However, add_offset cannot
    // deal with an li instruction that is not after a lis. -- Ungar
    li(dest, data, NumberOperand);
  }
  else {
    int32 lo, hi;
    break_up_word_for_oring(data, lo, hi);
    lis(dest, hi, t, KF_shifted_for_ui); // set high-order bits
    // always do ori, even if zero, for patching later
    ori(  dest, dest, lo, t); // or in low order bits
  }
}


void Assembler::load_from_address( Location dest, void* p, OperandType t, Location base_reg ) {
  if (base_reg == IllegalLocation)  base_reg = dest;
  assert( isRegister(dest) && isRegister(base_reg) && base_reg != R0, "must be non-zero register");
  int32 lo, hi;
  break_up_word_for_adding((int32)p, lo, hi);
  lis(base_reg, hi, t, KF_shifted_for_si); // set high-order bits
  lwz(  dest, lo, t, base_reg); // or in low order bits
}


void Assembler::store_to_address( Location src, void* p, OperandType t, Location base_reg ) {
  assert( isRegister(src) && isRegister(base_reg) && base_reg != R0 && base_reg != src, "must be non-zero register");
  int32 lo, hi;
  break_up_word_for_adding((int32)p, lo, hi);
  lis(base_reg, hi, t, KF_shifted_for_si); // set high-order bits
  stw(  src, lo, t, base_reg); // or in low order bits
}
  
 
// patch instruction's immediate field by delta
void Assembler::increase_immediate_field( pc_t a, int32 delta ) {
  inst_t& x = *(inst_t*)a;
  int32 si = ::SI(x);
  si += delta;
  x = (x & ~SI(~0)) | SI(si);
}

// patch all instructions immediate field by delta
void Assembler::increase_all_immediate_fields( AddressList* l, int32 delta) {
  for (int i = 0;  i < l->length();  ++i)
    increase_immediate_field(l->nth(i), delta);
}


# if COMPILER == GCC_COMPILER
  extern "C" void Untested_Stub() {
    fatal("unimp for OS X");
  }
# else
  # error which?
# endif

void Assembler::_Untested(char* msg, Location temp1, bool save_link) {
  // assumes we may not have a frame
  
  // too much: lprintf("generated untested code for: %s\n", msg);
  
  Comment("start of Untested sequence");
  if (save_link) mflr(R0); // save link
  branch_to(first_inst_addr(Untested_Stub), PVMAddressOperand, temp1, true);
  Data((int32)msg);
  if (save_link) mtlr(R0); // restore link
  Comment("end of Untested sequence");
}


// Don't pass in OopOperand, unless the data is a memOop

void Assembler::add_offset(OperandType t, Kind_of_Instruction_Field f) {
  // eliminate common & simple cases quickly, call slow version for
  // real work
  switch (t) {
     case NumberOperand:      return; // also used for relative branches within this nmethod
     case VMAddressOperand:   if (f == KF_li_rel) break;  else return; // need info to fix relative branch
     case PVMAddressOperand:  break; // need to be able to find primitive call for e.g. conversion ZZZ (was like above)
     case BPVMAddressOperand: break; // need to be able to find inline cache
     case CodeAddressOperand: break; // ditto
     case DIVMAddressOperand: break; // need to be able to find DI desc
     case OopOperand:         break; // need to scavenge OOP
     default: ShouldNotReachHere();
  }
  int32 mask = 0;
  switch (f) {
    default: ShouldNotReachHere();
    // for now can discard shifted distinctions since we only allow for shifted/non pairs
    // someday, when we store the referrent as well as the offset, we will pass it through
    case KF_shifted_for_si:
    case KF_shifted_for_ui:  mask |= addrDesc::isShiftedMask;  break;
    
    case KF_li_abs:
    case KF_li_rel:  break; // discover this from the instruction
    
    case KF_si:
    case KF_ds:
    case KF_ui:
       // because I do not want to introduce varying-length descs,
       // I do not want to store the referrent separately.
       // So, these has better follow a shfited instruction:
       assert( locsLen() >= 1  
           &&  locsEnd[-1].isShifted()
           &&  locsEnd[-1].offset()  ==  offset() - oopSize,
               "stinky restriction");
       return; // will handle it via the shifted one
  }
  doAddOffset(t, true, mask);
}



  
extern "C" void TestAsm();


void Assembler::test_ppc_asm() {
  test_BranchI();
  test_BranchConditionals();
  sc();
  test_CondRegLogicals();
  test_LoadStores();
  test_FixedPointArith();
    
  // TestAsm(); 
}


void Assembler::check() {
  int32 pc = offset() - sizeof(inst_t);
  pc /= sizeof(inst_t);
  inst_t& mine   = ((inst_t*)instsStart)[pc];
  inst_t& apples = ((inst_t*)first_inst_addr(TestAsm))[pc];
  if (mine == apples)  return;
  warning5("asm bug: pc %d, mine 0x%x, apple's 0x%x, addresses: &mine = 0x%x, &apples = 0x%x\n", pc, mine, apples, &mine, &apples);
}

//dummy
void TestAsm() {}

void Assembler::test_BranchI() {
  Label La; La.define( addr()              );  b(   La, NumberOperand);  check();
  Label Lb; Lb.define( pc_t(16)            );  ba(  Lb, NumberOperand);  check();
  Label Lc; Lc.define( pc_t(( 1 << 25)-4 ) );  ba(  Lc, NumberOperand);  check();
  Label Ld; Ld.define( addr() - ( 1 << 25) );  b(   Ld, NumberOperand);  check();
  Label Le; Le.define( pc_t(1 << 25) - 4   );  ba(  Le, NumberOperand);  check();
  Label Lf; Lf.define( pc_t( -( 1 << 25))  );  ba(  Lf, NumberOperand);  check();
  Label Lg; Lg.define( addr() - 4          );  bl(  Lg, NumberOperand);  check();
  Label Lh; Lh.define( addr() + 4          );  bl(  Lh, NumberOperand);  check();
  Label Li; Li.define( 0                   );  bla( Li, NumberOperand);  check();
  Label Lj; Lj.define( pc_t(-4)            );  bla( Lj, NumberOperand);  check();
  
  
  // Next few should and do fail:
  
  // bl(int(addr()) + 1);
  // bla(2);
  // b( int(addr()) + (1 << 26) );
  // ba( 1 << 26 );
  // b( int(addr()) + (1 << 25) );
  // ba( 1 << 25 );
  // ba( -( 1 << 25) - 1);
  
  DefinedLabel L1(false);
  Label L2;
  L2.define((pc_t)0x1230);
  
  
  b(L1, NumberOperand);  check();
  ba(L2, NumberOperand);  check();
  
  Label L3;
  Label L4;
  
  bl(L3, NumberOperand);  check();
  bla(L4, NumberOperand);  check();
  
  L3.define();
  L4.define((pc_t)0x3450);
}


void Assembler::test_BranchConditionals() {
  // Label cases: 0, -4, +4, -8000, +7ffff, -8001, +8000, 2
  Label A0;      A0    .define((pc_t)0);
  Label Am4;     Am4   .define((pc_t)-4);
  Label A4;      A4    .define((pc_t)4);
  Label Am8000;  Am8000.define((pc_t)-0x8000);
  Label A7ffc;   A7ffc .define((pc_t)0x7ffc);
  
  Label Am8004;  Am8004.define((pc_t)-0x8004);
  Label A8000;   A8000 .define((pc_t)0x8000);
  Label A2;      A2    .define((pc_t)2);
  
  blta( A0 );  check();
  blea( Am4, predict_weird);  check();
  bgea( A4, predict_usual, cr1);  check();
  bgta( Am8000, predict_weird, cr2);  check();
  beqa( A7ffc, predict_usual, cr3);  check();
  bnea( A0, predict_weird, cr4);  check();
  bsoa( A0, predict_usual, cr5);  check();
  bnsa( A0, predict_weird, cr6);  check();
  buna( A0, predict_usual, cr7);  check();
  balwa( A0);  check();
  
  bltla( A0 );   check();
  balwla( A4);  check();
  
  bdzlta( A0 );   check();
  bdnzlta( A0);  check();
  bdzgea( A0 );   check();
  bdnzgea( A0);  check();
  
  bdzltla( A0 );   check();
  bdnzltla( A0);  check();
  bdzgela( A0 );   check();
  bdnzgela( A0);  check();
  
  // will fail:
  // blta(Am8004);
  // blta(A8000);
  // blta(A2);
  

  // relative branches:

  
  Label LR0; LR0.define(addr());
  Label LR1; 
  
  blt( LR0 );  check();
  ble( LR1, predict_weird);  check();
  bge( LR0, predict_usual, cr1);  check();
  bgt( LR1, predict_weird, cr2);  check();
  beq( LR0, predict_usual, cr3);  check();
  bne( LR1, predict_weird, cr4);  check();
  bso( LR0, predict_usual, cr5);  check();
  bns( LR1, predict_weird, cr6);  check();
  bun( LR0, predict_usual, cr7);  check();
  balw( LR1);  check();
  
  bltl( LR0 );   check();
  balwl( LR1);  check();
  
  bdzlt( LR0 );   check();
  bdnzlt(LR1);  check();
  bdzge( LR0 );   check();
  bdnzge( LR1);  check();
  
  bdzltl( LR0 );   check();
  bdnzltl(LR1);  check();
  bdzgel( LR0 );   check();
  bdnzgel(LR1);  check();
  
  bltlr( predict_weird, cr3 );  check();
  
  LR1.define(addr());  
  
  // to registers:
  
  bdzeqlrl();  check();
  bltctr();  check();
  bdzeqlrl(predict_weird);  check();
  bltctr(predict_weird);  check();
}


void Assembler::test_CondRegLogicals() {
  crand( cond_lt, cond_gt, cond_eq);  check();
  cror( cond_so, cond_un, cond_lt);  check();
  crxor( cond_lt, cond_gt, cond_eq);  check();
  crnand(cond_so, cond_un, cond_lt);  check();
  crnor( cond_lt, cond_gt, cond_eq);  check();
  creqv( cond_lt, cond_gt, cond_eq);  check();
  crandc( cond_lt, cond_gt, cond_eq);  check();
  crorc( cond_lt, cond_gt, cond_eq);  check();
  crmove( cond_lt, cond_gt);  check();
  crclr( cond_lt);  check();
  crnot( cond_lt, cond_gt);  check();
  crset( cond_lt);  check();
}

void Assembler::test_LoadStores() {
  lbz(  SP, 0, NumberOperand, R4);  check();
  lbzu( SP, 1, NumberOperand, R4 );  check();
  lhz(  SP, -1, NumberOperand, R4 );  check();
  lhzu( SP, 0x7fff, NumberOperand, R4 );  check();
  lha(  SP, -0x8000, NumberOperand, R4 );  check();
  lhau( SP, 0, NumberOperand, R4 );  check();
  lwz(  SP, 0, NumberOperand, R4 );  check();
  lwzu( SP, 0, NumberOperand, R4 );  check();
  lwax( R3, R4, R5);  check();
  lwaux( R5, R6, R7);  check();
  ldx( R3, R4, R5);  check();
  ldux(R3, R4, R5);  check();
  
  stb(  SP, 0, NumberOperand, R4 );  check();
  stbu( SP, 0, NumberOperand, R4 );  check();
  sth(  SP, 0, NumberOperand, R4 );  check();
  sthu( SP, 0, NumberOperand, R4 ) ;  check();
  stw(  SP, 0, NumberOperand, R4 );  check();
  stwu( SP, 0, NumberOperand, R4 );  check();
  
  lbzx(  SP, RTOC, R6 );  check();
  lbzux( R31, R30, R29 );  check();
  lhzx(  R31, R30, R29 );  check();
  lhzux( R31, R30, R29 );  check();
  lhax(  R31, R30, R29 );  check();
  lhaux( R31, R30, R29 );  check();
  lwzx(  R31, R30, R29 );  check();
  lwzux( R31, R30, R29 );  check();
  stbx(  R31, R30, R29 );  check();
  stbux( R31, R30, R29 );  check();
  sthx(  R31, R30, R29 );  check();
  sthux( R31, R30, R29 );  check();
  stwx(  R31, R30, R29 );  check();
  stwux( R31, R30, R29 );  check();
  stdx( R31, R30, R29);  check();
  stdux( R31, R30, R29 );  check();
  
  
  
  lwa( R3, 12, NumberOperand, R4);  check();
  ld( R3, 60, NumberOperand, R4);  check();
  ldu( R3, 0, NumberOperand, R4);  check();
  
  std( R31, -4, NumberOperand, R30);  check();
  stdu( R31, 0, NumberOperand, R30);  check();

  lhbrx( R5, R6, R7);  check(); 
  lwbrx( R5, R6, R7);  check(); 
  sthbrx( R5, R6, R7);  check(); 
  stwbrx( R5, R6, R7);  check(); 
  
  lmw( SP, 0, NumberOperand, R4);  check();
  stmw( R30, 0, NumberOperand, R31 );  check();  
  
  lswx( R3, R4, R5);  check();
  stswx( R6, R7, R8);  check();
  
  lswi( R3, R4, 32);  check();
  lswi( R5, R6, 1);  check();
  stswi( R7, R9, 3);  check();
  
  // should fail:
  // lswi( R6, R8, 0, NumberOperand);  check();
  // lswi( R4, R4, -1, NumberOperand);  check();
  // lswi( R3, R4, 33, NumberOperand);  check();
  
  lwarx( R3, R4, R5);  check();
  ldarx( R3, R4, R5);  check();
  stwcx_( R3, R4, R5);  check();
  stdcx_( R3, R4, R5);  check();
  
  sync();  check();
  
}

void Assembler::test_FixedPointArith() {
  addi( R3, R4, 0, NumberOperand);  check();
  addis( R30, R31, 1, NumberOperand, KF_shifted_for_si);  check();
  addic( R0, R4, -1, NumberOperand);  check();
  addic_( R3, R4, 0x7fff, NumberOperand);  check();
  subfic( R5, R6, -0x8000, NumberOperand);  check();
  mulli( R3, R4, 5, NumberOperand);  check();
  
  // should fail
  // addi(R3, R4, 0x8000, NumberOperand);  check();
  // addi(R3, R4, -0x8001, NumberOperand);  check();
  
  li( R3, 16, NumberOperand);  check();
  la( R3, -16, NumberOperand, R4);  check();
  subi( R4, R5, 7, NumberOperand);  check();
  lis( R3, 32, NumberOperand, KF_shifted_for_si);  check();
  subis( R3, R31, 64, NumberOperand, KF_shifted_for_si);  check();
  
  add(R0, SP, RTOC);  check();
  add_(R3, R4, R5);  check();
  addo(R30, R31, R29);  check();
  addo_(R3, R4, R5);  check();
  subf(R3, R4, R5);  check();
  addc(R0, R0, R0);  check();
  subfc(R31, R31, R31);  check();
  adde(R31, R31, R31);  check();
  subfe(R31, R31, R31);  check();
  mulld(R31, R31, R31);  check();
  mullw(R31, R31, R31);  check();
  divd(R31, R31, R31);  check();
  divw(R31, R31, R31);  check();
  divdu(R31, R31, R31);  check();
  divwu(R31, R31, R31);  check();
  
  addme(R3, R4);  check();
  subfme_(R31, R30);  check();
  addzeo(R3, R4);  check();
  subfzeo_(R0, R0);  check();
  neg(R3, R4);  check();
  
  mulhd( R0, R0, R0 );  check();
  mulhw( R0, R0, R0 );  check();
  mulhdu( R0, R0, R0);  check();
  mulhwu( R0, R0, R0);  check();
  
  
  cmpwi( R0, 1, NumberOperand );  check();
  cmpdi( R31, 0, NumberOperand, cr1 );  check();
  cmpw( R31, R30, cr7 );  check();
  cmpd( R3, R4 );  check();
  cmplwi( R7, 0xffff, NumberOperand);  check();
  cmpldi( SP, 0, NumberOperand);  check();
  cmplw( R3, R4);  check();
  cmpld( R5, R6);  check();
  
  trap();  check();
  twlt(R3, R4);  check();
  twlt(R31, R31);  check();
  tdlt(R31, R31);  check();
  twle(R0, R0);  check();
  tweq(R3, R4);  check();
  tdeq(R3, R4);  check();
  twge(R3, R4);  check();
  twgt(R0, R0);  check();
  tdgt(R0, R0);  check();
  twnl(R30, R31);  check();
  twne(R0, SP);  check();
  tdne(R0, SP);  check();
  twng(R3, R4);  check();
  twllt(R3, R4);  check();
  tdllt(R3, R4);  check();
  twlle(R3, R4);  check();
  twlge(R5, R6);  check();
  tdlge(R5, R6);  check();
  twlgt(SP, R3);  check();
  twlnl(R0, R3);  check();
  tdlnl(R0, R3);  check();
  twlng(R30, R31);  check();

  twlti(R3, 0, NumberOperand);  check();
  tdlti(R3, 0, NumberOperand);  check();
  twlei(R31, 1, NumberOperand);  check();
  tweqi(R0, -1, NumberOperand);  check();
  twgei(RTOC, 0x7fff, NumberOperand);  check();
  twgti(R4, -0x8000, NumberOperand);  check();
  twnli(R0, 2, NumberOperand);  check();
  
  // should fail
  // tdnei(R31, 0x8000, NumberOperand);  check();
  // twlnli(R0, -0x8001, NumberOperand);  check();
  
  andi_(R3, R4, 0, NumberOperand);  check();
  andis_(R0, R0, 1, NumberOperand, KF_shifted_for_si);  check();
  ori(R31, R30, 0xffff, NumberOperand);  check();
  oris(R3, R4, 17, NumberOperand, KF_shifted_for_si);  check();
  xori(R3, R4, 1, NumberOperand);  check();
  xoris(R3, R4, 0, NumberOperand, KF_shifted_for_si);  check();
  
  // should fail
  // ori(R0, R0, -1, NumberOperand);  check();
  // ori(R0, R0, 0x10000, NumberOperand);  check();
   
  And(R3, R4, R5);  check();
  And_(R5, R6, R7);  check();
  Or(R31, R30, R29);  check();
  Or_(R0, R0, R0);  check();
  Xor(R3, R4, R5);  check();
  Xor_(R3, R4, R5);  check();
  nand(R3, R4, R5);  check();
  nand_(R3, R4, R5);  check();
  nor(R3, R4, R5);  check();
  nor_(R3, R4, R5);  check();
  eqv(R3, R4, R5);  check();
  eqv_(R3, R4, R5);  check();
  andc(R3, R4, R5);  check();
  orc(R3, R4, R5);  check();
  
  mr(R3, R4);  check();
  mr_(R3, R4);  check();
  
  Not(R3, R4);  check();
  
  extsb(R3, R4);  check();
  extsh_(R3, R4);  check();
  extsw(R3, R4);  check();
  cntlzd(R3, R4);  check();
  cntlzw(R3, R4);  check();
  
  // unimp by asm: extldi(R3,  R4,   1, 63);  check();
  // unimp by asm: extrdi(R31, R30, 63, 1 );  check();
  // unimp by asm: insrdi(R3, R4, 2, 62);  check();
  // unimp by asm: rotldi(R3, R4, 63);  check();
  // unimp by asm: rotrdi_(R3, R4,  3);  check();
  // unimp by asm: rotld( R3, R4, R5);  check();
  // unimp by asm: sldi( R31, R30, 62 );  check();
  // unimp by asm: srdi( R3, R4, 1 );  check();
  // unimp by asm: clrldi_(R10, R11, 61 );  check();
  // unimp by asm: clrrdi(R3, R4, 20 );  check();
  // unimp by asm: clrsldi_(R31, R30, 3, 31);  check();
  
  extlwi(R3,  R4,   1, 31);  check();
  extrwi(R31, R30, 30, 1 );  check();
  inslwi(R3, R4, 2, 30);  check();
  insrwi(R3, R4, 2, 30);  check();
  rotlwi(R3, R4, 30);  check();
  rotrwi_(R3, R4, 3);  check();
  rotlw( R3, R4, R5);  check();
  slwi( R31, R30, 28 );  check();
  srwi( R3, R4, 1 );  check();
  clrlwi_(R10, R11, 29 );  check();
  clrrwi(R3, R4, 20 );  check();
  // unimp by asm: clrslwi_(R31, R30, 3, 31);  check();
  
  // unimp by asm: sld( R3, R4, R5 );  check();
  // unimp by asm: sld_(R31, R30, R29);  check();
  slw( R3, R4, R5);  check();
  slw_(R29, R30, R31);  check();
  
  // unimp by asm: srd( R3, R4, R5 );  check();
  // unimp by asm: srd_(R31, R30, R29);  check();
  srw( R3, R4, R5);  check();
  srw_(R29, R30, R31);  check();
  
  // unimp by asm: sradi( R3, R4, 63 );  check();
  // unimp by asm: sradi_(R31, R30, 62);  check();
  srawi( R3, R4, 0);  check();
  srawi_(R29, R30, 31);  check();
    
  // unimp by asm: srad( R3, R4, R5 );  check();
  // unimp by asm: srad_(R31, R30, R29);  check();
  sraw( R3, R4, R5);  check();
  sraw_(R29, R30, R31);  check();
  
  mtxer(R3);  check();
  mtlr(R31);  check();
  mtctr(R0);  check();
  
  mfxer(R3);  check();
  mflr(R31);  check();
  mfctr(R0);  check();
  
  mtcrf(0, R3);  check();
  mtcrf(31, R31);  check();
  mcrxr(0);  check();
  mcrxr(7);  check();
  mfcr(R0);  check();
  mfcr(R31);  check();
}


# ifdef SIC_COMPILER
    // for statistics
    // encode type tests with trigger instructions; when changing these, be
    // sure to change 1st instr of SendMessage_stub as well

    void Assembler::startTypeTest(fint ncases, bool prologueCheck,
                                  bool immedOnly) {
      fatal("unimp mac");
    }
    
    void Assembler::doOneTypeTest() { fatal("unimp mac"); }
    void Assembler::endTypeTest()   { fatal("unimp mac"); }
    void Assembler::markTagTest(fint n, bool isArith) {
      fatal("unimp mac");
    }
    
# endif


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // TARGET_ARCH == PPC_ARCH
