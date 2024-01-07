/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation  "rSet.hh"
# pragma implementation  "rSet_inline.hh"

# include "_rSet.cpp.incl"

rSet::rSet() {
   low_boundary = Memory->new_gen->low_boundary;
  high_boundary = Memory->old_gen->high_boundary;
  clear(); 
  Set_Byte_Map_Base(byte_for(NULL));
}

void* rSet::operator new(size_t size) {
  assert((int32(Memory->new_gen->low_boundary) & (card_size - 1)) == 0,
         "new must start at card boundary");
  assert((int32(Memory->old_gen->low_boundary) & (card_size - 1)) == 0,
         "old must start at card boundary");
  assert((int32(Memory->old_gen->high_boundary) & (card_size - 1)) == 0,
         "old must end at card boundary");
  
  int32 bmsize =
    (Memory->old_gen->high_boundary - Memory->new_gen->low_boundary)
      / card_size;
  bmsize += byte_map_grain; // for next_zero_byte below
  return AllocateHeap(size + bmsize, "rSet");
}

// copy the bits from an older, smaller bitmap, add area [start,end)
rSet::rSet(rSet *old, char *start, char *end)
{
   low_boundary= Memory->new_gen->low_boundary;
  high_boundary= Memory->old_gen->high_boundary;
  char *old_low=  old->low_boundary;
  char *old_high= old->high_boundary;
  Set_Byte_Map_Base(byte_for(NULL));
  memcpy(byte_for(old_low),
         old->byte_for(old_low),
         old->byte_for(old_high) - old->byte_for(old_low));
  clear(byte_for(start), byte_for(end));
  delete old;
}  

// optimized out the wazoo, this is called after an object is copied
//  wholesale to (maybe) old, OR after gc to reset all bytes

void rSet::record_multistores(oop* start, oop* end) {
  assert(card_size_in_oops == 32, "wired in");
  char *bound= Memory->new_gen->boundary();
  if (Memory->new_gen->is_new(as_memOop(start), bound))
    return;
  
  oop x;
# define VISIT(w, next_card)                                                  \
    x = *(w);                                                                 \
    if (x->is_mem()                                                           \
        && Memory->new_gen->is_new(memOop(x), bound)) {                       \
         *byte_for(w) = 0;                                                    \
         next_card;                                                           \
      }                                                                       \
    
  
  // p = first card boundary on or after start
  oop* p = (oop*)roundTo(int32(start), card_size);
  
  // but dont go past end!
  if (end < p) {
    p = end;
  }
  
  // if first card is partial, we can skip it if it is ALREADY marked
  if (p != start  &&  *byte_for(start) != 0) {
    switch (p - start) {
#     define S(i) case i: VISIT(p - i,  break)
     default: ShouldNotReachHere();                    S(31) S(30)
       S(29) S(28) S(27) S(26) S(25) S(24) S(23) S(22) S(21) S(20)
       S(19) S(18) S(17) S(16) S(15) S(14) S(13) S(12) S(11) S(10)
       S( 9) S( 8) S( 7) S( 6) S( 5) S( 4) S( 3) S( 2) S( 1)
#      undef S
    }
  }
  
  // middle cards, starting at p
  oop* end_card = rSet::card_for(end);
  for( ;
      p < end_card;
      p += card_size_in_oops) {
#   define S(i) VISIT(p + i,  continue)
      S( 0) S( 1) S( 2) S( 3) S( 4) S( 5) S( 6) S( 7) S( 8) S( 9) 
      S(10) S(11) S(12) S(13) S(14) S(15) S(16) S(17) S(18) S(19)
      S(20) S(21) S(22) S(23) S(24) S(25) S(26) S(27) S(28) S(29)
      S(30) S(31)
#   undef S
  }
  
  // end card, if partial, else we already did it
  if (p < end  &&  *byte_for(p) != 0) {
    switch (end - p) {
#     define S(i) case i: VISIT(end - i,  break)
     default: ShouldNotReachHere();                    S(31) S(30)
       S(29) S(28) S(27) S(26) S(25) S(24) S(23) S(22) S(21) S(20)
       S(19) S(18) S(17) S(16) S(15) S(14) S(13) S(12) S(11) S(10)
       S( 9) S( 8) S( 7) S( 6) S( 5) S( 4) S( 3) S( 2) S( 1)
#     undef S
    }
  }
# undef VISIT
}


