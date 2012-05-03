 '$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: examples\x7fModuleInfo: Module: programmingExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         anExampleObject = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'anExampleObject' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals anExampleObject.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'anExampleObject' -> () From: ( | {
         'Category: a category of slots\x7fModuleInfo: Module: programmingExamples InitialContents: FollowSlot'
        
         aCategorizedConstant = 3.14159.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'anExampleObject' -> () From: ( | {
         'Category: a category of slots\x7fModuleInfo: Module: programmingExamples InitialContents: FollowSlot'
        
         aCategorizedMethod = ( |
            | userQuery report: 'Hello, there').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'anExampleObject' -> () From: ( | {
         'Category: a category of slots\x7fModuleInfo: Module: programmingExamples InitialContents: FollowSlot'
        
         aCategorizedVariable <- 17.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'anExampleObject' -> () From: ( | {
         'ModuleInfo: Module: programmingExamples InitialContents: FollowSlot'
        
         anUncategorizedConstant = 3.14159.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'anExampleObject' -> () From: ( | {
         'ModuleInfo: Module: programmingExamples InitialContents: FollowSlot'
        
         anUncategorizedMethod = ( |
            | userQuery report: 'Hello, there').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'anExampleObject' -> () From: ( | {
         'ModuleInfo: Module: programmingExamples InitialContents: FollowSlot'
        
         anUncategorizedVariable <- 17.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'anExampleObject' -> () From: ( | {
         'ModuleInfo: Module: programmingExamples InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'anExampleObject' -> () From: ( | {
         'Category: a category of slots\x7fCategory: a subcategory\x7fModuleInfo: Module: programmingExamples InitialContents: FollowSlot'
        
         whoAmI = ( |
            | 
            os environmentAt: 'LOGNAME'
                        IfFail: 'The Phantom').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: programmingExamples InitialContents: FollowSlot'
        
         programmingExamples = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'programmingExamples' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'programmingExamples' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules programmingExamples.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingExamples' -> () From: ( | {
         'ModuleInfo: Module: programmingExamples InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingExamples' -> () From: ( | {
         'ModuleInfo: Module: programmingExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'misc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingExamples' -> () From: ( | {
         'ModuleInfo: Module: programmingExamples InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingExamples' -> () From: ( | {
         'ModuleInfo: Module: programmingExamples InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            transporter moduleDictionary resetFillingSemaphore.
            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: transporter moduleDictionary
                           Selector: 'resetFillingSemaphore'.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingExamples' -> () From: ( | {
         'ModuleInfo: Module: programmingExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingExamples' -> () From: ( | {
         'ModuleInfo: Module: programmingExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules programmingExamples postFileIn
