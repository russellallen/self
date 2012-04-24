/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

/* 
  I almost added some code to search all scopes to see if an nmethod
  implemented a particular method, but Urs explained that it would not
  work because some trivial methods do not get put in scopeDescs.
  -- dmu 2/93
*/

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# define FOR_EACH_SCOPE(SCOPES, VAR)\
   for(ScopeDesc* VAR = SCOPES->getNext(NULL); \
       VAR != NULL; VAR =  SCOPES->getNext(VAR) )

class nmethodScopes : public ResourceObj {
 public:
  nmethod*    _nmethod_backPointer;
  uint16      _length;
  // Implements the compact version of nmethod scopes
  // with byte codes, shared oop array, and value array.
  uint16 _oops_offset;  // word offset to the oops array
  uint16 _value_offset; // word offset to the value array
  uint16 _pcs_offset;   // word offset to PcDesc array

private:
  uint16 pack_word_aligned(fint value) {
    assert(value %  BytesPerWord == 0, "value should be word aligned");
    assert(value >> BytesPerWord <= nthMask(BitsPerByte*sizeof(uint16)),
           "value exceeds limit");
    return value >> LogBytesPerWord;
  }

  fint   unpack_word_aligned(uint16 v) { return v << LogBytesPerWord; }

  fint oops_offset()  { return unpack_word_aligned(_oops_offset); }
  fint value_offset() { return unpack_word_aligned(_value_offset); }
  fint pcs_offset()   { return unpack_word_aligned(_pcs_offset); }

  // Return the address after the class header
  u_char* start() { return (u_char*) (this+1); }

 public:    // for debugging
  oop* oops()       { return (oop*) (start() + oops_offset()); } 
  fint oops_size()  { return (value_offset() - oops_offset())/sizeof(oop); }
  oop  oop_at(fint index) { 
    assert( index < oops_size(), "oops index out of range");
    return oops()[index]; 
  }
 private:
  int32* values()     { return (int32*) (start() + value_offset()); } 
  fint   value_size() { return (pcs_offset() - value_offset())/sizeof(int32); }
  int32  value_at(fint index) {
    assert( index < value_size(), "oops index out of range");
    return values()[index]; 
  }

  inline u_char getIndexAt(int32& offset);
  inline oop    unpackOopFromIndex(u_char index, int32& offset);
  inline int32  unpackValueFromIndex(u_char index, int32& offset);

 public:
  void set_length(fint v)       { _length       = pack_word_aligned(v); }
  void set_oops_offset(fint v)  { _oops_offset  = pack_word_aligned(v); }
  void set_value_offset(fint v) { _value_offset = pack_word_aligned(v); }
  void set_pcs_offset(fint v)   { _pcs_offset   = pack_word_aligned(v); }

  void* pcs()    { return (void*) (start() + pcs_offset()); }
  void* pcsEnd() { return (void*) end(); }

  VtblPtr_t    vtbl_value() { return *((VtblPtr_t*) this); }

  fint     length()   { return unpack_word_aligned(_length); }

  // returns the address following this nmethodScopes.
  ScopeDesc* end() { 
    return (ScopeDesc*) (start()  + length());
  }

  bool includes(ScopeDesc* d) { 
    return this == d->_scopes;
  }

  nmethod* my_nmethod()  { return _nmethod_backPointer; }
    // don't call this nmethod - creates ambiguity w/nmethod constructor -Urs
  ScopeDesc *root()   { return at(0); }

  fint size() { return sizeof(nmethodScopes) + length(); }

  fint offsetTo(ScopeDesc* scope) { return scope->offset(); }

  ScopeDesc* at(smiOop  offset) { return at(offset->value()); }

  ScopeDesc* at(fint offset);

  // used in iterator macro FOR_EACH_SCOPE
  ScopeDesc *getNext(ScopeDesc *s) {
    if (!s) return at(0);
    fint offset = s->next_offset();

    if (offset + (sizeof(int32) - (offset%sizeof(int32))) % sizeof(int32)
        >= (_oops_offset)*sizeof(oop)) return NULL;
    return at(offset);
  }

  u_char get_next_char(int32& offset) { return *(start() + offset++); }

  int16  get_next_half(int32& offset);

  u_char peek_next_char(int32 offset) { return *(start() + offset); }

  oop   unpackOopAt(int32& offset);
  int32 unpackValueAt(int32& offset);

  NameDesc* unpackNameDescAt(int32& offset);

  // Support for garbage collection.
  void oops_do(oopsDoFn f);
  void scavenge_contents();
  void gc_mark_contents();
  void gc_unmark_contents();
  void switch_pointers(oop from, oop to,
                       nmethodBList* nmethods_to_invalidate);

  bool is_new();

  void relocate();

  bool verify();
  void print();
};



# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
