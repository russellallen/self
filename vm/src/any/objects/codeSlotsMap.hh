/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


class codeSlotsMap: public slotsMap {
  // abstract class for objects with code  
 public:
  bool is_method_like()         { return true; }
  oop mirror_names(oop ignored);
  oop  mirror_reflectee(oop r)  {
    if (NakedMethods) return slotsMap::mirror_reflectee(r);
    Unused(r); return ErrorCodes::vmString_prim_error(REFLECTTYPEERROR); }
  fint arg_count();
};


class oldMapList;

// Forward-declaration for friend
slotsOop basic_create_method(slotList* slots, ByteCode* b,
                             methodMap &m1, char *annotation,
                             bool isBlock);
slotsOop create_outerMethod(slotList* slots, ByteCode* b,
                            const char* annotation = "",
                            IntBList* stack_deltas = NULL);

const char* check_byteCodes_and_literals( smi& errorIndex,
                                          IntBList*& stack_deltas,
                                          byteVectorOop codes,
                                          objVectorOop literals );
class methodMap: public codeSlotsMap {
  friend slotsOop create_outerMethod(slotList* slots, ByteCode* b,
                                     const char* annotation,
                                     IntBList* stack_deltas);
 protected:
  // instance variables
  byteVectorOop    _codes;
  stringOop        _file;
  smiOop           _line;
  stringOop      _source;
  objVectorOop _literals;

 public:
  byteVectorOop   codes() { return    _codes; }
  stringOop        file() { return     _file; }
  smiOop           line() { return     _line; }
  objVectorOop literals() { return _literals; }
  stringOop      source() { return   _source; }

  void setFile(stringOop f) { Memory->store((oop*)&_file, oop(f)); }
  void setLine(smiOop l)    { Memory->store((oop*)&_line, l); }

  virtual methodMap* get_lexical_link_map() = 0;

  // protected: (does not work.)
  void setLiterals(objVectorOop lit) {
    Memory->store((oop*)&_literals, lit); }
  void setCodes(byteVectorOop c) {
    Memory->store((oop*)&_codes, c); }
  void setSource(stringOop s)   {
    Memory->store((oop*)&_source, s); }

  protected: // was above (does not work.)

  // functions to implement local access bytecodes
   
  void fix_local_bytecodes_and_links(    oldMapList* old_maps,
                                         slotsOop   outerMethod,
                                         IntBList*  stack_deltas = NULL);

  void fix_local_bytecodes_and_links_of_my_blocks( oldMapList* old_maps,
                                                   slotsOop outerMethod);

  void fix_local_bytecodes_and_links_in_myself(    oldMapList* old_maps,
                                                   slotsOop outerMethod,
                                                   IntBList* stack_deltas);

 public:
  void      GenSendOrLocal( ByteCode* bc,  stringOop sel);
  slotDesc* getLocalSlot( fint lexicalLevel, fint index);

 public:
  bool has_code() { return true; }
  bool hasSubBlocks() {
    for (oop *p= start_literals(), *end= p + length_literals();  p < end;  p++)
      if ((*p)->is_block_with_code())
        return true;
    return false; }

 public:
  u_char* start_codes()  { return (u_char*) _codes->bytes(); }
  fint    length_codes() { return _codes->length();          }

  oop* start_literals()  { return literals()->objs();   }
  fint length_literals() { return literals()->length(); }

  oop mirror_codes(oop r);
  oop mirror_literals(oop r);
  oop mirror_source(oop r);
  oop mirror_file(oop r);
  oop mirror_line(oop r);

  // compiler helper functions
  bool containsBranch();
  bool containsLoop();
  bool containsNLR();
  IntList* accessedSlots(blockMethodMap *bmm);
        // Indices of all slots that could be uplevel-accessed by sends
        // in bmm and subblocks thereof.

 public:
  fint     beginningOfStatement(fint bci);

  IntList* expression_stack(fint bci, bool keepArgs, fint startBCI);
  IntList* expression_stack(fint bci, bool keepArgs) {
    // this used to be:
    
    // if (!keepArgs 
    // && bci+1 < length_codes()
    // && start_codes()[bci+1] == BuildCode(NO_OPERAND_CODE, POP_CODE)) {
    //   // last send in a statement has empty expression stack
    //   return EMPTY;
    // } else {
    //   return expression_stack(bci, keepArgs, beginningOfStatement(bci));
    // } 
    
    // but the then-case fails when the bytecodes do not come from source.
    // So I took it out, which broke Mario's concurrentProgrammingTest
    // but am pressing on for now. -- dmu
    return expression_stack(bci, keepArgs, beginningOfStatement(bci));
    }

