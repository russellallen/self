 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: inspect InitialContents: FollowSlot\x7fVisibility: public'
        
         inspect: obj = ( |
            | inspectReflectee: reflect: obj. obj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: inspect InitialContents: FollowSlot\x7fVisibility: public'
        
         inspect: obj Slot: name = ( |
            | 
            (reflect: obj)
                findFirst: [ | :slot | name = slot key ]
                IfPresent: [ | :slot | inspectReflectee: slot value ]
                 IfAbsent: [ 'No such slot in this object.' printLine ].
            obj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: inspect InitialContents: FollowSlot\x7fVisibility: private'
        
         inspectReflectee: aMirror = ( |
             m.
            | 
            '( |' print.
            m: list copyRemoveAll.
            aMirror filterBy: [ | :slot |
                slot value isReflecteeAssignment not ] Into: m.
            m    doFirst: [ | :slot. s. |
                            "use basicPrintStringAssignable to avoid
                             printing out annotations"
                            s: slot basicPrintStringAssignable
                                 asTextLines indent: 4.
                            s firstLine: s firstLine copyFrom: 3.
                            s print.
                            '.' print. ]
              MiddleLast: [ | :slot |
                            '\n' print.
                            "use basicPrintStringAssignable to avoid
                             printing out annotations"
                            (slot basicPrintStringAssignable
                                asTextLines indent: 4) print.
                            '.' print. ]
                 IfEmpty: nil.
            "inspect should print out other info, like vector elements"
            ' |' print.
            aMirror isReflecteeMethod ifTrue: [
                (selfMethodText copyForMethod: aMirror) asCode print.
            ] False: [
                ' ' print.
            ].
            ')' printLine.
            aMirror moduleSummaryString printLine.
            aMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: inspect InitialContents: FollowSlot'
        
         inspect = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'inspect' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'inspect' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules inspect.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'inspect' -> () From: ( | {
         'ModuleInfo: Module: inspect InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'inspect' -> () From: ( | {
         'ModuleInfo: Module: inspect InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'inspect' -> () From: ( | {
         'ModuleInfo: Module: inspect InitialContents: FollowSlot'
        
         myComment <- 'parserCommentBug.
            \"Inspecting objects: print slots and their contents.\"'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'inspect' -> () From: ( | {
         'ModuleInfo: Module: inspect InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'inspect' -> () From: ( | {
         'ModuleInfo: Module: inspect InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules inspect postFileIn
