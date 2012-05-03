# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "search_ppc.hh"
# include "_search_ppc.cpp.incl"



// sw pipelining for 1-case, xpose for many case


# define WORDS_PER_VECTOR 4


static int32* altivec_vectorfind_next_match(int32* start, int32* targets, int32 num_targets, int32* hit_num);
extern "C" {
  static oop* altivec_find_this_object(oop* middle);
  static oop* altivec_find_next_object(oop* middle);
  static oop* altivec_find_prior_reference(oop* middle, oop target);
}

# define C(n) \
  static int32* altivec_vectorfind_next_match_##n(int32* space, int32* targets, int32* target_buf, int32* hit_num);

    C( 1) C( 2) C( 3) C( 4) C( 5) C( 6) C( 7) C( 8) C( 9) C(10)
    C(11) C(12) C(13) C(14) C(15) C(16) C(17) C(18) C(19) C(20)
    C(21) C(22) C(23) C(24) C(25) C(26) C(27) C(28) C(29) C(30)
    C(31) C(32) C(33) C(34) C(35) C(36) C(37) C(38) C(39) C(40)
# undef C

// simple C implementation

int32 Vectorfind_max_targets = 40;   
int32 Vectorfind_max_chunk_size = 0x40000000; 

int32* vectorfind_next_match(int32* start,
                             int32* targets, int32 num_targets, 
                             int32* hit_num) {
  if (!haveAltiVec()) {
    for ( ;  ;  ++start) {
      for (int32 index = 0; index < num_targets; ++index)
        if (*start == targets[index]) { *hit_num = index; return start; }
    }
    fatal("should be sentinel");
  }
  return altivec_vectorfind_next_match(start, targets, num_targets, hit_num);
}

