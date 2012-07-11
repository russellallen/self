/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

/*
        this file contains fast search routines
        It attempts to software pipeline to avoid sparc interlocks and
        also assumes it can use g2 and g3.
        -- dmu
*/

#include "_enum_sparc.S.incl"


.globl _find_prior_reference, _find_this_object, _find_next_object

/*
  oop* find_prior_reference(oop* p, oop target); 
  oop* find_this_object(oop* p);
  oop* find_next_object(oop* p);
*/

# define p              %o0
# define target         %o1

_find_prior_reference:
        btst    4, p
        bnz,a   1f;     sub     p, 4, p
        ld      [p], %o4
        cmp     %o4, target
        bne,a   1f;     sub     p, 8, p
        retl;                   nop

  1:                            ! start loop
        ldd     [p],  %o4
        cmp     %o5, target
  2:                            ! loop
        bne,a   1f;             cmp     %o4, target
        retl;                   add     p, 4, p

  1:    ldd     [p - 8], %o2;
        bne,a   1f;             cmp     %o3, target
        retl;                   add     p, 0, p

  1:    bne,a   1f;             sub     p, 16, p
        retl;                   add     p, -4, p

  1:    ldd     [p], %o4
        cmp     %o2, target
        bne,a   2b;             cmp %o5, target
        retl;                   add     p, 8, p
                                ! + 8 not -8 cause p already decremented

_find_this_object:
        btst    4, p
        bnz,a   1f;     sub     p, 4, p
        ld      [p], %o4
        and     %o4, Tag_Mask, %o1
        cmp     %o1, Mark_Tag
        bne,a   1f;     sub     p, 8, p
        retl;                   nop

  1:                            ! start loop
        ldd     [p],  %o4
        and     %o5, Tag_Mask, %o1
  2:                            ! loop
        cmp     %o1, Mark_Tag
        bne,a   1f;             and     %o4, Tag_Mask, %o1
        retl;                   add     p, 4, p

  1:    cmp     %o1, Mark_Tag
        ldd     [p - 8], %o2
        bne,a   1f;             and     %o3, Tag_Mask, %o1
        retl;                   add     p, 0, p

  1:    cmp     %o1, Mark_Tag
        bne,a   1f;             sub     p, 16, p
        retl;                   add     p, -4, p

  1:    ldd     [p], %o4
        and     %o2, Tag_Mask, %o1
        cmp     %o1, Mark_Tag
        bne,a   2b;             and %o5, Tag_Mask, %o1
        retl;                   add     p, 8, p
                                ! + 8 not -8 cause p already decremented

_find_next_object:
        add     p,4,p           ! Find next object ++p
        btst    4, p
        be,a    1f;     nop
        ld      [p], %o4
        and     %o4, Tag_Mask, %o1
        cmp     %o1, Mark_Tag
        bne,a   1f;     add     p, 4, p
        retl;                   nop

  1:                            ! start loop double word aligned.
        ldd     [p],  %o4
        and     %o4, Tag_Mask, %o1
  2:                            ! loop
        cmp     %o1, Mark_Tag
        bne,a   1f;             and     %o5, Tag_Mask, %o1
        retl;                   nop

  1:    cmp     %o1, Mark_Tag
        ldd     [p + 8], %o2
        bne,a   1f;             and     %o2, Tag_Mask, %o1
        retl;                   add     p, 4, p

  1:    cmp     %o1, Mark_Tag
        bne,a   1f;             add     p, 16, p
        retl;                   add     p, 8, p

  1:    ldd     [p], %o4
        and     %o3, Tag_Mask, %o1
        cmp     %o1, Mark_Tag
        bne,a   2b;             and %o4, Tag_Mask, %o1
        retl;                   sub     p, 4, p
                                ! - 4 not + 12 cause p already incremented


       .globl   _Vectorfind_max_targets
_Vectorfind_max_targets:        .word   15


        .globl  _Vectorfind_max_chunk_size
_Vectorfind_max_chunk_size:     .word   8192


        .globl  _vectorfind_next_match
_vectorfind_next_match:
        cmp     %o2,0
        bg,a    1f;             cmp     %o2,15
        retl;                   mov     -1,%o0
1:      ble,a   1f;             sll     %o2, 2, %o2
        retl;                   mov     -1,%o0
