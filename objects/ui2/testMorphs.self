 '$Revision: 30.1 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Examples\x7fModuleInfo: Module: testMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         arcTestMorph = bootstrap define: bootstrap stub -> 'globals' -> 'arcTestMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'arcTestMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals arcTestMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arcTestMorph' -> () From: ( | {
         'ModuleInfo: Module: testMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'arcTestMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals arcTestMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arcTestMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: testMorphs InitialContents: FollowSlot'
        
         baseDrawOn: c = ( |
            | 
            resend.baseDrawOn: c.
            c line: bounds center To: bounds topRight Color: (paint named: 'black').
            c line: bounds center To: bounds topCenter Color: (paint named: 'black').
            c arcWithin: (bounds indent: width half) From: 45 Spanning: 45 Width: width Color: paint named: 'red'.
            c fillArcWithin: (bounds center: bounds center Size: bounds size half)  From: 45 Spanning: 45  Color: paint named: 'green'.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arcTestMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: testMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'arcTestMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arcTestMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: testMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arcTestMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: testMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            arcTestMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arcTestMorph' -> () From: ( | {
         'ModuleInfo: Module: testMorphs InitialContents: InitializeToExpression: (2)'
        
         width <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: testMorphs InitialContents: FollowSlot'
        
         testMorphs = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'testMorphs' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'testMorphs' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules testMorphs.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'testMorphs' -> () From: ( | {
         'ModuleInfo: Module: testMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'testMorphs' -> () From: ( | {
         'ModuleInfo: Module: testMorphs InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'testMorphs' -> () From: ( | {
         'ModuleInfo: Module: testMorphs InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'testMorphs' -> () From: ( | {
         'ModuleInfo: Module: testMorphs InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'testMorphs' -> () From: ( | {
         'ModuleInfo: Module: testMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.1 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'testMorphs' -> () From: ( | {
         'ModuleInfo: Module: testMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules testMorphs postFileIn
