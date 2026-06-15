 '1.0.0'
 '
Copyright 1992-2026 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         windowMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'windowMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'windowMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules windowMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'windowMorph' -> () From: ( | {
         'ModuleInfo: Module: windowMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'windowMorph' -> () From: ( | {
         'ModuleInfo: Module: windowMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'windowMorph' -> () From: ( | {
         'ModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'windowMorph' -> () From: ( | {
         'ModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            windowMorph initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'windowMorph' -> () From: ( | {
         'ModuleInfo: Module: windowMorph InitialContents: InitializeToExpression: (\'1.0.0\')\x7fVisibility: public'
        
         revision <- '1.0.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'windowMorph' -> () From: ( | {
         'ModuleInfo: Module: windowMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         windowMorph = bootstrap define: bootstrap stub -> 'globals' -> 'windowMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'windowMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals windowMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> () From: ( | {
         'Category: Window Morph State\x7fModuleInfo: Module: windowMorph InitialContents: InitializeToExpression: (morph)'
        
         frameHolderForCollapsed <- bootstrap stub -> 'globals' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> () From: ( | {
         'ModuleInfo: Module: windowMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals windowMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         buildInsetFrame = ( |
             rm.
            | 
            rm: frameMorph copy.
            rm color: paint named: 'outlinerGray'.
            rm frameStyle: rm insetBezelStyle.
            rm borderWidth: 3.
            rm beShrinkWrapVertically beFlexibleHorizontally.
            rm addRole: contentMorphHolderRole.
            rm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         closeButtonOn: m = ( |
             b.
            | 
            b: ui2Button copy.
            b label: 'X'.
            b target: m.
            b scriptBlock: [target animatedDelete].
            b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: expand\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         collapse: etc = ( |
             cm.
            | 
            cm: morphs first.
            frameHolderForCollapsed: cm morphs last.
            cm removeMorph: frameHolderForCollapsed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: roles\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         contentMorphHolderRole = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> 'contentMorphHolderRole' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals windowMorph parent contentMorphHolderRole.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> 'contentMorphHolderRole' -> () From: ( | {
         'ModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: content\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         contentsMorph = ( |
            | 
            morphsWithRole: contentMorphHolderRole 
                        Do: [|:m | ^ m morphs first]
                  IfAbsent: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: content\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         contentsMorph: cm = ( |
            | 
            morphsWithRole: contentMorphHolderRole 
                        Do: [|:m | m addMorph: cm. ^ self]  
                  IfAbsent: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: windowMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWrapping: c = ( |
             m.
            | 
            m: resend.copy.
            m  contentsMorph: c.
            m  contentsMorph setWindowLabel.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         defaultWindowLabel = 'Unset Window Title'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: expand\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         expand: evt = ( |
            | 
            morphs first addMorphLast: frameHolderForCollapsed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         expanderAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> 'expanderAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals windowMorph parent expanderAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> 'expanderAction' -> () From: ( | {
         'ModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
             e.
             o.
            | 
            e: source isExpanded.
            o: target.

            e  &&  [ o isInWorld ]  ifTrue: [ o world moveToFront: o ].

            e ifTrue:[ target expand:    evt]
               False:[ target collapse:  evt].
            target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         headerMorphLabel = ( |
             em.
             m.
            | 
            m: rowMorph copy.
            m color: paint named: 'outlinerGray'.
            m borderWidth: 6.
            em:  (expanderMorph copyTarget: self Action: expanderAction).
            em expand: true. 
            m addMorphLast: em.
            m addMorphLast: transparentSpacerMorph copyH: 6.
            m addMorphLast: (labelMorph copy label: defaultWindowLabel) addRole: windowLabelRole.
            m addMorphLast: spacer.
            m addMorphLast: closeButtonOn: self.
            m beFlexible.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         initializePrototype = ( |
             cm.
             fm.
             m.
            | 
            removeAllMorphs.
            borderWidth: 3.
            color: paint named: 'outlinerGray'.

            cm: columnMorph copyTransparent borderWidth: 0.
            cm addMorphLast: headerMorphLabel.

            fm: buildInsetFrame.

            cm addMorphLast: fm.
            cm borderWidth: 0.
            cm beShrinkWrapVertically.
            cm beFlexibleHorizontally.

            addMorph: cm.
            beShrinkWrap.
            addRole: windowRole.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'windowMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: windowMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         spacer = ( |
            | 
            transparentSpacerMorph copyV: 6).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: content\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         windowLabel = ( |
            | 
            morphsWithRole: windowLabelRole 
                        Do: [|:m | ^ m label]
                  IfAbsent: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: content\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         windowLabel: l = ( |
            | 
            morphsWithRole: windowLabelRole 
                        Do: [|:m | m label: l. ^ self]    
                  IfAbsent: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: roles\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         windowLabelRole = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> 'windowLabelRole' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals windowMorph parent windowLabelRole.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> 'windowLabelRole' -> () From: ( | {
         'ModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> () From: ( | {
         'Category: roles\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         windowRole = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> 'windowRole' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals windowMorph parent windowRole.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> 'parent' -> 'windowRole' -> () From: ( | {
         'ModuleInfo: Module: windowMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: windowMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            windowMorph).
        } | ) 



 '-- Side effects'

 globals modules windowMorph postFileIn
