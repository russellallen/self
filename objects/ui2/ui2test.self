 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui2test InitialContents: FollowSlot'
        
         ui2test = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui2test' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui2test' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui2test.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2test' -> () From: ( | {
         'ModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2test' -> () From: ( | {
         'ModuleInfo: Module: ui2test InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2test' -> () From: ( | {
         'ModuleInfo: Module: ui2test InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2test' -> () From: ( | {
         'ModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2test' -> () From: ( | {
         'ModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Tests\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot'
        
         ui2test = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui2test' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui2test.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2test' -> () From: ( | {
         'ModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         activities.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2test' -> () From: ( | {
         'ModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         closeWhenDone <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Tests\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2test = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui2test.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2test' -> () From: ( | {
         'ModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui2test' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2test' -> () From: ( | {
         'ModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         position <- (20)@(20).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2test' -> () From: ( | {
         'ModuleInfo: Module: ui2test InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         preexistingMorphs.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2test' -> () From: ( | {
         'ModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         world.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: standard test\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         addBrowserMorphs = ( |
             children.
             implementors.
             references.
             senders.
            | 
            implementors: implementorsMorph copySelector: 'asVector'.
            addMorph: implementors.
            addTarget: implementors Selector: 'expand:' Arg: process this birthEvent.

            senders: sendersMorph copySelector: 'asTextLines'.
            addMorph: senders.
            addTarget: senders Selector: 'expand:' Arg: process this birthEvent.

            references: referencesMorph copyMirror: (reflect: shell).
            addMorph: references.
            addTarget: references Selector: 'expand:' Arg: process this birthEvent.

            children: childrenMorph copyMirror: (reflect: traits selfObjectModel).
            addMorph: children.
            addTarget: children Selector: 'expand:' Arg: process this birthEvent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: general helpers\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         addMorph: m = ( |
            | position: position + 30.
             m position: position.
             activities add: 
              (messageActivity copyTarget: world
                                 Selector: 'addMorph:'
                                     Args: vector copyAddFirst: m).
             activities add: 
              (messageActivity copyTarget: world
                                 Selector: 'moveToFront:'
                                     Args: vector copyAddFirst: m).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: standard test\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         addOutlinerMorphs = ( |
             m.
             o.
             s.
            | 
            m: reflect: traits.
            o: world outlinerForMirror: m.
            addMorph: o.
            addTarget: o Selector: 'expand:'                          Arg: process this birthEvent.
            addTarget: o Selector: 'unfold:Event:' Arg: (m at: 'outliner')    Arg: process this birthEvent.
            addTarget: o Selector: 'unfold:Event:' Arg: (m at: 'radioButton') Arg: process this birthEvent.

            o: world outlinerForMirror: reflect: ().
            addMorph: o.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: general helpers\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         addPause = ( |
            | 
            addTarget: self Selector: 'pause').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: testing pluggable outliner\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot'
        
         addPluggableOutliner: o = ( |
            | 
            addMorph: o.
            addPause.
            addTarget: o Selector: 'expand:' Arg: process this birthEvent.
            addPause.
            addTarget: o Selector: 'collapse:' Arg: process this birthEvent.
            addPause.
            addTarget: o Selector: 'middleMouseDown:' Arg: process this birthEvent.
            addPause.
            addTarget: o Selector: 'middleMouseUp:' Arg: process this birthEvent.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: testing pluggable outliner\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot'
        
         addPluggableOutliners = ( |
            | 
            world reifiedObjects removeAll:
              world reifiedObjects asList copyFilteredBy: [|:m| m morphTypeName = 'pluggableOutliner']. 

            (
               (        generalModel newOutlinerFor: nil InWorld: world)
            &  (     selfObjectModel newOutlinerFor: (reflect: traits) InWorld: world)
            &  ( changedModulesModel newOutliner )
            ) asVector do: [|:o| addPluggableOutliner: o].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: general helpers\x7fCategory: sending messages asynchronously\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         addTarget: t Selector: s = ( |
            | 
            activities add:
              (messageActivity copyTarget: t
                                 Selector: s).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: general helpers\x7fCategory: sending messages asynchronously\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         addTarget: t Selector: s Arg: arg = ( |
            | activities add:
              (messageActivity copyTarget: t
                                 Selector: s
                                     Args: vector copyAddFirst: arg).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: general helpers\x7fCategory: sending messages asynchronously\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         addTarget: t Selector: s Arg: arg1 Arg: arg2 = ( |
            | 
             activities add:
               messageActivity copyTarget: t
                                 Selector: s
                                     Args: (arg1 & arg2) asVector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            desktop isOpen ifFalse: [
                'Opening desktop for ui2 test' printLine.
                desktop open.
                closeWhenDone: true.
            ] True: [
                closeWhenDone: false.
            ].
            copyWorld: desktop w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWorld: w = ( |
            | 
            (( resend.copy world: w)
               preexistingMorphs: w morphs copy)
               activities: list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: general helpers\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         deleteAddedMorphs = ( |
             addedMorphs.
            | 
            world safelyDo: [
              addedMorphs: world morphs asList copyFilteredBy: [|:m|
              (preexistingMorphs includes: m) not
              ].
            ].
            addedMorphs do: [|:m| m animatedDelete].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: general helpers\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         endTest = ( |
            | 
            "deleteAddedMorphs."
            closeWhenDone ifTrue: [
                'Completed ui2 test; closing desktop.' printLine.
                desktop w closeFromHand: (desktop w hands first).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'ModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: general helpers\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot'
        
         pause = ( |
            | times delay: 500).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: standard test\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            addBrowserMorphs.
            addOutlinerMorphs.
            startActivities.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'ModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: public'
        
         runBigTest: iterations = ( |
             o.
            | 
            o: world outlinerForMirror: reflect: globals.
            world safelyDo: [
                world addMorph: o.
                o expand: ui2Event.
            ].
            'Allowing 30 seconds for outliner slots to get filled in...' print.
            times delay: 30000.
            'done.' printLine.
            world stop.
            iterations do: [| :i |
                o changed.
                o position: (random integer: 800)@(random integer: 200).
                o changed.
                world doStep.
                (i % 100) = 0 ifTrue: [ i print. ' iterations' printLine ].
            ].
            endTest.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: general helpers\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot\x7fVisibility: private'
        
         startActivities = ( |
             head.
            | 
            activities isEmpty ifTrue: [^self].
            activities doFirst: [|:e| head: e ]
                    MiddleLast: [|:e| head: head andThen: e ].
            world addActivity: (head andThenSend: 'endTest' To: self).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: general helpers\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot'
        
         topmostOwner = ( |
            | 
            "Kludge"
            world).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2test' -> () From: ( | {
         'Category: testing pluggable outliner\x7fModuleInfo: Module: ui2test InitialContents: FollowSlot'
        
         tpo = ( |
            | 
            addPluggableOutliners.
            startActivities.
            self).
        } | ) 



 '-- Side effects'

 globals modules ui2test postFileIn
