 '$Revision:$'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         perspectivesTests = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'perspectivesTests' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'perspectivesTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules perspectivesTests.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'perspectivesTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'perspectivesTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'perspectivesTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'perspectivesTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'perspectivesTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'perspectivesTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: perspectives\x7fModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         perspectiveTests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests perspectiveTests.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         run = ( |
            | 
            testObject1 x = 0 ifFalse: raiseError.
            ([ testObject1 x = 1 ] @ 'layerTwo' ) ifFalse: raiseError.
            testObject1 x = 0 ifFalse: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         testObject1 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject1' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests perspectiveTests testObject1.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject1' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         default* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject1' -> 'default' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests perspectiveTests testObject1 default.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject1' -> 'default' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         x = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject1' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         layerTwo* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject1' -> 'layerTwo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests perspectiveTests testObject1 layerTwo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject1' -> 'layerTwo' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         x = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject1' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         m* = bootstrap stub -> 'mixins' -> 'subjective' -> ().
        } | ) 



 '-- Side effects'

 globals modules perspectivesTests postFileIn
