 '$Revision: 1.2 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> () From: ( | {
         'Category: interpreting\x7fModuleInfo: Module: javaASTInterpreter InitialContents: FollowSlot'
        
         interpreter = bootstrap define: bootstrap stub -> 'globals' -> 'javaParser' -> 'interpreter' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals parseKit interpreter copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'javaParser' -> 'interpreter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals javaParser interpreter.

CopyDowns:
globals parseKit interpreter. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'interpreter' -> () From: ( | {
         'ModuleInfo: Module: javaASTInterpreter InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'javaParser' -> 'interpreter' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals javaParser interpreter parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'interpreter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaASTInterpreter InitialContents: FollowSlot'
        
         expression: node = ( |
            | childMustImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'interpreter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaASTInterpreter InitialContents: FollowSlot'
        
         invocation: kw Arguments: argList = ( |
            | childMustIMplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'interpreter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaASTInterpreter InitialContents: FollowSlot'
        
         new: kw Type: t = ( |
            | childMustImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaParser' -> 'interpreter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: javaASTInterpreter InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'interpreter' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: javaASTInterpreter InitialContents: FollowSlot'
        
         javaASTInterpreter = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'javaASTInterpreter' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'javaASTInterpreter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules javaASTInterpreter.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaASTInterpreter' -> () From: ( | {
         'ModuleInfo: Module: javaASTInterpreter InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/liveJava'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaASTInterpreter' -> () From: ( | {
         'ModuleInfo: Module: javaASTInterpreter InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaASTInterpreter' -> () From: ( | {
         'ModuleInfo: Module: javaASTInterpreter InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaASTInterpreter' -> () From: ( | {
         'ModuleInfo: Module: javaASTInterpreter InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaASTInterpreter' -> () From: ( | {
         'ModuleInfo: Module: javaASTInterpreter InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.2 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaASTInterpreter' -> () From: ( | {
         'ModuleInfo: Module: javaASTInterpreter InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules javaASTInterpreter postFileIn
