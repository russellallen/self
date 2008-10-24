 '$Revision: 30.6 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: smalltalk InitialContents: FollowSlot'
        
         smalltalk = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalk' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalk' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules smalltalk.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalk' -> () From: ( | {
         'ModuleInfo: Module: smalltalk InitialContents: FollowSlot\x7fVisibility: public'
        
         comment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalk' -> () From: ( | {
         'ModuleInfo: Module: smalltalk InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/smalltalk'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalk' -> () From: ( | {
         'ModuleInfo: Module: smalltalk InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalk' -> () From: ( | {
         'ModuleInfo: Module: smalltalk InitialContents: FollowSlot'
        
         postFileIn = ( |
             oldDirPath.
            | 
            resend.postFileIn.
            oldDirPath: os_file dirPath.
            'applications/mango/mango.self' _RunScript.
            smalltalkEmulator buildParser.
            "snip out mango"
            true ifTrue: [
              'removing mango' printLine.
              (reflect: traits) removeSlot: 'mango'.
              (reflect: mixins) removeSlot: 'mango'.
              (reflect: mango) removeSlot: 'counter'.
              (reflect: mango) removeSlot: 'parsers'.
              (reflect: mango) removeSlot: 'productions'.
              (reflect: mango) removeSlot: 'symbols'.
              (reflect: mango) removeSlot: 'treeBuilders'.
            ].
            smalltalkEmulator initializePrototypes.
            "Needed because building system classes requires modules"
            transporter moduleDictionary refill.
            smalltalkEmulator buildSystemClasses.
            worldMorph addBackgroundMenuContributor: smalltalkEmulator).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalk' -> () From: ( | {
         'ModuleInfo: Module: smalltalk InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalk' -> () From: ( | {
         'ModuleInfo: Module: smalltalk InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- 'smalltalkSupport
smalltalkEmulator
bootstrapClasses
smalltalkUI
generated_by_smalltalk
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'smalltalkSupport' From: 'applications/smalltalk'
 bootstrap read: 'smalltalkEmulator' From: 'applications/smalltalk'
 bootstrap read: 'bootstrapClasses' From: 'applications/smalltalk'
 bootstrap read: 'smalltalkUI' From: 'applications/smalltalk'
 bootstrap read: 'generated_by_smalltalk' From: 'applications/smalltalk'



 '-- Side effects'

 globals modules smalltalk postFileIn
