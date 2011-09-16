[ | root |
root: carpetMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & radarView copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & polygonMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
[
( root rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 1) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 )addMorph: lineMorph copyRemoveAllMorphs.
] value.

] value.

] value.

[
( root rawMorphs at: 2 ) addAllMorphs: ( frameMorph copyRemoveAllMorphs & rowMorph copyRemoveAllMorphs ) asList.
[
( (root rawMorphs at: 2) rawMorphs at: 0 )addMorph: frameMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 )addMorph: radarDisplayMorph copyRemoveAllMorphs.
] value.

] value.

[
( (root rawMorphs at: 2) rawMorphs at: 1 ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & columnMorph copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs ) asList.
[
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5 ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs ) asList.
[
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

[
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

[
( root rawMorphs at: 4 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 5 )addMorph: rowMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 5) rawMorphs at: 0 ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs ) asList.
[
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1 )addMorph: editorMorph copyRemoveAllMorphs.
[
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 )addMorph: editorRowMorph copyRemoveAllMorphs.
[
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & caretMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

] value.

] value.

] value.

] value.

[
( root rawMorphs at: 6 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 6) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

[
( root rawMorphs at: 10 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 10) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

"end of skeleton"

[
" State for: a carpetMorph<168>(type: carpetMorph): "

( root ) hResizing: 0.
( root ) rawBox: ((5)@(250)) # ((886)@(724)).
( root ) rawColor: paint named: 'black'.
( root ) vResizing: 0.
( root ) borderWidth: 2.
( root ) dragPoint: (5)@(724).
( root ) inResizeMode: false.
( root ) isPersistent: false.
] value.

[
" State for: a labelMorph<169>(type: labelMorph []): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) vResizing: 0.
( root rawMorphs at: 0 ) myAscent: 12.
( root rawMorphs at: 0 ) myBox: ((478)@(66)) # ((478)@(81)).
( root rawMorphs at: 0 ) myDescent: 3.
( root rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( root rawMorphs at: 0 ) myLabel: mutableString.
( root rawMorphs at: 0 ) myPosition: (478)@(78).
( root rawMorphs at: 0 ) myWidth: 0.
( root rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph<170>(type: labelMorph [Use these buttons\n]): "

( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) vResizing: 0.
( root rawMorphs at: 1 ) myAscent: 12.
( root rawMorphs at: 1 ) myBox: ((148)@(222)) # ((257)@(237)).
( root rawMorphs at: 1 ) myDescent: 3.
( root rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( root rawMorphs at: 1 ) myLabel: 'Use these buttons
' copyMutable.
( root rawMorphs at: 1 ) myPosition: (148)@(234).
( root rawMorphs at: 1 ) myWidth: 109.
( root rawMorphs at: 1 ) rawColor: paint named: 'black'.
] value.

[
" State for: a radarView<171>(type: radarView): "

( root rawMorphs at: 2 ) hResizing: 2.
( root rawMorphs at: 2 ) rawBox: ((3)@(311)) # ((275)@(469)).
( root rawMorphs at: 2 ) vResizing: 2.
( root rawMorphs at: 2 ) baseMinHeight: 3.
( root rawMorphs at: 2 ) baseMinWidth: 3.
( root rawMorphs at: 2 ) justification: 0.
( root rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 2 ) borderWidth: 3.
( root rawMorphs at: 2 ) filled: true.
( root rawMorphs at: 2 ) frameStyle: 0.
( root rawMorphs at: 2 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( root rawMorphs at: 2 ) panel: (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0.
] value.

[
" State for: a labelMorph<172>(type: labelMorph [type in their machine name here. \n]): "

( root rawMorphs at: 3 ) hResizing: 0.
( root rawMorphs at: 3 ) vResizing: 0.
( root rawMorphs at: 3 ) myAscent: 12.
( root rawMorphs at: 3 ) myBox: ((480)@(62)) # ((689)@(77)).
( root rawMorphs at: 3 ) myDescent: 3.
( root rawMorphs at: 3 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( root rawMorphs at: 3 ) myLabel: 'type in their machine name here. 
' copyMutable.
( root rawMorphs at: 3 ) myPosition: (480)@(74).
( root rawMorphs at: 3 ) myWidth: 209.
( root rawMorphs at: 3 ) rawColor: paint copyRed: 0.184751 Green: 0.117302  Blue: 0.0.
] value.

[
" State for: a labelMorph<72>(type: labelMorph []): "

( root rawMorphs at: 4 ) hResizing: 0.
( root rawMorphs at: 4 ) vResizing: 0.
( root rawMorphs at: 4 ) myAscent: 12.
( root rawMorphs at: 4 ) myBox: ((481)@(25)) # ((481)@(40)).
( root rawMorphs at: 4 ) myDescent: 3.
( root rawMorphs at: 4 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( root rawMorphs at: 4 ) myLabel: mutableString.
( root rawMorphs at: 4 ) myPosition: (481)@(37).
( root rawMorphs at: 4 ) myWidth: 0.
( root rawMorphs at: 4 ) rawColor: paint named: 'black'.
] value.

[
" State for: a frameMorph<173>(type: frameMorph): "

( root rawMorphs at: 5 ) hResizing: 1.
( root rawMorphs at: 5 ) rawBox: ((476)@(112)) # ((708)@(148)).
( root rawMorphs at: 5 ) vResizing: 1.
( root rawMorphs at: 5 ) baseMinHeight: 10.
( root rawMorphs at: 5 ) baseMinWidth: 10.
( root rawMorphs at: 5 ) justification: 0.
( root rawMorphs at: 5 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 5 ) borderWidth: 3.
( root rawMorphs at: 5 ) filled: true.
( root rawMorphs at: 5 ) frameStyle: 0.
( root rawMorphs at: 5 ) rawColor: paint copyRed: 0.884653 Green: 0.828934  Blue: 0.731183.
] value.

[
" State for: a labelMorph<174>(type: labelMorph [Move to the right to find out about\n]): "

( root rawMorphs at: 6 ) hResizing: 0.
( root rawMorphs at: 6 ) vResizing: 0.
( root rawMorphs at: 6 ) myAscent: 12.
( root rawMorphs at: 6 ) myBox: ((447)@(347)) # ((665)@(362)).
( root rawMorphs at: 6 ) myDescent: 3.
( root rawMorphs at: 6 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( root rawMorphs at: 6 ) myLabel: 'Move to the right to find out about
' copyMutable.
( root rawMorphs at: 6 ) myPosition: (447)@(359).
( root rawMorphs at: 6 ) myWidth: 218.
( root rawMorphs at: 6 ) rawColor: paint named: 'black'.
] value.

[
" State for: a polygonMorph<175>(type: polygonMorph): "

( root rawMorphs at: 7 ) hResizing: 0.
( root rawMorphs at: 7 ) vResizing: 0.
( root rawMorphs at: 7 ) movingOffset: nil.
( root rawMorphs at: 7 ) position: (501)@(319).
( root rawMorphs at: 7 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 7 ) vertexOffsets: (((0)@(20))
	& ((14)@(10))) asVector.
] value.

[
" State for: a polygonMorph<176>(type: polygonMorph): "

( root rawMorphs at: 8 ) hResizing: 0.
( root rawMorphs at: 8 ) vResizing: 0.
( root rawMorphs at: 8 ) movingOffset: nil.
( root rawMorphs at: 8 ) position: (477)@(319).
( root rawMorphs at: 8 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 8 ) vertexOffsets: (((0)@(20))
	& ((14)@(10))) asVector.
] value.

[
" State for: a polygonMorph<177>(type: polygonMorph): "

( root rawMorphs at: 9 ) hResizing: 0.
( root rawMorphs at: 9 ) vResizing: 0.
( root rawMorphs at: 9 ) movingOffset: nil.
( root rawMorphs at: 9 ) position: (452)@(319).
( root rawMorphs at: 9 ) rawColor: paint copyRed: 0.731183 Green: 0.731183  Blue: 0.952102.
( root rawMorphs at: 9 ) vertexOffsets: (((0)@(20))
	& ((14)@(10))) asVector.
] value.

[
" State for: a labelMorph<178>(type: labelMorph []): "

( root rawMorphs at: 10 ) hResizing: 0.
( root rawMorphs at: 10 ) vResizing: 0.
( root rawMorphs at: 10 ) myAscent: 12.
( root rawMorphs at: 10 ) myBox: ((282)@(408)) # ((282)@(423)).
( root rawMorphs at: 10 ) myDescent: 3.
( root rawMorphs at: 10 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( root rawMorphs at: 10 ) myLabel: mutableString.
( root rawMorphs at: 10 ) myPosition: (282)@(420).
( root rawMorphs at: 10 ) myWidth: 0.
( root rawMorphs at: 10 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph<179>(type: labelMorph [(Your friend must be using X, and be set to allow X connections.)]): "

( (root rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((397)@(21)).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '(Your friend must be using X, and be set to allow X connections.)' copyMutable.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 397.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph<180>(type: labelMorph [to move around in\n]): "

( (root rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((116)@(21)).
( (root rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myLabel: 'to move around in
' copyMutable.
( (root rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 116.
( (root rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a frameMorph<181>(type: frameMorph): "

( (root rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 1.
( (root rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((269)@(113)).
( (root rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 2) rawMorphs at: 0 ) baseMinHeight: 3.
( (root rawMorphs at: 2) rawMorphs at: 0 ) baseMinWidth: 3.
( (root rawMorphs at: 2) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 2) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 2) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 2) rawMorphs at: 0 ) filled: true.
( (root rawMorphs at: 2) rawMorphs at: 0 ) frameStyle: 2.
( (root rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
] value.

[
" State for: a rowMorph<182>(type: rowMorph): "

( (root rawMorphs at: 2) rawMorphs at: 1 ) hResizing: 1.
( (root rawMorphs at: 2) rawMorphs at: 1 ) rawBox: ((3)@(113)) # ((269)@(155)).
( (root rawMorphs at: 2) rawMorphs at: 1 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (root rawMorphs at: 2) rawMorphs at: 1 ) vResizing: 2.
( (root rawMorphs at: 2) rawMorphs at: 1 ) baseMinHeight: 3.
( (root rawMorphs at: 2) rawMorphs at: 1 ) baseMinWidth: 3.
( (root rawMorphs at: 2) rawMorphs at: 1 ) borderWidth: 2.
( (root rawMorphs at: 2) rawMorphs at: 1 ) justification: 0.
( (root rawMorphs at: 2) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a labelMorph<183>(type: labelMorph [To share this window with a friend on the network,]): "

( (root rawMorphs at: 4) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 4) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 4) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 4) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((312)@(21)).
( (root rawMorphs at: 4) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 4) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (root rawMorphs at: 4) rawMorphs at: 0 ) myLabel: 'To share this window with a friend on the network,' copyMutable.
( (root rawMorphs at: 4) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 4) rawMorphs at: 0 ) myWidth: 312.
( (root rawMorphs at: 4) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a rowMorph<184>(type: rowMorph): "

( (root rawMorphs at: 5) rawMorphs at: 0 ) hResizing: 1.
( (root rawMorphs at: 5) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((229)@(33)).
( (root rawMorphs at: 5) rawMorphs at: 0 ) rawColor: paint copyRed: 0.884653 Green: 0.828934  Blue: 0.731183.
( (root rawMorphs at: 5) rawMorphs at: 0 ) vResizing: 1.
( (root rawMorphs at: 5) rawMorphs at: 0 ) baseMinHeight: 3.
( (root rawMorphs at: 5) rawMorphs at: 0 ) baseMinWidth: 3.
( (root rawMorphs at: 5) rawMorphs at: 0 ) borderWidth: 5.
( (root rawMorphs at: 5) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 5) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a labelMorph<185>(type: labelMorph [Mouse Button Usage, an important\n]): "

( (root rawMorphs at: 6) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 6) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 6) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 6) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((217)@(21)).
( (root rawMorphs at: 6) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 6) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (root rawMorphs at: 6) rawMorphs at: 0 ) myLabel: 'Mouse Button Usage, an important
' copyMutable.
( (root rawMorphs at: 6) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 6) rawMorphs at: 0 ) myWidth: 217.
( (root rawMorphs at: 6) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph<186>(type: labelMorph [Three button clicks will\n]): "

( (root rawMorphs at: 10) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 10) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 10) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 10) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((147)@(21)).
( (root rawMorphs at: 10) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 10) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (root rawMorphs at: 10) rawMorphs at: 0 ) myLabel: 'Three button clicks will
' copyMutable.
( (root rawMorphs at: 10) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 10) rawMorphs at: 0 ) myWidth: 147.
( (root rawMorphs at: 10) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph<187>(type: labelMorph [this large flat space.]): "

( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((121)@(21)).
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'this large flat space.' copyMutable.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 121.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a frameMorph<188>(type: frameMorph): "

( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((264)@(108)).
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 3.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) filled: true.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) frameStyle: 1.
( ((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
] value.

[
" State for: a ui2Button<189>(type: ui2Button): "

( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) rawBox: ((2)@(11)) # ((31)@(30)).
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) justification: 0.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) borderWidth: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) filled: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) frameStyle: 0.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) baseMinHeight: 10.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) baseMinWidth: 10.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) isAsynchronous: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) rawIsGrayedOut: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) rawState: 'up'.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) script: '   target panel isRunning ifTrue: [
                   target panel stop.
                   button label: \' on \'.
                 ] False: [
                   target panel start.
                   button label: \' off \'.
                 ].   '.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0 ) target: root rawMorphs at: 2.
] value.

[
" State for: a ui2Button<190>(type: ui2Button): "

( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) hResizing: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) rawBox: ((31)@(11)) # ((99)@(30)).
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) vResizing: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) justification: 0.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) borderWidth: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) filled: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) frameStyle: 0.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) baseMinHeight: 10.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) baseMinWidth: 10.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) isAsynchronous: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) rawIsGrayedOut: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) rawState: 'up'.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) script: '   target zoomOut   '.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1 ) target: root rawMorphs at: 2.
] value.

