[ | root |
root: carpetMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs ) asList.
[
( root rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

"end of skeleton"

[
" State for: a carpetMorph<430>(type: carpetMorph): "

( root ) hResizing: 0.
( root ) rawBox: ((1206)@(1355)) # ((1518)@(1492)).
( root ) rawColor: paint named: 'black'.
( root ) vResizing: 0.
( root ) borderWidth: 2.
( root ) dragPoint: (1206)@(1355).
( root ) inResizeMode: false.
( root ) isPersistent: false.
] value.

[
" State for: a labelMorph<431>(type: labelMorph []): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) vResizing: 0.
( root rawMorphs at: 0 ) myAscent: 12.
( root rawMorphs at: 0 ) myBox: ((72)@(28)) # ((72)@(43)).
( root rawMorphs at: 0 ) myDescent: 3.
( root rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 14.
( root rawMorphs at: 0 ) myLabel: mutableString.
( root rawMorphs at: 0 ) myPosition: (72)@(40).
( root rawMorphs at: 0 ) myWidth: 0.
( root rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a polygonMorph<432>(type: polygonMorph): "

( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) vResizing: 0.
( root rawMorphs at: 1 ) movingOffset: nil.
( root rawMorphs at: 1 ) position: (241)@(71).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 1 ) vertexOffsets: (((20)@(0))
	& ((10)@(14))) asVector.
] value.

[
" State for: a polygonMorph<433>(type: polygonMorph): "

( root rawMorphs at: 2 ) hResizing: 0.
( root rawMorphs at: 2 ) vResizing: 0.
( root rawMorphs at: 2 ) movingOffset: nil.
( root rawMorphs at: 2 ) position: (217)@(71).
( root rawMorphs at: 2 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 2 ) vertexOffsets: (((20)@(0))
	& ((10)@(14))) asVector.
] value.

[
" State for: a polygonMorph<434>(type: polygonMorph): "

( root rawMorphs at: 3 ) hResizing: 0.
( root rawMorphs at: 3 ) vResizing: 0.
( root rawMorphs at: 3 ) movingOffset: nil.
( root rawMorphs at: 3 ) position: (192)@(71).
( root rawMorphs at: 3 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 3 ) vertexOffsets: (((20)@(0))
	& ((10)@(14))) asVector.
] value.

[
" State for: a labelMorph<435>(type: labelMorph [More about automatic\n]): "

( (root rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((140)@(21)).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 14.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'More about automatic
' copyMutable.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 140.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph<436>(type: labelMorph [resizing down here]): "

( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((113)@(21)).
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 14.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'resizing down here' copyMutable.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 113.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

root ] value
