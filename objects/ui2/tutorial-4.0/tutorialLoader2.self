"$Revision: 1.1 $"
[ | root |
root: frameMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & rowMorph copyRemoveAllMorphs & rowMorph copyRemoveAllMorphs & rowMorph copyRemoveAllMorphs & rowMorph copyRemoveAllMorphs & rowMorph copyRemoveAllMorphs & rowMorph copyRemoveAllMorphs & rowMorph copyRemoveAllMorphs ) asList.
[
( root rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 2 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 3 ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs ) asList.
[
( (root rawMorphs at: 3) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (root rawMorphs at: 3) rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (root rawMorphs at: 3) rawMorphs at: 2 )addMorph: editorMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0 )addMorph: editorRowMorph copyRemoveAllMorphs.
[
( (((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & caretMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

] value.

] value.

] value.

[
( root rawMorphs at: 4 ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs ) asList.
[
( (root rawMorphs at: 4) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (root rawMorphs at: 4) rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (root rawMorphs at: 4) rawMorphs at: 2 )addMorph: editorMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0 )addMorph: editorRowMorph copyRemoveAllMorphs.
[
( (((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & caretMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

] value.

] value.

] value.

[
( root rawMorphs at: 5 ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs ) asList.
[
( (root rawMorphs at: 5) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (root rawMorphs at: 5) rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (root rawMorphs at: 5) rawMorphs at: 2 )addMorph: editorMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0 )addMorph: editorRowMorph copyRemoveAllMorphs.
[
( (((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & caretMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

] value.

] value.

] value.

[
( root rawMorphs at: 6 ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs ) asList.
[
( (root rawMorphs at: 6) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (root rawMorphs at: 6) rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (root rawMorphs at: 6) rawMorphs at: 2 )addMorph: editorMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0 )addMorph: editorRowMorph copyRemoveAllMorphs.
[
( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) addAllMorphs: ( caretMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

] value.

] value.

] value.

[
( root rawMorphs at: 7 ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs ) asList.
[
( (root rawMorphs at: 7) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (root rawMorphs at: 7) rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (root rawMorphs at: 7) rawMorphs at: 2 )addMorph: editorMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0 )addMorph: editorRowMorph copyRemoveAllMorphs.
[
( (((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & caretMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

] value.

] value.

] value.

[
( root rawMorphs at: 8 ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs ) asList.
[
( (root rawMorphs at: 8) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (root rawMorphs at: 8) rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (root rawMorphs at: 8) rawMorphs at: 2 )addMorph: editorMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0 )addMorph: editorRowMorph copyRemoveAllMorphs.
[
( (((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & caretMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

] value.

] value.

] value.

[
( root rawMorphs at: 9 ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs ) asList.
[
( (root rawMorphs at: 9) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (root rawMorphs at: 9) rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (root rawMorphs at: 9) rawMorphs at: 2 )addMorph: editorMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0 )addMorph: editorRowMorph copyRemoveAllMorphs.
[
( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & caretMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

] value.

] value.

] value.

] value.

"end of skeleton"

[
" State for: a frameMorph(type: frameMorph): "

( root ) hResizing: 1.
( root ) rawBox: ((1468)@(-1218)) # ((1859)@(-942)).
( root ) vResizing: 1.
( root ) baseMinHeight: 10.
( root ) baseMinWidth: 10.
( root ) justification: 0.
( root ) nonLaidOutMorphs: vector.
( root ) borderWidth: 3.
( root ) filled: true.
( root ) frameStyle: 0.
( root ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
] value.

[
" State for: a labelMorph(type: labelMorph [Tutorial loader 2]): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) vResizing: 0.
( root rawMorphs at: 0 ) myAscent: 17.
( root rawMorphs at: 0 ) myBox: ((129)@(3)) # ((261)@(25)).
( root rawMorphs at: 0 ) myDescent: 5.
( root rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 18.
( root rawMorphs at: 0 ) myLabel: 'Tutorial loader 2' copyMutable.
( root rawMorphs at: 0 ) myPosition: (129)@(20).
( root rawMorphs at: 0 ) myWidth: 132.
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( root rawMorphs at: 1 ) hResizing: 2.
( root rawMorphs at: 1 ) rawBox: ((145)@(25)) # ((245)@(44)).
( root rawMorphs at: 1 ) vResizing: 2.
( root rawMorphs at: 1 ) justification: 0.
( root rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 1 ) borderWidth: 2.
( root rawMorphs at: 1 ) filled: false.
( root rawMorphs at: 1 ) frameStyle: 2.
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( root rawMorphs at: 1 ) baseMinHeight: 10.
( root rawMorphs at: 1 ) baseMinWidth: 10.
( root rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
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
f: os_file openForWriting: \'./ui2/tutorial-4.0/tutorialLoader2.self\'.
f write: (morphStoreStringBuilder storeStringOf: target IfFail: target raiseError).
f close.   ] value  ' copyMutable.
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
f: os_file openForWriting: \'./ui2/tutorial-4.0/tutorialLoader2.self\'.
f write: (morphStoreStringBuilder storeStringOf: target IfFail: target raiseError).
f close.   ] value  ' copyMutable.
( root rawMorphs at: 1 ) target: root.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( root rawMorphs at: 2 ) hResizing: 2.
( root rawMorphs at: 2 ) rawBox: ((165)@(44)) # ((226)@(63)).
( root rawMorphs at: 2 ) vResizing: 2.
( root rawMorphs at: 2 ) justification: 0.
( root rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 2 ) borderWidth: 2.
( root rawMorphs at: 2 ) filled: false.
( root rawMorphs at: 2 ) frameStyle: 0.
( root rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( root rawMorphs at: 2 ) baseMinHeight: 10.
( root rawMorphs at: 2 ) baseMinWidth: 10.
( root rawMorphs at: 2 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
( root rawMorphs at: 2 ) isAsynchronous: false.
( root rawMorphs at: 2 ) rawIsGrayedOut: false.
( root rawMorphs at: 2 ) rawState: 'up'.
( root rawMorphs at: 2 ) script: '     target addMorphLast: target morphs last copy     '.
( root rawMorphs at: 2 ) script: '     target addMorphLast: target morphs last copy     '.
( root rawMorphs at: 2 ) target: root.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( root rawMorphs at: 3 ) hResizing: 1.
( root rawMorphs at: 3 ) rawBox: ((3)@(63)) # ((388)@(93)).
( root rawMorphs at: 3 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( root rawMorphs at: 4 ) rawBox: ((3)@(93)) # ((388)@(123)).
( root rawMorphs at: 4 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( root rawMorphs at: 5 ) rawBox: ((3)@(123)) # ((388)@(153)).
( root rawMorphs at: 5 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( root rawMorphs at: 6 ) rawBox: ((3)@(153)) # ((388)@(183)).
( root rawMorphs at: 6 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( root rawMorphs at: 7 ) rawBox: ((3)@(183)) # ((388)@(213)).
( root rawMorphs at: 7 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( root rawMorphs at: 8 ) rawBox: ((3)@(213)) # ((388)@(243)).
( root rawMorphs at: 8 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( root rawMorphs at: 9 ) rawBox: ((3)@(243)) # ((388)@(273)).
( root rawMorphs at: 9 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( root rawMorphs at: 9 ) vResizing: 1.
( root rawMorphs at: 9 ) baseMinHeight: 3.
( root rawMorphs at: 9 ) baseMinWidth: 3.
( root rawMorphs at: 9 ) borderWidth: 5.
( root rawMorphs at: 9 ) justification: 0.
( root rawMorphs at: 9 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a labelMorph(type: labelMorph [save this morph]): "

( (root rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((98)@(17)).
( (root rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 14.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'save this morph' copyMutable.
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
( (root rawMorphs at: 2) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 14.
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
( (root rawMorphs at: 3) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (root rawMorphs at: 3) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 3) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 3) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
( (root rawMorphs at: 3) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 3) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 3) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 3) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 3) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 3) rawMorphs at: 0 ) target: root rawMorphs at: 3.
] value.

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
( (root rawMorphs at: 3) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (root rawMorphs at: 3) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 3) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 3) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
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
( (root rawMorphs at: 3) rawMorphs at: 1 ) target: root rawMorphs at: 3.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 3) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 3) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((380)@(25)).
( (root rawMorphs at: 3) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 3) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 3) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 3) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 3) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 3) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 3) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 3) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 3) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( (root rawMorphs at: 4) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (root rawMorphs at: 4) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 4) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 4) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
( (root rawMorphs at: 4) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 4) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 4) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 4) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 4) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 4) rawMorphs at: 0 ) target: root rawMorphs at: 4.
] value.

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
( (root rawMorphs at: 4) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (root rawMorphs at: 4) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 4) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 4) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
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
( (root rawMorphs at: 4) rawMorphs at: 1 ) target: root rawMorphs at: 4.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 4) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 4) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((277)@(25)).
( (root rawMorphs at: 4) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 4) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 4) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 4) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 4) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 4) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 4) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 4) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 4) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( (root rawMorphs at: 5) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (root rawMorphs at: 5) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 5) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 5) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
( (root rawMorphs at: 5) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 5) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 5) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 5) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 5) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 5) rawMorphs at: 0 ) target: root rawMorphs at: 5.
] value.

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
( (root rawMorphs at: 5) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (root rawMorphs at: 5) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 5) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 5) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
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
( (root rawMorphs at: 5) rawMorphs at: 1 ) target: root rawMorphs at: 5.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 5) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 5) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((303)@(25)).
( (root rawMorphs at: 5) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 5) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 5) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 5) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 5) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 5) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 5) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 5) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 5) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( (root rawMorphs at: 6) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (root rawMorphs at: 6) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 6) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 6) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
( (root rawMorphs at: 6) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 6) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 6) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 6) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 6) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 6) rawMorphs at: 0 ) target: root rawMorphs at: 6.
] value.

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
( (root rawMorphs at: 6) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (root rawMorphs at: 6) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 6) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 6) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
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
( (root rawMorphs at: 6) rawMorphs at: 1 ) target: root rawMorphs at: 6.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 6) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 6) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((329)@(25)).
( (root rawMorphs at: 6) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 6) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 6) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 6) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 6) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 6) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 6) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 6) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 6) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( (root rawMorphs at: 7) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (root rawMorphs at: 7) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 7) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 7) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
( (root rawMorphs at: 7) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 7) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 7) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 7) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 7) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 7) rawMorphs at: 0 ) target: root rawMorphs at: 7.
] value.

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
( (root rawMorphs at: 7) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (root rawMorphs at: 7) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 7) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 7) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
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
( (root rawMorphs at: 7) rawMorphs at: 1 ) target: root rawMorphs at: 7.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 7) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 7) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((299)@(25)).
( (root rawMorphs at: 7) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 7) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 7) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 7) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 7) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 7) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 7) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 7) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 7) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( (root rawMorphs at: 8) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (root rawMorphs at: 8) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 8) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 8) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
( (root rawMorphs at: 8) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 8) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 8) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 8) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 8) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 8) rawMorphs at: 0 ) target: root rawMorphs at: 8.
] value.

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
( (root rawMorphs at: 8) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (root rawMorphs at: 8) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 8) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 8) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
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
( (root rawMorphs at: 8) rawMorphs at: 1 ) target: root rawMorphs at: 8.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 8) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 8) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((297)@(25)).
( (root rawMorphs at: 8) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 8) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 8) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 8) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 8) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 8) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 8) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 8) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 8) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( (root rawMorphs at: 9) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (root rawMorphs at: 9) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 9) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 9) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
( (root rawMorphs at: 9) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 9) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 9) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 9) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 9) rawMorphs at: 0 ) script: '    target delete    '.
( (root rawMorphs at: 9) rawMorphs at: 0 ) target: root rawMorphs at: 9.
] value.

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
( (root rawMorphs at: 9) rawMorphs at: 1 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (root rawMorphs at: 9) rawMorphs at: 1 ) baseMinHeight: 10.
( (root rawMorphs at: 9) rawMorphs at: 1 ) baseMinWidth: 10.
( (root rawMorphs at: 9) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.810362 Green: 0.872923  Blue: 0.886608.
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
( (root rawMorphs at: 9) rawMorphs at: 1 ) target: root rawMorphs at: 9.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 9) rawMorphs at: 2 ) hResizing: 2.
( (root rawMorphs at: 9) rawMorphs at: 2 ) rawBox: ((102)@(5)) # ((314)@(25)).
( (root rawMorphs at: 9) rawMorphs at: 2 ) vResizing: 2.
( (root rawMorphs at: 9) rawMorphs at: 2 ) baseMinHeight: 3.
( (root rawMorphs at: 9) rawMorphs at: 2 ) baseMinWidth: 3.
( (root rawMorphs at: 9) rawMorphs at: 2 ) justification: 0.
( (root rawMorphs at: 9) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 9) rawMorphs at: 2 ) borderWidth: 2.
( (root rawMorphs at: 9) rawMorphs at: 2 ) filled: true.
( (root rawMorphs at: 9) rawMorphs at: 2 ) frameStyle: 1.
( (root rawMorphs at: 9) rawMorphs at: 2 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 3) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Size: 12.
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
( ((root rawMorphs at: 3) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 14.
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
( ((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((276)@(18)).
( ((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( ((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 4) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Size: 12.
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
( ((root rawMorphs at: 4) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 14.
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
( ((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((173)@(18)).
( ((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( ((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Size: 12.
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
( ((root rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 14.
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
( ((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((199)@(18)).
( ((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( ((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Size: 12.
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
( ((root rawMorphs at: 6) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 14.
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
( ((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((225)@(18)).
( ((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( ((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 7) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Size: 12.
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
( ((root rawMorphs at: 7) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 14.
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
( ((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((195)@(18)).
( ((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( ((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 8) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Size: 12.
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
( ((root rawMorphs at: 8) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 14.
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
( ((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((193)@(18)).
( ((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( ((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
] value.

[
" State for: a labelMorph(type: labelMorph [remove field]): "

( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((61)@(16)).
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 9) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Size: 12.
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
( ((root rawMorphs at: 9) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 14.
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
( ((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((210)@(18)).
( ((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( ((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0 ) rawEditMode: true.
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
( (((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((273)@(15)).
( (((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( (((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((170)@(15)).
( (((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( (((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((196)@(15)).
( (((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((222)@(15)).
( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0.
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
( (((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((192)@(15)).
( (((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( (((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((190)@(15)).
( (((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
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
( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((207)@(15)).
( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.764418 Green: 0.824047  Blue: 0.836755.
( (((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/web-ST-ObjectModule-Links]): "

( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((248)@(14)).
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/web-ST-ObjectModule-Links' copyMutable.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 248.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((248)@(0)) # ((249)@(14)).
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((249)@(0)) # ((272)@(14)).
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (249)@(11).
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 3) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/webButton]): "

( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((145)@(14)).
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/webButton' copyMutable.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 145.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((145)@(0)) # ((146)@(14)).
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((146)@(0)) # ((169)@(14)).
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (146)@(11).
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 4) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/smalltal]): "

( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((128)@(14)).
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/smalltal' copyMutable.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 128.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((128)@(0)) # ((129)@(14)).
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [kButton.self ]): "

( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((129)@(0)) # ((195)@(14)).
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: 'kButton.self ' copyMutable.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (129)@(11).
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 66.
( ((((root rawMorphs at: 5) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((1)@(14)).
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/previousNextButtons.self ]): "

( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 0.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) myAscent: 11.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) myBox: ((1)@(0)) # ((221)@(14)).
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) myDescent: 3.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) myLabel: './ui2/tutorial-4.0/previousNextButtons.self ' copyMutable.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) myPosition: (1)@(11).
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) myWidth: 220.
( ((((root rawMorphs at: 6) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/mouseUpLinks]): "

( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((167)@(14)).
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/mouseUpLinks' copyMutable.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 167.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((167)@(0)) # ((168)@(14)).
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((168)@(0)) # ((191)@(14)).
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (168)@(11).
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 7) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/smalltalkBlurb]): "

( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((165)@(14)).
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/smalltalkBlurb' copyMutable.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 165.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((165)@(0)) # ((166)@(14)).
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [.self ]): "

( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((166)@(0)) # ((189)@(14)).
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '.self ' copyMutable.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (166)@(11).
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 23.
( ((((root rawMorphs at: 8) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [./ui2/tutorial-4.0/webBrowser]): "

( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((152)@(14)).
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: './ui2/tutorial-4.0/webBrowser' copyMutable.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 152.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((152)@(0)) # ((153)@(14)).
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

[
" State for: a labelMorph(type: labelMorph [Blurb.self ]): "

( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((153)@(0)) # ((206)@(14)).
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'times' Style: 'bold' Size: 12.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: 'Blurb.self ' copyMutable.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (153)@(11).
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 53.
( ((((root rawMorphs at: 9) rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.136852 Green: 0.136852  Blue: 0.136852.
] value.

root ] value
