/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



// interpret but keep track of the stack
// assumes that method has already been "fixed" with 
// pushes and pops after uncond branches.

class stacking_interpreter : public abstract_interpreter {


 protected:
   
  virtual bool check_for_pop(oop n) {
    assert_smi(n, "must be smiOop");
    if ( get_stack_depth() < smiOop(n)->value()) {
      set_error_msg("stack underflow");
      return false;
    }
    return true;
  }

  virtual bool check_and_pop(fint n = 1) {
    if ( !check(abstract_interpreter::check_for_pop, as_smiOop(n)) )
      return false;
    pop(n);
    return true;
  }
  
  // override/copy the next few methods to implement the stack:
  // Also, since C++ forbids virtuals in constructors,
  // you must override constructors to initialize the stack.

 public:
 
  stacking_interpreter(oop meth)
  : abstract_interpreter(meth) {  }
  
  stacking_interpreter(methodMap *m)
  : abstract_interpreter(m) {  }
  
  stacking_interpreter(byteVectorOop codes, objVectorOop literals)
  : abstract_interpreter(codes, literals) {  }

 protected:
 
  virtual void push() = 0;
  virtual void* pop(fint n = 1) = 0;
  virtual fint get_stack_depth() = 0;
  
      
 
  void do_read_write_local_code(bool isW) { 
    if (isW) check_and_pop();  
    push(); 
  }
  void do_branch_code(int32 , oop target_oop = badOop ) {
    if ( target_oop != badOop )  check_and_pop();
  }
  void do_BRANCH_INDEXED_CODE() { check_and_pop(); }
  void do_POP_CODE()            { check_and_pop(); }
  void do_SELF_CODE()           {      push(); }
  // override do_literal_code not do_LITERAL_CODE
  //  because need the checking of the argument for the checker
  void do_literal_code(oop)     {      push(); }
  
  void do_send_code(bool isSelfImplicit, stringOop selector, fint arg_count);
};


class stack_depth_interpreter : public stacking_interpreter {
 private:
  
  fint stack_depth;
  
 public:
 
  stack_depth_interpreter(oop meth)
  : stacking_interpreter(meth) { stack_depth= 0; }
  
  stack_depth_interpreter(methodMap *m)
  : stacking_interpreter(m) { stack_depth= 0; }
  
  stack_depth_interpreter(byteVectorOop codes, objVectorOop literals)
  : stacking_interpreter(codes, literals) { stack_depth= 0; }

 protected:
    
  void init_stack() { stack_depth = 0; }
  
  void push() { ++stack_depth; }
  void* pop(fint n = 1) { stack_depth -= n;  return NULL; }
  
  fint get_stack_depth() { return stack_depth; }
  void set_stack_depth(fint d) { stack_depth = d; }
};
