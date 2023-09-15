/* Sun-$Revision: 30.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

/* sic.  this used to be in enum_sparc.S, so pretend it still is. */
# include "_enum_sparc.S.incl"


ASMOBJ(Vectorfind_max_targets)
        .word   15
	ASMEND(Vectorfind_max_targets)

ASMOBJ(Vectorfind_max_chunk_size)
        .word   8192
	ASMEND(Vectorfind_max_chunk_size)



/*
    int32* vectorfind_next_match(int32* start,
                                 int32* targets, int32 num_targets,
                                 int32* hit_num)
    {
      for ( ; ; ++start) {
        for (int32 index = 0; index < num_targets; ++index) {
          if (*start == targets[index]) { *hit_num = index; return start; }
        }
      }
    }
 */

ASMFUNC(vectorfind_next_match)
        cmp     %o2, 0
        bg,a    0f
         cmp    %o2, 15         ! Vectorfind_max_targets
        retl
         mov    -1, %o0
0:      ble,a   1f
         sll    %o2, 2, %o2
        retl
         mov    -1, %o0

1:      set     .Lvectorfind_next_match_table, %o4
        add     %o2, %o4, %o2
        ld      [%o2 - 4], %o2
        jmp     %o2
         nop

.Lvectorfind_next_match_table:
        .word   vectorfind_next_match_1
        .word   vectorfind_next_match_2
        .word   vectorfind_next_match_3
        .word   vectorfind_next_match_4
        .word   vectorfind_next_match_5
        .word   vectorfind_next_match_6
        .word   vectorfind_next_match_7
        .word   vectorfind_next_match_8
        .word   vectorfind_next_match_9
        .word   vectorfind_next_match_10
        .word   vectorfind_next_match_11
        .word   vectorfind_next_match_12
        .word   vectorfind_next_match_13
        .word   vectorfind_next_match_14
        .word   vectorfind_next_match_15

        ASMEND(vectorfind_next_match)



#define RET_START_0_IS_TARGET_(_N)                                      \
        /* found targets[_N] at start[0] */                             \
        mov     _N, %l0         ; /* *hit_num = _N; */                  \
        st      %l0, [%i3]      ;                                       \
        ret                     ;                                       \
         restore

#define RET_START_1_IS_TARGET_(_N)                                      \
        /* found targets[_N] at haystack1 */                            \
        inc     4, %i0          ; /* advance start to haystack1 */      \
        mov     _N, %l0         ; /* *hit_num = _N; */                  \
        st      %l0, [%i3]      ;                                       \
        ret                     ;                                       \
         restore


LFUNC(vectorfind_next_match_1)
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2  ! targets[0]

        btst    4, %i0          ! start is 8-aligned?
        bnz,a   1f              ! if not
         ld     [%i0], %l1      !  fetch haystack1 from start[0]

        !! start is 8-aligned, we can fetch doublewords
        !! %l0: haystack0 = start[0]
        !! %l1: haystack1 = start[1]
        ldd     [%i0], %l0
        ba,a    3f              ! enter loop (haystack0 checks)
         nop                    !  don't need to advance start

        !! start is not 8-aligned, readjust
1:      dec     4, %i0
        cmp     %l1, %l2        ! checks haystack1 vs targets[0]
        !! fallthrough to the ...

        !! tail part of the loop that checks haystack1
2:      bne,a   1f              ! if haystack1 != targets[0]
         ldd    [%i0 + 8], %l0  !  fetch and check the next haystack pair
        RET_START_1_IS_TARGET_(0)

        ! ldd is hoisted into the dealay slot above
1:      inc     8, %i0          ! start += 2

        !! the real start of the loop from start by doublewords
        !! %l0: haystack0 = start[0]
        !! %l1: haystack1 = start[1]
3:      cmp     %l0, %l2        ! check haystack0 vs targets[0]
1:      bne,a   2b              ! if haystack0 != targets[0] check haystack1
         cmp    %l1, %l2        !  check haystack1 vs targets[0]
        RET_START_0_IS_TARGET_(0)

        ASMEND(vectorfind_next_match_1)


LFUNC(vectorfind_next_match_2)
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2  ! targets[0]
        ld      [%i1 + 4], %l3  ! targets[1]

        btst    4, %i0
        bnz,a   1f
         ld     [%i0], %l1

        ldd     [%i0], %l0
        ba,a    3f
         nop

1:      dec     4, %i0
        cmp     %l1, %l2        ! source[1] == targets[0]
2:      bne,a   1f
         cmp    %l1, %l3        ! source[1] == targets[1]
        RET_START_1_IS_TARGET_(0)

1:      bne,a   1f
         ldd    [%i0 + 8], %l0
        RET_START_1_IS_TARGET_(1)

1:      inc     8, %i0
3:      cmp     %l0, %l2        ! source[0] == targets[0]
        bne,a   1f
         cmp    %l0, %l3        ! source[0] == targets[1]
        RET_START_0_IS_TARGET_(0)

1:      bne,a   2b
         cmp    %l1, %l2        ! source[1] == targets[0]
        RET_START_0_IS_TARGET_(1)

        ASMEND(vectorfind_next_match_2)


