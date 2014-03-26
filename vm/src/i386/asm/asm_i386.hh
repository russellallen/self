#pragma once
# ifdef __i386__
/* Sun-$Revision: 1.6 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
   
   
// NOTE: The Intel assembler puts the dest first, then the source.
// The gcc assembler puts the source first, then dest.
// This assembler follows gcc: source, then dest. -- dmu 4/06   
// WARNING: Therefore conditional jumps, etc. behave the opposite of what you might expect:
// ja jumps if the SECOND operand is above the first.



# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)
  
class Assembler: public BaseAssembler {
 friend class Label; // for Backpatch

 public:
  
  Assembler(int32 instsSize, int32 locsSize, bool pr, bool isInstrs);
  
  enum Scale { no_scale = -1, by_one = 0, by_two = 1, by_four = 2, by_eight = 3 };

  
 public:
  void generate_test_instructions();
 private:
  void gen_movccs_setccs_movsxs_movzxss();
  void gen_jmps();
  void gen_imm32_only();
  void gen_imm_reg();
  void gen_rm();
  void gen_imuls();
  void gen_shifts();
  void gen_imm8_rm8(   Location, int32, OperandType, Location, Scale);
  void gen_imm32_rm32( Location, int32, OperandType, Location, Scale);
  void gen_reg_rm(     Location, int32, OperandType, Location, Scale);
  void gen_bit_rm(     Location, int32, OperandType, Location, Scale);
 

 public:
   // macro adds in source position

  # define Untested(msg) _Untested("Untested I386 (" XSTR(__FILE__) ": " XSTR(__LINE__) ") ", (msg))
  void _Untested(const char* m1, const char* m2);

  
  
 // General helpers:
 private:
  static bool is_disp8(int32 disp, OperandType t = NumberOperand) {
    return  t == NumberOperand  &&  -128 <= disp  &&  disp < 128;
  }
  void addOffset(OperandType, bool is_embedded, bool is_relative);
  
  void Backpatch(pc_t destp, pc_t target) {
    *((int32*)destp) += (int32)target;
  }
  
  void printRM(RegSize rs, Location r, int32 d, OperandType t, Location index, Scale s, const char* ps, bool is_call = false);
  void printRM_disp(int32 d,  OperandType t);
  void printR(RegSize rs, Location r, const char* ps);
  void printDest(int32 dest, OperandType t, Label* L);
  void printImm( int32 imm, OperandType t = NumberOperand, const char* ps = "");

  void mod_rm_reg(int32 mod, int32 rm, int32 reg) { Byte( (mod << 6) | rm | (reg << 3) ); }
  void sib(int32 ss, int32 index, Location reg) {mod_rm_reg(ss, reg, index); }

  void base_disp_reg( RegSize rs,
                      Location reg_operand, Location base_reg, 
                      int32 disp, OperandType t, 
                      Location index_reg, Scale scale,
                      const char* suffix,
                      bool is_call = false);

  void numberBase_disp8_reg( Location reg_operand, Location base_reg, int32 disp,
                             Location index_reg, Scale scale);
                               
  void base_noDisp_reg( Location reg, Location base_reg, Location index_reg, Scale scale);
                          
  void         reg_reg(Location reg_operand, Location rm_reg, 
                       Location index_reg, Scale scale);

  
 // jumps
 private:  
  class jump_conds {
   public:
    enum conds { 
      a, ae, b, be, 
      c, e, g, ge, l, le,
      na, nae, nb, nbe, 
      nc, ne, ng,
      nge,
      nl, nle, 
      no, np, ns, nz,
      o, p, pe, po, s, z
    };
   };

  class jump_ops {
   public:
    enum ops { 
      a = 0x7, ae = 0x3, b = 0x2, be = 0x6, 
      c = 0x2, e = 0x4, g = 0xf, ge = 0xd, l = 0xc, le = 0xe,
      na = 0x6, nae = 0x2, nb = 0x3, nbe = 0x7, 
      nc = 0x3, ne = 0x5, ng = 0xe,
      nge = 0xc,
      nl = 0xd, nle = 0xf, 
      no = 0x1, np = 0xb, ns = 0x9, nz = 0x5,
      o = 0x0, p = 0xa, pe = 0xa, po = 0xb, s = 0x8, z = 0x4
    };
  };
  
  void word_branch_target(int32 dest, OperandType t, Label* L);
  void std_jmp_or_loop(const char* j_or_loop, const char* ccs, int32 op8, int32 op32, int32 dest, OperandType disp_type, Label* L, bool add_0f_prefix = true);                       
  void jcc( const char* ccs, jump_conds::conds cc, jump_ops::ops op, int32 d, OperandType t, Label* L);

  
 public:

  void call( int32 d, OperandType t, Label* L = NULL);
  void call( Location base, int32 disp = 0, OperandType t = RegisterOperand, Location index = no_reg, Scale s = by_one );
  
  void call(Label*);

  void jmp(Label*);
  void jecxz(Label*);

  void loop(Label*);
  void loope(Label*);
  void loopne(Label*);
  
  
  
  void jmp(Location base, int32 d = 0, OperandType t = RegisterOperand, Location index = no_reg, Scale s = by_one);
  
  void jmp(   int32 d, OperandType t, Label* L = NULL);
  void jecxz( int32 d, OperandType t, Label* L = NULL);
  void loop(  int32 d, OperandType t, Label* L = NULL);
  void loope( int32 d, OperandType t, Label* L = NULL);
  void loopne(int32 d, OperandType t, Label* L = NULL);

  # define J(cond) \
   void CONC(j,cond)( int32 d, OperandType t, Label* L = NULL ); \
   void CONC(j,cond)( Label* );
   
  J(a) J(ae) J(b) J(be) J(c) J(e) J(g) J(ge) J(l) J(le) J(na) J(nae) J(nb) J(nbe) J(nc)
  J(ne) J(ng) J(nge) J(nl) J(nle) J(no) J(np) J(ns) J(nz) J(o) J(p) J(pe) J(po) J(s) J(z)
  # undef J
  

// Add-like instructions
   
 
 private:

  bool do_special_shifts(int32 op_imm_rm, int32 imm);
  void like_add8_imm(const char* name, int32 imm, Location dst_reg, int32 dst_disp, OperandType dt,
                     Location index, Scale s, int32 op_imm8_al, int32 op_imm8_rm8, int32 opExt);
  void like_add32_imm(const char* name, int32 imm, OperandType st, Location dst_reg, int32 dst_disp, OperandType dt,
                      Location index, Scale s, int32 op_imm32_eax, int32 op_imm8_rm32, int32 op_imm32_rm32, int32 opExt );
  void like_add_r_rm(const char* name, char bOrL, Location src,
                    Location dst_base, int32 dst_disp, OperandType dt, Location index, Scale s, int32 op);
  void like_add_rm_r(const char* name, char bOrL,
                    Location src_base, int32 src_disp, OperandType st, Location index, Scale s, 
                    Location dst, int32 op); 

 public:

  # define LIKE_ADD(name, op_imm8_al, op_imm32_eax, op_imm8_rm8, opExt, op_imm32_rm32, op_imm8_rm32, op_r8_rm8, op_r32_rm32, op_rm8_r8, op_rm32_r32) \
    void XCONC(name,b) (int32 imm8, Location dst_reg, int32 dst_disp = 0, OperandType dt = RegisterOperand, Location index = no_reg, Scale s = by_one) { \
      like_add8_imm(XSTR(name), imm8, dst_reg, dst_disp, dt, index, s, op_imm8_al, op_imm8_rm8, opExt); \
    } \
    \
    void XCONC(name,l) (int32 imm, OperandType st, Location dst_reg = eax, int32 dst_disp = 0, OperandType dt = RegisterOperand, Location index = no_reg, Scale s = by_one) { \
      like_add32_imm(XSTR(name), imm, st, dst_reg, dst_disp, dt, index, s, op_imm32_eax, op_imm8_rm32, op_imm32_rm32, opExt); \
    } \
    \
    void XCONC(name,b) (Location src_reg, Location dst_reg = eax, int32 dst_disp = 0, OperandType dt = RegisterOperand, Location index = no_reg, Scale s = by_one) { \
      like_add_r_rm(XSTR(name), 'b', src_reg, dst_reg, dst_disp, dt, index, s, op_r8_rm8) ; \
    } \
    \
    \
    void XCONC(name,l) (Location src_reg, Location dst_reg = eax, int32 dst_disp = 0, OperandType dt = RegisterOperand, Location index = no_reg, Scale s = by_one) { \
      like_add_r_rm(XSTR(name), 'l', src_reg, dst_reg, dst_disp, dt, index, s, op_r32_rm32) ; \
    } \
    \
    void XCONC(name,b) (Location src_base, int32 src_disp, OperandType st, Location index, Scale s, \
                        Location dst_reg) { \
      like_add_rm_r(XSTR(name), 'b', src_base, src_disp, st, index, s, dst_reg, op_rm8_r8); \
    }  \
    \
    void XCONC(name,l) (Location src_base, int32 src_disp, OperandType st, Location index, Scale s, \
                        Location dst_reg) { \
      like_add_rm_r(XSTR(name), 'l', src_base, src_disp, st, index, s, dst_reg, op_rm32_r32); \
    } \
    \
    void XCONC(name,b) (Location src_base, int32 src_disp, OperandType st, Location dst_reg) { \
      like_add_rm_r(XSTR(name), 'b', src_base, src_disp, st, no_reg, by_one, dst_reg, op_rm8_r8); \
    }  \
    \
    void XCONC(name,l) (Location src_base, int32 src_disp, OperandType st, Location dst_reg) { \
      like_add_rm_r(XSTR(name), 'l', src_base, src_disp, st, no_reg, by_one, dst_reg, op_rm32_r32); \
    }   
 
  static const fint shift_by_count_reg = 31954; // use as immed arg

 
  //             i8_al  i32_eax i8_rm8   ext i32_rm32, i8_rm32  r8_rm8 r32_rm32,   rm8_r8, rm32_r32
  LIKE_ADD(add,  0x04, 0x05,    0x80,     0,  0x81,     0x83,     0x00,   0x01,     0x02,   0x03);
  LIKE_ADD(adc,  0x14, 0x15,    0x80,     2,  0x81,     0x83,     0x10,   0x11,     0x12,   0x13);
  LIKE_ADD(sub,  0x2c, 0x2d,    0x80,     5,  0x81,     0x83,     0x28,   0x29,     0x2a,   0x2b);
  LIKE_ADD(sbb,  0x1c, 0x1d,    0x80,     3,  0x81,     0x83,     0x18,   0x19,     0x1a,   0x1b);
  LIKE_ADD(cmp,  0x3c, 0x3d,    0x80,     7,  0x81,     0x83,     0x38,   0x39,     0x3a,   0x3b);
  LIKE_ADD(and,  0x24, 0x25,    0x80,     4,  0x81,     0x83,     0x20,   0x21,     0x22,   0x23);
  LIKE_ADD(or,   0x0c, 0x0d,    0x80,     1,  0x81,     0x83,     0x08,   0x09,     0x0a,   0x0b);
  LIKE_ADD(xor,  0x34, 0x35,    0x80,     6,  0x81,     0x83,     0x30,   0x31,     0x32,   0x33);
  LIKE_ADD(test, 0xa8, 0xa9,    0xf6,     0,  0xf7,       -1,     0x84,   0x85,       -1,     -1);
  LIKE_ADD(mov,    -1,   -1,    0xc6,     0,  0xc7,       -1,     0x88,   0x89,     0x8a,   0x8B);   
  
  LIKE_ADD(sal,    -1,   -1,    0xc0,     4,    -1,     0xc1,       -1,     -1,       -1,     -1);
  LIKE_ADD(sar,    -1,   -1,    0xc0,     7,    -1,     0xc1,       -1,     -1,       -1,     -1);
  LIKE_ADD(shl,    -1,   -1,    0xc0,     4,    -1,     0xc1,       -1,     -1,       -1,     -1);
  LIKE_ADD(shr,    -1,   -1,    0xc0,     5,    -1,     0xc1,       -1,     -1,       -1,     -1);

  LIKE_ADD(rcl,    -1,   -1,    0xc0,     2,    -1,     0xc1,       -1,     -1,       -1,     -1);
  LIKE_ADD(rcr,    -1,   -1,    0xc0,     3,    -1,     0xc1,       -1,     -1,       -1,     -1);
  LIKE_ADD(rol,    -1,   -1,    0xc0,     0,    -1,     0xc1,       -1,     -1,       -1,     -1);
  LIKE_ADD(ror,    -1,   -1,    0xc0,     1,    -1,     0xc1,       -1,     -1,       -1,     -1);

  LIKE_ADD(lea,    -1,   -1,      -1,    -1,    -1,       -1,       -1,     -1,       -1,   0x8d);
# undef LIKE_ADD



  # define LIKE_MOVZX(name, bOrW, op2) \
    void name(Location src_reg, int32 src_disp, OperandType st, Location index, Scale s = by_one, \
              Location dst_reg = eax) { \
                if (printing) asm_lprintf("%s ", XSTR(name)); \
                Byte(0x0f); \
                Byte(op2); \
                base_disp_reg( bOrW == 'b' ? byte_reg : short_reg, dst_reg, src_reg, src_disp, st, index, s, ", "); \
                printR(long_reg, dst_reg, "\n"); \
                } \
    void name(Location src_reg, int32 src_disp = 0, OperandType st = RegisterOperand,  Location dst_reg = eax) { \
         name(src_reg, src_disp, st, no_reg, by_one, dst_reg); \
    }
                
  LIKE_MOVZX(movsbl, 'b', 0xbe)
  LIKE_MOVZX(movswl, 'w', 0xbf)
  LIKE_MOVZX(movzbl, 'b', 0xb6)
  LIKE_MOVZX(movzwl, 'w', 0xb7)

                
                
  # define CMOV_AND_SETCC(cond, op_cc) \
    void CONC(cmov,cond)(Location src_reg, int32 src_disp, OperandType st, Location index, Scale s, \
              Location dst_reg) { \
                if (printing) asm_lprintf("cmov%s ", XSTR(cond)); \
                Byte(0x0f); \
                Byte(0x40 | op_cc); \
                base_disp_reg( long_reg, dst_reg, src_reg, src_disp, st, index, s, ", "); \
                printR(long_reg, dst_reg, "\n"); \
                } \
   void CONC(cmov,cond)(Location src_reg, int32 src_disp, OperandType st, Location dst_reg) { \
                CONC(cmov,cond)(src_reg, src_disp, st, no_reg, no_scale, dst_reg); \
                } \
   void CONC(cmov,cond)(Location src_reg, Location dst_reg) { \
                CONC(cmov,cond)(src_reg, 0, RegisterOperand, dst_reg); \
              }\
    \
    void CONC(set,cond)(Location reg, int32 d = 0, OperandType t = RegisterOperand, \
                         Location index = no_reg, Scale s = by_one) { \
      if (printing) asm_lprintf("set%s ", XSTR(cond)); \
      Byte(0x0f); \
      Byte(0x90 | op_cc); \
      base_disp_reg( byte_reg, (Location)0, reg, d, t, index, s, "\n"); \
    }
            
  CMOV_AND_SETCC(a,   0x7 )            // pp 3-115 Vol. 2A Inst. Set Ref A-M
  CMOV_AND_SETCC(ae,  0x3 )            
  CMOV_AND_SETCC(b,   0x2 )            
  CMOV_AND_SETCC(be,  0x6 )            
  CMOV_AND_SETCC(c,   0x2 )            
  CMOV_AND_SETCC(e,   0x4 )            
  CMOV_AND_SETCC(g,   0xf )            
  CMOV_AND_SETCC(ge,  0xd )            
  CMOV_AND_SETCC(l,   0xc )            
  CMOV_AND_SETCC(le,  0xe )            
  CMOV_AND_SETCC(na,  0x6 )           
  CMOV_AND_SETCC(nae, 0x2 )            
  CMOV_AND_SETCC(nb,  0x3 )            
  CMOV_AND_SETCC(nbe, 0x7 )            
  CMOV_AND_SETCC(nc,  0x3 )            
  CMOV_AND_SETCC(ne,  0x5 )            
  CMOV_AND_SETCC(ng,  0xe )            
  CMOV_AND_SETCC(nge, 0xc )            
  CMOV_AND_SETCC(nl,  0xd )            
  CMOV_AND_SETCC(nle, 0xf )            
  CMOV_AND_SETCC(no,  0x1 )            
  CMOV_AND_SETCC(np,  0xb )            
  CMOV_AND_SETCC(ns,  0x9 )            
  CMOV_AND_SETCC(nz,  0x5 )            
  CMOV_AND_SETCC(o,   0x0 )                          
  CMOV_AND_SETCC(p,   0xa )                          
  CMOV_AND_SETCC(pe,  0xa )                          
  CMOV_AND_SETCC(po,  0xb )                         
  CMOV_AND_SETCC(s,   0x8 )                          
  CMOV_AND_SETCC(z,   0x4 )                          


  // Others

# define LIKE_DEC(name, op_rm8, op_ext, op_rm32, op_r32) \
  void CONC(name,b)( Location base, int32 disp = 0, OperandType t = RegisterOperand, \
                     Location index = no_reg, Scale s = by_one) { \
    assert(op_rm8 != -1, "no such instruction"); \
    if (printing) asm_lprintf("%sb ", XSTR(name)); \
    Byte(op_rm8); \
    base_disp_reg(byte_reg, (Location)op_ext, base, disp, t, index, s, "\n"); \
  } \
  void CONC(name,l)( Location base, int32 disp = 0, OperandType t = RegisterOperand, \
                    Location index = no_reg, Scale s = by_one) { \
    if (printing) asm_lprintf("%sl ", XSTR(name)); \
    if (op_r32 != -1  &&  t == RegisterOperand) { \
      Byte(op_r32 + base); \
      printR(long_reg, base, "\n"); \
    } \
    else { \
      assert(op_rm32 != -1, "no such instruction"); \
      Byte(op_rm32); \
      base_disp_reg(long_reg, (Location)op_ext, base, disp, t, index, s, "\n"); \
    } \
  } 
  
  LIKE_DEC(dec,  0xfe, 1, 0xff, 0x48);
  LIKE_DEC(inc,  0xfe, 0, 0xff, 0x40);
  LIKE_DEC(push,   -1, 6, 0xff, 0x50);
  LIKE_DEC(pop,    -1, 0, 0x8f, 0x58);
  LIKE_DEC(div,  0xf6, 6, 0xf7,   -1);
  LIKE_DEC(idiv, 0xf6, 7, 0xf7,   -1);
  LIKE_DEC(mul,  0xf6, 4, 0xf7,   -1);
  LIKE_DEC(neg,  0xf6, 3, 0xf7,   -1);
  LIKE_DEC(not,  0xf6, 2, 0xf7,   -1);
  
  # define LIKE_IMUL(name, op_rm8_ax, op_ext, op_rm32_edxeax, op1_rm32_r32, op2_rm32_r32, op_im8_rm32_r32, op_im32_rm32_r32) \
    void CONC(name,b)(Location base, int32 disp = 0, OperandType t = RegisterOperand, Location index = no_reg, Scale s = by_one) { \
      if (printing) asm_lprintf("%sb ", XSTR(name)); \
      Byte(op_rm8_ax); \
      base_disp_reg(short_reg, (Location)op_ext, base, disp, t, index, s, "\n"); \
    } \
    void CONC(name,l)(Location base, int32 disp, OperandType t, Location index, Scale s) { \
      if (printing) asm_lprintf("%sl ", XSTR(name)); \
      Byte(op_rm32_edxeax); \
      base_disp_reg(long_reg, (Location)op_ext, base, disp, t, index, s, "\n"); \
    } \
    void CONC(name,l)(Location base, int32 disp = 0, OperandType t = RegisterOperand) { \
      CONC(name,l)(base, disp, t, no_reg, no_scale); \
    }\
    void CONC(name,l)(Location base, int32 disp, OperandType t, Location index, Scale s, Location dst) { \
      if (printing) asm_lprintf("%sl ", XSTR(name)); \
      Byte(op1_rm32_r32); \
      Byte(op2_rm32_r32); \
      base_disp_reg(long_reg, dst, base, disp, t, index, s, ", "); \
      printR(long_reg, dst, "\n"); \
    } \
    void CONC(name,l)(Location base, int32 disp, OperandType t, Location dst) { \
      CONC(name,l)(base, disp, t, no_reg, no_scale, dst); \
    } \
    void CONC(name,l)(Location base, Location dst) { \
      CONC(name,l)(base, 0, RegisterOperand, dst); \
    } \
    \
    void CONC(name,l)( int32 imm, OperandType it, Location base, int32 disp, OperandType t, Location index, Scale s, Location dst) {\
      if (printing) { \
        asm_lprintf("%sl ", XSTR(name)); \
        printImm(imm, it, ", "); \
      } \
      if (is_disp8(imm, it)) { \
        Byte(op_im8_rm32_r32) ;\
        base_disp_reg(long_reg, dst, base, disp, t, index, s, ", "); \
        Byte(imm); \
      } \
      else { \
        Byte(op_im32_rm32_r32); \
        base_disp_reg(long_reg, dst, base, disp, t, index, s, ", "); \
        addOffset(it, true, false); \
        Data(imm, false); \
      }\
      printR(long_reg, dst, "\n"); \
    } \
    void CONC(name,l)( int32 imm, OperandType it, Location base, int32 disp, OperandType t, Location dst) { \
      CONC(name,l)(imm, it, base, disp, t, no_reg, no_scale, dst) ;\
    } \
    void CONC(name,l)( int32 imm, OperandType it, Location base, Location dst) { \
      CONC(name,l)(imm, it, base, 0, RegisterOperand, dst); \
    } \
    void CONC(name,l)( int32 imm, Location base, Location dst) { \
      CONC(name,l)(imm, NumberOperand, base, 0, RegisterOperand, dst); \
    }
        
  //        name, op_rm8_ax, op_ext, op_rm32_edxeax, op1_rm32_r32, op2_rm32_r32, op_im8_r32, op_im32_rm32_r32
  LIKE_IMUL(imul, 0xf6,      5,      0xf7,           0x0f,         0xaf,         0x6b,       0x69)
  

  void pushl( int32 imm, OperandType t );

  void bswap( Location reg ) { 
    if (printing) { asm_lprintf("bswap ");  printR(long_reg, reg, "\n"); }
    Byte(0x0f);
    Byte(0xc8 + reg);
  }
  

  # define SIMPLE_ONE_BYTE(name, op) \
     void name( ) { if (printing) asm_lprintf("%s\n", XSTR(name) );  Byte(op); }
  SIMPLE_ONE_BYTE(cbw,  0x98)     
  SIMPLE_ONE_BYTE(cwde, 0x98)     
  SIMPLE_ONE_BYTE(clc,  0xf8)     
  SIMPLE_ONE_BYTE(cld,  0xfc)     
  SIMPLE_ONE_BYTE(cmc,  0xf5)
  SIMPLE_ONE_BYTE(hlt,  0xf4)
  SIMPLE_ONE_BYTE(nop,  0x90)
  SIMPLE_ONE_BYTE(stc,  0xf9)
  SIMPLE_ONE_BYTE(std,  0xfd)
  
  # define LIKE_BT(name, op2_r32_rm32, op_ext) \
    void name(Location src_reg, \
              Location dst_reg = eax, int32 dst_disp = 0, OperandType dt = RegisterOperand, \
              Location index_reg = no_reg, Scale s = by_one) { \
      if (printing) { \
        asm_lprintf("%s %s, ", STR(name), RegisterNames[src_reg]); \
      } \
      Byte(0x0f); \
      Byte(op2_r32_rm32); \
      base_disp_reg( long_reg, src_reg, dst_reg, dst_disp, dt, index_reg, s, "\n"); \
    } \
    \
    void name(int32 imm, \
              Location dst_reg = eax, int32 dst_disp = 0, OperandType dt = RegisterOperand, \
              Location index_reg = no_reg, Scale s = by_one) { \
      if (printing) { \
        asm_lprintf("%s ", STR(name)); \
        printImm(imm, NumberOperand, ", "); \
      } \
      Byte(0x0f); \
      Byte(0xba); \
      base_disp_reg( long_reg, Location(op_ext), dst_reg, dst_disp, dt, index_reg, s, "\n"); \
      Byte(imm); \
    }
    
  LIKE_BT(btl,  0xa3, 4);                                          
  LIKE_BT(btcl, 0xbb, 7);                                          
  LIKE_BT(btrl, 0xb3, 6);                                          
  LIKE_BT(btsl, 0xab, 5);  
  
  # undef LIKE_BT                                                                                  

  void enter( int32 imm) {
    if (printing) {
      asm_lprintf("enter ");
      printImm(imm, NumberOperand, ", ");
      asm_lprintf("$0\n");
    }
    Byte(0xc8);
    Short(imm);
    Byte(0);
  }
  
  void leave() { 
    if (printing) asm_lprintf("leave\n");
    Byte(0xc9);
  }

  void ret( int32 stack_incr = 0);  


  void ud2() {
    if (printing) asm_lprintf("ud2\n");
    Byte(0x0f);
    Byte(0x0b);
  }


    
# ifdef SIC_COMPILER
    void unimp(fint n, bool shouldRestart);


  // for statistics
  void startTypeTest(fint ncases, bool prologueCheck, bool immedOnly);
  void doOneTypeTest();
  void endTypeTest();
  void markTagTest(fint nvalues, bool intArith = false);
# endif

};   


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // __i386__