[
" State for: a ui2Button<191>(type: ui2Button): "

( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) hResizing: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) rawBox: ((99)@(11)) # ((159)@(30)).
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) vResizing: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) justification: 0.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) borderWidth: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) filled: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) frameStyle: 0.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) baseMinHeight: 10.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) baseMinWidth: 10.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) isAsynchronous: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) rawIsGrayedOut: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) rawState: 'up'.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) script: '   target zoomIn   '.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2 ) target: root rawMorphs at: 2.
] value.

[
" State for: a ui2Button<192>(type: ui2Button): "

( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) hResizing: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) rawBox: ((159)@(11)) # ((204)@(30)).
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) vResizing: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) justification: 0.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) borderWidth: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) filled: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) frameStyle: 0.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) baseMinHeight: 10.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) baseMinWidth: 10.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) isAsynchronous: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) rawIsGrayedOut: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) rawState: 'up'.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) script: '    target moveViewForEvent: event To: 0@0   '.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3 ) target: root rawMorphs at: 2.
] value.

[
" State for: a ui2Button<193>(type: ui2Button): "

( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) hResizing: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) rawBox: ((204)@(11)) # ((224)@(30)).
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) vResizing: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) justification: 0.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) borderWidth: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) filled: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) frameStyle: 0.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) baseMinHeight: 10.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) baseMinWidth: 10.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) isAsynchronous: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) rawIsGrayedOut: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) rawState: 'up'.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) script: '      target moveViewForEvent: event By: -298 @ 0     '.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4 ) target: root rawMorphs at: 2.
] value.

