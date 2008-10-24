"$Revision: 1.2 $"
[ | root |
root: carpetMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & morph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & morph copyRemoveAllMorphs & morph copyRemoveAllMorphs & morph copyRemoveAllMorphs & lineMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs ) asList.
[
( root rawMorphs at: 2 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 2) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

] value.

] value.

] value.

] value.

] value.

[
( root rawMorphs at: 5 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 5) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & lineMorph copyRemoveAllMorphs ) asList.
] value.

] value.

] value.

] value.

[
( root rawMorphs at: 6 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 7 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 7) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & lineMorph copyRemoveAllMorphs ) asList.
[
( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

] value.

] value.

] value.

] value.

[
( root rawMorphs at: 9 )addMorph: rowMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 9) rawMorphs at: 0 ) addAllMorphs: ( frameMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs ) asList.
] value.

] value.

] value.

"end of skeleton"

[
" State for: a carpetMorph(type: carpetMorph): "

( root ) borderWidth: 2.
( root ) dragPoint: (1023)@(43).
( root ) hResizing: 0.
( root ) handToFollow: nil.
( root ) inResizeMode: false.
( root ) isPersistent: false.
( root ) rawBox: ((1023)@(43)) # ((1756)@(522)).
( root ) rawColor: paint named: 'black'.
( root ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [(Mac: option-click)]): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) myAscent: 11.
( root rawMorphs at: 0 ) myBox: ((213)@(230)) # ((328)@(244)).
( root rawMorphs at: 0 ) myDescent: 3.
( root rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold' copyMutable.
( root rawMorphs at: 0 ) myLabel: '(Mac: option-click)' copyMutable.
( root rawMorphs at: 0 ) myPosition: (213)@(241).
( root rawMorphs at: 0 ) myWidth: 115.
( root rawMorphs at: 0 ) rawColor: paint named: 'black'.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [(Mac: command-click)]): "

( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) myAscent: 11.
( root rawMorphs at: 1 ) myBox: ((497)@(405)) # ((633)@(419)).
( root rawMorphs at: 1 ) myDescent: 3.
( root rawMorphs at: 1 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold' copyMutable.
( root rawMorphs at: 1 ) myLabel: '(Mac: command-click)' copyMutable.
( root rawMorphs at: 1 ) myPosition: (497)@(416).
( root rawMorphs at: 1 ) myWidth: 136.
( root rawMorphs at: 1 ) rawColor: paint named: 'black'.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

[
" State for: a morph(type: morph): "

( root rawMorphs at: 2 ) hResizing: 0.
( root rawMorphs at: 2 ) rawBox: ((176)@(79)) # ((323)@(102)).
( root rawMorphs at: 2 ) rawColor: paint copyRed: 0.57087 Green: 0.836755  Blue: 0.822092.
( root rawMorphs at: 2 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [(Mac: plain mouse click)\n]): "

( root rawMorphs at: 3 ) hResizing: 0.
( root rawMorphs at: 3 ) myAscent: 11.
( root rawMorphs at: 3 ) myBox: ((103)@(359)) # ((262)@(373)).
( root rawMorphs at: 3 ) myDescent: 3.
( root rawMorphs at: 3 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold' copyMutable.
( root rawMorphs at: 3 ) myLabel: '(Mac: plain mouse click)
' copyMutable.
( root rawMorphs at: 3 ) myPosition: (103)@(370).
( root rawMorphs at: 3 ) myWidth: 159.
( root rawMorphs at: 3 ) rawColor: paint named: 'black'.
( root rawMorphs at: 3 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [   and select text.]): "

( root rawMorphs at: 4 ) hResizing: 0.
( root rawMorphs at: 4 ) myAscent: 11.
( root rawMorphs at: 4 ) myBox: ((92)@(339)) # ((193)@(353)).
( root rawMorphs at: 4 ) myDescent: 3.
( root rawMorphs at: 4 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold' copyMutable.
( root rawMorphs at: 4 ) myLabel: '   and select text.' copyMutable.
( root rawMorphs at: 4 ) myPosition: (92)@(350).
( root rawMorphs at: 4 ) myWidth: 101.
( root rawMorphs at: 4 ) rawColor: paint named: 'black'.
( root rawMorphs at: 4 ) vResizing: 0.
] value.

[
" State for: a morph(type: morph): "

( root rawMorphs at: 5 ) hResizing: 0.
( root rawMorphs at: 5 ) rawBox: ((86)@(277)) # ((208)@(301)).
( root rawMorphs at: 5 ) rawColor: paint copyRed: 0.952102 Green: 0.620723  Blue: 0.776149.
( root rawMorphs at: 5 ) vResizing: 0.
] value.

[
" State for: a morph(type: morph): "

( root rawMorphs at: 6 ) hResizing: 0.
( root rawMorphs at: 6 ) rawBox: ((30)@(5)) # ((331)@(59)).
( root rawMorphs at: 6 ) rawColor: paint copyRed: 0.768328 Green: 0.692082  Blue: 0.855327.
( root rawMorphs at: 6 ) vResizing: 0.
] value.

[
" State for: a morph(type: morph): "

( root rawMorphs at: 7 ) hResizing: 0.
( root rawMorphs at: 7 ) rawBox: ((476)@(284)) # ((608)@(309)).
( root rawMorphs at: 7 ) rawColor: paint copyRed: 0.865103 Green: 0.72434  Blue: 0.682307.
( root rawMorphs at: 7 ) vResizing: 0.
] value.

[
" State for: a lineMorph(type: lineMorph (351@254->372@337)): "

( root rawMorphs at: 8 ) hResizing: 0.
( root rawMorphs at: 8 ) p1: (351)@(254).
( root rawMorphs at: 8 ) p2: (372)@(337).
( root rawMorphs at: 8 ) rawColor: paint named: 'black'.
( root rawMorphs at: 8 ) vResizing: 0.
( root rawMorphs at: 8 ) width: 1.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 9 ) baseMinHeight: 10.
( root rawMorphs at: 9 ) baseMinWidth: 10.
( root rawMorphs at: 9 ) borderWidth: 8.
( root rawMorphs at: 9 ) filled: false.
( root rawMorphs at: 9 ) frameStyle: 0.
( root rawMorphs at: 9 ) hResizing: 0.
( root rawMorphs at: 9 ) justification: 0.
( root rawMorphs at: 9 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 9 ) rawBox: ((324)@(314)) # ((428)@(448)).
( root rawMorphs at: 9 ) rawColor: paint copyRed: 0.788856 Green: 0.769306  Blue: 0.72043.
( root rawMorphs at: 9 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Middle mouse button: used to \n]): "

( (root rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 2) rawMorphs at: 0 ) myAscent: 11.
( (root rawMorphs at: 2) rawMorphs at: 0 ) myBox: ((10)@(5)) # ((205)@(19)).
( (root rawMorphs at: 2) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 2) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (root rawMorphs at: 2) rawMorphs at: 0 ) myLabel: 'Middle mouse button: used to 
' copyMutable.
( (root rawMorphs at: 2) rawMorphs at: 0 ) myPosition: (10)@(16).
( (root rawMorphs at: 2) rawMorphs at: 0 ) myWidth: 195.
( (root rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( (root rawMorphs at: 5) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 5) rawMorphs at: 0 ) myAscent: 11.
( (root rawMorphs at: 5) rawMorphs at: 0 ) myBox: ((6)@(-11)) # ((6)@(3)).
( (root rawMorphs at: 5) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 5) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (root rawMorphs at: 5) rawMorphs at: 0 ) myLabel: mutableString.
( (root rawMorphs at: 5) rawMorphs at: 0 ) myPosition: (6)@(0).
( (root rawMorphs at: 5) rawMorphs at: 0 ) myWidth: 0.
( (root rawMorphs at: 5) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 5) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Mouse button usage]): "

( (root rawMorphs at: 6) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 6) rawMorphs at: 0 ) myAscent: 24.
( (root rawMorphs at: 6) rawMorphs at: 0 ) myBox: ((10)@(12)) # ((284)@(44)).
( (root rawMorphs at: 6) rawMorphs at: 0 ) myDescent: 8.
( (root rawMorphs at: 6) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 32 Style: 'bold'.
( (root rawMorphs at: 6) rawMorphs at: 0 ) myLabel: 'Mouse button usage' copyMutable.
( (root rawMorphs at: 6) rawMorphs at: 0 ) myPosition: (10)@(36).
( (root rawMorphs at: 6) rawMorphs at: 0 ) myWidth: 274.
( (root rawMorphs at: 6) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 6) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( (root rawMorphs at: 7) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 7) rawMorphs at: 0 ) myAscent: 11.
( (root rawMorphs at: 7) rawMorphs at: 0 ) myBox: ((6)@(-11)) # ((6)@(3)).
( (root rawMorphs at: 7) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 7) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (root rawMorphs at: 7) rawMorphs at: 0 ) myLabel: mutableString.
( (root rawMorphs at: 7) rawMorphs at: 0 ) myPosition: (6)@(0).
( (root rawMorphs at: 7) rawMorphs at: 0 ) myWidth: 0.
( (root rawMorphs at: 7) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 7) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( (root rawMorphs at: 9) rawMorphs at: 0 ) baseMinHeight: 3.
( (root rawMorphs at: 9) rawMorphs at: 0 ) baseMinWidth: 3.
( (root rawMorphs at: 9) rawMorphs at: 0 ) borderWidth: 5.
( (root rawMorphs at: 9) rawMorphs at: 0 ) hResizing: 1.
( (root rawMorphs at: 9) rawMorphs at: 0 ) justification: -1.
( (root rawMorphs at: 9) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 9) rawMorphs at: 0 ) rawBox: ((8)@(8)) # ((96)@(126)).
( (root rawMorphs at: 9) rawMorphs at: 0 ) rawColor: paint copyRed: 0.788856 Green: 0.769306  Blue: 0.72043.
( (root rawMorphs at: 9) rawMorphs at: 0 ) vResizing: 1.
] value.