// called to find roots and start scavenge
// first time, start will be start of old, after it will be
// wherever we need to start
// We dont attempt to fixup the bytes for partial cards--
//  it doesnt seem like a win.

// If AllowOffsetCheckStores is true:
// The compiler can generate stores at constant positive offsets off of 
// a base pointer, but mark the update at the card of the base pointer rather
// than the stored word.  This saves an add instruction with each store check,
// but can move the mark in the previous card (the maximum error in offset
// allowed is the size of a card, so the mark will be only one card off).
// I.e. when storing into [r1+11], the generated code will mark the card for
// address r1, not r1+11. Accordingly, for each marked card, we also scan the
// following card in case that's the real modified card.        -Urs

bool rSet::scavenge_contents(oop* start, oop* end) {
  assert(card_size_in_oops == 32, "wired in");
  char* bound = Memory->new_gen->boundary();
  
  bool changed = false;
  
  oop  x;
  char new_byte;
  
# define VISIT(w)                                                             \
    x = *(w);                                                                 \
    if (x->is_mem()) {                                                        \
      /* CSE the is_mem tests from the following is_new and scavenge calls */ \
      memOop mx = memOop(x);                                                  \
      if (Memory->new_gen->is_new(mx, bound)) {                               \
        *(w) = mx = memOop(mx->scavenge());                                   \
        changed = true;                                                       \
        if (new_byte != 0 && Memory->new_gen->is_new(mx, bound)) new_byte = 0;\
      }                                                                       \
    }
  
  oop* p = rSet::card_for(start);
  assert(p == start,
         "this routine assumes start on card boundary (start of old space)");
  
  // first & middle cards:
  char* cp = byte_for(p);
  char* end_byte = byte_for(end);
  for (;;) {
    cp = rSet::next_zero_byte(cp, end_byte);
    if (cp >= end_byte) break;
    assert(*cp == 0, "next_zero_byte failed");
    char oc;
    do {
      p = oop_for(cp);
      new_byte = static_cast<char>(AllBits);
#     define S(i)  VISIT(p + i)
        S( 0) S( 1) S( 2) S( 3) S( 4) S( 5) S( 6) S( 7) S( 8) S( 9)
        S(10) S(11) S(12) S(13) S(14) S(15) S(16) S(17) S(18) S(19)
        S(20) S(21) S(22) S(23) S(24) S(25) S(26) S(27) S(28) S(29)
        S(30) S(31)
#     undef S
      oc = *cp;
      *cp = new_byte;
      cp++;
    } while (oc == 0 && AllowOffsetCheckStores && cp < end_byte);
  }
  
  // last card, if partial
  assert(cp == byte_for(end), "just checking");
  p = card_for(end);
  new_byte = static_cast<char>(AllBits);
  switch (end - p) {
#   define S(i) case i: VISIT(end - i)
   default: ShouldNotReachHere();                    S(31) S(30)
     S(29) S(28) S(27) S(26) S(25) S(24) S(23) S(22) S(21) S(20)
     S(19) S(18) S(17) S(16) S(15) S(14) S(13) S(12) S(11) S(10)
     S( 9) S( 8) S( 7) S( 6) S( 5) S( 4) S( 3) S( 2) S( 1)
   case 0: break;
#   undef S
  }
  *cp = new_byte;
  return changed;
}


void rSet::clear(char *start, char *end) {
  OS::set_bytes(start, end, AllBits);
}


