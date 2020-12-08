"$Revision: 1.1 $"
[ | root |
root: carpetMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs ) asList.
[
( root rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

[
( root rawMorphs at: 4 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

"end of skeleton"

[
" State for: a carpetMorph(type: carpetMorph): "

( root ) hResizing: 0.
( root ) rawBox: ((1188)@(610)) # ((1818)@(725)).
( root ) rawColor: paint named: 'black'.
( root ) vResizing: 0.
( root ) borderWidth: 2.
( root ) dragPoint: (1818)@(610).
( root ) inResizeMode: false.
( root ) isPersistent: false.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) vResizing: 0.
( root rawMorphs at: 0 ) myAscent: 12.
( root rawMorphs at: 0 ) myBox: ((282)@(40)) # ((282)@(55)).
( root rawMorphs at: 0 ) myDescent: 3.
( root rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( root rawMorphs at: 0 ) myLabel: mutableString.
( root rawMorphs at: 0 ) myPosition: (282)@(52).
( root rawMorphs at: 0 ) myWidth: 0.
( root rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) vResizing: 0.
( root rawMorphs at: 1 ) movingOffset: nil.
( root rawMorphs at: 1 ) position: (333)@(29).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 1 ) vertexOffsets: (( (0)@(20) ) & ( (14)@(10) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 2 ) hResizing: 0.
( root rawMorphs at: 2 ) vResizing: 0.
( root rawMorphs at: 2 ) movingOffset: nil.
( root rawMorphs at: 2 ) position: (309)@(29).
( root rawMorphs at: 2 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 2 ) vertexOffsets: (( (0)@(20) ) & ( (14)@(10) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 3 ) hResizing: 0.
( root rawMorphs at: 3 ) vResizing: 0.
( root rawMorphs at: 3 ) movingOffset: nil.
( root rawMorphs at: 3 ) position: (284)@(29).
( root rawMorphs at: 3 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 3 ) vertexOffsets: (( (0)@(20) ) & ( (14)@(10) )) asVector.
] value.

[
" State for: a labelMorph(type: labelMorph [Move down to find out about Direct\n]): "

( root rawMorphs at: 4 ) hResizing: 0.
( root rawMorphs at: 4 ) vResizing: 0.
( root rawMorphs at: 4 ) myAscent: 12.
( root rawMorphs at: 4 ) myBox: ((8)@(42)) # ((231)@(57)).
( root rawMorphs at: 4 ) myDescent: 3.
( root rawMorphs at: 4 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( root rawMorphs at: 4 ) myLabel: 'Move down to find out about Direct
' copyMutable.
( root rawMorphs at: 4 ) myPosition: (8)@(54).
( root rawMorphs at: 4 ) myWidth: 223.
( root rawMorphs at: 4 ) rawColor: paint named: 'black'.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 5 ) hResizing: 0.
( root rawMorphs at: 5 ) vResizing: 0.
( root rawMorphs at: 5 ) movingOffset: nil.
( root rawMorphs at: 5 ) position: (116)@(86).
( root rawMorphs at: 5 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 5 ) vertexOffsets: (( (20)@(0) ) & ( (10)@(14) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 6 ) hResizing: 0.
( root rawMorphs at: 6 ) vResizing: 0.
( root rawMorphs at: 6 ) movingOffset: nil.
( root rawMorphs at: 6 ) position: (92)@(86).
( root rawMorphs at: 6 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 6 ) vertexOffsets: (( (20)@(0) ) & ( (10)@(14) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 7 ) hResizing: 0.
( root rawMorphs at: 7 ) vResizing: 0.
( root rawMorphs at: 7 ) movingOffset: nil.
( root rawMorphs at: 7 ) position: (67)@(86).
( root rawMorphs at: 7 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 7 ) vertexOffsets: (( (20)@(0) ) & ( (10)@(14) )) asVector.
] value.

[
" State for: a labelMorph(type: labelMorph [Move right for a quick animated example\n]): "

( (root rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((257)@(21)).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'Move right for a quick animated example
' copyMutable.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 257.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [Construction of user interfaces.]): "

( (root rawMorphs at: 4) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 4) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 4) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 4) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((190)@(21)).
( (root rawMorphs at: 4) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 4) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( (root rawMorphs at: 4) rawMorphs at: 0 ) myLabel: 'Construction of user interfaces.' copyMutable.
( (root rawMorphs at: 4) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 4) rawMorphs at: 0 ) myWidth: 190.
( (root rawMorphs at: 4) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [of how to modify a Self application.]): "

( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((218)@(21)).
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'of how to modify a Self application.' copyMutable.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 218.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

root ] value