1:      set     _vectorfind_next_match_table, %o4
        add     %o2, %o4, %o2
        ld      [%o2-4],%o2
        jmp     %o2;            ;nop

_vectorfind_next_match_table:
        .word   _vectorfind_next_match_1
        .word   _vectorfind_next_match_2
        .word   _vectorfind_next_match_3
        .word   _vectorfind_next_match_4
        .word   _vectorfind_next_match_5
        .word   _vectorfind_next_match_6
        .word   _vectorfind_next_match_7
        .word   _vectorfind_next_match_8
        .word   _vectorfind_next_match_9
        .word   _vectorfind_next_match_10
        .word   _vectorfind_next_match_11
        .word   _vectorfind_next_match_12
        .word   _vectorfind_next_match_13
        .word   _vectorfind_next_match_14
        .word   _vectorfind_next_match_15

_vectorfind_next_match_1:
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2
        btst    4, %i0
        bne,a   1f;             ld      [%i0], %l1
        ldd     [%i0], %l0
        ba,a    3f;             nop
1:      sub     %i0, 4, %i0
        cmp     %l1, %l2
2:      bne,a   1f;             ldd     [%i0+8], %l0
        add     %i0, 4, %i0
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      add     %i0, 8, %i0
3:      cmp     %l0, %l2
1:      bne,a   2b;             cmp     %l1, %l2
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore

_vectorfind_next_match_2:
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2
        ld      [%i1 + 4], %l3
        btst    4, %i0
        bne,a   1f;             ld      [%i0], %l1
        ldd     [%i0], %l0
        ba,a    3f;             nop
1:      sub     %i0, 4, %i0
        cmp     %l1, %l2
2:      bne,a   1f;             cmp     %l1, %l3
        add     %i0, 4, %i0
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             ldd     [%i0+8], %l0
        add     %i0, 4, %i0
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      add     %i0, 8, %i0
3:      cmp     %l0, %l2
        bne,a   1f;             cmp     %l0, %l3
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   2b;             cmp     %l1, %l2
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore

_vectorfind_next_match_3:
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2
        ld      [%i1 + 4], %l3
        ld      [%i1 + 8], %l4
        btst    4, %i0
        bne,a   1f;             ld      [%i0], %l1
        ldd     [%i0], %l0
        ba,a    3f;             nop
1:      sub     %i0, 4, %i0
        cmp     %l1, %l2
2:      bne,a   1f;             cmp     %l1, %l3
        add     %i0, 4, %i0
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l4
        add     %i0, 4, %i0
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             ldd     [%i0+8], %l0
        add     %i0, 4, %i0
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      add     %i0, 8, %i0
3:      cmp     %l0, %l2
        bne,a   1f;             cmp     %l0, %l3
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l4
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   2b;             cmp     %l1, %l2
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore

_vectorfind_next_match_4:
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2
        ld      [%i1 + 4], %l3
        ld      [%i1 + 8], %l4
        ld      [%i1 + 12], %l5
        btst    4, %i0
        bne,a   1f;             ld      [%i0], %l1
        ldd     [%i0], %l0
        ba,a    3f;             nop
1:      sub     %i0, 4, %i0
        cmp     %l1, %l2
2:      bne,a   1f;             cmp     %l1, %l3
        add     %i0, 4, %i0
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l4
        add     %i0, 4, %i0
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l5
        add     %i0, 4, %i0
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             ldd     [%i0+8], %l0
        add     %i0, 4, %i0
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      add     %i0, 8, %i0
3:      cmp     %l0, %l2
        bne,a   1f;             cmp     %l0, %l3
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l4
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l5
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   2b;             cmp     %l1, %l2
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore

_vectorfind_next_match_5:
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2
        ld      [%i1 + 4], %l3
        ld      [%i1 + 8], %l4
        ld      [%i1 + 12], %l5
        ld      [%i1 + 16], %l6
        btst    4, %i0
        bne,a   1f;             ld      [%i0], %l1
        ldd     [%i0], %l0
        ba,a    3f;             nop
1:      sub     %i0, 4, %i0
        cmp     %l1, %l2
