 '$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfParser InitialContents: FollowSlot'
        
         selfParser = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfParser.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParser' -> () From: ( | {
         'ModuleInfo: Module: selfParser InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParser' -> () From: ( | {
         'ModuleInfo: Module: selfParser InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/selfParser'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParser' -> () From: ( | {
         'ModuleInfo: Module: selfParser InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParser' -> () From: ( | {
         'ModuleInfo: Module: selfParser InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParser' -> () From: ( | {
         'ModuleInfo: Module: selfParser InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfParser' -> () From: ( | {
         'ModuleInfo: Module: selfParser InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- 'selfLexer
selfParserTester
selfMinis
selfParseNodes
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: selfParser InitialContents: FollowSlot\x7fVisibility: public'
        
         selfParser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'ModuleInfo: Module: selfParser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'ModuleInfo: Module: selfParser InitialContents: FollowSlot\x7fVisibility: public'
        
         tryIt = ( |
            | tester showFile: 'core/integer.self').
        } | ) 



 '-- Sub parts'

 bootstrap read: 'selfLexer' From: 'applications/selfParser'
 bootstrap read: 'selfParserTester' From: 'applications/selfParser'
 bootstrap read: 'selfMinis' From: 'applications/selfParser'
 bootstrap read: 'selfParseNodes' From: 'applications/selfParser'


 '-- Side effects'

 globals modules selfParser postFileIn