  IntList* expression_stack_bcis(bool debugMode);

  IntList* all_blocks(OopList** literals = NULL);
  IntList* blocks_upto(fint bci, OopList** literals = NULL);
    

 public:
  void branch_targets( bool& got_one,  
                       BoolBList** branch_targets,
                       BoolBList** backwards_branch_targets = NULL);
  
  int32 debug_size(oop p);
  
  fint get_index_at(fint byteCodeIndex);
  
  stringOop get_selector_at(fint byteCodeIndex);

  virtual slotDesc* slots() { return (slotDesc*) (this + 1); }
  
  // creation operation
  friend slotsOop basic_create_method(slotList* slots, ByteCode* b,
                                      methodMap &m1, char *annotation,
                                      bool isBlock);

 protected:
  virtual void set_lexical_links( slotsOop   enclosingMethod,
                                  slotsOop       outerMethod,
                                  stringOop  src,
                                  fint       srcOffset,
                                  bool       isOKToBashLiteralVector);
  void set_outer_method_link_in_literals( slotsOop outerMethod);
  
 public:

  // programming
  friend  const char* check_byteCodes_and_literals( smi& errorIndex,
                                                    IntBList*& stack_deltas,
                                                    byteVectorOop codes,
                                                    objVectorOop literals );
  
  // used by programming prims to set backpointers

  oop fix_up_method( oop obj,
                     oop old_optimized_method = NULL,
                     bool isOKToBashLiteralVector = false,
                     bool mustAllocate= true,
                     IntBList* stack_deltas = NULL);

  // printing support
  void print_string(oop obj, char* buf);
  void print_oop(oop obj);
  void print_code(oop obj);
  virtual void print_source();
  void print_byteCode_at(fint byteCodeIndex);

  bool verify(oop obj);
};

class outerMethodMap: public methodMap {
 public:
  friend slotsOop create_outerMethod(slotList* slots, ByteCode* b,
                                     const char* annotation,
                                     IntBList* stack_deltas);
  
  VtblMapType vtblMapType() { return MAP_TYPE_NAME(outerMethodMap); }

  MethodKind kind()             { return OuterMethodType; }
  mirrorOop mirror_proto()      { return Memory->outerMethodMirrorObj; }

  oop mirror_source_offset(oop r) { Unused(r); return smiOop_zero; }
  oop mirror_source_length(oop r) { Unused(r); return smiOop_zero; }

  bool verify(oop obj);

  methodMap* get_lexical_link_map() { return NULL; }
};

// Forward-declaration for friend

slotsOop create_blockMethod(slotList* slots, ByteCode* b,
                            const char* annotation = "",
                            IntBList* stack_deltas = NULL);
slotsOop basic_create_method(slotList* slots, ByteCode* b,
                             methodMap* m1, const char* annotation,
                             bool isBlock);

class blockMethodMap: public methodMap {
  friend slotsOop basic_create_method(slotList* slots,
                                      ByteCode* b,
                                      methodMap &m1,
                                      const char* annotation,
                                      bool isBlock);
  friend class methodMap;
 public: // needs to be public for MW
  smiOop _sourceOffset, _sourceLen;
 protected:
  void set_lexical_links( slotsOop   enclosingMethod,
                          slotsOop       outerMethod,
                          stringOop  src,
                          fint       srcOffset,
                          bool       isOKToBashLiteralVector);

  slotsOop set_lexical_link( slotsOop block_meth, slotsOop enclosing_meth);
  
 public:

  VtblMapType vtblMapType() { return MAP_TYPE_NAME(blockMethodMap); }

  slotDesc* slots() { return (slotDesc*) (this + 1); }

  oop mirror_source_offset(oop r) { Unused(r);  return _sourceOffset; }
  oop mirror_source_length(oop r) { Unused(r);  return _sourceLen; }

  friend slotsOop create_blockMethod(slotList* slots, ByteCode* b,
                                     const char* annotation,
                                     IntBList* stack_deltass);
  friend slotsOop basic_create_method(slotList* slots, ByteCode* b,
                                      methodMap* m1, const char* annotation,
                                      bool isBlock);
  MethodKind kind()             { return BlockMethodType; }
  mirrorOop mirror_proto()      { return Memory->blockMethodMirrorObj; }
  oop mirror_parent(oop obj);

  void print_source();

  bool verify(oop obj);

  methodMap* get_lexical_link_map();
  slotsOop   get_lexical_link();
  
  // compiler helper
  // return list of indices of slots in parentMap up-level accessed by me
  IntList* uplevel_accessed_slots(methodMap* parentMap);
};


