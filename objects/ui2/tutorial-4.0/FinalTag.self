"$Revision: 1.2 $"
[ | root |
root: carpetMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
[
( root rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 2 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 2) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

[
( root rawMorphs at: 3 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 3) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

"end of skeleton"

[
" State for: a carpetMorph(type: carpetMorph): "

( root ) borderWidth: 2.
( root ) dragPoint: (3676)@(1507).
( root ) hResizing: 0.
( root ) handToFollow: nil.
( root ) inResizeMode: false.
( root ) isPersistent: false.
( root ) rawBox: ((2848)@(1242)) # ((3676)@(1507)).
( root ) rawColor: paint named: 'black'.
( root ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [option-click on Mac) with your own name. Thanks for your interest\n]): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) myAscent: 11.
( root rawMorphs at: 0 ) myBox: ((325)@(174)) # ((744)@(188)).
( root rawMorphs at: 0 ) myDescent: 3.
( root rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 14 Style: 'bold' copyMutable.
( root rawMorphs at: 0 ) myLabel: 'option-click on Mac) with your own name. Thanks for your interest
' copyMutable.
( root rawMorphs at: 0 ) myPosition: (325)@(185).
( root rawMorphs at: 0 ) myWidth: 419.
( root rawMorphs at: 0 ) rawColor: paint named: 'black'.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [morph\'s outliner, evaluate \'world removeAllMorphs\' to empty this\n]): "

( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) myAscent: 11.
( root rawMorphs at: 1 ) myBox: ((326)@(139)) # ((736)@(153)).
( root rawMorphs at: 1 ) myDescent: 3.
( root rawMorphs at: 1 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 14 Style: 'bold' copyMutable.
( root rawMorphs at: 1 ) myLabel: 'morph\'s outliner, evaluate \'world removeAllMorphs\' to empty this
' copyMutable.
( root rawMorphs at: 1 ) myPosition: (326)@(150).
( root rawMorphs at: 1 ) myWidth: 410.
( root rawMorphs at: 1 ) rawColor: paint named: 'black'.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( root rawMorphs at: 2 ) hResizing: 0.
( root rawMorphs at: 2 ) myAscent: 11.
( root rawMorphs at: 2 ) myBox: ((326)@(68)) # ((326)@(82)).
( root rawMorphs at: 2 ) myDescent: 3.
( root rawMorphs at: 2 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 14 Style: 'bold'.
( root rawMorphs at: 2 ) myLabel: mutableString.
( root rawMorphs at: 2 ) myPosition: (326)@(79).
( root rawMorphs at: 2 ) myWidth: 0.
( root rawMorphs at: 2 ) rawColor: paint named: 'black'.
( root rawMorphs at: 2 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( root rawMorphs at: 3 ) hResizing: 0.
( root rawMorphs at: 3 ) myAscent: 11.
( root rawMorphs at: 3 ) myBox: ((130)@(26)) # ((130)@(40)).
( root rawMorphs at: 3 ) myDescent: 3.
( root rawMorphs at: 3 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 14 Style: 'bold'.
( root rawMorphs at: 3 ) myLabel: mutableString.
( root rawMorphs at: 3 ) myPosition: (130)@(37).
( root rawMorphs at: 3 ) myWidth: 0.
( root rawMorphs at: 3 ) rawColor: paint named: 'black'.
( root rawMorphs at: 3 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [in Self!]): "

( (root rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((43)@(21)).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 14 Style: 'bold' copyMutable.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'in Self!' copyMutable.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 43.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [world, then save a snapshot (middle mouse background menu,]): "

( (root rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 11.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((377)@(21)).
( (root rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 14 Style: 'bold' copyMutable.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'world, then save a snapshot (middle mouse background menu,' copyMutable.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 377.
( (root rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [There is much more to learn and try out. Read the documentation,\n]): "

( (root rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 2) rawMorphs at: 0 ) myAscent: 11.
( (root rawMorphs at: 2) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((414)@(21)).
( (root rawMorphs at: 2) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 2) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 14 Style: 'bold'.
( (root rawMorphs at: 2) rawMorphs at: 0 ) myLabel: 'There is much more to learn and try out. Read the documentation,
' copyMutable.
( (root rawMorphs at: 2) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 2) rawMorphs at: 0 ) myWidth: 414.
( (root rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [You can now move the completed application\n]): "

( (root rawMorphs at: 3) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 3) rawMorphs at: 0 ) myAscent: 11.
( (root rawMorphs at: 3) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((286)@(21)).
( (root rawMorphs at: 3) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 3) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 14 Style: 'bold'.
( (root rawMorphs at: 3) rawMorphs at: 0 ) myLabel: 'You can now move the completed application
' copyMutable.
( (root rawMorphs at: 3) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 3) rawMorphs at: 0 ) myWidth: 286.
( (root rawMorphs at: 3) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 3) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [or just explore and have fun! Type `desktop openNewWorld\' in\n]): "

( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((392)@(21)).
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 14 Style: 'bold'.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'or just explore and have fun! Type `desktop openNewWorld\' in
' copyMutable.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 392.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [to its own window (look on the blue button menu.)]): "

( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((308)@(21)).
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 14 Style: 'bold'.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'to its own window (look on the blue button menu.)' copyMutable.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 308.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [the shell to get a fresh window. Or, if you are done for now, in any]): "

( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(7)) # ((402)@(21)).
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'helvetica' Size: 14 Style: 'bold' copyMutable.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'the shell to get a fresh window. Or, if you are done for now, in any' copyMutable.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 402.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