LFUNC(vectorfind_next_match_3)
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2  ! targets[0]
        ld      [%i1 + 4], %l3  ! targets[1]
        ld      [%i1 + 8], %l4  ! targets[2]

        btst    4, %i0
        bnz,a   1f
         ld     [%i0], %l1

        ldd     [%i0], %l0
        ba,a    3f
         nop

1:      dec     4, %i0
        cmp     %l1, %l2        ! source[1] == targets[0]
2:      bne,a   1f
         cmp    %l1, %l3        ! source[1] == targets[1]
        RET_START_1_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l1, %l4        ! source[1] == targets[2]
        RET_START_1_IS_TARGET_(1)

1:      bne,a   1f
         ldd    [%i0 + 8], %l0
        RET_START_1_IS_TARGET_(2)

1:      inc     8, %i0
3:      cmp     %l0, %l2        ! source[0] == targets[0]
        bne,a   1f
         cmp    %l0, %l3        ! source[0] == targets[1]
        RET_START_0_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l0, %l4        ! source[0] == targets[2]
        RET_START_0_IS_TARGET_(1)

1:      bne,a   2b
         cmp    %l1, %l2        ! source[1] == targets[0]
        RET_START_0_IS_TARGET_(2)

        ASMEND(vectorfind_next_match_3)


LFUNC(vectorfind_next_match_4)
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2  ! targets[0]
        ld      [%i1 + 4], %l3  ! targets[1]
        ld      [%i1 + 8], %l4  ! targets[2]
        ld      [%i1 + 12], %l5 ! targets[3]

        btst    4, %i0
        bnz,a   1f
         ld     [%i0], %l1

        ldd     [%i0], %l0
        ba,a    3f
         nop

1:      dec     4, %i0
        cmp     %l1, %l2        ! source[1] == targets[0]
2:      bne,a   1f
         cmp    %l1, %l3        ! source[1] == targets[1]
        RET_START_1_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l1, %l4        ! source[1] == targets[2]
        RET_START_1_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l1, %l5        ! source[1] == targets[3]
        RET_START_1_IS_TARGET_(2)

1:      bne,a   1f
         ldd    [%i0 + 8], %l0
        RET_START_1_IS_TARGET_(3)

1:      inc     8, %i0
3:      cmp     %l0, %l2        ! source[0] == targets[0]
        bne,a   1f
         cmp    %l0, %l3        ! source[0] == targets[1]
        RET_START_0_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l0, %l4        ! source[0] == targets[2]
        RET_START_0_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l0, %l5        ! source[0] == targets[3]
        RET_START_0_IS_TARGET_(2)

1:      bne,a   2b
         cmp    %l1, %l2        ! source[1] == targets[0]
        RET_START_0_IS_TARGET_(3)

        ASMEND(vectorfind_next_match_4)


LFUNC(vectorfind_next_match_5)
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2  ! targets[0]
        ld      [%i1 + 4], %l3  ! targets[1]
        ld      [%i1 + 8], %l4  ! targets[2]
        ld      [%i1 + 12], %l5 ! targets[3]
        ld      [%i1 + 16], %l6 ! targets[4]

        btst    4, %i0
        bnz,a   1f
         ld     [%i0], %l1

        ldd     [%i0], %l0
        ba,a    3f
         nop

1:      dec     4, %i0
        cmp     %l1, %l2        ! source[1] == targets[0]
2:      bne,a   1f
         cmp    %l1, %l3        ! source[1] == targets[1]
        RET_START_1_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l1, %l4        ! source[1] == targets[2]
        RET_START_1_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l1, %l5        ! source[1] == targets[3]
        RET_START_1_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l1, %l6        ! source[1] == targets[4]
        RET_START_1_IS_TARGET_(3)

1:      bne,a   1f
         ldd    [%i0 + 8], %l0
        RET_START_1_IS_TARGET_(4)

1:      inc     8, %i0
3:      cmp     %l0, %l2        ! source[0] == targets[0]
        bne,a   1f
         cmp    %l0, %l3        ! source[0] == targets[1]
        RET_START_0_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l0, %l4        ! source[0] == targets[2]
        RET_START_0_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l0, %l5        ! source[0] == targets[3]
        RET_START_0_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l0, %l6        ! source[0] == targets[4]
        RET_START_0_IS_TARGET_(3)

1:      bne,a   2b
         cmp    %l1, %l2        ! source[1] == targets[0]
        RET_START_0_IS_TARGET_(4)

        ASMEND(vectorfind_next_match_5)


LFUNC(vectorfind_next_match_6)
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2  ! targets[0]
        ld      [%i1 + 4], %l3  ! targets[1]
        ld      [%i1 + 8], %l4  ! targets[2]
        ld      [%i1 + 12], %l5 ! targets[3]
        ld      [%i1 + 16], %l6 ! targets[4]
        ld      [%i1 + 20], %l7 ! targets[5]

        btst    4, %i0
        bnz,a   1f
         ld     [%i0], %l1

        ldd     [%i0], %l0
        ba,a    3f
         nop

1:      dec     4, %i0
        cmp     %l1, %l2        ! source[1] == targets[0]
2:      bne,a   1f
         cmp    %l1, %l3        ! source[1] == targets[1]
        RET_START_1_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l1, %l4        ! source[1] == targets[2]
        RET_START_1_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l1, %l5        ! source[1] == targets[3]
        RET_START_1_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l1, %l6        ! source[1] == targets[4]
        RET_START_1_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l1, %l7        ! source[1] == targets[5]
        RET_START_1_IS_TARGET_(4)