[
" State for: a labelMorph(type: labelMorph [       get a menu appropriate to\n]): "

( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((197)@(21)).
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '       get a menu appropriate to
' copyMutable.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 197.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Left mouse button: used to\n]): "

( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((173)@(21)).
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'Left mouse button: used to
' copyMutable.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 173.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Right mouse button: gets the same\n]): "

( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((219)@(21)).
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'Right mouse button: gets the same
' copyMutable.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 219.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 10.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 10.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 4.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) filled: false.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) frameStyle: 0.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((5)@(5)) # ((31)@(56)).
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.788856 Green: 0.769306  Blue: 0.72043.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 1 ) baseMinHeight: 10.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 1 ) baseMinWidth: 10.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 1 ) borderWidth: 4.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 1 ) filled: false.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 1 ) frameStyle: 0.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 1 ) justification: 0.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((31)@(5)) # ((57)@(56)).
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.788856 Green: 0.769306  Blue: 0.72043.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 2 ) baseMinHeight: 10.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 2 ) baseMinWidth: 10.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 2 ) borderWidth: 4.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 2 ) filled: false.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 2 ) frameStyle: 0.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 2 ) justification: 0.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 2 ) rawBox: ((57)@(5)) # ((83)@(56)).
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.788856 Green: 0.769306  Blue: 0.72043.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [       this particular object. On\n]): "

( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((192)@(21)).
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '       this particular object. On
' copyMutable.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 192.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [   grab and carry objects, to\n]): "

( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((178)@(21)).
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '   grab and carry objects, to
' copyMutable.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 178.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [    blue menu on every object.  This\n]): "

( (((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( (((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((223)@(21)).
( (((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '    blue menu on every object.  This
' copyMutable.
( (((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 223.
( (((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [       the background, gets a menu \n]): "

( ((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((217)@(21)).
( ((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '       the background, gets a menu 
' copyMutable.
( ((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 217.
( ((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( ((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [   push buttons, operate sliders,\n]): "

( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((198)@(21)).
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '   push buttons, operate sliders,
' copyMutable.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 198.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a lineMorph(type: lineMorph (168@1->249@18)): "

( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) p1: (168)@(1).
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) p2: (249)@(18).
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint named: 'black'.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 0.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) width: 1.
] value.

[
" State for: a labelMorph(type: labelMorph [    menu lets you manipulate and\n]): "

( ((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((210)@(21)).
( ((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '    menu lets you manipulate and
' copyMutable.
( ((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 210.
( ((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( ((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [       appropriate for system-wide\n]): "

( (((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( (((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((208)@(21)).
( (((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '       appropriate for system-wide
' copyMutable.
( (((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 208.
( (((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [    change the state of the object\n]): "

( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((203)@(21)).
( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '    change the state of the object
' copyMutable.
( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 203.
( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a lineMorph(type: lineMorph (-83@7->17@-13)): "

( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) p1: (-83)@(7).
( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) p2: (17)@(-13).
( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint named: 'black'.
( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 0.
( (((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) width: 1.
] value.

[
" State for: a labelMorph(type: labelMorph [       concerns. The background\n]): "

( ((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((197)@(21)).
( ((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '       concerns. The background
' copyMutable.
( ((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 197.
( ((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( ((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [    on which you clicked the right\n]): "

( ((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((210)@(21)).
( ((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '    on which you clicked the right
' copyMutable.
( ((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 210.
( ((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( ((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [       menu and a text editor middle\n]): "

( (((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( (((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((223)@(21)).
( (((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '       menu and a text editor middle
' copyMutable.
( (((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 223.
( (((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [    button.]): "

( (((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( (((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((60)@(21)).
( (((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '    button.' copyMutable.
( (((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 60.
( (((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (((((((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [       button menu are shown here:]): "

( ((((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((206)@(21)).
( ((((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '       button menu are shown here:' copyMutable.
( ((((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 206.
( ((((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( ((((((((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
