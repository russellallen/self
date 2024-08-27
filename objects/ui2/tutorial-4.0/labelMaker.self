[ | root |
root: frameMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( rowMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs ) asList.
[
( root rawMorphs at: 0 )addMorph: ui2Button copyRemoveAllMorphs.
[
( (root rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

[
( root rawMorphs at: 1 )addMorph: editorMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 1) rawMorphs at: 0 ) addAllMorphs: ( editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs ) asList.
[
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & caretMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

[
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

] value.

"end of skeleton"

[
" State for: a frameMorph<2621>(type: frameMorph): "

( root ) hResizing: 1.
( root ) rawBox: ((207)@(681)) # ((330)@(774)).
( root ) vResizing: 1.
( root ) baseMinHeight: 10.
( root ) baseMinWidth: 10.
( root ) justification: 0.
( root ) nonLaidOutMorphs: vector.
( root ) borderWidth: 8.
( root ) filled: false.
( root ) frameStyle: 0.
( root ) rawColor: paint copyRed: 0.803519 Green: 0.754643  Blue: 0.809384.
] value.

[
" State for: a rowMorph<2616>(type: rowMorph): "

( root rawMorphs at: 0 ) hResizing: 1.
( root rawMorphs at: 0 ) rawBox: ((8)@(8)) # ((115)@(37)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.803519 Green: 0.754643  Blue: 0.809384.
( root rawMorphs at: 0 ) vResizing: 1.
( root rawMorphs at: 0 ) baseMinHeight: 3.
( root rawMorphs at: 0 ) baseMinWidth: 3.
( root rawMorphs at: 0 ) borderWidth: 5.
( root rawMorphs at: 0 ) justification: 0.
( root rawMorphs at: 0 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a frameMorph<2620>(type: frameMorph): "

( root rawMorphs at: 1 ) hResizing: 2.
( root rawMorphs at: 1 ) rawBox: ((8)@(37)) # ((115)@(85)).
( root rawMorphs at: 1 ) vResizing: 2.
( root rawMorphs at: 1 ) baseMinHeight: 3.
( root rawMorphs at: 1 ) baseMinWidth: 3.
( root rawMorphs at: 1 ) justification: 0.
( root rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 1 ) borderWidth: 2.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) frameStyle: 1.
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.803519 Green: 0.754643  Blue: 0.809384.
] value.

[
" State for: a ui2Button<2509>(type: ui2Button): "

( (root rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((5)@(5)) # ((80)@(24)).
( (root rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 0) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 0) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.803519 Green: 0.754643  Blue: 0.809384.
( (root rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 0) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.853372 Green: 0.801564  Blue: 0.859238.
( (root rawMorphs at: 0) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 0) rawMorphs at: 0 ) script: ' [ | pt . oldLbl |
 pt: target root globalBaseBounds topRight.
 oldLbl: nil.
 target world safelyDo: [
   target root morphs last morphs first firstRow allRowsDo: [ | :r. lbl |
     r deselect. 
     r optimize.
     lbl: labelMorph copy label:  r contentsString. 
     lbl position: pt.
     target world addMorph: lbl.
     oldLbl = nil ifFalse: [oldLbl addMorph: lbl. ].
     oldLbl: lbl.
     pt: pt + (0@18).].
   
 ].
 self ] value '.
( (root rawMorphs at: 0) rawMorphs at: 0 ) target: root rawMorphs at: 0.
] value.

[
" State for: an editorMorph<2619>(type: editorMorph): "

( (root rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 1.
( (root rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 1) rawMorphs at: 0 ) baseMinHeight: 3.
( (root rawMorphs at: 1) rawMorphs at: 0 ) baseMinWidth: 3.
( (root rawMorphs at: 1) rawMorphs at: 0 ) borderWidth: 1.
( (root rawMorphs at: 1) rawMorphs at: 0 ) justification: -1.
( (root rawMorphs at: 1) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 1) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((105)@(46)).
( (root rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.803519 Green: 0.754643  Blue: 0.809384.
( (root rawMorphs at: 1) rawMorphs at: 0 ) rawEditMode: true.
( (root rawMorphs at: 1) rawMorphs at: 0 ) receiver: (root rawMorphs at: 1) rawMorphs at: 0.
] value.

[
" State for: a labelMorph<2738>(type: labelMorph [make labels]): "

( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((73)@(17)).
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'regular' Size: 12.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'make labels'.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 71.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.109482 Green: 0.109482  Blue: 0.109482.
] value.

[
" State for: an editorRowMorph<2618>(type: editorRowMorph): "

( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((102)@(15)).
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.803519 Green: 0.754643  Blue: 0.809384.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) selectionRange: nil.
] value.

[
" State for: an editorRowMorph<2708>(type: editorRowMorph): "

( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 1.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) baseMinHeight: 3.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) baseMinWidth: 3.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) borderWidth: 0.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) justification: 0.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) nextRow: ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) previousRow: ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((1)@(15)) # ((102)@(29)).
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.803519 Green: 0.754643  Blue: 0.809384.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) rawTyper: (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) selectionRange: nil.
] value.

[
" State for: an editorRowMorph<2739>(type: editorRowMorph): "

( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 1.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 1.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) baseMinHeight: 3.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) baseMinWidth: 3.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) borderWidth: 0.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) justification: 0.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) nextRow: nil.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) previousRow: ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) rawBox: ((1)@(29)) # ((102)@(43)).
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.803519 Green: 0.754643  Blue: 0.809384.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) rawTyper: (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) selectionRange: nil.
] value.

[
" State for: a labelMorph<2740>(type: labelMorph [Use these buttons]): "

( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((91)@(14)).
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'bold' Size: 12.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'Use these buttons' copyMutable.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 91.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.109482 Green: 0.109482  Blue: 0.109482.
] value.

[
" State for: a caretMorph<2741>(type: caretMorph): "

( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.109482 Green: 0.109482  Blue: 0.109482.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'bold' Size: 12.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((91)@(0)) # ((92)@(14)).
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.109482 Green: 0.109482  Blue: 0.109482.
] value.

[
" State for: a labelMorph<2742>(type: labelMorph [\n]): "

( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((92)@(0)) # ((95)@(14)).
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'bold' Size: 12.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '
'.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (92)@(11).
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 3.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.109482 Green: 0.109482  Blue: 0.109482.
] value.

[
" State for: a labelMorph<2707>(type: labelMorph [to move around in\n]): "

( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 11.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((97)@(14)).
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'bold' Size: 12.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'to move around in
' copyMutable.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (0)@(11).
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 97.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.109482 Green: 0.109482  Blue: 0.109482.
] value.

[
" State for: a labelMorph<2743>(type: labelMorph [this large flat space.]): "

( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 0.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myAscent: 11.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((101)@(14)).
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'helvetica' Style: 'bold' Size: 12.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myLabel: 'this large flat space.' copyMutable.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myPosition: (0)@(11).
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myWidth: 101.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.109482 Green: 0.109482  Blue: 0.109482.
] value.

root ] value