static int32* altivec_vectorfind_next_match(int32* start,
                                            int32* targets, int32 num_targets, 
                                            int32* hit_num) {
  // ensure quad alignment
  for ( ;  int32(start) & (WORDS_PER_VECTOR * sizeof(int32) - 1);  ++start) {
    for (int32 index = 0; index < num_targets; ++index)
      if (*start == targets[index]) { *hit_num = index; return start; }
  }
  
  // find aligned-by-four target buffer
  int32 buf[4];
  int32* bp = &buf[0];
  while (int(bp) & (WORDS_PER_VECTOR * sizeof(int32) - 1)) ++bp;
  

  int32* r = NULL;
  # define C(n) case n: r = altivec_vectorfind_next_match_##n(start, targets, bp, hit_num); break;
  switch (num_targets) { 
    default: fatal("must match");
    C( 1) C( 2) C( 3) C( 4) C( 5) C( 6) C( 7) C( 8) C( 9) C(10)
    C(11) C(12) C(13) C(14) C(15) C(16) C(17) C(18) C(19) C(20)
    C(21) C(22) C(23) C(24) C(25) C(26) C(27) C(28) C(29) C(30)
    C(31) C(32) C(33) C(34) C(35) C(36) C(37) C(38) C(39) C(40)
  }
  # undef C
  
  for ( start = r;  start  < r + WORDS_PER_VECTOR;  ++start) {
    for ( int32 index = 0; index < num_targets; ++index)
      if (*start == targets[index]) { *hit_num = index; return start; }
  }
  fatal("not found");
  return NULL;
}

  
extern "C" {
  // enumeration:   // simple C implementation

  oop* find_this_object(oop* middle) {
    if (!haveAltiVec()) {
      for ( ; !(*middle)->is_mark(); --middle) {} 
      return middle; 
    }
  return altivec_find_this_object(middle);
  }
  
  static oop* altivec_find_this_object(oop* middle) {
    switch ( (int32(middle) / sizeof(oop)) & (WORDS_PER_VECTOR - 1) ) {
      case 2:  if ( (*middle)->is_mark() ) return middle; --middle; // FALL THROUGH
      case 1:  if ( (*middle)->is_mark() ) return middle; --middle; // FALL THROUGH
      case 0:  if ( (*middle)->is_mark() ) return middle; --middle; // FALL THROUGH
      case 3:  break;
    }
    middle -= WORDS_PER_VECTOR - 1;

    vector signed int data;
    vector signed int masks    = {Tag_Mask, Tag_Mask, Tag_Mask, Tag_Mask};
    vector signed int markTags = {Mark_Tag, Mark_Tag, Mark_Tag, Mark_Tag};
    for ( ;
          ! vec_any_eq( markTags,  vec_and( masks, vec_ldl(0, (int*)middle)));
          middle -= WORDS_PER_VECTOR )
      ;
    if (middle[3]->is_mark())  return middle + 3;
    if (middle[2]->is_mark())  return middle + 2;
    if (middle[1]->is_mark())  return middle + 1;
    if (middle[0]->is_mark())  return middle + 0;
    fatal("not found");
    return NULL;
  }
  

  oop* find_next_object(oop* middle) {
    ++middle;
    if (!haveAltiVec()) {
      for ( ; !(*middle)->is_mark(); ++middle) {} 
      return middle;
    }
  return altivec_find_next_object(middle);
  }

  static oop* altivec_find_next_object(oop* middle) {
    switch ( (int32(middle) / sizeof(oop)) & (WORDS_PER_VECTOR - 1) ) {
      case 1:  if ( (*middle)->is_mark() ) return middle; ++middle; // FALL THROUGH
      case 2:  if ( (*middle)->is_mark() ) return middle; ++middle; // FALL THROUGH
      case 3:  if ( (*middle)->is_mark() ) return middle; ++middle; // FALL THROUGH
      case 0:  break;
    }

    vector signed int data;
    vector signed int masks    = {Tag_Mask, Tag_Mask, Tag_Mask, Tag_Mask};
    vector signed int markTags = {Mark_Tag, Mark_Tag, Mark_Tag, Mark_Tag};
    for ( ;
          ! vec_any_eq( markTags,  vec_and( masks, vec_ldl(0, (int*)middle)));
          middle += WORDS_PER_VECTOR )
      ;
    if (middle[0]->is_mark())  return middle + 0;
    if (middle[1]->is_mark())  return middle + 1;
    if (middle[2]->is_mark())  return middle + 2;
    if (middle[3]->is_mark())  return middle + 3;
    fatal("not found");
    return NULL;
  }    
          

  oop* find_prior_reference(oop* middle, oop target) {
    if (!haveAltiVec()) {
      for ( ; *middle != target; --middle) {}
      return middle; 
    }
  return altivec_find_prior_reference(middle, target);
  }

  static oop* altivec_find_prior_reference(oop* middle, oop target) {
    switch ( (int32(middle) / sizeof(oop)) & (WORDS_PER_VECTOR - 1) ) {
      case 2:  if ( *middle == target ) return middle; --middle; // FALL THROUGH
      case 1:  if ( *middle == target ) return middle; --middle; // FALL THROUGH
      case 0:  if ( *middle == target ) return middle; --middle; // FALL THROUGH
      case 3:  break;
    }
    middle -= WORDS_PER_VECTOR - 1;

    vector signed int data;
    static int32 buf[WORDS_PER_VECTOR];
    static int32* aligned_bp = NULL;
    if (aligned_bp == NULL)
      for ( aligned_bp = buf;
            int(aligned_bp) & (WORDS_PER_VECTOR * sizeof(int)  -  1);
            ++aligned_bp) 
        {}
    *aligned_bp = (int32)target;
    vector signed int targets = vec_splat( vec_lvewx(0, aligned_bp), 0 );
    for ( ;
          ! vec_any_eq( targets, vec_ldl(0, (int*)middle));
          middle -= WORDS_PER_VECTOR )
      ;
    if (middle[3] == target)  return middle + 3;
    if (middle[2] == target)  return middle + 2;
    if (middle[1] == target)  return middle + 1;
    if (middle[0] == target)  return middle + 0;
    fatal("not found");
    return NULL;
  }
}




// Don't know alignment of targets vector, and lvewx uses alignment, so
// use an aligned buffer


# define lt(n) \
  vector signed int targ##n; \
  *target_buf = targets[n]; \
  targ##n = vec_lvewx(0, target_buf); \
  targ##n = vec_splat(targ##n, 0);
  
# define tt(n) if (vec_any_eq(data, targ##n)) break;


