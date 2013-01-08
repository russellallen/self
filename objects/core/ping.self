 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot'
        
         ping = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ping' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ping' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ping.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: ping InitialContents: FollowSlot\x7fVisibility: public'
        
         ping = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ping' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ping.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot'
        
         interval <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot'
        
         mesg <- bootstrap stub -> 'globals' -> 'message' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: ping InitialContents: FollowSlot\x7fVisibility: public'
        
         ping = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ping' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ping.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ping' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot'
        
         pingProcess <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot'
        
         stopping <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot'
        
         copyMessage: m Interval: i Selector: sel = ( | {
                 'ModuleInfo: Module: ping InitialContents: FollowSlot'
                
                 p.
                } 
            | 
            p: (copy mesg: m) interval: i.
            p stopping: false.
            p pingProcess:
               process copySend: message copy receiver: p Selector: sel.
            p pingProcess resume.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot'
        
         copyMessage: m RepeatingInterval: i = ( |
            | 
            copyMessage: m Interval: i Selector: 'start').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot'
        
         copyMessage: m SingleInterval: i = ( |
            | 
            copyMessage: m Interval: i Selector: 'once').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot'
        
         decreaseInterval: d = ( | {
                 'ModuleInfo: Module: ping InitialContents: FollowSlot'
                
                 i.
                } 
            | 
            i: interval - d.
            i > 0 ifTrue: [ interval: i ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot'
        
         increaseInterval: d = ( |
            | interval: interval + d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot'
        
         once = ( |
            | 
            times delay: interval.
            stopping ifFalse: [ mesg send ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot'
        
         start = ( |
            | 
            [stopping] whileFalse: [ once ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ping' -> () From: ( | {
         'ModuleInfo: Module: ping InitialContents: FollowSlot'
        
         stop = ( |
            | stopping: true).
        } | ) 



 '-- Side effects'

 globals modules ping postFileIn
