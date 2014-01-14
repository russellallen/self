
[
" State for: a frameMorph(type: frameMorph): "

( root ) hResizing: 1.
( root ) rawBox: ((452)@(45)) # ((850)@(621)).
( root ) vResizing: 1.
( root ) baseMinHeight: 10.
( root ) baseMinWidth: 10.
( root ) justification: 0.
( root ) nonLaidOutMorphs: vector.
( root ) borderWidth: 3.
( root ) filled: true.
( root ) frameStyle: 0.
( root ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a labelMorph(type: labelMorph [Tutorial loader]): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) vResizing: 0.
( root rawMorphs at: 0 ) myAscent: 17.
( root rawMorphs at: 0 ) myBox: ((140)@(3)) # ((258)@(25)).
( root rawMorphs at: 0 ) myDescent: 5.
( root rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 18.
( root rawMorphs at: 0 ) myLabel: 'Tutorial loader'.
( root rawMorphs at: 0 ) myPosition: (140)@(20).
( root rawMorphs at: 0 ) myWidth: 118.
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( root rawMorphs at: 1 ) hResizing: 2.
( root rawMorphs at: 1 ) rawBox: ((149)@(25)) # ((249)@(44)).
( root rawMorphs at: 1 ) vResizing: 2.
( root rawMorphs at: 1 ) justification: 0.
( root rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 1 ) borderWidth: 2.
( root rawMorphs at: 1 ) filled: false.
( root rawMorphs at: 1 ) frameStyle: 2.
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 1 ) baseMinHeight: 10.
( root rawMorphs at: 1 ) baseMinWidth: 10.
( root rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( root rawMorphs at: 1 ) isAsynchronous: false.
( root rawMorphs at: 1 ) rawIsGrayedOut: false.
( root rawMorphs at: 1 ) rawState: 'middle'.
( root rawMorphs at: 1 ) script: '  
[ | f |target morphs do: [ | :m |
 (m morphTypeName = labelMorph morphTypeName) ||
 (m morphTypeName = ui2Button  morphTypeName) ifFalse: [
   m morphs last morphs first morphs first deselect.
   m morphs last morphs first morphs first optimize.
   m morphs last morphs first receiver:
   m morphs last morphs first.
  ].
].
f: os_file openForWriting: \'./ui2/tutorial-4.0/tutorialLoader.self\'.
f write: (morphStoreStringBuilder storeStringOf: target IfFail: target raiseError).
f close.   ] value  '.
( root rawMorphs at: 1 ) script: '  
[ | f |target morphs do: [ | :m |
 (m morphTypeName = labelMorph morphTypeName) ||
 (m morphTypeName = ui2Button  morphTypeName) ifFalse: [
   m morphs last morphs first morphs first deselect.
   m morphs last morphs first morphs first optimize.
   m morphs last morphs first receiver:
   m morphs last morphs first.
  ].
].
f: os_file openForWriting: \'./ui2/tutorial-4.0/tutorialLoader.self\'.
f write: (morphStoreStringBuilder storeStringOf: target IfFail: target raiseError).
f close.   ] value  '.
( root rawMorphs at: 1 ) target: ( root rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( root rawMorphs at: 2 ) hResizing: 2.
( root rawMorphs at: 2 ) rawBox: ((168)@(44)) # ((229)@(63)).
( root rawMorphs at: 2 ) vResizing: 2.
( root rawMorphs at: 2 ) justification: 0.
( root rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 2 ) borderWidth: 2.
( root rawMorphs at: 2 ) filled: false.
( root rawMorphs at: 2 ) frameStyle: 0.
( root rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 2 ) baseMinHeight: 10.
( root rawMorphs at: 2 ) baseMinWidth: 10.
( root rawMorphs at: 2 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( root rawMorphs at: 2 ) isAsynchronous: false.
( root rawMorphs at: 2 ) rawIsGrayedOut: false.
( root rawMorphs at: 2 ) rawState: 'up'.
( root rawMorphs at: 2 ) script: '     target addMorphLast: target morphs last copy     '.
( root rawMorphs at: 2 ) script: '     target addMorphLast: target morphs last copy     '.
( root rawMorphs at: 2 ) target: ( root rawMorphs at: 2 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 3 ) hResizing: 1.
( root rawMorphs at: 3 ) rawBox: ((3)@(63)) # ((395)@(93)).
( root rawMorphs at: 3 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 3 ) vResizing: 1.
( root rawMorphs at: 3 ) baseMinHeight: 3.
( root rawMorphs at: 3 ) baseMinWidth: 3.
( root rawMorphs at: 3 ) borderWidth: 5.
( root rawMorphs at: 3 ) justification: 0.
( root rawMorphs at: 3 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 4 ) hResizing: 1.
( root rawMorphs at: 4 ) rawBox: ((3)@(93)) # ((395)@(123)).
( root rawMorphs at: 4 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 4 ) vResizing: 1.
( root rawMorphs at: 4 ) baseMinHeight: 3.
( root rawMorphs at: 4 ) baseMinWidth: 3.
( root rawMorphs at: 4 ) borderWidth: 5.
( root rawMorphs at: 4 ) justification: 0.
( root rawMorphs at: 4 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 5 ) hResizing: 1.
( root rawMorphs at: 5 ) rawBox: ((3)@(123)) # ((395)@(153)).
( root rawMorphs at: 5 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 5 ) vResizing: 1.
( root rawMorphs at: 5 ) baseMinHeight: 3.
( root rawMorphs at: 5 ) baseMinWidth: 3.
( root rawMorphs at: 5 ) borderWidth: 5.
( root rawMorphs at: 5 ) justification: 0.
( root rawMorphs at: 5 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 6 ) hResizing: 1.
( root rawMorphs at: 6 ) rawBox: ((3)@(153)) # ((395)@(183)).
( root rawMorphs at: 6 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 6 ) vResizing: 1.
( root rawMorphs at: 6 ) baseMinHeight: 3.
( root rawMorphs at: 6 ) baseMinWidth: 3.
( root rawMorphs at: 6 ) borderWidth: 5.
( root rawMorphs at: 6 ) justification: 0.
( root rawMorphs at: 6 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 7 ) hResizing: 1.
( root rawMorphs at: 7 ) rawBox: ((3)@(183)) # ((395)@(213)).
( root rawMorphs at: 7 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 7 ) vResizing: 1.
( root rawMorphs at: 7 ) baseMinHeight: 3.
( root rawMorphs at: 7 ) baseMinWidth: 3.
( root rawMorphs at: 7 ) borderWidth: 5.
( root rawMorphs at: 7 ) justification: 0.
( root rawMorphs at: 7 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 8 ) hResizing: 1.
( root rawMorphs at: 8 ) rawBox: ((3)@(213)) # ((395)@(243)).
( root rawMorphs at: 8 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 8 ) vResizing: 1.
( root rawMorphs at: 8 ) baseMinHeight: 3.
( root rawMorphs at: 8 ) baseMinWidth: 3.
( root rawMorphs at: 8 ) borderWidth: 5.
( root rawMorphs at: 8 ) justification: 0.
( root rawMorphs at: 8 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 9 ) hResizing: 1.
( root rawMorphs at: 9 ) rawBox: ((3)@(243)) # ((395)@(273)).
( root rawMorphs at: 9 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 9 ) vResizing: 1.
( root rawMorphs at: 9 ) baseMinHeight: 3.
( root rawMorphs at: 9 ) baseMinWidth: 3.
( root rawMorphs at: 9 ) borderWidth: 5.
( root rawMorphs at: 9 ) justification: 0.
( root rawMorphs at: 9 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 10 ) hResizing: 1.
( root rawMorphs at: 10 ) rawBox: ((3)@(273)) # ((395)@(303)).
( root rawMorphs at: 10 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 10 ) vResizing: 1.
( root rawMorphs at: 10 ) baseMinHeight: 3.
( root rawMorphs at: 10 ) baseMinWidth: 3.
( root rawMorphs at: 10 ) borderWidth: 5.
( root rawMorphs at: 10 ) justification: 0.
( root rawMorphs at: 10 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 11 ) hResizing: 1.
( root rawMorphs at: 11 ) rawBox: ((3)@(303)) # ((395)@(333)).
( root rawMorphs at: 11 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 11 ) vResizing: 1.
( root rawMorphs at: 11 ) baseMinHeight: 3.
( root rawMorphs at: 11 ) baseMinWidth: 3.
( root rawMorphs at: 11 ) borderWidth: 5.
( root rawMorphs at: 11 ) justification: 0.
( root rawMorphs at: 11 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 12 ) hResizing: 1.
( root rawMorphs at: 12 ) rawBox: ((3)@(333)) # ((395)@(363)).
( root rawMorphs at: 12 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 12 ) vResizing: 1.
( root rawMorphs at: 12 ) baseMinHeight: 3.
( root rawMorphs at: 12 ) baseMinWidth: 3.
( root rawMorphs at: 12 ) borderWidth: 5.
( root rawMorphs at: 12 ) justification: 0.
( root rawMorphs at: 12 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 13 ) hResizing: 1.
( root rawMorphs at: 13 ) rawBox: ((3)@(363)) # ((395)@(393)).
( root rawMorphs at: 13 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 13 ) vResizing: 1.
( root rawMorphs at: 13 ) baseMinHeight: 3.
( root rawMorphs at: 13 ) baseMinWidth: 3.
( root rawMorphs at: 13 ) borderWidth: 5.
( root rawMorphs at: 13 ) justification: 0.
( root rawMorphs at: 13 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 14 ) hResizing: 1.
( root rawMorphs at: 14 ) rawBox: ((3)@(393)) # ((395)@(423)).
( root rawMorphs at: 14 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 14 ) vResizing: 1.
( root rawMorphs at: 14 ) baseMinHeight: 3.
( root rawMorphs at: 14 ) baseMinWidth: 3.
( root rawMorphs at: 14 ) borderWidth: 5.
( root rawMorphs at: 14 ) justification: 0.
( root rawMorphs at: 14 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 15 ) hResizing: 1.
( root rawMorphs at: 15 ) rawBox: ((3)@(423)) # ((395)@(453)).
( root rawMorphs at: 15 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 15 ) vResizing: 1.
( root rawMorphs at: 15 ) baseMinHeight: 3.
( root rawMorphs at: 15 ) baseMinWidth: 3.
( root rawMorphs at: 15 ) borderWidth: 5.
( root rawMorphs at: 15 ) justification: 0.
( root rawMorphs at: 15 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 16 ) hResizing: 1.
( root rawMorphs at: 16 ) rawBox: ((3)@(453)) # ((395)@(483)).
( root rawMorphs at: 16 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 16 ) vResizing: 1.
( root rawMorphs at: 16 ) baseMinHeight: 3.
( root rawMorphs at: 16 ) baseMinWidth: 3.
( root rawMorphs at: 16 ) borderWidth: 5.
( root rawMorphs at: 16 ) justification: 0.
( root rawMorphs at: 16 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 17 ) hResizing: 1.
( root rawMorphs at: 17 ) rawBox: ((3)@(483)) # ((395)@(513)).
( root rawMorphs at: 17 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 17 ) vResizing: 1.
( root rawMorphs at: 17 ) baseMinHeight: 3.
( root rawMorphs at: 17 ) baseMinWidth: 3.
( root rawMorphs at: 17 ) borderWidth: 5.
( root rawMorphs at: 17 ) justification: 0.
( root rawMorphs at: 17 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 18 ) hResizing: 1.
( root rawMorphs at: 18 ) rawBox: ((3)@(513)) # ((395)@(543)).
( root rawMorphs at: 18 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 18 ) vResizing: 1.
( root rawMorphs at: 18 ) baseMinHeight: 3.
( root rawMorphs at: 18 ) baseMinWidth: 3.
( root rawMorphs at: 18 ) borderWidth: 5.
( root rawMorphs at: 18 ) justification: 0.
( root rawMorphs at: 18 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 19 ) hResizing: 1.
( root rawMorphs at: 19 ) rawBox: ((3)@(543)) # ((395)@(573)).
( root rawMorphs at: 19 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( root rawMorphs at: 19 ) vResizing: 1.
( root rawMorphs at: 19 ) baseMinHeight: 3.
( root rawMorphs at: 19 ) baseMinWidth: 3.
( root rawMorphs at: 19 ) borderWidth: 5.
( root rawMorphs at: 19 ) justification: 0.
( root rawMorphs at: 19 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a labelMorph(type: labelMorph [save this morph]): "

( (root rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((98)@(17)).
( (root rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'save this morph'.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( (root rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 96.
( (root rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [Add field]): "

( (root rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 2) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 2) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((59)@(17)).
( (root rawMorphs at: 2) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 2) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (root rawMorphs at: 2) rawMorphs at: 0 ) myLabel: 'Add field'.
( (root rawMorphs at: 2) rawMorphs at: 0 ) myPosition: (2)@(14).
( (root rawMorphs at: 2) rawMorphs at: 0 ) myWidth: 57.
( (root rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 3) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 3) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 3) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 3) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 3) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 3) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 3) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 3) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 3) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 3) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 3) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 3) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 3) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 3) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 3) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 3) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 3) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 3) rawMorphs at: 0 ) target: ( (root rawMorphs at: 3) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 3) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 3) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 3) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 3) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 3) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 3) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 3) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 3) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 3) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 3) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 3) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 3) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 3) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 3) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 3) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 3) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 3) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 3) rawMorphs at: 1 ) target: ( (root rawMorphs at: 3) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 3) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 3) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((299)@(25)).
( (root rawMorphs at: 3) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 3) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 3) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 3) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 3) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 3) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 3) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 3) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 3) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 4) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 4) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 4) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 4) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 4) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 4) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 4) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 4) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 4) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 4) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 4) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 4) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 4) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 4) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 4) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 4) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 4) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 4) rawMorphs at: 0 ) target: ( (root rawMorphs at: 4) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 4) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 4) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 4) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 4) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 4) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 4) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 4) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 4) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 4) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 4) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 4) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 4) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 4) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 4) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 4) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 4) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 4) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 4) rawMorphs at: 1 ) target: ( (root rawMorphs at: 4) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 4) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 4) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((278)@(25)).
( (root rawMorphs at: 4) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 4) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 4) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 4) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 4) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 4) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 4) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 4) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 4) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 5) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 5) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 5) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 5) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 5) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 5) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 5) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 5) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 5) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 5) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 5) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 5) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 5) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 5) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 5) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 5) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 5) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 5) rawMorphs at: 0 ) target: ( (root rawMorphs at: 5) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 5) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 5) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 5) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 5) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 5) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 5) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 5) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 5) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 5) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 5) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 5) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 5) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 5) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 5) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 5) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 5) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 5) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 5) rawMorphs at: 1 ) target: ( (root rawMorphs at: 5) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 5) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 5) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((289)@(25)).
( (root rawMorphs at: 5) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 5) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 5) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 5) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 5) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 5) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 5) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 5) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 5) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 6) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 6) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 6) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 6) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 6) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 6) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 6) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 6) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 6) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 6) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 6) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 6) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 6) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 6) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 6) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 6) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 6) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 6) rawMorphs at: 0 ) target: ( (root rawMorphs at: 6) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 6) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 6) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 6) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 6) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 6) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 6) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 6) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 6) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 6) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 6) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 6) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 6) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 6) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 6) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 6) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 6) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 6) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 6) rawMorphs at: 1 ) target: ( (root rawMorphs at: 6) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 6) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 6) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((253)@(25)).
( (root rawMorphs at: 6) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 6) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 6) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 6) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 6) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 6) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 6) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 6) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 6) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 7) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 7) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 7) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 7) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 7) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 7) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 7) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 7) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 7) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 7) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 7) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 7) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 7) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 7) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 7) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 7) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 7) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 7) rawMorphs at: 0 ) target: ( (root rawMorphs at: 7) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 7) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 7) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 7) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 7) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 7) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 7) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 7) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 7) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 7) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 7) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 7) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 7) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 7) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 7) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 7) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 7) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 7) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 7) rawMorphs at: 1 ) target: ( (root rawMorphs at: 7) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 7) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 7) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((290)@(25)).
( (root rawMorphs at: 7) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 7) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 7) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 7) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 7) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 7) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 7) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 7) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 7) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 8) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 8) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 8) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 8) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 8) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 8) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 8) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 8) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 8) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 8) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 8) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 8) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 8) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 8) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 8) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 8) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 8) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 8) rawMorphs at: 0 ) target: ( (root rawMorphs at: 8) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 8) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 8) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 8) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 8) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 8) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 8) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 8) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 8) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 8) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 8) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 8) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 8) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 8) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 8) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 8) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 8) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 8) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 8) rawMorphs at: 1 ) target: ( (root rawMorphs at: 8) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 8) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 8) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((325)@(25)).
( (root rawMorphs at: 8) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 8) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 8) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 8) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 8) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 8) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 8) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 8) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 8) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 9) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 9) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 9) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 9) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 9) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 9) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 9) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 9) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 9) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 9) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 9) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 9) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 9) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 9) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 9) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 9) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 9) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 9) rawMorphs at: 0 ) target: ( (root rawMorphs at: 9) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 9) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 9) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 9) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 9) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 9) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 9) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 9) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 9) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 9) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 9) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 9) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 9) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 9) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 9) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 9) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 9) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 9) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 9) rawMorphs at: 1 ) target: ( (root rawMorphs at: 9) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 9) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 9) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((325)@(25)).
( (root rawMorphs at: 9) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 9) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 9) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 9) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 9) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 9) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 9) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 9) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 9) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 10) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 10) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 10) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 10) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 10) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 10) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 10) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 10) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 10) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 10) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 10) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 10) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 10) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 10) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 10) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 10) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 10) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 10) rawMorphs at: 0 ) target: ( (root rawMorphs at: 10) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 10) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 10) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 10) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 10) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 10) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 10) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 10) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 10) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 10) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 10) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 10) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 10) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 10) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 10) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 10) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 10) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 10) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 10) rawMorphs at: 1 ) target: ( (root rawMorphs at: 10) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 10) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 10) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((297)@(25)).
( (root rawMorphs at: 10) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 10) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 10) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 10) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 10) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 10) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 10) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 10) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 10) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 11) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 11) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 11) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 11) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 11) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 11) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 11) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 11) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 11) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 11) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 11) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 11) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 11) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 11) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 11) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 11) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 11) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 11) rawMorphs at: 0 ) target: ( (root rawMorphs at: 11) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 11) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 11) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 11) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 11) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 11) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 11) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 11) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 11) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 11) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 11) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 11) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 11) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 11) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 11) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 11) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 11) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 11) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 11) rawMorphs at: 1 ) target: ( (root rawMorphs at: 11) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 11) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 11) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((297)@(25)).
( (root rawMorphs at: 11) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 11) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 11) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 11) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 11) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 11) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 11) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 11) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 11) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 12) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 12) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 12) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 12) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 12) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 12) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 12) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 12) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 12) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 12) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 12) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 12) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 12) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 12) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 12) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 12) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 12) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 12) rawMorphs at: 0 ) target: ( (root rawMorphs at: 12) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 12) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 12) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 12) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 12) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 12) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 12) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 12) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 12) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 12) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 12) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 12) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 12) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 12) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 12) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 12) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 12) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 12) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 12) rawMorphs at: 1 ) target: ( (root rawMorphs at: 12) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 12) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 12) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((297)@(25)).
( (root rawMorphs at: 12) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 12) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 12) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 12) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 12) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 12) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 12) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 12) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 12) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 13) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 13) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 13) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 13) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 13) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 13) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 13) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 13) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 13) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 13) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 13) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 13) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 13) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 13) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 13) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 13) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 13) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 13) rawMorphs at: 0 ) target: ( (root rawMorphs at: 13) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 13) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 13) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 13) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 13) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 13) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 13) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 13) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 13) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 13) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 13) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 13) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 13) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 13) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 13) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 13) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 13) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 13) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 13) rawMorphs at: 1 ) target: ( (root rawMorphs at: 13) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 13) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 13) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((283)@(25)).
( (root rawMorphs at: 13) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 13) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 13) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 13) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 13) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 13) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 13) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 13) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 13) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 14) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 14) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 14) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 14) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 14) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 14) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 14) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 14) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 14) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 14) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 14) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 14) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 14) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 14) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 14) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 14) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 14) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 14) rawMorphs at: 0 ) target: ( (root rawMorphs at: 14) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 14) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 14) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 14) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 14) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 14) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 14) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 14) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 14) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 14) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 14) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 14) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 14) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 14) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 14) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 14) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 14) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 14) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 14) rawMorphs at: 1 ) target: ( (root rawMorphs at: 14) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 14) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 14) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((356)@(25)).
( (root rawMorphs at: 14) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 14) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 14) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 14) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 14) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 14) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 14) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 14) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 14) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 15) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 15) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 15) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 15) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 15) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 15) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 15) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 15) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 15) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 15) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 15) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 15) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 15) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 15) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 15) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 15) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 15) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 15) rawMorphs at: 0 ) target: ( (root rawMorphs at: 15) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 15) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 15) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 15) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 15) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 15) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 15) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 15) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 15) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 15) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 15) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 15) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 15) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 15) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 15) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 15) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 15) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 15) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 15) rawMorphs at: 1 ) target: ( (root rawMorphs at: 15) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 15) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 15) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((297)@(25)).
( (root rawMorphs at: 15) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 15) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 15) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 15) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 15) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 15) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 15) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 15) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 15) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 16) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 16) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 16) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 16) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 16) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 16) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 16) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 16) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 16) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 16) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 16) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 16) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 16) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 16) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 16) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 16) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 16) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 16) rawMorphs at: 0 ) target: ( (root rawMorphs at: 16) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 16) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 16) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 16) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 16) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 16) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 16) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 16) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 16) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 16) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 16) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 16) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 16) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 16) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 16) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 16) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 16) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 16) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 16) rawMorphs at: 1 ) target: ( (root rawMorphs at: 16) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 16) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 16) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((334)@(25)).
( (root rawMorphs at: 16) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 16) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 16) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 16) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 16) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 16) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 16) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 16) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 16) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 17) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 17) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 17) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 17) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 17) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 17) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 17) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 17) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 17) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 17) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 17) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 17) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 17) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 17) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 17) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 17) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 17) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 17) rawMorphs at: 0 ) target: ( (root rawMorphs at: 17) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 17) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 17) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 17) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 17) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 17) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 17) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 17) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 17) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 17) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 17) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 17) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 17) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 17) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 17) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 17) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 17) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 17) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 17) rawMorphs at: 1 ) target: ( (root rawMorphs at: 17) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 17) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 17) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((266)@(25)).
( (root rawMorphs at: 17) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 17) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 17) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 17) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 17) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 17) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 17) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 17) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 17) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 18) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 18) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 18) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 18) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 18) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 18) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 18) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 18) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 18) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 18) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 18) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 18) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 18) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 18) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 18) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 18) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 18) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 18) rawMorphs at: 0 ) target: ( (root rawMorphs at: 18) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 18) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 18) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 18) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 18) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 18) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 18) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 18) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 18) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 18) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 18) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 18) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 18) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 18) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 18) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 18) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 18) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 18) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 18) rawMorphs at: 1 ) target: ( (root rawMorphs at: 18) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 18) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 18) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((387)@(25)).
( (root rawMorphs at: 18) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 18) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 18) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 18) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 18) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 18) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 18) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 18) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 18) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 19) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 19) rawMorphs at: 0 ) rawBox: ((5)@(6)) # ((68)@(24)).
( (root rawMorphs at: 19) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 19) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 19) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 19) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 19) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 19) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 19) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 19) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 19) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 19) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 19) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 19) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 19) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 19) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 19) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 19) rawMorphs at: 0 ) target: ( (root rawMorphs at: 19) rawMorphs at: 0 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 19) rawMorphs at: 1 ) hResizing: 2.
( (root rawMorphs at: 19) rawMorphs at: 1 ) rawBox: ((68)@(5)) # ((102)@(24)).
( (root rawMorphs at: 19) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 19) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 19) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 19) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 19) rawMorphs at: 1 ) filled: false.
( (root rawMorphs at: 19) rawMorphs at: 1 ) frameStyle: 0.
( (root rawMorphs at: 19) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (root rawMorphs at: 19) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 19) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 19) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.886608  Blue: 0.865103.
( (root rawMorphs at: 19) rawMorphs at: 1 ) isAsynchronous: false.
( (root rawMorphs at: 19) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (root rawMorphs at: 19) rawMorphs at: 1 ) rawState: 'up'.
( (root rawMorphs at: 19) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 19) rawMorphs at: 1 ) script: '     
 [ | fName . f . expr |
 fName: (target morphs last  morphs first contentsString ).
 fName: fName copyFrom: 0 UpTo: fName size - 1. 
 f: os_file openForReading: fName .
 expr: f contents.
 f close.
 morphStoreStringBuilder lastFileName: fName.
 button world safelyDo: [ button world addMorph: expr eval].
 self. ] value     '.
