 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: host and filesystem\x7fModuleInfo: Module: fileStream InitialContents: FollowSlot\x7fVisibility: public'
        
         fileStream = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fileStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fileStream.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fileStream' -> () From: ( | {
         'ModuleInfo: Module: fileStream InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         myContents <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fileStream' -> () From: ( | {
         'ModuleInfo: Module: fileStream InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fileStream' -> () From: ( | {
         'ModuleInfo: Module: fileStream InitialContents: FollowSlot\x7fVisibility: public'
        
         read = ( |
            | 
            myContents flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fileStream' -> () From: ( | {
         'ModuleInfo: Module: fileStream InitialContents: FollowSlot\x7fVisibility: public'
        
         write: bytes = ( |
            | write: bytes IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fileStream' -> () From: ( | {
         'ModuleInfo: Module: fileStream InitialContents: FollowSlot\x7fVisibility: public'
        
         write: bytes IfFail: fb = ( |
            | 
            myContents: myContents & bytes.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: fileStream InitialContents: FollowSlot'
        
         fileStream = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'fileStream' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'fileStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules fileStream.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fileStream' -> () From: ( | {
         'ModuleInfo: Module: fileStream InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fileStream' -> () From: ( | {
         'ModuleInfo: Module: fileStream InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fileStream' -> () From: ( | {
         'ModuleInfo: Module: fileStream InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fileStream' -> () From: ( | {
         'ModuleInfo: Module: fileStream InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fileStream' -> () From: ( | {
         'ModuleInfo: Module: fileStream InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules fileStream postFileIn
