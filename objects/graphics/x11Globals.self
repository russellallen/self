 '0.1.0'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
[ 
"prefileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: x11Globals InitialContents: FollowSlot'
        
         x11Globals = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'x11Globals' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'x11Globals' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules x11Globals.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'x11Globals' -> () From: ( | {
         'ModuleInfo: Module: x11Globals InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'x11Globals' -> () From: ( | {
         'ModuleInfo: Module: x11Globals InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'x11Globals' -> () From: ( | {
         'ModuleInfo: Module: x11Globals InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'x11Globals' -> () From: ( | {
         'ModuleInfo: Module: x11Globals InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'x11Globals' -> () From: ( | {
         'ModuleInfo: Module: x11Globals InitialContents: InitializeToExpression: (\'0.1.0\')\x7fVisibility: public'
        
         revision <- '0.1.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'x11Globals' -> () From: ( | {
         'ModuleInfo: Module: x11Globals InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: graphical interface\x7fModuleInfo: Module: x11Globals InitialContents: FollowSlot\x7fVisibility: public'
        
         x11Globals = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals.
'.
            | ) .
        } | ) 



 '-- Side effects'

 globals modules x11Globals postFileIn