[
" State for: a columnMorph<194>(type: columnMorph): "

( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5 ) hResizing: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5 ) rawBox: ((224)@(2)) # ((244)@(40)).
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5 ) vResizing: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5 ) baseMinHeight: 3.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5 ) baseMinWidth: 3.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5 ) borderWidth: 0.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5 ) justification: 0.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5 ) nonLaidOutMorphs: vector.
] value.

[
" State for: a ui2Button<195>(type: ui2Button): "

( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) hResizing: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) rawBox: ((244)@(11)) # ((264)@(30)).
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) vResizing: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) justification: 0.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) borderWidth: 2.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) filled: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) frameStyle: 0.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) baseMinHeight: 10.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) baseMinWidth: 10.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) isAsynchronous: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) rawIsGrayedOut: false.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) rawState: 'up'.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) script: '      target moveViewForEvent: event By: 298 @ 0     '.
( ((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6 ) target: root rawMorphs at: 2.
] value.

[
" State for: a ui2Button<196>(type: ui2Button): "

( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 2.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((5)@(5)) # ((122)@(24)).
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 2.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 2.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) filled: false.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) frameStyle: 0.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.884653 Green: 0.828934  Blue: 0.731183.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 10.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 10.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.934506 Green: 0.875855  Blue: 0.772238.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) isAsynchronous: true.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) rawIsGrayedOut: false.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) rawState: 'up'.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) script: '    [ | displayName |
 displayName: button owner morphs last morphs first contentsString.
 desktop worlds first alsoOpenOnDisplay: displayName.
 self.] value   '.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) target: nil.
] value.

