"$Revision: 21.7 $"
[ | root |
root: factoryMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs ) asList.
[
( root rawMorphs at: 1 )addMorph: columnMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 2 )addMorph: morph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 5 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 9 )addMorph: circleMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 10 )addMorph: rowMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 11 )addMorph: frameMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 11) rawMorphs at: 0 )addMorph: rowMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & frameMorph copyRemoveAllMorphs ) asList.
[
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 )addMorph: editorMorph copyRemoveAllMorphs.
[
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 )addMorph: editorRowMorph copyRemoveAllMorphs.
[
( (((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & caretMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

] value.

] value.

] value.

] value.

] value.

[
( root rawMorphs at: 12 )addMorph: frameMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 14 )addMorph: ui2Button copyRemoveAllMorphs.
[
( (root rawMorphs at: 14) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

[
( root rawMorphs at: 15 )addMorph: clockMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 18 )addMorph: frameMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 20 )addMorph: updatingLabelMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 21 )addMorph: worldScrollerMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 21) rawMorphs at: 0 )addMorph: rowMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0 ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & columnMorph copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs ) asList.
[
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs ) asList.
[
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

[
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

] value.

[
( root rawMorphs at: 22 )addMorph: radarView copyRemoveAllMorphs.
[
( (root rawMorphs at: 22) rawMorphs at: 0 ) addAllMorphs: ( frameMorph copyRemoveAllMorphs & rowMorph copyRemoveAllMorphs ) asList.
[
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0 )addMorph: frameMorph copyRemoveAllMorphs.
[
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 )addMorph: radarDisplayMorph copyRemoveAllMorphs.
] value.

] value.

[
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1 ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs & columnMorph copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs ) asList.
[
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5 ) addAllMorphs: ( ui2Button copyRemoveAllMorphs & ui2Button copyRemoveAllMorphs ) asList.
[
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

[
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

] value.

[
( root rawMorphs at: 23 )addMorph: sliderMorph copyRemoveAllMorphs.
] value.

[
( root rawMorphs at: 25 )addMorph: columnMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 25) rawMorphs at: 0 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

] value.

[
( root rawMorphs at: 26 )addMorph: frameMorph copyRemoveAllMorphs.
[
( (root rawMorphs at: 26) rawMorphs at: 0 )addMorph: columnMorph copyRemoveAllMorphs.
[
( ((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & rowMorph copyRemoveAllMorphs ) asList.
[
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) addAllMorphs: ( editorMorph copyRemoveAllMorphs & editorMorph copyRemoveAllMorphs ) asList.
[
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) addAllMorphs: ( editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs ) asList.
[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

[
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) addAllMorphs: ( editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs & editorRowMorph copyRemoveAllMorphs ) asList.
[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22 ) addAllMorphs: ( labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs & labelMorph copyRemoveAllMorphs ) asList.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

[
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41 )addMorph: labelMorph copyRemoveAllMorphs.
] value.

] value.

] value.

] value.

] value.

] value.

] value.

"end of skeleton"

[
" State for: a factoryMorph(type: factoryMorph): "

( root ) borderWidth: 3.
( root ) filled: true.
( root ) frameStyle: 0.
( root ) hResizing: 0.
( root ) hilightColor1: paint copyRed: 0.969697 Green: 0.969697  Blue: 0.969697.
( root ) hilightColor2: paint named: 'white'.
( root ) looksHollow: false.
( root ) minCornerOffset: (0)@(0).
( root ) rawBox: ((74)@(64)) # ((917)@(780)).
( root ) rawColor: paint named: 'lightGray'.
( root ) shadowColor1: paint copyRed: 0.770283 Green: 0.770283  Blue: 0.770283.
( root ) shadowColor2: paint copyRed: 0.669599 Green: 0.669599  Blue: 0.669599.
( root ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [column]): "

( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) myAscent: 11.
( root rawMorphs at: 0 ) myBox: ((254)@(17)) # ((299)@(31)).
( root rawMorphs at: 0 ) myDescent: 3.
( root rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( root rawMorphs at: 0 ) myLabel: 'column'.
( root rawMorphs at: 0 ) myPosition: (254)@(28).
( root rawMorphs at: 0 ) myWidth: 45.
( root rawMorphs at: 0 ) rawColor: paint named: 'black'.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 1 ) baseMinHeight: 3.
( root rawMorphs at: 1 ) baseMinWidth: 3.
( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) frameStyle: 1.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) justification: 0.
( root rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 1 ) rawBox: ((244)@(39)) # ((309)@(138)).
( root rawMorphs at: 1 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 2 ) baseMinHeight: 3.
( root rawMorphs at: 2 ) baseMinWidth: 3.
( root rawMorphs at: 2 ) borderWidth: 3.
( root rawMorphs at: 2 ) filled: true.
( root rawMorphs at: 2 ) frameStyle: 1.
( root rawMorphs at: 2 ) hResizing: 2.
( root rawMorphs at: 2 ) justification: 0.
( root rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 2 ) rawBox: ((14)@(38)) # ((76)@(99)).
( root rawMorphs at: 2 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 2 ) vResizing: 2.
] value.

