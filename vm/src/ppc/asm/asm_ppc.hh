# if defined(__ppc__) || defined(__powerpc__)
/* Sun-$Revision: 30.13 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */
   

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


// these global for ease of use
enum CR_Field {
  cr0 = 0,  cr1 = 4,  cr2 = 8,  cr3 = 12,  cr4 = 16,  cr5 = 20,  cr6 = 24,  cr7 = 28
};

  
enum CR_Bit {
  cond_dc = 0,  // dont care
  cond_lt = 0,
  cond_gt = 1,
  cond_eq = 2,
  cond_so = 3,  // summary overflow
  cond_un = 3,  // unordered floating point
  
  cond_fx  = 4, // floating point exception summary
  cond_fex = 5, // floating point enabled exception summary
  cond_vx  = 6, // fp invalid operation exception summary
  cond_ox  = 7  // fp overflow exception
};


enum BO_Predict {
  // use one of these
  predict_weird = 1, // backwards br not taken, fwd br taken
  predict_usual = 0  // backwards br taken, fwd not taken
};
  

// actually only the shifted items need to be public  
enum Kind_of_Instruction_Field { // for offsets
  KF_si, // 16 bit signed
  KF_ds, // 16 bit signed, but with low 2 bits zero (used for other things in instruction)
  KF_ui, // 16 bit unsigned
  KF_shifted_for_si, // 16 high bits, to be added to si field
  KF_shifted_for_ui, // 16 high bits, to be added to ui field
  KF_li_abs, // li field for branch
  KF_li_rel  // li field for relative branch
};
  
class Assembler: public BaseAssembler {
 friend class Label; // for Backpatch
 
 private:
  bool li_branches_will_fit;
 
 public:
  
  Assembler(int32 instsSize, int32 locsSize, bool pr, bool isInstrs);
    
  void test_ppc_asm();
    
 private:
  void test_BranchI();
  void test_BranchConditionals();
  void test_CondRegLogicals();
  void test_LoadStores();
  void test_FixedPointArith();
  void check();
   
 
 // constants:
 public:
  
  
 private:     

  enum Extended_Condition {
    CR_ONLY, // only based on count reg
    ALWAYS,
    LT, LE, EQ, GE, GT, NE, 
    SO, NS, UN, NU // summary overflow, not overflow, unordered, not unordered
  };
  
  enum BO_Twist {
    if_cond_false = 0,     // branch if condition false
    if_cond_true  = 8,     // branch if condition true
    ignore_cond   = 16     // branch ignoring cond (ctr only)
  };
    
  enum BO_CTR {  
    // and one of these:
    no_ctr  = 4, // cond branch ignores CTR
    dec_bz  = 2, // cond branch decrs CTR, branches if zero (maybe AND cond t/f)
    dec_bnz = 0  // cond branch decrs CTR, branches if nonzero
  };

  enum BC_Reg {
    bcr_link_reg  = 16,
    bcr_count_reg = 528
  };

  enum TO_encoding {
    to_lt = 16,  // less than
    to_le = 20,  // less than or equal
    to_eq =  4,  // equal
    to_ge  = 12, // greater or equal
    to_gt  =  8, // greater than
    to_nl  = 12, // not less than
    to_ne  = 24, // not equal
    to_ng  = 20, // not greater than
    to_llt =  2, // logical less than
    to_lle =  6, // logical less than or equal
    to_lge =  5, // logical greater or equal
    to_lgt =  1, // logical greater than
    to_lnl =  5, // logical not less than
    to_lng =  6, // logical not greater than
    to_unc = 31  // unconditional
  };
    
 private:    
    
  // fields:
  
  inst_t OPCD(OPCD_codes x) { assert((x & 0x3f) == x, "invalid op");  return x << 26; }
  
  
  inst_t RT(Location r) { assert( 0 <= r  &&  r <= 31, "oops");  return inst_t(r) << 21; }
  inst_t RS(Location r) { return RT(r); }
  
  inst_t RA(Location r) {  assert( 0 <= r  &&  r <= 31, "oops");  return inst_t(r) << 16;  }
  inst_t RB(Location r) {  assert( 0 <= r  &&  r <= 31, "oops");  return inst_t(r) << 11;  }

  
  inst_t BT(CR_Bit b) { assert(0 <= b  &&  b < 32, "bad cond bit"); return b << 21; }
  inst_t BA(CR_Bit b) { assert(0 <= b  &&  b < 32, "bad cond bit"); return b << 16; }
  inst_t BB(CR_Bit b) { assert(0 <= b  &&  b < 32, "bad cond bit"); return b << 11; }
  
  inst_t LI(pc_t ss) {
    inst_t s = inst_t(ss);
    assert((s & 3) == 0, "must be word-aligned");
    // is 26-bit, signed field
    assert ( -(1 << 25) <= s  &&  s <= (1 << 25)-1,  "must be in range");
    return s & li_mask;
  }
  
  inst_t D(int32 d) {
    assert( -(1 << 15) <= d  &&  d < (1 << 15), "oops");
    return d & 0x0000ffff;
  }
  inst_t SI(int32 si) { assert(fits_within_si(si), "si range"); return si & si_mask; }
  inst_t UI(int32 ui) { assert( uint32(ui) < 0x10000, "oops"); return ui; }

  
  
  inst_t DS(int32 ds) {
    assert( (ds & 3) == 0  &&  -(1 << 15) <= ds  &&  ds < (1 << 15), "oops");
    return (ds & 0x0000ffff);
  }
  
  inst_t DSX(int32 dsx) { assert( 0 <= dsx  &&  dsx < 4, "dsx range"); return dsx; }
  
  inst_t AA(int32 ab) { assert(0 <= ab  &&  ab <= 1, "ab range");  return ab << 1; }
  inst_t LK(int32 li) { assert(0 <= li  &&  li <= 1, "li range");  return li; }
  
  
  inst_t BO(  BO_CTR ctr,  BO_Twist twist, BO_Predict predict) { // pp 37
    assert( predict == predict_weird  ||  predict == predict_usual, "bad predict value");
    assert( ctr == no_ctr || ctr == dec_bz  ||  ctr == dec_bnz, "bad ctr");
    assert( twist == ignore_cond  || twist == if_cond_true  ||  twist == if_cond_false,
            "bad twist");
    assert( !(twist == ignore_cond  &&  ctr == no_ctr  &&  predict != 0),
            "predict ignored for branch always");
    fint BO_field = twist | ctr | predict;
    assert((BO_field & 0x1f) == BO_field, "oops");
    return BO_field << 21;
  }
    
  inst_t BI( CR_Bit condBit, fint crField ) {
    assert( 0 <= crField  &&  crField <= 28  &&  (crField & 3) == 0, "bad crField");
    return  ( crField | condBit )  <<  16;
  }
    
  inst_t BD( pc_t ss ) {
    inst_t s = inst_t(ss);
    assert( (s & 3)  == 0, "not word-aligned");
    assert( -(1 << (bd_bits-1)) <= s  &&  s < (1 << (bd_bits-1)), "out of range");
    return s & 0x0000fffc;
  }

  
  inst_t NB(int32 nb) {  assert( 1 <= nb  &&  nb <= 32, "oops");  return inst_t( nb & 31 )  <<  11; }
  
  inst_t XO1(int32 xop) { assert( 0 <= xop  &&  xop < (1 << 10), "xop range");  return xop << 1; }
  inst_t XO2(int32 xop) { assert( 0 <= xop  &&  xop < (1 <<  9), "xop range");  return xop << 2; }
  
  inst_t Rc(int32 x) { assert( x == 0  ||  x == 1, "one bit"); return x; }
  inst_t OE(int32 x) { assert( x == 0  ||  x == 1, "one bit"); return x << 10; }

  
  inst_t CBF(CR_Field cbf) { // condition bit field: which CR field
    assert((cbf & 3) == 0  &&  0 <= cbf  &&  cbf < 32, "cbf must be 0 4 8 16 20 24");
    int r = cbf >> 2; // just the field
    return r << 23;
  }

  inst_t L(int32 ll) {  assert( 0 <= ll &&  ll <= 1, "oops");  return ll << 21; }
    
  inst_t TO(TO_encoding to) {  assert(0 <= to  &&  to < 32, "oops");  return to << 21; }
  

  inst_t DSH(int32 n) {
    assert( 0 <= n  &&  n < 64, "sh out of range");
    return  ((n & 31) << 11)  |  ((n >> 5) << 1);
  }
  inst_t DMB(int32 b) {
    assert( 0 <= b  &&  b < 64, "mb out of range");
    int32 rotated_b = ((b & 31) << 1)  |  (b >> 5);
    return  rotated_b << 5;
  }
  inst_t WSH(int32 n) {  assert( 0 <= n  &&  n < 32, "sh out of range");  return n << 11;  }
  inst_t WMB(int32 b) {  assert( 0 <= b  &&  b < 32, "mb out of range");  return  b << 6;  }
  inst_t MDXO(int32 mdxo) {  assert( 0 <= mdxo  &&  mdxo < 8, "mdxo range");  return mdxo << 2; }
  inst_t ME(int32 me) {  assert(0 <= me  &&  me < 32, "me out of range");  return me << 1; }

  inst_t SPR(fint spr) { assert (0 <= spr  &&  spr < 1024,  "spr range");  return (((spr & 31) << 5) | (spr >> 5))  <<  11; }
  
  inst_t FXM(int32 fxm) { assert( 0 <= fxm  && fxm < (1 << 8),  "fxm range");  return fxm << 12; }
  inst_t BF(int32 bf) {  assert( 0 <= bf  &&  bf <= 7, "oop");  return bf << 23; }

  
  // helpers
    
  void Backpatch(pc_t instr, pc_t target) {
    // backpatch branch instr at instr to jump to target
    inst_t inst = *(inst_t*)instr;
    assert(get_target_of_branch_instruction((inst_t*)instr) == (isBranchAbsolute(inst) ? 0 : instr),
           "already has displacement");
    set_target_of_branch_instruction( (inst_t*)instr, target );
    lastBackpatch = target;
  }
  
  
  pc_t get_dest_from_label(Label& L, bool abs) {
    pc_t dest;
    if (L.isDefined()) // use label if defined, setup backpatch if not
      dest = L.target();
    else {
      L.unify(new Label(printing, addr()));
      dest = abs ? 0 : addr();
    }
    return dest;
  }

  
  void convert_ExtendedCondition( Extended_Condition ec,  CR_Bit& cb,  BO_Twist& twist) {
    switch (ec) {
      case ALWAYS:   cb = cond_dc;  twist = ignore_cond;   break;       
      case CR_ONLY:  cb = cond_dc;  twist = ignore_cond;   break;
      case LT:       cb = cond_lt;  twist = if_cond_true;  break;
      case LE:       cb = cond_gt;  twist = if_cond_false; break;
      case EQ:       cb = cond_eq;  twist = if_cond_true;  break;
      case GE:       cb = cond_lt;  twist = if_cond_false; break;
      case GT:       cb = cond_gt;  twist = if_cond_true;  break;
      case NE:       cb = cond_eq;  twist = if_cond_false; break;
      case SO:       cb = cond_so;  twist = if_cond_true;  break;
      case UN:       cb = cond_un;  twist = if_cond_true;  break;
      case NS:       cb = cond_so;  twist = if_cond_false; break;
      case NU:       cb = cond_un;  twist = if_cond_false; break;     
      default: ShouldNotReachHere();      
    }
  }
  
  void string_for_cr_bit(int32 crb, char* r) {
    if (crb & ~3) {  sprintf(r, "cr%d: ", crb >> 2);  r += 5; }
    switch (crb & 3) {
     case cond_lt:  sprintf(r, "lt");  break;
     case cond_gt:  sprintf(r, "gt");  break;
     case cond_eq:  sprintf(r, "eq");  break;
     case cond_so:  sprintf(r, "so");  break;
    }
  }
  
  char* cbf_print_str(CR_Field cbf) {
    static char buf[10];
    if (cbf == 0) return "";
    sprintf(buf, "cr%d, ", cbf >> 2);
    return buf;
  }  

  
  void add_offset(OperandType t, Kind_of_Instruction_Field f);
       
    
  // assemble any format:  
  
  void assemble(uint32 instr) {
    if (instsEnd >= instsOverflow) fatal("routine is too long to compile");
    uint32* instp = (uint32*) instsEnd;
    *instp = instr;
    instsEnd += sizeof(instr);
  }
  
  // I-Forms:
  
  void IForm( OPCD_codes op, Label& L, OperandType t, int32 aa, int32 lk, char* fmt ) {
    add_offset(t,  aa ? KF_li_abs : KF_li_rel);
    pc_t li = get_dest_from_label(L, aa);
    if (!aa)
      li -= int32(addr());
    assemble( OPCD(op) | LI(li) | AA(aa) | LK(lk) );
    if (printing)  {
      lprintf(fmt, li);
      lprintf(" /* L%d */\n", (void*)L.id());
    }
  }
  

  void BForm( Extended_Condition ec,
              Label&            L,
              int32             absolute,
              int32             link,
              BO_Predict        pre,
              BO_CTR            ctr,
              CR_Field          crField,
              char*             name ) {
    pc_t s = get_dest_from_label(L, absolute);
    CR_Bit cb;
    BO_Twist      twist;
    convert_ExtendedCondition( ec, cb, twist);
    if (!absolute)
      s -= int32(addr());
    assemble( OPCD(opcd_BranchConditional) 
            | BO(ctr, twist, pre)
            | BI(cb, crField)
            | BD(s)
            | AA(absolute) 
            | LK(link));
    if (printing) {
      lprintf("  %s%s  ", name,
              (pre == predict_usual ? "" : ( int32(s) < 0  ?  "-" : "+" )));
      if (crField != 0)  lprintf("cr%d", (void*)(crField >> 2));
      lprintf((absolute ? "0x%x" : "*+%d"), s);
      lprintf(" /* L%d */\n", (void*)L.id());
    }
  }
  
  
  void XForm1_6_7( char* name, XOpExts xop, Location rt_or_s, Location ra, Location rb, int32 rc = 0) {
    assemble( OPCD(opcd_XO) | RT(rt_or_s) | RA(ra) | RB(rb) | XO1(xop) | Rc(rc));
    if (printing)  lprintf("  %s  %s, %s(%s)\n",  name, RegisterNames[rt_or_s], RegisterNames[ra], RegisterNames[rb]);
  }
  
  
  void XFormMoveAssist( char* name, XOpExts xop, Location rt_s, Location ra, int32 nb ) {
    assemble( OPCD(opcd_XO) | RT(rt_s) | RA(ra) | NB(nb) | XO1(xop) );
    if ( printing )  lprintf("  %s  %s, %s, %d\n", name, RegisterNames[rt_s], RegisterNames[ra], (void*)nb);
  }
  
