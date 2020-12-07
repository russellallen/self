 ''
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
[ 
"prefileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         stationMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'stationMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'stationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules stationMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stationMorph' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stationMorph' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stationMorph' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stationMorph' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stationMorph' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: InitializeToExpression: (\'30.21.0\')\x7fVisibility: public'
        
         revision <- '30.21.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stationMorph' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Moving around\x7fComment: A station, part of a network for moving
round Kansas. See the comment on the morph.\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         stationMorph = bootstrap define: bootstrap stub -> 'globals' -> 'stationMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'borderWidth' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals columnMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'stationMorph' -> () From: ( |
             {} = 'Comment: STATION MORPH

I am a station on a transportation network for moving
around the Kansas desktop.

To create a new station, get:

    stationMorph copy name: \'My New Station\'

Then select \'Show Morph\' on the right click menu. Your
new station will now appear, with your chosen name and
a \'Go To...\' button. Click on the button to get a menu 
showing all the stations on the network, ordered from
nearest to furthest.

To change the name of a station, double click on the title,
make your edit then press the green button to change and the
red button to cancel.

stationMorphs only appear in the network if they are active and
on the desktop, ie are owned directly by a worldMorph.

\x7fModuleInfo: Creator: globals stationMorph.

CopyDowns:
globals columnMorph. copyRemoveAllMorphs 
SlotsToOmit: borderWidth parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stationMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         borderWidth <- 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stationMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         filled <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stationMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         frameStyle <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Moving around\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         stationMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits stationMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stationMorph' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'stationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stationMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | stationMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stationMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: stationMorph InitialContents: InitializeToExpression: (paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196)\x7fVisibility: private'
        
         rawColor <- paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         acceptNameChange = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'stationMorph' -> 'acceptNameChange' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits stationMorph acceptNameChange.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> 'acceptNameChange' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
             n.
             o.
            | 
            n: target label contentsString.
            o: target label cachedString.

            (n = o) ifTrue: [target label editMode: false. ^ self].

            (target stationExists: n)
              ifTrue: [userQueryMorph copy 
                        show: '"', n, '" is already a station'
                        Event: evt.
                       ^ self].

            target label editMode: false.
            target name: n.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> 'acceptNameChange' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'Category: network\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         activeStations = ( |
             a.
            | 
            a: set copyRemoveAll.
            world morphsDo: [|:m| 
              stationMorph = m prototype ifTrue: [a add: m]].
            a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         cancelNameChange = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'stationMorph' -> 'cancelNameChange' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits stationMorph cancelNameChange.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> 'cancelNameChange' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target label editMode: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> 'cancelNameChange' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         copy = ( |
            | resend.copy name: 'Unnamed Station').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         goHome: evt = ( |
            | 
            evt sourceHand world moveHand: evt sourceHand InWorldTo: 0 @ 0. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         goToLabel: aLabel ForEvent: evt = ( |
             np.
             off.
             s.
             t.
             wc.
            | 
            s: stationNamed: aLabel IfAbsent: [^ self].
            wc:  world winCanvasForHand: evt sourceHand IfAbsent: [^ self].
            off: position negate - wc offset.
            np: s position negate - off.
            evt sourceHand world moveHand: evt sourceHand InWorldTo: np. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'Category: initialize\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         initializeLabel = ( |
             text.
            | 

            text: smallEditorMorph 
                   copyString: 'Unnamed Station'
                       Target: self
                       Accept: acceptNameChange
                       Cancel: cancelNameChange
                       Style: nameStyle
                       LabelColor: paint named: 'white'.
            text).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'Category: initialize\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         initializePrototype = ( |
             button.
             inner.
             row.
             text.
            | 
            removeAllMorphs.
            frameStyle: bezelStyle.
            color: paint named: 'outlinerGray'.

            inner: frameMorph copy.
            inner frameStyle: insetBezelStyle.
            inner color: paint named: 'outlinerGray'.
            addMorph: inner.

            row: rowMorph copy.
            row color: paint copyRed: 0.0 Green: 0.3717693 Blue: 0.602307.
            inner addMorph: row.

            row addMorphLast: spacerMorph copyH: 5.
            row addMorphLast: initializeLabel.
            row addMorphLast: spacerMorph copyH: 15.

            button: ui2Button copy.
            button label: 'Go to...'.
            button target: self.
            button scriptBlock: [target popUpMenu: event].
            row addMorphLast: button.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         label = ( |
            | allMorphsDo: [|:m| m prototype = smallEditorMorph ifTrue: [^ m]]. error: 'stationMorph broken!').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         name = ( |
            | 
            label cachedString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         name: str = ( |
            | 
            label string: str. 
            label updateLabels.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         nameStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'stationMorph' -> 'nameStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits stationMorph nameStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> 'nameStyle' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         acceptButtonStyle = ( |
            | 
            self copy color: paint named: 'green').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> 'nameStyle' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         cancelButtonStyle = ( |
            | 
            self copy color: paint named: 'red').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> 'nameStyle' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: InitializeToExpression: (paint named: \'darkGray\')'
        
         color <- paint named: 'darkGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> 'nameStyle' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         fontColor = paint named: 'white'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> 'nameStyle' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         fontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'helvetica' Size: 18 Style: '') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: traits stationMorph nameStyle fontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> 'nameStyle' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         nearerCompare = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'stationMorph' -> 'nearerCompare' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits stationMorph nearerCompare.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> 'nearerCompare' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: InitializeToExpression: (nil)'
        
         baseStation.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> 'nearerCompare' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         copyOn: bs = ( |
            | copy baseStation: bs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> 'nearerCompare' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         element: e1 Precedes: e2 = ( |
            | 
            (baseStation position distanceTo: e1 position)
             <
            (baseStation position distanceTo: e2 position)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> 'nearerCompare' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'ModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         popUpMenu: evt = ( |
             m.
            | 
            m: ui2Menu copy color: (paint named: 'lightGray').
            m addButtonTarget: self ScriptBlock: [target goHome: event] Label: 'Home'.
            m addDivider.
            activeStations asSequence copy
              sortedBy: (nearerCompare copyOn: self)
              Do: [|:a| m addButtonTarget: self Script: 'target goToLabel: \'', a name, '\' ForEvent: event' Label: a name].
            m popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'Category: network\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         stationExists: l = ( |
            | 
            (activeStations copyMappedBy: [|:m | m name])
                includes: l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'Category: network\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         stationNamed: n IfAbsent: blk = ( |
            | 
            activeStations findFirst: [|:e| e name = n]
                       IfPresent: [|:e| e]
                       IfAbsent: [|:e| blk value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'stationMorph' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: stationMorph InitialContents: FollowSlot'
        
         updateLabelForName = ( |
            | 
            label label: name. self).
        } | ) 



 '-- Side effects'

 globals modules stationMorph postFileIn
