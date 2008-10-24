 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sendButton InitialContents: FollowSlot'
        
         sendButton = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sendButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sendButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sendButton.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sendButton' -> () From: ( | {
         'ModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sendButton' -> () From: ( | {
         'ModuleInfo: Module: sendButton InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sendButton' -> () From: ( | {
         'ModuleInfo: Module: sendButton InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sendButton' -> () From: ( | {
         'ModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sendButton' -> () From: ( | {
         'ModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: public'
        
         sendButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sendButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sendButton.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sendButton' -> () From: ( | {
         'ModuleInfo: Module: sendButton InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         cluster <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sendButton' -> () From: ( | {
         'ModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: public'
        
         container <- bootstrap stub -> 'globals' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sendButton' -> () From: ( | {
         'ModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: public'
        
         location <- bootstrap stub -> 'globals' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sendButton' -> () From: ( | {
         'ModuleInfo: Module: sendButton InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: private'
        
         messages <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: public'
        
         sendButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sendButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sendButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sendButton' -> () From: ( | {
         'ModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'sendButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sendButton' -> () From: ( | {
         'ModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: public'
        
         size <- (1)@(1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: public'
        
         createOn: ob Messages: msgs = ( |
            | 
            container: ob.
            messages: msgs.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | 
            drawBodyEtchedRectangle: bound.
            drawBodyText: label asTextLines At: labelLocation Font: labelFont.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: private'
        
         label = 'send'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendButton' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: private'
        
         labelFont = ( |
            | boxSizing buttonFont).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendButton' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: private'
        
         labelLocation = ( |
            | 
            ((width - labelSize x) / 2) @ boxSizing sendButtonTopMargin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendButton' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: private'
        
         labelSize = ( |
            | labelFont sizeOfString: label).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendButton' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: private'
        
         menuItems = ( |
            | messages asVector sort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendButton' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: public'
        
         minSize = ( |
            | boxSizing minSendButtonSizeLabelSize: labelSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendButton' -> () From: ( | {
         'ModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'menuButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendButton' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: private'
        
         select: sel FixGraphics: fixGraphics = ( |
            | 
            send: sel.
            fixGraphics value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendButton' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: sendButton InitialContents: FollowSlot\x7fVisibility: private'
        
         send: sel = ( | {
                 'ModuleInfo: Module: sendButton InitialContents: FollowSlot'
                
                 msg.
                }  {
                 'ModuleInfo: Module: sendButton InitialContents: FollowSlot'
                
                 pt.
                } 
            | 
            msg: message copy receiver: body objMirror reflectee
                              Selector: sel.
            pt: (body absoluteLocation x + body size x) @ absoluteLocation y.
            ui forkAndSend: msg CauseOfBirth: sel PutResultAt: pt.
            self).
        } | ) 



 '-- Side effects'

 globals modules sendButton postFileIn