2:      bne,a   1f;             cmp     %l1, %l3
        add     %i0, 4, %i0
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l4
        add     %i0, 4, %i0
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l5
        add     %i0, 4, %i0
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l6
        add     %i0, 4, %i0
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             ldd     [%i0+8], %l0
        add     %i0, 4, %i0
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      add     %i0, 8, %i0
3:      cmp     %l0, %l2
        bne,a   1f;             cmp     %l0, %l3
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l4
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l5
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l6
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   2b;             cmp     %l1, %l2
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore

_vectorfind_next_match_6:
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2
        ld      [%i1 + 4], %l3
        ld      [%i1 + 8], %l4
        ld      [%i1 + 12], %l5
        ld      [%i1 + 16], %l6
        ld      [%i1 + 20], %l7
        btst    4, %i0
        bne,a   1f;             ld      [%i0], %l1
        ldd     [%i0], %l0
        ba,a    3f;             nop
1:      sub     %i0, 4, %i0
        cmp     %l1, %l2
2:      bne,a   1f;             cmp     %l1, %l3
        add     %i0, 4, %i0
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l4
        add     %i0, 4, %i0
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l5
        add     %i0, 4, %i0
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l6
        add     %i0, 4, %i0
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l7
        add     %i0, 4, %i0
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             ldd     [%i0+8], %l0
        add     %i0, 4, %i0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      add     %i0, 8, %i0
3:      cmp     %l0, %l2
        bne,a   1f;             cmp     %l0, %l3
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l4
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l5
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l6
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l7
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   2b;             cmp     %l1, %l2
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore

_vectorfind_next_match_7:
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2
        ld      [%i1 + 4], %l3
        ld      [%i1 + 8], %l4
        ld      [%i1 + 12], %l5
        ld      [%i1 + 16], %l6
        ld      [%i1 + 20], %l7
        ld      [%i1 + 24], %o0
        btst    4, %i0
        bne,a   1f;             ld      [%i0], %l1
        ldd     [%i0], %l0
        ba,a    3f;             nop
1:      sub     %i0, 4, %i0
        cmp     %l1, %l2
2:      bne,a   1f;             cmp     %l1, %l3
        add     %i0, 4, %i0
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l4
        add     %i0, 4, %i0
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l5
        add     %i0, 4, %i0
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l6
        add     %i0, 4, %i0
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l7
        add     %i0, 4, %i0
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o0
        add     %i0, 4, %i0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             ldd     [%i0+8], %l0
        add     %i0, 4, %i0
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      add     %i0, 8, %i0
3:      cmp     %l0, %l2
        bne,a   1f;             cmp     %l0, %l3
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l4
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l5
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l6
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l7
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   2b;             cmp     %l1, %l2
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore

_vectorfind_next_match_8:
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2
        ld      [%i1 + 4], %l3
        ld      [%i1 + 8], %l4
        ld      [%i1 + 12], %l5
        ld      [%i1 + 16], %l6
        ld      [%i1 + 20], %l7
        ld      [%i1 + 24], %o0
        ld      [%i1 + 28], %o1
        btst    4, %i0
        bne,a   1f;             ld      [%i0], %l1
        ldd     [%i0], %l0
        ba,a    3f;             nop
1:      sub     %i0, 4, %i0
        cmp     %l1, %l2
2:      bne,a   1f;             cmp     %l1, %l3
        add     %i0, 4, %i0
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l4
        add     %i0, 4, %i0
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l5
        add     %i0, 4, %i0
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l6
        add     %i0, 4, %i0
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l7
        add     %i0, 4, %i0
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o0
        add     %i0, 4, %i0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o1
        add     %i0, 4, %i0
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             ldd     [%i0+8], %l0
        add     %i0, 4, %i0
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      add     %i0, 8, %i0
3:      cmp     %l0, %l2
        bne,a   1f;             cmp     %l0, %l3
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l4
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l5
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l6
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l7
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o1
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   2b;             cmp     %l1, %l2
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore

_vectorfind_next_match_9:
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2
        ld      [%i1 + 4], %l3
        ld      [%i1 + 8], %l4
        ld      [%i1 + 12], %l5
        ld      [%i1 + 16], %l6
        ld      [%i1 + 20], %l7
        ld      [%i1 + 24], %o0
        ld      [%i1 + 28], %o1
        ld      [%i1 + 32], %o2
        btst    4, %i0
        bne,a   1f;             ld      [%i0], %l1
        ldd     [%i0], %l0
        ba,a    3f;             nop
