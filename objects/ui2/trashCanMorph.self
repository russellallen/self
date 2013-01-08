 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot'
        
         trashCanMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'trashCanMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'trashCanMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules trashCanMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot'
        
         myComment <- 'The trash can morph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Trashcan\x7fModuleInfo: Module: trashCanMorph InitialContents: FollowSlot'
        
         trashCanExpandedMorph = bootstrap define: bootstrap stub -> 'globals' -> 'trashCanExpandedMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'trashCanExpandedMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals trashCanExpandedMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'trashCanExpandedMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         items.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'trashCanExpandedMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         maxNumberOfObjects <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Trashcan\x7fModuleInfo: Module: trashCanMorph InitialContents: FollowSlot'
        
         trashCanExpandedMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'trashCanExpandedMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits trashCanExpandedMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'trashCanExpandedMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'trashCanExpandedMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Trashcan\x7fModuleInfo: Module: trashCanMorph InitialContents: FollowSlot'
        
         trashCanIconMorph = bootstrap define: bootstrap stub -> 'globals' -> 'trashCanIconMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals imageMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'trashCanIconMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals trashCanIconMorph.

CopyDowns:
globals imageMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'trashCanIconMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot'
        
         client.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Trashcan\x7fModuleInfo: Module: trashCanMorph InitialContents: FollowSlot'
        
         trashCanIconMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'trashCanIconMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits trashCanIconMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'trashCanIconMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'trashCanIconMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Trashcan\x7fModuleInfo: Module: trashCanMorph InitialContents: FollowSlot'
        
         trashCanMorph = bootstrap define: bootstrap stub -> 'globals' -> 'trashCanMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals metaMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'trashCanMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals trashCanMorph.

