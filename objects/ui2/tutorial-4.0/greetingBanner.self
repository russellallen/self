"$Revision: 1.4 $"
[ | root |
root: carpetMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
[
( root rawMorphs at: 0 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

[
( root rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 1) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

"end of skeleton"

[
" State for: a carpetMorph(type: carpetMorph): "

( root ) borderWidth: 2.
( root ) dragPoint: (-60)@(-35).
( root ) hResizing: 0.
( root ) handToFollow: nil.
( root ) inResizeMode: false.
( root ) isPersistent: false.
( root ) rawBox: ((-60)@(-35)) # ((397)@(301)).
( root ) rawColor: paint named: 'black'.
( root ) vResizing: 0.
] value.

[
" State for: a morph(type: morph): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) rawBox: ((59)@(34)) # ((343)@(192)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.57087 Green: 0.836755  Blue: 0.822092.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) myAscent: 11.
( root rawMorphs at: 1 ) myBox: ((126)@(230)) # ((126)@(244)).
( root rawMorphs at: 1 ) myDescent: 3.
( root rawMorphs at: 1 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 14 Style: 'bold'.
( root rawMorphs at: 1 ) myLabel: mutableString.
( root rawMorphs at: 1 ) myPosition: (126)@(241).
( root rawMorphs at: 1 ) myWidth: 0.
( root rawMorphs at: 1 ) rawColor: paint named: 'black'.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [4.5.0]): "

( (root rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 39.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((169)@(96)) # ((234)@(148)).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 13.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 52 Style: 'bold' copyMutable.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '4.5.0' copyMutable.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (169)@(135).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 65.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [L]): "

( (root rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 1 ) myAscent: 36.
( (root rawMorphs at: 0) rawMorphs at: 1 ) myBox: ((91)@(98)) # ((123)@(146)).
( (root rawMorphs at: 0) rawMorphs at: 1 ) myDescent: 12.
( (root rawMorphs at: 0) rawMorphs at: 1 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 48 Style: 'bold'.
( (root rawMorphs at: 0) rawMorphs at: 1 ) myLabel: mutableString copySize: 1 FillingWith: 'L'.
( (root rawMorphs at: 0) rawMorphs at: 1 ) myPosition: (91)@(134).
( (root rawMorphs at: 0) rawMorphs at: 1 ) myWidth: 32.
( (root rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [E]): "

( (root rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 36.
( (root rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((57)@(98)) # ((89)@(146)).
( (root rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 12.
( (root rawMorphs at: 0) rawMorphs at: 2 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 48 Style: 'bold'.
( (root rawMorphs at: 0) rawMorphs at: 2 ) myLabel: mutableString copySize: 1 FillingWith: 'E'.
( (root rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (57)@(134).
( (root rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 32.
( (root rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [S]): "

( (root rawMorphs at: 0) rawMorphs at: 3 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 3 ) myAscent: 47.
( (root rawMorphs at: 0) rawMorphs at: 3 ) myBox: ((22)@(87)) # ((56)@(149)).
( (root rawMorphs at: 0) rawMorphs at: 3 ) myDescent: 15.
( (root rawMorphs at: 0) rawMorphs at: 3 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 62 Style: 'bold'.
( (root rawMorphs at: 0) rawMorphs at: 3 ) myLabel: mutableString copySize: 1 FillingWith: 'S'.
( (root rawMorphs at: 0) rawMorphs at: 3 ) myPosition: (22)@(134).
( (root rawMorphs at: 0) rawMorphs at: 3 ) myWidth: 34.
( (root rawMorphs at: 0) rawMorphs at: 3 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 0) rawMorphs at: 3 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [F]): "

( (root rawMorphs at: 0) rawMorphs at: 4 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 4 ) myAscent: 36.
( (root rawMorphs at: 0) rawMorphs at: 4 ) myBox: ((126)@(98)) # ((155)@(146)).
( (root rawMorphs at: 0) rawMorphs at: 4 ) myDescent: 12.
( (root rawMorphs at: 0) rawMorphs at: 4 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 48 Style: 'bold'.
( (root rawMorphs at: 0) rawMorphs at: 4 ) myLabel: mutableString copySize: 1 FillingWith: 'F'.
( (root rawMorphs at: 0) rawMorphs at: 4 ) myPosition: (126)@(134).
( (root rawMorphs at: 0) rawMorphs at: 4 ) myWidth: 29.
( (root rawMorphs at: 0) rawMorphs at: 4 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 0) rawMorphs at: 4 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Welcome to]): "

( (root rawMorphs at: 0) rawMorphs at: 5 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 5 ) myAscent: 36.
( (root rawMorphs at: 0) rawMorphs at: 5 ) myBox: ((6)@(17)) # ((246)@(65)).
( (root rawMorphs at: 0) rawMorphs at: 5 ) myDescent: 12.
( (root rawMorphs at: 0) rawMorphs at: 5 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 48 Style: 'bold'.
( (root rawMorphs at: 0) rawMorphs at: 5 ) myLabel: 'Welcome to' copyMutable.
( (root rawMorphs at: 0) rawMorphs at: 5 ) myPosition: (6)@(53).
( (root rawMorphs at: 0) rawMorphs at: 5 ) myWidth: 240.
( (root rawMorphs at: 0) rawMorphs at: 5 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 0) rawMorphs at: 5 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [If you get stuck at any time\n]): "

( (root rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 11.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((177)@(21)).
( (root rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 14 Style: 'bold' copyMutable.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'If you get stuck at any time
' copyMutable.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 177.
( (root rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [please look in the file help.text]): "

( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((184)@(21)).
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 14 Style: 'bold'.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'please look in the file help.text' copyMutable.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 184.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
