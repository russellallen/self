 '$Revision: 30.11 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         usePluggableSliceOutliners = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'usePluggableSliceOutliners' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals enumerationMorphFactory usePluggableSliceOutliners.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'usePluggableSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         findSlot: slotNamePattern StartingFrom: mirror Event: evt = ( |
            | 
            ifBypassForEvent: evt  OrForPatterns: slotNamePattern
              Then: [resend.findSlot: slotNamePattern StartingFrom: mirror Event: evt]
              Else: [(((selfSliceModel newOutliner model
                         desiredText: slotNamePattern)
                         startingAt: mirror)
                         inAncestors
                         showHierarchical
                         findImplementors
                         expandAll: evt) myOutliner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'usePluggableSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         ifBypassForEvent: evt OrForPatterns: pat Then: thenBlock Else: elseBlock = ( |
            | 
            [todo cleanup sunflightAndShiftKey].
            "hack for Sunflight" "evt shiftIsDown" false
            || [(pat includes: '*')
            || [ pat includes: '?' ]]
               ifTrue: thenBlock False: elseBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'usePluggableSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         ifBypassForEvent: evt Then: thenBlock Else: elseBlock = ( |
            | 
            "You may want to disable this behavior for SunFlight"

            evt shiftIsDown ifTrue: [
              warning: 'shiftIsDown: using old-style enumeration morphs (see ifBypassForEvent:Then:Else:)'
            ].
            evt shiftIsDown ifTrue: thenBlock False: elseBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'usePluggableSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         implementorsOf: slotName InFamilyOf: mirror Event: evt = ( |
            | 
            ifBypassForEvent: evt
              Then: [resend.implementorsOf: slotName InFamilyOf: mirror Event: evt]
              Else: [(((selfSliceModel newOutliner model
                         desiredText: slotName)
                         startingAt: mirror)
                         inFamily
                         showHierarchical
                         findImplementors
                         expandAll: evt) myOutliner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'usePluggableSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         implementorsOf: slotName StartingFrom: mirror Event: evt = ( |
            | 
            ifBypassForEvent: evt
              Then: [resend.implementorsOf: slotName StartingFrom: mirror Event: evt]
              Else: [(((selfSliceModel newOutliner model
                         desiredText: slotName)
                         startingAt: mirror)
                         findImplementors
                         expandAll: evt) myOutliner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'usePluggableSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         methodsContaining: desiredText StartingFrom: mirror Event: evt = ( |
            | 
            ifBypassForEvent: evt
              Then: [resend.methodsContaining: desiredText StartingFrom: mirror Event: evt]
              Else: [(((selfSliceModel newOutliner model
                         desiredText: desiredText)
                         startingAt: mirror)
                         findMethodsContaining
                         expandAll: evt) myOutliner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'usePluggableSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useStandardEnumerationMorphs' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'usePluggableSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         referencesOf: referentMirror StartingFrom: mirror Event: evt = ( |
            | 
            ifBypassForEvent: evt
              Then: [resend.referencesOf: referentMirror StartingFrom: mirror Event: evt]
              Else: [(((selfSliceModel newOutliner model
                         desiredText: '')
                         startingAt: mirror)
                         findReferences
                         expandAll: evt) myOutliner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'usePluggableSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         sendersOf: slotName InFamilyOf: mirror Event: evt = ( |
            | 
            ifBypassForEvent: evt
              Then: [resend.sendersOf: slotName InFamilyOf: mirror Event: evt]
              Else: [(((selfSliceModel newOutliner model
                         desiredText: slotName)
                         startingAt: mirror)
                         inFamily
                         showHierarchical
                         findSenders
                         expandAll: evt) myOutliner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'usePluggableSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         sendersOf: slotName StartingFrom: mirror Event: evt = ( |
            | 
            ifBypassForEvent: evt
              Then: [resend.sendersOf: slotName StartingFrom: mirror Event: evt]
              Else: [(((selfSliceModel newOutliner model
                         desiredText: slotName)
                         startingAt: mirror)
                         findSenders
                         expandAll: evt) myOutliner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot'
        
         selfSliceModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfSliceModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceModel' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceModel' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceModel' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceModel' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            enumerationMorphFactory parent: enumerationMorphFactory usePluggableSliceOutliners).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceModel' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceModel' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fCategory: SliceOutliner & helpers\x7fModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         selfSliceModel = bootstrap define: bootstrap stub -> 'globals' -> 'selfSliceModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalSliceModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceModel.

CopyDowns:
globals generalSliceModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceModel' -> () From: ( | {
         'Category: slice model state\x7fModuleInfo: Module: selfSliceModel InitialContents: InitializeToExpression: (-1)\x7fVisibility: private'
        
         lastProgrammingTimestamp <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceModel' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'selfSliceModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalSliceModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'Comment: Holds button descriptions:
category leaf is button name, 
slot name is button name in buttonCache,
method source is button script,
public slots make asynchronous buttons.\x7fModuleInfo: Creator: globals selfSliceModel parent buttonDescriptions.

CopyDowns:
globals generalSliceModel parent buttonDescriptions. _Clone 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceModel' -> 'parent' -> 'buttonDescriptions' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceModel parent buttonDescriptions parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceModel' -> 'parent' -> 'buttonDescriptions' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> 'buttonDescriptions' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonsToPutInMenu = ( |
            | 
            resend.buttonsToPutInMenu
              copyAddLast: 'userDefined').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceModel' -> 'parent' -> () From: ( | {
         'Category: enumerating\x7fComment: Do enumeration and return the outliners
to put in me.\x7fModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         enumerationOutliners = ( |
            | 
            lastProgrammingTimestamp: 0 asMirror programmingTimestamp.
            resend.enumerationOutliners).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceModel' -> 'parent' -> () From: ( | {
         'Category: showing/hiding controls\x7fModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sliceControlPanel = ( |
            | 
            selfSliceControlPanel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sliceGroupModel = ( |
            | selfSliceGroupModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sliceReferrent = ( |
            | selfSliceReferrent).
        } | ) 



 '-- Side effects'

 globals modules selfSliceModel postFileIn
