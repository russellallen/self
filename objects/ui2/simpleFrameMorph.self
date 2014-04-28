 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot'
        
         simpleFrameMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'simpleFrameMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'simpleFrameMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules simpleFrameMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'simpleFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'simpleFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: simpleFrameMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'simpleFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot'
        
         myComment <- 'Organizing Frame morphs.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'simpleFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            simpleFrameMorph initializePrototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'simpleFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'simpleFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Layout\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         simpleFrameMorph = bootstrap define: bootstrap stub -> 'globals' -> 'simpleFrameMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'simpleFrameMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals simpleFrameMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         borderWidth <- 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: simpleFrameMorph InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         filled <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         frameStyle <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: simpleFrameMorph InitialContents: InitializeToExpression: (paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902)\x7fVisibility: private'
        
         hilightColor1 <- paint copyRed: 0.261975 Green: 0.525904  Blue: 0.699902.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: simpleFrameMorph InitialContents: InitializeToExpression: (paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587)\x7fVisibility: private'
        
         hilightColor2 <- paint copyRed: 0.300098 Green: 0.601173  Blue: 0.800587.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         looksHollow <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         minCornerOffset <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Layout\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         simpleFrameMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( |
             {} = 'Comment: A simpleFrameMorph supplies a rectangular border around its submorphs.\x7fModuleInfo: Creator: traits simpleFrameMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: simpleFrameMorph InitialContents: InitializeToExpression: (paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196)\x7fVisibility: private'
        
         rawColor <- paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: simpleFrameMorph InitialContents: InitializeToExpression: (paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489)\x7fVisibility: private'
        
         shadowColor1 <- paint copyRed: 0.187683 Green: 0.375367  Blue: 0.500489.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: simpleFrameMorph InitialContents: InitializeToExpression: (paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805)\x7fVisibility: private'
        
         shadowColor2 <- paint copyRed: 0.14956 Green: 0.300098  Blue: 0.399805.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         baseDrawBezelStyleOn: c = ( |
             b1.
             b2.
             p.
            | 
            b1: baseBounds asInteger.
            b2: (b1 indent: borderWidth) asInteger.
            p: vector copySize: 4.
            c withoutAntialiasingDo: [
              "top"
              p at: 0 Put: b1 topLeft.      p at: 1 Put: b1 topRight.
              p at: 3 Put: b2 topLeft.      p at: 2 Put: b2 topRight.
              c fillPolygon: p Color: hilightColor1.
              "bottom"
              p at: 0 Put: b1 bottomLeft.   p at: 1 Put: b1 bottomRight.
              p at: 3 Put: b2 bottomLeft.   p at: 2 Put: b2 bottomRight.
              c fillPolygon: p Color: shadowColor1.
              "left"
              p at: 0 Put: b1    topLeft.   p at: 1 Put: b2    topLeft.
              p at: 3 Put: b1 bottomLeft.   p at: 2 Put: b2 bottomLeft.
              c fillPolygon: p Color: hilightColor2.
              "right"
              p at: 0 Put: b2    topRight.  p at: 1 Put: b1    topRight.
              p at: 3 Put: b2 bottomRight.  p at: 2 Put: b1 bottomRight.
              c fillPolygon: p Color: shadowColor2.
            ].
            looksHollow ifFalse: [ baseFillCenterOn: c ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         baseDrawFlatStyleOn: c = ( |
            | 
            looksHollow ifTrue: [| box | 
                box:  baseBounds origin asInteger #
                     (baseBounds corner - borderWidth) asInteger.
                c rectangle: box Width: borderWidth Color: color.
            ] False: [
                 c fillRectangle: baseBounds asInteger Color: color.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         baseDrawInsetBezelStyleOn: c = ( |
             b1.
             b2.
             p.
            | 
            b1: baseBounds asInteger.
            b2: (b1 indent: borderWidth) asInteger.
            p: vector copySize: 4.

            c withoutAntialiasingDo: [
              "top"
              p at: 0 Put: b1 topLeft.      p at: 1 Put: b1 topRight.
              p at: 3 Put: b2 topLeft.      p at: 2 Put: b2 topRight.
              c fillPolygon: p Color: shadowColor1.
              "bottom"
              p at: 0 Put: b1 bottomLeft.   p at: 1 Put: b1 bottomRight.
              p at: 3 Put: b2 bottomLeft.   p at: 2 Put: b2 bottomRight.
              c fillPolygon: p Color: hilightColor1.
              "left"
              p at: 0 Put: b1    topLeft.   p at: 1 Put: b2    topLeft.
              p at: 3 Put: b1 bottomLeft.   p at: 2 Put: b2 bottomLeft.
              c fillPolygon: p Color: shadowColor2.
              "right"
              p at: 0 Put: b2    topRight.  p at: 1 Put: b1    topRight.
              p at: 3 Put: b2 bottomRight.  p at: 2 Put: b1 bottomRight.
              c fillPolygon: p Color: hilightColor2.
            ].
            looksHollow ifFalse: [ baseFillCenterOn: c ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         baseDrawLineStyleOn: c = ( |
             box.
            | 
            box: baseBounds topLeft asInteger ## (baseBounds size asInteger - (1@1)).
            c withoutAntialiasingDo: [
              frameStyle = bezelStyle ifTrue: [
                c line: box topLeft     To: box topRight    Color: hilightColor1.
                c line: box topLeft     To: box bottomLeft  Color: hilightColor2.
                c line: box topRight    To: box bottomRight Color: shadowColor2.
                c line: box bottomRight To: box bottomLeft  Color: shadowColor1.
              ] False: [
                c line: box topLeft     To: box topRight    Color: shadowColor1.
                c line: box topLeft     To: box bottomLeft  Color: shadowColor2.
                c line: box topRight    To: box bottomRight Color: hilightColor2.
                c line: box bottomRight To: box bottomLeft  Color: hilightColor1.
              ].
            ].
            looksHollow ifFalse: [ baseFillCenterOn: c ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            "Draw a frame around my contents. The frame is not filled; it
             has a hole in the middle. Presumably this will be filled by
             the frame's contents."
            "Optimizations:
                1. if the borderWidth is zero, draw nothing
                2. if the borderWidth is one and the frameStyle is not solid,
                   draw the bezel using one-pixel lines."

            0 = borderWidth         ifTrue: [ ^self ].
            frameStyle =  flatStyle ifTrue: [ ^baseDrawFlatStyleOn:      c ].
            1 = borderWidth         ifTrue: [ ^baseDrawLineStyleOn:       c ].
            frameStyle = bezelStyle ifTrue: [ ^baseDrawBezelStyleOn:      c ].
            frameStyle = insetBezelStyle ifTrue: [ ^baseDrawInsetBezelStyleOn: c ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         baseFillCenterOn: c = ( |
            | 
            c fillRectangle: (baseBounds indent: borderWidth) asInteger
                Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: frameStyles\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         bezelStyle = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         color: c = ( |
            | 
            resend.color: c.
            hilightColor1: (c copyBrighterBy: 0.1).
            hilightColor2: (c copyBrighterBy: 0.2).
            shadowColor1: (c copyDarkerBy: 0.1).
            shadowColor2: (c copyDarkerBy: 0.2).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: frameStyles\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         flatStyle = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            removeAllMorphs.
            resizeRect: (0@0) # (50@50).
            color: frameMorph color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: frameStyles\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         insetBezelStyle = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'simpleFrameMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: simpleFrameMorph InitialContents: FollowSlot\x7fVisibility: public'
        
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

 globals modules simpleFrameMorph postFileIn