  void XLForm1( XOpExts xop, CR_Bit bt, CR_Bit ba, CR_Bit bb, char* fmt) {
    assemble( OPCD(opcd_ConditionRegisterLogical) | BT(bt) | BA(ba)| BB(bb) | XO1(xop) );
    if (printing) {
       char buft[100], bufa[100], bufb[100];
       string_for_cr_bit( bt, buft );
       string_for_cr_bit( ba, bufa );
       string_for_cr_bit( bb, bufb );
       lprintf(fmt, buft, bufa, bufb);
    }
  }

  void XLForm2( Extended_Condition ec,
                XOpExts            bcr,
                bool               link,
                BO_Predict         pre,
                BO_CTR             ctr,
                CR_Field           crField,
                char*              name ) {
    CR_Bit cb;
    BO_Twist      twist;
    convert_ExtendedCondition( ec, cb, twist);
    assert( !(bcr == BcrCountRegXOp  &&  ctr != no_ctr), "cannot decr ctr if branching to ctr");
    assert( bcr == BcrLinkRegXOp  ||  bcr == BcrCountRegXOp, "dest reg value");
 
    assemble( OPCD(opcd_BranchConditionalToSpecialRegister) 
            | BO(ctr, twist, pre)
            | BI(cb, crField)
            | XO1(bcr)
            | LK(link));
    if (printing) {
      lprintf("  %s", name);
      if (crField != 0)  lprintf("  cr%d", (void*)(crField >> 2));
      lprintf("\n");
    }
  }
  
  void XFormCompare( char* name, XOpExts xop, Location ra, Location rb, CR_Field cf, int32 ll) {
    assemble( OPCD(opcd_XO) | CBF(cf) | L(ll) | RA(ra) | RB(rb) | XO1(xop));
    if (printing)  lprintf("  %s  %s%s, %s\n",  name, cbf_print_str(cf), RegisterNames[ra], RegisterNames[rb]); 
  }

  void XOForm( XOpExts xop, char* n, char* fmt, void* p1, void* p2, void* p3, Location rt, Location ra, Location rb, int32 oe, int32 rc ) {
    assemble( OPCD(opcd_XO) | RT(rt) | RA(ra) | RB(rb) | OE(oe) | XO1(xop) | Rc(rc));
    if (printing)  { lprintf("  %s", n);  lprintf(fmt, p1, p2, p3); }
  }
  
  void DForm1_or_3(char* name, OPCD_codes op, Location rt_or_s, Location ra, int32 d, OperandType t ) {
     add_offset(t, KF_si /* same as D field */);
     assemble( OPCD(op) | RT(rt_or_s) | RA( ra) | D(d)); 
     if (printing) 
       lprintf("  %s  %s, %d(%s)\n", name, RegisterNames[rt_or_s], (void*)d, RegisterNames[ra]); 
   }

  
  void DFormSI(char* fmt, void* p1, void* p2, void* p3, OPCD_codes op, Location rt, Location ra, int32 si, OperandType t, Kind_of_Instruction_Field f ) {
     add_offset(t, f);
     assemble( OPCD(op) | RT(rt) | RA( ra) | SI(si)); 
     if (printing) lprintf(fmt, p1, p2, p3);
   }

  
  void DSForm( char* name, OPCD_codes op, DSXOp dsx, Location rt_s, Location ra, int32 ds, OperandType t ) {
    add_offset(t, KF_ds);
    assemble( OPCD(op) | RT(rt_s) | RA(ra) | DS(ds) | DSX(dsx) );
    if (printing)  lprintf("  %s  %s, %d(%s)\n", name, RegisterNames[rt_s], (void*)ds, RegisterNames[ra]);
  }
  
  void DFormCompare( char* name, OPCD_codes op, int32 ll, Location ra, int32 i, OperandType t, CR_Field cf ) {
   add_offset(t, opcd_CompareImmediate ? KF_si : KF_ui);
   assemble( OPCD(op) | CBF(cf) | L(ll) | RA(ra) 
                      | (op == opcd_CompareImmediate ? SI(i) : UI(i)));
   if (printing) 
     lprintf(
       (op == opcd_CompareImmediate
         ? "  %s  %s%s, %d\n"
         : "  %s  %s%s, %u\n"
       ), name, cbf_print_str(cf), RegisterNames[ra], (void*)i); 
  }

  void DoTrapXForm( char* name, TO_encoding to, Location ra, Location rb, XOpExts xop ) {
    assemble( OPCD( opcd_XO ) | TO(to) | RA(ra) | RB(rb) | XO1(xop));
    if (printing)
      lprintf("  %s  %s, %s\n", name, RegisterNames[ra], RegisterNames[rb]);
  }

  void DoTrapImm(   char* name, OPCD_codes op, TO_encoding to, Location ra, int32 si, OperandType t ) {
    add_offset(t, KF_si);
    assemble( OPCD(op) | TO(to) | RA(ra) | SI(si));
    if (printing)
      lprintf("  %s  %s, %d\n", name, RegisterNames[ra], (void*)si);
  }

  void DoLogicalDForm( char* name, OPCD_codes opc, Location ra, Location rs, int32 ui, OperandType t, Kind_of_Instruction_Field f, bool print_args = true ) {
    add_offset(t, f);
    assemble( OPCD(opc) | RS(rs) | RA(ra) | UI(ui));
    if (printing) {
      lprintf("  %s", name);
      if (print_args)  lprintf(" %s, %s, 0x%x", RegisterNames[ra], RegisterNames[rs], (void*)ui);
      lprintf("\n");
    }
  }
  
  void DoLogicalXForm( char* name, Location ra, Location rs, Location rb, XOpExts xop, int32 rc, bool print_3rd = true) {
    assemble( OPCD( opcd_XO ) | RA(ra) | RS(rs) | RB(rb) | XO1(xop) | Rc(rc));
    if (printing) {
      lprintf("  %s  %s, %s", 
              name, RegisterNames[ra], RegisterNames[rs]);
      if (print_3rd)  lprintf(", %s", RegisterNames[rb]);
      lprintf("\n");
    }
  }
    
  
  void RotateDoublewordImmMD( Location rs, Location ra, int32 n, int32 b, int32 mdxo, int32 rc, bool assrt,
                              char* fmt, void* p1, void* p2, void* p3, void* p4 ) {
    assert(assrt, "oops");  UsedOnlyInAssert(assrt);
    assemble(  OPCD(opcd_DoublewordRotate) | RS(rs) | RA(ra) | DSH(n) | DMB(b) | MDXO(mdxo) | Rc(rc));
    if (printing) {
      lprintf("  ");
      lprintf(fmt, p1, p2, p3, p4);
      lprintf("\n");
    }
  }
  
  void RotateWordImmM( OPCD_codes op, Location rs, Location ra, int32 sh, int32 mb, int32 me, int32 rc, bool assrt,
                        char* fmt, void* p1, void* p2, void* p3, void* p4, void* p5 ) {
    assert(assrt, "oops");  UsedOnlyInAssert(assrt);
    assemble(  OPCD(op) | RS(rs) | RA(ra) | WSH(sh) | WMB(mb) | ME(me) | Rc(rc));
    if (printing) {
      lprintf("  ");
      lprintf(fmt, p1, p2, p3, p4, p5);
      lprintf("\n");
    }
  }
  
  
  void RotateDoublewordRegMDS( Location rs, Location ra, Location rb, int32 b, int32 mdxo, int32 rc, bool assrt,
                              char* fmt, void* p1, void* p2, void* p3, void* p4 ) {
    assert(assrt, "oops");  UsedOnlyInAssert(assrt);
    assemble(  OPCD(opcd_DoublewordRotate) | RS(rs) | RA(ra) | RB(rb) | DMB(b) | MDXO(mdxo) | Rc(rc));
    if (printing) {
      lprintf("  ");
      lprintf(fmt, p1, p2, p3, p4);
      lprintf("\n");
    }
  }
  
  void RotateWordRegM( Location rs, Location ra, Location rb, int32 b, int32 me, int32 rc, bool assrt,
                         char* fmt, void* p1, void* p2, void* p3, void* p4, void* p5 ) {
    assert(assrt, "oops");  UsedOnlyInAssert(assrt);
    assemble(  OPCD(opcd_RotateLeftWordThenAndMask) | RS(rs) | RA(ra) | RB(rb) | WMB(b) | ME(me) | Rc(rc));
    if (printing) {
      lprintf("  ");
      lprintf(fmt, p1, p2, p3, p4, p5);
      lprintf("\n");
    }
  }    
  
  void ShiftRightAlgebraicDoublewordImm( Location rs, Location ra, int32 n, int32 rc,
                                         char* fmt, void* p1, void* p2, void* p3) {
    assemble(  OPCD(opcd_XO) | RS(rs) | RA(ra) | DSH(n) | XO2(ShiftRightAlgebraicDoublewordImmediateXOp) | Rc(rc));
    if (printing) {
      lprintf("  ");
      lprintf(fmt, p1, p2, p3);
      lprintf("\n");
    }
  }
  
  void ShiftRightAlgebraicWordImm( Location rs, Location ra, int32 n, int32 rc,
                                         char* fmt, void* p1, void* p2, void* p3) {
    assemble(  OPCD(opcd_XO) | RS(rs) | RA(ra) | WSH(n) | XO1(ShiftRightAlgebraicWordImmediateXOp) | Rc(rc));
    if (printing) {
      lprintf("  ");
      lprintf(fmt, p1, p2, p3);
      lprintf("\n");
    }
  }
  
  void MoveToFromSpecialRegister( SPR_code spr, Location rs, XOpExts xop, char* name ) { 
    assemble( OPCD(opcd_XO) | RS(rs) | SPR(spr) | XO1(xop) );
    if (printing) lprintf("  %s  %s\n", name, RegisterNames[rs]);
  }

      
      
 public:
 
  
  void b  ( Label& L, OperandType t )  { IForm( opcd_Branch, L, t, 0, 0, "b    *+%d"  ); }
  void ba ( Label& L, OperandType t )  { IForm( opcd_Branch, L, t, 1, 0, "ba   *0x%x" ); }
  void bl ( Label& L, OperandType t )  { IForm( opcd_Branch, L, t, 0, 1, "bl   *+%d"  ); }
  void bla( Label& L, OperandType t )  { IForm( opcd_Branch, L, t, 1, 1, "bla  *0x%x" ); }
 
 
  // not a not l  
  // cond branches

