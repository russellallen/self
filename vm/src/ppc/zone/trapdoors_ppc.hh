# if defined(__ppc__) || defined(__powerpc__)
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


 public:
  pc_t  SaveSelfNonVolRegs_td(Location tmp = IllegalLocation);
  
 private:

  class Element: public CHeapObj {
   private:
    pc_t  _start;
    void* dest_fn;
    pc_t dest_fn_start;
    Location tmp_reg;
   public:
    Element(void* d, Location t) {
      dest_fn = d;
      dest_fn_start = first_inst_addr(dest_fn);
      tmp_reg = t;
    }
    void gen(Assembler* a, pc_t code_start);
    pc_t start(Location tmp) {
      assert(tmp == IllegalLocation  ||  tmp == tmp_reg, "wrong temporary register used");
      return _start;
    }
    pc_t translate(pc_t); 
  };
  
  int32 _bytes_of_code;
  
  static Element    SendMessage_stub_elem;
  static Element  SendDIMessage_stub_elem;
  static Element      Recompile_stub_elem;
  static Element    DIRecompile_stub_elem;
  static Element  SaveSelfNonVolRegs_elem;
# endif // __ppc__
