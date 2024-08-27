[ | root |
root: carpetMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs ) asList.
[
( root rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

] value.

] value.

] value.

"end of skeleton"

[
" State for: a carpetMorph<660>(type: carpetMorph): "

( root ) hResizing: 0.
( root ) rawBox: ((2962)@(483)) # ((3381)@(675)).
( root ) rawColor: paint named: 'black'.
( root ) vResizing: 0.
( root ) borderWidth: 2.
( root ) dragPoint: (2962)@(483).
( root ) inResizeMode: false.
( root ) isPersistent: false.
] value.

[
" State for: a labelMorph<661>(type: labelMorph []): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) vResizing: 0.
( root rawMorphs at: 0 ) myAscent: 12.
( root rawMorphs at: 0 ) myBox: ((71)@(4)) # ((71)@(19)).
( root rawMorphs at: 0 ) myDescent: 3.
( root rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( root rawMorphs at: 0 ) myLabel: mutableString.
( root rawMorphs at: 0 ) myPosition: (71)@(16).
( root rawMorphs at: 0 ) myWidth: 0.
( root rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a polygonMorph<639>(type: polygonMorph): "

( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) vResizing: 0.
( root rawMorphs at: 1 ) movingOffset: nil.
( root rawMorphs at: 1 ) position: (76)@(113).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 1 ) vertexOffsets: (((0)@(20))
	& ((14)@(10))) asVector.
] value.

[
" State for: a polygonMorph<640>(type: polygonMorph): "

( root rawMorphs at: 2 ) hResizing: 0.
( root rawMorphs at: 2 ) vResizing: 0.
( root rawMorphs at: 2 ) movingOffset: nil.
( root rawMorphs at: 2 ) position: (44)@(115).
( root rawMorphs at: 2 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 2 ) vertexOffsets: (((20)@(0))
	& ((10)@(14))) asVector.
] value.

[
" State for: a polygonMorph<641>(type: polygonMorph): "
( root rawMorphs at: 3 ) hResizing: 0.
( root rawMorphs at: 3 ) vResizing: 0.
( root rawMorphs at: 3 ) movingOffset: nil.
( root rawMorphs at: 3 ) position: (44)@(94).
( root rawMorphs at: 3 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 3 ) vertexOffsets: (((20)@(0))
	& ((10)@(14))) asVector.
] value.

[
" State for: a polygonMorph<642>(type: polygonMorph): "

( root rawMorphs at: 4 ) hResizing: 0.
( root rawMorphs at: 4 ) vResizing: 0.
( root rawMorphs at: 4 ) movingOffset: nil.
( root rawMorphs at: 4 ) position: (44)@(72).
( root rawMorphs at: 4 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 4 ) vertexOffsets: (((20)@(0))
	& ((10)@(14))) asVector.
] value.

[
" State for: a labelMorph<662>(type: labelMorph [A Final Challenge project is below\n]): "

( (root rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((213)@(21)).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'A Final Challenge project is below
' copyMutable.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 213.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph<663>(type: labelMorph [and to the right. It puts your changes\n]): "

( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((231)@(21)).
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'and to the right. It puts your changes
' copyMutable.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 231.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph<664>(type: labelMorph [into a complete interface. You must have\n]): "

( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((253)@(21)).
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'into a complete interface. You must have
' copyMutable.
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 253.
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph<665>(type: labelMorph [already looked at the Direct Construction\n]): "

( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((256)@(21)).
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'already looked at the Direct Construction
' copyMutable.
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 256.
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph<666>(type: labelMorph [areas to complete the Final Challenge.]): "

( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((232)@(21)).
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'areas to complete the Final Challenge.' copyMutable.
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 232.
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

root ] value
