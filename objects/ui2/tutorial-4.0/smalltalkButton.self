"$Revision: 1.2 $"
[ | root |
root: ui2Button copyRemoveAllMorphs.

"building skeleton"

[
( root )addMorph: labelMorph copyRemoveAllMorphs.
] value.

"end of skeleton"

[
" State for: a ui2Button(type: ui2Button): "

( root ) baseMinHeight: 10.
( root ) baseMinWidth: 10.
( root ) borderWidth: 2.
( root ) depressedColor: paint copyRed: 0.919844 Green: 0.675464  Blue: 0.552297.
( root ) filled: false.
( root ) frameStyle: 0.
( root ) hResizing: 2.
( root ) isAsynchronous: false.
( root ) justification: 0.
( root ) nonLaidOutMorphs: vector.
( root ) rawBox: ((-173)@(-429)) # ((-102)@(-410)).
( root ) rawColor: paint copyRed: 0.86999 Green: 0.638319  Blue: 0.521994.
( root ) rawIsGrayedOut: false.
( root ) rawState: 'up'.
( root ) script: ' [| p. w. m. | 
p: event cursorPoint.
w: event sourceHand world.
w safelyDo: [
m: smalltalkEmulator browser copy.
m updateCategoryPane.
m globalPosition: p + (300@150).
w addMorph: m.
m: smalltalkEmulator workspace copy.
m globalPosition: p + (50@150).
w addMorph: m.
m: smalltalkEmulator transcript.
m globalPosition: p + (50@0).
w addMorph: m.
] ] value' copyMutable.
( root ) vResizing: 2.
( root ) script: ' [| p. w. m. | 
p: event cursorPoint.
w: event sourceHand world.
w safelyDo: [
m: smalltalkEmulator browser copy.
m updateCategoryPane.
m globalPosition: p + (300@150).
w addMorph: m.
m: smalltalkEmulator workspace copy.
m globalPosition: p + (50@150).
w addMorph: m.
m: smalltalkEmulator transcript.
m globalPosition: p + (50@0).
w addMorph: m.
] ] value' copyMutable.
( root ) target: nil.
] value.

[
" State for: a labelMorph(type: labelMorph [ Smalltalk ]): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) myAscent: 12.
( root rawMorphs at: 0 ) myBox: ((2)@(2)) # ((69)@(17)).
( root rawMorphs at: 0 ) myDescent: 3.
( root rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'verdana' Size: 14 Style: 'bold'.
( root rawMorphs at: 0 ) myLabel: ' Smalltalk ' copyMutable.
( root rawMorphs at: 0 ) myPosition: (2)@(14).
( root rawMorphs at: 0 ) myWidth: 67.
( root rawMorphs at: 0 ) rawColor: paint named: 'black'.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
