 'Sun-$Revision: 30.15 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         graphicsDependentGlobals* = bootstrap stub -> 'globals' -> 'quartzGlobals' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: host and filesystem\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         host = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'host' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals host.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         configuration* <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'host' -> 'configuration' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals host configuration.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macs' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         unknown = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macs' -> 'unknown' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models macs unknown.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         model <- bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macs' -> 'unknown' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sunOS = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'sunOS' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms osFamilies sunOS.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         os <- bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'sunOS' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: platform\x7fCategory: host and filesystem\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         host = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'host' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits host.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'host' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot'
        
         hosts = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'hosts' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'hosts' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules hosts.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hosts' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hosts' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hosts' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot'
        
         myComment <- 'This module defines various attributes of machine-specific nature \"
            \" Redone by DMU 7/16/90 \"

            \" A platform is model of a computer.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hosts' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            host setOSDependentGlobals.
            "host setGraphicsDependentGlobals won't work at fileIn"
            snapshotAction addPostReadMessage: (
              message copy receiver: host Selector: 'setOSDependentGlobals').
            snapshotAction addPostReadMessage: (
              message copy receiver: host Selector: 'setGraphicsDependentGlobals').
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hosts' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.15 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hosts' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'quartzHosts
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: os\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         unixGlobals = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'unixGlobals' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals unixGlobals.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: os\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         osDependentGlobals* = bootstrap stub -> 'globals' -> 'unixGlobals' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: host and filesystem\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         platforms = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         cpuFamilies = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms cpuFamilies.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         mc68xxx = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'mc68xxx' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms cpuFamilies mc68xxx.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'mc68xxx' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'mc68xxx'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'platforms' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         cpuFamily = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'platforms' -> 'cpuFamily' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits platforms cpuFamily.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'mc68xxx' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'platforms' -> 'cpuFamily' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         mips = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'mips' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms cpuFamilies mips.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'mips' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'mips'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'mips' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'platforms' -> 'cpuFamily' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sparc = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'sparc' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms cpuFamilies sparc.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'sparc' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sparc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'sparc' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'platforms' -> 'cpuFamily' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         cpus = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms cpus.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> () From: ( | {
         'Category: mc68xxxs\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         mc68000 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'mc68000' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms cpus mc68000.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'mc68000' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'mc68xxx' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'mc68000' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'mc68000'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> () From: ( | {
         'Category: mc68xxxs\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         mc68010 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'mc68010' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms cpus mc68010.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'mc68010' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'mc68xxx' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'mc68010' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'mc68010'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> () From: ( | {
         'Category: mc68xxxs\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         mc68020 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'mc68020' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms cpus mc68020.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'mc68020' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'mc68xxx' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'mc68020' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'mc68020'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> () From: ( | {
         'Category: mc68xxxs\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         mc68030 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'mc68030' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms cpus mc68030.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'mc68030' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'mc68xxx' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'mc68030' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'mc68030'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> () From: ( | {
         'Category: mips\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         r2000 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'r2000' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms cpus r2000.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'r2000' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'mips' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'r2000' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'r2000'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> () From: ( | {
         'Category: mips\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         r3000 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'r3000' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms cpus r3000.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'r3000' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'mips' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'r3000' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'r3000'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> () From: ( | {
         'Category: sparcs\x7fComment: should be more of these for, i.e. different size reg files
	 I just dont know what they are\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sparc = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'sparc' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms cpus sparc.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'sparc' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'cpuFamilies' -> 'sparc' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         modelFamilies = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms modelFamilies.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         macintosh = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'macintosh' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms modelFamilies macintosh.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'macintosh' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'macintosh'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'platforms' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         model = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'platforms' -> 'model' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits platforms model.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'macintosh' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         traits* = bootstrap stub -> 'traits' -> 'platforms' -> 'model' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun3 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun3' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms modelFamilies sun3.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun3' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         cpu = bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'mc68020' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun3' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun3'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun3' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         traits* = bootstrap stub -> 'traits' -> 'platforms' -> 'model' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun4 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms modelFamilies sun4.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         cpu = bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'sparc' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun4'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         traits* = bootstrap stub -> 'traits' -> 'platforms' -> 'model' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         models = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> () From: ( | {
         'Category: macs\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         macII = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macII' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models macII.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macII' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         cpu = bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'mc68020' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macII' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'macintosh' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macII' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'macII'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> () From: ( | {
         'Category: macs\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         macIIfx = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macIIfx' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models macIIfx.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macIIfx' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         cpu = bootstrap stub -> 'globals' -> 'platforms' -> 'cpus' -> 'mc68030' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macIIfx' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'macintosh' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macIIfx' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'macIIfx'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         macs = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macs' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models macs.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macs' -> 'unknown' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macs' -> 'unknown' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'unknown'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macs' -> 'unknown' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         warnIfUnknown: code = ( |
            | 
            ('warning: unknown model code ', code printString,
             ' in hostID, assuming sun4_260')
                printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         suns = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sparcstations\x7fComment: SparcStation-10/30\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         ss10_30 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'ss10_30' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns ss10_30.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'ss10_30' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'ss10_30' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'ss10_30'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sparcstations\x7fComment: SparcStation-10/41\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         ss10_41 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'ss10_41' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns ss10_41.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'ss10_41' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'ss10_41' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'ss10_41'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sun3s\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun3_110 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_110' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun3_110.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_110' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun3' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_110' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun3_110'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sun3s\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun3_160 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_160' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun3_160.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_160' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun3' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_160' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun3_160'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sun3s\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun3_260 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_260' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun3_260.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_260' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun3' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_260' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun3_260'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sun3s\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun3_50 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_50' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun3_50.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_50' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun3' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_50' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun3_50'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sun3s\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun3_60 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_60' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun3_60.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_60' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun3' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_60' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun3_60'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sun3s\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun3_80 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_80' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun3_80.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_80' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun3' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_80' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun3_80'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sun3s\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun3_E = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_E' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun3_E.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_E' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun3' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun3_E' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun3_E'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sun4s\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun4_110 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4_110' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun4_110.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4_110' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4_110' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun4_110'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sun4s\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun4_260 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4_260' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun4_260.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4_260' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4_260' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun4_260'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sun4s\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun4_390 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4_390' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun4_390.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4_390' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4_390' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun4_390'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sun4s\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun4_460 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4_460' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun4_460.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4_460' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4_460' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun4_460'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sparcstations\x7fComment: IPC\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun4c_40 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4c_40' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun4c_40.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4c_40' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4c_40' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun4c_40'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sparcstations\x7fComment: IPX\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun4c_50 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4c_50' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun4c_50.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4c_50' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4c_50' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun4c_50'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sparcstations\x7fComment: SparcStation-1\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun4c_60 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4c_60' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun4c_60.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4c_60' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4c_60' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun4c_60'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sparcstations\x7fComment: SparcStation-1+\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun4c_65 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4c_65' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun4c_65.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4c_65' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4c_65' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun4c_65'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sparcstations\x7fComment: SparcStation-2\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         sun4c_75 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4c_75' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns sun4c_75.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4c_75' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'sun4c_75' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sun4c_75'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sparcstations\x7fComment: SparcStation-10/41\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         ultra1 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'ultra1' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms models suns ultra1.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'ultra1' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         family* = bootstrap stub -> 'globals' -> 'platforms' -> 'modelFamilies' -> 'sun4' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> 'ultra1' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'ultra1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'suns' -> () From: ( | {
         'Category: sun4s\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         unknown = bootstrap stub -> 'globals' -> 'platforms' -> 'models' -> 'macs' -> 'unknown' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         osArchitectures = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms osArchitectures.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         unix = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> 'unix' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms osArchitectures unix.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> 'unix' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'unix'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'platforms' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         operatingSystem = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'platforms' -> 'operatingSystem' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits platforms operatingSystem.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> 'unix' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'platforms' -> 'operatingSystem' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         osFamilies = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms osFamilies.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         aux = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'aux' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms osFamilies aux.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'aux' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'aux'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'aux' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> 'unix' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         linux = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'linux' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms osFamilies linux.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'linux' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         globalsForThisOS = ( |
            | 
            unixGlobals).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'linux' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         graphicsSystemGlobals = ( |
            | 
            x11Globals).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'linux' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         hostID = ( |
            | 
            os gethostid).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'linux' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: hosts InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'linux' -> () From: ( | {
         'Comment: Sun encodes the architecture in the high four bits, and
	   the model in the lower four bits, of the most significant
	   byte of the hostid.\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         model = ( |
            | 
            platforms models macs unknown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'linux' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'linux'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'linux' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> 'unix' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         macOSX = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOSX' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms osFamilies macOSX.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOSX' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         globalsForThisOS = ( |
            | 
            unixGlobals).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOSX' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         graphicsSystemGlobals = ( |
            | 
            [
              userQuery askMultipleChoice: 'Please pick a graphics layer for the default display named \'\'.\n',
                                           '(A non-empty display name (e.g. desktop w alsoOpenOnDisplay: \'localhost:0.0\')\n',
                                           'will still open an X-window.)'
                        Choices: ('Quartz' & 'X11') asVector
                        Results: (vector copyAddLast: quartzGlobals) copyAddLast: x11Globals
            ].
            quartzGlobals).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOSX' -> () From: ( | {
         'Comment: Place-holder.\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         model = ( |
            | 
            platforms models macs unknown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOSX' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'macOSX'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOSX' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> 'unix' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'sunOS' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         globalsForThisOS = ( |
            | 
            unixGlobals).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'sunOS' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         graphicsSystemGlobals = ( |
            | 
            x11Globals).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'sunOS' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         hostID = ( |
            | 
            os gethostid).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'sunOS' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: hosts InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            modelTable: vector copySize: 256
                         FillingWith: platforms models suns unknown.

            modelTable at: 16r11 Put: platforms models suns sun3_160.
            modelTable at: 16r12 Put: platforms models suns sun3_50.
            modelTable at: 16r13 Put: platforms models suns sun3_260.
            modelTable at: 16r14 Put: platforms models suns sun3_110.
            modelTable at: 16r17 Put: platforms models suns sun3_60.
            modelTable at: 16r18 Put: platforms models suns sun3_E.

            modelTable at: 16r21 Put: platforms models suns sun4_260.
            modelTable at: 16r22 Put: platforms models suns sun4_110.
            modelTable at: 16r23 Put: platforms models suns sun4_390.
            modelTable at: 16r24 Put: platforms models suns sun4_460.

            modelTable at: 16r42 Put: platforms models suns sun3_80.

            modelTable at: 16r51 Put: platforms models suns sun4c_60.
            modelTable at: 16r52 Put: platforms models suns sun4c_40.
            modelTable at: 16r53 Put: platforms models suns sun4c_65.
            modelTable at: 16r55 Put: platforms models suns sun4c_75.
            modelTable at: 16r57 Put: platforms models suns sun4c_50.
            "the SS-10 entry isn't correct - fix this; all SS-10s seem to
             have code 72.  e.g. oop (10/41) is 7260a4b4, and obj (10/30)
             is 7230529c"
            modelTable at: 16r72 Put: platforms models suns ss10_41.
            modelTable at: 16r80 Put: platforms models suns ultra1.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'sunOS' -> () From: ( | {
         'Comment: Sun encodes the architecture in the high four bits, and
	   the model in the lower four bits, of the most significant
	   byte of the hostid.\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         model = ( |
            | (modelTable at: (hostID at: 0) IfAbsent: [platforms models macs unknown]) warnIfUnknown: hostID at: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'sunOS' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: InitializeToExpression: (vector copyRemoveAll)\x7fVisibility: private'
        
         modelTable <- vector copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'sunOS' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'sunOS'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'sunOS' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> 'unix' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: host and filesystem\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         thisHost = ( |
            | host copyForThisHost).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         x11Globals = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: graphics (ui1)\x7fModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         xlib = bootstrap stub -> 'globals' -> 'xlib' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: public'
        
         configurationTable = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForThisHost = ( |
            | copy setupThisHost).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'Category: testing\x7fComment: Return true if running on a Solaris platform\x7fModuleInfo: Module: hosts InitialContents: FollowSlot'
        
         hasMacOS_8 = ( |
            | 
            'MacOS 8' isPrefixOf: operatingSystem).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'Category: testing\x7fComment: Return true if running on a Solaris platform\x7fModuleInfo: Module: hosts InitialContents: FollowSlot'
        
         hasMacOS_9 = ( |
            | 
            'MacOS 9' isPrefixOf: operatingSystem).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'Category: testing\x7fComment: Return true if running on a Solaris platform\x7fModuleInfo: Module: hosts InitialContents: FollowSlot'
        
         hasMacOS_carbon = ( |
            | 
            'MacOS .' = operatingSystem).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'Category: testing\x7fComment: Return true if running on a Solaris platform\x7fModuleInfo: Module: hosts InitialContents: FollowSlot'
        
         hasSolaris = ( | {
                 'ModuleInfo: Module: hosts InitialContents: FollowSlot'
                
                 name <- ''.
                }  {
                 'ModuleInfo: Module: hosts InitialContents: FollowSlot'
                
                 prefix = 'SunOS '.
                } 
            | 
            name: operatingSystem.
            (prefix isPrefixOf: name) ifFalse: [^false].
            (name copyFrom: prefix size) >= '5.0').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         hostName = ( |
            | 
            globals os nodename).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         manufacturerName = ( |
            | _Manufacturer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'Category: testing\x7fComment: Return true if running on a Solaris platform\x7fModuleInfo: Module: hosts InitialContents: FollowSlot'
        
         operatingSystem = ( |
            | 
            _OperatingSystem).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         osForThisHost = ( |
            | 
            osName sendTo: platforms osFamilies).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         osName = ( |
             firstToken.
            | 
            firstToken: operatingSystem copySize: 
              operatingSystem 
                findFirst: [|:c| c = ' ']
                IfPresent: [|:c. :i| i]
                 IfAbsent: [operatingSystem size].
            firstToken = 'Darwin' ifTrue: [^ 'macOSX'].
            firstToken = 'SunOS'  ifTrue: [^ 'sunOS' ].
            firstToken = 'MacOS'  ifTrue: [^ 'macOS' ].
            firstToken = 'Linux'  ifTrue: [^ 'linux' ].
            'sunOS' "just might work").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         osVariantName = ( |
            | 
            osName = 'sunOS'  ifTrue: [ ^ hasSolaris ifTrue: 'solaris' False: 'bsd' ].
            osName = 'macOS'  ifTrue: [ 
              ^ case if: [hasMacOS_8]      Then: 'macOS_8'
                     If: [hasMacOS_9]      Then: 'macOS_9'
                     If: [hasMacOS_carbon] Then: 'macOS_carbon'
                     Else: [warning: operatingSystem, ' is not one I know about; assuming MacOS 9'.
                            'macOS_9' ].
            ].
            osName = 'macOSX'  ifTrue: [ ^ 'macOS_X' ].
            osName = 'linux'   ifTrue: [ ^ 'linux' ].
            error: ['unknown osName: ', osName]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         setGraphicsDependentGlobals = ( |
             mir.
            | 
            mir: (reflect: globals).
            "Use frozenDefine to keep module cache clean."
            [graphicsDependentGlobals]. "browsing"
            mir frozenDefine: (mir copyAt: 'graphicsDependentGlobals' 
                                PutContents:  reflect: osForThisHost graphicsSystemGlobals. ).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         setOSDependentGlobals = ( |
             mir.
            | 
            mir: (reflect: globals).
            "Use frozenDefine to keep module cache clean."
            mir frozenDefine: (mir copyAt: 'osDependentGlobals' 
                                PutContents:  reflect: osForThisHost globalsForThisOS ).

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         setupThisHost = ( |
            | 
            os: osForThisHost.
            model: os model.
            configuration: configurationTable at: hostName IfAbsent: [()]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: platform\x7fCategory: host and filesystem\x7fModuleInfo: Module: hosts InitialContents: FollowSlot'
        
         platforms = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'platforms' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits platforms.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'platforms' -> 'cpuFamily' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'platforms' -> 'model' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'platforms' -> 'model' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         warnIfUnknown: code = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'platforms' -> 'operatingSystem' -> () From: ( | {
         'ModuleInfo: Module: hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 



 '-- Sub parts'

 bootstrap read: 'quartzHosts' From: 'core'



 '-- Side effects'

 globals modules hosts postFileIn