[
" State for: a frameMorph<197>(type: frameMorph): "

( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 2.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((122)@(5)) # ((221)@(25)).
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 2.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1 ) baseMinHeight: 3.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1 ) baseMinWidth: 3.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1 ) justification: 0.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1 ) borderWidth: 2.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1 ) filled: true.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1 ) frameStyle: 1.
( ((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.884653 Green: 0.828934  Blue: 0.731183.
] value.

[
" State for: a labelMorph<198>(type: labelMorph [first step to get you started.]): "

( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((167)@(21)).
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'first step to get you started.' copyMutable.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 167.
( ((root rawMorphs at: 6) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph<205>(type: labelMorph [move you one screenfull.]): "

( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((149)@(21)).
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'move you one screenfull.' copyMutable.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 149.
( ((root rawMorphs at: 10) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a lineMorph<206>(type: lineMorph (54@2->74@162)): "

( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) p1: (54)@(2).
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) p2: (74)@(162).
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) width: 1.
] value.

[
" State for: a radarDisplayMorph<207>(type: radarDisplayMorph): "

( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((259)@(103)).
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) frameCount: 0.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) framesBetweenUpdate: 20.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) isRunning: true.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.929619 Green: 0.959922  Blue: 0.910068.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) savedColor: paint named: 'gray'.
( (((root rawMorphs at: 2) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) scale: 0.0241127.
] value.

[
" State for: a labelMorph<214>(type: labelMorph [ off ]): "

( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((27)@(17)).
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: ' off '.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(14).
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 25.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
] value.

[
" State for: a labelMorph<215>(type: labelMorph [ zoom out ]): "

( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((66)@(17)).
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: ' zoom out '.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 64.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
] value.

[
" State for: a labelMorph<216>(type: labelMorph [ zoom in ]): "

( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myAscent: 12.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((58)@(17)).
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myLabel: ' zoom in '.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myPosition: (2)@(14).
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myWidth: 56.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
] value.

[
" State for: a labelMorph<217>(type: labelMorph [ home ]): "

( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) vResizing: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myAscent: 12.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((43)@(17)).
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myLabel: ' home '.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myPosition: (2)@(14).
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myWidth: 41.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
] value.

[
" State for: a labelMorph<218>(type: labelMorph [ < ]): "

( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) vResizing: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myAscent: 12.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((18)@(17)).
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myLabel: ' < ' copyMutable.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myPosition: (2)@(14).
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myWidth: 16.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
] value.

[
" State for: a ui2Button<219>(type: ui2Button): "

( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) hResizing: 2.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((20)@(19)).
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) vResizing: 2.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) borderWidth: 2.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) filled: false.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) frameStyle: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) baseMinHeight: 10.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) baseMinWidth: 10.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) isAsynchronous: false.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) rawState: 'up'.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) script: '      target moveViewForEvent: event By: 0 @  -244    '.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) target: root rawMorphs at: 2.
] value.

