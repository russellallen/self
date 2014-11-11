 '$Revision: 30.15 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: pointers\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         leafPointerButton = bootstrap define: bootstrap stub -> 'globals' -> 'leafPointerButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals ui2Button copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'leafPointerButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals leafPointerButton.

CopyDowns:
globals ui2Button. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: pointers\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         leafPointerButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'leafPointerButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits leafPointerButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'leafPointerButton' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'leafPointerButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         pointerMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pointerMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pointerMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pointerMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pointerMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pointerMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pointerMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pointerMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pointerMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.15 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pointerMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'pluggablePointerMorph
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: pointers\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         pointerTailMorph = bootstrap define: bootstrap stub -> 'globals' -> 'pointerTailMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals arrowEndMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pointerTailMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pointerTailMorph.

CopyDowns:
globals arrowEndMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pointerTailMorph' -> () From: ( | {
         'Category: pointerTailMorph State\x7fModuleInfo: Module: pointerMorph InitialContents: InitializeToExpression: (nil.)'
        
         headMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: pointers\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         pointerTailMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'pointerTailMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits pointerTailMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'pointerTailMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            c fillCircleCenteredAt: center Diameter: radius double Color: color.
            shouldDraw ifTrue: [
                c line: position
                       To: position + edgeOffset
                    Width: owningArrow width
                    Color: owningArrow color.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         collapse = ( |
            | 
            isInWorld ifFalse: [^ doCollapse].
            world safelyDo:    [ 
              "head may be in transit (sprouting),
               if so, stop it first -- dmu 3/02"
              world removeActivitiesWithTarget: headMorph.
              doCollapse
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         doCollapse = ( |
            | 
            owningArrow delete.
            shouldDraw: false.
            headMorph unjoin.
            headMorph shouldDraw: false.
            headMorph changed.
            headMorph globalPosition: retractedGlobalPositionForHead.
            headMorph changed.
            addMorph: headMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerTailMorph' -> () From: ( | {
         'Comment: Includes a head tail and body al connected in the proper way.
-- Randy, 5/2/95\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         fullCopy = ( |
             body.
             head.
             tail.
            | 
            tail: copyRemoveAllMorphs.
            tail radius: 20.
            tail shouldDraw: false.
            head: pointerHeadMorph copyRemoveAllMorphs.
            head radius: 12.
            head shouldDraw: false.

            body: pointerMorph copy.

            body headMorph: head.
            body tailMorph: tail.
            head owningArrow: body.
            head tailMorph: tail.
            tail owningArrow: body.
            tail headMorph: head.

            tail collapse.
            tail).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         morphTypeName = 'pointerTailMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'arrowEndMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         retractedGlobalPositionForHead = ( |
            | 
            isInWorld ifFalse: [globalPosition]
                         True: [(globalPosition + (baseBounds size / 2)) - (headMorph bounds size / 2)]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: pointers\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         outlinerLeafPointerTailMorph = bootstrap define: bootstrap stub -> 'globals' -> 'outlinerLeafPointerTailMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals pointerTailMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'outlinerLeafPointerTailMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals outlinerLeafPointerTailMorph.

CopyDowns:
globals pointerTailMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerLeafPointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         headButtonScriptMethod = ( |
            | 
            "button target world addMorph: button target owningArrow."
            button target isRetracted  ifTrue: [
              outlinerPreferences simpleOutliners ifTrue: [
                target pointTo: target tailMorph targetLeafOutliner outlinerForSprouting: event IfNone: [^self].
              ] False: [
                button target tailMorph targetLeafOutliner sprout: event.
              ].
            ] False: [
              event sourceHand addMorph: button target. 
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: pointers\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         outlinerLeafPointerTailMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'outlinerLeafPointerTailMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits outlinerLeafPointerTailMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerLeafPointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'outlinerLeafPointerTailMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerLeafPointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: InitializeToExpression: (nil.)'
        
         targetLeafOutliner.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutlinerLeafPointerTailMorph' -> 'parent' -> 'headMorphActionProto' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         droppedOn: aRootMorph Event: event = ( |
            | 
            aRootMorph isPluggableOutliner  ifTrue: [
              aRootMorph
                receiveDroppingPointerToModel: tailMorph targetLeafOutliner model
                                   IfAccepted: [ headMorph pointTo: aRootMorph ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: pointers\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         pointerHeadMorph = bootstrap define: bootstrap stub -> 'globals' -> 'pointerHeadMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals arrowEndMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pointerHeadMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pointerHeadMorph.

CopyDowns:
globals arrowEndMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         defaultDropActionObject = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> 'defaultDropActionObject' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits pointerHeadMorph defaultDropActionObject.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pointerHeadMorph' -> () From: ( | {
         'Category: pointerHeadMorph State\x7fModuleInfo: Module: pointerMorph InitialContents: InitializeToExpression: (traits pointerHeadMorph defaultDropActionObject)'
        
         dropActionObject <- bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> 'defaultDropActionObject' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: pointers\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         pointerHeadMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits pointerHeadMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pointerHeadMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pointerHeadMorph' -> () From: ( | {
         'Category: pointerHeadMorph State\x7fModuleInfo: Module: pointerMorph InitialContents: InitializeToExpression: (nil)'
        
         tailMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: pointers\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         pointerMorph = bootstrap define: bootstrap stub -> 'globals' -> 'pointerMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals arrowBodyMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pointerMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pointerMorph.

CopyDowns:
globals arrowBodyMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: pointers\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         pointerMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'pointerMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits pointerMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pointerMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'pointerMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'leafPointerButton' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         addSettingButtonsTo: menu = ( |
             c.
            | 
            slot exists ifFalse: [^ self].
            c: slot contents.
            case if:   [c = true asMirror]
                 Then: [menu addButtonTarget: self
                                 ScriptBlock: [target slot contents: false asMirror]
                                       Label: 'Set to false'
               ] If:   [c = false asMirror]
                 Then: [menu addButtonTarget: self
                                 ScriptBlock: [target slot contents: true asMirror]
                                       Label: 'Set to true'
               ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'leafPointerButton' -> () From: ( | {
         'Category: expander protocol\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         collapse: evt = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'leafPointerButton' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForLeafOutliner: lo = ( |
             button.
             new.
            | 
            button: copy.
            button removeAllMorphs.
            button baseMinWidth:  3.
            button baseMinHeight: 3.
            button beShrinkWrap.
            button color: paint named: 'transparent'.
            button addMorph: (imageMorph copyImage: lo buttonIcon copy).
            button).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'leafPointerButton' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'leafPointerButton' -> () From: ( | {
         'Category: expander protocol\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         expand: evt = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'leafPointerButton' -> () From: ( | {
         'Comment: The hand wants to carry this off, probably to drop
on a new object to serve as replacement slot contents. -- Randy, 5/2/95\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         grabPointer: event = ( |
            | 
            owner  jumpIntoHand: event sourceHand).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'leafPointerButton' -> () From: ( | {
         'Category: expander protocol\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         isExpanded = ( |
            | 
            target tailMorph targetLeafOutliner isExpanded).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'leafPointerButton' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            owner morphTypeName = pointerHeadMorph morphTypeName ifFalse: [
              ^ resend.leftMouseDown: evt
            ].
            owner isRetracted ifTrue: [
              resend.leftMouseDown: evt
            ] False: [
              "use addMorph: instead of attach:
               so that first up event releases it -- dmu 3/1"
              evt sourceHand addMorph: owner
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'leafPointerButton' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
             menu.
            | 
            menu: ui2Menu copy color: nonpluggableOutliner menuColor.
            owner isRetracted ifFalse: [
              menu addButtonTarget: self
                       ScriptBlock: [target target tailMorph targetLeafOutliner retract]
                             Label: 'Retract'.
            ].
            menu addButtonTarget: self
                     ScriptBlock: [target grabPointer: event]
                           Label: 'Grab pointer'.

            addSettingButtonsTo: menu.
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            menu popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'leafPointerButton' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'leafPointerButton'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'leafPointerButton' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui2Button' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'leafPointerButton' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         slot = ( |
            | target tailMorph targetLeafOutliner slot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerLeafPointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForLeafOutliner: lo = ( |
             actionObj.
             button.
             new.
            | 
            new: fullCopy.
            new targetLeafOutliner: lo.
            new headMorph radius: 2.
            new headMorph setDropActionObject: headMorphActionProto copy.
            button: leafPointerButton copyForLeafOutliner: lo.
            new radius: button bounds height / 2.
            button globalPosition: new headMorph globalPosition - (button bounds size / 2).
            new headMorph addMorph: button.
            button target: new headMorph.
            button script: headButtonScript.
            new           color: paint named: 'transparent'.
            new headMorph color: paint named: 'transparent'.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerLeafPointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         headButtonScript = ( |
            | 
            [headButtonScriptMethod].
            (asMirror at: 'headButtonScriptMethod') contents source).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerLeafPointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         headMorphActionProto = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'outlinerLeafPointerTailMorph' -> 'headMorphActionProto' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits outlinerLeafPointerTailMorph headMorphActionProto.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerLeafPointerTailMorph' -> 'headMorphActionProto' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         copy = ( |
            | _Clone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerLeafPointerTailMorph' -> 'headMorphActionProto' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         droppedOn: aRootMorph Event: event = ( |
            | 
            aRootMorph isPluggableOutliner  &&  [aRootMorph model isSelfObjectModel]
             ifTrue: [
              headMorph pointTo: aRootMorph.
              tailMorph targetLeafOutliner setContentsTo: aRootMorph mirror.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerLeafPointerTailMorph' -> 'headMorphActionProto' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: InitializeToExpression: (nil)'
        
         headMorph*.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerLeafPointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            world safelyDo: [collapse]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerLeafPointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         morphTypeName = 'outlinerLeafPointerTailMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerLeafPointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'pointerTailMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerLeafPointerTailMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         slot = ( |
            | targetLeafOutliner slot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            c fillCircleCenteredAt: center Diameter: radius double Color: color.
            shouldDraw ifTrue: [
                c line: position
                       To: position + edgeOffset
                    Width: owningArrow width
                    Color: owningArrow color.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         copyRemoveAllMorphs = ( |
             guy.
            | 
            guy: resend.copyRemoveAllMorphs.
            guy dropActionObject: defaultDropActionObject copy.
            guy dropActionObject headMorph: guy.
            guy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> 'defaultDropActionObject' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         copy = ( |
            | _Clone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> 'defaultDropActionObject' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         droppedOn: aRootMorph Event: event = ( |
            | 
            "Default is to do nothing." self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> 'defaultDropActionObject' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         headMorph* <- bootstrap stub -> 'globals' -> 'pointerHeadMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         finalPositionForPointee: objRep = ( |
            | 
            objRep isInWorld  &&  [objRep world = world]
              ifTrue: [ objRep globalPosition ]
               False: [ positionOfMovedPointee: objRep ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         finishPointingTo: objRep = ( |
            | 
            joinTo: objRep).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         finishSettingScript: rr = ( |
             ms.
            | 
            ms: (reflect: rr result) first.
            (reflect: dropActionObject) addSlot: ms.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'Comment: The global position at which to be, in order to point
at this objectRep (some morph). Accounts for the presence
of other pointers.\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         globalPosFor: objRep At: objRepFinalPos = ( |
             finalCenter.
             isInsideH <- bootstrap stub -> 'globals' -> 'false' -> ().
             myBounds.
             objRepFinalBounds.
             objRepFinalCenter.
             pt.
             tailBounds.
             tailPos.
            | 

            tailBounds: tailMorph globalBaseBounds.
            myBounds: globalBaseBounds.
            objRepFinalBounds: objRep globalBaseBounds translateTo: objRepFinalPos.

            finalCenter:
              "assymmetric: position box on left or right"
              "I'm not sure why radius fiddling is needed or even if it is really right.
               I just want this to look OK. -- dmu 6/1"
              (case if:   [tailBounds left < objRepFinalBounds left]
                    Then: [objRepFinalBounds left - myBounds width half]
                    If:   [tailBounds right > objRepFinalBounds right]
                    Then: [objRepFinalBounds right + myBounds width half]
                    Else: [isInsideH: true.  tailBounds center x + radius])
            @
              (case if:   [tailBounds top < objRepFinalBounds top]
                    Then: [objRepFinalBounds top + 
                            (isInsideH ifTrue: [tailBounds height half negate]
                                        False: [tailBounds height half + radius succ])]
                    If:   [tailBounds bottom > objRepFinalBounds bottom]
                    Then: [objRepFinalBounds bottom - 
                            (isInsideH ifTrue: [tailBounds height half negate]
                                        False: [tailBounds height half + radius pred negate])]
                    Else: [tailBounds center y + radius]).

            pt: finalCenter - (myBounds size / 2).

            [
              "used to keep heads from colliding"
              objRep joinedOnMorphs do: [|:am |
                am morphTypeName = pointerHeadMorph morphTypeName ifTrue: [
                  ((am globalPosition x - objRep globalBaseBounds center x) *
                   (pt x - objRep globalBaseBounds center x)) > 0 ifTrue: [
                    am globalBounds bottom > pt y ifTrue: [pt: am globalBounds bottomRight].
                  ].
                ].
              ].
            ].
            ^ pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'Comment: Is this guy sitting on it\'s own tail? (Presumably without the
line even being drawn.) -- Randy, 4/6/95\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         isRetracted = ( |
            | owner = tailMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'Comment: Does all the sprouting necessary, plus
ends up with self in hand.-- Randy, 5/2/95\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         jumpIntoHand: aHand = ( |
            | 
            world safelyDo: [
              world addMorph: self.
              world addMorph: owningArrow.
            ].
            unjoin.
            aHand attach: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: newOwner Event: evt = ( |
             mphs.
             root.
            | 
            "The followng line is to work around a probable bug: This
            message is sent twice, once from fallingMorph:Event: and
            once from addMorph: (both in traits worldMorph. I
            suspect the second may not really be necessry."

            evt type = 'null' ifTrue: [ ^self].

            mphs: (world morphsAt: evt cursorPoint).
            mphs remove: self           IfAbsent: nil.
            mphs remove: world          IfAbsent: nil.
            mphs remove: evt sourceHand IfAbsent: nil.
            morphsDo: [ | :m | mphs remove: m IfAbsent: nil].
            mphs isEmpty ifTrue: [ ^ self].
            mphs reverseDo: [ | :m |
              m = tailMorph ifTrue: [ tailMorph collapse. ^ self].
              m morphTypeName = imageMorph morphTypeName ifFalse: [
                 root: m root. 
              ].
            ].
            dropActionObject droppedOn: root Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            "Overrides the default so that receiver can get
            grabbed when settled onto its own tail"

            owner = tailMorph ifTrue: [
                owningArrow isInWorld ifFalse: [world addMorph: owningArrow.].
                evt sourceHand addMorph: self
            ] False: [
                resend.leftMouseDown: evt
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         morphTypeName = 'pointerHeadMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'arrowEndMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'Comment: Argument is a mirror.
An interface-level action.
Pointer may animate its way along.-- Randy, 4/6/95
Sent from:
  headButtonScript in traits slotPointerTailMorph,
  headMorphScript  in traits slotPointerTailMorph,
  middleMouseDown: in traits slotPointerButton. -- dmu 7/95\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         pointTo: objRep = ( |
             objRepFinalPos.
            | 
            "..copyMirror:World: is a bad name, since above yields existing outliner if present"

            objRepFinalPos: finalPositionForPointee: objRep.

            world safelyDo: [ 
              objRep moveToPosition: objRepFinalPos Time: 0.3 .

              owner = world ifFalse: [ world addMorph: self.].
              world addMorph: owningArrow.
              " Reversed the following two lines to leave the target
                in front. -- dmu 7/95 "
              world moveToFront: tailMorph root.
              world moveToFront: objRep.
              world moveToFront: self.
            ].
            "Choose one or the other of the following two lines"
            (moveToObject: objRep 
                   Offset: (globalPosFor: objRep At: objRepFinalPos) - objRepFinalPos 
                     Time: 0.3 ) 
               andThenSend: 'finishPointingTo:'   To: self   Args: (list copyRemoveAll add: objRep).
            [finishPointingTo: objRep]. "Browsing"
            "changed. globalPosition: (globalPosFor: objRep At: objRepFinalPos). changed. joinTo: objRep."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         pointTo: objRep InSameViewAsHand: aHand = ( |
            | 
            "pointTo: only tests if objRep is in the world,
             but if it is off-screen, better to remove it, so pointTo: will
             summon it. -- dmu 6/1"

            objRep isInWorld  &&  [objRep world = world] ifTrue: [
              |w. can. bb|
              w: objRep world.
              can: w winCanvasForHand: aHand.
              bb: can boundingBoxInWorld.
              (bb intersects: objRep globalBaseBounds) ifFalse: [objRep delete].
            ].
            pointTo: objRep).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         positionOfMovedPointee: objRep = ( |
             isParent <- bootstrap stub -> 'globals' -> 'false' -> ().
             o.
             objRepFinalPos.
            | 
            o: tailMorph targetLeafOutliner.
            o isSlotOutliner  ||  [o isPluggableOutliner && [o model isSlotModel]]
              ifTrue: [ isParent: tailMorph slot isParent].

            "put in world for layout"
            objRep globalPosition: tailMorph bounds topRight + (300 @ -600).
            world safelyDo: [world addMorph: objRep].

            objRepFinalPos:
                isParent ifFalse: [(tailMorph root globalBounds right @ tailMorph globalBounds top) +
                                   ((bounds width + 25) @ 0)]
                            True: [(tailMorph root globalBounds center x - objRep bounds width half)
                                   @(tailMorph root globalBounds top - 3 - objRep bounds height )].
              objRep globalPosition: objRepFinalPos + (300 @  -600).
              "objRep globalPosition: (tailMorph root globalBounds right @  globalBounds top) +
                                     ((bounds width + 5) @ 1)." "...why 1? xxxXX - RBS"
            objRepFinalPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         script = ( |
            | 
            ((reflect: dropActionObject) at: 'droppedOn:Event:') contents source).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         script: str = ( |
            | 
            str evalObjectBodyInContext: lobby asMirror
                  Prefix: ' | droppedOn: aRootMorph Event: event  = ( '
                  Postfix: ' ) | '
                  ReportingTo: 
                    (traits ui2Button resultReporter copy
                      reportTo: self)
                      howToReport: 'finishSettingScript:'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerHeadMorph' -> () From: ( | {
         'Comment: An alternative to using \'script:\'.\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         setDropActionObject: dropAction = ( |
            | 
            dropAction headMorph: self.  "Set parent backpointer."
            dropActionObject: dropAction.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyIntoWorld: w = ( |
             e1.
             e2.
             new.
            | 
            new: copy.
            new color: paint named: 'black'.
            e1: pointerTailMorph copyAt: (random integer: 400)@(random integer: 300) Arrow: new.
            e2: pointerHeadMorph copyAt: (random integer: 400)@(random integer: 300) Arrow: new.
            e1 radius: 3.
            e2 radius: 3.
            new tailMorph: e1.
            new headMorph: e2.
            e1  headMorph: e2.
            e2  tailMorph: e1.
            w addMorph: (e1 globalPosition: (random integer: 400)@(random integer: 300)).
            w addMorph: (e2 globalPosition: (random integer: 400)@(random integer: 300)).
            w addMorph: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyIntoWorld: w FromMorph: m1 Offset: o1 ToMorph: m2 Offset: o2 = ( |
             e1.
             e2.
             new.
            | 
            new: copy.
            new color: paint named: 'black'.
            e1 pointerTailMorph copyAt: (m1 globalPosition + o1) Arrow: new.
            e2 pointerHeadMorph copyAt: (m2 globalPosition + o2) Arrow: new.
            e1 radius: 3.
            e2 radius: 3.
            new tailMorph: e1.
            new headMorph: e2.
            m1 addMorph: e1.
            m2 addMorph: e2.
            w  addMorph: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerMorph' -> () From: ( | {
         'Category: end morphs\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         deleteEnds = ( |
            | 
            "Leave in place so when outliner is reexpanded
             it will be there. Collapse to get button"
            headMorph delete.
            tailMorph safelyDo: [tailMorph collapse].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerMorph' -> () From: ( | {
         'Category: end morphs\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         headMorph = ( |
            | 
            endMorph2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerMorph' -> () From: ( | {
         'Category: end morphs\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         headMorph: m = ( |
            | endMorph2: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         morphTypeName = 'pointerMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerMorph' -> () From: ( | {
         'ModuleInfo: Module: pointerMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerMorph' -> () From: ( | {
         'Category: end morphs\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         tailMorph = ( |
            | endMorph1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pointerMorph' -> () From: ( | {
         'Category: end morphs\x7fModuleInfo: Module: pointerMorph InitialContents: FollowSlot'
        
         tailMorph: m = ( |
            | endMorph1: m).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'pluggablePointerMorph' From: 'ui2'



 '-- Side effects'

 globals modules pointerMorph postFileIn
