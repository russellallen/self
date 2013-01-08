 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ttySupport InitialContents: FollowSlot'
        
         ttySupport = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ttySupport' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ttySupport' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ttySupport.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ttySupport' -> () From: ( | {
         'ModuleInfo: Module: ttySupport InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ttySupport' -> () From: ( | {
         'ModuleInfo: Module: ttySupport InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ttySupport' -> () From: ( | {
         'ModuleInfo: Module: ttySupport InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ttySupport' -> () From: ( | {
         'ModuleInfo: Module: ttySupport InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ttySupport' -> () From: ( | {
         'ModuleInfo: Module: ttySupport InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- '
	     termcap
	     tty
	     '.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'termcap' From: 'core'
 bootstrap read: 'tty' From: 'core'



 '-- Side effects'

 globals modules ttySupport postFileIn
