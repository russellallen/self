[ | root |
root: ui2Button copyRemoveAllMorphs.

"building skeleton"

[
( root )addMorph: labelMorph copyRemoveAllMorphs.
] value.

"end of skeleton"

[
" State for: a ui2Button(type: ui2Button): "

( root ) hResizing: 2.
( root ) rawBox: ((1206)@(-558)) # ((1247)@(-539)).
( root ) vResizing: 2.
( root ) justification: 0.
( root ) nonLaidOutMorphs: vector.
( root ) borderWidth: 2.
( root ) filled: false.
( root ) frameStyle: 0.
( root ) rawColor: paint copyRed: 0.86999 Green: 0.638319  Blue: 0.521994.
( root ) baseMinHeight: 10.
( root ) baseMinWidth: 10.
( root ) depressedColor: paint copyRed: 0.919844 Green: 0.675464  Blue: 0.552297.
( root ) isAsynchronous: false.
( root ) rawIsGrayedOut: false.
( root ) rawState: 'up'.
( root ) script: 'event sourceHand attach: 
  (labelMorph copyLabel: (buttonArgs first + buttonArgs last) printString)'.
( root ) script: 'event sourceHand attach: 
  (labelMorph copyLabel: (buttonArgs first + buttonArgs last) printString)'.
( root ) target: ( root ) buttonArgs: (( 3 ) & ( 4 )) asList.
] value.

[
" State for: a labelMorph(type: labelMorph [ Beep ]): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) vResizing: 0.
( root rawMorphs at: 0 ) myAscent: 12.
( root rawMorphs at: 0 ) myBox: ((2)@(2)) # ((39)@(17)).
( root rawMorphs at: 0 ) myDescent: 3.
( root rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 14.
( root rawMorphs at: 0 ) myLabel: ' Beep '.
( root rawMorphs at: 0 ) myPosition: (2)@(14).
( root rawMorphs at: 0 ) myWidth: 37.
( root rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

root ] value