1:      bne,a   1f
         ldd    [%i0 + 8], %l0
        RET_START_1_IS_TARGET_(5)

1:      inc     8, %i0
3:      cmp     %l0, %l2        ! source[0] == targets[0]
        bne,a   1f
         cmp    %l0, %l3        ! source[0] == targets[1]
        RET_START_0_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l0, %l4        ! source[0] == targets[2]
        RET_START_0_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l0, %l5        ! source[0] == targets[3]
        RET_START_0_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l0, %l6        ! source[0] == targets[4]
        RET_START_0_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l0, %l7        ! source[0] == targets[5]
        RET_START_0_IS_TARGET_(4)

1:      bne,a   2b
         cmp    %l1, %l2        ! source[1] == targets[0]
        RET_START_0_IS_TARGET_(5)

        ASMEND(vectorfind_next_match_6)


LFUNC(vectorfind_next_match_7)
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2  ! targets[0]
        ld      [%i1 + 4], %l3  ! targets[1]
        ld      [%i1 + 8], %l4  ! targets[2]
        ld      [%i1 + 12], %l5 ! targets[3]
        ld      [%i1 + 16], %l6 ! targets[4]
        ld      [%i1 + 20], %l7 ! targets[5]
        ld      [%i1 + 24], %o0 ! targets[6]

        btst    4, %i0
        bnz,a   1f
         ld     [%i0], %l1

        ldd     [%i0], %l0
        ba,a    3f
         nop

1:      dec     4, %i0
        cmp     %l1, %l2        ! source[1] == targets[0]
2:      bne,a   1f
         cmp    %l1, %l3        ! source[1] == targets[1]
        RET_START_1_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l1, %l4        ! source[1] == targets[2]
        RET_START_1_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l1, %l5        ! source[1] == targets[3]
        RET_START_1_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l1, %l6        ! source[1] == targets[4]
        RET_START_1_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l1, %l7        ! source[1] == targets[5]
        RET_START_1_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l1, %o0        ! source[1] == targets[6]
        RET_START_1_IS_TARGET_(5)

1:      bne,a   1f
         ldd    [%i0 + 8], %l0
        RET_START_1_IS_TARGET_(6)

1:      inc     8, %i0
3:      cmp     %l0, %l2        ! source[0] == targets[0]
        bne,a   1f
         cmp    %l0, %l3        ! source[0] == targets[1]
        RET_START_0_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l0, %l4        ! source[0] == targets[2]
        RET_START_0_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l0, %l5        ! source[0] == targets[3]
        RET_START_0_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l0, %l6        ! source[0] == targets[4]
        RET_START_0_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l0, %l7        ! source[0] == targets[5]
        RET_START_0_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l0, %o0        ! source[0] == targets[6]
        RET_START_0_IS_TARGET_(5)

1:      bne,a   2b
         cmp    %l1, %l2        ! source[1] == targets[0]
        RET_START_0_IS_TARGET_(6)

        ASMEND(vectorfind_next_match_7)


LFUNC(vectorfind_next_match_8)
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2  ! targets[0]
        ld      [%i1 + 4], %l3  ! targets[1]
        ld      [%i1 + 8], %l4  ! targets[2]
        ld      [%i1 + 12], %l5 ! targets[3]
        ld      [%i1 + 16], %l6 ! targets[4]
        ld      [%i1 + 20], %l7 ! targets[5]
        ld      [%i1 + 24], %o0 ! targets[6]
        ld      [%i1 + 28], %o1 ! targets[7]

        btst    4, %i0
        bnz,a   1f
         ld     [%i0], %l1

        ldd     [%i0], %l0
        ba,a    3f
         nop

1:      dec     4, %i0
        cmp     %l1, %l2        ! source[1] == targets[0]
2:      bne,a   1f
         cmp    %l1, %l3        ! source[1] == targets[1]
        RET_START_1_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l1, %l4        ! source[1] == targets[2]
        RET_START_1_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l1, %l5        ! source[1] == targets[3]
        RET_START_1_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l1, %l6        ! source[1] == targets[4]
        RET_START_1_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l1, %l7        ! source[1] == targets[5]
        RET_START_1_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l1, %o0        ! source[1] == targets[6]
        RET_START_1_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l1, %o1        ! source[1] == targets[7]
        RET_START_1_IS_TARGET_(6)

1:      bne,a   1f
         ldd    [%i0 + 8], %l0
        RET_START_1_IS_TARGET_(7)

1:      inc     8, %i0
3:      cmp     %l0, %l2        ! source[0] == targets[0]
        bne,a   1f
         cmp    %l0, %l3        ! source[0] == targets[1]
        RET_START_0_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l0, %l4        ! source[0] == targets[2]
        RET_START_0_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l0, %l5        ! source[0] == targets[3]
        RET_START_0_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l0, %l6        ! source[0] == targets[4]
        RET_START_0_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l0, %l7        ! source[0] == targets[5]
        RET_START_0_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l0, %o0        ! source[0] == targets[6]
        RET_START_0_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l0, %o1        ! source[0] == targets[7]
        RET_START_0_IS_TARGET_(6)

1:      bne,a   2b
         cmp    %l1, %l2        ! source[1] == targets[0]
        RET_START_0_IS_TARGET_(7)

        ASMEND(vectorfind_next_match_8)