1:      sub     %i0, 4, %i0
        cmp     %l1, %l2
2:      bne,a   1f;             cmp     %l1, %l3
        add     %i0, 4, %i0
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l4
        add     %i0, 4, %i0
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l5
        add     %i0, 4, %i0
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l6
        add     %i0, 4, %i0
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l7
        add     %i0, 4, %i0
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o0
        add     %i0, 4, %i0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o1
        add     %i0, 4, %i0
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o2
        add     %i0, 4, %i0
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             ldd     [%i0+8], %l0
        add     %i0, 4, %i0
        mov     8, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      add     %i0, 8, %i0
3:      cmp     %l0, %l2
        bne,a   1f;             cmp     %l0, %l3
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l4
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l5
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l6
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l7
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o1
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o2
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   2b;             cmp     %l1, %l2
        mov     8, %l0
        st      %l0, [%i3]
        ret;                    restore

_vectorfind_next_match_10:
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2
        ld      [%i1 + 4], %l3
        ld      [%i1 + 8], %l4
        ld      [%i1 + 12], %l5
        ld      [%i1 + 16], %l6
        ld      [%i1 + 20], %l7
        ld      [%i1 + 24], %o0
        ld      [%i1 + 28], %o1
        ld      [%i1 + 32], %o2
        ld      [%i1 + 36], %o3
        btst    4, %i0
        bne,a   1f;             ld      [%i0], %l1
        ldd     [%i0], %l0
        ba,a    3f;             nop
1:      sub     %i0, 4, %i0
        cmp     %l1, %l2
2:      bne,a   1f;             cmp     %l1, %l3
        add     %i0, 4, %i0
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l4
        add     %i0, 4, %i0
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l5
        add     %i0, 4, %i0
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l6
        add     %i0, 4, %i0
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l7
        add     %i0, 4, %i0
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o0
        add     %i0, 4, %i0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o1
        add     %i0, 4, %i0
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o2
        add     %i0, 4, %i0
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o3
        add     %i0, 4, %i0
        mov     8, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             ldd     [%i0+8], %l0
        add     %i0, 4, %i0
        mov     9, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      add     %i0, 8, %i0
3:      cmp     %l0, %l2
        bne,a   1f;             cmp     %l0, %l3
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l4
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l5
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l6
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l7
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o1
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o2
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o3
        mov     8, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   2b;             cmp     %l1, %l2
        mov     9, %l0
        st      %l0, [%i3]
        ret;                    restore

_vectorfind_next_match_11:
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2
        ld      [%i1 + 4], %l3
        ld      [%i1 + 8], %l4
        ld      [%i1 + 12], %l5
        ld      [%i1 + 16], %l6
        ld      [%i1 + 20], %l7
        ld      [%i1 + 24], %o0
        ld      [%i1 + 28], %o1
        ld      [%i1 + 32], %o2
        ld      [%i1 + 36], %o3
        ld      [%i1 + 40], %o4
        btst    4, %i0
        bne,a   1f;             ld      [%i0], %l1
        ldd     [%i0], %l0
        ba,a    3f;             nop
1:      sub     %i0, 4, %i0
        cmp     %l1, %l2
2:      bne,a   1f;             cmp     %l1, %l3
        add     %i0, 4, %i0
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l4
        add     %i0, 4, %i0
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l5
        add     %i0, 4, %i0
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l6
        add     %i0, 4, %i0
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l7
        add     %i0, 4, %i0
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o0
        add     %i0, 4, %i0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o1
        add     %i0, 4, %i0
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o2
        add     %i0, 4, %i0
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o3
        add     %i0, 4, %i0
        mov     8, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o4
        add     %i0, 4, %i0
        mov     9, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             ldd     [%i0+8], %l0
        add     %i0, 4, %i0
        mov     10, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      add     %i0, 8, %i0
3:      cmp     %l0, %l2
        bne,a   1f;             cmp     %l0, %l3
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l4
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l5
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l6
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l7
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o1
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o2
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o3
        mov     8, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o4
        mov     9, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   2b;             cmp     %l1, %l2
        mov     10, %l0
        st      %l0, [%i3]
        ret;                    restore

