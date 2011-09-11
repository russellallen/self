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
        
         assert: x = ( |
            | x value ifFalse: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         forkRun = ( |
            | assert: [ testObject1 x = 1 ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         layerComplex = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'layerComplex' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests perspectiveTests layerComplex.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'layerComplex' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         forObject: o Selector: s = ( |
            | x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'layerComplex' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         x <- 'layerTwo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         layerTwoSimple = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'layerTwoSimple' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests perspectiveTests layerTwoSimple.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'layerTwoSimple' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         forObject: o Selector: s = ( |
            | 'layerTwo').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         run = ( |
            | 
            runTest1.
            runTest2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         runTest1 = ( |
            | 
            "Simple"
            assert: [ testObject1 x = 0 ].
            assert: [ testObject1 x = 1 ] @ 'layerTwo'.
            assert: [ testObject1 x = 0 ].

            "Fork"
            [ (message copy receiver: self Selector: 'forkRun') fork ] @ 'layerTwo'.

            "Simple Dynamic"
            assert: [ testObject1 x = 0 ].
            assert: [ testObject1 x = 1 ] @ layerTwoSimple.

            "More Complex Dynamic"
            layerComplex x: 'default'.
            assert: [ testObject1 x = 0 ] @ layerComplex.
            layerComplex x: 'layerTwo'.
            assert: [ testObject1 x = 1 ] @ layerComplex.
            assert: [ testObject1 x = 0 ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         runTest2 = ( |
            | 
            "This sort of nested layering isn't recommened,
            but should be possible as this shows."

            assert: [ testObject2 x = 4 ].
            assert: [ testObject2 x = 4 ] @ 'default'.
            assert: [ testObject2 x = 3 ] @ 'a'.
            assert: [ testObject2 x = 2 ] @ 'b'.
            assert: [ testObject2 x = 1 ] @ 'c').
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

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         testObject2 <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject2' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests perspectiveTests testObject2.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject2' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         a* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject2' -> 'a' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests perspectiveTests testObject2 a.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject2' -> 'a' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         b* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject2' -> 'a' -> 'b' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests perspectiveTests testObject2 a b.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject2' -> 'a' -> 'b' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         c* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject2' -> 'a' -> 'b' -> 'c' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests perspectiveTests testObject2 a b c.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject2' -> 'a' -> 'b' -> 'c' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         x = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject2' -> 'a' -> 'b' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         x = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject2' -> 'a' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         x = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject2' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         default* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject2' -> 'default' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests perspectiveTests testObject2 default.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject2' -> 'default' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         x = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'perspectiveTests' -> 'testObject2' -> () From: ( | {
         'ModuleInfo: Module: perspectivesTests InitialContents: FollowSlot'
        
         m* = bootstrap stub -> 'mixins' -> 'subjective' -> ().
        } | ) 



 '-- Side effects'

 globals modules perspectivesTests postFileIn