LFUNC(vectorfind_next_match_9)
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2  ! targets[0]
        ld      [%i1 + 4], %l3  ! targets[1]
        ld      [%i1 + 8], %l4  ! targets[2]
        ld      [%i1 + 12], %l5 ! targets[3]
        ld      [%i1 + 16], %l6 ! targets[4]
        ld      [%i1 + 20], %l7 ! targets[5]
        ld      [%i1 + 24], %o0 ! targets[6]
        ld      [%i1 + 28], %o1 ! targets[7]
        ld      [%i1 + 32], %o2 ! targets[8]

        btst    4, %i0
        bnz,a   1f
         ld     [%i0], %l1

        ldd     [%i0], %l0
        ba,a    3f
         nop

1:      dec     4, %i0
        cmp     %l1, %l2        ! source[1] == targets[0]
2:      bne,a   1f
         cmp    %l1, %l3        ! source[1] == targets[1]
        RET_START_1_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l1, %l4        ! source[1] == targets[2]
        RET_START_1_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l1, %l5        ! source[1] == targets[3]
        RET_START_1_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l1, %l6        ! source[1] == targets[4]
        RET_START_1_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l1, %l7        ! source[1] == targets[5]
        RET_START_1_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l1, %o0        ! source[1] == targets[6]
        RET_START_1_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l1, %o1        ! source[1] == targets[7]
        RET_START_1_IS_TARGET_(6)

1:      bne,a   1f
         cmp    %l1, %o2        ! source[1] == targets[8]
        RET_START_1_IS_TARGET_(7)

1:      bne,a   1f
         ldd    [%i0 + 8], %l0
        RET_START_1_IS_TARGET_(8)

1:      inc     8, %i0
3:      cmp     %l0, %l2        ! source[0] == targets[0]
        bne,a   1f
         cmp    %l0, %l3        ! source[0] == targets[1]
        RET_START_0_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l0, %l4        ! source[0] == targets[2]
        RET_START_0_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l0, %l5        ! source[0] == targets[3]
        RET_START_0_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l0, %l6        ! source[0] == targets[4]
        RET_START_0_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l0, %l7        ! source[0] == targets[5]
        RET_START_0_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l0, %o0        ! source[0] == targets[6]
        RET_START_0_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l0, %o1        ! source[0] == targets[7]
        RET_START_0_IS_TARGET_(6)

1:      bne,a   1f
         cmp    %l0, %o2        ! source[0] == targets[8]
        RET_START_0_IS_TARGET_(7)

1:      bne,a   2b
         cmp    %l1, %l2        ! source[1] == targets[0]
        RET_START_0_IS_TARGET_(8)

        ASMEND(vectorfind_next_match_9)


LFUNC(vectorfind_next_match_10)
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2  ! targets[0]
        ld      [%i1 + 4], %l3  ! targets[1]
        ld      [%i1 + 8], %l4  ! targets[2]
        ld      [%i1 + 12], %l5 ! targets[3]
        ld      [%i1 + 16], %l6 ! targets[4]
        ld      [%i1 + 20], %l7 ! targets[5]
        ld      [%i1 + 24], %o0 ! targets[6]
        ld      [%i1 + 28], %o1 ! targets[7]
        ld      [%i1 + 32], %o2 ! targets[8]
        ld      [%i1 + 36], %o3 ! targets[9]

        btst    4, %i0
        bnz,a   1f
         ld     [%i0], %l1

        ldd     [%i0], %l0
        ba,a    3f
         nop

1:      dec     4, %i0
        cmp     %l1, %l2        ! source[1] == targets[0]
2:      bne,a   1f
         cmp    %l1, %l3        ! source[1] == targets[1]
        RET_START_1_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l1, %l4        ! source[1] == targets[2]
        RET_START_1_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l1, %l5        ! source[1] == targets[3]
        RET_START_1_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l1, %l6        ! source[1] == targets[4]
        RET_START_1_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l1, %l7        ! source[1] == targets[5]
        RET_START_1_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l1, %o0        ! source[1] == targets[6]
        RET_START_1_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l1, %o1        ! source[1] == targets[7]
        RET_START_1_IS_TARGET_(6)

1:      bne,a   1f
         cmp    %l1, %o2        ! source[1] == targets[8]
        RET_START_1_IS_TARGET_(7)

1:      bne,a   1f
         cmp    %l1, %o3        ! source[1] == targets[9]
        RET_START_1_IS_TARGET_(8)

1:      bne,a   1f
         ldd    [%i0 + 8], %l0
        RET_START_1_IS_TARGET_(9)

1:      inc     8, %i0
3:      cmp     %l0, %l2        ! source[0] == targets[0]
        bne,a   1f
         cmp    %l0, %l3        ! source[0] == targets[1]
        RET_START_0_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l0, %l4        ! source[0] == targets[2]
        RET_START_0_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l0, %l5        ! source[0] == targets[3]
        RET_START_0_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l0, %l6        ! source[0] == targets[4]
        RET_START_0_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l0, %l7        ! source[0] == targets[5]
        RET_START_0_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l0, %o0        ! source[0] == targets[6]
        RET_START_0_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l0, %o1        ! source[0] == targets[7]
        RET_START_0_IS_TARGET_(6)

