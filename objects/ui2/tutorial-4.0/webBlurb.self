"$Revision: 1.1 $"
[ | root |
root: carpetMorph copyRemoveAllMorphs.

"building skeleton"

[
( root )addMorph: labelMorph copyRemoveAllMorphs.
[
( root rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( (((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
[
( ((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

] value.

] value.

] value.

] value.

] value.

] value.

] value.

"end of skeleton"

[
" State for: a carpetMorph(type: carpetMorph): "

( root ) hResizing: 0.
( root ) rawBox: ((930)@(-1438)) # ((1462)@(-1200)).
( root ) rawColor: paint named: 'black'.
( root ) vResizing: 0.
( root ) borderWidth: 2.
( root ) dragPoint: (930)@(-1438).
( root ) inResizeMode: false.
( root ) isPersistent: false.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) vResizing: 0.
( root rawMorphs at: 0 ) myAscent: 12.
( root rawMorphs at: 0 ) myBox: ((19)@(4)) # ((19)@(19)).
( root rawMorphs at: 0 ) myDescent: 3.
( root rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( root rawMorphs at: 0 ) myLabel: mutableString.
( root rawMorphs at: 0 ) myPosition: (19)@(16).
( root rawMorphs at: 0 ) myWidth: 0.
( root rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [      Try looking at your favorite web pages with the Self web browser.\n]): "

( (root rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((428)@(21)).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '      Try looking at your favorite web pages with the Self web browser.
' copyMutable.
( (root rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (root rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 428.
( (root rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [The implementation is not complete, but it serves as an example of a\n]): "

( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((419)@(21)).
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'The implementation is not complete, but it serves as an example of a
' copyMutable.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 419.
( ((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [Self application, and you can have fun taking apart or re-arranging\n]): "

( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((419)@(21)).
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'Self application, and you can have fun taking apart or re-arranging
' copyMutable.
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 419.
( (((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [the resulting pages using the direct construction techniques\n]): "

( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((378)@(21)).
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'the resulting pages using the \"direct construction\" techniques
' copyMutable.
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 378.
( ((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [as described in the turotial below (9 clicks down on your radar view\n]): "

( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((415)@(21)).
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'as described in the turotial below (9 clicks down on your radar view
' copyMutable.
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 415.
( (((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [navigator).\n]): "

( ((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((71)@(21)).
( ((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'navigator).
' copyMutable.
( ((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 71.
( ((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [     The web browser is available at anytime from the Self background\n]): "

( (((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((428)@(21)).
( (((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: '     The web browser is available at anytime from the Self background
' copyMutable.
( (((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 428.
( (((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [middle button menu - select Web hostlist, then use the middle button\n]): "

( ((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( ((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( ((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((444)@(21)).
( ((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( ((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'middle button menu - select \"Web hostlist,\" then use the middle button
' copyMutable.
( ((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( ((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 444.
( ((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

[
" State for: a labelMorph(type: labelMorph [menu on the hotlist object to open a URL.]): "

( (((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
( (((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 12.
( (((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(6)) # ((256)@(21)).
( (((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold' Size: 14.
( (((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'menu on the hotlist object to open a URL.' copyMutable.
( (((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(18).
( (((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 256.
( (((((((((root rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
] value.

root ] value
