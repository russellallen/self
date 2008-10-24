"$Revision: 1.1 $"
[ | root |
root: ui2Button copyRemoveAllMorphs.

"building skeleton"

[
( root )addMorph: polygonMorph copyRemoveAllMorphs.
] value.

"end of skeleton"

[
" State for: a ui2Button(type: ui2Button): "

( root ) hResizing: 2.
( root ) rawBox: ((960)@(576)) # ((980)@(590)).
( root ) vResizing: 2.
( root ) justification: 0.
( root ) nonLaidOutMorphs: vector.
( root ) borderWidth: 0.
( root ) filled: false.
( root ) frameStyle: 0.
( root ) rawColor: paint copyRed: 0.929619 Green: 0.929619  Blue: 0.929619.
( root ) baseMinHeight: 10.
( root ) baseMinWidth: 10.
( root ) depressedColor: paint copyRed: 0.979472 Green: 0.979472  Blue: 0.979472.
( root ) isAsynchronous: false.
( root ) rawIsGrayedOut: false.
( root ) rawState: 'up'.
( root ) script: ' | m |
 m: (labelMorph copyLabel: \'Use the greenish radar view to navigate,\') 
   globalPosition: button globalPosition - (100@45).

 button world addMorph:  m.
 m  addMorph: 
   (
    (labelMorph copyLabel: \'3 clicks of its arrow buttons move one screenful.\') 
      globalPosition: button globalPosition - (120@25)
    ).
 m addMorph: 
   (
      ((((ui2Button copy label: \'Okay\') 
         script: \'target delete\') 
         globalPosition: button globalPosition - ( 8 @ 20))
         colorAll: (button color))
         target: m
   )'.
( root ) script: ' | m |
 m: (labelMorph copyLabel: \'Use the greenish radar view to navigate,\') 
   globalPosition: button globalPosition - (100@45).

 button world addMorph:  m.
 m  addMorph: 
   (
    (labelMorph copyLabel: \'3 clicks of its arrow buttons move one screenful.\') 
      globalPosition: button globalPosition - (120@25)
    ).
 m addMorph: 
   (
      ((((ui2Button copy label: \'Okay\') 
         script: \'target delete\') 
         globalPosition: button globalPosition - ( 8 @ 20))
         colorAll: (button color))
         target: m
   ). 
  button world moveToFront: m.'.
( root ) target: nil.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) vResizing: 0.
( root rawMorphs at: 0 ) movingOffset: nil.
( root rawMorphs at: 0 ) position: (0)@(14).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 0 ) vertexOffsets: (( (20)@(0) ) & ( (10)@(-14) )) asVector.
] value.

root ] value
