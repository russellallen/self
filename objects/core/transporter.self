 '30.8.0-prerelease2'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: transporter InitialContents: FollowSlot'
        
         transporter = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'transporter' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'transporter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules transporter.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: transporter InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: transporter InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: transporter InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: transporter InitialContents: InitializeToExpression: (\'30.8.0-prerelease2\')\x7fVisibility: public'
        
         revision <- '30.8.0-prerelease2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: transporter InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- '
	 objectScanner
	 transporterFiles
	 beamOut
	 beamIn
	 fastTransporter
	 chain
	 fileOut
	 module
	 annotator
	 incrementalSaving
	 '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: modules\x7fModuleInfo: Module: transporter InitialContents: FollowSlot\x7fVisibility: public'
        
         transporter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: transporter InitialContents: FollowSlot\x7fVisibility: public'
        
         help = 'transporter module cache at: \'point\'                get one module ASAP

transporter module cache refill                     compute all info,
so that
                                                        many modules can be
accessed quickly
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> () From: ( | {
         'Category: system\x7fCategory: modules\x7fModuleInfo: Module: transporter InitialContents: FollowSlot\x7fVisibility: public'
        
         transporter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'transporter' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins transporter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: modules\x7fModuleInfo: Module: transporter InitialContents: FollowSlot\x7fVisibility: public'
        
         transporter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits transporter.
'.
            | ) .
        } | ) 



 '-- Sub parts'

 bootstrap read: 'objectScanner' From: 'core'
 bootstrap read: 'transporterFiles' From: 'core'
 bootstrap read: 'beamOut' From: 'core'
 bootstrap read: 'beamIn' From: 'core'
 bootstrap read: 'fastTransporter' From: 'core'
 bootstrap read: 'chain' From: 'core'
 bootstrap read: 'fileOut' From: 'core'
 bootstrap read: 'module' From: 'core'
 bootstrap read: 'annotator' From: 'core'
 bootstrap read: 'incrementalSaving' From: 'core'



 '-- Side effects'

 globals modules transporter postFileIn
