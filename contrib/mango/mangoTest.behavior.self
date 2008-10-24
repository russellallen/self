"Sun-$Revision: 1.1.1.1 $"

"Copyright 1992-9 Sun Microsystems, Inc. and Stanford University.
 See the LICENSE file for license information."
 
( |
  "_" parent* = traits oddball.

  "^" exp = ( | 
      "^" eval = ( | s. |
          s: elements first eval.
          separators do: [|:sep. :idx| 
              s: (sep performOpOn: s And: (elements at: 1 + idx) eval).
          ].
          s.
        ).
    | ).

  "^" term = ( | 
      "^" eval = ( | s. |
          s: elements first eval.
          separators do: [|:sep. :idx| 
              s: (sep performOpOn: s And: (elements at: 1 + idx) eval).
          ].
          s.
        ).
    | ).

  "^" parenthesized = ( | "^" eval = ( exp eval. ). | ).
  "^" number        = ( | "^" eval = ( token source eval. ). | ).
  "^" plus_         = ( | performOpOn: x And: y = ( x + y. ). | ).
  "^" minus_        = ( | performOpOn: x And: y = ( x - y. ). | ).
  "^" star_         = ( | performOpOn: x And: y = ( x * y. ). | ).
  "^" slash_        = ( | performOpOn: x And: y = ( x / y. ). | ).
| )
