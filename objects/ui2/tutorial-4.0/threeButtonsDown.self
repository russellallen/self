"$Revision: 1.1 $"
[ | root |
root: carpetMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs ) asList.
[
( root rawMorphs at: 0 )addMorph: polygonMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 1 )addMorph: polygonMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 2 )addMorph: polygonMorph copyRemoveAllMorphs.
] value.

] value.

"end of skeleton"

[
" State for: a carpetMorph(type: carpetMorph): "

( root ) hResizing: 0.
( root ) rawBox: ((455)@(269)) # ((511)@(341)).
( root ) rawColor: paint named: 'black'.
( root ) vResizing: 0.
( root ) borderWidth: 2.
( root ) dragPoint: (455)@(269).
( root ) inResizeMode: false.
( root ) isPersistent: false.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( root rawMorphs at: 0 ) hResizing: 2.
( root rawMorphs at: 0 ) rawBox: ((11)@(49)) # ((31)@(63)).
( root rawMorphs at: 0 ) vResizing: 2.
( root rawMorphs at: 0 ) justification: 0.
( root rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 0 ) borderWidth: 0.
( root rawMorphs at: 0 ) filled: false.
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.929619 Green: 0.929619  Blue: 0.929619.
( root rawMorphs at: 0 ) baseMinHeight: 10.
( root rawMorphs at: 0 ) baseMinWidth: 10.
( root rawMorphs at: 0 ) depressedColor: paint copyRed: 0.979472 Green: 0.979472  Blue: 0.979472.
( root rawMorphs at: 0 ) isAsynchronous: false.
( root rawMorphs at: 0 ) rawIsGrayedOut: false.
( root rawMorphs at: 0 ) rawState: 'up'.
( root rawMorphs at: 0 ) script: ' | m |
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
( root rawMorphs at: 0 ) script: ' | m |
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
( root rawMorphs at: 0 ) target: nil.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( root rawMorphs at: 1 ) hResizing: 2.
( root rawMorphs at: 1 ) rawBox: ((11)@(29)) # ((31)@(43)).
( root rawMorphs at: 1 ) vResizing: 2.
( root rawMorphs at: 1 ) justification: 0.
( root rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 1 ) borderWidth: 0.
( root rawMorphs at: 1 ) filled: false.
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.929619 Green: 0.929619  Blue: 0.929619.
( root rawMorphs at: 1 ) baseMinHeight: 10.
( root rawMorphs at: 1 ) baseMinWidth: 10.
( root rawMorphs at: 1 ) depressedColor: paint copyRed: 0.979472 Green: 0.979472  Blue: 0.979472.
( root rawMorphs at: 1 ) isAsynchronous: false.
( root rawMorphs at: 1 ) rawIsGrayedOut: false.
( root rawMorphs at: 1 ) rawState: 'up'.
( root rawMorphs at: 1 ) script: ' | m |
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
( root rawMorphs at: 1 ) script: ' | m |
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
( root rawMorphs at: 1 ) target: nil.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( root rawMorphs at: 2 ) hResizing: 2.
( root rawMorphs at: 2 ) rawBox: ((11)@(9)) # ((31)@(23)).
( root rawMorphs at: 2 ) vResizing: 2.
( root rawMorphs at: 2 ) justification: 0.
( root rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 2 ) borderWidth: 0.
( root rawMorphs at: 2 ) filled: false.
( root rawMorphs at: 2 ) frameStyle: 0.
( root rawMorphs at: 2 ) rawColor: paint copyRed: 0.929619 Green: 0.929619  Blue: 0.929619.
( root rawMorphs at: 2 ) baseMinHeight: 10.
( root rawMorphs at: 2 ) baseMinWidth: 10.
( root rawMorphs at: 2 ) depressedColor: paint copyRed: 0.979472 Green: 0.979472  Blue: 0.979472.
( root rawMorphs at: 2 ) isAsynchronous: false.
( root rawMorphs at: 2 ) rawIsGrayedOut: false.
( root rawMorphs at: 2 ) rawState: 'up'.
( root rawMorphs at: 2 ) script: ' | m |
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
( root rawMorphs at: 2 ) script: ' | m |
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
( root rawMorphs at: 2 ) target: nil.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( (root rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) movingOffset: nil.
( (root rawMorphs at: 0) rawMorphs at: 0 ) position: (20)@(0).
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( (root rawMorphs at: 0) rawMorphs at: 0 ) vertexOffsets: (( (-20)@(0) ) & ( (-10)@(14) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( (root rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 1) rawMorphs at: 0 ) movingOffset: nil.
( (root rawMorphs at: 1) rawMorphs at: 0 ) position: (20)@(0).
( (root rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( (root rawMorphs at: 1) rawMorphs at: 0 ) vertexOffsets: (( (-20)@(0) ) & ( (-10)@(14) )) asVector.
] value.

[
" State for: a polygonMorph(type: polygonMorph): "

( (root rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 2) rawMorphs at: 0 ) movingOffset: nil.
( (root rawMorphs at: 2) rawMorphs at: 0 ) position: (20)@(0).
( (root rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( (root rawMorphs at: 2) rawMorphs at: 0 ) vertexOffsets: (( (-20)@(0) ) & ( (-10)@(14) )) asVector.
] value.

root ] value
