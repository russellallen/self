 '$Revision: 1.3 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: dictionaries\x7fModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         identityDictionary = bootstrap define: bootstrap stub -> 'globals' -> 'identityDictionary' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'safety' From:
             globals dictionary copyRemoveAll ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'identityDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals identityDictionary.

CopyDowns:
globals dictionary. copyRemoveAll 
SlotsToOmit: parent prototype safety.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'identityDictionary' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'identityDictionary' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals identityDictionary parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'identityDictionary' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'identityDictionary'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: comparison mixins\x7fModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         identityComparisonMixin = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'identityComparisonMixin' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSetOrDictionary identityComparisonMixin.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'identityDictionary' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         comparisonTraits = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'identityComparisonMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'identityDictionary' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'hashTableDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'identityDictionary' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         safety* = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'unsafeMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'identityDictionary' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | 
            identityDictionary).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: sets\x7fModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         identitySet = bootstrap define: bootstrap stub -> 'globals' -> 'identitySet' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'safety' From:
             globals set copyRemoveAll ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'identitySet' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals identitySet.

CopyDowns:
globals set. copyRemoveAll 
SlotsToOmit: parent prototype safety.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'identitySet' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'identitySet' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals identitySet parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'identitySet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'identitySet'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'identitySet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         comparisonTraits = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'identityComparisonMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'identitySet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'hashTableSet' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'identitySet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         safety* = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'unsafeMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'identitySet' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | 
            identitySet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot'
        
         idSetAndDictionary = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'idSetAndDictionary' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'idSetAndDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules idSetAndDictionary.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'idSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'idSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'idSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'idSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'idSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.3 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'idSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'identityComparisonMixin' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         hashElement: e = ( |
            | 
            e identityHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'identityComparisonMixin' -> () From: ( | {
         'ModuleInfo: Module: idSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         is: e1 EqualTo: e2 = ( |
            | 
            e1 == e2).
        } | ) 



 '-- Side effects'

 globals modules idSetAndDictionary postFileIn