1:      bne,a   1f
         cmp    %l0, %o2        ! source[0] == targets[8]
        RET_START_0_IS_TARGET_(7)

1:      bne,a   1f
         cmp    %l0, %o3        ! source[0] == targets[9]
        RET_START_0_IS_TARGET_(8)

1:      bne,a   2b
         cmp    %l1, %l2        ! source[1] == targets[0]
        RET_START_0_IS_TARGET_(9)

        ASMEND(vectorfind_next_match_10)


LFUNC(vectorfind_next_match_11)
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2  ! targets[0]
        ld      [%i1 + 4], %l3  ! targets[1]
        ld      [%i1 + 8], %l4  ! targets[2]
        ld      [%i1 + 12], %l5 ! targets[3]
        ld      [%i1 + 16], %l6 ! targets[4]
        ld      [%i1 + 20], %l7 ! targets[5]
        ld      [%i1 + 24], %o0 ! targets[6]
        ld      [%i1 + 28], %o1 ! targets[7]
        ld      [%i1 + 32], %o2 ! targets[8]
        ld      [%i1 + 36], %o3 ! targets[9]
        ld      [%i1 + 40], %o4 ! targets[10]

        btst    4, %i0
        bnz,a   1f
         ld     [%i0], %l1

        ldd     [%i0], %l0
        ba,a    3f
         nop

1:      dec     4, %i0
        cmp     %l1, %l2        ! source[1] == targets[0]
2:      bne,a   1f
         cmp    %l1, %l3        ! source[1] == targets[1]
        RET_START_1_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l1, %l4        ! source[1] == targets[2]
        RET_START_1_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l1, %l5        ! source[1] == targets[3]
        RET_START_1_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l1, %l6        ! source[1] == targets[4]
        RET_START_1_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l1, %l7        ! source[1] == targets[5]
        RET_START_1_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l1, %o0        ! source[1] == targets[6]
        RET_START_1_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l1, %o1        ! source[1] == targets[7]
        RET_START_1_IS_TARGET_(6)

1:      bne,a   1f
         cmp    %l1, %o2        ! source[1] == targets[8]
        RET_START_1_IS_TARGET_(7)

1:      bne,a   1f
         cmp    %l1, %o3        ! source[1] == targets[9]
        RET_START_1_IS_TARGET_(8)

1:      bne,a   1f
         cmp    %l1, %o4        ! source[1] == targets[10]
        RET_START_1_IS_TARGET_(9)

1:      bne,a   1f
         ldd    [%i0 + 8], %l0
        RET_START_1_IS_TARGET_(10)

1:      inc     8, %i0
3:      cmp     %l0, %l2        ! source[0] == targets[0]
        bne,a   1f
         cmp    %l0, %l3        ! source[0] == targets[1]
        RET_START_0_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l0, %l4        ! source[0] == targets[2]
        RET_START_0_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l0, %l5        ! source[0] == targets[3]
        RET_START_0_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l0, %l6        ! source[0] == targets[4]
        RET_START_0_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l0, %l7        ! source[0] == targets[5]
        RET_START_0_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l0, %o0        ! source[0] == targets[6]
        RET_START_0_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l0, %o1        ! source[0] == targets[7]
        RET_START_0_IS_TARGET_(6)

1:      bne,a   1f
         cmp    %l0, %o2        ! source[0] == targets[8]
        RET_START_0_IS_TARGET_(7)

1:      bne,a   1f
         cmp    %l0, %o3        ! source[0] == targets[9]
        RET_START_0_IS_TARGET_(8)

1:      bne,a   1f
         cmp    %l0, %o4        ! source[0] == targets[10]
        RET_START_0_IS_TARGET_(9)

1:      bne,a   2b
         cmp    %l1, %l2        ! source[1] == targets[0]
        RET_START_0_IS_TARGET_(10)

        ASMEND(vectorfind_next_match_11)


LFUNC(vectorfind_next_match_12)
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2  ! targets[0]
        ld      [%i1 + 4], %l3  ! targets[1]
        ld      [%i1 + 8], %l4  ! targets[2]
        ld      [%i1 + 12], %l5 ! targets[3]
        ld      [%i1 + 16], %l6 ! targets[4]
        ld      [%i1 + 20], %l7 ! targets[5]
        ld      [%i1 + 24], %o0 ! targets[6]
        ld      [%i1 + 28], %o1 ! targets[7]
        ld      [%i1 + 32], %o2 ! targets[8]
        ld      [%i1 + 36], %o3 ! targets[9]
        ld      [%i1 + 40], %o4 ! targets[10]
        ld      [%i1 + 44], %o5 ! targets[11]

        btst    4, %i0
        bnz,a   1f
         ld     [%i0], %l1

        ldd     [%i0], %l0
        ba,a    3f
         nop

1:      dec     4, %i0
        cmp     %l1, %l2        ! source[1] == targets[0]
2:      bne,a   1f
         cmp    %l1, %l3        ! source[1] == targets[1]
        RET_START_1_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l1, %l4        ! source[1] == targets[2]
        RET_START_1_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l1, %l5        ! source[1] == targets[3]
        RET_START_1_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l1, %l6        ! source[1] == targets[4]
        RET_START_1_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l1, %l7        ! source[1] == targets[5]
        RET_START_1_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l1, %o0        ! source[1] == targets[6]
        RET_START_1_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l1, %o1        ! source[1] == targets[7]
        RET_START_1_IS_TARGET_(6)

