/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


const int32 card_shift = 7; // wired in to scavenge_contents
const int32 card_size  = 1 << card_shift;
const int32 card_size_in_oops = card_size / oopSize;
const int32 byte_map_grain = 8 * BytesPerWord; // private and wired-in

// Forward-declaration for friend
oop*  card_for(oop* p);
char* next_zero_byte(char*, char *);

class rSet: public CHeapObj {
  
  friend class oldSpace;
  friend class oldGeneration;

 private:
  char*    low_boundary; // duplicate of old_gen var so byte_for can be inlined
  char*    high_boundary;
  char     byte_map[1];  // size is a lie
  
  // friend void oldSpace::switch_pointers_by_card(oop, oop);
  char* byte_for(void *p) {
    return &byte_map[int32((char*)p - low_boundary) >> card_shift]; }
  oop*  oop_for(char* p) {
    return (oop*)(low_boundary  +  (p - byte_map  <<  card_shift)); }

  friend oop*  card_for(oop* p) { return (oop*)(int32(p) & ~(card_size - 1)); }
  
  inline char* byte_map_end();
  friend char* next_zero_byte(char*, char *);
  
 public:
  int byte_map_size() { return (high_boundary - low_boundary) / card_size; }
  rSet();
  void* operator new(size_t size);
  
  inline void clear();
  char* byte_map_base()         { return byte_for(NULL); }
  void record_store(void* p)    { *byte_for(p) = 0; }
  void record_multistores(oop* start, oop* end);
  // next one is here because of include file orderings
  void record_multistores(void* start, void* endArg)
    {record_multistores ((oop*)start, (oop*)endArg); }
  bool scavenge_contents(oop* , oop* );
  bool verify(bool postScavenge);
  
 private:
  void fixup(char *start, char *end);
  void clear(char *start, char *end);
  rSet(rSet *old, char *start, char *end);
};