[
" State for: a labelMorph(type: labelMorph [inset frame]): "

( root rawMorphs at: 3 ) hResizing: 0.
( root rawMorphs at: 3 ) myAscent: 11.
( root rawMorphs at: 3 ) myBox: ((319)@(16)) # ((387)@(30)).
( root rawMorphs at: 3 ) myDescent: 3.
( root rawMorphs at: 3 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( root rawMorphs at: 3 ) myLabel: 'inset frame'.
( root rawMorphs at: 3 ) myPosition: (319)@(27).
( root rawMorphs at: 3 ) myWidth: 68.
( root rawMorphs at: 3 ) rawColor: paint named: 'black'.
( root rawMorphs at: 3 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [label]): "

( root rawMorphs at: 4 ) hResizing: 0.
( root rawMorphs at: 4 ) myAscent: 11.
( root rawMorphs at: 4 ) myBox: ((116)@(160)) # ((145)@(174)).
( root rawMorphs at: 4 ) myDescent: 3.
( root rawMorphs at: 4 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( root rawMorphs at: 4 ) myLabel: 'label'.
( root rawMorphs at: 4 ) myPosition: (116)@(171).
( root rawMorphs at: 4 ) myWidth: 29.
( root rawMorphs at: 4 ) rawColor: paint named: 'black'.
( root rawMorphs at: 4 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 5 ) baseMinHeight: 3.
( root rawMorphs at: 5 ) baseMinWidth: 3.
( root rawMorphs at: 5 ) borderWidth: 3.
( root rawMorphs at: 5 ) filled: true.
( root rawMorphs at: 5 ) frameStyle: 1.
( root rawMorphs at: 5 ) hResizing: 2.
( root rawMorphs at: 5 ) justification: 0.
( root rawMorphs at: 5 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 5 ) rawBox: ((84)@(177)) # ((192)@(231)).
( root rawMorphs at: 5 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 5 ) vResizing: 2.
] value.

[
" State for: a labelMorph(type: labelMorph [morph]): "

( root rawMorphs at: 6 ) hResizing: 0.
( root rawMorphs at: 6 ) myAscent: 11.
( root rawMorphs at: 6 ) myBox: ((22)@(16)) # ((63)@(30)).
( root rawMorphs at: 6 ) myDescent: 3.
( root rawMorphs at: 6 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( root rawMorphs at: 6 ) myLabel: 'morph'.
( root rawMorphs at: 6 ) myPosition: (22)@(27).
( root rawMorphs at: 6 ) myWidth: 41.
( root rawMorphs at: 6 ) rawColor: paint named: 'black'.
( root rawMorphs at: 6 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [row]): "

( root rawMorphs at: 7 ) hResizing: 0.
( root rawMorphs at: 7 ) myAscent: 11.
( root rawMorphs at: 7 ) myBox: ((173)@(18)) # ((196)@(32)).
( root rawMorphs at: 7 ) myDescent: 3.
( root rawMorphs at: 7 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( root rawMorphs at: 7 ) myLabel: 'row'.
( root rawMorphs at: 7 ) myPosition: (173)@(29).
( root rawMorphs at: 7 ) myWidth: 23.
( root rawMorphs at: 7 ) rawColor: paint named: 'black'.
( root rawMorphs at: 7 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [circle]): "

( root rawMorphs at: 8 ) hResizing: 0.
( root rawMorphs at: 8 ) myAscent: 11.
( root rawMorphs at: 8 ) myBox: ((89)@(18)) # ((121)@(32)).
( root rawMorphs at: 8 ) myDescent: 3.
( root rawMorphs at: 8 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( root rawMorphs at: 8 ) myLabel: 'circle'.
( root rawMorphs at: 8 ) myPosition: (89)@(29).
( root rawMorphs at: 8 ) myWidth: 32.
( root rawMorphs at: 8 ) rawColor: paint named: 'black'.
( root rawMorphs at: 8 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 9 ) baseMinHeight: 3.
( root rawMorphs at: 9 ) baseMinWidth: 3.
( root rawMorphs at: 9 ) borderWidth: 3.
( root rawMorphs at: 9 ) filled: true.
( root rawMorphs at: 9 ) frameStyle: 1.
( root rawMorphs at: 9 ) hResizing: 2.
( root rawMorphs at: 9 ) justification: 0.
( root rawMorphs at: 9 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 9 ) rawBox: ((83)@(39)) # ((139)@(95)).
( root rawMorphs at: 9 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 9 ) vResizing: 2.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 10 ) baseMinHeight: 3.
( root rawMorphs at: 10 ) baseMinWidth: 3.
( root rawMorphs at: 10 ) borderWidth: 3.
( root rawMorphs at: 10 ) filled: true.
( root rawMorphs at: 10 ) frameStyle: 1.
( root rawMorphs at: 10 ) hResizing: 0.
( root rawMorphs at: 10 ) justification: 0.
( root rawMorphs at: 10 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 10 ) rawBox: ((149)@(38)) # ((236)@(74)).
( root rawMorphs at: 10 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 10 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 11 ) baseMinHeight: 3.
( root rawMorphs at: 11 ) baseMinWidth: 3.
( root rawMorphs at: 11 ) borderWidth: 3.
( root rawMorphs at: 11 ) filled: true.
( root rawMorphs at: 11 ) frameStyle: 1.
( root rawMorphs at: 11 ) hResizing: 2.
( root rawMorphs at: 11 ) justification: 0.
( root rawMorphs at: 11 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 11 ) rawBox: ((12)@(106)) # ((236)@(146)).
( root rawMorphs at: 11 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 11 ) vResizing: 2.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 12 ) baseMinHeight: 3.
( root rawMorphs at: 12 ) baseMinWidth: 3.
( root rawMorphs at: 12 ) borderWidth: 3.
( root rawMorphs at: 12 ) filled: true.
( root rawMorphs at: 12 ) frameStyle: 1.
( root rawMorphs at: 12 ) hResizing: 0.
( root rawMorphs at: 12 ) justification: 0.
( root rawMorphs at: 12 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 12 ) rawBox: ((317)@(38)) # ((400)@(99)).
( root rawMorphs at: 12 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 12 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [button]): "

( root rawMorphs at: 13 ) hResizing: 0.
( root rawMorphs at: 13 ) myAscent: 11.
( root rawMorphs at: 13 ) myBox: ((24)@(159)) # ((65)@(173)).
( root rawMorphs at: 13 ) myDescent: 3.
( root rawMorphs at: 13 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( root rawMorphs at: 13 ) myLabel: 'button' copyMutable.
( root rawMorphs at: 13 ) myPosition: (24)@(170).
( root rawMorphs at: 13 ) myWidth: 41.
( root rawMorphs at: 13 ) rawColor: paint named: 'black'.
( root rawMorphs at: 13 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 14 ) baseMinHeight: 3.
( root rawMorphs at: 14 ) baseMinWidth: 3.
( root rawMorphs at: 14 ) borderWidth: 3.
( root rawMorphs at: 14 ) filled: true.
( root rawMorphs at: 14 ) frameStyle: 1.
( root rawMorphs at: 14 ) hResizing: 0.
( root rawMorphs at: 14 ) justification: 0.
( root rawMorphs at: 14 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 14 ) rawBox: ((21)@(178)) # ((68)@(203)).
( root rawMorphs at: 14 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 14 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 15 ) baseMinHeight: 3.
( root rawMorphs at: 15 ) baseMinWidth: 3.
( root rawMorphs at: 15 ) borderWidth: 3.
( root rawMorphs at: 15 ) filled: true.
( root rawMorphs at: 15 ) frameStyle: 1.
( root rawMorphs at: 15 ) hResizing: 2.
( root rawMorphs at: 15 ) justification: 0.
( root rawMorphs at: 15 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 15 ) rawBox: ((208)@(177)) # ((298)@(207)).
( root rawMorphs at: 15 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 15 ) vResizing: 2.
] value.

[
" State for: a labelMorph(type: labelMorph [clock]): "

( root rawMorphs at: 16 ) hResizing: 0.
( root rawMorphs at: 16 ) myAscent: 9.
( root rawMorphs at: 16 ) myBox: ((242)@(160)) # ((268)@(171)).
( root rawMorphs at: 16 ) myDescent: 2.
( root rawMorphs at: 16 ) myFontSpec: fontSpec copyName: 'times' Size: 10 Style: 'bold'.
( root rawMorphs at: 16 ) myLabel: 'clock' copyMutable.
( root rawMorphs at: 16 ) myPosition: (242)@(169).
( root rawMorphs at: 16 ) myWidth: 26.
( root rawMorphs at: 16 ) rawColor: paint named: 'black'.
( root rawMorphs at: 16 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [outset frame]): "

( root rawMorphs at: 17 ) hResizing: 0.
( root rawMorphs at: 17 ) myAscent: 11.
( root rawMorphs at: 17 ) myBox: ((320)@(120)) # ((396)@(134)).
( root rawMorphs at: 17 ) myDescent: 3.
( root rawMorphs at: 17 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( root rawMorphs at: 17 ) myLabel: 'outset frame'.
( root rawMorphs at: 17 ) myPosition: (320)@(131).
( root rawMorphs at: 17 ) myWidth: 76.
( root rawMorphs at: 17 ) rawColor: paint named: 'black'.
( root rawMorphs at: 17 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 18 ) baseMinHeight: 3.
( root rawMorphs at: 18 ) baseMinWidth: 3.
( root rawMorphs at: 18 ) borderWidth: 3.
( root rawMorphs at: 18 ) filled: true.
( root rawMorphs at: 18 ) frameStyle: 1.
( root rawMorphs at: 18 ) hResizing: 0.
( root rawMorphs at: 18 ) justification: 0.
( root rawMorphs at: 18 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 18 ) rawBox: ((321)@(145)) # ((393)@(205)).
( root rawMorphs at: 18 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 18 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [perf meter]): "

( root rawMorphs at: 19 ) hResizing: 0.
( root rawMorphs at: 19 ) myAscent: 9.
( root rawMorphs at: 19 ) myBox: ((335)@(247)) # ((385)@(258)).
( root rawMorphs at: 19 ) myDescent: 2.
( root rawMorphs at: 19 ) myFontSpec: fontSpec copyName: 'times' Size: 10 Style: 'bold'.
( root rawMorphs at: 19 ) myLabel: 'perf meter' copyMutable.
( root rawMorphs at: 19 ) myPosition: (335)@(256).
( root rawMorphs at: 19 ) myWidth: 50.
( root rawMorphs at: 19 ) rawColor: paint named: 'black'.
( root rawMorphs at: 19 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 20 ) baseMinHeight: 3.
( root rawMorphs at: 20 ) baseMinWidth: 3.
( root rawMorphs at: 20 ) borderWidth: 3.
( root rawMorphs at: 20 ) filled: true.
( root rawMorphs at: 20 ) frameStyle: 1.
( root rawMorphs at: 20 ) hResizing: 2.
( root rawMorphs at: 20 ) justification: 0.
( root rawMorphs at: 20 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 20 ) rawBox: ((323)@(270)) # ((402)@(290)).
( root rawMorphs at: 20 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 20 ) vResizing: 2.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 21 ) baseMinHeight: 3.
( root rawMorphs at: 21 ) baseMinWidth: 3.
( root rawMorphs at: 21 ) borderWidth: 3.
( root rawMorphs at: 21 ) filled: true.
( root rawMorphs at: 21 ) frameStyle: 1.
( root rawMorphs at: 21 ) hResizing: 2.
( root rawMorphs at: 21 ) justification: 0.
( root rawMorphs at: 21 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 21 ) rawBox: ((316)@(335)) # ((417)@(405)).
( root rawMorphs at: 21 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 21 ) vResizing: 2.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 22 ) baseMinHeight: 3.
( root rawMorphs at: 22 ) baseMinWidth: 3.
( root rawMorphs at: 22 ) borderWidth: 3.
( root rawMorphs at: 22 ) filled: true.
( root rawMorphs at: 22 ) frameStyle: 1.
( root rawMorphs at: 22 ) hResizing: 0.
( root rawMorphs at: 22 ) justification: 0.
( root rawMorphs at: 22 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 22 ) rawBox: ((15)@(247)) # ((293)@(409)).
( root rawMorphs at: 22 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 22 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 23 ) baseMinHeight: 3.
( root rawMorphs at: 23 ) baseMinWidth: 3.
( root rawMorphs at: 23 ) borderWidth: 3.
( root rawMorphs at: 23 ) filled: true.
( root rawMorphs at: 23 ) frameStyle: 1.
( root rawMorphs at: 23 ) hResizing: 2.
( root rawMorphs at: 23 ) justification: 0.
( root rawMorphs at: 23 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 23 ) rawBox: ((414)@(38)) # ((431)@(123)).
( root rawMorphs at: 23 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 23 ) vResizing: 2.
] value.

[
" State for: a labelMorph(type: labelMorph [slider]): "

( root rawMorphs at: 24 ) hResizing: 0.
( root rawMorphs at: 24 ) myAscent: 11.
( root rawMorphs at: 24 ) myBox: ((404)@(16)) # ((437)@(30)).
( root rawMorphs at: 24 ) myDescent: 3.
( root rawMorphs at: 24 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( root rawMorphs at: 24 ) myLabel: 'slider'.
( root rawMorphs at: 24 ) myPosition: (404)@(27).
( root rawMorphs at: 24 ) myWidth: 33.
( root rawMorphs at: 24 ) rawColor: paint named: 'black'.
( root rawMorphs at: 24 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 25 ) baseMinHeight: 3.
( root rawMorphs at: 25 ) baseMinWidth: 3.
( root rawMorphs at: 25 ) borderWidth: 3.
( root rawMorphs at: 25 ) filled: true.
( root rawMorphs at: 25 ) frameStyle: 1.
( root rawMorphs at: 25 ) hResizing: 0.
( root rawMorphs at: 25 ) justification: 0.
( root rawMorphs at: 25 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 25 ) rawBox: ((60)@(490)) # ((381)@(581)).
( root rawMorphs at: 25 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 25 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( root rawMorphs at: 26 ) baseMinHeight: 3.
( root rawMorphs at: 26 ) baseMinWidth: 3.
( root rawMorphs at: 26 ) borderWidth: 3.
( root rawMorphs at: 26 ) filled: true.
( root rawMorphs at: 26 ) frameStyle: 1.
( root rawMorphs at: 26 ) hResizing: 0.
( root rawMorphs at: 26 ) justification: 0.
( root rawMorphs at: 26 ) nonLaidOutMorphs: vector.
( root rawMorphs at: 26 ) rawBox: ((445)@(7)) # ((832)@(707)).
( root rawMorphs at: 26 ) rawColor: paint named: 'lightGray'.
( root rawMorphs at: 26 ) vResizing: 0.
] value.

[
" State for: a columnMorph(type: columnMorph): "

( (root rawMorphs at: 1) rawMorphs at: 0 ) baseMinHeight: 3.
( (root rawMorphs at: 1) rawMorphs at: 0 ) baseMinWidth: 3.
( (root rawMorphs at: 1) rawMorphs at: 0 ) borderWidth: 5.
( (root rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 1.
( (root rawMorphs at: 1) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 1) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 1) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((62)@(96)).
( (root rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.493646 Green: 0.723363  Blue: 0.822092.
( (root rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 1.
] value.

[
" State for: a morph(type: morph): "

( (root rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 2) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((59)@(58)).
( (root rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.55914 Green: 0.856305  Blue: 0.513196.
( (root rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ABC]): "

( (root rawMorphs at: 5) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 5) rawMorphs at: 0 ) myAscent: 36.
( (root rawMorphs at: 5) rawMorphs at: 0 ) myBox: ((3)@(3)) # ((105)@(51)).
( (root rawMorphs at: 5) rawMorphs at: 0 ) myDescent: 12.
( (root rawMorphs at: 5) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 48 Style: 'bold'.
( (root rawMorphs at: 5) rawMorphs at: 0 ) myLabel: 'ABC'.
( (root rawMorphs at: 5) rawMorphs at: 0 ) myPosition: (3)@(39).
( (root rawMorphs at: 5) rawMorphs at: 0 ) myWidth: 102.
( (root rawMorphs at: 5) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 5) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a circleMorph(type: circleMorph): "

( (root rawMorphs at: 9) rawMorphs at: 0 ) center: (28)@(28).
( (root rawMorphs at: 9) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 9) rawMorphs at: 0 ) radius: 25.
( (root rawMorphs at: 9) rawMorphs at: 0 ) rawColor: paint copyRed: 0.690127 Green: 0.218964  Blue: 0.875855.
( (root rawMorphs at: 9) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( (root rawMorphs at: 10) rawMorphs at: 0 ) baseMinHeight: 3.
( (root rawMorphs at: 10) rawMorphs at: 0 ) baseMinWidth: 3.
( (root rawMorphs at: 10) rawMorphs at: 0 ) borderWidth: 5.
( (root rawMorphs at: 10) rawMorphs at: 0 ) hResizing: 1.
( (root rawMorphs at: 10) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 10) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 10) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((84)@(33)).
( (root rawMorphs at: 10) rawMorphs at: 0 ) rawColor: paint copyRed: 0.812317 Green: 0.486804  Blue: 0.650049.
( (root rawMorphs at: 10) rawMorphs at: 0 ) vResizing: 1.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 11) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 11) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 11) rawMorphs at: 0 ) borderWidth: 3.
( (root rawMorphs at: 11) rawMorphs at: 0 ) filled: true.
( (root rawMorphs at: 11) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 11) rawMorphs at: 0 ) hResizing: 1.
( (root rawMorphs at: 11) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 11) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 11) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((221)@(37)).
( (root rawMorphs at: 11) rawMorphs at: 0 ) rawColor: paint copyRed: 0.884653 Green: 0.828934  Blue: 0.731183.
( (root rawMorphs at: 11) rawMorphs at: 0 ) vResizing: 1.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 12) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 12) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 12) rawMorphs at: 0 ) borderWidth: 8.
( (root rawMorphs at: 12) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 12) rawMorphs at: 0 ) frameStyle: 1.
( (root rawMorphs at: 12) rawMorphs at: 0 ) hResizing: 1.
( (root rawMorphs at: 12) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 12) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 12) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((80)@(58)).
( (root rawMorphs at: 12) rawMorphs at: 0 ) rawColor: paint copyRed: 0.746823 Green: 0.634409  Blue: 0.836755.
( (root rawMorphs at: 12) rawMorphs at: 0 ) vResizing: 1.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (root rawMorphs at: 14) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 14) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 14) rawMorphs at: 0 ) borderWidth: 2.
( (root rawMorphs at: 14) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.919844 Green: 0.675464  Blue: 0.552297.
( (root rawMorphs at: 14) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 14) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 14) rawMorphs at: 0 ) hResizing: 1.
( (root rawMorphs at: 14) rawMorphs at: 0 ) isAsynchronous: false.
( (root rawMorphs at: 14) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 14) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 14) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((44)@(21)).
( (root rawMorphs at: 14) rawMorphs at: 0 ) rawColor: paint copyRed: 0.86999 Green: 0.638319  Blue: 0.521994.
( (root rawMorphs at: 14) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (root rawMorphs at: 14) rawMorphs at: 0 ) rawState: 'up'.
( (root rawMorphs at: 14) rawMorphs at: 0 ) script: '    7 asCharacter print    '.
( (root rawMorphs at: 14) rawMorphs at: 0 ) vResizing: 2.
( (root rawMorphs at: 14) rawMorphs at: 0 ) script: '    7 asCharacter print    '.
( (root rawMorphs at: 14) rawMorphs at: 0 ) target: nil.
] value.

