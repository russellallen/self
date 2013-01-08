 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap stub -> 'globals' -> () _AddSlots: ( | {
         'Category: System\x7fCategory: Morphs\x7fCategory: Layout\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         animatedColumnMorph = bootstrap stub -> 'globals' -> 'animatedColumnMorph' -> () _Define: (
             bootstrap remove: 'parent' From:
             globals columnMorph copyRemoveAllMorphs ) _AddSlots: bootstrap stub -> 'globals' -> 'animatedColumnMorph' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals animatedColumnMorph.

CopyDowns:
globals columnMorph. copyRemoveAllMorphs 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'animatedColumnMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         animFrame <- 0.
        } | ) 

 bootstrap stub -> 'globals' -> 'animatedColumnMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         animFramesBetweenUpdates <- 3.
        } | ) 

 bootstrap stub -> 'globals' -> 'animatedColumnMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         animIncrement <- 3.
        } | ) 

 bootstrap stub -> 'globals' -> 'animatedColumnMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         animOffset <- 0.
        } | ) 

 bootstrap stub -> 'globals' -> 'animatedColumnMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         bandLength <- 20.
        } | ) 

 bootstrap stub -> 'globals' -> 'animatedColumnMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         doAnimation <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap stub -> 'traits' -> () _AddSlots: ( | {
         'Category: System\x7fCategory: Morphs\x7fCategory: Layout\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         animatedColumnMorph = bootstrap stub -> 'traits' -> 'animatedColumnMorph' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: traits animatedColumnMorph.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'animatedColumnMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'animatedColumnMorph' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> () _AddSlots: ( | {
         'Category: System\x7fCategory: Morphs\x7fCategory: Layout\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         animatedRowMorph = bootstrap stub -> 'globals' -> 'animatedRowMorph' -> () _Define: (
             bootstrap remove: 'parent' From:
             globals rowMorph copyRemoveAllMorphs ) _AddSlots: bootstrap stub -> 'globals' -> 'animatedRowMorph' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals animatedRowMorph.

CopyDowns:
globals rowMorph. copyRemoveAllMorphs 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'animatedRowMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         animFrame <- 0.
        } | ) 

 bootstrap stub -> 'globals' -> 'animatedRowMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         animFramesBetweenUpdates <- 3.
        } | ) 

 bootstrap stub -> 'globals' -> 'animatedRowMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         animIncrement <- 3.
        } | ) 

 bootstrap stub -> 'globals' -> 'animatedRowMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         animOffset <- 0.
        } | ) 

 bootstrap stub -> 'globals' -> 'animatedRowMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         bandLength <- 20.
        } | ) 

 bootstrap stub -> 'globals' -> 'animatedRowMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         doAnimation <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap stub -> 'traits' -> () _AddSlots: ( | {
         'Category: System\x7fCategory: Morphs\x7fCategory: Layout\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         animatedRowMorph = bootstrap stub -> 'traits' -> 'animatedRowMorph' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: traits animatedRowMorph.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'animatedRowMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'animatedRowMorph' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         animatedLayoutMorphs = bootstrap stub -> 'globals' -> 'modules' -> 'animatedLayoutMorphs' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'animatedLayoutMorphs' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals modules animatedLayoutMorphs.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'animatedLayoutMorphs' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ' \'\'
            \"Morphs that layout their contents in orderly rows or columns, plus animate their action.\"'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'animatedLayoutMorphs' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'animatedLayoutMorphs' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'animatedLayoutMorphs' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            animatedRowMorph    velcroFlag: false.
            animatedColumnMorph velcroFlag: false.
            self).
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'animatedLayoutMorphs' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'animatedLayoutMorphs' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedColumnMorph' -> () _AddSlots: ( | {
         'Category: drawing\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: aCanvas = ( |
             bottom.
             box.
             left.
             right.
             top.
            | 
            "Draw the base of this morph on the given canvas."

            aCanvas fillRectangle: baseBounds Color: color.
            doAnimation && [velcroFlag not] ifFalse: [ ^self ].

            box:    baseBounds.
            left:   box   left.
            right:  box  right.
            top:    box    top.
            bottom: box bottom.
            drawStripesOn: aCanvas Color: (color copyBrighterBy: 0.025)
                Left: left + 2 Right: right - 2 Top: top Bottom: bottom
                Start: animOffset      Height: 1.
            drawStripesOn: aCanvas Color: (color copyBrighterBy: 0.050)
                Left: left + 1 Right: right - 1 Top: top Bottom: bottom
                Start: animOffset + 1  Height: 1.
            drawStripesOn: aCanvas Color: (color copyBrighterBy: 0.025)
                Left: left     Right: right     Top: top Bottom: bottom
                Start: animOffset + 2  Height: 2.
            drawStripesOn: aCanvas Color: (color copyDarkerBy: 0.025)
                Left: left + 1 Right: right - 1 Top: top Bottom: bottom
                Start: animOffset + 6  Height: 1.
            drawStripesOn: aCanvas Color: (color copyDarkerBy: 0.050)
                Left: left + 2 Right: right - 2 Top: top Bottom: bottom
                Start: animOffset + 7  Height: 1.
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedColumnMorph' -> () _AddSlots: ( | {
         'Category: stepping\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         done = ( |
            | doAnimation not || [velcroFlag]).
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedColumnMorph' -> () _AddSlots: ( | {
         'Category: drawing\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         drawStripesOn: c Color: col Left: l Right: r Top: t Bottom: b Start: start Height: h = ( |
            | 
            t + start to: b By: bandLength Do: [| :y. stripeTop. stripeBottom |
                stripeTop:  y max: t.
                stripeBottom: ((y + h) max: t) min: b.
                stripeTop = stripeBottom ifFalse: [
                    c fillRectangle: (l@stripeTop) # (r@stripeBottom) Color: col.
                ].
            ].
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedColumnMorph' -> () _AddSlots: ( | {
         'Category: stepping\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: newOwner = ( |
            | 
            "Turn on animation if dropped in world."

            isInWorld ifTrue: [
                stopGettingStepped.
                doAnimation && [velcroFlag not] ifTrue: [ startGettingStepped ].
            ].
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedColumnMorph' -> () _AddSlots: ( | {
         'Category: basics\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'animatedColumnMorph'.
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedColumnMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'columnMorph' -> ().
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedColumnMorph' -> () _AddSlots: ( | {
         'Category: stepping\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | 
            animFrame: animFrame + 1.
            animFrame >= animFramesBetweenUpdates ifTrue: [
                animOffset: animOffset - animIncrement.
                animOffset absoluteValue > bandLength ifTrue: [ animOffset: 0 ].
                changed.
                animFrame: 0.
            ].
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedColumnMorph' -> () _AddSlots: ( | {
         'Category: stepping\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         velcroFlag: bool = ( |
            | 
            "Turn on animation if velcroFlag becomes false."

            bool = velcroFlag ifFalse: [
                resend.velcroFlag: bool.
                doAnimation && [velcroFlag not && [isInWorld]] ifTrue: [ startGettingStepped ].
            ].
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedRowMorph' -> () _AddSlots: ( | {
         'Category: drawing\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: aCanvas = ( |
             bottom.
             box.
             left.
             right.
             top.
            | 
            "Draw the base of this morph on the given canvas."

            aCanvas fillRectangle: baseBounds Color: color.
            doAnimation && [velcroFlag not] ifFalse: [ ^self ].

            box:    baseBounds.
            left:   box   left.
            right:  box  right.
            top:    box    top.
            bottom: box bottom.
            drawStripesOn: aCanvas Color: (color copyBrighterBy: 0.025)
                Left: left Right: right Top: top + 2  Bottom: bottom - 2
                Start: animOffset      Width: 1.
            drawStripesOn: aCanvas Color: (color copyBrighterBy: 0.050)
                Left: left Right: right Top: top + 1  Bottom: bottom - 1
                Start: animOffset + 1  Width: 1.
            drawStripesOn: aCanvas Color: (color copyBrighterBy: 0.025)
                Left: left Right: right Top: top      Bottom: bottom
                Start: animOffset + 2  Width: 2.
            drawStripesOn: aCanvas Color: (color copyDarkerBy: 0.025)
                Left: left Right: right Top: top + 1  Bottom: bottom - 1
                Start: animOffset + 6  Width: 1.
            drawStripesOn: aCanvas Color: (color copyDarkerBy: 0.050)
                Left: left Right: right Top: top + 2  Bottom: bottom - 2
                Start: animOffset + 7  Width: 1.
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedRowMorph' -> () _AddSlots: ( | {
         'Category: stepping\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         done = ( |
            | doAnimation not || [velcroFlag]).
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedRowMorph' -> () _AddSlots: ( | {
         'Category: drawing\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         drawStripesOn: c Color: col Left: l Right: r Top: t Bottom: b Start: start Width: w = ( |
            | 
            l + start to: r By: bandLength Do: [| :x. stripeLeft. stripeRight |
                stripeLeft:  x max: l.
                stripeRight: ((x + w) max: l) min: r.
                stripeLeft = stripeRight ifFalse: [
                    c fillRectangle: (stripeLeft@t) # (stripeRight@b) Color: col.
                ].
            ].
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedRowMorph' -> () _AddSlots: ( | {
         'Category: stepping\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: newOwner = ( |
            | 
            "Turn on animation if dropped in world."

            isInWorld ifTrue: [
                stopGettingStepped.
                doAnimation && [velcroFlag not] ifTrue: [ startGettingStepped ].
            ].
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedRowMorph' -> () _AddSlots: ( | {
         'Category: basics\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'animatedRowMorph'.
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedRowMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'rowMorph' -> ().
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedRowMorph' -> () _AddSlots: ( | {
         'Category: stepping\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | 
            animFrame: animFrame + 1.
            animFrame >= animFramesBetweenUpdates ifTrue: [
                animOffset: animOffset - animIncrement.
                animOffset absoluteValue > bandLength ifTrue: [ animOffset: 0 ].
                changed.
                animFrame: 0.
            ].
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'animatedRowMorph' -> () _AddSlots: ( | {
         'Category: stepping\x7fModuleInfo: Module: animatedLayoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         velcroFlag: bool = ( |
            | 
            "Turn on animation if velcroFlag becomes false."

            bool = velcroFlag ifFalse: [
                resend.velcroFlag: bool.
                doAnimation && [velcroFlag not && [isInWorld]] ifTrue: [ startGettingStepped ].
            ].
            self).
        } | ) 



 '-- Side effects'

 globals modules animatedLayoutMorphs postFileIn
