 '30.21.1'
 '
Copyright 1992-2026 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         expanderMorph = bootstrap define: bootstrap stub -> 'globals' -> 'expanderMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals polygonMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'expanderMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals expanderMorph.

CopyDowns:
globals polygonMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         action.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: expanderMorph InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         isExpanded <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'expanderMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: expanderMorph InitialContents: InitializeToExpression: (paint named: \'black\')'
        
         savedColor <- paint named: 'black'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: expanderMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: expanderMorph InitialContents: FollowSlot'
        
         expanderMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'expanderMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'expanderMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules expanderMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: expanderMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: expanderMorph InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: expanderMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            expanderMorph initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: expanderMorph InitialContents: InitializeToExpression: (\'30.21.1\')\x7fVisibility: public'
        
         revision <- '30.21.1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseCopy = ( |
            | resend.baseCopy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         collapse: evt = ( |
            | 
            isExpanded: false.
            setShape: collapsedOffsets).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         collapsedOffsets = ( |
            | 
            ((6@5) & (0@10)) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         collapsedSize = ( |
            | sizeForOffsets: collapsedOffsets).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: newC = ( |
            | 
            morphsDo: [| :m | m colorAll: newC ].
            color: normalColorFor: newC.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: t Action: act = ( |
            | (copy target: t) action: act).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         expand: evt = ( |
            | 
            isExpanded: true.
            setShape: expandedOffsets).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         expandedOffsets = ( |
            | 
            ((5@10) & (-5@5)) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         expandedSize = ( |
            | sizeForOffsets: expandedOffsets).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            color: paint named: 'black'.
            savedColor: color.
            collapse: ui2Event.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         isInMe: evt = ( |
            | 
            owner ifNil: [^ false].
            baseContainsPt: evt cursorPoint - owner globalPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftDoubleClick: evt = ( |
            | 
            "already got a single click, just do action"
            action actionFrom: self Target: target Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            savedColor: color.
            color: pressedColor.
            evt sourceHand subscribeUntilAllUp: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp: evt = ( |
            | 
            color: normalColor.
            (isInMe: evt) ifFalse: [^ self].
            isExpanded ifTrue: [ collapse: evt ] False: [ expand: evt ].
            color: normalColor.
            changed.
            action actionFrom: self Target: target Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: target IsPresentDo: [|:n| target: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         maxSize = ( |
            | collapsedSize max: expandedSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'expanderMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: evt = ( |
            | 
            color: (isInMe: evt) ifTrue: [pressedColor] False: [normalColor]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         normalColor = ( |
            | 
            savedColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         normalColorFor: bgColor = ( |
            | bgColor outlineColorForBackground).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'polygonMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         pressedColor = ( |
            | 
            paint named: 'red').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         setShape: newOffsets = ( |
            | 
            changed.
            vertexOffsets: newOffsets.
            layoutChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: expanderMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         sizeForOffsets: offs = ( |
             maxp <- (0)@(0).
             minp <- (0)@(0).
            | 
            offs do: [|:p|
              minp: p min: minp.
              maxp: p max: maxp.
            ].
            maxp - minp).
        } | ) 



 '-- Side effects'

 globals modules expanderMorph postFileIn