_vectorfind_next_match_12:
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2
        ld      [%i1 + 4], %l3
        ld      [%i1 + 8], %l4
        ld      [%i1 + 12], %l5
        ld      [%i1 + 16], %l6
        ld      [%i1 + 20], %l7
        ld      [%i1 + 24], %o0
        ld      [%i1 + 28], %o1
        ld      [%i1 + 32], %o2
        ld      [%i1 + 36], %o3
        ld      [%i1 + 40], %o4
        ld      [%i1 + 44], %o5
        btst    4, %i0
        bne,a   1f;             ld      [%i0], %l1
        ldd     [%i0], %l0
        ba,a    3f;             nop
1:      sub     %i0, 4, %i0
        cmp     %l1, %l2
2:      bne,a   1f;             cmp     %l1, %l3
        add     %i0, 4, %i0
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l4
        add     %i0, 4, %i0
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l5
        add     %i0, 4, %i0
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l6
        add     %i0, 4, %i0
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l7
        add     %i0, 4, %i0
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o0
        add     %i0, 4, %i0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o1
        add     %i0, 4, %i0
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o2
        add     %i0, 4, %i0
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o3
        add     %i0, 4, %i0
        mov     8, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o4
        add     %i0, 4, %i0
        mov     9, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o5
        add     %i0, 4, %i0
        mov     10, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             ldd     [%i0+8], %l0
        add     %i0, 4, %i0
        mov     11, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      add     %i0, 8, %i0
3:      cmp     %l0, %l2
        bne,a   1f;             cmp     %l0, %l3
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l4
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l5
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l6
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l7
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o1
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o2
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o3
        mov     8, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o4
        mov     9, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o5
        mov     10, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   2b;             cmp     %l1, %l2
        mov     11, %l0
        st      %l0, [%i3]
        ret;                    restore

_vectorfind_next_match_13:
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2
        ld      [%i1 + 4], %l3
        ld      [%i1 + 8], %l4
        ld      [%i1 + 12], %l5
        ld      [%i1 + 16], %l6
        ld      [%i1 + 20], %l7
        ld      [%i1 + 24], %o0
        ld      [%i1 + 28], %o1
        ld      [%i1 + 32], %o2
        ld      [%i1 + 36], %o3
        ld      [%i1 + 40], %o4
        ld      [%i1 + 44], %o5
        ld      [%i1 + 48], %i2
        btst    4, %i0
        bne,a   1f;             ld      [%i0], %l1
        ldd     [%i0], %l0
        ba,a    3f;             nop
1:      sub     %i0, 4, %i0
        cmp     %l1, %l2
2:      bne,a   1f;             cmp     %l1, %l3
        add     %i0, 4, %i0
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l4
        add     %i0, 4, %i0
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l5
        add     %i0, 4, %i0
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l6
        add     %i0, 4, %i0
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l7
        add     %i0, 4, %i0
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o0
        add     %i0, 4, %i0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o1
        add     %i0, 4, %i0
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o2
        add     %i0, 4, %i0
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o3
        add     %i0, 4, %i0
        mov     8, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o4
        add     %i0, 4, %i0
        mov     9, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o5
        add     %i0, 4, %i0
        mov     10, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %i2
        add     %i0, 4, %i0
        mov     11, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             ldd     [%i0+8], %l0
        add     %i0, 4, %i0
        mov     12, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      add     %i0, 8, %i0
3:      cmp     %l0, %l2
        bne,a   1f;             cmp     %l0, %l3
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l4
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l5
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l6
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l7
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o1
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o2
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o3
        mov     8, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o4
        mov     9, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o5
        mov     10, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %i2
        mov     11, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   2b;             cmp     %l1, %l2
        mov     12, %l0
        st      %l0, [%i3]
        ret;                    restore

_vectorfind_next_match_14:
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2
        ld      [%i1 + 4], %l3
        ld      [%i1 + 8], %l4
        ld      [%i1 + 12], %l5
        ld      [%i1 + 16], %l6
        ld      [%i1 + 20], %l7
        ld      [%i1 + 24], %o0
        ld      [%i1 + 28], %o1
        ld      [%i1 + 32], %o2
        ld      [%i1 + 36], %o3
        ld      [%i1 + 40], %o4
        ld      [%i1 + 44], %o5
        ld      [%i1 + 48], %i2
        ld      [%i1 + 52], %i4
        btst    4, %i0
        bne,a   1f;             ld      [%i0], %l1
        ldd     [%i0], %l0
        ba,a    3f;             nop
