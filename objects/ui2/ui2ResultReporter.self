 '$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot'
        
         ui2ResultReporter = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui2ResultReporter' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui2ResultReporter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui2ResultReporter.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Debugging\x7fModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot'
        
         ui2ResultReporter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui2ResultReporter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui2ResultReporter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot\x7fVisibility: public'
        
         editor <- bootstrap stub -> 'globals' -> 'ui2_textField' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2ResultReporter' -> () From: ( | {
         'Comment: Put it up at this level
so fork can set it.
-- Ungar, 1/11/95\x7fModuleInfo: Module: ui2ResultReporter InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         event.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot\x7fVisibility: public'
        
         failedInProcess: p = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot\x7fVisibility: public'
        
         finished = ( |
            | 
            inProgressActivity abort.
            editor root colorAll: originalColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot\x7fVisibility: public'
        
         howToReport <- 'reportResult:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot\x7fVisibility: private'
        
         inProgressActivity.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot'
        
         originalColor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'string' -> 'resultReporter' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2ResultReporter' -> () From: ( | {
         'Category: error reporting\x7fModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot\x7fVisibility: public'
        
         reportError: errObj Title: t = ( |
            | 
            event sourceHand safelyDo: [ 
              editor selectionStart: errObj start
                                       End: errObj end.
              event sourceHand attach: 
                syntaxErrorMorph copyTitle: t, ':' Message: errObj printString.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: InitializeToExpression: (morph)\x7fVisibility: public'
        
         reportTo <- bootstrap stub -> 'globals' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         result.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot\x7fVisibility: public'
        
         started = ( |
            | 
            originalColor: editor root color.
            inProgressActivity:
             editor root
                    colorThrobTo: (paint named: 'white')
                    TimePerThrob: 1
                       NumThrobs: infinity.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2ResultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot\x7fVisibility: public'
        
         succeededReturning: result = ( |
            | 
            result: result.
            howToReport sendTo: reportTo With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2ResultReporter InitialContents: FollowSlot'
        
         originalColor.
        } | ) 



 '-- Side effects'

 globals modules ui2ResultReporter postFileIn
