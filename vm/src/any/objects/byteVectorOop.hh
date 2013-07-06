/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


inline smi lengthWords(smi l) { return roundTo((l), oopSize) / oopSize; }

class byteVectorOopClass: public slotsOopClass {
 public:
  // instance variables
  smiOop _len;
  char* _bytes;

  // constructor
  static inline byteVectorOop as_byteVectorOop(void* p) {
    return byteVectorOop(as_slotsOop(p)); }

  // accessors
  byteVectorOopClass* addr() {
    return (byteVectorOopClass*) slotsOopClass::addr(); }

  smi length() { return addr()->_len->value(); }
  void set_length(smi len) { addr()->_len = as_smiOop(len); }
  smi lengthWords() { return ::lengthWords(length()); }

  char* bytes(fint which = 0) { return &addr()->_bytes[which]; }
  void set_bytes(char* bytes) { addr()->_bytes = bytes; }

  char byte_at(fint which) {
    assert(which >= 0 && which < length(), "index out of bounds");
    return *bytes(which); }
  void byte_at_put(fint which, char contents) {
    assert(which >= 0 && which < length(), "index out of bounds");
    *bytes(which) = contents; }

  // allocators
  byteVectorOop copy(fint size, bool mustAllocate, oop genObj, bool cs);
  byteVectorOop copy(bool mustAllocate= true, oop genObj= NULL, bool cs= true)
    { return copy(size(), mustAllocate, genObj, cs); }
  byteVectorOop grow_bytes(fint delta, bool mustAllocate);
  byteVectorOop shrink_bytes(fint delta, bool mustAllocate);
  byteVectorOop insert(fint size, fint change_point, fint delta,
                       bool mustAllocate= true, bool sameGen= false);
  byteVectorOop remove(fint size, fint change_point, fint delta,
                       bool mustAllocate= true, bool sameGen= false);

# ifdef UNUSED
  byteVectorOop clone(bool mustAllocate= true) {
    return byteVectorOop(slotsOopClass::clone(mustAllocate)); }
# endif
  byteVectorOop cloneSize(fint length, bool mustAllocate= true,
                          oop filler= NULL) {
    return byteVectorOop(slotsOopClass::cloneSize(length, mustAllocate,
                                                  filler)); }

  // creation operations
  static byteVectorOop create_byteVector(oop parent);
  static byteVectorOop create_byteVector(fint size);

  // memory operations
  byteVectorOop scavenge(fint size);
  void relocate_bytes(space* s);
  bool verify();
  bool verifyBytesPart(char*& b);

  // C-string operations

  char *copy_null_terminated(int &Clength);
    // Copy the bytes() part. Always add trailing '\0'. If byte vector
    // contains '\0', these will be escaped in the copy, i.e. "....\0...".
    // Clength is set to length of the copy (may be longer due to escaping).
    // Presence of null chars can be detected by comparing Clength to length().

  char *copy_null_terminated() {
    int ignore;
    return copy_null_terminated(ignore);
  }

  char *copy_c_heap_null_terminated();
    // Identical to copy_null_terminated but allocates the resulting string
    // in the C heap instead of in the resource area.

  bool equals(const char* name, int32 len) {
    return len == length() && 
           compare_bytes(bytes(), length(), name, len) == 0; }
  bool equals(byteVectorOop s) {
    return  equals(s->bytes(), s->length()); }
    
  bool has_prefix(const char* prefix, int32 len) {
    return len <= length() &&
           compare_bytes(bytes(), len, prefix, len) == 0; }
           
  bool has_prefix(const char* prefix) {  
    return has_prefix(prefix, strlen(prefix)); }
  
  void string_print() { lprintf_string(length(), bytes());}
  void string_print(fint offset, fint len) { lprintf_string( len, bytes()+offset); }

  // primitives
  static oop bv_at_prim(oop rcvr, oop index);
  static oop bv_at_put_prim(oop rcvr, oop index, oop cval);
  static oop bv_size_prim(oop rcvr);
  static oop bv_compare_prim(oop rcvr, oop arg);
  oop bv_concatenate_prim(byteVectorOop arg, byteVectorOop proto, void *FH);
  oop bv_clone_prim(smi size, u_char filler, void *FH); // Caller must handle size < 0.

  oop string_print_prim();
  oop string_print_on_prim(oop fileName);
  oop string_canonicalize_prim();

  oop run_script_prim();
  oop parseObject_prim(char* fn, oop errorObj, void *FH);
  oop parseObjectIntoPositionTable_prim();
 
  oop write_snapshot_prim(void *FH);

  // documentation primitive
  oop primitive_documentation_prim(void *FH);

  // primitive to set system verification options
  byteVectorOop verify_opts_prim();

  // compiler support
  static inline int32 byteVector_len_offset() {
    return int32(&byteVectorOop(0)->addr()->_len); }
  static inline int32 byteVector_bytes_offset() {
    return int32(&byteVectorOop(0)->addr()->_bytes); }
    
  // Native Code Primitive
  oop run_native_passing_prim(byteVectorOop bv);

};
 

// creation operations
static inline byteVectorOop create_byteVector(oop parent) {
  return byteVectorOopClass::create_byteVector(parent);
}

static inline byteVectorOop create_byteVector(fint size) {
  return byteVectorOopClass::create_byteVector(size);
}

static inline byteVectorOop as_byteVectorOop(void* p) {
  return byteVectorOopClass::as_byteVectorOop(p);
}
