 '$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: FollowSlot'
        
         unix_stdin = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'unix_stdin' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'unix_stdin' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules unix_stdin.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'unix_stdin' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'unix_stdin' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'unix_stdin' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'unix_stdin' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'unix_stdin' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'unix_stdin' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: stdio\x7fModuleInfo: Module: unix_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         stderr = bootstrap define: bootstrap stub -> 'traits' -> 'unixFile' -> 'stderr' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'name' From:
             globals unixGlobals os_file copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'stderr' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile stderr.

CopyDowns:
globals unixGlobals os_file. copy 
SlotsToOmit: name.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'stderr' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'stderr' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         name <- '<stderr>'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'stderr' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         reviveIfFail: errBlk = ( |
            | setFd: 2 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: stdio\x7fModuleInfo: Module: unix_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         stdin = bootstrap define: bootstrap stub -> 'traits' -> 'unixFile' -> 'stdin' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'name' From:
             globals unixGlobals os_file copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'stdin' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile stdin.

CopyDowns:
globals unixGlobals os_file. copy 
SlotsToOmit: name.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'stdin' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'stdin' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         name <- '<stdin>'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'stdin' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         reviveIfFail: errBlk = ( |
            | setFd: 0 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: stdio\x7fModuleInfo: Module: unix_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         stdout = bootstrap define: bootstrap stub -> 'traits' -> 'unixFile' -> 'stdout' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'name' From:
             globals unixGlobals os_file copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'stdout' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile stdout.

CopyDowns:
globals unixGlobals os_file. copy 
SlotsToOmit: name.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'stdout' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'stdout' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         name <- '<stdout>'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'stdout' -> () From: ( | {
         'ModuleInfo: Module: unix_stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         reviveIfFail: errBlk = ( |
            | setFd: 1 IfFail: errBlk).
        } | ) 



 '-- Side effects'

 globals modules unix_stdin postFileIn
