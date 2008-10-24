 '$Revision: 30.32 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: powerOperations InitialContents: FollowSlot'
        
         powerOperations = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'powerOperations' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'powerOperations' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules powerOperations.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'powerOperations' -> () From: ( | {
         'ModuleInfo: Module: powerOperations InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'powerOperations' -> () From: ( | {
         'ModuleInfo: Module: powerOperations InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'powerOperations' -> () From: ( | {
         'ModuleInfo: Module: powerOperations InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'powerOperations' -> () From: ( | {
         'ModuleInfo: Module: powerOperations InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'powerOperations' -> () From: ( | {
         'ModuleInfo: Module: powerOperations InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.32 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'powerOperations' -> () From: ( | {
         'ModuleInfo: Module: powerOperations InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: User-defined (batch) operations\x7fModuleInfo: Module: powerOperations InitialContents: FollowSlot\x7fVisibility: public'
        
         userDefinedOperation = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'userDefinedOperation' -> () From: ( |
             {} = 'Comment: A global point of access for user-defined operations.
Could be extended to specify actions polymorphically.\x7fModuleInfo: Creator: globals userDefinedOperation.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userDefinedOperation' -> () From: ( | {
         'Comment: Applies the operation to a string.\x7fModuleInfo: Module: powerOperations InitialContents: FollowSlot\x7fVisibility: public'
        
         applyToString: str = ( |
             s.
            | 
            s: str.

            s: s replace:'nodeProto' With: 'node'.
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userDefinedOperation' -> () From: ( | {
         'Category: filters\x7fModuleInfo: Module: powerOperations InitialContents: FollowSlot\x7fVisibility: public'
        
         includeContentsOfSlot: slot = ( |
            | 
            slot isCopiedDown not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userDefinedOperation' -> () From: ( | {
         'ModuleInfo: Module: powerOperations InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userDefinedOperation' -> () From: ( | {
         'ModuleInfo: Module: powerOperations InitialContents: FollowSlot'
        
         removeNLs: str = ( |
            | 
            str copyMappedBy: [|:c|
            ('\r\n' includes: c) ifTrue: ' ' False: c]).
        } | ) 



 '-- Side effects'

 globals modules powerOperations postFileIn