1:      bne,a   1f
         cmp    %l1, %o2        ! source[1] == targets[8]
        RET_START_1_IS_TARGET_(7)

1:      bne,a   1f
         cmp    %l1, %o3        ! source[1] == targets[9]
        RET_START_1_IS_TARGET_(8)

1:      bne,a   1f
         cmp    %l1, %o4        ! source[1] == targets[10]
        RET_START_1_IS_TARGET_(9)

1:      bne,a   1f
         cmp    %l1, %o5        ! source[1] == targets[11]
        RET_START_1_IS_TARGET_(10)

1:      bne,a   1f
         ldd    [%i0 + 8], %l0
        RET_START_1_IS_TARGET_(11)

1:      inc     8, %i0
3:      cmp     %l0, %l2        ! source[0] == targets[0]
        bne,a   1f
         cmp    %l0, %l3        ! source[0] == targets[1]
        RET_START_0_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l0, %l4        ! source[0] == targets[2]
        RET_START_0_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l0, %l5        ! source[0] == targets[3]
        RET_START_0_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l0, %l6        ! source[0] == targets[4]
        RET_START_0_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l0, %l7        ! source[0] == targets[5]
        RET_START_0_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l0, %o0        ! source[0] == targets[6]
        RET_START_0_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l0, %o1        ! source[0] == targets[7]
        RET_START_0_IS_TARGET_(6)

1:      bne,a   1f
         cmp    %l0, %o2        ! source[0] == targets[8]
        RET_START_0_IS_TARGET_(7)

1:      bne,a   1f
         cmp    %l0, %o3        ! source[0] == targets[9]
        RET_START_0_IS_TARGET_(8)

1:      bne,a   1f
         cmp    %l0, %o4        ! source[0] == targets[10]
        RET_START_0_IS_TARGET_(9)

1:      bne,a   1f
         cmp    %l0, %o5        ! source[0] == targets[11]
        RET_START_0_IS_TARGET_(10)

1:      bne,a   2b
         cmp    %l1, %l2        ! source[1] == targets[0]
        RET_START_0_IS_TARGET_(11)

        ASMEND(vectorfind_next_match_12)


LFUNC(vectorfind_next_match_13)
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2  ! targets[0]
        ld      [%i1 + 4], %l3  ! targets[1]
        ld      [%i1 + 8], %l4  ! targets[2]
        ld      [%i1 + 12], %l5 ! targets[3]
        ld      [%i1 + 16], %l6 ! targets[4]
        ld      [%i1 + 20], %l7 ! targets[5]
        ld      [%i1 + 24], %o0 ! targets[6]
        ld      [%i1 + 28], %o1 ! targets[7]
        ld      [%i1 + 32], %o2 ! targets[8]
        ld      [%i1 + 36], %o3 ! targets[9]
        ld      [%i1 + 40], %o4 ! targets[10]
        ld      [%i1 + 44], %o5 ! targets[11]
        ld      [%i1 + 48], %i2 ! targets[12]

        btst    4, %i0
        bnz,a   1f
         ld     [%i0], %l1

        ldd     [%i0], %l0
        ba,a    3f
         nop

1:      dec     4, %i0
        cmp     %l1, %l2        ! source[1] == targets[0]
2:      bne,a   1f
         cmp    %l1, %l3        ! source[1] == targets[1]
        RET_START_1_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l1, %l4        ! source[1] == targets[2]
        RET_START_1_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l1, %l5        ! source[1] == targets[3]
        RET_START_1_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l1, %l6        ! source[1] == targets[4]
        RET_START_1_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l1, %l7        ! source[1] == targets[5]
        RET_START_1_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l1, %o0        ! source[1] == targets[6]
        RET_START_1_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l1, %o1        ! source[1] == targets[7]
        RET_START_1_IS_TARGET_(6)

1:      bne,a   1f
         cmp    %l1, %o2        ! source[1] == targets[8]
        RET_START_1_IS_TARGET_(7)

1:      bne,a   1f
         cmp    %l1, %o3        ! source[1] == targets[9]
        RET_START_1_IS_TARGET_(8)

1:      bne,a   1f
         cmp    %l1, %o4        ! source[1] == targets[10]
        RET_START_1_IS_TARGET_(9)

1:      bne,a   1f
         cmp    %l1, %o5        ! source[1] == targets[11]
        RET_START_1_IS_TARGET_(10)

1:      bne,a   1f
         cmp    %l1, %i2        ! source[1] == targets[12]
        RET_START_1_IS_TARGET_(11)

1:      bne,a   1f
         ldd    [%i0 + 8], %l0
        RET_START_1_IS_TARGET_(12)

1:      inc     8, %i0
3:      cmp     %l0, %l2        ! source[0] == targets[0]
        bne,a   1f
         cmp    %l0, %l3        ! source[0] == targets[1]
        RET_START_0_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l0, %l4        ! source[0] == targets[2]
        RET_START_0_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l0, %l5        ! source[0] == targets[3]
        RET_START_0_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l0, %l6        ! source[0] == targets[4]
        RET_START_0_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l0, %l7        ! source[0] == targets[5]
        RET_START_0_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l0, %o0        ! source[0] == targets[6]
        RET_START_0_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l0, %o1        ! source[0] == targets[7]
        RET_START_0_IS_TARGET_(6)

