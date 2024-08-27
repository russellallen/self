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
( root ) rawBox: ((1119)@(-1327)) # ((1498)@(-1159)).
( root ) rawColor: paint named: 'black'.
( root ) vResizing: 0.
( root ) borderWidth: 2.
( root ) dragPoint: (1119)@(-1327).
( root ) inResizeMode: false.
( root ) isPersistent: false.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( root rawMorphs at: 0 ) hResizing: 2.
( root rawMorphs at: 0 ) rawBox: ((95)@(97)) # ((353)@(116)).
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
( root rawMorphs at: 0 ) script: '   button world addMorph: ((labelMorph copyLabel: \'Not yet implemented.\') globalPosition: button globalPosition + (70@50) )' copyMutable.
( root rawMorphs at: 0 ) script: '   button world addMorph: ((labelMorph copyLabel: \'Not yet implemented.\') globalPosition: button globalPosition + (70@50) )' copyMutable.
( root rawMorphs at: 0 ) target: nil.
] value.

[
" State for: a labelMorph(type: labelMorph [Press this button to make a web browser. ]): "

( (root rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((256)@(17)).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'Press this button to make a web browser. ' copyMutable.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(14).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 254.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

root ] value