bool rSet::verify(bool postScavenge) {
  assert(card_size_in_oops == 32, "wired in");
  assert(byte_map_grain == 8 * BytesPerWord, "wired in");
  bool flag = true;
  if (Byte_Map_Base() != byte_map_base()) {
    error2("rSet: ByteMapBaseReg corrupted (%#lx instead of %#lx)",
           Byte_Map_Base(), byte_map_base());
    flag = false;
  }
  flag &= check_saved_byte_map_base();
  
  {FOR_EACH_OLD_SPACE(space) {
    oop* start = space->oopsStart();
    oop* end   = space->oopsEnd(); 
    oop* end_card = rSet::card_for(end);
    char should_be;
    char* bound = Memory->new_gen->boundary();
  
# define CHECK(w)                                                             \
    if (byte_for(w)[0] != should_be &&                                        \
        (!AllowOffsetCheckStores ||                                           \
         byte_for(w)[-1] != should_be || rSet::card_for(w) == start)) {       \
      if (!should_be) {                                                       \
        error3("byte at 0x%x for card at 0x%x is %d should be 0\n",           \
               byte_for(w), w, (int32)*byte_for(w));                                 \
        flag = false;                                                         \
      } else if (postScavenge) {                                              \
        warning3("byte at 0x%x for card at 0x%x is %d should be ~0\n",        \
                 byte_for(w), w, (int32)*byte_for(w));                               \
        flag = false;                                                         \
      } else if (false) {                                                     \
        /* false out the warning for now */                                   \
        warning4("byte at 0x%x for card at 0x%x is %d should be ~0 %s\n",     \
                 byte_for(w), w, (int32) *byte_for(w), "(some are normal)");  \
      }                                                                       \
    }
  
    oop *p;
    for (p= start; p < end_card; p += card_size_in_oops) {
      assert(p == rSet::card_for(p), "should be a card boundary");
#     define S(i) if (Memory->new_gen->is_new(p[i], bound)) should_be = 0; else
      S( 0) S( 1) S( 2) S( 3) S( 4) S( 5) S( 6) S( 7) S( 8) S( 9)
      S(10) S(11) S(12) S(13) S(14) S(15) S(16) S(17) S(18) S(19)
      S(20) S(21) S(22) S(23) S(24) S(25) S(26) S(27) S(28) S(29)
      S(30) S(31)
      should_be = static_cast<char>(AllBits);
#     undef S
      CHECK(p)
      }
    assert(p == end_card,  "just checking");
    assert(rSet::card_for(p) == rSet::card_for(end), "just checking");
  
    should_be = static_cast<char>(AllBits);
    switch (end - p) {
#     define S(i) case i: \
       if (Memory->new_gen->is_new(end[-i], bound)) { should_be = 0;  break; }
      S(31) S(30)
      S(29) S(28) S(27) S(26) S(25) S(24) S(23) S(22) S(21) S(20)
      S(19) S(18) S(17) S(16) S(15) S(14) S(13) S(12) S(11) S(10)
      S( 9) S( 8) S( 7) S( 6) S( 5) S( 4) S( 3) S( 2) S( 1)
      case 0:  break;
      default: ShouldNotReachHere();
#     undef S
    }
    CHECK(end)
    }}
    
  return flag;
# undef CHECK
}

// fast search for next_zero_byte starting at cp, upto (but not including) end
// returns end if no zero found
// exploits extra 8 words at end of map

char* rSet::next_zero_byte(char *cp, char* end) {
  // put zero sentinel at end before scanning
  char old_end = *end;
  *end = 0;

  int32* wp = (int32*)roundTo(int32(cp), sizeof(int32));

  char* cwp = (char*) wp;
  switch (cwp - cp) {
   default: ShouldNotReachHere();
   case 3: if ((cwp)[-3] == 0) { *end = old_end; return cwp - 3; }
   case 2: if ((cwp)[-2] == 0) { *end = old_end; return cwp - 2; }
   case 1: if ((cwp)[-1] == 0) { *end = old_end; return cwp - 1; }
   case 0: break;
  }

  const int32 ones = AllBits;
  
  for (  ;
       (wp[0] & wp[1] & wp[2] & wp[3] & wp[4] & wp[5] & wp[6] & wp[7]) == ones;
       wp += 8)
    ;
  
  if      (wp[0] != ones) wp += 0;
  else if (wp[1] != ones) wp += 1;
  else if (wp[2] != ones) wp += 2;
  else if (wp[3] != ones) wp += 3;
  else if (wp[4] != ones) wp += 4;
  else if (wp[5] != ones) wp += 5;
  else if (wp[6] != ones) wp += 6;
  else                    wp += 7;
  
  cwp = (char*) wp;
  if (cwp[0] == 0) { *end = old_end; return cwp + 0; }
  if (cwp[1] == 0) { *end = old_end; return cwp + 1; }
  if (cwp[2] == 0) { *end = old_end; return cwp + 2; }
  if (cwp[3] == 0) { *end = old_end; return cwp + 3; }
  
  ShouldNotReachHere();
  return 0;
}

// new old space added; fix the cards
void rSet::fixup(char *start, char *end)
{
  if (end > high_boundary)
    Memory->remembered_set= new rSet(this, start, end);
  else
    clear(byte_for(start), byte_for(end));
}