[
" State for: a clockMorph(type: clockMorph [18:18:57]): "

( (root rawMorphs at: 15) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 15) rawMorphs at: 0 ) myAscent: 18.
( (root rawMorphs at: 15) rawMorphs at: 0 ) myBox: ((3)@(3)) # ((87)@(27)).
( (root rawMorphs at: 15) rawMorphs at: 0 ) myDescent: 6.
( (root rawMorphs at: 15) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 24 Style: ''.
( (root rawMorphs at: 15) rawMorphs at: 0 ) myLabel: '18:18:57' copyMutable.
( (root rawMorphs at: 15) rawMorphs at: 0 ) myPosition: (3)@(21).
( (root rawMorphs at: 15) rawMorphs at: 0 ) myWidth: 84.
( (root rawMorphs at: 15) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 15) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 18) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 18) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 18) rawMorphs at: 0 ) borderWidth: 8.
( (root rawMorphs at: 18) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 18) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 18) rawMorphs at: 0 ) hResizing: 1.
( (root rawMorphs at: 18) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 18) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 18) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((69)@(57)).
( (root rawMorphs at: 18) rawMorphs at: 0 ) rawColor: paint copyRed: 0.875855 Green: 0.525904  Blue: 0.85826.
( (root rawMorphs at: 18) rawMorphs at: 0 ) vResizing: 1.
] value.

[
" State for: an updatingLabelMorph(type: updatingLabelMorph [4 frames/sec]): "

( (root rawMorphs at: 20) rawMorphs at: 0 ) count: 0.
( (root rawMorphs at: 20) rawMorphs at: 0 ) expression: 'framesPerSecondString'.
( (root rawMorphs at: 20) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 20) rawMorphs at: 0 ) lastUpdateTime: 8700526.
( (root rawMorphs at: 20) rawMorphs at: 0 ) myAscent: 11.
( (root rawMorphs at: 20) rawMorphs at: 0 ) myBox: ((3)@(3)) # ((76)@(17)).
( (root rawMorphs at: 20) rawMorphs at: 0 ) myDescent: 3.
( (root rawMorphs at: 20) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (root rawMorphs at: 20) rawMorphs at: 0 ) myLabel: '4 frames/sec' copyMutable.
( (root rawMorphs at: 20) rawMorphs at: 0 ) myPosition: (3)@(14).
( (root rawMorphs at: 20) rawMorphs at: 0 ) myWidth: 73.
( (root rawMorphs at: 20) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( (root rawMorphs at: 20) rawMorphs at: 0 ) sampleInterval: 250.
( (root rawMorphs at: 20) rawMorphs at: 0 ) target: (root rawMorphs at: 20) rawMorphs at: 0.
( (root rawMorphs at: 20) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a worldScrollerMorph(type: worldScrollerMorph): "

( (root rawMorphs at: 21) rawMorphs at: 0 ) baseMinHeight: 3.
( (root rawMorphs at: 21) rawMorphs at: 0 ) baseMinWidth: 3.
( (root rawMorphs at: 21) rawMorphs at: 0 ) borderWidth: 3.
( (root rawMorphs at: 21) rawMorphs at: 0 ) filled: true.
( (root rawMorphs at: 21) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 21) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 21) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 21) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 21) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((98)@(67)).
( (root rawMorphs at: 21) rawMorphs at: 0 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (root rawMorphs at: 21) rawMorphs at: 0 ) vResizing: 2.
] value.

[
" State for: a radarView(type: radarView): "

( (root rawMorphs at: 22) rawMorphs at: 0 ) baseMinHeight: 3.
( (root rawMorphs at: 22) rawMorphs at: 0 ) baseMinWidth: 3.
( (root rawMorphs at: 22) rawMorphs at: 0 ) borderWidth: 3.
( (root rawMorphs at: 22) rawMorphs at: 0 ) filled: true.
( (root rawMorphs at: 22) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 22) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 22) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 22) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 22) rawMorphs at: 0 ) panel: ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0.
( (root rawMorphs at: 22) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((275)@(159)).
( (root rawMorphs at: 22) rawMorphs at: 0 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (root rawMorphs at: 22) rawMorphs at: 0 ) vResizing: 2.
] value.

[
" State for: a sliderMorph(type: sliderMorph(value: 68.3544 min: 0.0 max: 100.0)): "

( (root rawMorphs at: 23) rawMorphs at: 0 ) hResizing: 0.
( (root rawMorphs at: 23) rawMorphs at: 0 ) height: 79.
( (root rawMorphs at: 23) rawMorphs at: 0 ) maxValue: 100.0.
( (root rawMorphs at: 23) rawMorphs at: 0 ) minValue: 0.0.
( (root rawMorphs at: 23) rawMorphs at: 0 ) myValue: 68.35443115.
( (root rawMorphs at: 23) rawMorphs at: 0 ) orientation: 0.
( (root rawMorphs at: 23) rawMorphs at: 0 ) position: (3)@(3).
( (root rawMorphs at: 23) rawMorphs at: 0 ) rawColor: paint copyRed: 0.928641 Green: 0.557185  Blue: 0.824047.
( (root rawMorphs at: 23) rawMorphs at: 0 ) selector: nil.
( (root rawMorphs at: 23) rawMorphs at: 0 ) sliderColor: paint named: 'black'.
( (root rawMorphs at: 23) rawMorphs at: 0 ) target: nil.
( (root rawMorphs at: 23) rawMorphs at: 0 ) vResizing: 0.
( (root rawMorphs at: 23) rawMorphs at: 0 ) width: 11.
] value.

