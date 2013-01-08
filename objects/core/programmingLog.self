 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: programmingLog InitialContents: FollowSlot'
        
         programmingLog = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'programmingLog' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'programmingLog' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules programmingLog.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingLog' -> () From: ( | {
         'ModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingLog' -> () From: ( | {
         'ModuleInfo: Module: programmingLog InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingLog' -> () From: ( | {
         'ModuleInfo: Module: programmingLog InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingLog' -> () From: ( | {
         'ModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingLog' -> () From: ( | {
         'ModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot'
        
         programmingLog = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals programmingLog.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: public'
        
         addSlot: slot = ( |
            | 
            log: [ 
              '"Adding slot to ', slot holder safeName, '."', '\n',
              slot holder safeName, ' _AddSlots: (|\n',
              slot printString, '\n|)'
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: public'
        
         changeMethod: newSlot From: oldMeth = ( |
            | 
            log: [ 
              ('Changing method "', newSlot name, '" in "',
                newSlot holder safeName, '"') printString, '\n',
              newSlot holder safeName, ' _AddSlots: (| ', '\n',
              newSlot printString, '\n |)\n',
               '"Old contents: ', (oldMeth printStringSize: maxSmallInt), '"'
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: public'
        
         changeSlot: slot From: oldSlot = ( |
            | 
            log: [ 
              '"Changing slot in ', slot holder safeName, '."', '\n',
              slot holder safeName, ' _RemoveSlot: ', oldSlot name, '\n',
              '"Old contents: ', oldSlot printString, '"', '\n',
              slot holder safeName, ' _AddSlots: (|\n', 
              slot printString, '\n |)'
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: file operations\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            isOpen ifTrue: [
              writeEvent: timeStamp: 'Closing session at'.
              file close 
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: file operations\x7fModuleInfo: Module: programmingLog InitialContents: InitializeToExpression: (os_file copy)\x7fVisibility: private'
        
         file <- os_file copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: file operations\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: public'
        
         fileName <- 'programming.log'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: file operations\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: private'
        
         isOpen = ( |
            | file isOpen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: private'
        
         log: blk = ( |
            | 
            isOpen ifTrue: [
              writeEvent: timeStamp, '\n', blk value ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: file operations\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: public'
        
         open = ( |
            | 
            isOpen ifFalse: [
             file: os_file copy openForAppending: fileName.
             file lseekOffset: 0 Whence: file seek_end.
             writeEvent: timeStamp: 'Opening session at'.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'ModuleInfo: Module: programmingLog InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: file operations\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: public'
        
         remove = ( |
            | 
            isOpen ifTrue: [ close].
            os unlink: fileName.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: public'
        
         removeSlot: slot = ( |
            | 
            log: [
              '"Removing slot in ', slot holder safeName, '."', '\n',
              slot holder safeName, ' _RemoveSlot: ', slot name printString,
              '\n', '"Old contents: ', slot printString, '"'
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            isOpen ifTrue: 'open' False: 'closed').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: private'
        
         timeStamp = ( |
            | timeStamp: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: private'
        
         timeStamp: str = ( |
            | '"* ', str, ' ', time current printString, '"').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: file operations\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: private'
        
         writeEvent: str = ( |
            | file write: str, '\n\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'programmingLog' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: programmingLog InitialContents: FollowSlot\x7fVisibility: public'
        
         writeSnapshot: fileName = ( |
            | log: ['Writing snapshot to ', fileName]).
        } | ) 



 '-- Side effects'

 globals modules programmingLog postFileIn
