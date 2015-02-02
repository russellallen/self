 '$Revision: 30.6 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot'
        
         pluggableModuleWidgets = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableModuleWidgets' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableModuleWidgets' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pluggableModuleWidgets.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableModuleWidgets' -> () From: ( | {
         'ModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableModuleWidgets' -> () From: ( | {
         'ModuleInfo: Module: pluggableModuleWidgets InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableModuleWidgets' -> () From: ( | {
         'ModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableModuleWidgets' -> () From: ( | {
         'ModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableModuleWidgets' -> () From: ( | {
         'ModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableModuleWidgets' -> () From: ( | {
         'ModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         pluggableObjectAnnotationMorph = bootstrap define: bootstrap stub -> 'globals' -> 'pluggableObjectAnnotationMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals objectAnnotationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableObjectAnnotationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableObjectAnnotationMorph.

CopyDowns:
globals objectAnnotationMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableObjectAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableObjectAnnotationMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableObjectAnnotationMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableObjectAnnotationMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            resend.initialize.
            borderWidth: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableObjectAnnotationMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mirror = ( |
            | myObjectOutliner model mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableObjectAnnotationMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableObjectAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot'
        
         prototype = ( |
            | pluggableObjectAnnotationMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         pluggableSlotModuleMorph = bootstrap define: bootstrap stub -> 'globals' -> 'pluggableSlotModuleMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals slotModuleMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableSlotModuleMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableSlotModuleMorph.

CopyDowns:
globals slotModuleMorph. copyRemoveAllMorphs 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableSlotModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableSlotModuleMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableSlotModuleMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableSlotModuleMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotModuleMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableSlotModuleMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableModuleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         slot = ( |
            | 
            myOutliner model slot).
        } | ) 



 '-- Side effects'

 globals modules pluggableModuleWidgets postFileIn
