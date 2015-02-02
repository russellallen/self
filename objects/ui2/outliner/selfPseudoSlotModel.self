 '$Revision: 30.6 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfPseudoSlotModel InitialContents: FollowSlot'
        
         selfPseudoSlotModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfPseudoSlotModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfPseudoSlotModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfPseudoSlotModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfPseudoSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfPseudoSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfPseudoSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfPseudoSlotModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfPseudoSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfPseudoSlotModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfPseudoSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfPseudoSlotModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfPseudoSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfPseudoSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfPseudoSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfPseudoSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fModuleInfo: Module: selfPseudoSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         selfPseudoSlotModel = bootstrap define: bootstrap stub -> 'globals' -> 'selfPseudoSlotModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfSlotModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfPseudoSlotModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfPseudoSlotModel.

CopyDowns:
globals selfSlotModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfPseudoSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfPseudoSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfPseudoSlotModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfPseudoSlotModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfPseudoSlotModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfPseudoSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfPseudoSlotModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: selfPseudoSlotModel InitialContents: FollowSlot'
        
         updateSlot = ( |
            | updateSlotColor).
        } | ) 



 '-- Side effects'

 globals modules selfPseudoSlotModel postFileIn
