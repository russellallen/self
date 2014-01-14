 '$Revision: 30.9 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sicTests InitialContents: FollowSlot'
        
         sicTests = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sicTests' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sicTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sicTests.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sicTests' -> () From: ( | {
         'ModuleInfo: Module: sicTests InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sicTests' -> () From: ( | {
         'ModuleInfo: Module: sicTests InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sicTests' -> () From: ( | {
         'ModuleInfo: Module: sicTests InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sicTests' -> () From: ( | {
         'ModuleInfo: Module: sicTests InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sicTests' -> () From: ( | {
         'ModuleInfo: Module: sicTests InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sicTests' -> () From: ( | {
         'ModuleInfo: Module: sicTests InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: SIC tests\x7fModuleInfo: Module: sicTests InitialContents: FollowSlot\x7fVisibility: public'
        
         sicAllocationTest = ( |
             bf.
             bi.
             fi.
            | 

            'raising inlining thresholds' printLine.

            bf: _MaxBlockFnInlineSize:  20.
            bi:   _MaxBlockInlineSize: 150.
            fi:      _MaxFnInlineSize:  16.


            sicAllocationTester copy run.

            'restoring inlining thresholds' printLine.

            _MaxBlockFnInlineSize: bf.
              _MaxBlockInlineSize: bi.
                 _MaxFnInlineSize: fi).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: SIC tests\x7fModuleInfo: Module: sicTests InitialContents: FollowSlot\x7fVisibility: public'
        
         sicAllocationTester = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'sicAllocationTester' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests sicAllocationTester.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'sicAllocationTester' -> () From: ( | {
         'Comment: Many of the error handling routines will crash the
scheduler, if they are called with a non-string/byte vector
message argument. To make the system more robust, this
method performs a sanity check on an error message argument.\x7fModuleInfo: Module: sicTests InitialContents: FollowSlot\x7fVisibility: private'
        
         ensureString: msg = ( |
             mir.
            | 
             msg  ifTrue: [
                ^ 19
            ] False: 17.

            flt ,  mir).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'sicAllocationTester' -> () From: ( | {
         'ModuleInfo: Module: sicTests InitialContents: InitializeToExpression: (0.0)'
        
         flt <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'sicAllocationTester' -> () From: ( | {
         'ModuleInfo: Module: sicTests InitialContents: InitializeToExpression: (\'foo\')'
        
         msg <- 'foo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'sicAllocationTester' -> () From: ( | {
         'ModuleInfo: Module: sicTests InitialContents: FollowSlot'
        
         once = ( |
             err.
            | 
            flt _FloatAdd: flt IfFail: [|:e|
            err: e
            ].
            (err _Eq: nil ) ifTrue: 17 False: [
               ensureString: msg.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'sicAllocationTester' -> () From: ( | {
         'ModuleInfo: Module: sicTests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'sicAllocationTester' -> () From: ( | {
         'ModuleInfo: Module: sicTests InitialContents: FollowSlot'
        
         run = ( |
            | 
            20000 do: [once]).
        } | ) 



 '-- Side effects'

 globals modules sicTests postFileIn
