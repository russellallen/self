"$Revision: 1.2 $"
[ | root |
root: carpetMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & morph copyRemoveAllMorphs & morph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
[
( root rawMorphs at: 3 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 6 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 6) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

"end of skeleton"

[
" State for: a carpetMorph(type: carpetMorph): "

( root ) borderWidth: 2.
( root ) dragPoint: (1146)@(507).
( root ) hResizing: 0.
( root ) handToFollow: nil.
( root ) inResizeMode: false.
( root ) isPersistent: false.
( root ) rawBox: ((1146)@(507)) # ((1593)@(629)).
( root ) rawColor: paint named: 'black'.
( root ) vResizing: 0.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) movingOffset: nil.
( root rawMorphs at: 0 ) position: (46)@(41).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 0 ) vResizing: 0.
( root rawMorphs at: 0 ) vertexOffsets: (( (20)@(0) ) & ( (10)@(-14) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) movingOffset: nil.
( root rawMorphs at: 1 ) position: (46)@(75).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 1 ) vResizing: 0.
( root rawMorphs at: 1 ) vertexOffsets: (( (20)@(0) ) & ( (10)@(-14) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 2 ) hResizing: 0.
( root rawMorphs at: 2 ) movingOffset: nil.
( root rawMorphs at: 2 ) position: (46)@(58).
( root rawMorphs at: 2 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 2 ) vResizing: 0.
( root rawMorphs at: 2 ) vertexOffsets: (( (20)@(0) ) & ( (10)@(-14) )) asVector.
] value.

[
" State for: a labelMorph(type: labelMorph [         A tutorial on the basics of Self objects, messages\n]): "

( root rawMorphs at: 3 ) hResizing: 0.
( root rawMorphs at: 3 ) myAscent: 11.
( root rawMorphs at: 3 ) myBox: ((84)@(64)) # ((420)@(78)).
( root rawMorphs at: 3 ) myDescent: 3.
( root rawMorphs at: 3 ) myFontSpec: fontSpec copyName: 'verdana' Size: 14 Style: 'bold'.
( root rawMorphs at: 3 ) myLabel: '         A tutorial on the basics of Self objects, messages
' copyMutable.
( root rawMorphs at: 3 ) myPosition: (84)@(75).
( root rawMorphs at: 3 ) myWidth: 336.
( root rawMorphs at: 3 ) rawColor: paint named: 'black'.
( root rawMorphs at: 3 ) vResizing: 0.
] value.

[
" State for: a morph(type: morph): "

( root rawMorphs at: 4 ) hResizing: 0.
( root rawMorphs at: 4 ) rawBox: ((105)@(68)) # ((111)@(73)).
( root rawMorphs at: 4 ) rawColor: paint copyRed: 0.55914 Green: 0.856305  Blue: 0.513196.
( root rawMorphs at: 4 ) vResizing: 0.
] value.

[
" State for: a morph(type: morph): "

( root rawMorphs at: 5 ) hResizing: 0.
( root rawMorphs at: 5 ) rawBox: ((105)@(47)) # ((111)@(52)).
( root rawMorphs at: 5 ) rawColor: paint copyRed: 0.55914 Green: 0.856305  Blue: 0.513196.
( root rawMorphs at: 5 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( root rawMorphs at: 6 ) hResizing: 0.
( root rawMorphs at: 6 ) myAscent: 11.
( root rawMorphs at: 6 ) myBox: ((85)@(9)) # ((85)@(23)).
( root rawMorphs at: 6 ) myDescent: 3.
( root rawMorphs at: 6 ) myFontSpec: fontSpec copyName: 'verdana' Size: 14 Style: 'bold'.
( root rawMorphs at: 6 ) myLabel: mutableString.
( root rawMorphs at: 6 ) myPosition: (85)@(20).
( root rawMorphs at: 6 ) myWidth: 0.
( root rawMorphs at: 6 ) rawColor: paint named: 'black'.
( root rawMorphs at: 6 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [               and the Self module system]): "

( (root rawMorphs at: 3) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 3) rawMorphs at: 0 ) myAscent: 11.
( (root rawMorphs at: 3) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((226)@(21)).
( (root rawMorphs at: 3) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 3) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'verdana' Size: 14 Style: 'bold'.
( (root rawMorphs at: 3) rawMorphs at: 0 ) myLabel: '               and the Self module system' copyMutable.
( (root rawMorphs at: 3) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 3) rawMorphs at: 0 ) myWidth: 226.
( (root rawMorphs at: 3) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 3) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Move up to find:\n]): "

( (root rawMorphs at: 6) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 6) rawMorphs at: 0 ) myAscent: 11.
( (root rawMorphs at: 6) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((112)@(21)).
( (root rawMorphs at: 6) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 6) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'verdana' Size: 14 Style: 'bold'.
( (root rawMorphs at: 6) rawMorphs at: 0 ) myLabel: 'Move up to find:
' copyMutable.
( (root rawMorphs at: 6) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 6) rawMorphs at: 0 ) myWidth: 112.
( (root rawMorphs at: 6) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 6) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [         Self\'s surprising Smalltalk emulation.\n]): "

( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((273)@(21)).
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'verdana' Size: 14 Style: 'bold'.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '         Self\'s surprising Smalltalk emulation.
' copyMutable.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 273.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