1:      bne,a   1f
         cmp    %l0, %o2        ! source[0] == targets[8]
        RET_START_0_IS_TARGET_(7)

1:      bne,a   1f
         cmp    %l0, %o3        ! source[0] == targets[9]
        RET_START_0_IS_TARGET_(8)

1:      bne,a   1f
         cmp    %l0, %o4        ! source[0] == targets[10]
        RET_START_0_IS_TARGET_(9)

1:      bne,a   1f
         cmp    %l0, %o5        ! source[0] == targets[11]
        RET_START_0_IS_TARGET_(10)

1:      bne,a   1f
         cmp    %l0, %i2        ! source[0] == targets[12]
        RET_START_0_IS_TARGET_(11)

1:      bne,a   2b
         cmp    %l1, %l2        ! source[1] == targets[0]
        RET_START_0_IS_TARGET_(12)

        ASMEND(vectorfind_next_match_13)


LFUNC(vectorfind_next_match_14)
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2  ! targets[0]
        ld      [%i1 + 4], %l3  ! targets[1]
        ld      [%i1 + 8], %l4  ! targets[2]
        ld      [%i1 + 12], %l5 ! targets[3]
        ld      [%i1 + 16], %l6 ! targets[4]
        ld      [%i1 + 20], %l7 ! targets[5]
        ld      [%i1 + 24], %o0 ! targets[6]
        ld      [%i1 + 28], %o1 ! targets[7]
        ld      [%i1 + 32], %o2 ! targets[8]
        ld      [%i1 + 36], %o3 ! targets[9]
        ld      [%i1 + 40], %o4 ! targets[10]
        ld      [%i1 + 44], %o5 ! targets[11]
        ld      [%i1 + 48], %i2 ! targets[12]
        ld      [%i1 + 52], %i4 ! targets[13]

        btst    4, %i0
        bnz,a   1f
         ld     [%i0], %l1

        ldd     [%i0], %l0
        ba,a    3f
         nop

1:      dec     4, %i0
        cmp     %l1, %l2        ! source[1] == targets[0]
2:      bne,a   1f
         cmp    %l1, %l3        ! source[1] == targets[1]
        RET_START_1_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l1, %l4        ! source[1] == targets[2]
        RET_START_1_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l1, %l5        ! source[1] == targets[3]
        RET_START_1_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l1, %l6        ! source[1] == targets[4]
        RET_START_1_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l1, %l7        ! source[1] == targets[5]
        RET_START_1_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l1, %o0        ! source[1] == targets[6]
        RET_START_1_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l1, %o1        ! source[1] == targets[7]
        RET_START_1_IS_TARGET_(6)

1:      bne,a   1f
         cmp    %l1, %o2        ! source[1] == targets[8]
        RET_START_1_IS_TARGET_(7)

1:      bne,a   1f
         cmp    %l1, %o3        ! source[1] == targets[9]
        RET_START_1_IS_TARGET_(8)

1:      bne,a   1f
         cmp    %l1, %o4        ! source[1] == targets[10]
        RET_START_1_IS_TARGET_(9)

1:      bne,a   1f
         cmp    %l1, %o5        ! source[1] == targets[11]
        RET_START_1_IS_TARGET_(10)

1:      bne,a   1f
         cmp    %l1, %i2        ! source[1] == targets[12]
        RET_START_1_IS_TARGET_(11)

1:      bne,a   1f
         cmp    %l1, %i4        ! source[1] == targets[13]
        RET_START_1_IS_TARGET_(12)

1:      bne,a   1f
         ldd    [%i0 + 8], %l0
        RET_START_1_IS_TARGET_(13)

1:      inc     8, %i0
3:      cmp     %l0, %l2        ! source[0] == targets[0]
        bne,a   1f
         cmp    %l0, %l3        ! source[0] == targets[1]
        RET_START_0_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l0, %l4        ! source[0] == targets[2]
        RET_START_0_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l0, %l5        ! source[0] == targets[3]
        RET_START_0_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l0, %l6        ! source[0] == targets[4]
        RET_START_0_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l0, %l7        ! source[0] == targets[5]
        RET_START_0_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l0, %o0        ! source[0] == targets[6]
        RET_START_0_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l0, %o1        ! source[0] == targets[7]
        RET_START_0_IS_TARGET_(6)

1:      bne,a   1f
         cmp    %l0, %o2        ! source[0] == targets[8]
        RET_START_0_IS_TARGET_(7)

1:      bne,a   1f
         cmp    %l0, %o3        ! source[0] == targets[9]
        RET_START_0_IS_TARGET_(8)

1:      bne,a   1f
         cmp    %l0, %o4        ! source[0] == targets[10]
        RET_START_0_IS_TARGET_(9)

1:      bne,a   1f
         cmp    %l0, %o5        ! source[0] == targets[11]
        RET_START_0_IS_TARGET_(10)

1:      bne,a   1f
         cmp    %l0, %i2        ! source[0] == targets[12]
        RET_START_0_IS_TARGET_(11)

1:      bne,a   1f
         cmp    %l0, %i4        ! source[0] == targets[13]
        RET_START_0_IS_TARGET_(12)

