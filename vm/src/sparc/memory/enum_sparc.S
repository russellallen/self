/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

/*
        this file contains fast search routines
        It attempts to software pipeline to avoid sparc interlocks
        -- dmu
*/

# include "_enum_sparc.S.incl"


# define p      %o0
# define target %o1

/*
    oop* find_prior_reference(oop* middle, oop target) {
        for ( ; *middle != target; --middle) continue;
        return middle;
    }
 */
ASMFUNC(find_prior_reference)
        btst    4, p            ! 8-aligned?
        bnz,a   1f              ! if not
         dec    4, p            !  make it

        ! 8-aligned, must _not_ check p[1]
        ld      [p], %o4
        cmp     %o4, target     ! check p[0]
        bne,a   1f              ! p[0] != target?
         dec    8, p            !  p -= 2; // previous group of 4 pointers
        retl
         nop                    ! found at p[0]

  1:    ! start loop
        ldd     [p], %o4
        cmp     %o5, target     ! check p[1] (NB: original middle if unaligned)

  2:    ! loop in groups of 4 pointers
        bne,a   1f              ! p[1] != target?
         cmp    %o4, target     ! check p[0]
        retl
         inc    4, p            ! found at p[1]

  1:    ldd     [p - 8], %o2;
        bne,a   1f              ! p[0] != target?
         cmp    %o3, target     ! check p[-1]
        retl
         inc    0, p            ! found at p[0]

  1:    bne,a   1f              ! p[-1] != target?
         dec    16, p           !  p -= 4; // previous group of 4 pointers
        retl
         inc    -4, p           ! found at p[-1]

  1:    ldd     [p], %o4        ! NB: new p
        cmp     %o2, target     ! check (old) p[-2]
        bne,a   2b              ! p[-2] != target?
         cmp    %o5, target     !  check (new) p[1]
        retl                    ! found at p[-2]
         inc    8, p            !  +8 not -8 cause p already decremented

        ASMEND(find_prior_reference)



/*
    oop* find_this_object(oop* middle) {
        for ( ; !(*middle)->is_mark(); --middle) continue;
        return middle;
    }
 */
ASMFUNC(find_this_object)
        btst    4, p                    ! 8-aligned?
        bnz,a   1f                      ! if not
         dec    4, p                    !  make it

        ! 8-aligned, must _not_ check p[1]
        ld      [p], %o4
        and     %o4, Tag_Mask, %o1      ! check p[0]
        cmp     %o1, Mark_Tag
        bne,a   1f                      ! not p[0]->is_mark()?
         dec    8, p                    !  p -= 2; // previous group of 4
        retl
         nop                            ! found at p[0]

  1:    ! start loop
        ldd     [p],  %o4
        and     %o5, Tag_Mask, %o1      ! check p[1]  (NB: original middle)

  2:    ! loop in groups of 4 pointers
        cmp     %o1, Mark_Tag
        bne,a   1f                      ! not p[1]->is_mark()?
         and    %o4, Tag_Mask, %o1      ! check p[0]
        retl
         inc    4, p                    ! found at p[1]

  1:    cmp     %o1, Mark_Tag
        ldd     [p - 8], %o2
        bne,a   1f                      ! not p[0]->is_mark()?
         and    %o3, Tag_Mask, %o1      !  check p[-1]
        retl
         inc    0, p                    ! found at p[0]

  1:    cmp     %o1, Mark_Tag
        bne,a   1f                      ! not p[-1]->is_mark()?
         dec    16, p                   !  p -= 4; // previous groups of 4
        retl
         inc    -4, p                   ! found at p[-1]

  1:    ldd     [p], %o4                ! NB: new p
        and     %o2, Tag_Mask, %o1      ! check (old) p[-2]
        cmp     %o1, Mark_Tag
        bne,a   2b                      ! not p[-2]->is_mark()?
         and    %o5, Tag_Mask, %o1      !  check (new) p[1]
        retl                            ! found at p[-2]
         inc    8, p                    !  +8 not -8 cause p already decremented

        ASMEND(find_this_object)



/*
    oop* find_next_object(oop* middle) {
        for ( ++middle; !(*middle)->is_mark(); ++middle) continue;
        return middle;
    }
 */
ASMFUNC(find_next_object)
        inc     4, p            ! Find next object ++p
        btst    4, p            ! 8-aligned?
        bz,a    1f              ! go to the unrolled loop
         nop

        ! not 8-aligned
        ld      [p], %o4
        and     %o4, Tag_Mask, %o1      ! check p[0]
        cmp     %o1, Mark_Tag
        bne,a   1f                      ! not p[0]->is_mark()?
         inc    4, p                    !  ++p; // next group of 4
        retl
         nop                            ! found at p[0]

  1:    ! start loop
        ldd     [p],  %o4
        and     %o4, Tag_Mask, %o1      ! check p[0]

  2:    ! loop in groups of 4 pointers
        cmp     %o1, Mark_Tag
        bne,a   1f                      ! not p[0]->is_mark()?
         and    %o5, Tag_Mask, %o1      !  check p[1]
        retl
         nop                            ! found at p[0]

  1:    cmp     %o1, Mark_Tag
        ldd     [p + 8], %o2
        bne,a   1f                      ! not p[1]->is_mark()?
         and    %o2, Tag_Mask, %o1      !  check p[2]
        retl
         inc    4, p                    ! found at p[1]

  1:    cmp     %o1, Mark_Tag
        bne,a   1f                      ! not p[2]->is_mark()?
         inc    16, p                   !  p += 4; // next group of 4
        retl
         inc    8, p                    ! found at p[2]

  1:    ldd     [p], %o4                ! NB: new p
        and     %o3, Tag_Mask, %o1      ! check (old) p[3]
        cmp     %o1, Mark_Tag
        bne,a   2b                      ! not p[3]->is_mark()?
         and    %o4, Tag_Mask, %o1      !  check (new) p[0]
        retl                            ! found at p[3]
         dec    4, p                    !  -4 not +12 cause p already incremented

        ASMEND(find_next_object)