[
" State for: a ui2Button<220>(type: ui2Button): "

( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) hResizing: 2.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) rawBox: ((0)@(19)) # ((20)@(38)).
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) vResizing: 2.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) justification: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) borderWidth: 2.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) filled: false.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) frameStyle: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) baseMinHeight: 10.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) baseMinWidth: 10.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) isAsynchronous: false.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) rawState: 'up'.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) script: '      target moveViewForEvent: event By: (0 @ 244)     '.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) target: root rawMorphs at: 2.
] value.

[
" State for: a labelMorph<221>(type: labelMorph [ > ]): "

( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) vResizing: 0.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myAscent: 12.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((18)@(17)).
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myLabel: ' > ' copyMutable.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myPosition: (2)@(14).
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myWidth: 16.
( (((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
] value.

[
" State for: a labelMorph<222>(type: labelMorph [share screen with: ]): "

( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((115)@(17)).
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'share screen with: '.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(14).
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 113.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.184751 Green: 0.117302  Blue: 0.0.
] value.

[
" State for: an editorMorph<223>(type: editorMorph): "

( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 2.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) borderWidth: 1.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) justification: -1.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((97)@(18)).
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.884653 Green: 0.884653  Blue: 0.884653.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawEditMode: true.
( (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) receiver: (((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0.
] value.

[
" State for: a labelMorph<224>(type: labelMorph [ /\\ ]): "

( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((18)@(17)).
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: ' /\\ ' copyMutable.
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 16.
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
] value.

[
" State for: a labelMorph<225>(type: labelMorph [ \\/ ]): "

( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 12.
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((18)@(17)).
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: ' \\/ ' copyMutable.
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(14).
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 16.
( ((((root rawMorphs at: 2) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
] value.

[
" State for: an editorRowMorph<226>(type: editorRowMorph): "

( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((94)@(15)).
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.884653 Green: 0.884653  Blue: 0.884653.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
( ((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) selectionRange: nil.
] value.

[
" State for: a labelMorph<227>(type: labelMorph [machineName:]): "

( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((77)@(14)).
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'machineName:' copyMutable.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 77.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.184751 Green: 0.184751  Blue: 0.184751.
] value.

[
" State for: a caretMorph<228>(type: caretMorph): "

( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.184751 Green: 0.184751  Blue: 0.184751.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((77)@(0)) # ((78)@(14)).
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.184751 Green: 0.184751  Blue: 0.184751.
] value.

[
" State for: a labelMorph<229>(type: labelMorph [0.0]): "

( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((78)@(0)) # ((93)@(14)).
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 12.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: '0.0' copyMutable.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (78)@(11).
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 15.
( (((((root rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.184751 Green: 0.184751  Blue: 0.184751.
] value.

root ] value
