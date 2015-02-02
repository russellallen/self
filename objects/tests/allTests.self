 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: allTests InitialContents: FollowSlot'
        
         allTests = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'allTests' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'allTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules allTests.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allTests' -> () From: ( | {
         'ModuleInfo: Module: allTests InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allTests' -> () From: ( | {
         'ModuleInfo: Module: allTests InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allTests' -> () From: ( | {
         'ModuleInfo: Module: allTests InitialContents: FollowSlot'
        
         myComment <- 'Read in Self tests and benchmarks.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allTests' -> () From: ( | {
         'ModuleInfo: Module: allTests InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allTests' -> () From: ( | {
         'ModuleInfo: Module: allTests InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- '
	     tests
	     cons
	     benchmarks
	     parser
	     parseNodes
	     '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: applications\x7fCategory: benchmarking\x7fModuleInfo: Module: allTests InitialContents: FollowSlot'
        
         bench = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'bench' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits bench.
'.
            | ) .
        } | ) 



 '-- Sub parts'

 bootstrap read: 'tests' From: 'tests'
 bootstrap read: 'cons' From: 'tests'
 bootstrap read: 'benchmarks' From: 'tests'
 bootstrap read: 'parser' From: 'tests'
 bootstrap read: 'parseNodes' From: 'tests'



 '-- Side effects'

 globals modules allTests postFileIn
