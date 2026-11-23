 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: FollowSlot'
        
         enumResult = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'enumResult' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'enumResult' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules enumResult.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'enumResult' -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'enumResult' -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'enumResult' -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: FollowSlot'
        
         myComment <- 'I package up the result of an enumeration for the ui--dmu 1/92'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'enumResult' -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'enumResult' -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: enumResult InitialContents: FollowSlot'
        
         enumResult = bootstrap define: ((bootstrap stub -> 'globals' -> 'ui1') \/-> 'enumResult') -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals vector copy ) From: bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'globals' -> 'ui1') \/-> 'enumResult') -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 enumResult.

CopyDowns:
globals vector. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'globals' -> 'ui1') \/-> 'enumResult') -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         desiredText <- ''.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'globals' -> 'ui1') \/-> 'enumResult') -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: FollowSlot\x7fVisibility: public'
        
         from <- bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'globals' -> 'ui1') \/-> 'enumResult') -> 'from' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 enumResult from.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: enumResult InitialContents: FollowSlot'
        
         enumResult = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'enumResult' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 enumResult.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'globals' -> 'ui1') \/-> 'enumResult') -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'enumResult' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'globals' -> 'ui1') \/-> 'enumResult') -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ((bootstrap stub -> 'globals' -> 'ui1') \/-> 'enumResult') -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'globals' -> 'ui1') \/-> 'enumResult') -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: FollowSlot\x7fVisibility: public'
        
         type <- 'enumerations'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'enumResult' -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultPrintSize = 50.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'enumResult' -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: FollowSlot\x7fVisibility: public'
        
         fromMirror: mir = ( | {
                 'ModuleInfo: Module: enumResult InitialContents: FollowSlot'
                
                 me.
                } 
            | "mir could be a method"
            from:  mir isReflecteeMethod     ifTrue: 'a method' False: [
                   mir isReflecteeAssignment ifTrue: '<-'       False: [
                                                     mir reflectee]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'enumResult' -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'vector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'enumResult' -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
             r.
            | 
            r: type, ' of '.
            r: r, 
               (desiredText isEmpty ifFalse: [ desiredText ]
                                       True: [ (reflect: from) safeName ] ).
            isEmpty ifTrue: [
                r: 'No ', r.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'enumResult' -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | fb value: 'unimplemented').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'enumResult' -> () From: ( | {
         'ModuleInfo: Module: enumResult InitialContents: FollowSlot\x7fVisibility: public'
        
         targetSlotName = 'from'.
        } | ) 



 '-- Side effects'

 globals modules enumResult postFileIn