( (root rawMorphs at: 19) rawMorphs at: 1 ) target: ( (root rawMorphs at: 19) rawMorphs at: 1 ) buttonArgs: (list copyRemoveAll).] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 19) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 19) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((305)@(25)).
( (root rawMorphs at: 19) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 19) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 19) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 19) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 19) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 19) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 19) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 19) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 19) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 3) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 3) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 3) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 3) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 3) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 3) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 3) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 3) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 3) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 3) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((195)@(18)).
( ((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 4) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 4) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 4) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 4) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 4) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 4) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 4) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 4) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 4) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 4) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((174)@(18)).
( ((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((185)@(18)).
( ((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 6) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 6) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 6) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 6) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 6) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 6) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 6) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 6) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 6) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 6) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((149)@(18)).
( ((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 7) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 7) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 7) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 7) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 7) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 7) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 7) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 7) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 7) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 7) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((186)@(18)).
( ((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 8) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 8) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 8) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 8) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 8) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 8) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 8) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 8) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 8) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 8) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((221)@(18)).
( ((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 9) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 9) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 9) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 9) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 9) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 9) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 9) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 9) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 9) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 9) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((221)@(18)).
( ((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 10) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 10) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 10) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 10) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 10) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 10) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 10) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 10) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 10) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 10) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((193)@(18)).
( ((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 11) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 11) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 11) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 11) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 11) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 11) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 11) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 11) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 11) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 11) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((193)@(18)).
( ((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 12) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 12) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 12) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 12) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 12) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 12) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 12) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 12) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 12) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 12) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 12) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 12) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 12) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 12) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 12) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 12) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 12) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 12) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 12) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 12) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((193)@(18)).
( ((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 13) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 13) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 13) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 13) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 13) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 13) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 13) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 13) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 13) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 13) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 13) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 13) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 13) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 13) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 13) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 13) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 13) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 13) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 13) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 13) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((179)@(18)).
( ((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 14) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 14) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 14) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 14) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 14) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 14) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 14) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 14) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 14) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 14) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((252)@(18)).
( ((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 15) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 15) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 15) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 15) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 15) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 15) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 15) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 15) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 15) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 15) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 15) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 15) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 15) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 15) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 15) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 15) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 15) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 15) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 15) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 15) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((193)@(18)).
( ((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 16) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 16) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 16) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 16) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 16) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 16) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 16) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 16) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 16) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 16) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 16) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 16) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 16) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 16) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 16) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 16) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 16) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 16) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 16) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 16) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((230)@(18)).
( ((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 17) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 17) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 17) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 17) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 17) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 17) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 17) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 17) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 17) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 17) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 17) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 17) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 17) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 17) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 17) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 17) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 17) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 17) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 17) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 17) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((162)@(18)).
( ((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 18) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 18) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 18) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 18) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 18) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 18) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 18) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 18) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 18) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 18) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 18) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 18) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 18) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 18) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 18) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 18) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 18) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 18) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 18) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 18) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((283)@(18)).
( ((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 19) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 19) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 19) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 19) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 19) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 19) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
( ((root rawMorphs at: 19) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'remove field'.
( ((root rawMorphs at: 19) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 19) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 59.
( ((root rawMorphs at: 19) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [load ]): "

( ((root rawMorphs at: 19) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 19) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 19) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 19) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((32)@(17)).
( ((root rawMorphs at: 19) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 19) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 19) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'load ' copyMutable.
( ((root rawMorphs at: 19) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 19) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 30.
( ((root rawMorphs at: 19) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0 ) justification: -1.
( ((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((201)@(18)).
( ((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( ((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((192)@(15)).
( (((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((171)@(15)).
( (((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((182)@(15)).
( (((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((146)@(15)).
( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((183)@(15)).
( (((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((218)@(15)).
( (((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((218)@(15)).
( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((190)@(15)).
( (((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((190)@(15)).
( (((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((190)@(15)).
( (((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((176)@(15)).
( (((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((249)@(15)).
( (((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((190)@(15)).
( (((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((227)@(15)).
( (((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((159)@(15)).
( (((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((280)@(15)).
( (((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( (((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((198)@(15)).
( (((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.836755  Blue: 0.816227.
( (((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/greetingBanner.self ]): "

( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((190)@(14)).
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/greetingBanner.self ' copyMutable.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 190.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((190)@(0)) # ((191)@(14)).
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/labelMaker]): "

( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((146)@(14)).
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/labelMaker' copyMutable.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 146.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((146)@(0)) # ((147)@(14)).
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((147)@(0)) # ((170)@(14)).
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (147)@(11).
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/centralScreen]): "

( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((157)@(14)).
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/centralScreen' copyMutable.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 157.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((157)@(0)) # ((158)@(14)).
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((158)@(0)) # ((181)@(14)).
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (158)@(11).
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/mouse]): "

( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((121)@(14)).
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/mouse' copyMutable.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 121.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((121)@(0)) # ((122)@(14)).
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((122)@(0)) # ((145)@(14)).
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (122)@(11).
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/carpetZapper]): "

( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((158)@(14)).
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/carpetZapper' copyMutable.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 158.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((158)@(0)) # ((159)@(14)).
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((159)@(0)) # ((182)@(14)).
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (159)@(11).
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/DirectConstruction1]): "

( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((193)@(14)).
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/DirectConstruction1' copyMutable.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 193.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((193)@(0)) # ((194)@(14)).
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((194)@(0)) # ((217)@(14)).
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (194)@(11).
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/DirectConstruction2]): "

( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((193)@(14)).
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/DirectConstruction2' copyMutable.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 193.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((193)@(0)) # ((194)@(14)).
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((194)@(0)) # ((217)@(14)).
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (194)@(11).
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/programming1]): "

( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((165)@(14)).
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/programming1' copyMutable.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 165.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((165)@(0)) # ((166)@(14)).
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((166)@(0)) # ((189)@(14)).
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (166)@(11).
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 10) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/programming2]): "

( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((165)@(14)).
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/programming2' copyMutable.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 165.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((165)@(0)) # ((166)@(14)).
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((166)@(0)) # ((189)@(14)).
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (166)@(11).
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 11) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/programming3]): "

( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((165)@(14)).
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/programming3' copyMutable.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 165.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((165)@(0)) # ((166)@(14)).
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((166)@(0)) # ((189)@(14)).
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (166)@(11).
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 12) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/mouseLinks]): "

( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((151)@(14)).
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/mouseLinks' copyMutable.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 151.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((151)@(0)) # ((152)@(14)).
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((152)@(0)) # ((175)@(14)).
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (152)@(11).
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 13) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/DirectConstructionLink12]): "

( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((224)@(14)).
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/DirectConstructionLink12' copyMutable.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 224.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((224)@(0)) # ((225)@(14)).
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((225)@(0)) # ((248)@(14)).
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (225)@(11).
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 14) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/FinalChallenge]): "

( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((165)@(14)).
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/FinalChallenge' copyMutable.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 165.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((165)@(0)) # ((166)@(14)).
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((166)@(0)) # ((189)@(14)).
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (166)@(11).
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 15) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/p]): "

( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((95)@(14)).
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/p' copyMutable.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 95.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((95)@(0)) # ((96)@(14)).
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [rogToChallengeLink.self ]): "

( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((96)@(0)) # ((226)@(14)).
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: 'rogToChallengeLink.self ' copyMutable.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (96)@(11).
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 130.
( ((((root rawMorphs at: 16) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/FinalTag]): "

( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((134)@(14)).
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/FinalTag' copyMutable.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 134.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((134)@(0)) # ((135)@(14)).
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((135)@(0)) # ((158)@(14)).
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (135)@(11).
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 17) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/DirectConstructionTagAndLink]): "

( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((255)@(14)).
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/DirectConstructionTagAndLink' copyMutable.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 255.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((255)@(0)) # ((256)@(14)).
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((256)@(0)) # ((279)@(14)).
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (256)@(11).
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 18) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/TutorialLoader2]): "

( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((173)@(14)).
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/TutorialLoader2' copyMutable.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 173.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((173)@(0)) # ((174)@(14)).
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((174)@(0)) # ((197)@(14)).
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (174)@(11).
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 19) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.