[
" State for: a columnMorph(type: columnMorph): "

( (root rawMorphs at: 25) rawMorphs at: 0 ) baseMinHeight: 3.
( (root rawMorphs at: 25) rawMorphs at: 0 ) baseMinWidth: 3.
( (root rawMorphs at: 25) rawMorphs at: 0 ) borderWidth: 5.
( (root rawMorphs at: 25) rawMorphs at: 0 ) hResizing: 2.
( (root rawMorphs at: 25) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 25) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 25) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((318)@(88)).
( (root rawMorphs at: 25) rawMorphs at: 0 ) rawColor: paint copyRed: 0.750733 Green: 0.800587  Blue: 0.822092.
( (root rawMorphs at: 25) rawMorphs at: 0 ) vResizing: 2.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( (root rawMorphs at: 26) rawMorphs at: 0 ) baseMinHeight: 10.
( (root rawMorphs at: 26) rawMorphs at: 0 ) baseMinWidth: 10.
( (root rawMorphs at: 26) rawMorphs at: 0 ) borderWidth: 8.
( (root rawMorphs at: 26) rawMorphs at: 0 ) filled: false.
( (root rawMorphs at: 26) rawMorphs at: 0 ) frameStyle: 0.
( (root rawMorphs at: 26) rawMorphs at: 0 ) hResizing: 1.
( (root rawMorphs at: 26) rawMorphs at: 0 ) justification: 0.
( (root rawMorphs at: 26) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (root rawMorphs at: 26) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((384)@(697)).
( (root rawMorphs at: 26) rawMorphs at: 0 ) rawColor: paint copyRed: 0.691105 Green: 0.73607  Blue: 0.763441.
( (root rawMorphs at: 26) rawMorphs at: 0 ) vResizing: 1.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 5.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((215)@(31)).
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.884653 Green: 0.828934  Blue: 0.731183.
( ((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
] value.

[
" State for: a labelMorph(type: labelMorph [ Beep ]): "

( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((39)@(16)).
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: ' Beep '.
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 37.
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'black'.
( ((root rawMorphs at: 14) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( ((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 2.
( ((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( ((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((92)@(61)).
( ((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( ((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 2.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 2.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0 ) filled: true.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0 ) frameStyle: 2.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((269)@(113)).
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 2.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1 ) baseMinHeight: 3.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1 ) baseMinWidth: 3.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1 ) borderWidth: 2.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 1.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1 ) justification: 0.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((3)@(113)) # ((269)@(153)).
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( ((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 2.
] value.

[
" State for: a labelMorph(type: labelMorph [morph factory]): "

( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 25.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((54)@(5)) # ((260)@(38)).
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 8.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 33 Style: 'bold'.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'morph factory'.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (54)@(30).
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 206.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.12219 Green: 0.12219  Blue: 0.12219.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Attempting to pick up an object makes a copy.]): "

( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 1 ) myAscent: 11.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 1 ) myBox: ((15)@(38)) # ((299)@(52)).
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 1 ) myDescent: 3.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 1 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 1 ) myLabel: 'Attempting to pick up an object makes a copy.' copyMutable.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 1 ) myPosition: (15)@(49).
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 1 ) myWidth: 284.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.12219 Green: 0.12219  Blue: 0.12219.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Carry the copy directly into any Self window.]): "

( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 11.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((19)@(52)) # ((295)@(66)).
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 2 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: 'Carry the copy directly into any Self window.' copyMutable.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (19)@(63).
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 276.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.12219 Green: 0.12219  Blue: 0.12219.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Use `embed morph\' to add a morph to the factory.]): "

( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 3 ) hResizing: 0.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 3 ) myAscent: 11.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 3 ) myBox: ((5)@(66)) # ((310)@(80)).
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 3 ) myDescent: 3.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 3 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 3 ) myLabel: 'Use `embed morph\' to add a morph to the factory.' copyMutable.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 3 ) myPosition: (5)@(77).
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 3 ) myWidth: 305.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 3 ) rawColor: paint copyRed: 0.12219 Green: 0.12219  Blue: 0.12219.
( ((root rawMorphs at: 25) rawMorphs at: 0) rawMorphs at: 3 ) vResizing: 0.
] value.

[
" State for: a columnMorph(type: columnMorph): "

( ((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( ((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( ((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 5.
( ((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 2.
( ((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( ((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((8)@(8)) # ((373)@(686)).
( ((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( ((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 2.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 10.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 10.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 2.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.934506 Green: 0.875855  Blue: 0.772238.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) filled: false.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) frameStyle: 0.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 2.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) isAsynchronous: true.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((5)@(5)) # ((131)@(23)).
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.884653 Green: 0.828934  Blue: 0.731183.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawState: 'up'.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) script: '        [ | displayName |
 displayName: button owner morphs last morphs first contentsString.
 button world alsoOpenOnDisplay: displayName.
 self] value       '.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 2.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) script: '        [ | displayName |
 displayName: button owner morphs last morphs first contentsString.
 button world alsoOpenOnDisplay: displayName.
 self] value       '.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) target: nil.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) baseMinHeight: 3.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) baseMinWidth: 3.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) borderWidth: 2.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) filled: true.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) frameStyle: 1.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 2.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) justification: 0.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((131)@(5)) # ((207)@(23)).
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.884653 Green: 0.828934  Blue: 0.731183.
( (((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 2.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 10.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 10.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 2.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) filled: false.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) frameStyle: 0.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 2.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) isAsynchronous: false.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((2)@(20)) # ((22)@(38)).
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawState: 'up'.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) script: '    target moveViewForEvent: event By: ((target winCanvasForEvent: event) size x / 2 ) negate @ 0   '.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 2.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) script: '    target moveViewForEvent: event By: ((target winCanvasForEvent: event) size x / 2 ) negate @ 0   '.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) target: (root rawMorphs at: 21) rawMorphs at: 0.
] value.

[
" State for: a columnMorph(type: columnMorph): "

( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) baseMinHeight: 3.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) baseMinWidth: 3.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) borderWidth: 0.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 2.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) justification: 0.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((22)@(2)) # ((67)@(56)).
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 2.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) baseMinHeight: 10.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) baseMinWidth: 10.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) borderWidth: 2.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) filled: false.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) frameStyle: 0.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 2.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) isAsynchronous: false.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) justification: 0.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawBox: ((67)@(20)) # ((87)@(38)).
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawIsGrayedOut: false.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawState: 'up'.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) script: '    target moveViewForEvent: event By: ((target winCanvasForEvent: event) size x /2) @ 0   '.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 2.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) script: '    target moveViewForEvent: event By: ((target winCanvasForEvent: event) size x /2) @ 0   '.
( (((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) target: (root rawMorphs at: 21) rawMorphs at: 0.
] value.

[
" State for: a frameMorph(type: frameMorph): "

( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 3.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) filled: true.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) frameStyle: 1.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((264)@(108)).
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 2.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) baseMinHeight: 10.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) baseMinWidth: 10.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) borderWidth: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) filled: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) frameStyle: 0.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) isAsynchronous: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) justification: 0.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawBox: ((2)@(11)) # ((29)@(29)).
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawIsGrayedOut: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawState: 'up'.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) script: '   target panel isRunning ifTrue: [
                  target panel stop.
                  button label: \' on \'.
                ] False: [
                  target panel start.
                  button label: \' off \'.
                ].   '.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) script: '   target panel isRunning ifTrue: [
                  target panel stop.
                  button label: \' on \'.
                ] False: [
                  target panel start.
                  button label: \' off \'.
                ].   '.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) target: (root rawMorphs at: 22) rawMorphs at: 0.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) baseMinHeight: 10.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) baseMinWidth: 10.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) borderWidth: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) filled: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) frameStyle: 0.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) hResizing: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) isAsynchronous: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) justification: 0.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) rawBox: ((29)@(11)) # ((98)@(29)).
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) rawIsGrayedOut: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) rawState: 'up'.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) script: '   target zoomOut   '.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) vResizing: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) script: '   target zoomOut   '.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) target: (root rawMorphs at: 22) rawMorphs at: 0.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) baseMinHeight: 10.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) baseMinWidth: 10.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) borderWidth: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) filled: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) frameStyle: 0.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) hResizing: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) isAsynchronous: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) justification: 0.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) rawBox: ((98)@(11)) # ((159)@(29)).
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) rawIsGrayedOut: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) rawState: 'up'.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) script: '   target zoomIn   '.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) vResizing: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) script: '   target zoomIn   '.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) target: (root rawMorphs at: 22) rawMorphs at: 0.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) baseMinHeight: 10.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) baseMinWidth: 10.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) borderWidth: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) filled: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) frameStyle: 0.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) hResizing: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) isAsynchronous: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) justification: 0.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) rawBox: ((159)@(11)) # ((204)@(29)).
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) rawIsGrayedOut: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) rawState: 'up'.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) script: '    target moveViewForEvent: event To: 0@0   '.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) vResizing: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) script: '    target moveViewForEvent: event To: 0@0   '.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3 ) target: (root rawMorphs at: 22) rawMorphs at: 0.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) baseMinHeight: 10.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) baseMinWidth: 10.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) borderWidth: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) filled: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) frameStyle: 0.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) hResizing: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) isAsynchronous: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) justification: 0.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) rawBox: ((204)@(11)) # ((224)@(29)).
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) rawIsGrayedOut: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) rawState: 'up'.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) script: '    target moveViewForEvent: event By: ((target winCanvasForEvent: event) size x / 2 ) negate @ 0   '.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) vResizing: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) script: '    target moveViewForEvent: event By: ((target winCanvasForEvent: event) size x / 2 ) negate @ 0   '.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4 ) target: (root rawMorphs at: 22) rawMorphs at: 0.
] value.

