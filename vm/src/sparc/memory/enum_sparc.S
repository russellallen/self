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
