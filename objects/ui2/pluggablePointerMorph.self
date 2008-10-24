 '$Revision: 30.6 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot'
        
         pluggablePointerMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pluggablePointerMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pluggablePointerMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pluggablePointerMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggablePointerMorph' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggablePointerMorph' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggablePointerMorph' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggablePointerMorph' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggablePointerMorph' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggablePointerMorph' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: pointers\x7fModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         pluggableLeafPointerButton = bootstrap define: bootstrap stub -> 'globals' -> 'pluggableLeafPointerButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals leafPointerButton copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableLeafPointerButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableLeafPointerButton.

CopyDowns:
globals leafPointerButton. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafPointerButton' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableLeafPointerButton' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableLeafPointerButton parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafPointerButton' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot'
        
         morphTypeName = 'pluggableLeafPointerButton'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafPointerButton' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'leafPointerButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafPointerButton' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot'
        
         slot = ( |
            | target tailMorph targetLeafOutliner model slot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafPointerButton' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            pluggableLeafPointerButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: pointers\x7fModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         pluggableOutlinerLeafPointerTailMorph = bootstrap define: bootstrap stub -> 'globals' -> 'pluggableOutlinerLeafPointerTailMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals outlinerLeafPointerTailMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableOutlinerLeafPointerTailMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableOutlinerLeafPointerTailMorph.

CopyDowns:
globals outlinerLeafPointerTailMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutlinerLeafPointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableOutlinerLeafPointerTailMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableOutlinerLeafPointerTailMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutlinerLeafPointerTailMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot'
        
         headMorphActionProto = bootstrap define: bootstrap stub -> 'globals' -> 'pluggableOutlinerLeafPointerTailMorph' -> 'parent' -> 'headMorphActionProto' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'droppedOn:Event:' From:
             traits outlinerLeafPointerTailMorph headMorphActionProto copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableOutlinerLeafPointerTailMorph' -> 'parent' -> 'headMorphActionProto' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableOutlinerLeafPointerTailMorph parent headMorphActionProto.

CopyDowns:
traits outlinerLeafPointerTailMorph headMorphActionProto. copy 
SlotsToOmit: droppedOn:Event:.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutlinerLeafPointerTailMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot'
        
         leafPointerButton = ( |
            | 
            pluggableLeafPointerButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutlinerLeafPointerTailMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'outlinerLeafPointerTailMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutlinerLeafPointerTailMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot'
        
         slot = ( |
            | 
            targetLeafOutliner model slot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutlinerLeafPointerTailMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: pluggablePointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            pluggableOutlinerLeafPointerTailMorph).
        } | ) 



 '-- Side effects'

 globals modules pluggablePointerMorph postFileIn