[
" State for: a columnMorph(type: columnMorph): "

( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5 ) baseMinHeight: 3.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5 ) baseMinWidth: 3.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5 ) borderWidth: 0.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5 ) hResizing: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5 ) justification: 0.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5 ) rawBox: ((224)@(2)) # ((244)@(38)).
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5 ) vResizing: 2.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) baseMinHeight: 10.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) baseMinWidth: 10.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) borderWidth: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) filled: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) frameStyle: 0.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) hResizing: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) isAsynchronous: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) justification: 0.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) rawBox: ((244)@(11)) # ((264)@(29)).
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) rawIsGrayedOut: false.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) rawState: 'up'.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) script: '    target moveViewForEvent: event By: ((target winCanvasForEvent: event) size x /2) @ 0   '.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) vResizing: 2.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) script: '    target moveViewForEvent: event By: ((target winCanvasForEvent: event) size x /2) @ 0   '.
( (((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6 ) target: (root rawMorphs at: 22) rawMorphs at: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [keyboard commands]): "

( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 25.
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((35)@(5)) # ((330)@(38)).
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 8.
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 33 Style: 'bold' copyMutable.
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'keyboard commands' copyMutable.
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (35)@(30).
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 295.
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a rowMorph(type: rowMorph): "

( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) baseMinHeight: 3.
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) baseMinWidth: 3.
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) borderWidth: 5.
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 1.
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) justification: 0.
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((5)@(38)) # ((360)@(673)).
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
] value.

[
" State for: a labelMorph(type: labelMorph [share window with: ]): "

( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((124)@(16)).
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'share window with: ' copyMutable.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 122.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.184751 Green: 0.117302  Blue: 0.0.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) baseMinHeight: 3.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) baseMinWidth: 3.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) borderWidth: 1.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 1.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) justification: -1.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawBox: ((2)@(2)) # ((74)@(16)).
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.884653 Green: 0.884653  Blue: 0.884653.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawEditMode: true.
( ((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 2.
] value.

[
" State for: a labelMorph(type: labelMorph [ < ]): "

( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((18)@(16)).
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: ' < '.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 16.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) baseMinHeight: 10.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) baseMinWidth: 10.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) borderWidth: 2.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) filled: false.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) frameStyle: 0.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 2.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) isAsynchronous: false.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) justification: 0.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawBox: ((12)@(0)) # ((32)@(18)).
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawIsGrayedOut: false.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawState: 'up'.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) script: '    target moveViewForEvent: event By: (0 @ ((target winCanvasForEvent: event) size y negate / 2))   '.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 2.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) script: '    target moveViewForEvent: event By: (0 @ ((target winCanvasForEvent: event) size y negate / 2))   '.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) target: (root rawMorphs at: 21) rawMorphs at: 0.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) baseMinHeight: 10.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) baseMinWidth: 10.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) borderWidth: 2.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) filled: false.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) frameStyle: 0.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) hResizing: 2.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) isAsynchronous: false.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) justification: 0.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) rawBox: ((0)@(18)) # ((45)@(36)).
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) rawIsGrayedOut: false.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) rawState: 'up'.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) script: '    target moveViewForEvent: event To: 0@0   '.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) vResizing: 2.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) script: '    target moveViewForEvent: event To: 0@0   '.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) target: (root rawMorphs at: 21) rawMorphs at: 0.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) baseMinHeight: 10.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) baseMinWidth: 10.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) borderWidth: 2.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) filled: false.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) frameStyle: 0.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) hResizing: 2.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) isAsynchronous: false.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) justification: 0.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) rawBox: ((12)@(36)) # ((32)@(54)).
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) rawIsGrayedOut: false.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) rawState: 'up'.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) script: '    target moveViewForEvent: event By: (0 @ ((target winCanvasForEvent: event) size y / 2))   '.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) vResizing: 2.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) script: '    target moveViewForEvent: event By: (0 @ ((target winCanvasForEvent: event) size y / 2))   '.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2 ) target: (root rawMorphs at: 21) rawMorphs at: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ > ]): "

( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((18)@(16)).
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myLabel: ' > '.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myWidth: 16.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
( ((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a radarDisplayMorph(type: radarDisplayMorph): "

( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) frameCount: 0.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) framesBetweenUpdate: 20.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) isRunning: false.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((3)@(3)) # ((259)@(103)).
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint named: 'gray'.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) savedColor: paint copyRed: 0.929619 Green: 0.959922  Blue: 0.910068.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) scale: 0.05.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ on ]): "

( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((25)@(16)).
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: ' on '.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 23.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ zoom out ]): "

( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((67)@(16)).
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: ' zoom out '.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 65.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ zoom in ]): "

( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((59)@(16)).
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myLabel: ' zoom in '.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myWidth: 57.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ home ]): "

( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((43)@(16)).
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myLabel: ' home '.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myWidth: 41.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ < ]): "

( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((18)@(16)).
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myLabel: ' < '.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myWidth: 16.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) baseMinHeight: 10.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) baseMinWidth: 10.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) borderWidth: 2.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) filled: false.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) frameStyle: 0.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) hResizing: 2.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) isAsynchronous: false.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) justification: 0.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((20)@(18)).
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) rawIsGrayedOut: false.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) rawState: 'up'.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) script: '    target moveViewForEvent: event By: (0 @ ((target winCanvasForEvent: event) size y negate / 2))   '.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) vResizing: 2.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) script: '    target moveViewForEvent: event By: (0 @ ((target winCanvasForEvent: event) size y negate / 2))   '.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) target: (root rawMorphs at: 22) rawMorphs at: 0.
] value.

[
" State for: a ui2Button(type: ui2Button): "

( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) baseMinHeight: 10.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) baseMinWidth: 10.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) borderWidth: 2.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) depressedColor: paint copyRed: 0.887586 Green: 0.929619  Blue: 0.919844.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) filled: false.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) frameStyle: 0.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) hResizing: 2.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) isAsynchronous: false.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) justification: 0.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) rawBox: ((0)@(18)) # ((20)@(36)).
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) rawColor: paint copyRed: 0.839687 Green: 0.879765  Blue: 0.86999.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) rawIsGrayedOut: false.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) rawState: 'up'.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) script: '    target moveViewForEvent: event By: (0 @ ((target winCanvasForEvent: event) size y / 2))   '.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) vResizing: 2.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) script: '    target moveViewForEvent: event By: (0 @ ((target winCanvasForEvent: event) size y / 2))   '.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1 ) target: (root rawMorphs at: 22) rawMorphs at: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ > ]): "

( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) hResizing: 0.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myAscent: 11.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((18)@(16)).
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myDescent: 3.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myLabel: ' > '.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myPosition: (2)@(13).
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myWidth: 16.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
( ((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) baseMinHeight: 3.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) baseMinWidth: 3.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) borderWidth: 0.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 1.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) justification: -1.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) middleButtonMenu: nil.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawBox: ((5)@(5)) # ((177)@(629)).
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawEditMode: false.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 2.
] value.

