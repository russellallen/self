 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         transcript = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'transcript' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'transcript' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules transcript.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transcript' -> () From: ( | {
         'ModuleInfo: Module: transcript InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transcript' -> () From: ( | {
         'ModuleInfo: Module: transcript InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transcript' -> () From: ( | {
         'ModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transcript' -> () From: ( | {
         'ModuleInfo: Module: transcript InitialContents: FollowSlot\x7fVisibility: public'
        
         postFileIn = ( |
            | 
            ui1 transcript size: ui1 transcript defaultSize.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transcript' -> () From: ( | {
         'ModuleInfo: Module: transcript InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transcript' -> () From: ( | {
         'ModuleInfo: Module: transcript InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: transcript InitialContents: FollowSlot\x7fVisibility: public'
        
         transcript = bootstrap define: bootstrap stub -> 'globals' -> 'ui1' -> 'transcript' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'name' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'size' From:
             bootstrap remove: 'stayup' From:
             globals ui1 textEditor copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'transcript' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 transcript.

CopyDowns:
globals ui1 textEditor. copy 
SlotsToOmit: name parent size stayup.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'transcript' -> () From: ( | {
         'ModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         initialText <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'transcript' -> () From: ( | {
         'ModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         name <- 'transcript'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: transcript InitialContents: FollowSlot\x7fVisibility: public'
        
         transcript = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'transcript' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 transcript.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'transcript' -> () From: ( | {
         'ModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'transcript' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'transcript' -> () From: ( | {
         'ModuleInfo: Module: transcript InitialContents: InitializeToExpression: (nil)'
        
         size <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'transcript' -> () From: ( | {
         'ModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         stayup <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'transcript' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         addApply = ( |
            | 
            applyButton: (ui1 button copySize: 50@16) name: 'Clear'.
            applyButton  command: (|
                p* = traits clonable.
                editor.
                doIt: context = (editor clear).
                doIt: context Shift: shift = (doIt: context).
            |) copy editor: self.
            addContext: applyButton At: (30@140) + boxFaceOffset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'transcript' -> () From: ( | {
         'ModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         addToWorld = ( |
            | 
            copyOn: ui1 ui world Size: size.
            world addBodyOnTop: self.
            location: 5@5.
            methodView setText: initialText.
            "theoretically can lose some text between these two sends"
            "if it's a problem, put in a semaphore"
            initialText: ''.
            constrainFullBodyToWorld.
            swoopDown.
            methodView gotoEnd.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'transcript' -> () From: ( | {
         'Category: text\x7fModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         clear = ( |
            | methodView clearText. queueShow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'transcript' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         copy = ( |
            | clean).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'transcript' -> () From: ( | {
         'ModuleInfo: Module: transcript InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultSize = (200)@(80).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'transcript' -> () From: ( | {
         'Category: showing\x7fModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         isOnScreen = ( |
            | ui1 ui world bodies includes: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'transcript' -> () From: ( | {
         'ModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'textEditor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'transcript' -> () From: ( | {
         'Category: text\x7fModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         print: s = ( |
            | 
            isOnScreen ifTrue: [ methodView addTextToEnd: s ]
                        False: [ initialText: initialText, s ].
            queueShow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'transcript' -> () From: ( | {
         'Category: text\x7fModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         printLine: s = ( |
            | print: s, '\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'transcript' -> () From: ( | {
         'Category: showing\x7fModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         queueShow = ( |
            | ui1 ui send: 'show' To: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'transcript' -> () From: ( | {
         'Category: showing\x7fModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         raiseRefresh = ( |
            | 
            world prepareToDrawOnAll.
            draw.
            display.
            raise.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'transcript' -> () From: ( | {
         'Category: showing\x7fModuleInfo: Module: transcript InitialContents: FollowSlot'
        
         show = ( |
            | 
            isOnScreen ifFalse: [ addToWorld ]
                          True: [ raiseRefresh ]).
        } | ) 



 '-- Side effects'

 globals modules transcript postFileIn
