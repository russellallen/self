 '$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: public'
        
         clockMorph = bootstrap define: bootstrap stub -> 'globals' -> 'clockMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals labelMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'clockMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals clockMorph.

CopyDowns:
globals labelMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'clockMorph' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clockMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fModuleInfo: Module: demoUtilities InitialContents: FollowSlot'
        
         demoUtilities = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'demoUtilities' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals demoUtilities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: private'
        
         buildAnimators = ( |
             a.
             c.
             fs.
            | 
            c: columnMorph copy velcroFlag: false.
            a: columnMorph copy _AddSlots: (|
                wantsMorph: m Event: evt = (true).
                addDroppingMorph: m Event: evt = (| a1. sec = 2 |
                    world addMorph: m.
                    world moveToFront: m.

                    a1: positionAnimator copyTarget: m Seconds: sec.
                    a1 from: m globalPosition.
                    a1 to:  (m globalPosition + (500@0)).
                    a1 useSlowInOut: true.
                    a1 abortOnTargetGrab: true.

                    world addActivity: a1.
                    self).
            |).

            fs: labelMorph fontSpec copySize: outlinerPreferences fontSpec size.
            a color: (paint copyRed: 0.63 Green: 0.67  Blue: 0.88).
            a addMorph: ((labelMorph copyLabel: 'Move') 
                                      fontSpec: fs).
            c addMorphLast: a.

            a: columnMorph copy _AddSlots: (|
                wantsMorph: m Event: evt = (true).
                addDroppingMorph: m Event: evt = (| a1. a2. sec = 2 |
                    world addMorph: m.
                    world moveToFront: m.

                    a1: sizeAnimator copyTarget: m Frames: 30.
                    a1 from: m bounds size.
                    a1 to:   m bounds height@m bounds width.
                    a1 useSlowInOut: true.
                    a1 abortOnTargetGrab: false.

                    a2: sizeAnimator copyTarget: m Frames: 30.
                    a2 from: m bounds height@m bounds width.
                    a2 to:   m bounds size.
                    a2 useSlowInOut: true.
                    a2 abortOnTargetGrab: false.

                    world addActivity: (a1 andThen: a2) abortOnTargetGrab: false.
                    self).
            |).
            a color: (paint copyRed: 0.63 Green: 0.67  Blue: 0.88).
            a addMorph: ((labelMorph copyLabel: 'Stretch') fontSpec: fs).
            c addMorphLast: a.


            a: columnMorph copy beShrinkWrap _AddSlots: (|
                wantsMorph: m Event: evt = (true).
                addDroppingMorph: m Event: evt = (| a1. a2. a3. sec = 2 |
                    world addMorph: m.
                    world moveToFront: m.

                    a1: sizeAnimator copyTarget: m Frames: 30.
                    a1 from: m bounds size.
                    a1 to:   m bounds height@m bounds width.
                    a1 useSlowInOut: true.
                    a1 abortOnTargetGrab: false.

                    a2: sizeAnimator copyTarget: m Frames: 30.
                    a2 from: m bounds height@m bounds width.
                    a2 to:   m bounds size.
                    a2 useSlowInOut: true.
                    a2 abortOnTargetGrab: false.

                    a3: positionAnimator copyTarget: m Seconds: sec.
                    a3 from: m globalPosition.
                    a3 to:  (m globalPosition + (500@0)).
                    a3 useSlowInOut: true.
                    a3 abortOnTargetGrab: false.

                    world addActivity: (a3 during: (a1 andThen: a2)).
                    self).
            |).
            a color: (paint copyRed: 0.63 Green: 0.67  Blue: 0.88).
            a addMorph: (labelMorph copyLabel: 'Stretch') fontSpec: fs.
            a addMorph: (labelMorph copyLabel: '&'      ) fontSpec: fs.
            a addMorph: (labelMorph copyLabel: 'Move'   ) fontSpec: fs.

            c addMorphLast: a.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: private'
        
         buildPalette = ( |
             b.
             f.
             r.
            | 
            r: rowMorph copy color: (paint named: 'lightGray').

            b: ui2Button copyColor: r color Target: shell.
            b  scriptBlock: [event sourceHand attach: demoUtilities makeMorph].
            b label: ' Morph '.
            b addMorphLast: (spacerMorph copyV: 4 Color: r color ).
            b addMorphLast: (imageMorph copyImage:
                (ui2Image copyPixelLines: (
                        '                 ' &
                        ' 111111111111111 ' &
                        ' 111111111111111 ' &
                        ' 111111111111111 ' &
                        ' 111111111111111 ' &
                        ' 111111111111111 ' &
                        ' 111111111111111 ' &
                        ' 111111111111111 ' &
                        ' 111111111111111 ' &
                        '                 ' ) asVector
                    Colors: (
                        (paint named: 'white') &
                        (paint named: 'black') &
                        (paint named: 'yellow') ) asVector)).
            r addMorphLast: b beFlexible.

            b: ui2Button copyColor: r color Target: shell.
            b  scriptBlock: [event sourceHand attach: demoUtilities makeRow].
            b label: ' Row '.
            b addMorphLast: (spacerMorph copyV: 4 Color: r color ).
            b addMorphLast: (imageMorph copyImage:
                (ui2Image copyPixelLines: (
                        '                 ' &
                        ' 111111111111111 ' &
                        ' 1             1 ' &
                        ' 1 111 111 111 1 ' &
                        ' 1 1 1 1 1 1 1 1 ' &
                        ' 1 1 1 1 1 1 1 1 ' &
                        ' 1 111 111 111 1 ' &
                        ' 1             1 ' &
                        ' 111111111111111 ' &
                        '                 ' ) asVector
                    Colors: (
                        (paint named: 'white') &
                        (paint named: 'black') &
                        (paint named: 'yellow') ) asVector)).
            r addMorphLast: b beFlexible.

            b: ui2Button copyColor: r color Target: shell.
            b  scriptBlock: [event sourceHand attach: demoUtilities makeColumn].
            b label: ' Column '.
            b addMorphLast: (imageMorph copyImage:
                (ui2Image copyPixelLines: (
                        '          ' &
                        ' 11111111 ' &
                        ' 1      1 ' &
                        ' 1 1111 1 ' &
                        ' 1 1  1 1 ' &
                        ' 1 1111 1 ' &
                        ' 1      1 ' &
                        ' 1 1111 1 ' &
                        ' 1 1  1 1 ' &
                        ' 1 1111 1 ' &
                        ' 1      1 ' &
                        ' 1 1111 1 ' &
                        ' 1 1  1 1 ' &
                        ' 1 1111 1 ' &
                        ' 1      1 ' &
                        ' 11111111 ' &
                        '          ' ) asVector
                    Colors: (
                        (paint named: 'white') &
                        (paint named: 'black') &
                        (paint named: 'yellow') ) asVector)).
            b addMorphLast: (spacerMorph copyV: 2 Color: r color ).
            r addMorphLast: b beFlexible.

            b: ui2Button copyColor: r color Target: shell.
            b script:
                'event sourceHand attach: demoUtilities makeInsetFrame'.
            b label: ' Inset Frame '.
            b addMorphLast: (spacerMorph copyV: 3 Color: r color ).
            b addMorphLast: (imageMorph copyImage:
                (ui2Image copyPixelLines: (
                        '               ' &
                        ' 1111111111111 ' &
                        ' 1           0 ' &
                        ' 1           0 ' &
                        ' 1           0 ' &
                        ' 1           0 ' &
                        ' 1           0 ' &
                        ' 1           0 ' &
                        ' 1           0 ' &
                        ' 1           0 ' &
                        ' 1000000000000 ' &
                        '               ' ) asVector
                    Colors: (
                        (paint named: 'white') &
                        (paint named: 'black') &
                        (paint named: 'yellow') ) asVector)).
            r addMorphLast: b beFlexible.

            b: ui2Button copyColor: r color Target: shell.
            b script:
                'event sourceHand attach: demoUtilities makeOutsetFrame'.
            b label: ' Outset Frame '.
            b addMorphLast: (spacerMorph copyV: 3 Color: r color ).
            b addMorphLast: (imageMorph copyImage:
                (ui2Image copyPixelLines: (
                        '               ' &
                        ' 0000000000000 ' &
                        ' 0           1 ' &
                        ' 0           1 ' &
                        ' 0           1 ' &
                        ' 0           1 ' &
                        ' 0           1 ' &
                        ' 0           1 ' &
                        ' 0           1 ' &
                        ' 0           1 ' &
                        ' 0111111111111 ' &
                        '               ' ) asVector
                    Colors: (
                        (paint named: 'white') &
                        (paint named: 'black') &
                        (paint named: 'yellow') ) asVector)).
            r addMorphLast: b beFlexible.

            b: ui2Button copyColor: r color Target: shell.
            b  scriptBlock: [event sourceHand attach: demoUtilities makeCircle].
            b label: ' Circle '.
            b addMorphLast: (spacerMorph copyV: 2 Color: r color ).
            b addMorphLast: (imageMorph copyImage:
                (ui2Image copyPixelLines: (
                        '               ' &
                        '     11111     ' &
                        '   11     11   ' &
                        '  1         1  ' &
                        '  1         1  ' &
                        ' 1           1 ' &
                        ' 1           1 ' &
                        ' 1           1 ' &
                        ' 1           1 ' &
                        ' 1           1 ' &
                        '  1         1  ' &
                        '  1         1  ' &
                        '   11     11   ' &
                        '     11111     ' &
                        '               ' ) asVector
                    Colors: (
                        (paint named: 'white') &
                        (paint named: 'black') &
                        (paint named: 'yellow') ) asVector)).
            r addMorphLast: b beFlexible.

            b: ui2Button copyColor: r color Target: shell.
            b  scriptBlock: [event sourceHand attach: demoUtilities makeLabel].
            b label: ' Label '.
            b addMorphLast: (spacerMorph copyV: 2 Color: r color ).
            b addMorphLast: (imageMorph copyImage:
                (ui2Image copyPixelLines: (
                        '               ' &
                        '       1       ' &
                        '      111      ' &
                        '      111      ' &
                        '      1 1      ' &
                        '     11 11     ' &
                        '     1  11     ' &
                        '    11  111    ' &
                        '    1    11    ' &
                        '    1111111    ' &
                        '   11    111   ' &
                        '   1      11   ' &
                        '  11      111  ' &
                        ' 1111    11111 ' &
                        '               ' ) asVector
                    Colors: (
                        (paint named: 'white') &
                        (paint named: 'black') &
                        (paint named: 'yellow') ) asVector)).
            r addMorphLast: b beFlexible.

            b: ui2Button copyColor: r color Target: shell.
            b  scriptBlock: [event sourceHand attach: demoUtilities makeButton].
            b label: ' Button '.
            b addMorphLast: (spacerMorph copyV: 2 Color: r color ).
            b addMorphLast: (imageMorph copyImage:
                (ui2Image copyPixelLines: (
                        '                 ' &
                        '                 ' &
                        ' 000000000000000 ' &
                        ' 000000000000000 ' &
                        ' 00           11 ' &
                        ' 00 111  1    11 ' &
                        ' 00 1    1    11 ' &
                        ' 00 111  111  11 ' &
                        ' 00           11 ' &
                        ' 001111111111111 ' &
                        ' 001111111111111 ' &
                        '                 ' &
                        '                 ' ) asVector
                    Colors: (
                        (paint named: 'white') &
                        (paint named: 'black') &
                        (paint named: 'yellow') ) asVector)).
            r addMorphLast: b beFlexible.

            b: ui2Button copyColor: r color Target: shell.
            b  scriptBlock: [event sourceHand attach: demoUtilities makeSlider].
            b label: ' Slider '.
            b addMorphLast: (spacerMorph copyV: 2 Color: r color ).
            b addMorphLast: (imageMorph copyImage:
                (ui2Image copyPixelLines: (
                        '          ' &
                        ' 11111111 ' &
                        ' 1      1 ' &
                        ' 1      1 ' &
                        ' 1      1 ' &
                        ' 1      1 ' &
                        ' 11111111 ' &
                        ' 1      1 ' &
                        ' 1      1 ' &
                        ' 1      1 ' &
                        ' 1      1 ' &
                        ' 1      1 ' &
                        ' 1      1 ' &
                        ' 11111111 ' &
                        '          ' &
                        '          ' &
                        '          ' ) asVector
                    Colors: (
                        (paint named: 'white') &
                        (paint named: 'black') &
                        (paint named: 'yellow') ) asVector)).
            r addMorphLast: b beFlexible.

            f: frameMorph copy color: r color.
            f addMorph: r.

            f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: private'
        
         makeButton = ( |
            | 
            ((ui2Button copy label: ' Beep ')
                 scriptBlock: [7 asCharacter print])
                color: randomShade).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: private'
        
         makeCircle = ( |
            | 
            (circleMorph copy radius: 25)
                color: randomShade copySaturation: 0.75).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: private'
        
         makeColumn = ( |
            | 
            ((columnMorph copy 
                setWidth: 60 Height: 100)
                velcroFlag: true)
                color: randomShade).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: private'
        
         makeInsetFrame = ( |
            | 
            (((((((
             frameMorph copy 
                baseMinWidth:  10)
                baseMinHeight: 10)
                setWidth: 100 Height: 80)
                frameStyle: frameMorph insetBezelStyle)
                filled: false)
                velcroFlag: true)
                borderWidth: 8)
                color: randomShade).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: private'
        
         makeLabel = ( |
            | 
            (labelMorph copyLabel: 'ABC') fontSpec:  labelMorph fontSpec copySize: 48).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: private'
        
         makeMorph = ( |
            | 
            ((morph copy
                setWidth: 100 Height: 100)
                velcroFlag: true)
                color: randomShade).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: private'
        
         makeOutsetFrame = ( |
            | 
            (((((((
             frameMorph copy 
                baseMinWidth:  10)
                baseMinHeight: 10)
                setWidth: 100 Height: 80)
                frameStyle: frameMorph bezelStyle)
                filled: false)
                velcroFlag: true)
                borderWidth: 8)
                color: randomShade).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: private'
        
         makeRow = ( |
            | 
            ((rowMorph copy
                setWidth: 100 Height: 60)
                velcroFlag: true)
                color: randomShade).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: private'
        
         makeSlider = ( |
            | 
            (sliderMorph copy setWidth: 20 Height: 120)
                color: randomShade).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: private'
        
         randomShade = ( |
            | paint copyHue: (random integer: 360)
            Saturation: 0.4
            Brightness: 0.7 + ((random integer: 300) / 1000.0)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot'
        
         demoUtilities = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'demoUtilities' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'demoUtilities' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules demoUtilities.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            clockMorph          initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'demoUtilities' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'clockMorph' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy label: getString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'clockMorph' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: public'
        
         getString = ( |
            | 
            time current timeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'clockMorph' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            fontSpec: globals fontSpec copyName: 'verdana' Size: 24 Style: ''.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'clockMorph' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: w Event: evt = ( |
            | isInWorld ifTrue: [ startGettingStepped ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'clockMorph' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'clockMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'clockMorph' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'labelMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'clockMorph' -> () From: ( | {
         'ModuleInfo: Module: demoUtilities InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | getString = label ifFalse: [ changed. label: getString ]).
        } | ) 



 '-- Side effects'

 globals modules demoUtilities postFileIn
