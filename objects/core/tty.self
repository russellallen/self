 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: tty InitialContents: FollowSlot'
        
         tty = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'tty' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'tty' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules tty.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tty' -> () From: ( | {
         'ModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tty' -> () From: ( | {
         'ModuleInfo: Module: tty InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tty' -> () From: ( | {
         'ModuleInfo: Module: tty InitialContents: FollowSlot'
        
         myComment <- 'tty describes a few terminal capabilities for the Self console.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tty' -> () From: ( | {
         'ModuleInfo: Module: tty InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
             tty initialize.
             snapshotAction addPostReadMessage:(
                 message copy receiver: tty Selector: 'initialize').
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tty' -> () From: ( | {
         'ModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tty' -> () From: ( | {
         'ModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: OS and filesystem interface\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         tty = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tty' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tty.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: OS and filesystem interface\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         tty = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'tty' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits tty.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tty' -> () From: ( | {
         'ModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'tty' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         backSpace = ( |
            | 8 asCharacter print).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         clear = ( |
            | termcap clearScreen print. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         clearToEOL = ( |
            | termcap clearToEndOfLine print. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         endEmphasize = ( | {
                 'ModuleInfo: Module: tty InitialContents: FollowSlot'
                
                 token = '}'.
                } 
            | 
            name = 'sun-cmd' ifTrue: [
               ^inTermcapMode ifTrue: [endStandout] False: [ token print]].
            hasStandout       ifTrue: [^endStandout].
            hasUnderscoring   ifTrue: [^endUnderscore].
            token print).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         endStandout = ( |
            | termcap endStandout   print. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         endTermcapMode = ( |
            | termcap endTermcapMode   print.
            inTermcapMode: false. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         endUnderscore = ( |
            | termcap endUnderscore print. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         goto: pt = ( |
            | 
            termcap goto isPresent ifTrue: [
                (termcap goto: termcap goto value Col: pt x Row: pt y) print.
            ] False: [ 
                error: 'no goto capability'.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         hasStandout = ( |
            | termcap startStandout isPresent
            && [ termcap endStandout   isPresent ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         hasTermcapMode = ( |
            | termcap startTermcapMode isPresent
            && [ termcap endTermcapMode   isPresent ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         hasUnderscoring = ( |
            | termcap startUnderscore isPresent
            && [ termcap endUnderscore   isPresent ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | termcap height isPresent ifTrue: termcap height False: 24).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: tty InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         inTermcapMode <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'ModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         initialize = ( |
            | 
            foreignCodeDB initialize.
            termcap getenv: (os environmentAt: 'TERM' IfFail: 'dumb')
                    IfFail: [].
            termcap initializeCapabilities.

            "If the tty type is 'sun-cmd', underlining and standout mode
             are visible in TermcapMode only. Entering TermcapMode has
             the unpleasant side effect that scroll bars disappear."

            name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | termcap name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'ModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         printMsg: msg Do: blk = ( | {
                 'ModuleInfo: Module: tty InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            msg print. 
            r: blk value.
            termcap supportsBackspace value ifTrue: [
               msg size do: [ backSpace ]. clearToEOL 
            ] False: [ ' ' print ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         startEmphasize = ( | {
                 'ModuleInfo: Module: tty InitialContents: FollowSlot'
                
                 token = '{'.
                } 
            | 
            name = 'sun-cmd' ifTrue: [
               ^inTermcapMode ifTrue: [startStandout] False: [ token print]].
            hasStandout       ifTrue: [^startStandout].
            hasUnderscoring   ifTrue: [^startUnderscore].
            token print).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         startStandout = ( |
            | termcap startStandout print. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         startTermcapMode = ( |
            | termcap startTermcapMode print. 
            inTermcapMode: true. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         startUnderscore = ( |
            | termcap startUnderscore print. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tty' -> () From: ( | {
         'Category: operations\x7fModuleInfo: Module: tty InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
            | termcap width  isPresent ifTrue: termcap width  False: 80).
        } | ) 



 '-- Side effects'

 globals modules tty postFileIn
