[ | root |
root: morph copyRemoveAllMorphs.

"building skeleton"

[
( root )addMorph: ui2Button copyRemoveAllMorphs.
[
( root rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

"end of skeleton"

[
" State for: a morph<292>(type: morph): "

( root ) hResizing: 0.
( root ) rawBox: ((114)@(691)) # ((125)@(722)).
( root ) rawColor: paint copyRed: 0.504399 Green: 0.565005  Blue: 0.701857.
( root ) vResizing: 0.
] value.

[
" State for: a ui2Button<293>(type: ui2Button): "

( root rawMorphs at: 0 ) hResizing: 2.
( root rawMorphs at: 0 ) rawBox: ((-38)@(17)) # ((64)@(36)).
( root rawMorphs at: 0 ) vResizing: 2.
( root rawMorphs at: 0 ) justification: 0.
( root rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 0 ) borderWidth: 2.
( root rawMorphs at: 0 ) filled: false.
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.504399 Green: 0.565005  Blue: 0.701857.
( root rawMorphs at: 0 ) baseMinHeight: 10.
( root rawMorphs at: 0 ) baseMinWidth: 10.
( root rawMorphs at: 0 ) depressedColor: paint copyRed: 0.468231 Green: 0.524927  Blue: 0.652004.
( root rawMorphs at: 0 ) isAsynchronous: false.
( root rawMorphs at: 0 ) rawIsGrayedOut: false.
( root rawMorphs at: 0 ) rawState: 'up'.
( root rawMorphs at: 0 ) script: '  target: ((button world morphsAt: button globalPosition) 
       copyFilteredBy: [ | :m | m morphTypeName = \'carpetMorph\']) at: 0 IfAbsent: target. 
target morphsDo: [ | :m | button world addMorph: m].
target delete.  '.
( root rawMorphs at: 0 ) target: [ | root |
root: carpetMorph copyRemoveAllMorphs.

"building skeleton"

[
( root )addMorph: morphFinder copyRemoveAllMorphs.
] value.

"end of skeleton"

[
" State for: a carpetMorph<294>(type: carpetMorph): "

( root ) hResizing: 0.
( root ) rawBox: ((34)@(323)) # ((489)@(669)).
( root ) rawColor: paint named: 'black'.
( root ) vResizing: 0.
( root ) borderWidth: 2.
( root ) dragPoint: (34)@(323).
( root ) inResizeMode: false.
( root ) isPersistent: true.
] value.

root ] value
.
] value.

[
" State for: a labelMorph<295>(type: labelMorph [ Carpet Zapper ]): "

( (root rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((100)@(17)).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myLabel: ' Carpet Zapper ' copyMutable.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(14).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 98.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.912023 Green: 0.926686  Blue: 0.959922.
] value.

root ] value
