 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         visibility = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'visibility' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'visibility' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules visibility.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'visibility' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'visibility' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'visibility' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'visibility' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'visibility' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         privateSlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'visibility' -> 'privateSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals visibility privateSlot.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'privateSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         asPrefix = '_ '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'privateSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         description = 'private'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'privateSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrivate = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'privateSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         isPublic = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         undeclaredSlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals visibility undeclaredSlot.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'privateSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'privateSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         sortingOrder = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'privateSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         symbol = '_'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         publicReadPrivateWriteSlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'visibility' -> 'publicReadPrivateWriteSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals visibility publicReadPrivateWriteSlot.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'publicReadPrivateWriteSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         asPrefix = '^_'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'publicReadPrivateWriteSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         description = 'publicReadPrivateWrite'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'publicReadPrivateWriteSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrivate = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'publicReadPrivateWriteSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         isPublic = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'publicReadPrivateWriteSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'publicReadPrivateWriteSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         sortingOrder = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'publicReadPrivateWriteSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         symbol = '^_'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         publicSlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'visibility' -> 'publicSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals visibility publicSlot.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'publicSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         asPrefix = '^ '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'publicSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         description = 'public'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'publicSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrivate = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'publicSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         isPublic = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'publicSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'publicSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         sortingOrder = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'publicSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         symbol = '^'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         asPrefix = '  '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> () From: ( | {
         'Category: for annotations\x7fModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = ( |
            | 
            description).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         description = 'undeclared'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrivate = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         isPublic = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> () From: ( | {
         'Category: for annotations\x7fModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         parse: aString IfFail: fb = ( |
            | 
            ( reflect: visibility) findFirst: [|:s|
              aString = s contents reflectee asString
            ] IfPresent: [|:s| s contents reflectee]
              IfAbsent: 
                [fb value: aString, ' does not match result of "asString" of any objects in "visibility"']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         sortingOrder = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'visibility' -> 'undeclaredSlot' -> () From: ( | {
         'ModuleInfo: Module: visibility InitialContents: FollowSlot\x7fVisibility: public'
        
         symbol = ' '.
        } | ) 



 '-- Side effects'

 globals modules visibility postFileIn