1:      sub     %i0, 4, %i0
        cmp     %l1, %l2
2:      bne,a   1f;             cmp     %l1, %l3
        add     %i0, 4, %i0
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l4
        add     %i0, 4, %i0
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l5
        add     %i0, 4, %i0
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l6
        add     %i0, 4, %i0
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l7
        add     %i0, 4, %i0
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o0
        add     %i0, 4, %i0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o1
        add     %i0, 4, %i0
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o2
        add     %i0, 4, %i0
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o3
        add     %i0, 4, %i0
        mov     8, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o4
        add     %i0, 4, %i0
        mov     9, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o5
        add     %i0, 4, %i0
        mov     10, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %i2
        add     %i0, 4, %i0
        mov     11, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %i4
        add     %i0, 4, %i0
        mov     12, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             ldd     [%i0+8], %l0
        add     %i0, 4, %i0
        mov     13, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      add     %i0, 8, %i0
3:      cmp     %l0, %l2
        bne,a   1f;             cmp     %l0, %l3
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l4
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l5
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l6
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l7
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o1
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o2
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o3
        mov     8, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o4
        mov     9, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o5
        mov     10, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %i2
        mov     11, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %i4
        mov     12, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   2b;             cmp     %l1, %l2
        mov     13, %l0
        st      %l0, [%i3]
        ret;                    restore

_vectorfind_next_match_15:
        save    %sp, -112, %sp
        ld      [%i1 + 0], %l2
        ld      [%i1 + 4], %l3
        ld      [%i1 + 8], %l4
        ld      [%i1 + 12], %l5
        ld      [%i1 + 16], %l6
        ld      [%i1 + 20], %l7
        ld      [%i1 + 24], %o0
        ld      [%i1 + 28], %o1
        ld      [%i1 + 32], %o2
        ld      [%i1 + 36], %o3
        ld      [%i1 + 40], %o4
        ld      [%i1 + 44], %o5
        ld      [%i1 + 48], %i2
        ld      [%i1 + 52], %i4
        ld      [%i1 + 56], %i5
        btst    4, %i0
        bne,a   1f;             ld      [%i0], %l1
        ldd     [%i0], %l0
        ba,a    3f;             nop
1:      sub     %i0, 4, %i0
        cmp     %l1, %l2
2:      bne,a   1f;             cmp     %l1, %l3
        add     %i0, 4, %i0
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l4
        add     %i0, 4, %i0
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l5
        add     %i0, 4, %i0
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l6
        add     %i0, 4, %i0
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %l7
        add     %i0, 4, %i0
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o0
        add     %i0, 4, %i0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o1
        add     %i0, 4, %i0
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o2
        add     %i0, 4, %i0
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o3
        add     %i0, 4, %i0
        mov     8, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o4
        add     %i0, 4, %i0
        mov     9, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %o5
        add     %i0, 4, %i0
        mov     10, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %i2
        add     %i0, 4, %i0
        mov     11, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %i4
        add     %i0, 4, %i0
        mov     12, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l1, %i5
        add     %i0, 4, %i0
        mov     13, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             ldd     [%i0+8], %l0
        add     %i0, 4, %i0
        mov     14, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      add     %i0, 8, %i0
3:      cmp     %l0, %l2
        bne,a   1f;             cmp     %l0, %l3
        mov     0, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l4
        mov     1, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l5
        mov     2, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l6
        mov     3, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %l7
        mov     4, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o0
        mov     5, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o1
        mov     6, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o2
        mov     7, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o3
        mov     8, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o4
        mov     9, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %o5
        mov     10, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %i2
        mov     11, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %i4
        mov     12, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   1f;             cmp     %l0, %i5
        mov     13, %l0
        st      %l0, [%i3]
        ret;                    restore
1:      bne,a   2b;             cmp     %l1, %l2
        mov     14, %l0
        st      %l0, [%i3]
        ret;                    restore

