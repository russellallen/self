 '30.30.1'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: releasing resources\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         contributeToBackgroundMenu: m = ( |
            | 
            m addButton: 
              ( ( ( ui2Button copy
                       scriptBlock: [memory cleanup] )
                       label:  'Clean Up Memory' )
              isAsynchronous: true )
            ToGroup: 'memory'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: worldMorph InitialContents: FollowSlot'
        
         worldMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'worldMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'worldMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules worldMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'worldMorph' -> () From: ( | {
         'ModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'worldMorph' -> () From: ( | {
         'ModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'worldMorph' -> () From: ( | {
         'ModuleInfo: Module: worldMorph InitialContents: FollowSlot'
        
         myComment <- 'The world morph.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'worldMorph' -> () From: ( | {
         'ModuleInfo: Module: worldMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            worldMorph initializePrototype.
            ( worldMorph & shell & memory ) asVector do: [| :o | worldMorph addBackgroundMenuContributor: o ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'worldMorph' -> () From: ( | {
         'ModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (\'30.30.1\')\x7fVisibility: public'
        
         revision <- '30.30.1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'worldMorph' -> () From: ( | {
         'ModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         screenEdge = bootstrap define: bootstrap stub -> 'globals' -> 'screenEdge' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'screenEdge' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals screenEdge.

CopyDowns:
globals morph. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'screenEdge' -> () From: ( | {
         'Category: Screen Edge State\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (\'top\')\x7fVisibility: public'
        
         orientation <- 'top'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Basic\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         screenEdge = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'screenEdge' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits screenEdge.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'screenEdge' -> () From: ( | {
         'ModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'screenEdge' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'screenEdge' -> () From: ( | {
         'Category: Screen Edge State\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (2)\x7fVisibility: public'
        
         thickness <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'screenEdge' -> () From: ( | {
         'Category: Screen Edge State\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         winCanvas.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         worldMorph = bootstrap define: bootstrap stub -> 'globals' -> 'worldMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals worldMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         activities <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         arrowsNeedSorting <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         bufCanvases <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fCategory: recovery\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         currentActivity.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fCategory: recovery\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         currentOutliner.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         damageList <- bootstrap stub -> 'globals' -> 'sequence' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         firstStepSucceeded <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         hands <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: joining support\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (sequence copyRemoveAll)\x7fVisibility: private'
        
         joinedMorphs <- sequence copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fCategory: recovery\x7fComment: When I crash, the recovery code leaves behind a notifier here.
When I run again, the step cycle adds me in to the world.
-- dmu\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         notifierToDisplay.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         outlinerActivities <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (recursiveSemaphore copyBinary)\x7fVisibility: private'
        
         outlinerActivitiesSema <- recursiveSemaphore copyBinary.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fCategory: limiting updating\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (time origin)\x7fVisibility: private'
        
         outlinerActivityEndTime <- time origin.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fCategory: limiting updating\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (time origin)\x7fVisibility: private'
        
         outlinerActivityStartTime <- time origin.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         worldMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits worldMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'ModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'worldMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (\'unnamed\')\x7fVisibility: private'
        
         rawName <- 'unnamed'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         redrawAll <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (sharedDictionary copyRemoveAll)\x7fVisibility: private'
        
         reifiedObjects <- sharedDictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         savedMorphs <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fCategory: semaphores and processes\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (semaphore)\x7fVisibility: private'
        
         stepDoneSema <- bootstrap stub -> 'globals' -> 'semaphore' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fCategory: semaphores and processes\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         stepProcess <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fCategory: semaphores and processes\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (semaphore)\x7fVisibility: private'
        
         stepSema <- bootstrap stub -> 'globals' -> 'semaphore' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fCategory: recovery\x7fComment: Record the cpu time of the last
step in case the Mac sleeps,
don\'t want to timeout step.
-- Ungar 12/01\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         stepStartCPUTime <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fCategory: recovery\x7fComment: I record the time of the last
step in case the step process
gets stuck.
-- Ungar, 5/29/95\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (time origin)\x7fVisibility: private'
        
         stepStartTime <- time origin.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         stepSucceeded <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fCategory: semaphores and processes\x7fComment: Initiate recovery if step hangs.\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (process)\x7fVisibility: private'
        
         stepTimeoutProcess <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fCategory: semaphores and processes\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (process)\x7fVisibility: private'
        
         stepWatcher <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fCategory: semaphores and processes\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         uiCritical <- bootstrap stub -> 'globals' -> 'recursiveSemaphore' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fCategory: semaphores and processes\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         uiProcess <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fCategory: limiting updating\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         updateOutliners <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldMorph' -> () From: ( | {
         'Category: World Morph State\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         winCanvases <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'Category: background menu\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         contributeToBackgroundMenu: m = ( |
            | 
            m addButton:
                ( ( ui2Button copy
                   scriptBlock: [event sourceHand attach:
                                   selfObjectModel newOutlinerFor: (reflect: shell copy)
                                                          InWorld: event sourceHand world] )
                   label: 'New shell' )
            ToGroup: 'top'.

            m addButton:
                ( ( ui2Button copy
                   scriptBlock: [event sourceHand attach:
                                   selfObjectModel newOutlinerFor: (reflect: ())
                                                          InWorld: event sourceHand world] )
                   label: 'New Object' )
            ToGroup: 'top'.

            m addButton:
                ( ( ui2Button copy
                   scriptBlock: [shell save] )
                   label: 'Save snapshot')
            ToGroup: 'memory'.

            m addButton:
              ( ( ( ui2Button copy
                   scriptBlock: [shell saveAs] )
                   label: 'Save snapshot as ...')
                   isAsynchronous: true )
            ToGroup: 'memory'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'screenEdge' -> () From: ( | {
         'ModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseBounds = ( |
             pt.
            | 
            orientation = 'top' ifTrue: [
                pt: winCanvas offset negate - (thickness @ thickness).
                ^pt ## ((winCanvas size x + thickness + thickness) @ thickness).
            ].
            orientation = 'bottom' ifTrue: [
                pt: winCanvas offset negate + (thickness negate @ winCanvas size y).
                ^pt ## ((winCanvas size x + thickness + thickness) @ thickness).
            ].
            orientation = 'left' ifTrue: [
                pt: winCanvas offset negate - (thickness @ 0).
                ^pt ## (thickness @ winCanvas size y).
            ].
            orientation = 'right' ifTrue: [
                pt: winCanvas offset negate + (winCanvas size x @ 0).
                ^pt ## (thickness @ winCanvas size y).
            ].
            error: 'Huh? my orientation is weird.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'screenEdge' -> () From: ( | {
         'ModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'screenEdge'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'screenEdge' -> () From: ( | {
         'ModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'screenEdge' -> () From: ( | {
         'Comment: Overrides dependency on
rawBow.-- Randy, 4/5/95\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         position = ( |
            | baseBounds origin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'screenEdge' -> () From: ( | {
         'Comment: overrides dependency on rawBox-- Randy, 4/5/95\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         position: pt = ( |
            | "do nothing, as I am stuck to bottom of screen" self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step process\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         abortStepProcess = ( |
            | 
            stepProcess ifNotNil: [
                stepProcess abortIfLive: 'abortStepProcess'.
                stepProcess: nil.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step timeout process\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         abortStepTimeoutProcess = ( |
            | 
            stepTimeoutProcess ifNotNil: [
                stepTimeoutProcess abortIfLive: 'abortStepTimeoutProcess'.
                stepTimeoutProcess: nil.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step watcher\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         abortStepWatcher = ( |
            | 
            stepWatcher ifNotNil: [
                stepWatcher abortIfLive: 'abortStepWatcher'.
                stepWatcher: nil.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: UI process\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         abortUIProcess = ( |
            | 
            uiProcess ifNotNil: [
                uiProcess abortIfLive: 'abortUIProcess'.
                uiProcess: nil.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: activities\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         addActivityIfWorld: a = ( |
            | 
            (activities includes: a) ifFalse: [ activities add: a ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: structure\x7fComment: Override to manually fix layout of added morphs, since
the world\'s layoutChanged method does nothing.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         addAllMorphs: mList = ( |
            | 
            resend.addAllMorphs: mList.
            mList do: [| :m | m layoutChanged ].
            arrowsNeedSorting: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: background-menu building\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         addBackgroundMenuContributor: obj = ( |
            | 
            backgroundMenu: nil.
            backgroundMenuContributors add: obj.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: dropping\x7fComment: Add the morph and move it to the front.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         addDroppingMorph: m Event: evt = ( |
            | 
            addMorph: m.
            moveToFront: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         addInitialMorphs = ( |
             m.
            | 
            "add outliner on the shell"
            m: outlinerForMirror: reflect: shell.
            m position: 50@20.
            m collapse: ui2Event.
            addMorph: m.

            "add trash can"
            m: trashCanMorph copy position: 632@7.
            addMorph: m.

            saveDesktop.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: structure\x7fComment: Override to manual fix layout of added morph, since
the world\'s layoutChanged method does nothing.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         addMorph: m = ( |
            | 
            resend.addMorph: m.
            m layoutChanged.
            m justDroppedInto: self Event: process this birthEvent.
            arrowsNeedSorting: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         addWindowOnDisplay: dispName Bounds: b = ( |
            | 
            addWindowOnDisplay: dispName Bounds: b Limited: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot'
        
         addWindowOnDisplay: dispName Bounds: b Limited: isLimited = ( |
            | 
            addWindowOnDisplay: dispName Bounds: b User: users owner Limited: isLimited).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot'
        
         addWindowOnDisplay: dispName Bounds: b User: aUserProfile Limited: isLimited = ( |
             bc.
             h.
             pc.
             wc.
             wcp.
            | 
            wcp: windowCanvasPrototypeForDisplay: dispName.
            wc: (  wcp copyOpenForWorld: self
                              OnDisplay: dispName
                                     At: b origin
                                  Width: b width
                                 Height: b height).
            bc: wc bufferCanvasForMyScreenBounds: b.

            isLimited ifTrue: [wc platformWindow freezeSize: b size].
            h: handMorph copyRemoveAllSubscribers privateSetOwner: self.
            h userInfo: aUserProfile.
            h color: randomColorForUser.
            h subscribeWindow:   self. 

            addMorph: (((screenEdge copy winCanvas: wc) color: h color) orientation: 'top').
            addMorph: (((screenEdge copy winCanvas: wc) color: h color) orientation: 'bottom').
            addMorph: (((screenEdge copy winCanvas: wc) color: h color) orientation: 'left').
            addMorph: (((screenEdge copy winCanvas: wc) color: h color) orientation: 'right').

            winCanvases: winCanvases copyAddLast: wc.
            bufCanvases: bufCanvases copyAddLast: bc.
            hands:       hands copyAddLast: h.
            isLimited ifTrue: [h capabilitySet: set copyRemoveAll].
            h setUserInfo.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: joining support\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot'
        
         adjustJoinedMorphsIfNeeded = ( |
            | 
            "Representation dependent - relies on details of implementation of joinedMorphs"
            joinedMorphs do: [ | :data. joinee. oldGlobalBounds | 
              joinee: (data at: 0).
              oldGlobalBounds: (data at: 1).
              joinee globalBaseBounds = oldGlobalBounds ifFalse: [ | index |
                 "Time to move attachments."
                 index: -1.
                 (data at: 2) with: (data at: 3) Do: [ | :mph. :offset. newOffset | 
                    index: index + 1.
                    newOffset: (newOffsetFor: mph JoinedTo: joinee Offset: offset OldBounds: oldGlobalBounds).
                    (data at: 3) at: index Put: newOffset.
                    mph changed.
                    mph globalPosition: joinee globalPosition + newOffset.
                    mph changed.
                 ].
                 data at: 1 Put: joinee globalBaseBounds.
               ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: opening new windows\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         alsoOpenOnDisplay: dispName = ( |
            | 
            alsoOpenOnDisplay: dispName At: 100@100 Limited: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: opening new windows\x7fComment: Open an additional window for this world on the given display.
Initially, this window will have the same size as the first
window in the list of canvases and its upper left-hand corner
will be positioned at the given screen location.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         alsoOpenOnDisplay: dispName At: screenPt Limited: isLimited = ( |
             sz.
            | 
            winCanvases isEmpty
                ifTrue: [ sz: 200@150 ]
                 False: [ sz: winCanvases first size ]. 
            addWindowOnDisplay: dispName Bounds: (screenPt ## sz) Limited: isLimited.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: multi-user support\x7fComment: Return any open window canvas belonging to this world.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         anyOpenWindowCanvas = ( |
            | 
            anyOpenWindowCanvasIfNone: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: multi-user support\x7fComment: Return any open window canvas belonging to this world, or
evaluate fb if there is none.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         anyOpenWindowCanvasIfNone: fb = ( |
            | 
            winCanvases findFirst: [|:c| c isOpen]
                        IfPresent: [|:c| c]
                         IfAbsent: [fb value: 'No windows open on this world']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: multi-user support\x7fComment: Return any window canvas belonging to this world.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         anyWindowCanvas = ( |
            | 
            anyWindowCanvasIfNone: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: multi-user support\x7fComment: Return any window canvas belonging to this world, or
evaluate fb if there is none.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         anyWindowCanvasIfNone: fb = ( |
            | 
            winCanvases isEmpty ifTrue: [^ fb value: 'No windows open on this world'].
            winCanvases first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         askAboutHome: e = ( |
            | 
            (userQueryMorph askYesNo: 'Go home?' Event: e)
              ifTrue: [moveHand: e sourceHand InWorldTo: 0@0].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         attachQuitDialog: evt = ( |
             n.
            | 
            n: userQuery
             askMultipleChoice: 'Quit Self?'
             Choices: ('Just quit' & 'Save then quit' & 'Cancel') asVector
             Results: ('Just quit' & 'Save then quit' & 'Cancel') asVector.
            n = 'Cancel' ifTrue: [^ self ].
            n = 'Just quit' ifTrue: [ ^ shell quitNoSave].
            n = 'Save then quit' ifTrue: [
              shell saveThenQuit.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: background-menu building\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         backgroundMenu <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: background-menu building\x7fComment: objects in this set will be sent the message modifyMenu: theMenu
whenever the background menu is rebuilt\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: ( set copyRemoveAll )\x7fVisibility: private'
        
         backgroundMenuContributors <-  set copyRemoveAll .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: basics\x7fComment: baseBounds is infinite:
  (infinity negate @ infinity negate) # (infinity @ infinity)\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseBounds = ((-1e100 "negative infinity")@(-1e100 "negative infinity")) # (( 1e100 "infinity")@( 1e100 "infinity")).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: drawing\x7fComment: The base of a worldGlyph is invisible.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: aCanvas = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: multi-user support\x7fComment: Return the buffer canvas associated with the given hand.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         bufCanvasForHand: h = ( |
            | 
            bufCanvases at: (
                hands keyAt: h IfAbsent: [ error: 'That hand is not in this world' ])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: background-menu building\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         buildBackgroundMenu = ( |
             m.
            | 
            m: groupedUI2Menu copy.
            m groups: ( 
              'top' 
            & 'builtInMorphs' 
            & 'usefulObjects' 
            & 'worldManagement' 
            & 'applications' 
            & 'memory' 
            & 'bottom') asVector.

            m color: menuColor.
            backgroundMenuContributors do: [|:mod| 
              mod contributeToBackgroundMenu: m.
            ].
            m colorAll: m color.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: damage management\x7fComment: Force the entire world to be redrawn on the next update cycle.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         changed = ( |
            | 
            redrawAll: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         cleanUp: evt = ( |
             border = (8)@(8).
             others.
             outliners.
             p <- (0)@(0).
             w <- 0.
             wc.
            | 
            wc: winCanvasForHand: evt sourceHand.
            p: wc offset negate + border.

            outliners: list copyRemoveAll.
            others: list copyRemoveAll.
            morphsDo: [|:m| 
              (m isOutliner ifTrue: [outliners] False: [others])
                add: m
            ].
            outliners do: [|:o| o collapse: evt].

            outliners: outliners asVector sortBy: ( |
              element: o1 Precedes: o2 = ( | s1. s2. is1. is2|
                s1: o1 titleString.  s2: o2 titleString.
                is1: (s1 = 'shell') ||  [s1 = 'a shell'].
                is2: (s2 = 'shell') ||  [s2 = 'a shell'].
                is1 != is2  ifTrue: [ ^is1 ].
                o1 titleString <= o2 titleString) | ).

            outliners do: [|:o|
              (p y + wc offset y + o bounds height) > wc size y
               ifTrue: [
                p: (p x + w) @ wc offset y negate.
                p: p + border.
                w: 0.
              ].
              o moveToPosition: p.
              p: p + (0@ o bounds height).
              w: w max: o bounds width.
            ].

            others do: [|:m|
              m morphTypeName = 'trashCanMorph' ifTrue: [
                m moveToPosition: 
                  wc offset negate + (( wc size x - m bounds width) @ 0).
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step process\x7fComment: Clip the rectangles in the given damage list to the bounds
of the given canvas and return the resulting list. Ignore
any damage rectangles that do not intersect the given canvas
at all.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         clipAndFilterDamage: d ForCanvas: c = ( |
             b.
             l.
             newDamage.
             r.
             t.
            | 
            l: c offset x negate.
            t: c offset y negate.
            r: l + c size x.
            b: t + c size y.
            newDamage: list copyRemoveAll.
            d do: [| :rect. newRect |
                newRect: rectangle
                    copyX: ((rect  left max: l) min: r) @ ((rect    top max: t) min: b)
                        Y: ((rect right max: l) min: r) @ ((rect bottom max: t) min: b).
                ((newRect width > 0) && [newRect height > 0]) ifTrue: [
                    newDamage add: newRect.
                ].
            ].
            newDamage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fComment: This message should be sent only from outside the UI process,
since the first line stops the UI process (so it would never
get to the second line). Use \'closeFromHand:\' to close a
window from within the UI process. It closes all windows
for this world.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            releaseParts.
            desktop removeWorld: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fComment: This message should be sent only from within the UI process.
It closes the window before stopping the UI process (that
is, the process executing this very method). It only stops
the UI process if the last window is closed.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         closeFromHand: h = ( |
             bc.
             wc.
            | 
            wc: winCanvasForHand: h.
            bc: bufCanvasForHand: h.

            morphs copy do: [| :m | 
                (m morphTypeName = screenEdge morphTypeName) ifTrue: [
                    (m winCanvas = wc) ifTrue: [ m delete ].
                ].
            ].

            bc close.
            wc close.
            h changed.

            hands:       (hands       asList remove:  h) asVector.
            winCanvases: (winCanvases asList remove: wc) asVector.
            bufCanvases: (bufCanvases asList remove: bc) asVector.


            winCanvases isEmpty ifTrue: [
              "This helps garbage to be reclaimed"
              removeAllMorphs.
              desktop removeWorld: self.
              stop.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         collapseAllOutliners: evt = ( |
            | 
            morphsDo: [| :o | o isOutliner ifTrue: [ o collapse: evt ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step process\x7fComment: Draw everything from scratch.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         completeDisplayUpdate = ( |
            | 
            damageList removeAll.  "clear damage list"
            winCanvases do: [|:c. :i|
                c redrawWindow: true.
                incrementalUpdateCanvasesAt: i
                                     Morphs: (hands, rawMorphs)
                                     Damage: vector.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: background-menu building\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         contributeToBackgroundMenu: m = ( |
            | 
            m addButton: ( (ui2Button copy scriptBlock: [event sourceHand attach: event sourceHand world outlinerForMirror: reflect: globals]) 
                                                 label: 'Globals' )
                ToGroup: 'usefulObjects'.
            m addButton: ( (ui2Button copy scriptBlock: [target toggleSpy]) 
                                                 label: 'Toggle Spy' )
                ToGroup: 'builtInMorphs'.
            m addButton: ( ( ui2Button copy scriptBlock: [target collapseAllOutliners: event] ) 
                                                  label: 'Collapse All' )
                ToGroup: 'worldManagement'.

            m addButton: ( ( ui2Button copy scriptBlock: [target cleanUp: event] ) 
                                                  label: 'Clean Up' )
                ToGroup: 'worldManagement'.

            m addButton: ( ( ( ui2Button copy scriptBlock: [target attachQuitDialog: event] ) 
                                                    label: 'Quit...' )
                                      isAsynchronous: true )
                ToGroup: 'bottom'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: damage management\x7fComment: Return a copy of the damage list with overlapping
rectangles merged.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyCollapsedDamageList = ( |
             merged.
             unprocessed.
            | 
            "Optimizations for zero and one damaged regions:"
            0 = damageList size ifTrue: [ ^vector ].
            1 = damageList size ifTrue: [ ^vector copyAddLast: damageList first ].

            merged: list copyRemoveAll.
            unprocessed: damageList copy.
            [unprocessed isEmpty] whileFalse: [| thisRect |
                thisRect: unprocessed removeFirst.
                unprocessed: unprocessed copyFilteredBy: [| :r |
                    (mergeL: r left
                          R: r right
                          T: r top
                          B: r bottom
                       Into: thisRect) not.
                    "keep r in unprocessed if not merged with thisRect"
                ].
                ((0 < thisRect width) && [0 < thisRect height]) ifTrue: [
                    merged add: thisRect.
                ].
            ].
            merged asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpen = ( |
            | 
            copyOpenOnDisplay: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpenOnDisplay: dispName = ( |
            | copyOpenOnDisplay: dispName Bounds: (100@100) ## (200@150)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpenOnDisplay: dispName Bounds: b = ( |
            | 
            copyRemoveAllMorphs initToOpenOnDisplay: dispName Bounds: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: damage management\x7fComment: Record that the given rectangle (in global coordinates) contains
morphs that changed and should be redrawn.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         damaged: rect = ( |
             b.
             l.
             r.
             t.
            | 
            "Details: Damage is often reported for rectangles that are
             identical or overlap significantly. In this case, it is
             typically more efficient to retain only the union of the
             two rectangles in the damage list, decreasing the work
             required to redraw the damaged areas. One could imagine
             making the decision to merge two overlapping rectangles
             based on their percentage of overlap. For now, we simply
             merge rectangles that have any amount of overlap at all." 

            redrawAll || drawIncrementally not ifTrue: [^self].
            l: rect left.
            r: rect right.
            t: rect top.
            b: rect bottom.
            damageList do: [| :thisRect |
                (mergeL: l R: r T: t B: b Into: thisRect) ifTrue: [^self].
            ].

            "Make a deep copy of all rectangles added to the damaged list
             since rectangles in this list can be extended in place."
            damageList addFirst:
                (rect copyX: rect origin copy Y: rect corner copy).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: damage management\x7fComment: Record that the given rectangle (in global coordinates) contains
morphs that have changed and should be redrawn.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         damagedLeft: l Right: r Top: t Bottom: b From: m = ( |
            | 
            "Details: Damaged rectangles are often identical or overlap
             significantly. In these cases, it is typically more efficient
             to retain only the union of the overlapping rectangles in the
             damage list, decreasing the work required to redraw the damaged
             areas. One could imagine making the decision to merge two overlapping
             rectangles based on their percentage of overlap. For now, we simply
             merge rectangles that have any amount of overlap at all." 


            damageList do: [| :thisRect |
                (mergeL: l R: r T: t B: b Into: thisRect) ifTrue: [^self].
            ].
            redrawAll || drawIncrementally not ifTrue: [^self].
            "Make a deep copy of all rectangles added to the damaged list
             since rectangles in this list are extended in place."
            damageList addFirst: (rectangle copyX: (l@t) Y: (r@b)).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: UI process\x7fComment: Sleep for the given time, unless an event arrives.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         delayIfNoInputFor: desiredDelay = ( |
             tStart.
            | 
            "Details: Due the differing clock resolutions and the vissitudes
             of the scheduler, the call 'times delay: n' may cause the process
             to sleep for longer than n milliseconds. Thus, this method uses
             the real time clock to decide when it has delayed long enough."

            tStart: times real msec.
            [desiredDelay > (times real msec - tStart)] whileTrue: [
              eventsPending ifTrue: [ ^self ].
              times delay: 1.  "ask for a small delay; typically get a longer one"
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: options\x7fComment: This is our desired frame time, we can go faster then this to
cope with user input or slower to avoid hogging CPU\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (8)\x7fVisibility: public'
        
         desiredFrameTime <- 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fComment: Force immediate display update - RBS with DMU \x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         displayUpdateNow = ( |
            | 
            safelyDo: [
              drawIncrementally ifTrue: [ incrementalDisplayUpdate ]
                                 False: [    completeDisplayUpdate ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: options\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         doArrows <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step process\x7fComment: Do one reactive cycle. That is, step the activities,
read and process input events, and update the display.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         doStep = ( |
            | 
            stepStartTime: time current.
            processNotifier.
            processActivities.
            eventsPending ifTrue: [ processInputs ].
            processOutlinerActivitiesWithoutStarvation.
            adjustJoinedMorphsIfNeeded.
            doArrows      ifTrue: [ processArrows ].
            redrawAll     ifTrue: [
                redrawAll: false.
                completeDisplayUpdate.
            ] False: [
                displayUpdateNow.
            ].
            doSyncs && [1 = winCanvases size] ifTrue: [
                "do syncs only in single-user case to avoid
                 locking out other users when moving a window"
                winCanvases do: [| :wc |
                    wc display syncDiscardingIf: false.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: options\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         doSyncs <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: options\x7fComment: Quartz works either way, but X needs this to be true.
  -- dmu 1/08\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         doubleBuffering <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: options\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         drawIncrementally <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step process\x7fComment: Support for efficient incremental display update. Efficiently
draw the morphs from the given list that intersect the given
rectangle onto the given canvas.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         drawMorphs: mList Intersecting: r On: aCanvas Offset: offset = ( |
             morphsToDraw.
             redrawBoxes.
            | 
            morphsToDraw: list copyRemoveAll.
            redrawBoxes:  list copyRemoveAll.
             filterMorphsIn: mList
               Intersecting: r
                       Into: morphsToDraw
            RedrawBoxesInto: redrawBoxes
                     Offset: offset.
            aCanvas fillRectangle: r Color: color.
            morphsToDraw with: redrawBoxes ReverseDo: [| :m. :rBox |
               aCanvas redrawBox:  rBox.
                m drawOn: aCanvas.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step process\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         eventsPending = ( |
            | 
            winCanvases do: [| :wc |
              "poll all windows for input events"
              wc eventsPending > 0 ifTrue: [ ^true ]
            ].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: dropping\x7fComment: Drop the morph m into the world in response to the given
event.  The falling morph falls at the point given by this
event.  Each morph below that point is given a chance to
accept or reject the falling morph.  If a morph rejects the
falling morph, it falls through that morph onto the morph
directly below it, which is then given a chance to accept the
falling morph.  If no other morph accepts the falling morph, it
simply lands on the world.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         fallingMorph: m Event: evt = ( |
             target.
             targets.
            | 
            targets: morphsAt: evt cursorPoint.
            target: targets first.
            [
              (target !== m) &&
              [target wantsMorph: m Event: evt] ifTrue: [
                target addDroppingMorph: m Event: evt.
                target isWorldMorph && [targets size = 1] ifFalse: [
                  "will get called anyway by world"
                  m justDroppedInto: target Event: evt.
                ].
                ^self.
              ].
              target: target owner.
            ] untilTrue: [target isNil].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step process\x7fComment: Support for efficient incremental display update. The given list of morphs
is scanned for morphs that intersect the given damage rectangle. Such
morphs are appended to morphsToDraw. If a morph is itself completely
enclosed by the rectangle, there is nothing to be gained by pruning the
drawing of its submorphs to the given rectangle; this fact is recorded
by appending nil to redrawBoxes (versus the pruning box). This method
puts the morphs to be drawn into the morphsToDraw list and the pruningBoxes into the redrawBoxes list.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         filterMorphsIn: mList Intersecting: r Into: morphsToDraw RedrawBoxesInto: redrawBoxes Offset: offset = ( |
             pruningBox.
            | 
            pruningBox: r translateBy: offset.
            mList do: [| :m. mBnds |
                mBnds: m bounds.
                (mBnds intersects: r) ifTrue: [
                    morphsToDraw add: m.
                    redrawBoxes  add:
                        "nil means draw entire morph; otherwise, append the box for pruning"
                        ((r enclosesOrEquals: mBnds) ifTrue: nil False: pruningBox).
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step process\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         forkStepProcess = ( |
            | 
            stepSucceeded: false.
            [startStepProcess]. "browsing"
            stepProcess:
                process copySend: (message copy receiver: self Selector: 'startStepProcess')
                    CauseOfBirth: 'UI2 stepProcess'.
            stepProcess birthEvent: (ui2Event copy sourceHand: hands firstIfAbsent: [^ self]).
            stepProcess priority: highProcessPriority.
            stepProcess resume).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step timeout process\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         forkStepTimeoutProcess = ( |
            | 
            abortStepTimeoutProcess.
            [watchForStepTimeout]. "for browsing"
            stepTimeoutProcess: (process copySend: (message copy receiver: self
                                                                 Selector: 'watchForStepTimeout')
                                     CauseOfBirth: 'UI2 step timeout process').
            stepTimeoutProcess priority: highProcessPriority.
            stepTimeoutProcess resume).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step watcher\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         forkStepWatcher = ( |
            | 
            abortStepWatcher.
            [startStepWatcher]. "for browsing"
            stepWatcher: (
              process copySend: (message copy receiver: self Selector: 'startStepWatcher')
                  CauseOfBirth: 'UI2 stepWatcher'
            ) resume).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: UI process\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         forkUIProcess = ( |
            | 
            abortUIProcess.
            [runLoop]. "for browsing"
            uiProcess:
              process copySend: (message copy receiver: self Selector: 'runLoop')
                  CauseOfBirth: 'UI2 runLoop'.
            uiProcess priority: highProcessPriority.
            uiProcess resume).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fComment: Fork a process to run the UI in the background.
\'go\' starts running the world; \'stop\' stops it.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         go = ( |
            | 
            hands isEmpty ifTrue: [warning: printString, ' cannot go; no sourceHands'. ^ self].
            stop.
            reifiedObjects resetLock.
            redrawAll:    true.
            uiCritical:   uiCritical   copyBinary.
            outlinerActivitiesSema: outlinerActivitiesSema copyBinary.
            stepSema:     stepSema     copy.
            stepDoneSema: stepDoneSema copy.
            forkUIProcess.   "this is the outer loop"
            forkStepProcess. "this runs the inner part of the loop in a separate process"
            forkStepWatcher. "this watches for the step process and wakes up when it suspends"
            forkStepTimeoutProcess. "this watches for the step to time out"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: multi-user support\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handForWinCanvas: wc IfAbsent: fb = ( |
            | 
            hands findFirst: [|:h| wc = winCanvasForHand: h IfAbsent: false]
                  IfPresent: [|:h| h]
                   IfAbsent: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step process\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         highProcessPriority = ( |
            | 
            2 + process defaultInitialPriority).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step process\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         incrementalDisplayUpdate = ( |
             damage.
            | 
            damage: copyCollapsedDamageList.
            damageList removeAll.  "clear damage list"
            winCanvases do: [|:c. :i|
                incrementalUpdateCanvasesAt: i
                                     Morphs: (hands, rawMorphs)
                                     Damage: damage.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step process\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         incrementalUpdateCanvasesAt: i Morphs: allMorphs Damage: dList = ( |
            | 
            incrementalUpdateWinCanvas: (winCanvases at: i)
                             BufCanvas: (bufCanvases at: i)
                                Morphs: allMorphs
                                Damage: dList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step process\x7fComment: Draw only those morphs that intersect damaged rectangles.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         incrementalUpdateWinCanvas: wc BufCanvas: bc Morphs: allMorphs Damage: dList = ( |
             c.
             damagedRects.
             offset.
            | 
            offset: wc offset.
            doubleBuffering
                ifTrue: [ c: bc copyReset offset: offset ]
                 False: [ c: wc copyReset offset: offset ].
            wc redrawWindow ifTrue: [
                wc redrawWindow: false.
                damagedRects: (vector copyAddLast: wc boundingBoxInWorld).
            ] False: [
                damagedRects: (clipAndFilterDamage: dList ForCanvas: c).
            ].
            damagedRects do: [| :damage |
                doubleBuffering ifTrue: [
                    "draw all the morphs that are visible in the damaged area"
                    drawMorphs: allMorphs Intersecting: damage On: c Offset: offset.
                    wc pastePixmap: c
                        At:    damage origin   Src: damage origin + offset
                        Width: damage width Height: damage height.
                ] False: [
                    c withClip: damage Do: [
                        "draw all the morphs that are visible in the damaged area"
                        drawMorphs: allMorphs Intersecting: damage On: c Offset: offset.
                    ].
                ].
            ].
            wc display flush.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         initToOpenOnDisplay: dispName Bounds: b = ( |
            | 
            winCanvases: vector.
            bufCanvases: vector.
            hands:       vector.
            activities:  activities copyRemoveAll.
            uiCritical:  uiCritical copyBinary.

            uiProcess:   nil.
            stepProcess: nil.
            stepWatcher: nil.
            stepTimeoutProcess: nil.

            damageList:         damageList copyRemoveAll.
            reifiedObjects:     reifiedObjects copyRemoveAll.
            joinedMorphs:       joinedMorphs copyRemoveAll.
            outlinerActivities: outlinerActivities copyRemoveAll.

            color: preferences desktop backgroundColor.
            backgroundMenu: nil.
            desktop setNameOfNewWorld: self.
            addWindowOnDisplay: dispName Bounds: b.
            desktop addWorld: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: basics\x7fComment: Initialize this morph. This message is sent to
to each morph prototype after filing it in.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            color: (paint named: 'gray') copyBrightness: 0.93.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         isWorldMorph = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: joining support\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot'
        
         join: morph1 To: morph2 = ( |
             data.
            | 
            "Reveals implementation of joinedMorphs"
            morph1 unjoin.
            data: nil. 
            joinedMorphs do: [ | :a | 
              (a at: 0) = morph2 ifTrue: [data: a].
            ].
            data ifNil: [
              data: (morph2 & morph2 globalBaseBounds & sequence copyRemoveAll & sequence copyRemoveAll) asSequence.
              joinedMorphs add: data.
            ].
            (data at: 2) add: morph1.
            (data at: 3) add: (morph1 globalPosition - morph2 globalPosition).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: joining support\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot'
        
         joineeForMorphOrNil: m = ( |
            | 
            "Relies on details of implementation of joinedMorphs"
            joinedMorphs do: [ |:a | 
              ((a at: 2) includes: m) ifTrue: [
                 ^ (a at: 0).
               ].
            ].
            ^ nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: basics\x7fComment: Just flush my layout caches.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         layoutChanged = ( |
            | 
            flushLayoutCaches.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftDoubleClick: e = ( |
            | 
            [askAboutHome: 0].
            "only if click on background"
            rootMorphsAt: e cursorPoint Do: [^ self].
            (message copy receiver: self Selector: 'askAboutHome:' With: e) fork.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: event handling\x7fComment: If button down over the world, drag out a selection region\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: e = ( |
            | 
            carpetMorph copyHand: e sourceHand.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step watcher\x7fComment: The stepProcess has crashed twice in quick succession.
Make a notifier to be spawned in a new world.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         makeNotifier = ( |
             bb.
             c.
             debugger.
             ff.
             r.
             r2.
             restartButton.
             s.
             worldButton.
            | 
            ff: frameMorph copy. 
            ff beShrinkWrap.

            debugger: selfProcessModel debugUIProcess: stepProcess.

            s: spacerMorph copy.
            s baseMinHeight: 5.
            s beFlexible.

            r: rowMorph copy.
            r addMorph:
              (labelMorph copy label:
                'An error has occurred while running world (desktop worldNamed: \'', name, '\') ').
            worldButton:
              objectPushButton copyMirror: (reflect: self) Color: debugger color.
            r addMorphLast: worldButton.
            r color: (paint named: 'red').

            c: columnMorph copy.
            c centerJustify.
            c addMorph: r.

            restartButton: (((ui2Button copy label: ' restart world \'', name, '\'') 
                                  scriptBlock: [target go])
                                  target: self).
            bb: frameMorph copy. 
            bb beShrinkWrap.
            bb addMorph: restartButton.

            r2: rowMorph copy.
            r2 addMorph: (labelMorph copy label: 'You can attempt to fix the problem here then ').
            r2 addMorphLast: bb.
            c addMorphLast: r2.

            c addMorphLast: s.
            c addMorphLast: debugger.
            c beShrinkWrap.

            ff addMorph: c.
            ff colorAll: debugger color.
            ff).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: worldMorph InitialContents: InitializeToExpression: (paint copyRed: 0.932551 Green: 0.875855  Blue: 0.826979)\x7fVisibility: private'
        
         menuColor = paint copyRed: 0.932551 Green: 0.875855  Blue: 0.826979.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: damage management\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         mergeL: l R: r T: t B: b Into: rect = ( |
             maxB.
             maxL.
             maxR.
             maxT.
             minB.
             minL.
             minR.
             minT.
             rB.
             rC.
             rL.
             rO.
             rR.
             rT.
            | 
            rO: rect origin.
            rC: rect corner.
            rL: rO x.
            rT: rO y.
            rR: rC x.
            rB: rC y.

            (rL > l) ifTrue: [ maxL: rL. minL: l ] False: [ maxL: l. minL: rL ].
            (rR > r) ifTrue: [ maxR: rR. minR: r ] False: [ maxR: r. minR: rR ].
            (rT > t) ifTrue: [ maxT: rT. minT: t ] False: [ maxT: t. minT: rT ].
            (rB > b) ifTrue: [ maxB: rB. minB: b ] False: [ maxB: b. minB: rB ].
            ((maxL > minR) || [maxT > minB]) ifTrue: [ ^false ].

            "merge the rectangles in place and return true"
            rO x: minL.
            rO y: minT.
            rC x: maxR.
            rC y: maxB.
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: e = ( |
            | 
            "only if click on background"
            rootMorphsAt: e cursorPoint Do: [^ self].
            backgroundMenu ifNil: [ backgroundMenu: buildBackgroundMenu ].
            ( backgroundMenu copy retargetButtonsTo: self) popUp: e.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'worldMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: joining support\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot'
        
         morphsJoinedTo: m = ( |
             l.
            | 
            "Relies on implementaion details of joinedMorphs"
            l: list copyRemoveAll.
            joinedMorphs do: [ |:a | 
              (a at: 0) = m ifTrue: [
                "added by dmu 3/01"
                a at: 2 Put: (a at: 2) copyFilteredBy: [|:m| m isInWorld].
                l: l , (a at: 2).
              ].
            ].
            ^ l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: moving around\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         moveHand: h InWorldBy: deltaPt = ( |
            | 
            "positive delta moves down/right"
            moveHand: h InWorldTo: h winCanvasForHand offset - deltaPt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: moving around\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         moveHand: h InWorldTo: pt = ( |
             bc.
             wc.
            | 
            wc:  winCanvasForHand: h IfAbsent: [^ self].
            bc:  bufCanvasForHand: h.
            reportDamageForCanvas: wc.
            wc offset: pt.
            bc offset: pt.
            reportDamageForCanvas: wc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: activities\x7fComment: Move the outliner to the head of update list -- Mario, 2/4/95\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         moveOutlinerToFront: outliner = ( |
            | 
            outliner isOutliner ifFalse: [^self].
            outlinerActivitiesSema protect: [
              outlinerActivities remove: outliner IfAbsent: nil.
              outlinerActivities addFirst: outliner.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         moveToBack: m = ( |
            | 
            resend.moveToBack: m.
            arrowsNeedSorting: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         moveToFront: m = ( |
            | 
            resend.moveToFront: m.
            m isOutliner ifTrue: [moveOutlinerToFront: m].
            arrowsNeedSorting: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | 
            rawName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: naming\x7fComment: Set the world name and window name(s) to n.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         name: n = ( |
            | 
            rawName: n.
            windowTitle: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         namePrintString = ( |
            | 
            name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: joining support\x7fComment: Used internally as part of atachment readjustment.

This method encodes the readjustment policy.

mph is attached to attachee, and its old positional offset
was offset. The original attachee\'s global base bounds was
oldGlobalBounds. \x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot'
        
         newOffsetFor: mph JoinedTo: joinee Offset: offset OldBounds: oldGlobalBounds = ( |
             pt.
            | 
            pt: offset - (joinee globalPosition - joinee globalBounds topLeft).

            (pt y <= 0) && (pt x <= 0) ifTrue: [
                      "Common case ... offset does not re-scale. Simply displace mph
                       by the recorded offset."
                      ^ offset. 
                  ] False: [ | newX. newY. |
                      newX: nil. newY: nil. 
                      (pt x <= 0)                      ifTrue: [newX: offset x].
                      (pt x >= oldGlobalBounds width ) ifTrue: [newX: joinee globalBaseBounds width +  (offset x - oldGlobalBounds width). ].
                      (pt y <= 0)                      ifTrue: [newY: offset y].
                      (pt y >= oldGlobalBounds height) ifTrue: [newY: joinee globalBaseBounds height + (offset y - oldGlobalBounds height).].
                      newX ifNil: [ newX: ((offset x * (joinee globalBaseBounds width  asFloat / oldGlobalBounds width  asFloat)) asInteger)].
                      newY ifNil: [ newY: ((offset y * (joinee globalBaseBounds height asFloat / oldGlobalBounds height asFloat)) asInteger)].
                      ^ newX @ newY
                  ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step watcher\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         notifyActivityRemoval = ( |
             qm.
             s.
            | 
            s: 'The world crashed while stepping activity:\n',
                    currentActivity printString.
            qm: userQueryMorph copyQuestion: s.
            qm addButtonToRow: 
             ( ( 
               ui2Button copy 
                 label: 'Dismiss' )
                 scriptBlock: [button safelyDo: [ button root delete ]] )
                 target: currentActivity.

            qm colorAll: qm color.
            notifierToDisplay: qm.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step watcher\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         notifyUpdatingDisabled = ( |
             qm.
             s.
            | 
            s: 'The world crashed while updating an outliner:\n',
               currentOutliner printString.
            qm: userQueryMorph copyQuestion: s.
            qm addButtonToRow: 
             ( ( 
               ui2Button copy 
                 label: 'Dismiss outliner & resume updating' )
                 scriptBlock: [target safelyDo: [ target delete ].
                          button world updateOutliners: true.
                          button safelyDo: [ button root delete ]] )
                 target: currentOutliner.

            qm addButtonToRow: 
             ( (  
               ui2Button copy 
                 label: 'Resume updating' )
                 scriptBlock: [button world updateOutliners: true.
                          button safelyDo: [ button root delete ]] )
                 target: currentOutliner.

            qm colorAll: qm color.
            notifierToDisplay: qm.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: opening new windows\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         openNew = ( |
            | copyOpen go).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: reified object cache\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         outlinerForMirror: m = ( |
            | 
            selfObjectModel newOutlinerFor: m InWorld: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'ModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot'
        
         platformSpecificNameFor: displayName = ( |
            | 
            host osName == 'macOSX' ifTrue: [^'quartz'].
            displayName == 'quartz' ifTrue: [^ ''].
            " Reset to zero if reseting X Display"
            (snapshotAction commandLine includes: '--resetXDisplays')
              ifTrue: [^ ''].
            displayName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         privateRemoveMorph: m IfPresentDo: b = ( |
            | 
            resend.privateRemoveMorph: m IfPresentDo: b.
            arrowsNeedSorting: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: activities\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         processActivities = ( |
            | 
            activities isEmpty ifTrue: [ ^self ].

            activities copy do: [| :a |
              currentActivity: a.
              stepStartTime: time current.
                a done ifTrue: [
                    a finalStep.
                    removeActivity: a.
                ] False: [
                    a step.
                ].
              currentActivity: nil.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: arrows\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         processArrows = ( |
            | 
            arrowsNeedSorting ifTrue: [
                sortArrows.
                arrowsNeedSorting: false.
            ].
            morphsDo: [| :m | m isArrowBodyMorph ifTrue: [ m trackEndpoints ]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step process\x7fComment: Process any X events in the input queue. Return immediately
if a window\'s event queue is empty (that is, do not block).\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         processInputs = ( |
            | 
             winCanvases with: hands Do: [| :wc. :h |
                0 = wc eventsPending ifFalse: [
                    h dispatchFrom: wc.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: activities\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         processNotifier = ( |
             bb.
             n.
            | 
            notifierToDisplay ifNil: [^ self ].
            n: notifierToDisplay.
            notifierToDisplay: nil.
            n position: minSmallInt half @ 0.
            safelyDo: [ addMorph: n ]. "for layout"
            bb: n baseBounds.
            safelyDo: [ n delete ].
            winCanvases do: [|:wc. nn |
              nn: n copy.
              nn position: 
                ( n baseBounds center: wc boundingBoxInWorld center ) 
                origin.
              safelyDo: [ addMorph: nn. moveToFront: nn ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: activities\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         processOutlinerActivities = ( |
            | 
            updateOutliners ifFalse: [ ^self ].
            outlinerActivitiesSema protect: [
              outlinerActivities isEmpty ifTrue: [| allMorphs |
                allMorphs: morphs asList.
                hands do: [| :hand | allMorphs addAll: hand morphs ].
                allMorphs do: [| :m |
                    m isOutliner ifTrue: [ outlinerActivities addLast: m ].
                ].
              ] False: [ | subItems |
                subItems: list copyRemoveAll.
                stepStartTime: time current.
                currentOutliner: outlinerActivities removeFirst.
                currentOutliner  updateDo: [| :e | 
                  subItems addLast: e. 
                ].
                currentOutliner: nil.
                subItems reverseDo: [|:i| outlinerActivities addFirst: i].
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: activities\x7fComment: Ensure that updating does not take > 10% of the time.
Of course, ideally it there were nothing else to do, it could, but...
 -- dmu\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         processOutlinerActivitiesWithoutStarvation = ( |
             t.
            | 
            t: time current.
            scheduler isAnotherProcessReady not
            || [ ((outlinerActivityEndTime - outlinerActivityStartTime) * 9) <= (t - outlinerActivityStartTime) ]
             ifTrue: [
              processOutlinerActivities.
              outlinerActivityStartTime: t.
              outlinerActivityEndTime: time current.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         randomColorForUser = ( |
            | 
            paint copyHue: (random integer: 360)
                Saturation: (0.5 + (random float / 2.0))
                Brightness: (0.5 + (random float / 2.0))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         releaseParts = ( |
            | 
            stop.
            bufCanvases with: winCanvases Do: [| :bc. :wc |
                bc close.
                wc close.
            ].
            winCanvases: vector.
            bufCanvases: vector.
            hands:       vector.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: activities\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         removeActivitiesWithTarget: m = ( |
             toRemove.
            | 
            toRemove: list copyRemoveAll.
            activities do: [| :a |
                m = a target ifTrue: [ toRemove add: a ].
            ].
            toRemove do: [| :a | removeActivity: a ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: activities\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         removeActivity: a = ( |
            | 
            activities remove: a IfAbsent: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAllMorphs = ( |
            | 
            resend.removeAllMorphs.
            hands do: [| :h |
                h removeAllMorphs.
                h removeAllSubscribers.
                h subscribeCursor:   h.
                h subscribeKeyboard: h.
                h subscribeWindow:   self.
            ].
            activities: activities copyRemoveAll.
            reifiedObjects: reifiedObjects copyRemoveAll.
            joinedMorphs: joinedMorphs copyRemoveAll.
            outlinerActivities: outlinerActivities copyRemoveAll.
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: background-menu building\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         removeBackgroundMenuContributor: obj = ( |
            | 
            backgroundMenuContributors remove: obj IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         removeMorph: m = ( |
            | 
            resend.removeMorph: m.
            arrowsNeedSorting: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: reified object cache\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         removeReifiedObjectsNotInWorld = ( |
             toRemove.
            | 
            toRemove: list copyRemoveAll.
            reifiedObjects do: [| :morph. :mir |
              morph isInWorld ifFalse: [toRemove add: mir].
            ].
            toRemove do: [|:mir| reifiedObjects removeKey: mir].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fComment: Reopen the receiver after returning from
a snapshot or after
it has been closed by the user.  Open just one window
on the default display.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         reopen = ( |
            | 
            winCanvases isEmpty ifTrue: [
                alsoOpenOnDisplay: ''
            ]
            False: [| wc. oldBounds. oldOffset. seCount <- 0 |
                wc: winCanvases first.
                "ugh, magic number for OSX -- dmu 9/01"
                oldBounds: (3@24 max: wc position) ## wc size.
                oldOffset: wc offset.
                releaseParts.
                addWindowOnDisplay: (platformSpecificNameFor: wc displayName) Bounds: oldBounds.
                winCanvases first offset: oldOffset.  "set scroll offset of new canvas"

                morphsDo: [| :m |
                    m morphTypeName = screenEdge morphTypeName ifTrue: [  
                        seCount: seCount + 1.
                        seCount > 4
                            ifTrue: [ m delete ]
                             False: [ m winCanvas: winCanvases first ].
                    ].
                ].
                reifiedObjects resetLock.
                allMorphsDo:       [|:m| m worldHasReopened].
                reifiedObjects do: [|:m| m worldHasReopened].
            ].
            go.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         reportDamageForCanvas: c = ( |
            | 
            "report damage for screen edges associated with this canvas."
            morphsDo: [| :m |
                ((m morphTypeName = 'screenEdge') && [m winCanvas = c]) ifTrue: [
                    m changed.
                ].
            ].
            c redrawWindow: true. "redraw the window associated with the given canvas"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: colormap management\x7fComment: Report all currently visible colors. Used to reclaim unused colormap entries.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         reportUsedColorsTo: paintMgr = ( |
             c.
             wc.
            | 
            wc: winCanvases first.
            winCanvases do: [| :winC | winC colorDict = paintMgr ifTrue: [ wc: winC ]].
            c: colorRecordingCanvas copyReset client: paintMgr.
            c offset: wc offset.
            c winCanvas: wc.
            drawMorphs: (hands, rawMorphs) Intersecting: wc boundingBoxInWorld On: c Offset: wc offset.
            wc reportPixmapColorsTo: paintMgr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         resizeFromEvent: evt = ( |
            | 
            resizeTo: evt bounds FromHand:  evt sourceHand).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeTo: newBounds FromHand: h = ( |
             bc.
             innerSize.
             outerPosition.
             wc.
            | 
            innerSize: newBounds size.
            wc: winCanvasForHand: h.
            outerPosition: 
              newBounds origin - wc innerOriginOffsetFromBorder. "correct for border"
            wc position: outerPosition.
            wc size: innerSize.

            "make the buffer canvas be the size of the window"
            bc: bufCanvasForHand: h.
            bc close.
            bc: wc pixmapCanvasPrototypeForMyScreen
                 copyForSameScreenAs: wc
                   Width: innerSize x
                  Height: innerSize y.
            bufCanvases at: (hands keyAt: h) Put: bc.
            changed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step watcher\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         restartStepWatcher = ( |
            | 
            stepWatcher abortIfLive: 'restartStepWatcher'.
            forkStepWatcher.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: menu operations\x7fCategory: saving window state\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot'
        
         restoreDesktop = ( |
            | 
            morphsDo: [| :m |
                [| :exit. p |
                    p: savedMorphs at: m IfAbsent: [m delete. exit value].
                    m globalPosition = p ifFalse: [
                        m changed.
                        m globalPosition: p.
                        m changed.
                    ].
                ] exit.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: arrows\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         rootMorphsAt: globalPt Do: blk = ( |
             level <- 0.
            | 
            world morphsDo: [| :m |
                (m noStickOuts && [(m baseBounds includes: globalPt) not]) ifFalse: [
                    (m morphsAt: globalPt) isEmpty ifFalse: [ blk value: m With: level ].
                ].
                level: level succ.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: UI process\x7fComment: Repeatly do reactive cycles. A process is typically forked to
run this method.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         runLoop = ( |
            | 
            "Detail: Don't hog the CPU by running too fast when there is
             no user input, even though there may be ongoing animation or
             monitoring activities. If we get done before consuming the
             desired frame time, sleep for the remainder of the time, checking
             for user inputs at periodic intervals. (A refinement would be
             to hang on the XEvent queue when there is no animation or
             other activity happening, but the current scheme uses extremely
             little CPU time when nothing is happening anyway.)"

            [| computeTime. tStart |
                tStart: times real msec.
                stepSema signal.
                stepDoneSema wait.
                computeTime: times real msec - tStart.
                "ensure don't use more than half of CPU just to run the UI"
                 delayIfNoInputFor: (desiredFrameTime - computeTime) max: desktop worlds size * computeTime.
            ] loop.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: process synchronization\x7fComment: Execute the given block at a safe moment, such
as in between two frames. This allows other processes
to change the state of objects in the UI without
introducing inconsistencies or graphical glitches.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         safelyDoIfWorld: b = ( |
            | 
            uiCritical protect: [ b value ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: menu operations\x7fCategory: saving window state\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         saveDesktop = ( |
            | 
            savedMorphs: savedMorphs copyRemoveAll.
            morphsDo: [| :m |
                savedMorphs at: m Put: m globalPosition.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: colormap management\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         showTrueColors = ( |
            | 
            winCanvases do: [| :wc |
                wc colorDict showTrueColors.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: arrows\x7fComment: Sort arrow bodies so that each arrow body appears in the
morph list just after root morph containing the end of
the arrow that is furthest back.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         sortArrows = ( |
             arrowRoots.
             newMorphs.
             nonArrows.
            | 
            nonArrows:  list       copyRemoveAll.
            arrowRoots: dictionary copyRemoveAll desiredMinCapacity: (4 * morphCount).
            morphsDo: [| :m |
                m isArrowBodyMorph ifTrue: [| l1. l2. r1. r2 |
                    m added: false.        "clear 'added' flag (used below)"
                    m p1: (m p1 + (1@1)).  "trigger endpoint tracking for m"
                    r1: m endMorph1 root.
                    r2: m endMorph2 root.
                    l1: arrowRoots at: r1 IfAbsent: [| arrowsForRoot |
                        arrowsForRoot: list copyRemoveAll.
                        arrowRoots at: r1 Put: arrowsForRoot.
                        arrowsForRoot].
                    l2: arrowRoots at: r2 IfAbsent: [| arrowsForRoot |
                        arrowsForRoot: list copyRemoveAll.
                        arrowRoots at: r2 Put: arrowsForRoot.
                        arrowsForRoot].
                    l1 add: m.
                    l2 add: m.
                ] False: [
                    nonArrows add: m.
                ].
            ].

            newMorphs: list copyRemoveAll.
            nonArrows reverseDo: [| :m |
                newMorphs addFirst: m.
                arrowRoots if: m IsPresentDo: [| :arrowsForRoot |
                    arrowsForRoot do: [| :a |
                        a added ifFalse: [
                            newMorphs addFirst: a.
                            a added: true.
                        ].
                    ].
                ].
            ].
            rawMorphs: newMorphs asVector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step process\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         startStepProcess = ( |
            | 
            "Detail: Synchronize with user processes that may be modifying
             our data structures using the uiCritical semaphore. Of course,
             if users do not choose to use 'safelyDo:' to protect their
             actions, we are helpless..."

            [| :exit |
             stepSema wait. 
             uiCritical protect: [
               doStep.
               "if continuing after an error, abort"
               stepProcess != process this ifTrue: exit.
               stepSucceeded: true.
               firstStepSucceeded: true.
             ].
             stepDoneSema signal
            ] loopExit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step watcher\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         startStepWatcher = ( |
            | 
            "If you change this then run restartStepWatcher on each active world:"
            "desktop worldsDo: [|:w| w restartStepWatcher]"
            [| :exit |
              stepProcess waitForSuspension.
              case
                if: [ activities includes: currentActivity ]  Then: [
                    notifyActivityRemoval.
                    removeActivity: currentActivity.
                    currentActivity: nil.
                    stepSucceeded: true.
              ] If: [ currentOutliner isNotNil ]  Then: [
                    notifyUpdatingDisabled.
                    updateOutliners: false.
                    currentOutliner: nil.
                    outlinerActivitiesSema signal.
                    stepSucceeded: true.
              ].

             stepSucceeded ifTrue: [
                "debugger already added to world"
                forkStepProcess.
                stepDoneSema signal.
                uiCritical signal.
              ] False: [| notifier . dispNames |
                "didn't manage a step -- pop up debugger in new world, unless this
                 world has never stepped in which case the ui is really broken."
                firstStepSucceeded ifTrue: [
                  ('UI step failed twice in ', printString,
                   ' -- starting debugger in new world') printLine.
                  notifier: makeNotifier.
                  dispNames: winCanvases copyMappedBy: [ | :wc | wc display name ].
                  notifier popUpInWindowOn: dispNames.
                ] False: [
                  'Can\'t start debugger in new world -- the UI is really broken!' printLine.
                  'You\'ll have to fix it outside the UI -- then type "desktop go".\n' printLine.
                ].
                exit value
              ]
            ] loopExit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step timeout process\x7fComment: To avoid timeout when Mac sleeps,
ensure that this much CPU has passed.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         stepCPUTimeoutMs = ( |
            | 
            stepTimeoutMs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step timeout process\x7fComment: If step takes longer than this,
assume it is hung.
-- Ungar, 5/29/95\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         stepTimeoutMs = 10000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fComment: Stop the UI processes and signal the uiCritical semaphore to avoid
locking out clients of safelyDo:.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         stop = ( |
            | 
            uiCritical isHeldByThisProcess
              ifFalse: [uiCritical signal].     "allow safelyDo: to proceed"
            damageList removeAll.  "clear damage list"
            abortStepWatcher.
            abortStepTimeoutProcess.
            abortUIProcess.
            abortStepProcess. "put this last - it may not return"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: colormap management\x7fComment: Stress test color map by adding lots of colors...\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         testColormap = ( |
            | 
            257 do: [| :i. m |
                m: morph copy color:
                    paint copyRed: random float Green: random float Blue: random float.
                m position: (10 + (i * 3)) @ 200.
                safelyDo: [ addMorph: m ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         toggleSpy = ( |
            | 
            _Spy: _Spy not.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: joining support\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot'
        
         unjoin: m = ( |
            | 
            unjoin: m IfAbsent: [ error: 'this morph is not joined to anything.']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: joining support\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot'
        
         unjoin: m IfAbsent: blk = ( |
             found.
            | 
            "Relies on details of implementation of joinedMorphs..."
              found: false.
              joinedMorphs copy do: [ |:a | 
              ((a at: 2) includes: m) ifTrue: [
                 (a at: 3) removeKey: ((a at: 2) keyAt: m).
                 (a at: 2) remove: m.
                 found: true.
                 (a at: 2) isEmpty ifTrue: [
                    joinedMorphs remove: a.
                 ].
               ].
            ].
            found ifFalse: [^ blk value].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: dropping\x7fComment: The world accepts all falling morphs.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | 
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step timeout process\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         watchForStepTimeout = ( |
            | 
            [ | t. cpu |
              stepStartTime: time current.
              stepStartCPUTime: times cpu.
              [
                " cannot time out if not running "
                case if: [ stepProcess isActive not ] Then: false
                      " must be stepping activity or updating outliner to time out"
                      " else can time out while just waiting between steps"
                     If: [ ( currentActivity isNil ) && [ currentOutliner isNil ] ] Then: false
                     Else: [ 
                       t: time current - stepStartTime.  
                       cpu: times cpu - stepStartCPUTime.
                       (t > stepTimeoutMs) && [cpu > stepCPUTimeoutMs]
                ]
              ] whileFalse: [ times delay: 3000. ].
              (
                'Step timed out: took ', 
                t printString, 
                ' ms. (limit is ', 
                stepTimeoutMs printString, 
                ' ms.)',
                ', ', cpu printString, 
                ' cpu-ms. (limit is ', 
                stepCPUTimeoutMs printString, 
                ' cpu-ms.)'
              ) printLine.
              stepProcess suspend.
            ] loop.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         wheelMovedBy: pt Event: e = ( |
            | 
            moveHand: e sourceHand InWorldBy: pt negate * 3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         wheelMovedInX: e = ( |
            | wheelMovedBy: e wheelDelta @ 0 Event: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         wheelMovedInY: e = ( |
            | 
            wheelMovedBy: 0 @ e wheelDelta Event: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: multi-user support\x7fComment: Return the window canvas associated with the given hand.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         winCanvasForHand: h = ( |
            | 
            winCanvasForHand: h IfAbsent: [ error: 'That hand is not in this world' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: multi-user support\x7fComment: return the winCanvas associated with h, or eval the 
IfAbsent: argument if none.\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         winCanvasForHand: h IfAbsent: b = ( |
            | 
            winCanvases at: (
               hands keyAt: h IfAbsent: [^ b value] )
                        IfAbsent: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: carrying morphs across windows\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         windowCanvasAndHandAt: pt Server: svrName IfPresent: pb IfAbsent: ab = ( |
            | 
            winCanvases with: hands Do: [|:wc. :h|
                    (wc window display serverName = svrName)
                &&  [wc boundingBoxOnScreen includes: pt]
                ifTrue: [ ^ pb value: wc With: h ]
            ].
            ab value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         windowCanvasPrototypeForDisplay: dispName = ( |
            | 
            (
              case
                if: [dispName isEmpty  &&  [host osName == 'macOSX']]  Then: [self ]
                If: [dispName = quartzGlobals windowCanvas displayName] Then: [quartzGlobals]
                Else: [x11Globals ]
            ) windowCanvas).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         windowEvent: evt = ( |
            | 
            evt windowResize ifTrue: [
                resizeFromEvent: evt.
                ^self.
            ].
            evt windowExpose ifTrue: [| bnds. winOffset. wc |
                wc: winCanvasForHand: evt sourceHand.
                winOffset: wc offset.
                wc withClip: (0@0) ## wc size Do: [[setNoClipMask]. "Mac seems to clip obscured windows"
                    bnds: evt bounds.
                    damagedLeft: bnds   left - winOffset x
                          Right: bnds  right - winOffset x
                            Top: bnds    top - winOffset y
                         Bottom: bnds bottom - winOffset y
                           From: self.
                ].
                ^self.
            ].
            evt windowDelete ifTrue: [
                closeFromHand: evt sourceHand.
                ^self.
            ].
            evt windowLeave ifTrue: [| h. |
                h: evt sourceHand.
                h  carryMorphsLeaving:  winCanvasForHand: h.
                ^self.
            ].
            evt windowEnter ifTrue: [| h. |
                h: evt sourceHand.
                h  carryMorphsEntering:  winCanvasForHand: h.
                ^self.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fModuleInfo: Module: worldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         windowTitle: s = ( |
            | 
            winCanvases do: [| :wc | wc platformWindow name: s ].
            self).
        } | ) 



 '-- Side effects'

 globals modules worldMorph postFileIn