[
" State for: an editorMorph(type: editorMorph): "

( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) baseMinHeight: 3.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) baseMinWidth: 3.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) borderWidth: 0.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) hResizing: 1.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) justification: -1.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) middleButtonMenu: nil.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) rawBox: ((177)@(5)) # ((350)@(630)).
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) rawEditMode: false.
( ((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1 ) vResizing: 2.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: nil.
( (((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((1)@(1)) # ((71)@(13)).
( (((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.884653 Green: 0.884653  Blue: 0.884653.
( (((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1.
( (((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
] value.

[
" State for: a labelMorph(type: labelMorph [ /\\ ]): "

( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((18)@(16)).
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: ' /\\ '.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 16.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ home ]): "

( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 11.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((43)@(16)).
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: ' home '.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(13).
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 41.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ \\/ ]): "

( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 0.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myAscent: 11.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((18)@(16)).
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myDescent: 3.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myLabel: ' \\/ '.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myPosition: (2)@(13).
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myWidth: 16.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
( (((((root rawMorphs at: 21) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ /\\ ]): "

( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((18)@(16)).
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: ' /\\ '.
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (2)@(13).
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 16.
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ \\/ ]): "

( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 11.
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((2)@(2)) # ((18)@(16)).
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 14 Style: 'bold'.
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: ' \\/ '.
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (2)@(13).
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 16.
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.179863 Green: 0.179863  Blue: 0.179863.
( (((((root rawMorphs at: 22) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) previousRow: nil.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((172)@(14)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((429)@(173)) # ((430)@(187)).
( root ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((0)@(14)) # ((172)@(28)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((429)@(173)) # ((430)@(187)).
( root ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) rawBox: ((0)@(28)) # ((172)@(42)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((429)@(173)) # ((430)@(187)).
( root ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3 ) rawBox: ((0)@(42)) # ((172)@(56)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((429)@(173)) # ((430)@(187)).
( root ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4 ) rawBox: ((0)@(56)) # ((172)@(70)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((429)@(173)) # ((430)@(187)).
( root ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5 ) rawBox: ((0)@(70)) # ((172)@(85)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6 ) rawBox: ((0)@(85)) # ((172)@(100)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7 ) rawBox: ((0)@(100)) # ((172)@(115)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8 ) rawBox: ((0)@(115)) # ((172)@(130)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9 ) rawBox: ((0)@(130)) # ((172)@(144)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10 ) rawBox: ((0)@(144)) # ((172)@(159)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11 ) rawBox: ((0)@(159)) # ((172)@(174)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12 ) rawBox: ((0)@(174)) # ((172)@(189)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13 ) rawBox: ((0)@(189)) # ((172)@(204)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14 ) rawBox: ((0)@(204)) # ((172)@(219)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15 ) rawBox: ((0)@(219)) # ((172)@(234)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16 ) rawBox: ((0)@(234)) # ((172)@(249)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17 ) rawBox: ((0)@(249)) # ((172)@(264)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18 ) rawBox: ((0)@(264)) # ((172)@(279)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19 ) rawBox: ((0)@(279)) # ((172)@(294)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20 ) rawBox: ((0)@(294)) # ((172)@(309)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21 ) rawBox: ((0)@(309)) # ((172)@(324)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22 ) rawBox: ((0)@(324)) # ((172)@(339)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23 ) rawBox: ((0)@(339)) # ((172)@(354)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24 ) rawBox: ((0)@(354)) # ((172)@(369)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25 ) rawBox: ((0)@(369)) # ((172)@(384)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26 ) rawBox: ((0)@(384)) # ((172)@(399)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27 ) rawBox: ((0)@(399)) # ((172)@(414)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28 ) rawBox: ((0)@(414)) # ((172)@(429)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29 ) rawBox: ((0)@(429)) # ((172)@(444)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30 ) rawBox: ((0)@(444)) # ((172)@(459)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31 ) rawBox: ((0)@(459)) # ((172)@(474)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32 ) rawBox: ((0)@(474)) # ((172)@(489)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33 ) rawBox: ((0)@(489)) # ((172)@(504)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34 ) rawBox: ((0)@(504)) # ((172)@(519)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35 ) rawBox: ((0)@(519)) # ((172)@(534)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36 ) rawBox: ((0)@(534)) # ((172)@(549)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37 ) rawBox: ((0)@(549)) # ((172)@(564)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38 ) rawBox: ((0)@(564)) # ((172)@(579)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39 ) rawBox: ((0)@(579)) # ((172)@(594)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40 ) rawBox: ((0)@(594)) # ((172)@(609)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41 ) nextRow: nil.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41 ) rawBox: ((0)@(609)) # ((172)@(624)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((828)@(296)) # ((829)@(311)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) previousRow: nil.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((173)@(14)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((536)@(173)) # ((537)@(187)).
( root ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1 ) rawBox: ((0)@(14)) # ((173)@(28)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((536)@(173)) # ((537)@(187)).
( root ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2 ) rawBox: ((0)@(28)) # ((173)@(42)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((536)@(173)) # ((537)@(187)).
( root ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3 ) rawBox: ((0)@(42)) # ((173)@(56)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((536)@(173)) # ((537)@(187)).
( root ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4 ) rawBox: ((0)@(56)) # ((173)@(70)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((536)@(173)) # ((537)@(187)).
( root ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5 ) rawBox: ((0)@(70)) # ((173)@(85)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6 ) rawBox: ((0)@(85)) # ((173)@(100)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7 ) rawBox: ((0)@(100)) # ((173)@(115)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8 ) rawBox: ((0)@(115)) # ((173)@(130)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9 ) rawBox: ((0)@(130)) # ((173)@(145)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10 ) rawBox: ((0)@(145)) # ((173)@(160)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11 ) rawBox: ((0)@(160)) # ((173)@(175)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12 ) rawBox: ((0)@(175)) # ((173)@(190)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13 ) rawBox: ((0)@(190)) # ((173)@(205)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14 ) rawBox: ((0)@(205)) # ((173)@(220)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15 ) rawBox: ((0)@(220)) # ((173)@(235)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16 ) rawBox: ((0)@(235)) # ((173)@(250)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17 ) rawBox: ((0)@(250)) # ((173)@(265)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18 ) rawBox: ((0)@(265)) # ((173)@(280)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19 ) rawBox: ((0)@(280)) # ((173)@(295)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20 ) rawBox: ((0)@(295)) # ((173)@(310)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21 ) rawBox: ((0)@(310)) # ((173)@(325)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22 ) rawBox: ((0)@(325)) # ((173)@(340)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23 ) rawBox: ((0)@(340)) # ((173)@(355)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24 ) rawBox: ((0)@(355)) # ((173)@(370)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25 ) rawBox: ((0)@(370)) # ((173)@(385)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26 ) rawBox: ((0)@(385)) # ((173)@(400)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27 ) rawBox: ((0)@(400)) # ((173)@(415)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28 ) rawBox: ((0)@(415)) # ((173)@(430)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29 ) rawBox: ((0)@(430)) # ((173)@(445)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30 ) rawBox: ((0)@(445)) # ((173)@(460)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31 ) rawBox: ((0)@(460)) # ((173)@(475)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32 ) rawBox: ((0)@(475)) # ((173)@(490)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33 ) rawBox: ((0)@(490)) # ((173)@(505)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34 ) rawBox: ((0)@(505)) # ((173)@(520)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35 ) rawBox: ((0)@(520)) # ((173)@(535)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36 ) rawBox: ((0)@(535)) # ((173)@(550)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37 ) rawBox: ((0)@(550)) # ((173)@(565)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38 ) rawBox: ((0)@(565)) # ((173)@(580)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39 ) rawBox: ((0)@(580)) # ((173)@(595)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40 ) nextRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40 ) rawBox: ((0)@(595)) # ((173)@(610)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40 ) vResizing: 1.
] value.

[
" State for: an editorRowMorph(type: editorRowMorph): "

( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41 ) baseMinHeight: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41 ) baseMinWidth: 3.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41 ) borderWidth: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41 ) defaultFontColor: paint named: 'black'.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41 ) defaultFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41 ) hResizing: 1.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41 ) justification: 0.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41 ) nextRow: nil.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41 ) nonLaidOutMorphs: vector.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41 ) previousRow: (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41 ) rawBox: ((0)@(610)) # ((173)@(625)).
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41 ) rawColor: paint copyRed: 0.727273 Green: 0.763441  Blue: 0.790811.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41 ) rawTyper: "$Revision: 21.7 $"
[ | root |
root: caretMorph copyRemoveAllMorphs.

"building skeleton"

[
( root ) addAllMorphs: ( morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs & morphFinder copyRemoveAllMorphs ) asList.
] value.

"end of skeleton"

[
" State for: a caretMorph(type: caretMorph): "

( root ) fontColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) fontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( root ) hResizing: 0.
( root ) rawBox: ((1005)@(401)) # ((1006)@(416)).
( root ) rawColor: paint copyRed: 0.0635386 Green: 0.0635386  Blue: 0.0635386.
( root ) vResizing: 1.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 0 ) borderWidth: 3.
( root rawMorphs at: 0 ) filled: true.
( root rawMorphs at: 0 ) focusPoint: (0)@(0).
( root rawMorphs at: 0 ) frameStyle: 0.
( root rawMorphs at: 0 ) hResizing: 0.
( root rawMorphs at: 0 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 0 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 0 ) looksHollow: true.
( root rawMorphs at: 0 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 0 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 0 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 0 ) selectedMorph: nil.
( root rawMorphs at: 0 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 0 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a morphFinder(type: simpleFrameMorph): "

( root rawMorphs at: 1 ) borderWidth: 3.
( root rawMorphs at: 1 ) filled: true.
( root rawMorphs at: 1 ) focusPoint: (0)@(0).
( root rawMorphs at: 1 ) frameStyle: 0.
( root rawMorphs at: 1 ) hResizing: 0.
( root rawMorphs at: 1 ) hilightColor1: paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
( root rawMorphs at: 1 ) hilightColor2: paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
( root rawMorphs at: 1 ) looksHollow: true.
( root rawMorphs at: 1 ) minCornerOffset: (0)@(0).
( root rawMorphs at: 1 ) rawBox: ((0)@(0)) # ((50)@(50)).
( root rawMorphs at: 1 ) rawColor: paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
( root rawMorphs at: 1 ) selectedMorph: nil.
( root rawMorphs at: 1 ) shadowColor1: paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
( root rawMorphs at: 1 ) shadowColor2: paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
( root rawMorphs at: 1 ) vResizing: 0.
] value.

root ] value
.
( (((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41 ) vResizing: 1.
] value.

[
" State for: a labelMorph(type: labelMorph [hostname]): "

( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 9.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((50)@(12)).
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'times' Size: 12 Style: 'bold'.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'hostname' copyMutable.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(9).
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 50.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.184751 Green: 0.184751  Blue: 0.184751.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a caretMorph(type: caretMorph): "

( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontColor: paint copyRed: 0.184751 Green: 0.184751  Blue: 0.184751.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) fontSpec: fontSpec copyName: 'times' Size: 12 Style: 'bold'.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) hResizing: 0.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawBox: ((50)@(0)) # ((51)@(12)).
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) rawColor: paint copyRed: 0.184751 Green: 0.184751  Blue: 0.184751.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1 ) vResizing: 1.
] value.

[
" State for: a labelMorph(type: labelMorph [:]): "

( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) hResizing: 0.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myAscent: 9.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myBox: ((51)@(0)) # ((55)@(12)).
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myDescent: 3.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myFontSpec: fontSpec copyName: 'times' Size: 12 Style: 'bold'.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myLabel: ':'.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myPosition: (51)@(9).
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) myWidth: 4.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) rawColor: paint copyRed: 0.184751 Green: 0.184751  Blue: 0.184751.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 2 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [0]): "

( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 3 ) hResizing: 0.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 3 ) myAscent: 9.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 3 ) myBox: ((55)@(0)) # ((61)@(12)).
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 3 ) myDescent: 3.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 3 ) myFontSpec: fontSpec copyName: 'times' Size: 12 Style: 'bold'.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 3 ) myLabel: '0'.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 3 ) myPosition: (55)@(9).
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 3 ) myWidth: 6.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 3 ) rawColor: paint copyRed: 0.184751 Green: 0.184751  Blue: 0.184751.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 3 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [.]): "

( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 4 ) hResizing: 0.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 4 ) myAscent: 9.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 4 ) myBox: ((61)@(0)) # ((64)@(12)).
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 4 ) myDescent: 3.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 4 ) myFontSpec: fontSpec copyName: 'times' Size: 12 Style: 'bold'.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 4 ) myLabel: '.'.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 4 ) myPosition: (61)@(9).
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 4 ) myWidth: 3.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 4 ) rawColor: paint copyRed: 0.184751 Green: 0.184751  Blue: 0.184751.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 4 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [0]): "

( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 5 ) hResizing: 0.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 5 ) myAscent: 9.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 5 ) myBox: ((64)@(0)) # ((70)@(12)).
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 5 ) myDescent: 3.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 5 ) myFontSpec: fontSpec copyName: 'times' Size: 12 Style: 'bold'.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 5 ) myLabel: '0'.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 5 ) myPosition: (64)@(9).
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 5 ) myWidth: 6.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 5 ) rawColor: paint copyRed: 0.184751 Green: 0.184751  Blue: 0.184751.
( ((((((root rawMorphs at: 11) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 5 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Cmd]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((38)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'Cmd' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 38.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((10)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 10.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [r]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((6)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myLabel: 'r'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) myWidth: 6.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [e]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 1 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 1 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 1 ) myBox: ((6)@(0)) # ((12)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 1 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 1 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 1 ) myLabel: 'e'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 1 ) myPosition: (6)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 1 ) myWidth: 6.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 1 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 1 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [s]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 2 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 2 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 2 ) myBox: ((12)@(0)) # ((18)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 2 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 2 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 2 ) myLabel: 's'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 2 ) myPosition: (12)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 2 ) myWidth: 6.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 2 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 2 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [i]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 3 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 3 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 3 ) myBox: ((18)@(0)) # ((22)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 3 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 3 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 3 ) myLabel: 'i'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 3 ) myPosition: (18)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 3 ) myWidth: 4.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 3 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 3 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [z]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 4 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 4 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 4 ) myBox: ((22)@(0)) # ((28)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 4 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 4 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 4 ) myLabel: 'z'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 4 ) myPosition: (22)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 4 ) myWidth: 6.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 4 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 4 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [e]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 5 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 5 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 5 ) myBox: ((28)@(0)) # ((34)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 5 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 5 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 5 ) myLabel: 'e'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 5 ) myPosition: (28)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 5 ) myWidth: 6.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 5 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 5 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ ]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 6 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 6 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 6 ) myBox: ((34)@(0)) # ((37)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 6 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 6 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 6 ) myLabel: ' '.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 6 ) myPosition: (34)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 6 ) myWidth: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 6 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 6 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [t]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 7 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 7 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 7 ) myBox: ((37)@(0)) # ((41)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 7 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 7 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 7 ) myLabel: 't'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 7 ) myPosition: (37)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 7 ) myWidth: 4.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 7 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 7 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [o]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 8 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 8 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 8 ) myBox: ((41)@(0)) # ((47)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 8 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 8 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 8 ) myLabel: 'o'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 8 ) myPosition: (41)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 8 ) myWidth: 6.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 8 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 8 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ ]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 9 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 9 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 9 ) myBox: ((47)@(0)) # ((50)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 9 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 9 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 9 ) myLabel: ' '.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 9 ) myPosition: (47)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 9 ) myWidth: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 9 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 9 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [f]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 10 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 10 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 10 ) myBox: ((50)@(0)) # ((54)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 10 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 10 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 10 ) myLabel: 'f'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 10 ) myPosition: (50)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 10 ) myWidth: 4.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 10 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 10 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [i]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 11 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 11 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 11 ) myBox: ((54)@(0)) # ((58)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 11 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 11 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 11 ) myLabel: 'i'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 11 ) myPosition: (54)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 11 ) myWidth: 4.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 11 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 11 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [t]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 12 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 12 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 12 ) myBox: ((58)@(0)) # ((62)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 12 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 12 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 12 ) myLabel: 't'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 12 ) myPosition: (58)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 12 ) myWidth: 4.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 12 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 12 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ ]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 13 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 13 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 13 ) myBox: ((62)@(0)) # ((65)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 13 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 13 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 13 ) myLabel: ' '.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 13 ) myPosition: (62)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 13 ) myWidth: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 13 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 13 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [t]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 14 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 14 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 14 ) myBox: ((65)@(0)) # ((69)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 14 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 14 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 14 ) myLabel: 't'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 14 ) myPosition: (65)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 14 ) myWidth: 4.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 14 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 14 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [e]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 15 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 15 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 15 ) myBox: ((69)@(0)) # ((75)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 15 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 15 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 15 ) myLabel: 'e'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 15 ) myPosition: (69)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 15 ) myWidth: 6.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 15 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 15 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [x]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 16 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 16 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 16 ) myBox: ((75)@(0)) # ((82)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 16 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 16 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 16 ) myLabel: 'x'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 16 ) myPosition: (75)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 16 ) myWidth: 7.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 16 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 16 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [t]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 17 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 17 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 17 ) myBox: ((82)@(0)) # ((86)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 17 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 17 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 17 ) myLabel: 't'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 17 ) myPosition: (82)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 17 ) myWidth: 4.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 17 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 17 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 18 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 18 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 18 ) myBox: ((86)@(0)) # ((96)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 18 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 18 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 18 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 18 ) myPosition: (86)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 18 ) myWidth: 10.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 18 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 2) rawMorphs at: 18 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3) rawMorphs at: 0 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((10)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3) rawMorphs at: 0 ) myWidth: 10.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 3) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [move a little bit]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4) rawMorphs at: 0 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((86)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4) rawMorphs at: 0 ) myLabel: 'move a little bit' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4) rawMorphs at: 0 ) myWidth: 86.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 4) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [move a medium amount]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((155)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5) rawMorphs at: 0 ) myLabel: 'move a medium amount' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5) rawMorphs at: 0 ) myWidth: 155.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 5) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [move to beginning of line]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((160)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6) rawMorphs at: 0 ) myLabel: 'move to beginning of line' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6) rawMorphs at: 0 ) myWidth: 160.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 6) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [move to end of line]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((126)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7) rawMorphs at: 0 ) myLabel: 'move to end of line' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7) rawMorphs at: 0 ) myWidth: 126.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 7) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [move to previous line]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((138)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8) rawMorphs at: 0 ) myLabel: 'move to previous line' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8) rawMorphs at: 0 ) myWidth: 138.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 8) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [move to next line]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9) rawMorphs at: 0 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((96)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9) rawMorphs at: 0 ) myLabel: 'move to next line' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9) rawMorphs at: 0 ) myWidth: 96.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 9) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [move to previous character]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((172)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10) rawMorphs at: 0 ) myLabel: 'move to previous character' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10) rawMorphs at: 0 ) myWidth: 172.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 10) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [move to next character]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((148)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11) rawMorphs at: 0 ) myLabel: 'move to next character' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11) rawMorphs at: 0 ) myWidth: 148.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 11) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 12) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [extend selection]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((109)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13) rawMorphs at: 0 ) myLabel: 'extend selection' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13) rawMorphs at: 0 ) myWidth: 109.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 13) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [select all]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((65)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14) rawMorphs at: 0 ) myLabel: 'select all' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14) rawMorphs at: 0 ) myWidth: 65.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 14) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 15) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [delete next character]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((138)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16) rawMorphs at: 0 ) myLabel: 'delete next character' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16) rawMorphs at: 0 ) myWidth: 138.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 16) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [backspace]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((77)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17) rawMorphs at: 0 ) myLabel: 'backspace' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17) rawMorphs at: 0 ) myWidth: 77.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 17) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [delete line]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((75)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18) rawMorphs at: 0 ) myLabel: 'delete line' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18) rawMorphs at: 0 ) myWidth: 75.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 18) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [delete word backwards]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((151)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19) rawMorphs at: 0 ) myLabel: 'delete word backwards' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19) rawMorphs at: 0 ) myWidth: 151.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 19) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 20) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [cut]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((32)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21) rawMorphs at: 0 ) myLabel: 'cut' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21) rawMorphs at: 0 ) myWidth: 32.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 21) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [copy]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((42)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22) rawMorphs at: 0 ) myLabel: 'copy' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22) rawMorphs at: 0 ) myWidth: 42.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 22) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [paste]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((47)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23) rawMorphs at: 0 ) myLabel: 'paste' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23) rawMorphs at: 0 ) myWidth: 47.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 23) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 24) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [split line]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((63)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25) rawMorphs at: 0 ) myLabel: 'split line' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25) rawMorphs at: 0 ) myWidth: 63.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 25) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [open line]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((68)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26) rawMorphs at: 0 ) myLabel: 'open line' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26) rawMorphs at: 0 ) myWidth: 68.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 26) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [search for paste buffer text]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((172)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27) rawMorphs at: 0 ) myLabel: 'search for paste buffer text'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27) rawMorphs at: 0 ) myWidth: 172.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 27) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [transpose characters]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((136)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28) rawMorphs at: 0 ) myLabel: 'transpose characters' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28) rawMorphs at: 0 ) myWidth: 136.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 28) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 29) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [senders]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((61)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30) rawMorphs at: 0 ) myLabel: 'senders' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30) rawMorphs at: 0 ) myWidth: 61.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 30) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [implementors]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((94)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31) rawMorphs at: 0 ) myLabel: 'implementors' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31) rawMorphs at: 0 ) myWidth: 94.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 31) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [find slot]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((61)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32) rawMorphs at: 0 ) myLabel: 'find slot' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32) rawMorphs at: 0 ) myWidth: 61.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 32) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [methods containing text]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((153)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33) rawMorphs at: 0 ) myLabel: 'methods containing text' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33) rawMorphs at: 0 ) myWidth: 153.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 33) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [get it]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((44)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34) rawMorphs at: 0 ) myLabel: 'get it' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34) rawMorphs at: 0 ) myWidth: 44.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 34) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 35) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [delete morph]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((93)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36) rawMorphs at: 0 ) myLabel: 'delete morph' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36) rawMorphs at: 0 ) myWidth: 93.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 36) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 37) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [accept]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((53)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38) rawMorphs at: 0 ) myLabel: 'accept' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38) rawMorphs at: 0 ) myWidth: 53.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 38) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [cancel]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((51)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39) rawMorphs at: 0 ) myLabel: 'cancel' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39) rawMorphs at: 0 ) myWidth: 51.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 39) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 40) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [save snapshot]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((82)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41) rawMorphs at: 0 ) myLabel: 'save snapshot' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41) rawMorphs at: 0 ) myWidth: 82.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 41) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Meta]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((39)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myLabel: 'Meta' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) myWidth: 39.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((10)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) myWidth: 10.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-l]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((31)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myLabel: 'Ctrl-l' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) myWidth: 31.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 1 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 1 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 1 ) myBox: ((31)@(0)) # ((41)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 1 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 1 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 1 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 1 ) myPosition: (31)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 1 ) myWidth: 10.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 1 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 2) rawMorphs at: 1 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((10)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) myWidth: 10.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 3) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [arrow]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myAscent: 11.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((35)@(14)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myLabel: 'arrow' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myPosition: (0)@(11).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) myWidth: 35.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 4) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-arrow or Option-arrow]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((173)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) myLabel: 'Ctrl-arrow or Option-arrow' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) myWidth: 173.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 5) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-a]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((49)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myLabel: 'Ctrl-a' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) myWidth: 49.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 6) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-e]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((49)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7) rawMorphs at: 0 ) myLabel: 'Ctrl-e' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7) rawMorphs at: 0 ) myWidth: 49.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 7) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-p]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((50)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8) rawMorphs at: 0 ) myLabel: 'Ctrl-p' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8) rawMorphs at: 0 ) myWidth: 50.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 8) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-n]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((49)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9) rawMorphs at: 0 ) myLabel: 'Ctrl-n' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9) rawMorphs at: 0 ) myWidth: 49.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 9) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-b]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((50)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10) rawMorphs at: 0 ) myLabel: 'Ctrl-b' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10) rawMorphs at: 0 ) myWidth: 50.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 10) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctr]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((17)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 0 ) myLabel: 'Ctr' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 0 ) myWidth: 17.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [l-f]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 1 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 1 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 1 ) myBox: ((17)@(0)) # ((46)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 1 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 1 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 1 ) myLabel: 'l-f' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 1 ) myPosition: (17)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 1 ) myWidth: 29.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 1 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 11) rawMorphs at: 1 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 12) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [hold Shift during movement]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((173)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13) rawMorphs at: 0 ) myLabel: 'hold Shift during movement' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13) rawMorphs at: 0 ) myWidth: 173.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 13) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Meta-a]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((57)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14) rawMorphs at: 0 ) myLabel: 'Meta-a' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14) rawMorphs at: 0 ) myWidth: 57.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 14) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 15) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-d]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((50)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16) rawMorphs at: 0 ) myLabel: 'Ctrl-d' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16) rawMorphs at: 0 ) myWidth: 50.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 16) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-h]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((49)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17) rawMorphs at: 0 ) myLabel: 'Ctrl-h' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17) rawMorphs at: 0 ) myWidth: 49.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 17) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-k]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((49)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18) rawMorphs at: 0 ) myLabel: 'Ctrl-k' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18) rawMorphs at: 0 ) myWidth: 49.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 18) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-w]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((51)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19) rawMorphs at: 0 ) myLabel: 'Ctrl-w' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19) rawMorphs at: 0 ) myWidth: 51.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 19) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 20) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-x or Meta-x]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((111)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21) rawMorphs at: 0 ) myLabel: 'Ctrl-x or Meta-x' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21) rawMorphs at: 0 ) myWidth: 111.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 21) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [C]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((8)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 0 ) myLabel: 'C'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 0 ) myWidth: 8.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [t]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 1 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 1 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 1 ) myBox: ((8)@(0)) # ((12)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 1 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 1 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 1 ) myLabel: 't'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 1 ) myPosition: (8)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 1 ) myWidth: 4.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 1 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 1 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [r]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 2 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 2 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 2 ) myBox: ((12)@(0)) # ((17)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 2 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 2 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 2 ) myLabel: 'r'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 2 ) myPosition: (12)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 2 ) myWidth: 5.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 2 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 2 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [l]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 3 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 3 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 3 ) myBox: ((17)@(0)) # ((20)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 3 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 3 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 3 ) myLabel: 'l'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 3 ) myPosition: (17)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 3 ) myWidth: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 3 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 3 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [-]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 4 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 4 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 4 ) myBox: ((20)@(0)) # ((27)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 4 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 4 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 4 ) myLabel: '-'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 4 ) myPosition: (20)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 4 ) myWidth: 7.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 4 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 4 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [c]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 5 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 5 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 5 ) myBox: ((27)@(0)) # ((33)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 5 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 5 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 5 ) myLabel: 'c'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 5 ) myPosition: (27)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 5 ) myWidth: 6.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 5 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 5 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ ]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 6 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 6 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 6 ) myBox: ((33)@(0)) # ((37)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 6 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 6 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 6 ) myLabel: ' '.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 6 ) myPosition: (33)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 6 ) myWidth: 4.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 6 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 6 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [o]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 7 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 7 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 7 ) myBox: ((37)@(0)) # ((44)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 7 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 7 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 7 ) myLabel: 'o'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 7 ) myPosition: (37)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 7 ) myWidth: 7.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 7 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 7 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [r]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 8 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 8 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 8 ) myBox: ((44)@(0)) # ((49)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 8 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 8 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 8 ) myLabel: 'r'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 8 ) myPosition: (44)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 8 ) myWidth: 5.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 8 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 8 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [ ]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 9 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 9 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 9 ) myBox: ((49)@(0)) # ((53)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 9 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 9 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 9 ) myLabel: ' '.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 9 ) myPosition: (49)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 9 ) myWidth: 4.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 9 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 9 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [M]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 10 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 10 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 10 ) myBox: ((53)@(0)) # ((63)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 10 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 10 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 10 ) myLabel: 'M'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 10 ) myPosition: (53)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 10 ) myWidth: 10.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 10 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 10 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [e]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 11 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 11 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 11 ) myBox: ((63)@(0)) # ((70)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 11 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 11 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 11 ) myLabel: 'e'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 11 ) myPosition: (63)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 11 ) myWidth: 7.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 11 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 11 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [t]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 12 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 12 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 12 ) myBox: ((70)@(0)) # ((74)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 12 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 12 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 12 ) myLabel: 't'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 12 ) myPosition: (70)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 12 ) myWidth: 4.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 12 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 12 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [a]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 13 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 13 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 13 ) myBox: ((74)@(0)) # ((81)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 13 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 13 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 13 ) myLabel: 'a'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 13 ) myPosition: (74)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 13 ) myWidth: 7.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 13 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 13 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [-]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 14 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 14 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 14 ) myBox: ((81)@(0)) # ((88)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 14 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 14 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 14 ) myLabel: '-'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 14 ) myPosition: (81)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 14 ) myWidth: 7.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 14 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 14 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [c]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 15 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 15 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 15 ) myBox: ((88)@(0)) # ((94)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 15 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 15 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 15 ) myLabel: 'c'.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 15 ) myPosition: (88)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 15 ) myWidth: 6.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 15 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 15 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 16 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 16 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 16 ) myBox: ((94)@(0)) # ((109)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 16 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 16 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 16 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 16 ) myPosition: (94)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 16 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 16 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 22) rawMorphs at: 16 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-v or Meta-v or Ctrl-y]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((162)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23) rawMorphs at: 0 ) myLabel: 'Ctrl-v or Meta-v or Ctrl-y' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23) rawMorphs at: 0 ) myWidth: 162.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 23) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 24) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-m]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((53)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25) rawMorphs at: 0 ) myLabel: 'Ctrl-m' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25) rawMorphs at: 0 ) myWidth: 53.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 25) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-o]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((49)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26) rawMorphs at: 0 ) myLabel: 'Ctrl-o' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26) rawMorphs at: 0 ) myWidth: 49.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 26) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-s]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((48)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27) rawMorphs at: 0 ) myLabel: 'Ctrl-s' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27) rawMorphs at: 0 ) myWidth: 48.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 27) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-t]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((46)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28) rawMorphs at: 0 ) myLabel: 'Ctrl-t' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28) rawMorphs at: 0 ) myWidth: 46.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 28) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 29) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Meta-n]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((57)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30) rawMorphs at: 0 ) myLabel: 'Meta-n' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30) rawMorphs at: 0 ) myWidth: 57.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 30) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Meta-m]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((61)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31) rawMorphs at: 0 ) myLabel: 'Meta-m' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31) rawMorphs at: 0 ) myWidth: 61.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 31) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Meta-l]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((53)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32) rawMorphs at: 0 ) myLabel: 'Meta-l' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32) rawMorphs at: 0 ) myWidth: 53.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 32) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Meta-t]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((54)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33) rawMorphs at: 0 ) myLabel: 'Meta-t' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33) rawMorphs at: 0 ) myWidth: 54.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 33) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Meta-g]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((57)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34) rawMorphs at: 0 ) myLabel: 'Meta-g' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34) rawMorphs at: 0 ) myWidth: 57.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 34) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 35) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Meta-d]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((58)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36) rawMorphs at: 0 ) myLabel: 'Meta-d' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36) rawMorphs at: 0 ) myWidth: 58.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 36) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 37) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Ctrl-Enter or Meta-Enter]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((157)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38) rawMorphs at: 0 ) myLabel: 'Ctrl-Enter or Meta-Enter' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38) rawMorphs at: 0 ) myWidth: 157.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 38) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Esc or Meta-.]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((93)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39) rawMorphs at: 0 ) myLabel: 'Esc or Meta-.' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39) rawMorphs at: 0 ) myWidth: 93.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 39) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph []): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((15)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40) rawMorphs at: 0 ) myLabel: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40) rawMorphs at: 0 ) myWidth: 15.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 40) rawMorphs at: 0 ) vResizing: 0.
] value.

[
" State for: a labelMorph(type: labelMorph [Meta-s]): "

( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41) rawMorphs at: 0 ) hResizing: 0.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41) rawMorphs at: 0 ) myAscent: 12.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41) rawMorphs at: 0 ) myBox: ((0)@(0)) # ((41)@(15)).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41) rawMorphs at: 0 ) myDescent: 3.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41) rawMorphs at: 0 ) myFontSpec: fontSpec copyName: 'newCenturySchoolbook' Size: 12 Style: ''.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41) rawMorphs at: 0 ) myLabel: 'Meta-s' copyMutable.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41) rawMorphs at: 0 ) myPosition: (0)@(12).
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41) rawMorphs at: 0 ) myWidth: 41.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41) rawMorphs at: 0 ) rawColor: paint copyRed: 0.0909091 Green: 0.0909091  Blue: 0.0909091.
( ((((((root rawMorphs at: 26) rawMorphs at: 0) rawMorphs at: 0) rawMorphs at: 1) rawMorphs at: 1) rawMorphs at: 41) rawMorphs at: 0 ) vResizing: 0.
] value.

root ] value
