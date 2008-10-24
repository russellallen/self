 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Layout\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         frameMorph = bootstrap define: bootstrap stub -> 'globals' -> 'frameMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'borderWidth' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals columnMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'frameMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals frameMorph.

CopyDowns:
globals columnMorph. copyRemoveAllMorphs 
SlotsToOmit: borderWidth parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'frameMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         borderWidth <- 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'frameMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         filled <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'frameMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         frameStyle <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Layout\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         frameMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( |
             {} = 'Comment: A frameMorph is a column that supplies a rectangular border
      around its submorphs.\x7fModuleInfo: Creator: traits frameMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'frameMorph' -> () From: ( | {
         'ModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'frameMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: frameMorphs InitialContents: InitializeToExpression: (paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196)\x7fVisibility: private'
        
         rawColor <- paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: frameMorphs InitialContents: FollowSlot'
        
         frameMorphs = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'frameMorphs' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'frameMorphs' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules frameMorphs.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'frameMorphs' -> () From: ( | {
         'ModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'frameMorphs' -> () From: ( | {
         'ModuleInfo: Module: frameMorphs InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'frameMorphs' -> () From: ( | {
         'ModuleInfo: Module: frameMorphs InitialContents: FollowSlot'
        
         myComment <- 'Frame morphs.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'frameMorphs' -> () From: ( | {
         'ModuleInfo: Module: frameMorphs InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            frameMorph initializePrototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'frameMorphs' -> () From: ( | {
         'ModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'frameMorphs' -> () From: ( | {
         'ModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         baseDrawBezelStyleOn: c = ( |
             b.
             box.
             l.
             r.
             shades.
             t.
             w.
             xList.
             yList.
            | 
            box: baseBounds.
            t: box top.  b: box bottom.  l: box left.  r: box right.
            w: borderWidth.
            shades: shadesForColor.
            xList: vector copySize: 4.
            yList: vector copySize: 4.
            c withoutAntialiasingDo: [
              "top"
              xList at: 0 Put: l.      yList at: 0 Put: t.
              xList at: 1 Put: r.      yList at: 1 Put: t.
              xList at: 2 Put: r - w.  yList at: 2 Put: t + w.
              xList at: 3 Put: l + w.  yList at: 3 Put: t + w.
              c fillPolygonXs: xList Ys: yList Color: shades mediumHilight.

              "bottom"
              xList at: 0 Put: l + w.  yList at: 0 Put: b - w.
              xList at: 1 Put: r - w.  yList at: 1 Put: b - w.
              xList at: 2 Put: r.      yList at: 2 Put: b.
              xList at: 3 Put: l.      yList at: 3 Put: b.
              c fillPolygonXs: xList Ys: yList Color: shades mediumShadow.

              "left"
              xList at: 0 Put: l.      yList at: 0 Put: t.
              xList at: 1 Put: l + w.  yList at: 1 Put: t + w.
              xList at: 2 Put: l + w.  yList at: 2 Put: b - w.
              xList at: 3 Put: l.      yList at: 3 Put: b.
              c fillPolygonXs: xList Ys: yList Color: shades lightHilight.

              "right"
              xList at: 0 Put: r - w.  yList at: 0 Put: t + w.
              xList at: 1 Put: r.      yList at: 1 Put: t.
              xList at: 2 Put: r.      yList at: 2 Put: b.
              xList at: 3 Put: r - w.  yList at: 3 Put: b - w.
              c fillPolygonXs: xList Ys: yList Color: shades darkShadow.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         baseDrawFlatStyleOn: c = ( |
             box.
            | 

            box: baseBounds origin #
                 (baseBounds corner - borderWidth).
            c rectangle: box Width: borderWidth Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         baseDrawInsetBezelStyleOn: c = ( |
             b.
             box.
             l.
             r.
             shades.
             t.
             w.
             xList.
             yList.
            | 
            box: baseBounds.
            t: box top.  b: box bottom.  l: box left.  r: box right.
            w: borderWidth.
            shades: shadesForColor.
            xList: vector copySize: 4.
            yList: vector copySize: 4.

            c withoutAntialiasingDo: [
              "top"
              xList at: 0 Put: l.      yList at: 0 Put: t.
              xList at: 1 Put: r.      yList at: 1 Put: t.
              xList at: 2 Put: r - w.  yList at: 2 Put: t + w.
              xList at: 3 Put: l + w.  yList at: 3 Put: t + w.
              c fillPolygonXs: xList Ys: yList Color: shades mediumShadow.

              "bottom"
              xList at: 0 Put: l + w.  yList at: 0 Put: b - w.
              xList at: 1 Put: r - w.  yList at: 1 Put: b - w.
              xList at: 2 Put: r.      yList at: 2 Put: b.
              xList at: 3 Put: l.      yList at: 3 Put: b.
              c fillPolygonXs: xList Ys: yList Color: shades mediumHilight.

              "left"
              xList at: 0 Put: l.      yList at: 0 Put: t.
              xList at: 1 Put: l + w.  yList at: 1 Put: t + w.
              xList at: 2 Put: l + w.  yList at: 2 Put: b - w.
              xList at: 3 Put: l.      yList at: 3 Put: b.
              c fillPolygonXs: xList Ys: yList Color: shades darkShadow.

              "right"
              xList at: 0 Put: r - w.  yList at: 0 Put: t + w.
              xList at: 1 Put: r.      yList at: 1 Put: t.
              xList at: 2 Put: r.      yList at: 2 Put: b.
              xList at: 3 Put: r - w.  yList at: 3 Put: b - w.
              c fillPolygonXs: xList Ys: yList Color: shades lightHilight.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         baseDrawLineStyleOn: c = ( |
             box.
             shades.
            | 
            box: baseBounds topLeft ## (baseBounds size - (1@1)).
            shades: shadesForColor.
            c withoutAntialiasingDo: [
              frameStyle = bezelStyle ifTrue: [
                c line: box topLeft     To: box topRight    Color: shades lightHilight.
                c line: box topLeft     To: box bottomLeft  Color: shades lightHilight.
                c line: box topRight    To: box bottomRight Color: shades darkShadow.
                c line: box bottomRight To: box bottomLeft  Color: shades darkShadow.
              ] False: [
                c line: box topLeft     To: box topRight    Color: shades darkShadow.
                c line: box topLeft     To: box bottomLeft  Color: shades darkShadow.
                c line: box topRight    To: box bottomRight Color: shades lightHilight.
                c line: box bottomRight To: box bottomLeft  Color: shades lightHilight.
              ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            "Draw a frame around my contents. If filled is false, only the
             frame itself is drawn, leaving the center empty. Presumably this
             space will be filled by the frame's contents."
            "Optimizations:
                1. if the borderWidth is zero, draw nothing
                2. if the borderWidth is one and the frameStyle is not flat,
                   draw the bezel using one-pixel lines."

            "Optimization: suppress filling if this morph's color matches that of its owner."
            (filled && [owner submorphVisible: self]) ifTrue: [ c fillRectangle: baseBounds Color: color ].

            0 = borderWidth              ifTrue: [ ^self ].
            frameStyle =       flatStyle ifTrue: [ ^baseDrawFlatStyleOn:       c ].
            1 = borderWidth              ifTrue: [ ^baseDrawLineStyleOn:       c ].
            frameStyle =      bezelStyle ifTrue: [ ^baseDrawBezelStyleOn:      c ].
            frameStyle = insetBezelStyle ifTrue: [ ^baseDrawInsetBezelStyleOn: c ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: styles\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         bezelStyle = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: frameMorphs InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         cachedShades <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: styles\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         flatStyle = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            removeAllMorphs.
            resizeRect: (0@0) # (20@20).
            color: frameMorph color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: styles\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         insetBezelStyle = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isRectangular = ( |
            | 
            filled).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'frameMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'ModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'columnMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         shadesForColor = ( |
             c.
            | 
            c: color.
            cachedShades at: c IfAbsent: [| newShades |
                newShades: shadesRecord copy.
                newShades darkShadow:    (c copyDarkerBy: 0.2).
                newShades mediumShadow:  (c copyDarkerBy: 0.1).
                newShades mediumHilight: (c copyBrighterBy: 0.1).
                newShades lightHilight:  (c copyBrighterBy: 0.2).
                cachedShades at: c Put: newShades.
                newShades]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         shadesRecord <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'frameMorph' -> 'shadesRecord' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits frameMorph shadesRecord.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> 'shadesRecord' -> () From: ( | {
         'ModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         darkShadow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> 'shadesRecord' -> () From: ( | {
         'ModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         lightHilight.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> 'shadesRecord' -> () From: ( | {
         'ModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         mediumHilight.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> 'shadesRecord' -> () From: ( | {
         'ModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         mediumShadow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> 'shadesRecord' -> () From: ( | {
         'ModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: frameMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         submorphVisible: m = ( |
            | 
            "Return true if the given submorph of the receiver is
             visible. This may be true if the receiver has morphs
             sticking out. If the receiver is filled, the submorph
             is visible if its color is different. If the receiver
             is unfilled, the submorph is visible if it is visible
             on top of the frame's owner, since the color of the
             owner shows through the inside of the frame."

            noStickOuts ifFalse: [ ^true ].
            (filled && [color = m color]) ifTrue: [ ^false ].
            owner submorphVisible: m).
        } | ) 



 '-- Side effects'

 globals modules frameMorphs postFileIn
