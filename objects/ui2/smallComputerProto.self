"$Revision: 30.1 $"
[ | root |
root: smallComputer copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( frameMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs ) asList.
[
( root rawMorphs at: 0 )addMorph: frameMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 0) rawMorphs at: 0 )addMorph: radarDisplayMorph copyRemoveAllMorphs.
] value.

] value.

[
( root rawMorphs at: 1 )addMorph: morph copyRemoveAllMorphs.
[
( (root rawMorphs at: 1) rawMorphs at: 0 ) addAllMorphs: ( frameMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
[
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 )addMorph: frameMorph copyRemoveAllMorphs.
] value.

] value.

] value.

] value.

"end of skeleton"

[
" State for: a smallComputer(??): "

( root ) configLabelMorphs: sequence copy.
( root ) displayMorph: ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0.
( root ) hResizing: 0.
( root ) loggedInUserNames: sequence copy.
( root ) nameLabelMorph: ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1.
( root ) powerLightMorph: (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0.
( root ) processLabelMorphs: sequence copy.
( root ) rawBox: ((-2989)@(-549)) # ((-2939)@(-496)).
( root ) rawColor: paint named: 'lightGray'.
( root ) rawHostName: '??'.
( root ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 0 ) baseMinHeight: 10.
( root rawMorphs at: 0 ) baseMinWidth: 10.
( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: false.
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 1.
( root rawMorphs at: 0 ) justification: 0.
( root rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(39)).
( root rawMorphs at: 0 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 0 ) vResizing: 1.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 1 ) baseMinHeight: 10.
( root rawMorphs at: 1 ) baseMinWidth: 10.
( root rawMorphs at: 1 ) borderWidth: 1.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) justification: -1.
( root rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 1 ) rawBox: ((-7)@(40)) # ((58)@(53)).
( root rawMorphs at: 1 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 1 ) vResizing: 2.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 0) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 0) rawMorphs at: 0 ) frameStyle: 1.
( (root rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((47)@(36)).
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'lightGray'.
( (root rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morph(type: morph): "

( (root rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 1.
( (root rawMorphs at: 1) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((64)@(9)).
( (root rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint named: 'lightGray'.
( (root rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a radarDisplayMorph(type: radarDisplayMorph): "

( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) frameCount: 18.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) framesBetweenUpdate: 20.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) isRunning: true.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((42)@(31)).
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.98045 Green: 0.98045  Blue: 0.98045.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) savedColor: paint named: 'gray'.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) scale: 0.0930272.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 1.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 2.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 1.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) filled: false.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) frameStyle: 1.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((4)@(2)) # ((11)@(7)).
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'lightGray'.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [\?\?]): "

( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) myAscent: 9.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) myBox: ((36)@(0)) # ((48)@(11)).
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) myDescent: 2.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) myFontName: '-*-helvetica-medium-r-normal--'.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) myFontSize: 10.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) myLabel: '??'.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) myPosition: (36)@(9).
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) myWidth: 12.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.170088 Green: 0.170088  Blue: 0.170088.
( ((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 1.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 2.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 1.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) filled: true.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) frameStyle: 0.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((6)@(4)).
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'leaf'.
( (((root rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
] value.

root ] value
