 '$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: FollowSlot'
        
         macOS_stdin = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'macOS_stdin' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'macOS_stdin' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules macOS_stdin.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macOS_stdin' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macOS_stdin' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macOS_stdin' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macOS_stdin' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macOS_stdin' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macOS_stdin' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: stdio\x7fModuleInfo: Module: macOS_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         stderr = bootstrap define: bootstrap stub -> 'traits' -> 'macOS_File' -> 'stderr' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'name' From:
             globals macOSGlobals os_file deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macOS_File' -> 'stderr' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macOS_File stderr.

CopyDowns:
globals macOSGlobals os_file. deadCopy 
SlotsToOmit: name.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'stderr' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'stderr' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         name <- '<stderr>'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'stderr' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         reviveIfFail: errBlk = ( |
            | setFd: 2 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: stdio\x7fModuleInfo: Module: macOS_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         stdin = bootstrap define: bootstrap stub -> 'traits' -> 'macOS_File' -> 'stdin' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'name' From:
             globals macOSGlobals os_file deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macOS_File' -> 'stdin' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macOS_File stdin.

CopyDowns:
globals macOSGlobals os_file. deadCopy 
SlotsToOmit: name.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'stdin' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'stdin' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         name <- '<stdin>'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'stdin' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         reviveIfFail: errBlk = ( |
            | setFd: 0 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: stdio\x7fModuleInfo: Module: macOS_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         stdout = bootstrap define: bootstrap stub -> 'traits' -> 'macOS_File' -> 'stdout' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'name' From:
             globals macOSGlobals os_file deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macOS_File' -> 'stdout' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macOS_File stdout.

CopyDowns:
globals macOSGlobals os_file. deadCopy 
SlotsToOmit: name.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'stdout' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'stdout' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         name <- '<stdout>'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'stdout' -> () From: ( | {
         'ModuleInfo: Module: macOS_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         reviveIfFail: errBlk = ( |
            | setFd: 1 IfFail: errBlk).
        } | ) 



 '-- Side effects'

 globals modules macOS_stdin postFileIn
