#pragma once
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "smiOop.hh"


// format:
//  marked<1> age<7> hash<22> tag<2>
//

const fint object_is_marked_bits = 1;
const fint age_bits              = 7;
const fint hash_bits             = BitsPerWord - object_is_marked_bits - age_bits - Tag_Size;

const fint hash_shift                      = Tag_Size;
const fint age_shift                       = hash_bits  + hash_shift; 
const fint object_is_marked_shift          = age_bits  + age_shift;


# define DEFINE_MASKS(name)                                                   \
const int32 CONC(name,_mask) = nthMask(CONC(name,_bits));                     \
const int32 CONC(name,_mask_in_place) = CONC(name,_mask) << CONC(name,_shift);

DEFINE_MASKS(hash)
DEFINE_MASKS(age)
DEFINE_MASKS(object_is_marked)

enum { no_hash = 0, first_hash = 1, second_hash = 2 };

const int32 no_hash_in_place     = no_hash     << hash_shift;
const int32 first_hash_in_place  = first_hash  << hash_shift;
const int32 second_hash_in_place = second_hash << hash_shift;

# define initial_markOop        markOop(no_hash_in_place | Mark_Tag)
# define badOop                 markOop(first_hash_in_place | Mark_Tag)
// although this is a markOop, defining it as more general oop 
//  prevents compiler complaints about anOop == failedAllocationOop -- dmu
# define failedAllocationOop    oop(second_hash_in_place | Mark_Tag)

const int32 overflow_hash_in_place = first_hash_in_place;
const int32 overflow_age_in_place = age_mask_in_place;


class markOopClass: public oopClass {
 public:
  Map* map() { return Memory->mark_map; }
  
  // accessors  
    bool     is_objectMarked()        { return          int32(this) &  object_is_marked_mask_in_place ; }
    markOop  with_objectIsMarked()    { return markOop( int32(this) |  object_is_marked_mask_in_place); }
    markOop  without_objectIsMarked() { return markOop( int32(this) & ~object_is_marked_mask_in_place); }
    
    // TODO:  2012-04-24 topa, do something about the friend here
# define VALUE_ACCESSOR(name, setAction, setAssert)                           \
                                                                              \
    int32 name() {                                                            \
      return maskBits(int32(this), CONC(name,_mask_in_place))                 \
             >> CONC(name,_shift); }                                          \
                                                                              \
    markOop CONC(set_,name)(int32 v) {                                        \
      setAction;                                                              \
      markOop val = markOop((int32(this) & ~CONC(name,_mask_in_place)) |      \
             ((v & CONC(name,_mask)) << CONC(name,_shift)));                  \
      setAssert;                                                              \
      return val; }                                                           \
                                                                              \
    int32 CONC(name,_in_place)() {                                            \
      return maskBits(int32(this), CONC(name,_mask_in_place)); }              \
                                                                              \
    markOop CONC3(set_,name,_in_place)(int32 v) {                             \
      assert((v & ~CONC(name,_mask_in_place)) == 0,                           \
             "shouldn't overflow field");                                     \
      return markOop((int32(this) & ~CONC(name,_mask_in_place)) | v); }       \
                                                                              \
    markOop CONC(incr_,name)() {                                              \
      int32 n = CONC(name,_in_place)();                                       \
      if (n == CONC(name,_mask_in_place)) {                                   \
        n = CONC3(overflow_,name,_in_place);                                  \
      } else {                                                                \
        n += (1 << CONC(name,_shift));                                        \
      }                                                                       \
      return CONC3(set_,name,_in_place)(n); }                                 \
                                                                              \
    friend int32 CONC(max_,name)() { return CONC(name,_mask); }
  
  
  VALUE_ACCESSOR(hash,
                 if ((v & hash_mask) == 0) v += first_hash;/* avoid no_hash */,
                 assert(val->hash() != no_hash, "should have hash now"));
  VALUE_ACCESSOR(age, , );
  
  friend int32 assign_hash(markOop& m);
  
  friend int32 hash_markOop(markOop& m) {
    int32 h = m->hash();
    return h == no_hash ? assign_hash(m) : h; }
  
  smi identity_hash() { return hash(); }
  
  void print_oop() { lprintf("Mark#0x%lx", (void*)(long) this); }
  void print();
};