static int32* altivec_vectorfind_next_match_1(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  
  vector signed int data;
  lt(0)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0);
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_2(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0) lt(1)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0);
    tt(1);
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_3(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0) tt(1) tt(2)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_4(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0) tt(1) tt(2) tt(3)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_5(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0) tt(1) tt(2) tt(3) tt(4)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_6(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0) tt(1) tt(2) tt(3) tt(4) tt(5)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_7(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0) tt(1) tt(2) tt(3) tt(4) tt(5) tt(6)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_8(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0) tt(1) tt(2) tt(3) tt(4) tt(5) tt(6) tt(7)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_9(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0) tt(1) tt(2) tt(3) tt(4) tt(5) tt(6) tt(7) tt(8)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_10(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0) tt(1) tt(2) tt(3) tt(4) tt(5) tt(6) tt(7) tt(8) tt(9)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_11(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10)
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_12(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11)
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_13(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12)
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_14(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13)
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_15(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14)
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_16(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15)
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_17(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16)
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_18(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17)
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_19(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18)
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_20(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)    
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_21(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20)
    
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_22(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21)
    
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_23(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22)
    
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_24(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23)
    
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_25(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24)
    
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) 
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_26(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24) lt(25)
    
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) tt(25)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_27(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24) lt(25) lt(26)
    
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) tt(25) tt(26)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_28(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24) lt(25) lt(26) lt(27)
    
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) tt(25) tt(26) tt(27)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_29(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24) lt(25) lt(26) lt(27) lt(28)
    
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) tt(25) tt(26) tt(27) tt(28) 
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_30(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24) lt(25) lt(26) lt(27) lt(28) lt(29)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) tt(25) tt(26) tt(27) tt(28) tt(29)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_31(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24) lt(25) lt(26) lt(27) lt(28) lt(29)
  lt(30)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) tt(25) tt(26) tt(27) tt(28) tt(29)
    tt(30)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_32(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24) lt(25) lt(26) lt(27) lt(28) lt(29)
  lt(30) lt(31) 
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) tt(25) tt(26) tt(27) tt(28) tt(29)
    tt(30) tt(31) 
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_33(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24) lt(25) lt(26) lt(27) lt(28) lt(29)
  lt(30) lt(31) lt(32)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) tt(25) tt(26) tt(27) tt(28) tt(29)
    tt(30) tt(31) tt(32)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_34(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24) lt(25) lt(26) lt(27) lt(28) lt(29)
  lt(30) lt(31) lt(32) lt(33)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) tt(25) tt(26) tt(27) tt(28) tt(29)
    tt(30) tt(31) tt(32) tt(33)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_35(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24) lt(25) lt(26) lt(27) lt(28) lt(29)
  lt(30) lt(31) lt(32) lt(33) lt(34)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) tt(25) tt(26) tt(27) tt(28) tt(29)
    tt(30) tt(31) tt(32) tt(33) tt(34)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_36(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24) lt(25) lt(26) lt(27) lt(28) lt(29)
  lt(30) lt(31) lt(32) lt(33) lt(34) lt(35)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) tt(25) tt(26) tt(27) tt(28) tt(29)
    tt(30) tt(31) tt(32) tt(33) tt(34) tt(35)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_37(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24) lt(25) lt(26) lt(27) lt(28) lt(29)
  lt(30) lt(31) lt(32) lt(33) lt(34) lt(35) lt(36)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) tt(25) tt(26) tt(27) tt(28) tt(29)
    tt(30) tt(31) tt(32) tt(33) tt(34) tt(35) tt(36)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_38(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24) lt(25) lt(26) lt(27) lt(28) lt(29)
  lt(30) lt(31) lt(32) lt(33) lt(34) lt(35) lt(36) lt(37)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) tt(25) tt(26) tt(27) tt(28) tt(29)
    tt(30) tt(31) tt(32) tt(33) tt(34) tt(35) tt(36) tt(37)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_39(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24) lt(25) lt(26) lt(27) lt(28) lt(29)
  lt(30) lt(31) lt(32) lt(33) lt(34) lt(35) lt(36) lt(37) lt(38)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) tt(25) tt(26) tt(27) tt(28) tt(29)
    tt(30) tt(31) tt(32) tt(33) tt(34) tt(35) tt(36) tt(37) tt(38)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}


static int32* altivec_vectorfind_next_match_40(int32* space, int32* targets, int32* target_buf, int32* hit_num) {
  vector signed int data;
  lt(0)  lt(1)  lt(2)  lt(3)  lt(4)  lt(5)  lt(6)  lt(7)  lt(8)  lt(9)
  lt(10) lt(11) lt(12) lt(13) lt(14) lt(15) lt(16) lt(17) lt(18) lt(19)
  lt(20) lt(21) lt(22) lt(23) lt(24) lt(25) lt(26) lt(27) lt(28) lt(29)
  lt(30) lt(31) lt(32) lt(33) lt(34) lt(35) lt(36) lt(37) lt(38) lt(39)
  
  for (;;) {
    data = vec_ldl(0, space);
    tt(0)  tt(1)  tt(2)  tt(3)  tt(4)  tt(5)  tt(6)  tt(7)  tt(8)  tt(9)
    tt(10) tt(11) tt(12) tt(13) tt(14) tt(15) tt(16) tt(17) tt(18) tt(19)
    tt(20) tt(21) tt(22) tt(23) tt(24) tt(25) tt(26) tt(27) tt(28) tt(29)
    tt(30) tt(31) tt(32) tt(33) tt(34) tt(35) tt(36) tt(37) tt(38) tt(39)
    space += WORDS_PER_VECTOR;
  }  
  return space;
}

# undef tt
# undef lt
# endif // TARGET_ARCH == PPC_ARCH
