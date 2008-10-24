 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sharedSetAndDictionary InitialContents: FollowSlot'
        
         sharedSetAndDictionary = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sharedSetAndDictionary' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sharedSetAndDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sharedSetAndDictionary.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sharedSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: sharedSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sharedSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: sharedSetAndDictionary InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sharedSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: sharedSetAndDictionary InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sharedSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: sharedSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sharedSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: sharedSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: dictionaries\x7fModuleInfo: Module: sharedSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         sharedDictionary = bootstrap define: bootstrap stub -> 'globals' -> 'sharedDictionary' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'safety' From:
             globals dictionary copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sharedDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sharedDictionary.

CopyDowns:
globals dictionary. copy 
SlotsToOmit: parent prototype safety.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sharedDictionary' -> () From: ( | {
         'ModuleInfo: Module: sharedSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | sharedDictionary).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sharedDictionary' -> () From: ( | {
         'ModuleInfo: Module: sharedSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         safety* = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'safeMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sharedDictionary' -> () From: ( | {
         'ModuleInfo: Module: sharedSetAndDictionary InitialContents: InitializeToExpression: (recursiveSemaphore copyCount: 1 Capacity: 1)\x7fVisibility: private'
        
         sema <- recursiveSemaphore copyCount: 1 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: sets\x7fModuleInfo: Module: sharedSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         sharedSet = bootstrap define: bootstrap stub -> 'globals' -> 'sharedSet' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'safety' From:
             globals set copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sharedSet' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sharedSet.

CopyDowns:
globals set. copy 
SlotsToOmit: parent prototype safety.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sharedSet' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: sharedSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'sharedSet'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sharedSet' -> () From: ( | {
         'ModuleInfo: Module: sharedSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | sharedSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sharedSet' -> () From: ( | {
         'ModuleInfo: Module: sharedSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         safety* = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'safeMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sharedSet' -> () From: ( | {
         'ModuleInfo: Module: sharedSetAndDictionary InitialContents: InitializeToExpression: (recursiveSemaphore copyCount: 1 Capacity: 1)\x7fVisibility: private'
        
         sema <- recursiveSemaphore copyCount: 1 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'safeMixin' -> () From: ( | {
         'ModuleInfo: Module: sharedSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         resetLock = ( |
            | 
            "sema added in semaphore.self"
            sema: recursiveSemaphore copyBinary).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'safeMixin' -> () From: ( | {
         'ModuleInfo: Module: sharedSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         sync: b = ( |
            | 
            " make it work, even if in scheduler "
            process this = process ifTrue: b False: [sema protect: b]).
        } | ) 



 '-- Side effects'

 globals modules sharedSetAndDictionary postFileIn