1:      bne,a   2b
         cmp    %l1, %l2        ! source[1] == targets[0]
        RET_START_0_IS_TARGET_(13)

        ASMEND(vectorfind_next_match_14)


LFUNC(vectorfind_next_match_15)
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2  ! targets[0]
        ld      [%i1 + 4], %l3  ! targets[1]
        ld      [%i1 + 8], %l4  ! targets[2]
        ld      [%i1 + 12], %l5 ! targets[3]
        ld      [%i1 + 16], %l6 ! targets[4]
        ld      [%i1 + 20], %l7 ! targets[5]
        ld      [%i1 + 24], %o0 ! targets[6]
        ld      [%i1 + 28], %o1 ! targets[7]
        ld      [%i1 + 32], %o2 ! targets[8]
        ld      [%i1 + 36], %o3 ! targets[9]
        ld      [%i1 + 40], %o4 ! targets[10]
        ld      [%i1 + 44], %o5 ! targets[11]
        ld      [%i1 + 48], %i2 ! targets[12]
        ld      [%i1 + 52], %i4 ! targets[13]
        ld      [%i1 + 56], %i5 ! targets[14]

        btst    4, %i0
        bnz,a   1f
         ld     [%i0], %l1

        ldd     [%i0], %l0
        ba,a    3f
         nop

1:      dec     4, %i0
        cmp     %l1, %l2        ! source[1] == targets[0]
2:      bne,a   1f
         cmp    %l1, %l3        ! source[1] == targets[1]
        RET_START_1_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l1, %l4        ! source[1] == targets[2]
        RET_START_1_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l1, %l5        ! source[1] == targets[3]
        RET_START_1_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l1, %l6        ! source[1] == targets[4]
        RET_START_1_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l1, %l7        ! source[1] == targets[5]
        RET_START_1_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l1, %o0        ! source[1] == targets[6]
        RET_START_1_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l1, %o1        ! source[1] == targets[7]
        RET_START_1_IS_TARGET_(6)

1:      bne,a   1f
         cmp    %l1, %o2        ! source[1] == targets[8]
        RET_START_1_IS_TARGET_(7)

1:      bne,a   1f
         cmp    %l1, %o3        ! source[1] == targets[9]
        RET_START_1_IS_TARGET_(8)

1:      bne,a   1f
         cmp    %l1, %o4        ! source[1] == targets[10]
        RET_START_1_IS_TARGET_(9)

1:      bne,a   1f
         cmp    %l1, %o5        ! source[1] == targets[11]
        RET_START_1_IS_TARGET_(10)

1:      bne,a   1f
         cmp    %l1, %i2        ! source[1] == targets[12]
        RET_START_1_IS_TARGET_(11)

1:      bne,a   1f
         cmp    %l1, %i4        ! source[1] == targets[13]
        RET_START_1_IS_TARGET_(12)

1:      bne,a   1f
         cmp    %l1, %i5        ! source[1] == targets[14]
        RET_START_1_IS_TARGET_(13)

1:      bne,a   1f
         ldd    [%i0 + 8], %l0
        RET_START_1_IS_TARGET_(14)

1:      inc     8, %i0
3:      cmp     %l0, %l2        ! source[0] == targets[0]
        bne,a   1f
         cmp    %l0, %l3        ! source[0] == targets[1]
        RET_START_0_IS_TARGET_(0)

1:      bne,a   1f
         cmp    %l0, %l4        ! source[0] == targets[2]
        RET_START_0_IS_TARGET_(1)

1:      bne,a   1f
         cmp    %l0, %l5        ! source[0] == targets[3]
        RET_START_0_IS_TARGET_(2)

1:      bne,a   1f
         cmp    %l0, %l6        ! source[0] == targets[4]
        RET_START_0_IS_TARGET_(3)

1:      bne,a   1f
         cmp    %l0, %l7        ! source[0] == targets[5]
        RET_START_0_IS_TARGET_(4)

1:      bne,a   1f
         cmp    %l0, %o0        ! source[0] == targets[6]
        RET_START_0_IS_TARGET_(5)

1:      bne,a   1f
         cmp    %l0, %o1        ! source[0] == targets[7]
        RET_START_0_IS_TARGET_(6)

1:      bne,a   1f
         cmp    %l0, %o2        ! source[0] == targets[8]
        RET_START_0_IS_TARGET_(7)

1:      bne,a   1f
         cmp    %l0, %o3        ! source[0] == targets[9]
        RET_START_0_IS_TARGET_(8)

1:      bne,a   1f
         cmp    %l0, %o4        ! source[0] == targets[10]
        RET_START_0_IS_TARGET_(9)

1:      bne,a   1f
         cmp    %l0, %o5        ! source[0] == targets[11]
        RET_START_0_IS_TARGET_(10)

1:      bne,a   1f
         cmp    %l0, %i2        ! source[0] == targets[12]
        RET_START_0_IS_TARGET_(11)

1:      bne,a   1f
         cmp    %l0, %i4        ! source[0] == targets[13]
        RET_START_0_IS_TARGET_(12)

1:      bne,a   1f
         cmp    %l0, %i5        ! source[0] == targets[14]
        RET_START_0_IS_TARGET_(13)

1:      bne,a   2b
         cmp    %l1, %l2        ! source[1] == targets[0]
        RET_START_0_IS_TARGET_(14)

        ASMEND(vectorfind_next_match_15)
