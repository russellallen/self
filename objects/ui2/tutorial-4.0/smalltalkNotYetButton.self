[ | root |
root: carpetMorph copyRemoveAllMorphs.

"building skeleton"

[
( root )addMorph: ui2Button copyRemoveAllMorphs.
[
( root rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

"end of skeleton"

[
" State for: a carpetMorph(type: carpetMorph): "

( root ) hResizing: 0.
( root ) rawBox: ((6)@(-414)) # ((192)@(-335)).
( root ) rawColor: paint named: 'black'.
( root ) vResizing: 0.
( root ) borderWidth: 2.
( root ) dragPoint: (6)@(-414).
( root ) inResizeMode: false.
( root ) isPersistent: false.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( root rawMorphs at: 0 ) hResizing: 2.
( root rawMorphs at: 0 ) rawBox: ((14)@(23)) # ((155)@(42)).
( root rawMorphs at: 0 ) vResizing: 2.
( root rawMorphs at: 0 ) justification: 0.
( root rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 0 ) borderWidth: 2.
( root rawMorphs at: 0 ) filled: false.
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.86999 Green: 0.638319  Blue: 0.521994.
( root rawMorphs at: 0 ) baseMinHeight: 10.
( root rawMorphs at: 0 ) baseMinWidth: 10.
( root rawMorphs at: 0 ) depressedColor: paint copyRed: 0.919844 Green: 0.675464  Blue: 0.552297.
( root rawMorphs at: 0 ) isAsynchronous: false.
( root rawMorphs at: 0 ) rawIsGrayedOut: false.
( root rawMorphs at: 0 ) rawState: 'up'.
( root rawMorphs at: 0 ) script: '  button world addMorph: ((labelMorph copyLabel: \'Not yet implemented.\') globalPosition: button globalPosition + (70@50) )' copyMutable.
( root rawMorphs at: 0 ) script: '  button world addMorph: ((labelMorph copyLabel: \'Not yet implemented.\') globalPosition: button globalPosition + (70@50) )' copyMutable.
( root rawMorphs at: 0 ) target: nil.
] value.

[
" State for: a labelMorph(type: labelMorph [ Load Smalltalk world]): "

( (root rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((139)@(17)).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myLabel: ' Load Smalltalk world' copyMutable.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(14).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 137.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

root ] value