CopyDowns:
globals metaMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Trashcan\x7fModuleInfo: Module: trashCanMorph InitialContents: FollowSlot'
        
         trashCanMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits trashCanMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'trashCanMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         trash.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanExpandedMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         addTrash: m = ( |
            | 
            "m isOutliner ifTrue: [ m collapse ]."
            "outliners do not yet understand 'collapse'"
            m beRigid.
            m position: 0@0.
            items morphs size >= maxNumberOfObjects ifTrue: [
              items morphs: items morphs copyWithoutLast.
            ].
            items addMorphFirst: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanExpandedMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            "Keep submorphs from seeing left/middleMouseDown events."
            (evt leftMouseDown || evt middleMouseDown) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanExpandedMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanExpandedMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanExpandedMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot'
        
         do: b = ( |
            | items morphs do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanExpandedMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         empty = ( |
            | items removeAllMorphs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanExpandedMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         initialize = ( |
            | 
            beShrinkWrap.
            items: columnMorph copy.
            addMorph: items).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanExpandedMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         isEmpty = ( |
            | items morphs isEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanExpandedMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: e = ( |
            | popUpMenu: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanExpandedMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'trashCanExpandedMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanExpandedMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanExpandedMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu addButtonTarget: self ScriptBlock: [target owner changeState] Label: 'Close'.
            owner isEmpty ifFalse: [
                menu addButtonTarget: self ScriptBlock: [target owner empty] Label: 'Empty'.
            ].
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            menu popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanIconMorph' -> () From: ( | {
         'Category: behavior\x7fModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         addMorph: m = ( |
            | client trashMorph: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanIconMorph' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyEmptyClient: c = ( |
            | 
            (copyImage: (ui2Image copyPixelLines: (
                        '                                     ' &
                        '                                     ' &
                        '                                     ' &
                        '                                     ' &
                        '                                     ' &
                        '       11111111111111111111111       ' &
                        '     110000000000000000000000011     ' &
                        '   1100001101010101010101010000011   ' &
                        ' 11000011111110111110101111101000011 ' &
                        '1000011111111010101010101010101000001' &
                        '1001111111111111010111110101110111001' &
                        '1000000000000000000000000000000000001' &
                        '1000000000000000000000000000000000001' &
                        '1000000000000000000000000000000000001' &
                        ' 11111111111111111111111111111111111 ' &
                        '   1010101010101010101010101010101   ' &
                        '   1101010101010101010101010101011   ' &
                        '    10000000000000000000000000011    ' &
                        '    10000000000000000000000000001    ' &
                        '    10000000000000000000000000001    ' &
                        '    10000000000000000000000000001    ' &
                        '    10000000000000000000000000001    ' &
                        '    10000000000000000000000000001    ' &
                        '     100000000000000000000000001     ' &
                        '     100000000000000000000000001     ' &
                        '     100000000000000000000000001     ' &
                        '     100000000000000000000000001     ' &
                        '     100000000000000000000000001     ' &
                        '     100000000000000000000000001     ' &
                        '      1000000000000000000000001      ' &
                        '      1000000000000000000000001      ' &
                        '      1000000000000000000000001      ' &
                        '      1000000000000000000000001      ' &
                        '      1000000000000000000000001      ' &
                        '      1000000000000000000000001      ' &
                        '       10000000000000000000001       ' &
                        '       10000000000000000000001       ' &
                        '       10000000000000000000001       ' &
                        '        100000000000000000001        ' &
                        '         1111111111111111111         ' ) asVector
                    Colors: (
                        trashCanColor &
                        (paint named: 'black') &
                        (paint named: 'black') ) asVector)) client: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanIconMorph' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFullClient: c = ( |
            | 
            (copyImage: (ui2Image copyPixelLines: (
                        '                     111             ' &
                        '              1111   10011           ' &
                        '        11111100001 10000011         ' &
                        '    111100000000001 1000000011       ' &
                        '    1000000000010001000000000011     ' &
                        '     100000000101010000000000001     ' &
                        '     100000001000101000000000001     ' &
                        '   1101000001000001010000000001011   ' &
                        ' 11000100001000000010100000000100011 ' &
                        '1000011100100000000010100000010100001' &
                        '1001111111111111111111111111111111001' &
                        '1000000000000000000000000000000000001' &
                        '1000000000000000000000000000000000001' &
                        '1000000000000000000000000000000000001' &
                        ' 11111111111111111111111111111111111 ' &
                        '   1010101010101010101010101010101   ' &
                        '   1101010101010101010101010101011   ' &
                        '    10000000000000000000000000011    ' &
                        '    10000000000000000000000000001    ' &
                        '    10000000000000000000000000001    ' &
                        '    10000000000000000000000000001    ' &
                        '    10000000000000000000000000001    ' &
                        '    10000000000000000000000000001    ' &
                        '     100000000000000000000000001     ' &
                        '     100000000000000000000000001     ' &
                        '     100000000000000000000000001     ' &
                        '     100000000000000000000000001     ' &
                        '     100000000000000000000000001     ' &
                        '     100000000000000000000000001     ' &
                        '      1000000000000000000000001      ' &
                        '      1000000000000000000000001      ' &
                        '      1000000000000000000000001      ' &
                        '      1000000000000000000000001      ' &
                        '      1000000000000000000000001      ' &
                        '      1000000000000000000000001      ' &
                        '       10000000000000000000001       ' &
                        '       10000000000000000000001       ' &
                        '       10000000000000000000001       ' &
                        '        100000000000000000001        ' &
                        '         1111111111111111111         ' ) asVector
                   Colors: (
                        trashCanColor &
                        (paint named: 'black') &
                        (paint named: 'black') ) asVector)) client: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanIconMorph' -> () From: ( | {
         'Category: behavior\x7fModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: e = ( |
            | popUpMenu: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanIconMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'trashCanIconMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanIconMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'imageMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanIconMorph' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu addButtonTarget: self     ScriptBlock: [target owner changeState] Label: 'Open'.
            owner isEmpty ifFalse: [
                menu addButtonTarget: self ScriptBlock: [target owner empty] Label: 'Empty'.
            ].
            menu addDivider.
            owner trash do: [ | :t |
                menu addButtonTarget: self
                         ScriptBlock: [target owner untrashMorph: buttonArgs]
                          ButtonArgs: ((list copyRemoveAll add: t) add: evt sourceHand)
                               Label: (t statePrintString) copyFrom: 6 "hack to get rid of 'type:'".
            ].
            menu popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanIconMorph' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: trashCanMorph InitialContents: FollowSlot'
        
         trashCanColor = ( |
            | 
            traits trashCanMorph trashCanColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanIconMorph' -> () From: ( | {
         'Category: behavior\x7fModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         changeState = ( |
            | 
            currentState = expandedCan 
              ifTrue: [setState: isEmpty ifTrue: emptyCan False: fullCan]
               False: [setState: expandedCan].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         empty = ( |
            | trash empty. setState: emptyCan).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         emptyCan = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         expandedCan = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         fullCan = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         initialize = ( |
            | 
            states: vector copySize: 3 FillingWith: vector.      

            setState: emptyCan.
            addMorph: trashCanIconMorph copyEmptyClient: self.
            firstMorph position: 0@0.

            setState: fullCan.
            addMorph: trashCanIconMorph copyFullClient: self.
            firstMorph position: 0@0.

            trash: trashCanExpandedMorph copy.
            setState: expandedCan.
            addMorph: trash.
            trash colorAll: trashCanColor.
            firstMorph position: 0@0.

            setState: emptyCan.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         isEmpty = ( |
            | trash isEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'trashCanMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'metaMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot'
        
         trashCanColor = ( |
            | 
            paint copyRed: 0.54741 Green: 0.653959 Blue: 0.605083).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         trashMorph: m = ( |
            | 
            trash addTrash: m.
            setState: fullCan).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot'
        
         untrashMorph: ba = ( |
             h.
             m.
            | 
            m: ba removeFirst.
            h: ba removeFirst.
            m isInWorld ifFalse: [
              h attach: m.
            ] True: [
              world moveToFront: m.
              m moveToPosition: h globalPosition.
            ].
            isEmpty ifTrue: [ setState: emptyCan ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: trashCanMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | true).
        } | ) 



 '-- Side effects'

 globals modules trashCanMorph postFileIn
