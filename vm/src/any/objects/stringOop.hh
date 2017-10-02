#pragma once
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "byteVectorOop.hh"
# include "stringUtil.hh"
# include "vmStrings.hh"



// constructors
inline stringOop as_stringOop(void* p) {
  return stringOop(as_byteVectorOop(p)); }

stringOop new_string(const char* value, int32 len, bool mustAllocate= true);

inline stringOop new_string(const char* value) {
  return new_string(value, strlen(value), true); }

inline stringOop new_string_or_fail(const char* value) {
  return new_string(value, strlen(value), false); }

class stringOopClass: public byteVectorOopClass {
 public:
  // creation operations
  static stringOop create_string(fint size);
  stringOop make_string(const char* value, fint len, bool mustAllocate= true);
  
  // accessors
  fint arg_count() {
    return this == VMString[DO_IT] ? 0 : str_arg_count(bytes(), length()); }
  bool is_slot_name() { return str_is_slot_name(bytes(), length()); }
  bool is_unary(fint upToLen);
  bool is_unary() {
    fint len= length();
    assert(len > 0, "should have a positive length");
    return is_unary(len); }
      
  bool is_1arg_keyword() {
    fint len= length();
    return len > 0 && bytes()[len - 1] == ':' && is_unary(len - 1); }

  // return unary name corresponding to assignment name
  stringOop unary() { return new_string(bytes(), length()-1); }

  bool is_prim_name() { return str_is_prim_name(bytes(), length()); }
  bool has_IfFail()   { return str_has_IfFail(bytes(), length()); }
  stringOop without_IfFail() { return new_string(bytes(), length() - 7); }
  
  bool has__Perform_prefix()               { return has_prefix("_Perform",  8); }
  bool has__Perform__prefix()              { return has_prefix("_Perform:", 9); }
  bool has__PerformResend__prefix()        { return has_prefix("_PerformResend:", 15); }
  bool has__Perform_DelegatingTo__prefix() { return has_prefix("_Perform:DelegatingTo:", 22); }

  // like strcmp, but slightly different order for slot
  // ordering (sorts foo: before foo0 so that it immediately follows foo)
  fint cmp(stringOop s) { 
    return this == s ? 0
      : compare_slot_names(bytes(), length(), s->bytes(), s->length()); }

# ifdef UNUSED
  // cloning operation
  stringOop clone(bool mustAllocate= true) {
    return (stringOop) byteVectorOopClass::clone(mustAllocate); }
# endif

  // memory operations
  stringOop scavenge();
  bool verify();
};

static inline stringOop create_string(fint size) {
  return stringOopClass::create_string(size);
}
static inline stringOop make_string(const char* value, fint len,
                                    bool mustAllocate= true) {
  return Memory->stringObj->make_string(value, len, mustAllocate);
}
