 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: ui2Demo InitialContents: FollowSlot'
        
         ui2Demo = bootstrap stub -> 'globals' -> 'modules' -> 'ui2Demo' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Demo' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals modules ui2Demo.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'ui2Demo' -> () _AddSlots: ( | {
         'ModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ' \'\'
            \"UI2 Demo.\"'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'ui2Demo' -> () _AddSlots: ( | {
         'ModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'ui2Demo' -> () _AddSlots: ( | {
         'ModuleInfo: Module: ui2Demo InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'ui2Demo' -> () _AddSlots: ( | {
         'ModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'ui2Demo' -> () _AddSlots: ( | {
         'ModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> () _AddSlots: ( | {
         'Category: Examples\x7fModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2Demo = bootstrap stub -> 'globals' -> 'ui2Demo' -> () _AddSlots: ( |
             {} = 'Comment: This object contains a version of the demo that we gave to
     Scott McNealy and Jim Green.\x7fModuleInfo: Creator: globals ui2Demo.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'ui2Demo' -> () _AddSlots: ( | {
         'Category: windowManipulation\x7fModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: public'
        
         clear = ( |
             p.
            | 
            w stop.
            w removeAllMorphs.
            w addMorph: trashCanMorph copy.
            p: perfMonitorMorph copy.
            w addMorph: p.
            p startGettingStepped.
            w go.
            self).
        } | ) 

 bootstrap stub -> 'globals' -> 'ui2Demo' -> () _AddSlots: ( | {
         'Category: windowManipulation\x7fModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | w close. w: nil. self).
        } | ) 

 bootstrap stub -> 'globals' -> 'ui2Demo' -> () _AddSlots: ( | {
         'Category: placement\x7fModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: private'
        
         colorAndPlace: m = ( |
            | 
            m color: (paint named: 'teal') copyBrightness: 0.8.
            place: m.
            self).
        } | ) 

 bootstrap stub -> 'globals' -> 'ui2Demo' -> () _AddSlots: ( | {
         'Category: windowManipulation\x7fModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: public'
        
         demo = ( |
             cpuMonitor.
             hist.
            | 
                "Assme w is already open (using openwin)."

                w stop.
                w removeAllMorphs.

                nextPlace:  0@0.
                lineHeight: 0.

            "xxx in the original demo, we used an object that spoke to a remote CPU;
             xxx in this demo, we simply get random numbers. This obviates the need to
             xxx publish and maintain the cpuMonitor object and its glue code
             xxx Original code:
                cpuMonitor: remoteCPUMonitorMorph copyForHost: 'us'.
                hist: (((histogramMorph copy target: cpuMonitor) selector: 'cpu')
                    targetFrozen: true).
             xxx End of original code"

             "Alternate code:"
                cpuMonitor: nil.
                hist: (((histogramMorph copy target: random) selector: 'float')
                    targetFrozen: true).
            "End of alternate code."

                hist scale: 90.
                24 do: [| bar |
                    bar: morph copy color: ((paint named: 'azure') copyBrightness: 0.5).
                    bar resizeRect: (0@0) # (8@5).
                    hist addMorph: bar.
                ].
                hist color: ((paint named: 'gray') copyBrightness: 0.7).

                colorAndPlace: frameMorph copy beShrinkWrap.
                colorAndPlace:
                    columnMorph copy beShrinkWrap resizeRect: (0@0) ## (150@150).
                nextLine.

                colorAndPlace: rowMorph copy beFlexible resizeRect: (0@0) ## (250@70).
                colorAndPlace: (buttonMorph copy labelAndExpression: 'run')
                    freezeTarget: hist.
                colorAndPlace: ((buttonMorph copy label: 'stop') expression: 'stop')
                    freezeTarget: hist.
                place: (messageButtonMorph copy selector: 'hostName:')
                    freezeTarget: cpuMonitor.
                nextLine.

                place: (buttonMorph copy labelAndExpression: 'absorbColor').
                place: (buttonMorph copy labelAndExpression: 'freezeTarget').
                place: (buttonMorph copy labelAndExpression: 'unfreezeTarget').
                nextLine.

                colorAndPlace: (frameMorph copy beShrinkWrap frameStyle: frameMorph insetBezelStyle).
                place: hist.
                nil = cpuMonitor ifFalse: [ place: cpuMonitor ].
                nextLine.

                place: (buttonMorph copy labelAndExpression: 'copy').
                place: (messageButtonMorph copy selector: 'expression:').
                nextLine.

                place: labelMorph copy label: 'column positioner (shrink-to-fit)'.
                place: labelMorph copy label: 'row positioner'.
                place: labelMorph copy label: 'shrink-wrap frame'.
                place: labelMorph copy label: 'shrink-wrap frame'.
                place: labelMorph copy label: 'CPU monitor'.
                nextLine.

                place: trashCanMorph copy
                    color: ((paint named: 'leaf') copySaturation: 0.4).
                place: (circleMorph copy
                    color: ((paint named: 'green') copySaturation: 0.6)) radius: 6.
                place: (circleMorph copy
                    color: ((paint named: 'red') copyDarkerBy: 0.2)) radius: 6.

                w go.
                self).
        } | ) 

 bootstrap stub -> 'globals' -> 'ui2Demo' -> () _AddSlots: ( | {
         'Category: windowManipulation\x7fModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: public'
        
         go = ( |
            | w go. self).
        } | ) 

 bootstrap stub -> 'globals' -> 'ui2Demo' -> () _AddSlots: ( | {
         'Category: state\x7fComment: Private variables are used by place, nextLine, etc.\x7fModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: private'
        
         lineHeight <- 0.
        } | ) 

 bootstrap stub -> 'globals' -> 'ui2Demo' -> () _AddSlots: ( | {
         'Category: windowManipulation\x7fModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: public'
        
         lm = ( |
            | 
            "Shortcut used to get a reference to the last morph dropped
             into the world. To use, just grab and drop a morph, then use
             lm to get get a reference to it. The morph must land on the
             world, not onto some other morph."

            w lastMorph).
        } | ) 

 bootstrap stub -> 'globals' -> 'ui2Demo' -> () _AddSlots: ( | {
         'Category: placement\x7fModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: private'
        
         nextLine = ( |
            | 
            nextPlace:  15 @ (15 + nextPlace y + lineHeight).
            lineHeight: 0.
            self).
        } | ) 

 bootstrap stub -> 'globals' -> 'ui2Demo' -> () _AddSlots: ( | {
         'Category: state\x7fComment: Private variables are used by place, nextLine, etc.\x7fModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: private'
        
         nextPlace <- (0)@(0).
        } | ) 

 bootstrap stub -> 'globals' -> 'ui2Demo' -> () _AddSlots: ( | {
         'Category: windowManipulation\x7fModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: public'
        
         openwin = ( |
            | 
            w: worldMorph copyOpenOnDisplay: preferences xDisplay.
            clear.
            'The ui2 window is now running. Type:
            "ui2Demo stop"  to suspend it,
            "ui2Demo go"    to resume it after stopping, and
            "ui2Demo close" to close the ui2 window.').
        } | ) 

 bootstrap stub -> 'globals' -> 'ui2Demo' -> () _AddSlots: ( | {
         'ModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'ui2Demo' -> () _AddSlots: ( | {
         'Category: placement\x7fModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: private'
        
         place: m = ( |
            | 
            w addMorph: m.
            m position: nextPlace.
            nextPlace:  nextPlace + ((m bounds width + 15) @ 0).
            lineHeight: lineHeight max: m bounds height.
            self).
        } | ) 

 bootstrap stub -> 'globals' -> 'ui2Demo' -> () _AddSlots: ( | {
         'Category: windowManipulation\x7fModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: public'
        
         stop = ( |
            | w stop. self).
        } | ) 

 bootstrap stub -> 'globals' -> 'ui2Demo' -> () _AddSlots: ( | {
         'Category: state\x7fModuleInfo: Module: ui2Demo InitialContents: FollowSlot\x7fVisibility: public'
        
         w.
        } | ) 



 '-- Side effects'

 globals modules ui2Demo postFileIn
