 '$Revision: 30.3 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot'
        
         metaCollections = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'metaCollections' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'metaCollections' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules metaCollections.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'metaCollections' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'metaCollections' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'metaCollections' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'metaCollections' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'metaCollections' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.3 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'metaCollections' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: reflection\x7fModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: public'
        
         reflectiveIdentityDictionary = bootstrap define: bootstrap stub -> 'globals' -> 'reflectiveIdentityDictionary' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'safety' From:
             globals dictionary copyRemoveAll ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'reflectiveIdentityDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals reflectiveIdentityDictionary.

CopyDowns:
globals dictionary. copyRemoveAll 
SlotsToOmit: parent prototype safety.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectiveIdentityDictionary' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'reflectiveIdentityDictionary' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals reflectiveIdentityDictionary parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectiveIdentityDictionary' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'reflectiveIdentityDictionary'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: comparison mixins\x7fModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: private'
        
         reflectiveIdentityComparisonMixin = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'reflectiveIdentityComparisonMixin' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSetOrDictionary reflectiveIdentityComparisonMixin.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectiveIdentityDictionary' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: private'
        
         comparisonTraits = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'reflectiveIdentityComparisonMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectiveIdentityDictionary' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'hashTableDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectiveIdentityDictionary' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: private'
        
         safety* = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'unsafeMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectiveIdentityDictionary' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | 
            reflectiveIdentityDictionary).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: reflection\x7fModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: public'
        
         reflectiveIdentitySet = bootstrap define: bootstrap stub -> 'globals' -> 'reflectiveIdentitySet' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'safety' From:
             globals set copyRemoveAll ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'reflectiveIdentitySet' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals reflectiveIdentitySet.

CopyDowns:
globals set. copyRemoveAll 
SlotsToOmit: parent prototype safety.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectiveIdentitySet' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'reflectiveIdentitySet' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals reflectiveIdentitySet parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectiveIdentitySet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'reflectiveIdentitySet'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectiveIdentitySet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: private'
        
         comparisonTraits = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'reflectiveIdentityComparisonMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectiveIdentitySet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'hashTableSet' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectiveIdentitySet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: private'
        
         safety* = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'unsafeMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reflectiveIdentitySet' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | 
            reflectiveIdentitySet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'reflectiveIdentityComparisonMixin' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: public'
        
         hashElement: e = ( |
            | 
            e _IdentityHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'reflectiveIdentityComparisonMixin' -> () From: ( | {
         'ModuleInfo: Module: metaCollections InitialContents: FollowSlot\x7fVisibility: public'
        
         is: e1 EqualTo: e2 = ( |
            | 
            e1 _Eq: e2).
        } | ) 



 '-- Side effects'

 globals modules metaCollections postFileIn
