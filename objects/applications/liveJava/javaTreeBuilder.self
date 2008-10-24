 '$Revision: 1.2 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'Category: attic\x7fModuleInfo: Module: javaTreeBuilder InitialContents: FollowSlot\x7fVisibility: public'
        
         javaTreeBuilder = bootstrap define: bootstrap stub -> 'globals' -> 'liveJava' -> 'javaTreeBuilder' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser interpreter copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'liveJava' -> 'javaTreeBuilder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava javaTreeBuilder.

CopyDowns:
globals selfParser interpreter. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'javaTreeBuilder' -> () From: ( | {
         'ModuleInfo: Module: javaTreeBuilder InitialContents: InitializeToExpression: (\'\')'
        
         currentAnnotation <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'javaTreeBuilder' -> () From: ( | {
         'ModuleInfo: Module: javaTreeBuilder InitialContents: InitializeToExpression: (0)'
        
         indentLevel <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'javaTreeBuilder' -> () From: ( | {
         'ModuleInfo: Module: javaTreeBuilder InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'liveJava' -> 'javaTreeBuilder' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava javaTreeBuilder parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'javaTreeBuilder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaTreeBuilder InitialContents: FollowSlot'
        
         indentedDo: blk = ( |
            | 
            indentLevel: indentLevel succ.
            blk onReturn: [indentLevel: indentLevel pred]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'javaTreeBuilder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaTreeBuilder InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'interpreter' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: javaTreeBuilder InitialContents: FollowSlot'
        
         javaTreeBuilder = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'javaTreeBuilder' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'javaTreeBuilder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules javaTreeBuilder.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaTreeBuilder' -> () From: ( | {
         'ModuleInfo: Module: javaTreeBuilder InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/liveJava'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaTreeBuilder' -> () From: ( | {
         'ModuleInfo: Module: javaTreeBuilder InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaTreeBuilder' -> () From: ( | {
         'ModuleInfo: Module: javaTreeBuilder InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaTreeBuilder' -> () From: ( | {
         'ModuleInfo: Module: javaTreeBuilder InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaTreeBuilder' -> () From: ( | {
         'ModuleInfo: Module: javaTreeBuilder InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.2 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaTreeBuilder' -> () From: ( | {
         'ModuleInfo: Module: javaTreeBuilder InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules javaTreeBuilder postFileIn
