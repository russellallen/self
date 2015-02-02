 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: stat InitialContents: FollowSlot'
        
         stat = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'stat' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'stat' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules stat.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stat' -> () From: ( | {
         'ModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stat' -> () From: ( | {
         'ModuleInfo: Module: stat InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stat' -> () From: ( | {
         'ModuleInfo: Module: stat InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stat' -> () From: ( | {
         'ModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stat' -> () From: ( | {
         'ModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- '
	 stat_wrappers
	 '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> () From: ( | {
         'Category: OS and filesystem interface\x7fModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: public'
        
         statStructure = bootstrap define: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'statStructure' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'statStructure' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals unixGlobals statStructure.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: platform\x7fCategory: host and filesystem\x7fModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: public'
        
         unixStatStructure = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixStatStructure' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixStatStructure.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'statStructure' -> () From: ( | {
         'ModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'unixStatStructure' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: platform\x7fCategory: host and filesystem\x7fModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractStatStructure = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractStatStructure' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractStatStructure.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractStatStructure' -> () From: ( | {
         'Category: equality\x7fComment: \'=\' tests whether two statStructure\'s have the same inode and
         device number. This is equivalent to being statStructure\'s for
         the same physical file.\x7fModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | (st_ino = x st_ino) && [st_dev = x st_dev]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractStatStructure' -> () From: ( | {
         'ModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: public'
        
         atime = ( | {
                 'ModuleInfo: Module: stat InitialContents: FollowSlot'
                
                 v.
                } 
            | v: st_atime. time copyDay: (v at: 0) Msec: (v at: 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractStatStructure' -> () From: ( | {
         'ModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: public'
        
         ctime = ( | {
                 'ModuleInfo: Module: stat InitialContents: FollowSlot'
                
                 v.
                } 
            | v: st_ctime. time copyDay: (v at: 0) Msec: (v at: 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractStatStructure' -> () From: ( | {
         'Category: equality\x7fModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | st_ino ^^ st_dev).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractStatStructure' -> () From: ( | {
         'Category: deleting\x7fModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: public'
        
         kill = ( |
            | 
            deleteIfFail: []. resend.kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractStatStructure' -> () From: ( | {
         'ModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: public'
        
         mtime = ( | {
                 'ModuleInfo: Module: stat InitialContents: FollowSlot'
                
                 v.
                } 
            | v: st_mtime. time copyDay: (v at: 0) Msec: (v at: 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractStatStructure' -> () From: ( | {
         'ModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractStatStructure' -> () From: ( | {
         'ModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: private'
        
         timeAsMs: v = ( |
            | (time msecPerDay * (v at: 0)) + (v at: 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractStatStructure' -> () From: ( | {
         'ModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'statStructure'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixStatStructure' -> () From: ( | {
         'ModuleInfo: Module: stat InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractStatStructure' -> ().
        } | ) 



 '-- Sub parts'

 bootstrap read: 'stat_wrappers' From: 'glue'



 '-- Side effects'

 globals modules stat postFileIn