  void blt ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LT, L, 0, 0, p, no_ctr, f, "blt"); }
  void ble ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LE, L, 0, 0, p, no_ctr, f, "ble"); }
  void bge ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GE, L, 0, 0, p, no_ctr, f, "bge"); }
  void bgt ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GT, L, 0, 0, p, no_ctr, f, "bgt"); }
  void beq ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     EQ, L, 0, 0, p, no_ctr, f, "beq"); }
  void bne ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NE, L, 0, 0, p, no_ctr, f, "bne"); }
  void bso ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     SO, L, 0, 0, p, no_ctr, f, "bso"); }
  void bns ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NS, L, 0, 0, p, no_ctr, f, "bns"); }
  void bun ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     UN, L, 0, 0, p, no_ctr, f, "bun"); }
  void bnu ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NU, L, 0, 0, p, no_ctr, f, "bnu"); }
  void balw( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm( ALWAYS, L, 0, 0, p, no_ctr, f, "balw"); }

  // also dec ctr and branch if zero AND the condition
  void bdzlt( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LT, L, 0, 0, p, dec_bz, f, "bdzlt"); }
  void bdzle( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LE, L, 0, 0, p, dec_bz, f, "bdzle"); }
  void bdzge( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GE, L, 0, 0, p, dec_bz, f, "bdzge"); }
  void bdzgt( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GT, L, 0, 0, p, dec_bz, f, "bdzgt"); }
  void bdzeq( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     EQ, L, 0, 0, p, dec_bz, f, "bdzeq"); }
  void bdzne( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NE, L, 0, 0, p, dec_bz, f, "bdzne"); }
  void bdzso( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     SO, L, 0, 0, p, dec_bz, f, "bdzso"); }
  void bdzns( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NS, L, 0, 0, p, dec_bz, f, "bdzns"); }
  void bdzun( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     UN, L, 0, 0, p, dec_bz, f, "bdzun"); }
  void bdznu( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NU, L, 0, 0, p, dec_bz, f, "bdznu"); }
  void bdz  ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm( ALWAYS, L, 0, 0, p, dec_bz, f, "bdz"  ); }
    
  // also dec ctr and branch if nonzero AND the condition
  void bdnzlt( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LT, L, 0, 0, p, dec_bnz, f, "bdnzlt"); }
  void bdnzle( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LE, L, 0, 0, p, dec_bnz, f, "bdnzle"); }
  void bdnzge( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GE, L, 0, 0, p, dec_bnz, f, "bdnzge"); }
  void bdnzgt( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GT, L, 0, 0, p, dec_bnz, f, "bdnzgt"); }
  void bdnzeq( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     EQ, L, 0, 0, p, dec_bnz, f, "bdnzeq"); }
  void bdnzne( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NE, L, 0, 0, p, dec_bnz, f, "bdnzne"); }
  void bdnzso( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     SO, L, 0, 0, p, dec_bnz, f, "bdnzso"); }
  void bdnzns( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NS, L, 0, 0, p, dec_bnz, f, "bdnzns"); }
  void bdnzun( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     UN, L, 0, 0, p, dec_bnz, f, "bdnzun"); }
  void bdnznu( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NU, L, 0, 0, p, dec_bnz, f, "bdnznu"); }
  void bdnz  ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm( ALWAYS, L, 0, 0, p, dec_bnz, f, "bdnz"  ); }
    

  // a not l
  // cond branches

  void blta ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LT, L, 1, 0, p, no_ctr, f, "blta" ); }
  void blea ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LE, L, 1, 0, p, no_ctr, f, "blea" ); }
  void bgea ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GE, L, 1, 0, p, no_ctr, f, "bgea" ); }
  void bgta ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GT, L, 1, 0, p, no_ctr, f, "bgta" ); }
  void beqa ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     EQ, L, 1, 0, p, no_ctr, f, "beqa" ); }
  void bnea ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NE, L, 1, 0, p, no_ctr, f, "bnea" ); }
  void bsoa ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     SO, L, 1, 0, p, no_ctr, f, "bsoa" ); }
  void bnsa ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NS, L, 1, 0, p, no_ctr, f, "bnsa" ); }
  void buna ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     UN, L, 1, 0, p, no_ctr, f, "buna" ); }
  void bnua ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NU, L, 1, 0, p, no_ctr, f, "bnua" ); }
  void balwa( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm( ALWAYS, L, 1, 0, p, no_ctr, f, "balwa"); }
     
  // also dec ctr and branch if zero AND the condition
  void bdzlta( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LT, L, 1, 0, p, dec_bz, f, "bdzlta"); }
  void bdzlea( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LE, L, 1, 0, p, dec_bz, f, "bdzlea"); }
  void bdzgea( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GE, L, 1, 0, p, dec_bz, f, "bdzgea"); }
  void bdzgta( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GT, L, 1, 0, p, dec_bz, f, "bdzgta"); }
  void bdzeqa( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     EQ, L, 1, 0, p, dec_bz, f, "bdzeqa"); }
  void bdznea( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NE, L, 1, 0, p, dec_bz, f, "bdznea"); }
  void bdzsoa( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     SO, L, 1, 0, p, dec_bz, f, "bdzsoa"); }
  void bdznsa( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NS, L, 1, 0, p, dec_bz, f, "bdznsa"); }
  void bdzuna( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     UN, L, 1, 0, p, dec_bz, f, "bdzuna"); }
  void bdznua( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NU, L, 1, 0, p, dec_bz, f, "bdznua"); }
  void bdza  ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm( ALWAYS, L, 1, 0, p, dec_bz, f, "bdza"  ); }
    
  // also dec ctr and branch if nonzero AND the condition
  void bdnzlta( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LT, L, 1, 0, p, dec_bnz, f, "bdnzlta"); }
  void bdnzlea( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LE, L, 1, 0, p, dec_bnz, f, "bdnzlea"); }
  void bdnzgea( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GE, L, 1, 0, p, dec_bnz, f, "bdnzgea"); }
  void bdnzgta( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GT, L, 1, 0, p, dec_bnz, f, "bdnzgta"); }
  void bdnzeqa( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     EQ, L, 1, 0, p, dec_bnz, f, "bdnzeqa"); }
  void bdnznea( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NE, L, 1, 0, p, dec_bnz, f, "bdnznea"); }
  void bdnzsoa( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     SO, L, 1, 0, p, dec_bnz, f, "bdnzsoa"); }
  void bdnznsa( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NS, L, 1, 0, p, dec_bnz, f, "bdnznsa"); }
  void bdnzuna( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     UN, L, 1, 0, p, dec_bnz, f, "bdnzuna"); }
  void bdnznua( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NU, L, 1, 0, p, dec_bnz, f, "bdnznua"); }
  void bdnza  ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm( ALWAYS, L, 1, 0, p, dec_bnz, f, "bdnza"  ); }

  // not a, l
  // cond branches

  void bltl ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LT, L, 0, 1, p, no_ctr, f, "bltl" ); }
  void blel ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LE, L, 0, 1, p, no_ctr, f, "blel" ); }
  void bgel ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GE, L, 0, 1, p, no_ctr, f, "bgel" ); }
  void bgtl ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GT, L, 0, 1, p, no_ctr, f, "bgtl" ); }
  void beql ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     EQ, L, 0, 1, p, no_ctr, f, "beql" ); }
  void bnel ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NE, L, 0, 1, p, no_ctr, f, "bnel" ); }
  void bsol ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     SO, L, 0, 1, p, no_ctr, f, "bsol" ); }
  void bnsl ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NS, L, 0, 1, p, no_ctr, f, "bnsl" ); }
  void bunl ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     UN, L, 0, 1, p, no_ctr, f, "bunl" ); }
  void bnul ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NU, L, 0, 1, p, no_ctr, f, "bnul" ); }
  void balwl( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm( ALWAYS, L, 0, 1, p, no_ctr, f, "balwl"); }
     
  // also dec ctr and branch if zero AND the condition
  void bdzltl( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LT, L, 0, 1, p, dec_bz, f, "bdzltl"); }
  void bdzlel( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LE, L, 0, 1, p, dec_bz, f, "bdzlel"); }
  void bdzgel( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GE, L, 0, 1, p, dec_bz, f, "bdzgel"); }
  void bdzgtl( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GT, L, 0, 1, p, dec_bz, f, "bdzgtl"); }
  void bdzeql( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     EQ, L, 0, 1, p, dec_bz, f, "bdzeql"); }
  void bdznel( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NE, L, 0, 1, p, dec_bz, f, "bdznel"); }
  void bdzsol( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     SO, L, 0, 1, p, dec_bz, f, "bdzsol"); }
  void bdznsl( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NS, L, 0, 1, p, dec_bz, f, "bdznsl"); }
  void bdzunl( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     UN, L, 0, 1, p, dec_bz, f, "bdzunl"); }
  void bdznul( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NU, L, 0, 1, p, dec_bz, f, "bdznul"); }
  void bdzl  ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm( ALWAYS, L, 0, 1, p, dec_bz, f, "bdzl"  ); }
    
  // also dec ctr and branch if nonzero AND the condition
  void bdnzltl( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LT, L, 0, 1, p, dec_bnz, f, "bdnzltl"); }
  void bdnzlel( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LE, L, 0, 1, p, dec_bnz, f, "bdnzlel"); }
  void bdnzgel( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GE, L, 0, 1, p, dec_bnz, f, "bdnzgel"); }
  void bdnzgtl( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GT, L, 0, 1, p, dec_bnz, f, "bdnzgtl"); }
  void bdnzeql( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     EQ, L, 0, 1, p, dec_bnz, f, "bdnzeql"); }
  void bdnznel( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NE, L, 0, 1, p, dec_bnz, f, "bdnznel"); }
  void bdnzsol( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     SO, L, 0, 1, p, dec_bnz, f, "bdnzsol"); }
  void bdnznsl( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NS, L, 0, 1, p, dec_bnz, f, "bdnznsl"); }
  void bdnzunl( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     UN, L, 0, 1, p, dec_bnz, f, "bdnzunl"); }
  void bdnznul( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NU, L, 0, 1, p, dec_bnz, f, "bdnznul"); }
  void bdnzl  ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm( ALWAYS, L, 0, 1, p, dec_bnz, f, "bdnzl"  ); }

  // a l
  // cond branches

  void bltla ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LT, L, 1, 1, p, no_ctr, f, "bltla" ); }
  void blela ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LE, L, 1, 1, p, no_ctr, f, "blela" ); }
  void bgela ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GE, L, 1, 1, p, no_ctr, f, "bgela" ); }
  void bgtla ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GT, L, 1, 1, p, no_ctr, f, "bgtla" ); }
  void beqla ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     EQ, L, 1, 1, p, no_ctr, f, "beqla" ); }
  void bnela ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NE, L, 1, 1, p, no_ctr, f, "bnela" ); }
  void bsola ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     SO, L, 1, 1, p, no_ctr, f, "bsola" ); }
  void bnsla ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NS, L, 1, 1, p, no_ctr, f, "bnsla" ); }
  void bunla ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     UN, L, 1, 1, p, no_ctr, f, "bunla" ); }
  void bnula ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NU, L, 1, 1, p, no_ctr, f, "bnula" ); }
  void balwla( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm( ALWAYS, L, 1, 1, p, no_ctr, f, "balwla"); }
     
  // also dec ctr and branch if zero AND the condition
  void bdzltla( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LT, L, 1, 1, p, dec_bz, f, "bdzltla"); }
  void bdzlela( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LE, L, 1, 1, p, dec_bz, f, "bdzlela"); }
  void bdzgela( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GE, L, 1, 1, p, dec_bz, f, "bdzgela"); }
  void bdzgtla( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GT, L, 1, 1, p, dec_bz, f, "bdzgtla"); }
  void bdzeqla( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     EQ, L, 1, 1, p, dec_bz, f, "bdzeqla"); }
  void bdznela( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NE, L, 1, 1, p, dec_bz, f, "bdznela"); }
  void bdzsola( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     SO, L, 1, 1, p, dec_bz, f, "bdzsola"); }
  void bdznsla( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NS, L, 1, 1, p, dec_bz, f, "bdznsla"); }
  void bdzunla( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     UN, L, 1, 1, p, dec_bz, f, "bdzunla"); }
  void bdznula( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NU, L, 1, 1, p, dec_bz, f, "bdznula"); }
  void bdzla  ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm( ALWAYS, L, 1, 1, p, dec_bz, f, "bdzla"  ); }
    
  // also dec ctr and branch if nonzero AND the condition
  void bdnzltla( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LT, L, 1, 1, p, dec_bnz, f, "bdnzltla"); }
  void bdnzlela( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     LE, L, 1, 1, p, dec_bnz, f, "bdnzlela"); }
  void bdnzgela( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GE, L, 1, 1, p, dec_bnz, f, "bdnzgela"); }
  void bdnzgtla( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     GT, L, 1, 1, p, dec_bnz, f, "bdnzgtla"); }
  void bdnzeqla( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     EQ, L, 1, 1, p, dec_bnz, f, "bdnzeqla"); }
  void bdnznela( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NE, L, 1, 1, p, dec_bnz, f, "bdnznela"); }
  void bdnzsola( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     SO, L, 1, 1, p, dec_bnz, f, "bdnzsola"); }
  void bdnznsla( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NS, L, 1, 1, p, dec_bnz, f, "bdnznsla"); }
  void bdnzunla( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     UN, L, 1, 1, p, dec_bnz, f, "bdnzunla"); }
  void bdnznula( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm(     NU, L, 1, 1, p, dec_bnz, f, "bdnznula"); }
  void bdnzla  ( Label& L, BO_Predict p = predict_usual, CR_Field f = cr0)  { BForm( ALWAYS, L, 1, 1, p, dec_bnz, f, "bdnzla"  ); }    
          
         
  // cond branches to link reg
  // no setting link

  void bltlr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LT, BcrLinkRegXOp, 0, p, no_ctr, f, "bltlr" ); }
  void blelr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LE, BcrLinkRegXOp, 0, p, no_ctr, f, "blelr" ); }
  void bgelr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GE, BcrLinkRegXOp, 0, p, no_ctr, f, "bgelr" ); }
  void bgtlr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GT, BcrLinkRegXOp, 0, p, no_ctr, f, "bgtlr" ); }
  void beqlr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      EQ, BcrLinkRegXOp, 0, p, no_ctr, f, "beqlr" ); }
  void bnelr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NE, BcrLinkRegXOp, 0, p, no_ctr, f, "bnelr" ); }
  void bsolr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      SO, BcrLinkRegXOp, 0, p, no_ctr, f, "bsolr" ); }
  void bnslr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NS, BcrLinkRegXOp, 0, p, no_ctr, f, "bnslr" ); }
  void bunlr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      UN, BcrLinkRegXOp, 0, p, no_ctr, f, "bunlr" ); }
  void bnulr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NU, BcrLinkRegXOp, 0, p, no_ctr, f, "bnulr" ); }
  void balwlr( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(  ALWAYS, BcrLinkRegXOp, 0, p, no_ctr, f, "balwlr"); }
        

  // cond branches to count reg
  // setting link
    
  void bltlrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LT, BcrLinkRegXOp, 1, p, no_ctr, f, "bltlrl" ); }
  void blelrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LE, BcrLinkRegXOp, 1, p, no_ctr, f, "blelrl" ); }
  void bgelrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GE, BcrLinkRegXOp, 1, p, no_ctr, f, "bgelrl" ); }
  void bgtlrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GT, BcrLinkRegXOp, 1, p, no_ctr, f, "bgtlrl" ); }
  void beqlrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      EQ, BcrLinkRegXOp, 1, p, no_ctr, f, "beqlrl" ); }
  void bnelrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NE, BcrLinkRegXOp, 1, p, no_ctr, f, "bnelrl" ); }
  void bsolrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      SO, BcrLinkRegXOp, 1, p, no_ctr, f, "bsolrl" ); }
  void bnslrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NS, BcrLinkRegXOp, 1, p, no_ctr, f, "bnslrl" ); }
  void bunlrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      UN, BcrLinkRegXOp, 1, p, no_ctr, f, "bunlrl" ); }
  void bnulrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NU, BcrLinkRegXOp, 1, p, no_ctr, f, "bnulrl" ); }
  void balwlrl( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(  ALWAYS, BcrLinkRegXOp, 1, p, no_ctr, f, "balwlrl"); }
          
         
  // cond branches to link reg, decr ctr br on zero
  // no setting link

  void bdzltlr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LT, BcrLinkRegXOp, 0, p, dec_bz, f, "bdzltlr" ); }
  void bdzlelr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LE, BcrLinkRegXOp, 0, p, dec_bz, f, "bdzlelr" ); }
  void bdzgelr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GE, BcrLinkRegXOp, 0, p, dec_bz, f, "bdzgelr" ); }
  void bdzgtlr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GT, BcrLinkRegXOp, 0, p, dec_bz, f, "bdzgtlr" ); }
  void bdzeqlr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      EQ, BcrLinkRegXOp, 0, p, dec_bz, f, "bdzeqlr" ); }
  void bdznelr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NE, BcrLinkRegXOp, 0, p, dec_bz, f, "bdznelr" ); }
  void bdzsolr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      SO, BcrLinkRegXOp, 0, p, dec_bz, f, "bdzsolr" ); }
  void bdznslr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NS, BcrLinkRegXOp, 0, p, dec_bz, f, "bdznslr" ); }
  void bdzunlr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      UN, BcrLinkRegXOp, 0, p, dec_bz, f, "bdzunlr" ); }
  void bdznulr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NU, BcrLinkRegXOp, 0, p, dec_bz, f, "bdznulr" ); }
  void bdzalwlr( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(  ALWAYS, BcrLinkRegXOp, 0, p, dec_bz, f, "bdzalwlr"); }
        

  // cond branches to link reg, decr ctr br on zero
  // setting link
    
  void bdzltlrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LT, BcrLinkRegXOp, 1, p, dec_bz, f, "bdzltlrl" ); }
  void bdzlelrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LE, BcrLinkRegXOp, 1, p, dec_bz, f, "bdzlelrl" ); }
  void bdzgelrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GE, BcrLinkRegXOp, 1, p, dec_bz, f, "bdzgelrl" ); }
  void bdzgtlrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GT, BcrLinkRegXOp, 1, p, dec_bz, f, "bdzgtlrl" ); }
  void bdzeqlrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      EQ, BcrLinkRegXOp, 1, p, dec_bz, f, "bdzeqlrl" ); }
  void bdznelrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NE, BcrLinkRegXOp, 1, p, dec_bz, f, "bdznelrl" ); }
  void bdzsolrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      SO, BcrLinkRegXOp, 1, p, dec_bz, f, "bdzsolrl" ); }
  void bdznslrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NS, BcrLinkRegXOp, 1, p, dec_bz, f, "bdznslrl" ); }
  void bdzunlrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      UN, BcrLinkRegXOp, 1, p, dec_bz, f, "bdzunlrl" ); }
  void bdznulrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NU, BcrLinkRegXOp, 1, p, dec_bz, f, "bdznulrl" ); }
  void bdzalwlrl( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(  ALWAYS, BcrLinkRegXOp, 1, p, dec_bz, f, "bdzalwlrl"); }
          
         
  // cond branches to link reg, decr ctr br on nonzero
  // no setting link

  void bdnzltlr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LT, BcrLinkRegXOp, 0, p, dec_bnz, f, "bdnzltlr" ); }
  void bdnzlelr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LE, BcrLinkRegXOp, 0, p, dec_bnz, f, "bdnzlelr" ); }
  void bdnzgelr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GE, BcrLinkRegXOp, 0, p, dec_bnz, f, "bdnzgelr" ); }
  void bdnzgtlr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GT, BcrLinkRegXOp, 0, p, dec_bnz, f, "bdnzgtlr" ); }
  void bdnzeqlr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      EQ, BcrLinkRegXOp, 0, p, dec_bnz, f, "bdnzeqlr" ); }
  void bdnznelr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NE, BcrLinkRegXOp, 0, p, dec_bnz, f, "bdnznelr" ); }
  void bdnzsolr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      SO, BcrLinkRegXOp, 0, p, dec_bnz, f, "bdnzsolr" ); }
  void bdnznslr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NS, BcrLinkRegXOp, 0, p, dec_bnz, f, "bdnznslr" ); }
  void bdnzunlr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      UN, BcrLinkRegXOp, 0, p, dec_bnz, f, "bdnzunlr" ); }
  void bdnznulr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NU, BcrLinkRegXOp, 0, p, dec_bnz, f, "bdnznulr" ); }
  void bdnzalwlr( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(  ALWAYS, BcrLinkRegXOp, 0, p, dec_bnz, f, "bdnzalwlr"); }
        

  // cond branches to link reg, decr ctr br on zero
  // setting link
    
  void bdnzltlrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LT, BcrLinkRegXOp, 1, p, dec_bnz, f, "bdnzltlrl" ); }
  void bdnzlelrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LE, BcrLinkRegXOp, 1, p, dec_bnz, f, "bdnzlelrl" ); }
  void bdnzgelrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GE, BcrLinkRegXOp, 1, p, dec_bnz, f, "bdnzgelrl" ); }
  void bdnzgtlrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GT, BcrLinkRegXOp, 1, p, dec_bnz, f, "bdnzgtlrl" ); }
  void bdnzeqlrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      EQ, BcrLinkRegXOp, 1, p, dec_bnz, f, "bdnzeqlrl" ); }
  void bdnznelrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NE, BcrLinkRegXOp, 1, p, dec_bnz, f, "bdnznelrl" ); }
  void bdnzsolrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      SO, BcrLinkRegXOp, 1, p, dec_bnz, f, "bdnzsolrl" ); }
  void bdnznslrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NS, BcrLinkRegXOp, 1, p, dec_bnz, f, "bdnznslrl" ); }
  void bdnzunlrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      UN, BcrLinkRegXOp, 1, p, dec_bnz, f, "bdnzunlrl" ); }
  void bdnznulrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NU, BcrLinkRegXOp, 1, p, dec_bnz, f, "bdnznulrl" ); }
  void bdnzalwlrl( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(  ALWAYS, BcrLinkRegXOp, 1, p, dec_bnz, f, "bdnzalwlrl"); }
          
         
  // cond branches to count reg
  // no setting link
  // , (decr ctr is illegal)

  void bltctr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LT, BcrCountRegXOp, 0, p, no_ctr, f, "bltctr" ); }
  void blectr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LE, BcrCountRegXOp, 0, p, no_ctr, f, "blectr" ); }
  void bgectr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GE, BcrCountRegXOp, 0, p, no_ctr, f, "bgectr" ); }
  void bgtctr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GT, BcrCountRegXOp, 0, p, no_ctr, f, "bgtctr" ); }
  void beqctr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      EQ, BcrCountRegXOp, 0, p, no_ctr, f, "beqctr" ); }
  void bnectr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NE, BcrCountRegXOp, 0, p, no_ctr, f, "bnectr" ); }
  void bsoctr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      SO, BcrCountRegXOp, 0, p, no_ctr, f, "bsoctr" ); }
  void bnsctr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NS, BcrCountRegXOp, 0, p, no_ctr, f, "bnsctr" ); }
  void bunctr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      UN, BcrCountRegXOp, 0, p, no_ctr, f, "bunctr" ); }
  void bnuctr ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NU, BcrCountRegXOp, 0, p, no_ctr, f, "bnuctr" ); }
  void balwctr( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(  ALWAYS, BcrCountRegXOp, 0, p, no_ctr, f, "balwctr"); }
        

  // cond branches to count reg
  // setting link
    
  void bltctrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LT, BcrCountRegXOp, 1, p, no_ctr, f, "bltctrl" ); }
  void blectrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      LE, BcrCountRegXOp, 1, p, no_ctr, f, "blectrl" ); }
  void bgectrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GE, BcrCountRegXOp, 1, p, no_ctr, f, "bgectrl" ); }
  void bgtctrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      GT, BcrCountRegXOp, 1, p, no_ctr, f, "bgtctrl" ); }
  void beqctrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      EQ, BcrCountRegXOp, 1, p, no_ctr, f, "beqctrl" ); }
  void bnectrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NE, BcrCountRegXOp, 1, p, no_ctr, f, "bnectrl" ); }
  void bsoctrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      SO, BcrCountRegXOp, 1, p, no_ctr, f, "bsoctrl" ); }
  void bnsctrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NS, BcrCountRegXOp, 1, p, no_ctr, f, "bnsctrl" ); }
  void bunctrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      UN, BcrCountRegXOp, 1, p, no_ctr, f, "bunctrl" ); }
  void bnuctrl ( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(      NU, BcrCountRegXOp, 1, p, no_ctr, f, "bnuctrl" ); }
  void balwctrl( BO_Predict p = predict_usual, CR_Field f = cr0)  { XLForm2(  ALWAYS, BcrCountRegXOp, 1, p, no_ctr, f, "balwctrl"); }



  // system call      
    
  void sc() { assemble(OPCD(opcd_SystemCall) | 2); if (printing) lprintf("  sc\n");}
    
    
   // logical op in bits in cond reg
  void crand(  CR_Bit bt,  CR_Bit ba,  CR_Bit bb)  { XLForm1( CrlAndXOp,  bt, ba, bb, "crand   %s, %s, %s\n" ); }
  void cror(   CR_Bit bt,  CR_Bit ba,  CR_Bit bb)  { XLForm1( CrlOrXOp,   bt, ba, bb, "cror    %s, %s, %s\n" ); }
  void crxor(  CR_Bit bt,  CR_Bit ba,  CR_Bit bb)  { XLForm1( CrlXorXOp,  bt, ba, bb, "crxor   %s, %s, %s\n" ); }
  void crnand( CR_Bit bt,  CR_Bit ba,  CR_Bit bb)  { XLForm1( CrlNandXOp, bt, ba, bb, "crnand  %s, %s, %s\n" ); }
  void crnor(  CR_Bit bt,  CR_Bit ba,  CR_Bit bb)  { XLForm1( CrlNorXOp,  bt, ba, bb, "crnor   %s, %s, %s\n" ); }
  void creqv(  CR_Bit bt,  CR_Bit ba,  CR_Bit bb)  { XLForm1( CrlEqvXOp,  bt, ba, bb, "creqv   %s, %s, %s\n" ); }
  void crandc( CR_Bit bt,  CR_Bit ba,  CR_Bit bb)  { XLForm1( CrlAndcXOp, bt, ba, bb, "crandc  %s, %s, %s\n" ); }
  void crorc(  CR_Bit bt,  CR_Bit ba,  CR_Bit bb)  { XLForm1( CrlOrcXOp,  bt, ba, bb, "crorc   %s, %s, %s\n" ); }
  
  void crmove( CR_Bit bt, CR_Bit ba ) { XLForm1( CrlOrXOp,   bt, ba, ba, "crmove  %s, %s\n" ); }
  void crclr(  CR_Bit bt) { XLForm1( CrlXorXOp,  bt, bt, bt, "crclr   %s\n" ); }
  void crnot(  CR_Bit bt, CR_Bit ba) { XLForm1( CrlNorXOp,  bt, ba, ba, "crnot   %s, %s\n" ); }
  void crset(  CR_Bit bt) { XLForm1( CrlEqvXOp,  bt, bt, bt, "crset   %s\n" ); }
   
  // load/store D-forms  
  void lbz (Location rt, int32 d, OperandType t, Location ra) { DForm1_or_3( "lbz",  opcd_LoadByteAndZero,                 rt, ra, d, t ); }
  void lbzu(Location rt, int32 d, OperandType t, Location ra) { DForm1_or_3( "lbzu", opcd_LoadByteAndZeroWithUpdate,       rt, ra, d, t ); }
  void lhz (Location rt, int32 d, OperandType t, Location ra) { DForm1_or_3( "lhz",  opcd_LoadHalfwordAndZero,             rt, ra, d, t ); }
  void lhzu(Location rt, int32 d, OperandType t, Location ra) { DForm1_or_3( "lhzu", opcd_LoadHalfwordAndZeroWithUpdate,   rt, ra, d, t ); }
  void lha (Location rt, int32 d, OperandType t, Location ra) { DForm1_or_3( "lha",  opcd_LoadHalfwordAlgebraic,           rt, ra, d, t ); }
  void lhau(Location rt, int32 d, OperandType t, Location ra) { DForm1_or_3( "lhau", opcd_LoadHalfwordAlgebraicWithUpdate, rt, ra, d, t ); }
  void lwz (Location rt, int32 d, OperandType t, Location ra) { DForm1_or_3( "lwz",  opcd_LoadWordAndZero,                 rt, ra, d, t ); }
  void lwzu(Location rt, int32 d, OperandType t, Location ra) { DForm1_or_3( "lwzu", opcd_LoadWordAndZeroWithUpdate,       rt, ra, d, t ); }
  
  // load/store DS forms
  void lwa    ( Location rt, int32 ds, OperandType t, Location ra )    { DSForm( "lwa",  opcd_LoadDS,  dsx_WordAlgebraic,    rt, ra, ds, t); }
  void ld     ( Location rt, int32 ds, OperandType t, Location ra )    { DSForm( "ld",   opcd_LoadDS,  dsx_Doubleword,       rt, ra, ds, t); }
  void ldu    ( Location rt, int32 ds, OperandType t, Location ra )    { DSForm( "ldu",  opcd_LoadDS,  dsx_DoublewordUpdate, rt, ra, ds, t); }

  void stb (Location rs, int32 d, OperandType t, Location ra) { DForm1_or_3( "stb",  opcd_StoreByte,                       rs, ra, d, t ); }
  void stbu(Location rs, int32 d, OperandType t, Location ra) { DForm1_or_3( "stbu", opcd_StoreByteWithUpdate,             rs, ra, d, t ); }
  void sth (Location rs, int32 d, OperandType t, Location ra) { DForm1_or_3( "sth",  opcd_StoreHalfword,                   rs, ra, d, t ); }
  void sthu(Location rs, int32 d, OperandType t, Location ra) { DForm1_or_3( "sthu", opcd_StoreHalfwordWithUpdate,         rs, ra, d, t ); }
  void stw (Location rs, int32 d, OperandType t, Location ra) { DForm1_or_3( "stw",  opcd_StoreWord,                       rs, ra, d, t ); }
  void stwu(Location rs, int32 d, OperandType t, Location ra) { DForm1_or_3( "stwu", opcd_StoreWordWithUpdate,             rs, ra, d, t ); }

  // load/store DS forms
  void std    ( Location rs, int32 ds, OperandType t, Location ra )    { DSForm( "std",  opcd_StoreDS, dsx_Doubleword,       rs, ra, ds, t); }
  void stdu   ( Location rs, int32 ds, OperandType t, Location ra )    { DSForm( "stdu", opcd_StoreDS, dsx_DoublewordUpdate, rs, ra, ds, t); }


  // load/store X-forms (Indexed)
  void lbzx   ( Location rt, Location ra, Location rb ) { XForm1_6_7( "lbzx",  LoadByteAndZeroXOp,              rt, ra, rb); } 
  void lbzux  ( Location rt, Location ra, Location rb ) { XForm1_6_7( "lbzux", LoadByteAndZeroUpdateXOp,        rt, ra, rb); } 
  void lhzx   ( Location rt, Location ra, Location rb ) { XForm1_6_7( "lhzx",  LoadHalfwordAndZeroXOp,          rt, ra, rb); } 
  void lhzux  ( Location rt, Location ra, Location rb ) { XForm1_6_7( "lhzux", LoadHalfwordAndZeroUpdateXOp,    rt, ra, rb); } 
  void lhax   ( Location rt, Location ra, Location rb ) { XForm1_6_7( "lhax",  LoadHalfwordAlgebraicXOp,        rt, ra, rb); } 
  void lhaux  ( Location rt, Location ra, Location rb ) { XForm1_6_7( "lhaux", LoadHalfwordAlgebraicUpdateXOp,  rt, ra, rb); } 
  void lwzx   ( Location rt, Location ra, Location rb ) { XForm1_6_7( "lwzx",  LoadWordAndZeroXOp,              rt, ra, rb); } 
  void lwzux  ( Location rt, Location ra, Location rb ) { XForm1_6_7( "lwzux", LoadWordAndZeroUpdateXOp,        rt, ra, rb); } 
  void lwax   ( Location rt, Location ra, Location rb ) { XForm1_6_7( "lwax",  LoadWordAlgebraicXOp,            rt, ra, rb); } 
  void lwaux  ( Location rt, Location ra, Location rb ) { XForm1_6_7( "lwaux", LoadWordAlgebraicUpdateXOp,      rt, ra, rb); } 
  void ldx    ( Location rt, Location ra, Location rb ) { XForm1_6_7( "ldx",   LoadDoublewordXOp,               rt, ra, rb); } 
  void ldux   ( Location rt, Location ra, Location rb ) { XForm1_6_7( "ludx",  LoadDoublewordUpdateXOp,         rt, ra, rb); } 
    
  void stbx   ( Location rs, Location ra, Location rb ) { XForm1_6_7( "stbx",  StoreByteXOp,                    rs, ra, rb); } 
  void stbux  ( Location rs, Location ra, Location rb ) { XForm1_6_7( "stbux", StoreByteUpdateXOp,              rs, ra, rb); } 
  void sthx   ( Location rs, Location ra, Location rb ) { XForm1_6_7( "sthx",  StoreHalfwordXOp,                rs, ra, rb); } 
  void sthux  ( Location rs, Location ra, Location rb ) { XForm1_6_7( "sthux", StoreHalfwordUpdateXOp,          rs, ra, rb); } 
  void stwx   ( Location rs, Location ra, Location rb ) { XForm1_6_7( "stwx",  StoreWordXOp,                    rs, ra, rb); } 
  void stwux  ( Location rs, Location ra, Location rb ) { XForm1_6_7( "stwux", StoreWordUpdateXOp,              rs, ra, rb); } 
  void stdx   ( Location rs, Location ra, Location rb ) { XForm1_6_7( "stdx",  StoreDoublewordXOp,              rs, ra, rb); } 
  void stdux  ( Location rs, Location ra, Location rb ) { XForm1_6_7( "stdux", StoreDoublewordUpdateXOp,        rs, ra, rb); } 


  // load/store multiple
  void lmw (Location rt, int32 d, OperandType t, Location ra) { DForm1_or_3( "lmw",  opcd_LoadMultipleWord,                rt, ra, d, t ); }
  void stmw(Location rs, int32 d, OperandType t, Location ra) { DForm1_or_3( "stmw", opcd_StoreMultipleWord,               rs, ra, d, t ); }
 
    
  // load/store byte-reversing forms:
  void lhbrx  ( Location rt, Location ra, Location rb ) { XForm1_6_7( "lhbrx",  LoadHalfwordByteReversedXOp,     rt, ra, rb); } 
  void lwbrx  ( Location rt, Location ra, Location rb ) { XForm1_6_7( "lwbrx",  LoadWordByteReversedXOp,         rt, ra, rb); } 
  void sthbrx ( Location rs, Location ra, Location rb ) { XForm1_6_7( "sthbrx", StoreHalfwordByteReversedXOp,    rs, ra, rb); } 
  void stwbrx ( Location rs, Location ra, Location rb ) { XForm1_6_7( "stwbrx", StoreWordByteReveresedXOp,       rs, ra, rb); } 
  
  
  // fixed-point move assist instructions (multiword, unaligned)
  // Immediate length
  void  lswi   ( Location rt, Location ra, int32 nb )     { XFormMoveAssist(  "lswi",  LoadStringWordImmediateXOp,   rt, ra, nb ); }
  void  stswi  ( Location rs, Location ra, int32 nb )     { XFormMoveAssist( "stswi", StoreStringWordImmediateXOp,   rs, ra, nb ); }

  // Indexed
  void  lswx   ( Location rt, Location ra, Location rb ) { XForm1_6_7( "lswx",  LoadStringWordXOp,               rt, ra, rb); } 
  void  stswx  ( Location rs, Location ra, Location rb ) { XForm1_6_7( "stswx", StoreStringWordXOp,              rs, ra, rb); } 

  // storage synchronization  
  // Loads:
  void lwarx  ( Location rt, Location ra, Location rb ) { XForm1_6_7( "lwarx", LoadWordAndReserveXOp ,          rt, ra, rb); } 
  void ldarx  ( Location rt, Location ra, Location rb ) { XForm1_6_7( "ldarx", LoadDoublewordAndReserveXOp,     rt, ra, rb); } 
  // Stores:
  void stwcx_ ( Location rs, Location ra, Location rb ) { XForm1_6_7( "stwcx_", StoreWordConditionalXOp ,          rs, ra, rb, 1); } 
  void stdcx_ ( Location rs, Location ra, Location rb ) { XForm1_6_7( "stdcx_", StoreDoublewordConditionalXOp,     rs, ra, rb, 1); } 

  void sync() { assemble( OPCD(opcd_XO) | XO1(SynchronizeXOp) );  if (printing)  lprintf(" sync\n"); }


  // Fixed-point arithmetic immediates

  void addi   ( Location rt, Location ra, int32 si, OperandType t )  { DFormSI( "  addi   %s, %s, %d\n", RegisterNames[rt], RegisterNames[ra], (void*)si,  opcd_AddImmediate,                  rt, ra, si, t, KF_si); }
  void addic  ( Location rt, Location ra, int32 si, OperandType t )  { DFormSI( "  addic  %s, %s, %d\n", RegisterNames[rt], RegisterNames[ra], (void*)si,  opcd_AddImmediateCarrying,          rt, ra, si, t, KF_si); }
  void addic_ ( Location rt, Location ra, int32 si, OperandType t )  { DFormSI( "  addic_ %s, %s, %d\n", RegisterNames[rt], RegisterNames[ra], (void*)si,  opcd_AddImmediateCarryingAndRecord, rt, ra, si, t, KF_si); }
  void subfic ( Location rt, Location ra, int32 si, OperandType t )  { DFormSI( "  subfic %s, %s, %d\n", RegisterNames[rt], RegisterNames[ra], (void*)si,  opcd_SubtractFromImmediateCarrying, rt, ra, si, t, KF_si); }
  void mulli  ( Location rt, Location ra, int32 si, OperandType t )  { DFormSI( "  mulli  %s, %s, %d\n", RegisterNames[rt], RegisterNames[ra], (void*)si,  opcd_MultiplyLowImmediate,          rt, ra, si, t, KF_si); }

  void li     ( Location rt,              int32 si, OperandType t )  { DFormSI( "  li  %s, %d\n",       RegisterNames[rt], (void*)si,         0,                 opcd_AddImmediate, rt, R0,  si, t, KF_si); }
  void la     ( Location rt, int32 si, OperandType t, Location ra )  { DFormSI( "  la  %s, %d(%s)\n",   RegisterNames[rt], (void*)si,         RegisterNames[ra], opcd_AddImmediate, rt, ra,  si, t, KF_si); }
  void subi   ( Location rt, Location ra, int32 si, OperandType t )  { DFormSI( "  subi  %s, %s, %d\n", RegisterNames[rt], RegisterNames[ra], (void*)si,         opcd_AddImmediate, rt, ra, -si, t, KF_si); }

  void addis  ( Location rt, Location ra, int32 si, OperandType t, Kind_of_Instruction_Field f )  { DFormSI( "  addis  %s, %s, %d\n",  RegisterNames[rt], RegisterNames[ra], (void*)si,   opcd_AddImmediateShifted,           rt, ra, si, t, f); }
  void lis    ( Location rt,              int32 si, OperandType t, Kind_of_Instruction_Field f )  { DFormSI( "  lis  %s, 0x%x\n",      RegisterNames[rt], (void*)si,         0,           opcd_AddImmediateShifted, rt, R0,  si, t, f); }
  void subis  ( Location rt, Location ra, int32 si, OperandType t, Kind_of_Instruction_Field f )  { DFormSI( "  subis  %s, %s, %d\n",  RegisterNames[rt], RegisterNames[ra], (void*)si,   opcd_AddImmediateShifted, rt, ra, -si, t, f); }

  void subic  ( Location rt, Location ra, int32 si, OperandType t )  { DFormSI( "  subic  %s, %s, %d\n",  RegisterNames[rt], RegisterNames[ra], (void*)si, opcd_AddImmediateCarrying,          rt, ra, -si, t, KF_si); }
  void subic_ ( Location rt, Location ra, int32 si, OperandType t )  { DFormSI( "  subic_  %s, %s, %d\n", RegisterNames[rt], RegisterNames[ra], (void*)si, opcd_AddImmediateCarryingAndRecord, rt, ra, -si, t, KF_si); }


  // XO forms ( 3 regs )
  // adds:
  void add    ( Location rt, Location ra, Location rb )  { XOForm( AddXOp,                      "add",     "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void addo   ( Location rt, Location ra, Location rb )  { XOForm( AddXOp,                      "addo",    "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 0); }
  void add_   ( Location rt, Location ra, Location rb )  { XOForm( AddXOp,                      "add_",    "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }
  void addo_  ( Location rt, Location ra, Location rb )  { XOForm( AddXOp,                      "addo_",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 1); }

  void subf   ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromXOp,             "subf",    "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void subfo  ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromXOp,             "subfo",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 0); }
  void subf_  ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromXOp,             "subf_",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }
  void subfo_ ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromXOp,             "subfo_",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 1); }

  // add carrying sets carry
  void addc   ( Location rt, Location ra, Location rb )  { XOForm( AddCarryingXOp,              "addc",    "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void addco  ( Location rt, Location ra, Location rb )  { XOForm( AddCarryingXOp,              "addco",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 0); }
  void addc_  ( Location rt, Location ra, Location rb )  { XOForm( AddCarryingXOp,              "addc_",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }
  void addco_ ( Location rt, Location ra, Location rb )  { XOForm( AddCarryingXOp,              "addco_",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 1); }

  void subfc  ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromCarryingXOp,     "subfc",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void subfco ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromCarryingXOp,     "subfco",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 0); }
  void subfc_ ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromCarryingXOp,     "subfc_",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }
  void subfco_( Location rt, Location ra, Location rb )  { XOForm( SubtractFromCarryingXOp,     "subfco_", "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 1); }

  // add extended (adds in carry)
  void adde   ( Location rt, Location ra, Location rb )  { XOForm( AddExtendedXOp,              "adde",    "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void addeo  ( Location rt, Location ra, Location rb )  { XOForm( AddExtendedXOp,              "addeo",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 0); }
  void adde_  ( Location rt, Location ra, Location rb )  { XOForm( AddExtendedXOp,              "adde_",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }
  void addeo_ ( Location rt, Location ra, Location rb )  { XOForm( AddExtendedXOp,              "addeo_",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 1); }

  void subfe  ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromExtendedXOp,     "subfe",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void subfeo ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromExtendedXOp,     "subfeo",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 0); }
  void subfe_ ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromExtendedXOp,     "subfe_",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }
  void subfeo_( Location rt, Location ra, Location rb )  { XOForm( SubtractFromExtendedXOp,     "subfeo_", "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 1); }

  void mulld  ( Location rt, Location ra, Location rb )  { XOForm( MultiplyLowDoublewordXOp,    "mulld",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void mulldo ( Location rt, Location ra, Location rb )  { XOForm( MultiplyLowDoublewordXOp,    "mulldo",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 0); }
  void mulld_ ( Location rt, Location ra, Location rb )  { XOForm( MultiplyLowDoublewordXOp,    "mulld_",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }
  void mulldo_( Location rt, Location ra, Location rb )  { XOForm( MultiplyLowDoublewordXOp,    "mulldo_", "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 1); }

  void mullw  ( Location rt, Location ra, Location rb )  { XOForm( MultiplyLowWordXOp,          "mullw",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void mullwo ( Location rt, Location ra, Location rb )  { XOForm( MultiplyLowWordXOp,          "mullwo",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 0); }
  void mullw_ ( Location rt, Location ra, Location rb )  { XOForm( MultiplyLowWordXOp,          "mullw_",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }
  void mullwo_( Location rt, Location ra, Location rb )  { XOForm( MultiplyLowWordXOp,          "mullwo_", "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 1); }

  // No Oe bit: 
  void mulhd  ( Location rt, Location ra, Location rb )  { XOForm( MultiplyHighDoublewordXOp,         "mulhd",    "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void mulhd_ ( Location rt, Location ra, Location rb )  { XOForm( MultiplyHighDoublewordXOp,         "mulhd_",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }
  void mulhw  ( Location rt, Location ra, Location rb )  { XOForm( MultiplyHighWordXOp,               "mulhw",    "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void mulhw_ ( Location rt, Location ra, Location rb )  { XOForm( MultiplyHighWordXOp,               "mulhw_",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }
  void mulhdu ( Location rt, Location ra, Location rb )  { XOForm( MultiplyHighDoublewordUnsignedXOp, "mulhdu",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void mulhdu_( Location rt, Location ra, Location rb )  { XOForm( MultiplyHighDoublewordUnsignedXOp, "mulhdu_",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }
  void mulhwu ( Location rt, Location ra, Location rb )  { XOForm( MultiplyHighWordUnsignedXOp,       "mulhwu",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void mulhwu_( Location rt, Location ra, Location rb )  { XOForm( MultiplyHighWordUnsignedXOp,       "mulhwu_",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }


  // division:
  void divd   ( Location rt, Location ra, Location rb )  { XOForm( DivideDoublewordXOp,         "divd",    "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void divdo  ( Location rt, Location ra, Location rb )  { XOForm( DivideDoublewordXOp,         "divdo",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 0); }
  void divd_  ( Location rt, Location ra, Location rb )  { XOForm( DivideDoublewordXOp,         "divd_",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }
  void divdo_ ( Location rt, Location ra, Location rb )  { XOForm( DivideDoublewordXOp,         "divdo_",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 1); }

  void divw   ( Location rt, Location ra, Location rb )  { XOForm( DivideWordXOp,               "divw",    "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void divwo  ( Location rt, Location ra, Location rb )  { XOForm( DivideWordXOp,               "divwo",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 0); }
  void divw_  ( Location rt, Location ra, Location rb )  { XOForm( DivideWordXOp,               "divw_",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }
  void divwo_ ( Location rt, Location ra, Location rb )  { XOForm( DivideWordXOp,               "divwo_",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 1); }

  void divdu  ( Location rt, Location ra, Location rb )  { XOForm( DivideDoublewordUnsignedXOp, "divdu",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void divduo ( Location rt, Location ra, Location rb )  { XOForm( DivideDoublewordUnsignedXOp, "divduo",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 0); }
  void divdu_ ( Location rt, Location ra, Location rb )  { XOForm( DivideDoublewordUnsignedXOp, "divdu_",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }
  void divduo_( Location rt, Location ra, Location rb )  { XOForm( DivideDoublewordUnsignedXOp, "divduo_", "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 1); }

  void divwu  ( Location rt, Location ra, Location rb )  { XOForm( DivideWordUnsignedXOp,       "divwu",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 0); }
  void divwuo ( Location rt, Location ra, Location rb )  { XOForm( DivideWordUnsignedXOp,       "divwuo",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 0); }
  void divwu_ ( Location rt, Location ra, Location rb )  { XOForm( DivideWordUnsignedXOp,       "divwu_",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 0, 1); }
  void divwuo_( Location rt, Location ra, Location rb )  { XOForm( DivideWordUnsignedXOp,       "divwuo_", "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, ra, rb, 1, 1); }
 
  // sub and subc use sub(c)f and reverse the operands
  void sub    ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromXOp,             "sub",    "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, rb, ra, 0, 0); }
  void subo   ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromXOp,             "subo",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, rb, ra, 1, 0); }
  void sub_   ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromXOp,             "sub_",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, rb, ra, 0, 1); }
  void subo_  ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromXOp,             "subo_",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, rb, ra, 1, 1); }
   
  void subc  ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromCarryingXOp,     "subc",   "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, rb, ra, 0, 0); }
  void subco ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromCarryingXOp,     "subco",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, rb, ra, 1, 0); }
  void subc_ ( Location rt, Location ra, Location rb )  { XOForm( SubtractFromCarryingXOp,     "subc_",  "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, rb, ra, 0, 1); }
  void subco_( Location rt, Location ra, Location rb )  { XOForm( SubtractFromCarryingXOp,     "subco_", "  %s, %s, %s\n", RegisterNames[rt], RegisterNames[ra], RegisterNames[rb], rt, rb, ra, 1, 1); }


  // forms without rb RegisterNames[rb],
  // add to minus one extended (RA) + CA - 1
  void addme    ( Location rt, Location ra )  { XOForm( AddToMinusOneExtendedXOp, "addme",     "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 0, 0); }
  void addmeo   ( Location rt, Location ra )  { XOForm( AddToMinusOneExtendedXOp, "addmeo",    "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 1, 0); }
  void addme_   ( Location rt, Location ra )  { XOForm( AddToMinusOneExtendedXOp, "addme_",    "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 0, 1); }
  void addmeo_  ( Location rt, Location ra )  { XOForm( AddToMinusOneExtendedXOp, "addmeo_",   "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 1, 1); }

  // sub fr to minus one extended ~(RA) + CA - 1
  void subfme    ( Location rt, Location ra )  { XOForm( SubtractFromMinusOneExtendedXOp, "subfme",     "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 0, 0); }
  void subfmeo   ( Location rt, Location ra )  { XOForm( SubtractFromMinusOneExtendedXOp, "subfmeo",    "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 1, 0); }
  void subfme_   ( Location rt, Location ra )  { XOForm( SubtractFromMinusOneExtendedXOp, "subfme_",    "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 0, 1); }
  void subfmeo_  ( Location rt, Location ra )  { XOForm( SubtractFromMinusOneExtendedXOp, "subfmeo_",   "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 1, 1); }

  // add to zero extended (RA) + CA
  void addze    ( Location rt, Location ra )  { XOForm( AddToZeroExtendedXOp, "addze",     "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 0, 0); }
  void addzeo   ( Location rt, Location ra )  { XOForm( AddToZeroExtendedXOp, "addzeo",    "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 1, 0); }
  void addze_   ( Location rt, Location ra )  { XOForm( AddToZeroExtendedXOp, "addze_",    "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 0, 1); }
  void addzeo_  ( Location rt, Location ra )  { XOForm( AddToZeroExtendedXOp, "addzeo_",   "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 1, 1); }

  // sub fr zero extended 
  void subfze    ( Location rt, Location ra )  { XOForm( SubtractFromZeroExtendedXOp, "subfze",     "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 0, 0); }
  void subfzeo   ( Location rt, Location ra )  { XOForm( SubtractFromZeroExtendedXOp, "subfzeo",    "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 1, 0); }
  void subfze_   ( Location rt, Location ra )  { XOForm( SubtractFromZeroExtendedXOp, "subfze_",    "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 0, 1); }
  void subfzeo_  ( Location rt, Location ra )  { XOForm( SubtractFromZeroExtendedXOp, "subfzeo_",   "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 1, 1); }

  // negate
  void neg    ( Location rt, Location ra )  { XOForm( NegateXOp, "neg",     "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 0, 0); }
  void nego   ( Location rt, Location ra )  { XOForm( NegateXOp, "nego",    "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 1, 0); }
  void neg_   ( Location rt, Location ra )  { XOForm( NegateXOp, "neg_",    "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 0, 1); }
  void nego_  ( Location rt, Location ra )  { XOForm( NegateXOp, "nego_",   "  %s, %s\n", RegisterNames[rt], RegisterNames[ra], 0, rt, ra, R0, 1, 1); }

  // compare immediates:
  void cmpwi ( Location ra, int32 ui, OperandType t, CR_Field cf = cr0 ) { DFormCompare( "cmpwi",  opcd_CompareImmediate,        0, ra, ui, t, cf ); }
  void cmpdi ( Location ra, int32 si, OperandType t, CR_Field cf = cr0 ) { DFormCompare( "cmpdi",  opcd_CompareImmediate,        1, ra, si, t, cf ); }
  void cmplwi( Location ra, int32 ui, OperandType t, CR_Field cf = cr0 ) { DFormCompare( "cmplwi", opcd_CompareLogicalImmediate, 0, ra, ui, t, cf ); }
  void cmpldi( Location ra, int32 ui, OperandType t, CR_Field cf = cr0 ) { DFormCompare( "cmpldi", opcd_CompareLogicalImmediate, 1, ra, ui, t, cf ); }

  // compare registers
  void cmpw ( Location ra, Location rb, CR_Field cf = cr0) { XFormCompare( "cmpw",  CompareXOp,        ra, rb, cf, 0); }
  void cmpd ( Location ra, Location rb, CR_Field cf = cr0) { XFormCompare( "cmpd",  CompareXOp,        ra, rb, cf, 1); }
  void cmplw( Location ra, Location rb, CR_Field cf = cr0) { XFormCompare( "cmplw",  CompareLogicalXOp, ra, rb, cf, 0); }
  void cmpld( Location ra, Location rb, CR_Field cf = cr0) { XFormCompare( "cmpld",  CompareLogicalXOp, ra, rb, cf, 1); }
    

  // trap instructions
  // unconditional:
  void trap() { DoTrapXForm( "trap", to_unc, R0, R0, TrapWordXOp); }


  // conditional, doubleword, immediate:
  void tdlti(Location ra, int32 si, OperandType t) { DoTrapImm( "tdlti", opcd_TrapDoublewordImmediate, to_lt, ra, si, t); }
  void tdlei(Location ra, int32 si, OperandType t) { DoTrapImm( "tdlei", opcd_TrapDoublewordImmediate, to_le, ra, si, t); }
  void tdeqi(Location ra, int32 si, OperandType t) { DoTrapImm( "tdeqi", opcd_TrapDoublewordImmediate, to_eq, ra, si, t); }
  void tdgei(Location ra, int32 si, OperandType t) { DoTrapImm( "tdgei", opcd_TrapDoublewordImmediate, to_ge, ra, si, t); }
  void tdgti(Location ra, int32 si, OperandType t) { DoTrapImm( "tdgti", opcd_TrapDoublewordImmediate, to_gt, ra, si, t); }
  void tdnli(Location ra, int32 si, OperandType t) { DoTrapImm( "tdnli", opcd_TrapDoublewordImmediate, to_nl, ra, si, t); }
  void tdnei(Location ra, int32 si, OperandType t) { DoTrapImm( "tdnei", opcd_TrapDoublewordImmediate, to_ne, ra, si, t); }
  void tdngi(Location ra, int32 si, OperandType t) { DoTrapImm( "tdngi", opcd_TrapDoublewordImmediate, to_ng, ra, si, t); }
  // llt = logical less than (unsigned)
  void tdllti(Location ra, int32 si, OperandType t) { DoTrapImm( "tdllti", opcd_TrapDoublewordImmediate, to_llt, ra, si, t); }
  void tdllei(Location ra, int32 si, OperandType t) { DoTrapImm( "tdllei", opcd_TrapDoublewordImmediate, to_lle, ra, si, t); }
  void tdlgei(Location ra, int32 si, OperandType t) { DoTrapImm( "tdlgei", opcd_TrapDoublewordImmediate, to_lge, ra, si, t); }
  void tdlgti(Location ra, int32 si, OperandType t) { DoTrapImm( "tdlgti", opcd_TrapDoublewordImmediate, to_lgt, ra, si, t); }
  void tdlnli(Location ra, int32 si, OperandType t) { DoTrapImm( "tdlnli", opcd_TrapDoublewordImmediate, to_lnl, ra, si, t); }
  void tdlngi(Location ra, int32 si, OperandType t) { DoTrapImm( "tdlngi", opcd_TrapDoublewordImmediate, to_lng, ra, si, t); }


  // word immediate
  void twlti(Location ra, int32 si, OperandType t) { DoTrapImm( "twlti", opcd_TrapWordImmediate, to_lt, ra, si, t); }
  void twlei(Location ra, int32 si, OperandType t) { DoTrapImm( "twlei", opcd_TrapWordImmediate, to_le, ra, si, t); }
  void tweqi(Location ra, int32 si, OperandType t) { DoTrapImm( "tweqi", opcd_TrapWordImmediate, to_eq, ra, si, t); }
  void twgei(Location ra, int32 si, OperandType t) { DoTrapImm( "twgei", opcd_TrapWordImmediate, to_ge, ra, si, t); }
  void twgti(Location ra, int32 si, OperandType t) { DoTrapImm( "twgti", opcd_TrapWordImmediate, to_gt, ra, si, t); }
  void twnli(Location ra, int32 si, OperandType t) { DoTrapImm( "twnli", opcd_TrapWordImmediate, to_nl, ra, si, t); }
  void twnei(Location ra, int32 si, OperandType t) { DoTrapImm( "twnei", opcd_TrapWordImmediate, to_ne, ra, si, t); }
  void twngi(Location ra, int32 si, OperandType t) { DoTrapImm( "twngi", opcd_TrapWordImmediate, to_ng, ra, si, t); }

  void twllti(Location ra, int32 si, OperandType t) { DoTrapImm( "twllti", opcd_TrapWordImmediate, to_llt, ra, si, t); }
  void twllei(Location ra, int32 si, OperandType t) { DoTrapImm( "twllei", opcd_TrapWordImmediate, to_lle, ra, si, t); }
  void twlgei(Location ra, int32 si, OperandType t) { DoTrapImm( "twlgei", opcd_TrapWordImmediate, to_lge, ra, si, t); }
  void twlgti(Location ra, int32 si, OperandType t) { DoTrapImm( "twlgti", opcd_TrapWordImmediate, to_lgt, ra, si, t); }
  void twlnli(Location ra, int32 si, OperandType t) { DoTrapImm( "twlnli", opcd_TrapWordImmediate, to_lnl, ra, si, t); }
  void twlngi(Location ra, int32 si, OperandType t) { DoTrapImm( "twlngi", opcd_TrapWordImmediate, to_lng, ra, si, t); }


  // doubleword register
  void tdlt( Location ra, Location rb) { DoTrapXForm( "tdlt", to_lt, ra, rb, TrapDoublewordXOp); }
  void tdle( Location ra, Location rb) { DoTrapXForm( "tdle", to_le, ra, rb, TrapDoublewordXOp); }
  void tdeq( Location ra, Location rb) { DoTrapXForm( "tdeq", to_eq, ra, rb, TrapDoublewordXOp); }
  void tdge( Location ra, Location rb) { DoTrapXForm( "tdge", to_ge, ra, rb, TrapDoublewordXOp); }
  void tdgt( Location ra, Location rb) { DoTrapXForm( "tdgt", to_gt, ra, rb, TrapDoublewordXOp); }
  void tdnl( Location ra, Location rb) { DoTrapXForm( "tdnl", to_nl, ra, rb, TrapDoublewordXOp); }
  void tdne( Location ra, Location rb) { DoTrapXForm( "tdne", to_ne, ra, rb, TrapDoublewordXOp); }
  void tdng( Location ra, Location rb) { DoTrapXForm( "tdng", to_ng, ra, rb, TrapDoublewordXOp); }

  void tdllt( Location ra, Location rb) { DoTrapXForm( "tdllt", to_llt, ra, rb, TrapDoublewordXOp); }
  void tdlle( Location ra, Location rb) { DoTrapXForm( "tdlle", to_lle, ra, rb, TrapDoublewordXOp); }
  void tdlge( Location ra, Location rb) { DoTrapXForm( "tdlge", to_lge, ra, rb, TrapDoublewordXOp); }
  void tdlgt( Location ra, Location rb) { DoTrapXForm( "tdlgt", to_lgt, ra, rb, TrapDoublewordXOp); }
  void tdlnl( Location ra, Location rb) { DoTrapXForm( "tdlnl", to_lnl, ra, rb, TrapDoublewordXOp); }
  void tdlng( Location ra, Location rb) { DoTrapXForm( "tdlng", to_lng, ra, rb, TrapDoublewordXOp); }


  // word register
  void twlt( Location ra, Location rb) { DoTrapXForm ( "twlt", to_lt, ra, rb, TrapWordXOp); }
  void twle( Location ra, Location rb) { DoTrapXForm ( "twle", to_le, ra, rb, TrapWordXOp); }
  void tweq( Location ra, Location rb) { DoTrapXForm ( "tweq", to_eq, ra, rb, TrapWordXOp); }
  void twge( Location ra, Location rb) { DoTrapXForm ( "twge", to_ge, ra, rb, TrapWordXOp); }
  void twgt( Location ra, Location rb) { DoTrapXForm ( "twgt", to_gt, ra, rb, TrapWordXOp); }
  void twnl( Location ra, Location rb) { DoTrapXForm ( "twnl", to_nl, ra, rb, TrapWordXOp); }
  void twne( Location ra, Location rb) { DoTrapXForm ( "twne", to_ne, ra, rb, TrapWordXOp); }
  void twng( Location ra, Location rb) { DoTrapXForm ( "twng", to_ng, ra, rb, TrapWordXOp); }

  void twllt( Location ra, Location rb) { DoTrapXForm ( "twllt", to_llt, ra, rb, TrapWordXOp); }
  void twlle( Location ra, Location rb) { DoTrapXForm ( "twlle", to_lle, ra, rb, TrapWordXOp); }
  void twlge( Location ra, Location rb) { DoTrapXForm ( "twlge", to_lge, ra, rb, TrapWordXOp); }
  void twlgt( Location ra, Location rb) { DoTrapXForm ( "twlgt", to_lgt, ra, rb, TrapWordXOp); }
  void twlnl( Location ra, Location rb) { DoTrapXForm ( "twlnl", to_lnl, ra, rb, TrapWordXOp); }
  void twlng( Location ra, Location rb) { DoTrapXForm ( "twlng", to_lng, ra, rb, TrapWordXOp); }
  
  
  // logical immediates:    
  void andi_ ( Location ra, Location rs, int32 ui, OperandType t )  { DoLogicalDForm( "andi_",    opcd_AndImmediate,        ra, rs, ui, t, KF_ui ); }
  void ori   ( Location ra, Location rs, int32 ui, OperandType t )  { DoLogicalDForm( "ori",      opcd_OrImmediate,         ra, rs, ui, t, KF_ui ); }
  void xori  ( Location ra, Location rs, int32 ui, OperandType t )  { DoLogicalDForm( "xori",     opcd_XorImmediate,        ra, rs, ui, t, KF_ui ); }
  void andis_( Location ra, Location rs, int32 ui, OperandType t, Kind_of_Instruction_Field f )  { DoLogicalDForm( "andis_",   opcd_AndImmediateShifted, ra, rs, ui, t, f ); }
  void oris  ( Location ra, Location rs, int32 ui, OperandType t, Kind_of_Instruction_Field f )  { DoLogicalDForm( "oris",     opcd_OrImmediateShifted,  ra, rs, ui, t, f ); }
  void xoris ( Location ra, Location rs, int32 ui, OperandType t, Kind_of_Instruction_Field f )  { DoLogicalDForm( "xoris",    opcd_XorImmediateShifted, ra, rs, ui, t, f ); } 

  void nop() { DoLogicalDForm( "nop", opcd_OrImmediate, R0, R0, 0, NumberOperand, KF_ui, false ); }

# ifdef SIC_COMPILER
  void unimp(fint n, bool shouldRestart);
# endif


  // register logical instructions:
  void And ( Location ra, Location rs, Location rb )  { DoLogicalXForm( "And",  ra, rs, rb,  AndXOp,               0 );  }
  void Or  ( Location ra, Location rs, Location rb )  { DoLogicalXForm( "Or",   ra, rs, rb,  OrXOp,                0 );  }
  void Xor ( Location ra, Location rs, Location rb )  { DoLogicalXForm( "Xor",  ra, rs, rb,  XorXOp,               0 );  }
  void nand( Location ra, Location rs, Location rb )  { DoLogicalXForm( "nand", ra, rs, rb,  NandXOp,              0 );  }
  void nor ( Location ra, Location rs, Location rb )  { DoLogicalXForm( "nor",  ra, rs, rb,  NorXOp,               0 );  }
  void eqv ( Location ra, Location rs, Location rb )  { DoLogicalXForm( "eqv",  ra, rs, rb,  EquivalentXOp,        0 );  }
  void andc( Location ra, Location rs, Location rb )  { DoLogicalXForm( "andc", ra, rs, rb,  AndWithComplementXOp, 0 );  }
  void orc ( Location ra, Location rs, Location rb )  { DoLogicalXForm( "orc",  ra, rs, rb,  OrWithComplementXOp,  0 );  } 

  // and recording variations:
  void And_ ( Location ra, Location rs, Location rb )  { DoLogicalXForm( "And_",  ra, rs, rb,  AndXOp,               1 );  }
  void Or_  ( Location ra, Location rs, Location rb )  { DoLogicalXForm( "Or_",   ra, rs, rb,  OrXOp,                1 );  }
  void Xor_ ( Location ra, Location rs, Location rb )  { DoLogicalXForm( "Xor_",  ra, rs, rb,  XorXOp,               1 );  }
  void nand_( Location ra, Location rs, Location rb )  { DoLogicalXForm( "nand_", ra, rs, rb,  NandXOp,              1 );  }
  void nor_ ( Location ra, Location rs, Location rb )  { DoLogicalXForm( "nor_",  ra, rs, rb,  NorXOp,               1 );  }
  void eqv_ ( Location ra, Location rs, Location rb )  { DoLogicalXForm( "eqv_",  ra, rs, rb,  EquivalentXOp,        1 );  }
  void andc_( Location ra, Location rs, Location rb )  { DoLogicalXForm( "andc_", ra, rs, rb,  AndWithComplementXOp, 1 );  }
  void orc_ ( Location ra, Location rs, Location rb )  { DoLogicalXForm( "orc_",  ra, rs, rb,  OrWithComplementXOp,  1 );  } 
  
  // extended instructions  
  void mr (Location rx, Location ry) { DoLogicalXForm( "mr" ,  rx, ry, ry,   OrXOp,  0, false );  } // move reg
  void mr_(Location rx, Location ry) { DoLogicalXForm( "mr_",  rx, ry, ry,   OrXOp,  1, false );  } // move reg
  void Not(Location rx, Location ry) { DoLogicalXForm( "Not",  rx, ry, ry,  NorXOp,  0, false );  }

  
  // sign-extension and zero counting:
  // non-recording:
  void extsb ( Location ra, Location rs )  { DoLogicalXForm( "extsb",  ra, rs, R0,  ExtendSignByteXOp,               0, false );  } 
  void extsh ( Location ra, Location rs )  { DoLogicalXForm( "extsh",  ra, rs, R0,  ExtendSignHalfwordXOp,           0, false );  } 
  void extsw ( Location ra, Location rs )  { DoLogicalXForm( "extsw",  ra, rs, R0,  ExtendSignWordXOp,               0, false );  } 
  void cntlzd( Location ra, Location rs )  { DoLogicalXForm( "cntlzd", ra, rs, R0,  CountLeadingZerosDoublewordXOp,  0, false );  } 
  void cntlzw( Location ra, Location rs )  { DoLogicalXForm( "cntlzw", ra, rs, R0,  CountLeadingZerosWordXOp,        0, false );  } 

  // and recording:
  void extsb_ ( Location ra, Location rs )  { DoLogicalXForm( "extsb_",  ra, rs, R0,  ExtendSignByteXOp,               1, false );  } 
  void extsh_ ( Location ra, Location rs )  { DoLogicalXForm( "extsh_",  ra, rs, R0,  ExtendSignHalfwordXOp,           1, false );  } 
  void extsw_ ( Location ra, Location rs )  { DoLogicalXForm( "extsw_",  ra, rs, R0,  ExtendSignWordXOp,               1, false );  } 
  void cntlzd_( Location ra, Location rs )  { DoLogicalXForm( "cntlzd_", ra, rs, R0,  CountLeadingZerosDoublewordXOp,  1, false );  } 
  void cntlzw_( Location ra, Location rs )  { DoLogicalXForm( "cntlzw_", ra, rs, R0,  CountLeadingZerosWordXOp,        1, false );  } 

  
 private:
  // rotate instructions: see the extended versions later:
  
  // rotate left doubleword immedate then clear left
  void rldicl( Location ra, Location rs, int32 n, int32 b, bool assrt = true,  char* fmt = "rldicl  %s, %s, %d, %d", 
               void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = 0 )  { 
                 RotateDoublewordImmMD( rs, ra, n, b, 0, 0, assrt,  fmt, p1, p2, p3, p4);
  }
  void rldicl_( Location ra, Location rs, int32 n, int32 b, bool assrt = true,  char* fmt = "rldicl_  %s, %s, %d, %d", 
                void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = 0 )  { 
                  RotateDoublewordImmMD( rs, ra, n, b, 0, 1, assrt,  fmt, p1, p2, p3, p4);
  }
  // rotate left doubleword immedate then clear right
  void rldicr( Location ra, Location rs, int32 n, int32 b, bool assrt = true,  char* fmt = "rldicr  %s, %s, %d, %d", 
               void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = 0 )  {
                 RotateDoublewordImmMD( rs, ra, n, b, 1, 0, assrt,  fmt, p1, p2, p3, p4);
  }
  void rldicr_( Location ra, Location rs, int32 n, int32 b, bool assrt = true,  char* fmt = "rldicr_  %s, %s, %d, %d", 
                void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = 0 )  { 
                  RotateDoublewordImmMD( rs, ra, n, b, 1, 1, assrt,  fmt, p1, p2, p3, p4);
  }
  // rotate left doubleword immediate then clear
  void rldic(  Location ra, Location rs, int32 n, int32 b, bool assrt = true,  char* fmt = "rldimi  %s, %s, %d, %d", 
               void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = 0 )  {
                 RotateDoublewordImmMD( rs, ra, n, b, 2, 0, assrt,  fmt, p1, p2, p3, p4);
  }
  void rldic_(  Location ra, Location rs, int32 n, int32 b, bool assrt = true,  char* fmt = "rldimi_  %s, %s, %d, %d", 
                void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = 0 )  { 
                  RotateDoublewordImmMD( rs, ra, n, b, 2, 1, assrt,  fmt, p1, p2, p3, p4);
  }
  // rotate left word immediate then and with mask
  void rlwinm(  Location ra, Location rs, int32 sh, int32 mb, int32 me, bool assrt = true,  char* fmt = "rlwinm  %s, %s, %d, %d, %d",  
                void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = 0, void* p5 = 0 ) {
                  RotateWordImmM( opcd_RotateLeftWordThenAndMaskImm, rs, ra, sh, mb, me, 0, assrt,  fmt, p1, p2, p3, p4, p5);
  }
  void rlwinm_( Location ra, Location rs, int32 sh, int32 mb, int32 me, bool assrt = true,  char* fmt = "rlwinm_  %s, %s, %d, %d, %d",  
                void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = 0, void* p5 = 0 ) {
                  RotateWordImmM( opcd_RotateLeftWordThenAndMaskImm, rs, ra, sh, mb, me, 1, assrt,  fmt, p1, p2, p3, p4, p5);
  }
  // rotate left doubleword then clear
  void rldcl(  Location ra, Location rs, Location rb, int32 b, bool assrt = true,  char* fmt = "rldcl  %s, %s, %s, %d", 
               void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = 0 )  { 
                 RotateDoublewordRegMDS( rs, ra, rb, b, 8, 0, assrt,  fmt, p1, p2, p3, p4);
  }
  void rldcl_( Location ra, Location rs, Location rb, int32 b, bool assrt = true,  char* fmt = "rldcl_  %s, %s, %s, %d", 
               void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = 0 )  { 
                 RotateDoublewordRegMDS( rs, ra, rb, b, 8, 1, assrt,  fmt, p1, p2, p3, p4);
  }
  // rotate left doubleword then clear right
  void rldcr(  Location ra, Location rs, Location rb, int32 b, bool assrt = true,  char* fmt = "rldcr  %s, %s, %s, %d", 
               void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = 0 )  { 
                 RotateDoublewordRegMDS( rs, ra, rb, b, 9, 0, assrt,  fmt, p1, p2, p3, p4);
  }
  void rldcr_( Location ra, Location rs, Location rb, int32 b, bool assrt = true,  char* fmt = "rldcr_  %s, %s, %s, %d", 
               void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = 0 )  { 
                 RotateDoublewordRegMDS( rs, ra, rb, b, 9, 1, assrt,  fmt, p1, p2, p3, p4);
  }
  // rotate left word then and with mask
  void rlwnm(  Location ra, Location rs, Location rb, int32 mb, int32 me, bool assrt = true,  char* fmt = "rlwnm  %s, %s, %s, %d, %d",  
                void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = 0, void* p5 = 0 ) {
                  RotateWordRegM( rs, ra, rb, mb, me, 0, assrt,  fmt, p1, p2, p3, p4, p5);
  }
  void rlwnm_(  Location ra, Location rs, Location rb, int32 mb, int32 me, bool assrt = true,  char* fmt = "rlwnm_  %s, %s, %s, %d, %d",  
                void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = (void*)0, void* p5 = (void*)0 ) {
                  RotateWordRegM( rs, ra, rb, mb, me, 1, assrt,  fmt, p1, p2, p3, p4, p5);
  }
  // rotate left word immedate then and with mask
  void rldimi(  Location ra, Location rs, int32 n, int32 b, bool assrt = true,  char* fmt = "rldic  %s, %s, %d, %d", 
                void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = 0 )  { 
                 RotateDoublewordImmMD( rs, ra, n, b, 3, 0, assrt,  fmt, p1, p2, p3, p4);
  }
  void rldimi_(  Location ra, Location rs, int32 n, int32 b, bool assrt = true,  char* fmt = "rldic_  %s, %s, %d, %d", 
                 void* p1 = 0, void* p2 = 0, void* p3 = 0, void* p4 = 0 )  { 
                   RotateDoublewordImmMD( rs, ra, n, b, 3, 1, assrt,  fmt, p1, p2, p3, p4);
  }
  // rotate left word immediate then mask insert
  void rlwimi(  Location ra, Location rs, int32 sh, int32 mb, int32 me, bool assrt = true,  char* fmt = "rlwimi  %s, %s, %d, %d, %d",  
                void* p1 = 0, void* p2 = 0, void* p3 = (void*)0, void* p4 = 0, void* p5 = 0 ) {
                  RotateWordImmM( opcd_RotateLeftWordImmThenMaskInsert, rs, ra, sh, mb, me, 0, assrt,  fmt, p1, p2, p3, p4, p5);
  }
  void rlwimi_( Location ra, Location rs, int32 sh, int32 mb, int32 me, bool assrt = true,  char* fmt = "rlwimi_  %s, %s, %d, %d, %d",  
                void* p1 = 0, void* p2 = 0, void* p3 = (void*)0, void* p4 = 0, void* p5 = 0 ) {
                  RotateWordImmM( opcd_RotateLeftWordImmThenMaskInsert, rs, ra, sh, mb, me, 1, assrt,  fmt, p1, p2, p3, p4, p5);
  }

 public:
  // doubleword rotate and shift commands
  void extldi ( Location ra, Location rs, int32 n, int32 b )  {  rldicr( ra, rs,        b,   n-1,  n > 0,               "extldi  %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)n,    (void*)b); }  // extract & left  justify imm
  void extrdi ( Location ra, Location rs, int32 n, int32 b )  {  rldicl( ra, rs,      b+n,  64-n,  n > 0,               "extrdi  %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)n,    (void*)b); }  // extract & right justify imm
  void insrdi ( Location ra, Location rs, int32 n, int32 b )  {  rldimi( ra, rs, 64-(b+n),     b,  n > 0,               "insrdi  %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)n,    (void*)b); }  // insert from right imm
  void rotldi ( Location ra, Location rs, int32 n          )  {  rldicl( ra, rs,        n,     0,   true,               "rotldi  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // rotate left  imm
  void rotrdi ( Location ra, Location rs, int32 n          )  {  rldicl( ra, rs,     64-n,     0,   true,               "rotrdi  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // rotate right imm
  void rotld  ( Location ra, Location rs, Location rb      )  {  rldcl ( ra, rs,       rb,     0,   true,               "rotld   %s, %s, %s"    , RegisterNames[ra], RegisterNames[rs], RegisterNames[rb],  0); }  // rotate left
  void sldi   ( Location ra, Location rs, int32 n          )  {  rldicr( ra, rs,        n,  63-n,  n < 64,              "sldi    %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // shift left  imm
  void srdi   ( Location ra, Location rs, int32 n          )  {  rldicl( ra, rs,     64-n,     n,  n < 64,              "srdi    %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // shift right imm
  void clrldi ( Location ra, Location rs, int32 n          )  {  rldicl( ra, rs,        0,     n,  n < 64,              "clrldi  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // clear left  imm
  void clrrdi ( Location ra, Location rs, int32 n          )  {  rldicr( ra, rs,        0,  63-n,  n < 64,              "clrrdi  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // clear right imm
  void clrsldi( Location ra, Location rs, int32 b, int32 n )  {  rldic ( ra, rs,        n,   b-n,  n <= b  &&  b < 64,  "clrsldi %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)b,    (void*)n); }  // clear left and shift left imm
  
  // word rotate and shift commands, pp 230
  void extlwi ( Location ra, Location rs, int32 n, int32 b )  {  rlwinm( ra, rs,        b,     0,     n-1,  n > 0,               "extlwi  %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)n,    (void*)b); }  // extract & left  justify imm
  void extrwi ( Location ra, Location rs, int32 n, int32 b )  {  rlwinm( ra, rs,      b+n,  32-n,      31,  n > 0,               "extrwi  %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)n,    (void*)b); }  // extract & right justify imm
  void inslwi ( Location ra, Location rs, int32 n, int32 b )  {  rlwimi( ra, rs,     32-b,     b, (b+n)-1,  n > 0,               "inslwi  %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)n,    (void*)b); }  // insert from left  imm
  void insrwi ( Location ra, Location rs, int32 n, int32 b )  {  rlwimi( ra, rs, 32-(b+n),     b, (b+n)-1,  n > 0,               "insrwi  %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)n,    (void*)b); }  // insert from right imm
  void rotlwi ( Location ra, Location rs, int32 n          )  {  rlwinm( ra, rs,        n,     0,      31,   true,               "rotlwi  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // rotate left  imm
  void rotrwi ( Location ra, Location rs, int32 n          )  {  rlwinm( ra, rs,     32-n,     0,      31,   true,               "rotrwi  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // rotate right imm
  void rotlw  ( Location ra, Location rs, Location rb      )  {  rlwnm ( ra, rs,       rb,     0,      31,   true,               "rotlw   %s, %s, %s"    , RegisterNames[ra], RegisterNames[rs], RegisterNames[rb],  0); }  // rotate left
  void slwi   ( Location ra, Location rs, int32 n          )  {  rlwinm( ra, rs,        n,     0,    31-n,  n < 32,              "slwi    %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // shift left  imm
  void srwi   ( Location ra, Location rs, int32 n          )  {  rlwinm( ra, rs,     32-n,     n,      31,  n < 32,              "srwi    %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // shift right imm
  void clrlwi ( Location ra, Location rs, int32 n          )  {  rlwinm( ra, rs,        0,     n,      31,  n < 32,              "clrlwi  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // clear left  imm
  void clrrwi ( Location ra, Location rs, int32 n          )  {  rlwinm( ra, rs,        0,     0,    31-n,  n < 32,              "clrrwi  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // clear right imm
  void clrslwi( Location ra, Location rs, int32 b, int32 n )  {  rlwinm( ra, rs,        n,   b-n,    31-n,  n <= b  &&  b < 32,  "clrslwi %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)b,    (void*)n); }  // clear left and shift left imm
  

  // and recording:
  // doubleword rotate and shift commands
  void extldi_ ( Location ra, Location rs, int32 n, int32 b )  {  rldicr_( ra, rs,        b,   n-1,  n > 0,               "extldi_  %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)n,    (void*)b); }  // extract & left  justify imm
  void extrdi_ ( Location ra, Location rs, int32 n, int32 b )  {  rldicl_( ra, rs,      b+n,  64-n,  n > 0,               "extrdi_  %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)n,    (void*)b); }  // extract & right justify imm
  void insrdi_ ( Location ra, Location rs, int32 n, int32 b )  {  rldimi_( ra, rs, 64-(b+n),     b,  n > 0,               "insrdi_  %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)n,    (void*)b); }  // insert from right imm
  void rotldi_ ( Location ra, Location rs, int32 n          )  {  rldicl_( ra, rs,        n,     0,   true,               "rotldi_  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // rotate left  imm
  void rotrdi_ ( Location ra, Location rs, int32 n          )  {  rldicl_( ra, rs,     64-n,     0,   true,               "rotrdi_  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // rotate right imm
  void rotld_  ( Location ra, Location rs, Location rb      )  {  rldcl_ ( ra, rs,       rb,     0,   true,               "rotld_   %s, %s, %s"    , RegisterNames[ra], RegisterNames[rs], RegisterNames[rb],  0); }  // rotate left
  void sldi_   ( Location ra, Location rs, int32 n          )  {  rldicr_( ra, rs,        n,  63-n,  n < 64,              "sldi_    %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // shift left  imm
  void srdi_   ( Location ra, Location rs, int32 n          )  {  rldicl_( ra, rs,     64-n,     n,  n < 64,              "srdi_    %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // shift right imm
  void clrldi_ ( Location ra, Location rs, int32 n          )  {  rldicl_( ra, rs,        0,     n,  n < 64,              "clrldi_  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // clear left  imm
  void clrrdi_ ( Location ra, Location rs, int32 n          )  {  rldicr_( ra, rs,        0,  63-n,  n < 64,              "clrrdi_  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // clear right imm
  void clrsldi_( Location ra, Location rs, int32 b, int32 n )  {  rldic_ ( ra, rs,        n,   b-n,  n <= b  &&  b < 64,  "clrsldi_ %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)b,    (void*)n); }  // clear left and shift left imm
  
  // word rotate and shift commands, pp 230
  void extlwi_ ( Location ra, Location rs, int32 n, int32 b )  {  rlwinm_( ra, rs,        b,     0,     n-1,  n > 0,               "extlwi_  %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)n,    (void*)b); }  // extract & left  justify imm
  void extrwi_ ( Location ra, Location rs, int32 n, int32 b )  {  rlwinm_( ra, rs,      b+n,  32-n,      31,  n > 0,               "extrwi_  %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)n,    (void*)b); }  // extract & right justify imm
  void inslwi_ ( Location ra, Location rs, int32 n, int32 b )  {  rlwimi_( ra, rs,     32-b,     b, (b+n)-1,  n > 0,               "inslwi_  %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)n,    (void*)b); }  // insert from left  imm
  void insrwi_ ( Location ra, Location rs, int32 n, int32 b )  {  rlwimi_( ra, rs, 32-(b+n),     b, (b+n)-1,  n > 0,               "insrwi_  %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)n,    (void*)b); }  // insert from right imm
  void rotlwi_ ( Location ra, Location rs, int32 n          )  {  rlwinm_( ra, rs,        n,     0,      31,   true,               "rotlwi_  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // rotate left  imm
  void rotrwi_ ( Location ra, Location rs, int32 n          )  {  rlwinm_( ra, rs,     32-n,     0,      31,   true,               "rotrwi_  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // rotate right imm
  void rotlw_  ( Location ra, Location rs, Location rb      )  {  rlwnm_ ( ra, rs,       rb,     0,      31,   true,               "rotlw_   %s, %s, %s"    , RegisterNames[ra], RegisterNames[rs], RegisterNames[rb],  0); }  // rotate left
  void slwi_   ( Location ra, Location rs, int32 n          )  {  rlwinm_( ra, rs,        n,     0,    31-n,  n < 32,              "slwi_    %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // shift left  imm
  void srwi_   ( Location ra, Location rs, int32 n          )  {  rlwinm_( ra, rs,     32-n,     n,      31,  n < 32,              "srwi_    %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // shift right imm
  void clrlwi_ ( Location ra, Location rs, int32 n          )  {  rlwinm_( ra, rs,        0,     n,      31,  n < 32,              "clrlwi_  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // clear left  imm
  void clrrwi_ ( Location ra, Location rs, int32 n          )  {  rlwinm_( ra, rs,        0,     0,    31-n,  n < 32,              "clrrwi_  %s, %s, %d"    , RegisterNames[ra], RegisterNames[rs], (void*)n,           0); }  // clear right imm
  void clrslwi_( Location ra, Location rs, int32 b, int32 n )  {  rlwinm_( ra, rs,        n,   b-n,    31-n,  n <= b  &&  b < 32,  "clrslwi_ %s, %s, %d, %d", RegisterNames[ra], RegisterNames[rs], (void*)b,    (void*)n); }  // clear left and shift left imm


  // shifts:
  void sld ( Location ra, Location rs, Location rb) { XForm1_6_7( "sld",  ShiftLeftDoublewordXOp, rs, ra, rb, 0); }
  void sld_( Location ra, Location rs, Location rb) { XForm1_6_7( "sld_", ShiftLeftDoublewordXOp, rs, ra, rb, 1); }
  void slw ( Location ra, Location rs, Location rb) { XForm1_6_7( "slw",  ShiftLeftWordXOp,       rs, ra, rb, 0); }
  void slw_( Location ra, Location rs, Location rb) { XForm1_6_7( "slw_", ShiftLeftWordXOp,       rs, ra, rb, 1); }

  void srd ( Location ra, Location rs, Location rb) { XForm1_6_7( "srd",  ShiftRightDoublewordXOp, rs, ra, rb, 0); }
  void srd_( Location ra, Location rs, Location rb) { XForm1_6_7( "srd_", ShiftRightDoublewordXOp, rs, ra, rb, 1); }
  void srw ( Location ra, Location rs, Location rb) { XForm1_6_7( "srw",  ShiftRightWordXOp,       rs, ra, rb, 0); }
  void srw_( Location ra, Location rs, Location rb) { XForm1_6_7( "srw_", ShiftRightWordXOp,       rs, ra, rb, 1); }
  
  void sradi ( Location ra, Location rs, int32 sh ) { ShiftRightAlgebraicDoublewordImm( rs, ra, sh, 0, "sradi  %s, %s, %d",  RegisterNames[ra], RegisterNames[rs], (void*)sh); }
  void sradi_( Location ra, Location rs, int32 sh ) { ShiftRightAlgebraicDoublewordImm( rs, ra, sh, 1, "sradi_  %s, %s, %d", RegisterNames[ra], RegisterNames[rs], (void*)sh); }
  
  void srawi ( Location ra, Location rs, int32 sh ) { ShiftRightAlgebraicWordImm( rs, ra, sh, 0, "srawi  %s, %s, %d",  RegisterNames[ra], RegisterNames[rs], (void*)sh); }
  void srawi_( Location ra, Location rs, int32 sh ) { ShiftRightAlgebraicWordImm( rs, ra, sh, 1, "srawi_  %s, %s, %d", RegisterNames[ra], RegisterNames[rs], (void*)sh); }
                           
  // algebraic register shifts:
  void srad ( Location ra, Location rs, Location rb) { XForm1_6_7( "srad",  ShiftRightAlgebraicDoublewordXOp, rs, ra, rb, 0); }
  void srad_( Location ra, Location rs, Location rb) { XForm1_6_7( "srad_", ShiftRightAlgebraicDoublewordXOp, rs, ra, rb, 1); }
  void sraw ( Location ra, Location rs, Location rb) { XForm1_6_7( "sraw",  ShiftRightAlgebraicWordXOp,       rs, ra, rb, 0); }
  void sraw_( Location ra, Location rs, Location rb) { XForm1_6_7( "sraw_", ShiftRightAlgebraicWordXOp,       rs, ra, rb, 1); }
  
  
  // move to special register:
  void mtxer( Location rs ) { MoveToFromSpecialRegister( spr_XER, rs, MoveToSpecialRegXOp, "mtxer" ); }
  void mtlr ( Location rs ) { MoveToFromSpecialRegister( spr_LR,  rs, MoveToSpecialRegXOp, "mtlr"  ); }
  void mtctr( Location rs ) { MoveToFromSpecialRegister( spr_CTR, rs, MoveToSpecialRegXOp, "mtctr" ); }

  void mfxer( Location rs ) { MoveToFromSpecialRegister( spr_XER, rs, MoveFromSpecialRegXOp, "mfxer" ); }
  void mflr ( Location rs ) { MoveToFromSpecialRegister( spr_LR,  rs, MoveFromSpecialRegXOp, "mflr"  ); }
  void mfctr( Location rs ) { MoveToFromSpecialRegister( spr_CTR, rs, MoveFromSpecialRegXOp, "mfctr" ); }
  
  
  // move to condition register:
  void mtcrf( int32 fxm, Location rs) {
    assemble( OPCD(opcd_XO) | RS(rs) | FXM(fxm) | XO1(MoveToConditionRegisterXOp) );
    if ( printing )  lprintf("  mtcrf  %d, %s\n", (void*)fxm, RegisterNames[rs]);
  }
  void mcrxr( int32 bf) {
    assemble( OPCD(opcd_XO) | BF(bf) | XO1(MoveToConditionRegisterFromXERXOp) );
    if ( printing )  lprintf("  mcrxr  %d\n", (void*)bf);
  }
  void mfcr(  Location rt) {
    assemble( OPCD(opcd_XO) | RT(rt) | XO1(MoveFromConditionRegisterXOp) );
    if ( printing )  lprintf("  mfcr  %s\n", RegisterNames[rt]);
  }  
  
  
  // assembler "macros"
  
 private: // helpers

 public:
  // Why both oring and adding? Adding treats R0 as 0, oring does not

  // break up a 32-bit word into two pieces so that they can be ored together into a register
  static void break_up_word_for_oring(int32 x, int32& lo, int32& hi) {
    lo = x & ui_mask;
    hi = x >> ui_bits;
  }

  // break up a 32-bit word into two pieces so that they can be added together into a register
  static void break_up_word_for_adding(int32 x, int32& lo, int32& hi) {
    // Trickiness: assembler wants a signed number for lo, e.g. -4 for 0xfffc
    // Also, ppc will sign extend lo.
    hi = (x >> si_bits)  +  ((x & 0x8000) ? 1          : 0); 
    lo = (x &  si_mask)  +  ((x & 0x8000) ? 0xffff0000 : 0); 
  }
   
  // branch and link to arbitrary address, temp may be any GPR
  void       branch_to(pc_t dest, OperandType t, Location temp, bool link);
  void  long_branch_to(pc_t dest, OperandType t, Location temp, bool link);
  void short_branch_to(pc_t dest, OperandType t, Location temp, bool link);
  
  
  void load_immediate(    Location dest_reg, int32 data, OperandType t );
  void load_from_address( Location dest_reg, void* p,    OperandType t, Location base_reg = IllegalLocation );
  void store_to_address(  Location  src_reg, void* p,    OperandType t, Location base_reg);
  
  
  void increase_immediate_field( pc_t a, int32 delta );
  void increase_all_immediate_fields( AddressList* l, int32 delta);
  
  // macro adds in source position
# define Untested(msg, r, save) _Untested("Untested PPC (" XSTR(__FILE__) ": " XSTR(__LINE__) ") " msg, r, save)
  void _Untested(char* msg, Location temp, bool save_link);


# ifdef SIC_COMPILER
  // for statistics
  void startTypeTest(fint ncases, bool prologueCheck, bool immedOnly);
  void doOneTypeTest();
  void endTypeTest();
  void markTagTest(fint nvalues, bool intArith = false);
# endif

};   


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // __ppc__
