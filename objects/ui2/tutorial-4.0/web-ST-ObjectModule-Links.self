[ | root |
root: carpetMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
[
( root rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

[
( root rawMorphs at: 10 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 10) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

[
( root rawMorphs at: 11 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 11) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

] value.

"end of skeleton"

[
" State for: a carpetMorph(type: carpetMorph): "

( root ) hResizing: 0.
( root ) rawBox: ((919)@(-541)) # ((1769)@(-92)).
( root ) rawColor: paint named: 'black'.
( root ) vResizing: 0.
( root ) borderWidth: 2.
( root ) dragPoint: (919)@(-541).
( root ) inResizeMode: false.
( root ) isPersistent: false.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) vResizing: 0.
( root rawMorphs at: 0 ) myAscent: 12.
( root rawMorphs at: 0 ) myBox: ((382)@(71)) # ((382)@(86)).
( root rawMorphs at: 0 ) myDescent: 3.
( root rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( root rawMorphs at: 0 ) myLabel: mutableString.
( root rawMorphs at: 0 ) myPosition: (382)@(83).
( root rawMorphs at: 0 ) myWidth: 0.
( root rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) vResizing: 0.
( root rawMorphs at: 1 ) movingOffset: nil.
( root rawMorphs at: 1 ) position: (422)@(43).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 1 ) vertexOffsets: (( (20)@(0) ) & ( (10)@(-14) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 2 ) hResizing: 0.
( root rawMorphs at: 2 ) vResizing: 0.
( root rawMorphs at: 2 ) movingOffset: nil.
( root rawMorphs at: 2 ) position: (422)@(77).
( root rawMorphs at: 2 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 2 ) vertexOffsets: (( (20)@(0) ) & ( (10)@(-14) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 3 ) hResizing: 0.
( root rawMorphs at: 3 ) vResizing: 0.
( root rawMorphs at: 3 ) movingOffset: nil.
( root rawMorphs at: 3 ) position: (422)@(60).
( root rawMorphs at: 3 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 3 ) vertexOffsets: (( (20)@(0) ) & ( (10)@(-14) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 4 ) hResizing: 0.
( root rawMorphs at: 4 ) vResizing: 0.
( root rawMorphs at: 4 ) movingOffset: nil.
( root rawMorphs at: 4 ) position: (127)@(298).
( root rawMorphs at: 4 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 4 ) vertexOffsets: (( (0)@(-20) ) & ( (-14)@(-10) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 5 ) hResizing: 0.
( root rawMorphs at: 5 ) vResizing: 0.
( root rawMorphs at: 5 ) movingOffset: nil.
( root rawMorphs at: 5 ) position: (106)@(297).
( root rawMorphs at: 5 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 5 ) vertexOffsets: (( (0)@(-20) ) & ( (-14)@(-10) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 6 ) hResizing: 0.
( root rawMorphs at: 6 ) vResizing: 0.
( root rawMorphs at: 6 ) movingOffset: nil.
( root rawMorphs at: 6 ) position: (85)@(296).
( root rawMorphs at: 6 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 6 ) vertexOffsets: (( (0)@(-20) ) & ( (-14)@(-10) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 7 ) hResizing: 0.
( root rawMorphs at: 7 ) vResizing: 0.
( root rawMorphs at: 7 ) movingOffset: nil.
( root rawMorphs at: 7 ) position: (646)@(345).
( root rawMorphs at: 7 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 7 ) vertexOffsets: (( (0)@(20) ) & ( (14)@(10) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 8 ) hResizing: 0.
( root rawMorphs at: 8 ) vResizing: 0.
( root rawMorphs at: 8 ) movingOffset: nil.
( root rawMorphs at: 8 ) position: (693)@(345).
( root rawMorphs at: 8 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 8 ) vertexOffsets: (( (0)@(20) ) & ( (14)@(10) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 9 ) hResizing: 0.
( root rawMorphs at: 9 ) vResizing: 0.
( root rawMorphs at: 9 ) movingOffset: nil.
( root rawMorphs at: 9 ) position: (670)@(345).
( root rawMorphs at: 9 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 9 ) vertexOffsets: (( (0)@(20) ) & ( (14)@(10) )) asVector.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( root rawMorphs at: 10 ) hResizing: 0.
( root rawMorphs at: 10 ) vResizing: 0.
( root rawMorphs at: 10 ) myAscent: 12.
( root rawMorphs at: 10 ) myBox: ((33)@(221)) # ((33)@(236)).
( root rawMorphs at: 10 ) myDescent: 3.
( root rawMorphs at: 10 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( root rawMorphs at: 10 ) myLabel: mutableString.
( root rawMorphs at: 10 ) myPosition: (33)@(233).
( root rawMorphs at: 10 ) myWidth: 0.
( root rawMorphs at: 10 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( root rawMorphs at: 11 ) hResizing: 0.
( root rawMorphs at: 11 ) vResizing: 0.
( root rawMorphs at: 11 ) myAscent: 12.
( root rawMorphs at: 11 ) myBox: ((589)@(364)) # ((589)@(379)).
( root rawMorphs at: 11 ) myDescent: 3.
( root rawMorphs at: 11 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( root rawMorphs at: 11 ) myLabel: mutableString.
( root rawMorphs at: 11 ) myPosition: (589)@(376).
( root rawMorphs at: 11 ) myWidth: 0.
( root rawMorphs at: 11 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [Move up to see the\n]): "

( (root rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((117)@(21)).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'Move up to see the
' copyMutable.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 117.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [Move left to see Self\'s surprising\n]): "

( (root rawMorphs at: 10) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 10) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 10) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 10) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((200)@(21)).
( (root rawMorphs at: 10) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 10) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( (root rawMorphs at: 10) rawMorphs at: 0 ) myLabel: 'Move left to see Self\'s surprising
' copyMutable.
( (root rawMorphs at: 10) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 10) rawMorphs at: 0 ) myWidth: 200.
( (root rawMorphs at: 10) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [Move right for an introduction to\n]): "

( (root rawMorphs at: 11) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 11) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 11) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 11) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((208)@(21)).
( (root rawMorphs at: 11) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 11) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( (root rawMorphs at: 11) rawMorphs at: 0 ) myLabel: 'Move right for an introduction to
' copyMutable.
( (root rawMorphs at: 11) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 11) rawMorphs at: 0 ) myWidth: 208.
( (root rawMorphs at: 11) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [Self web browser]): "

( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((103)@(21)).
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'Self web browser' copyMutable.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 103.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [ implementation of Smalltalk!]): "

( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((184)@(21)).
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: ' implementation of Smalltalk!' copyMutable.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 184.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [Self objects and to the Self module\n]): "

( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((215)@(21)).
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'Self objects and to the Self module
' copyMutable.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 215.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [system.]): "

( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((44)@(21)).
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'system.' copyMutable.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 44.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

root ] value
