 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: allSelfObjOutliner InitialContents: FollowSlot'
        
         allSelfObjOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'allSelfObjOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'allSelfObjOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules allSelfObjOutliner.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allSelfObjOutliner' -> () From: ( | {
         'ModuleInfo: Module: allSelfObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allSelfObjOutliner' -> () From: ( | {
         'ModuleInfo: Module: allSelfObjOutliner InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allSelfObjOutliner' -> () From: ( | {
         'ModuleInfo: Module: allSelfObjOutliner InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allSelfObjOutliner' -> () From: ( | {
         'ModuleInfo: Module: allSelfObjOutliner InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.

            selfObjectModel initializeSemaphore.

            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: selfObjectModel
                           Selector: 'initializeSemaphore').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allSelfObjOutliner' -> () From: ( | {
         'ModuleInfo: Module: allSelfObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allSelfObjOutliner' -> () From: ( | {
         'ModuleInfo: Module: allSelfObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'selfGenSlotModel
slotModel
selfCatOrObjModel
selfModuleSetter
moduleHolderModel
selfDebugger
selfSlicer
profileSlicer
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> () From: ( | {
         'Category: Programming Environment\x7fCategory: Outliner\x7fModuleInfo: Module: allSelfObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         programmingSynchronization = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'ui2' -> 'programmingSynchronization' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins ui2 programmingSynchronization.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'programmingSynchronization' -> () From: ( | {
         'ModuleInfo: Module: allSelfObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeSemaphore = ( |
            | 
            programmingSemaphore: 0 recursiveSemaphore copyBinary.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'programmingSynchronization' -> () From: ( | {
         'ModuleInfo: Module: allSelfObjOutliner InitialContents: InitializeToExpression: (recursiveSemaphore copyBinary)\x7fVisibility: private'
        
         programmingSemaphore <- recursiveSemaphore copyBinary.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'programmingSynchronization' -> () From: ( | {
         'Comment: Synchronize Self object mutation operations
to avoid confusing the outliner.
The reason for asynchrony in the first place is that
the UI has to keep running to put up the userQueryMorphs.
(sigh).
This should not be called from the UI process because if
another outliner operation is holding the semaphore,
it will deadlock if it tries to put up a userQueryMorph.
So, check.
-- Ungar, 2/2/95\x7fModuleInfo: Module: allSelfObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         protect: block = ( |
            | 
            isInWorld && [process this = world stepProcess]
             ifTrue: [
              error: 'You can not use mixins ui2 programmingSynchronization protect:\n',
                     'from without the ui step process without risking deadlock.'
            ].
            "probablistic check"
            programmingSemaphore isAvailable ifTrue: [
              programmingSemaphore protect: block
            ] False: [ | qm |
              qm: showReasonForDelay.
              programmingSemaphore protect: [qm safelyDo: [ qm delete]. block value].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'programmingSynchronization' -> () From: ( | {
         'ModuleInfo: Module: allSelfObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         showReasonForDelay = ( |
             b.
             qm.
            | 
            safelyDo: [
              qm: userQueryMorph show: 'Waiting for previous programming operation to finish...'
                                Event: process this birthEvent.
              b: ui2Button copy.
              b  target: programmingSemaphore.
              b   scriptBlock: [target signal].
              " Don't ask me why, but have to add these in reverse order, sigh -- dmu "
              b  addMorph: labelMorph copy label: '(Only if you think it\'s stuck.)'.
              b  addMorph: labelMorph copy label: 'Press here to continue anyway.'.
              b colorAll: qm color. 
              (qm morphs first addMorph: b) moveToBack: b.
            ].
            qm).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'selfGenSlotModel' From: 'ui2/outliner'
 bootstrap read: 'slotModel' From: 'ui2/outliner'
 bootstrap read: 'selfCatOrObjModel' From: 'ui2/outliner'
 bootstrap read: 'selfModuleSetter' From: 'ui2/outliner'
 bootstrap read: 'moduleHolderModel' From: 'ui2/outliner'
 bootstrap read: 'selfDebugger' From: 'ui2/outliner'
 bootstrap read: 'selfSlicer' From: 'ui2/outliner'
 bootstrap read: 'profileSlicer' From: 'ui2/outliner'



 '-- Side effects'

 globals modules allSelfObjOutliner postFileIn
