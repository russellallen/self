 '$Revision:$'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: testSuite InitialContents: FollowSlot'
        
         testSuite = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'testSuite' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'testSuite' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules testSuite.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'testSuite' -> () From: ( | {
         'ModuleInfo: Module: testSuite InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'testSuite' -> () From: ( | {
         'ModuleInfo: Module: testSuite InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'testSuite' -> () From: ( | {
         'ModuleInfo: Module: testSuite InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'testSuite' -> () From: ( | {
         'ModuleInfo: Module: testSuite InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'testSuite' -> () From: ( | {
         'ModuleInfo: Module: testSuite InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'testSuite' -> () From: ( | {
         'ModuleInfo: Module: testSuite InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: test suites\x7fModuleInfo: Module: testSuite InitialContents: FollowSlot\x7fVisibility: private'
        
         suite = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'suite' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests suite.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'suite' -> () From: ( | {
         'Category: assertions\x7fModuleInfo: Module: testSuite InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: blk = ( |
            | 
            blk value ifFalse: [fail].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'suite' -> () From: ( | {
         'Category: assertions\x7fModuleInfo: Module: testSuite InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: a Equals: b = ( |
            | 
            "This method is just useful because you
             can click on a and b right in the debugger
             to see what the two values are."
            assert: [a = b]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'suite' -> () From: ( | {
         'Category: assertions\x7fModuleInfo: Module: testSuite InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: a Is: b = ( |
            | 
            "This method is just useful because you
             can click on a and b right in the debugger
             to see what the two values are."
            assert: [a _Eq: b]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'suite' -> () From: ( | {
         'Category: assertions\x7fModuleInfo: Module: testSuite InitialContents: FollowSlot\x7fVisibility: private'
        
         assertFail: blk = ( |
            | 
            blk value: [^ self].
            fail).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'suite' -> () From: ( | {
         'Category: assertions\x7fModuleInfo: Module: testSuite InitialContents: FollowSlot\x7fVisibility: private'
        
         fail = ( |
            | 
            error: 'assertion failure').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'suite' -> () From: ( | {
         'ModuleInfo: Module: testSuite InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'suite' -> () From: ( | {
         'ModuleInfo: Module: testSuite InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | childMustImplement).
        } | ) 



 '-- Side effects'

 globals modules testSuite postFileIn
