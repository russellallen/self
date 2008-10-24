 'Sun-$Revision: 30.15 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2Menu = bootstrap define: bootstrap stub -> 'globals' -> 'ui2Menu' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui2Menu' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui2Menu.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Menu' -> () From: ( | {
         'Category: Basic ui2Menu state\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot'
        
         activeHand <- bootstrap stub -> 'globals' -> 'handMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: remembering last selection\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultButtonHolderPrototype = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui2Menu' -> 'defaultButtonHolderPrototype' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui2Menu defaultButtonHolderPrototype.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Menu' -> () From: ( | {
         'Category: Basic ui2Menu state\x7fModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (traits ui2Menu defaultButtonHolderPrototype)\x7fVisibility: private'
        
         defaultButtonHolder <- bootstrap stub -> 'traits' -> 'ui2Menu' -> 'defaultButtonHolderPrototype' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Menu' -> () From: ( | {
         'Category: Basic ui2Menu state\x7fModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (0@0)\x7fVisibility: public'
        
         invocationPoint <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Menu' -> () From: ( | {
         'Category: Basic ui2Menu state\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         isTornOff <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Menu' -> () From: ( | {
         'Category: Basic ui2Menu state\x7fModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (nil)'
        
         markedButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2Menu = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui2Menu.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Menu' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'ui2Menu' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Menu' -> () From: ( | {
         'Category: Basic ui2Menu state\x7fModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         popUpEventTimeStamp.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Menu' -> () From: ( | {
         'Category: Basic ui2Menu state\x7fModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (time origin)\x7fVisibility: private'
        
         popUpTime <- time origin.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Menu' -> () From: ( | {
         'Category: Basic ui2Menu state\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | ui2Menu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Menu' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (paint copyRed: 0.224829 Green: 0.450635 Blue: 0.600196)\x7fVisibility: private'
        
         rawColor <- paint copyRed: 0.224829 Green: 0.450635 Blue: 0.600196.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Menu' -> () From: ( | {
         'Category: Basic ui2Menu state\x7fModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (ui2Button)\x7fVisibility: public'
        
         tearOffButton <- bootstrap stub -> 'globals' -> 'ui2Button' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fCategory: support\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         addButton: b = ( |
            | 
            b frameStyle: b flatStyle.
            b borderWidth: 1.
            b beShrinkWrapHorizontally.
            b beFlexibleHorizontally. 
            b globalPosition: globalBounds bottomLeft.
            addMorphLast: b.
            makeDefaultButtonIndependent.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fCategory: takes string (use take block form instead)\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonTarget: t Asynchronous: isA Script: s ButtonArgs: lst Label: lbl FontSpec: fSpec FontColor: fColor = ( |
             b.
            | 
            b: ui2Button copyColor: color Target: t.
            b script: s.
            b buttonArgs: lst.
            b label: lbl FontSpec: fSpec FontColor: fColor. 
            b isAsynchronous: isA.
            addButton: b. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fCategory: take block for better browsing\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonTarget: t Asynchronous: isA ScriptBlock: b ButtonArgs: lst Label: lbl FontSpec: fSpec FontColor: fColor = ( |
            | 
            addButtonTarget: t
               Asynchronous: isA
                     Script: b asMirror methodSource
                 ButtonArgs: lst
                      Label: lbl
                   FontSpec: fSpec
                  FontColor: fColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fCategory: takes string (use take block form instead)\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonTarget: t AsynchronousScript: s ButtonArgs: lst Label: lbl = ( |
            | 
            addButtonTarget: t 
               Asynchronous: true
                     Script: s 
                 ButtonArgs: lst
                      Label: lbl 
                   FontSpec: defaultFontSpec 
                  FontColor: defaultFontColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fCategory: takes string (use take block form instead)\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonTarget: t AsynchronousScript: s Label: lbl = ( |
            | 
            addButtonTarget: t 
               Asynchronous: true
                     Script: s 
                 ButtonArgs: list copyRemoveAll
                      Label: lbl 
                   FontSpec: defaultFontSpec
                  FontColor: defaultFontColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fCategory: take block for better browsing\x7fComment: take a block to ease browsing\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonTarget: t AsynchronousScriptBlock: b ButtonArgs: lst Label: lbl = ( |
            | 
               addButtonTarget: t
            AsynchronousScript: b asMirror methodSource
                    ButtonArgs: lst
                         Label: lbl).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fCategory: take block for better browsing\x7fComment: take a block to ease browsing\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonTarget: t AsynchronousScriptBlock: b Label: lbl = ( |
            | 
            addButtonTarget: t AsynchronousScript: b asMirror methodSource Label: lbl).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonTarget: t Label: lbl = ( |
             b.
            | 
            b: ui2Button copyColor: color Target: t.
            b label: lbl FontSpec: defaultFontSpec FontColor: defaultFontColor.
            addButton: b.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fCategory: takes string (use take block form instead)\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonTarget: t Script: s ButtonArgs: lst Label: lbl = ( |
            | 
            addButtonTarget: t 
               Asynchronous: false
                     Script: s 
                 ButtonArgs: lst
                      Label: lbl 
                   FontSpec: defaultFontSpec
                  FontColor: defaultFontColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fCategory: takes string (use take block form instead)\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonTarget: t Script: s Label: lbl = ( |
            | 
            addButtonTarget: t 
               Asynchronous: false
                     Script: s 
                 ButtonArgs: list copyRemoveAll
                      Label: lbl 
                   FontSpec: defaultFontSpec
                  FontColor: defaultFontColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fCategory: take block for better browsing\x7fComment: take a block to ease browsing\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonTarget: t ScriptBlock: b ButtonArgs: lst Label: lbl = ( |
            | 
            addButtonTarget: t Script: b asMirror methodSource ButtonArgs: lst Label: lbl).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fCategory: take block for better browsing\x7fComment: take a block to ease browsing\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonTarget: t ScriptBlock: b Label: lbl = ( |
            | 
            addButtonTarget: t Script: b asMirror methodSource Label: lbl).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fComment: Add a divider at the end of th cirrent list of
morphs. -- Randy, 1/10/95\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         addDivider = ( |
            | 
            addMorphLast: divider copy color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: popUp/Down\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: private'
        
         addToWorld: w = ( |
            | 
            "Assume the menu's position and activeHand have been set."

            (w morphs includes: self) ifFalse: [ w addMorph: self ].
            w moveToFront: self.
            buttons do: [| :m |
                (m globalBounds includes: activeHand lastCursor) ifTrue: [ markButton: m ].
            ].
            activeHand subscribeCursor: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: private'
        
         allowSubmorphsToGetEvent: evt = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         buildBasicMenuWhenSubmorph = ( |
             m.
            | 
            m: ui2Menu copy.
            m color: (paint copyRed: 0.9 Green: 0.8 Blue: 0.76).
            m  addButtonTarget: morph 
                   ScriptBlock: [target grabBy: event sourceHand]
                         Label: 'Yank it out'.
            m  addButtonTarget: morph
                   ScriptBlock: [target duplicate: event]
                         Label: 'Duplicate'.
            m  addButtonTarget: morph
                   ScriptBlock: [target outliner: event]
                         Label: 'Outliner...'.
            m  addDivider.
            m  addButtonTarget: morph
                   ScriptBlock: [target colorChanger: event]
                         Label: 'Change color...'.
            m  addButtonTarget: morph
                   ScriptBlock: [target resizeEvent: event]
                         Label: 'Resize'.
            m  addDivider.
            m  addButtonTarget: morph
                   ScriptBlock: [event sourceHand attach:
                                     (propertiesSheetMorph copyTarget: target)]
                         Label: 'Properties...'.
            m  addDivider.
            m  addButtonTarget: morph
                   ScriptBlock: [target delete]
                         Label: 'Dismiss'.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         buildBasicSelfMenu = ( |
             m.
            | 
            m: ui2Menu copy.

            m  addButtonTarget: morph 
                   ScriptBlock: [target submorphsButton: button Event: event]
                         Label: 'Submorphs...'.
            m  addButtonTarget: morph 
                   ScriptBlock: [target coreSamplerButton: button Event: event]
                         Label:  'Core Sampler...'.
            m  addButtonTarget: morph 
                   ScriptBlock: [target embedInMorphBelowFromButton: button Event: event]
                         Label: 'Embed in Morph Below...'.
            m  addDivider.
            m  addButtonTarget: morph 
                   ScriptBlock: [target grabBy: event sourceHand]
                         Label: 'Grab'.
            m  addButtonTarget: morph
                   ScriptBlock: [target duplicate: event]
                         Label: 'Duplicate'.
            m  addButtonTarget: morph
                   ScriptBlock: [target outliner: event]
                         Label: 'Outliner for Morph...'.
            m  addDivider.
            m  addButtonTarget: morph
                   ScriptBlock: [target colorChanger: event]
                         Label: 'Change Color...'.
            m  addButtonTarget: morph
                   ScriptBlock: [target resizeEvent: event]
                         Label: 'Resize'.
            m  addButtonTarget: morph
                   ScriptBlock: [event sourceHand attach:
                                (propertiesSheetMorph copyTarget: target)]
                         Label: 'Properties...'.
            m  addButtonTarget: morph
               AsynchronousScriptBlock: [target popUpInWindow]
                         Label: 'Move to Own Window'.
            m  addDivider.
            m  addButtonTarget: morph
                   ScriptBlock: [target animatedDelete]
                         Label: 'Dismiss'.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: finding buttons\x7fComment: Get my buttons. Assumes buttons are immediate submorphs.
-- Ungar, 6/20/95\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         buttons = ( |
            | 
            morphs filterBy: [|:m| m isButton ] Into: list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         color: c = ( |
            | 
            tearOffButton ifNotNil: [ tearOffButton color: c ].
            resend.color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> 'defaultButtonHolderPrototype' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         defaultButtonIn: aMenu IfPresent: presentBlock IfAbsent: absentBlock = ( |
            | 
            aMenu morphs findFirst: [|:m|
               m isButton  && [ lastButtonLabel = m label ] ]
            IfPresent: presentBlock
            IfAbsent:  absentBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> 'defaultButtonHolderPrototype' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (\'A label that no button has (I hope)\')\x7fVisibility: private'
        
         lastButtonLabel <- 'A label that no button has (I hope)'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> 'defaultButtonHolderPrototype' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> 'defaultButtonHolderPrototype' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         rememberButton: aButton In: aMenu = ( |
            | 
            aButton ifNil: [ ^ self ].
            lastButtonLabel: aButton label.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> 'defaultButtonHolderPrototype' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         retargetButtonsTo: anObj = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (paint named: \'black\')\x7fVisibility: public'
        
         defaultFontColor <- paint named: 'black'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (fontSpec copyName: \'times\' Size: 12 Style: \'\')\x7fVisibility: public'
        
         defaultFontSpec <- fontSpec copyName: 'times' Size: 12 Style: ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: basics\x7fComment: A useful object to copy and put between buttons.
Be sure to set its color as needed. -- Randy, 1/10/95\x7fModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (((((frameMorph copy borderWidth: 1) setHeight: 2)  
     beFlexibleHorizontally)
     beRigidVertically)
     frameStyle: frameMorph insetBezelStyle)\x7fVisibility: public'
        
         divider <- ((((frameMorph copy borderWidth: 1) setHeight: 2)  
     beFlexibleHorizontally)
     beRigidVertically)
     frameStyle: frameMorph insetBezelStyle.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: popUp/Down\x7fCategory: parameters\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         doAnimation = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         grayOut: bool ButtonLabeled: str = ( |
            | 
            buttons do: [| :m | m label = str ifTrue: [ m isGrayedOut: bool ]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: finding buttons\x7fComment: The prototype has a stay up button.\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         hasInterestingButtons = ( |
            | 
            buttons size > prototype buttons size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: remembering last selection\x7fComment: Used to share default buttons across independently constructed menus.
Put a slot foo in a traits object and say:
foo: myMenu initializeDefaultButtonHolder: foo.
May also be used with the prototype.
-- Ungar, 6/20/95\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeDefaultButtonHolder: dbh = ( |
            | 
            " ensure self is not the prototype "
            == prototype ifTrue: [ ^ copy initializeDefaultButtonHolder: dbh ].
            "retarget buttons to nil to avoid storage leak"
            dbh ifNotNil: [ defaultButtonHolder: dbh copy retargetButtonsTo: nil ].
            defaultButtonHolder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
             cm.
            | 
            removeAllMorphs.
            borderWidth: 2.
            beRigid.
            initializeTearOff.
            tearOffButton: tearOffButtonProto copy.
            addMorph: tearOffButton.
            colorAll: (paint copyRed: 0.76 Green: 0.84 Blue: 0.89).
            beShrinkWrap.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeTearOff = ( |
            | 
            tearOffButtonProto color:  color.
            tearOffButtonProto frameStyle: tearOffButtonProto bezelStyle.
            tearOffButtonProto setWidth: 10 Height: 10. 
            tearOffButtonProto beRigidVertically.
            tearOffButtonProto beFlexibleHorizontally.
            tearOffButtonProto target: self.
            tearOffButtonProto scriptBlock: 
                 [target isTornOff: true. button delete].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: interaction support\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot'
        
         isTornOff <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
             hit.
            | 
            activeHand: evt sourceHand. 
            hit: false.

            activeHand subscribeUntilAllUp: self.
            morphs do: [| :m |
              (m globalBounds includes: evt cursorPoint) ifTrue: [
                    m isButton ifTrue: [
                       markButton: m.
                       hit: true.
                    ] False: [
                      "added for XTools,which hseems to give us extra left button events"
                       isTornOff ifFalse: [^ self]. 
                       ^ (m morphsAt: evt cursorPoint - globalPosition) first leftMouseDown: evt
                    ].
              ].
            ].
            hit not && isTornOff ifTrue: [ ^ resend.leftMouseDown: evt ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp: evt = ( |
             m.
             pressTime.
             quickClick <- bootstrap stub -> 'globals' -> 'false' -> ().
             releaseTime.
             wrld.
            | 
            isInWorld ifFalse: [
              evt sourceHand unsubscribeCursor: self.
              ^self
            ].
            wrld: world.

            "check that the menu has been put into the world"
            " and has been up long enough "


            evt isOKToUseMyTimeStampForMenus
            && [0 != popUpEventTimeStamp]
              ifTrue: [
                  pressTime: popUpEventTimeStamp.
                releaseTime: evt timeStamp. 
            ]
            False: [
                  pressTime: popUpTime.
                releaseTime: time current.
            ].
            quickClick: (releaseTime - pressTime) <= 200.

            "unhilight a button if up is outside"
            ( ( wrld morphsAt: evt cursorPoint) includes: self ) 
              ifFalse: [
                 markedButton ifNotNil: [ 
                   unmarkButton: markedButton.
                   markedButton: nil.
             ].
            ].
            quickClick ifTrue: [^ self].

            markedButton ifNotNil: [ markedButton flash ].

            markedButton = tearOffButton ifFalse: [
                defaultButtonHolder rememberButton: markedButton In: self.
                popDown. wrld displayUpdateNow.
            ].
            markedButton ifNotNil: [
                markedButton leftMouseUp: evt.
                unmarkButton: markedButton.
                activeHand unsubscribeCursor: self.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: remembering last selection\x7fComment: Make this menu\'s default button indepdendent of what it
was copied from.
-- Ungar, 6/19/95\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         makeDefaultButtonIndependent = ( |
            | 
            defaultButtonHolder: defaultButtonHolder copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: remembering last selection\x7fComment: Make default button same as argument\'s.
-- Ungar, 6/19/95\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         makeDefaultButtonSameAs: aMenu = ( |
            | 
            defaultButtonHolder: aMenu defaultButtonHolder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            tearOffButton: dict at: tearOffButton IfAbsent: nil.
            tearOffButton ifNotNil: [tearOffButton target: self].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: interaction support\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: private'
        
         markButton: b = ( |
            | 
            markedButton ifNotNil: [ unmarkButton: markedButton ].
            b isGrayedOut ifTrue: [
                markedButton: nil.
                ^self. 
            ].
            b = tearOffButton ifTrue: [
                b indentAndSelect: true.
            ] False: [
                b outdentAndSelect: true.
            ].
            markedButton: b.
            b changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
            | leftMouseDown: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseUp: evt = ( |
            | leftMouseUp: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'ui2Menu'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: evt = ( |
             target.
            | 
            isInWorld ifFalse: [
              evt sourceHand unsubscribeCursor: self.
              ^ self
            ].
            evt sourceHand = activeHand ifFalse: [ ^self ].
            target: nil. 
            buttons do: [| :m | 
              (m globalBounds includes: evt cursorPoint) ifTrue: [
                target: m. 
              ].
            ].
            markedButton ifNotNil: [unmarkButton: markedButton].
            target ifNil: [
              markedButton: nil. 
            ] IfNotNil: [
              markedButton: target.
              markButton: target.
            ]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: popUp/Down\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: private'
        
         popDown = ( |
             bnds.
             m.
             shrinker.
             w.
            | 
            activeHand unsubscribeCursor: self
            isTornOff ifTrue: [ ^self ].

            doAnimation ifFalse: [ ^delete ].

            bnds: baseBounds.
            m: frameMorph copy color: color.  "to be used for animation"
            m filled: true.
            m resizeRect: bnds.

            shrinker: (((boundsAnimator copyTarget: m Seconds: popDownSeconds)
                         from: bnds) to: invocationPoint ## (5@5) ).
            w: world.
            w addMorph: m.
            w moveToFront: m.
            addActivity: (shrinker andThenSend: 'delete' To: m).
            delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: popUp/Down\x7fCategory: parameters\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: private'
        
         popDownSeconds = 0.15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: popUp/Down\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         popUp: evt = ( |
             h.
            | 
            h: evt sourceHand.
               popUpInWorld: h world 
                       From: h
            InvocationPoint: h globalPosition 
                  EventTime: evt timeStamp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: popUp/Down\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         popUpInWorld: w From: h = ( |
            | 
            "obsolete, use popUp: evt instead -- dmu 9/99"
            popUpInWorld: w From: h InvocationPoint: h globalPosition EventTime: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: popUp/Down\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         popUpInWorld: w From: h InvocationPoint: invocationPt EventTime: t = ( |
             boundsWithRestriction.
             boundsWithoutRestriction.
             desiredCursorPt.
             grower.
             m.
            | 
            "Pop up this menu at the hand's position in the given world."
            "Details: This is part 1. Add to the world a temporary morph of
             the same color as the receiver, zoom it into the final size
             and position, and invoke part 2."

            isTornOff: false.
            activeHand: h.
            popUpEventTimeStamp: t.
            invocationPoint: invocationPt.
            position: 100000@100000.  "move offscreen so layout damage is offscreen"
            w addMorph: self.
            layoutChanged.  "fix layout so we know what our size will be"

            " where I want the cursor to be, relative to center of menu "
            desiredCursorPt: 
              defaultButtonHolder defaultButtonIn: self
                IfPresent: [|:b| b baseBounds center - ( baseBounds size / 2 ) ]  IfAbsent: [ 0@0 ].

            boundsWithoutRestriction: globalBaseBounds center: invocationPt - desiredCursorPt.

            boundsWithRestriction:   
              boundsWithoutRestriction restrictTo: h winCanvasForHand boundingBoxInWorld.

            globalPosition: boundsWithRestriction origin.

            "warp cursor to ensure correct selection"
            ( boundsWithRestriction != boundsWithoutRestriction )
            && [ desiredCursorPt != ( 0 @ 0 ) ]
             ifTrue: [  
                h warpTo: baseBounds center + desiredCursorPt.  
            ].

            doAnimation ifFalse: [ ^popUpInWorldPart2 ].

            m: frameMorph copy color: color.  "to be used for animation"
            m filled: true.
            m resizeRect:
                (rectangle copyX: (invocationPt - (10@15))
                               Y: (invocationPt + (10@15))).
            w addMorph: m.
            w moveToFront: m.
            w displayUpdateNow.  "give graphical feedback right away"

            grower: (((boundsAnimator copyTarget: m Seconds: popUpSeconds)
                       from: m bounds) to: bounds).
            w addActivity:
                 ((grower andThenSend: 'popUpInWorldPart2' To: self) 
                          andThenSend: 'delete' To: m ).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: popUp/Down\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpInWorldPart2 = ( |
            | 
            "Part 2 of popping up in the world: add receiver to the world."
            "Note: Assume that the caller has set the receiver's owner to be
             the world in which the menu should appear."

            addToWorld: owner.
            popUpTime: time current.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: popUp/Down\x7fCategory: parameters\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpSeconds = 0.2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         removeButtonLabeled: str = ( |
            | 
            changed.
            morphs copy do: [| :m | m label = str ifTrue: [ m delete ]].
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         retargetButtonsTo: t = ( |
            | 
            buttons do: [| :m |
                m = tearOffButton ifFalse: [ m target: t ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         rightMouseDown: evt = ( |
            | 
            isTornOff ifTrue: [
                ^resend.rightMouseDown: evt.
            ] False: [
                ^leftMouseDown: evt.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         rightMouseUp: evt = ( |
            | leftMouseUp: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: interaction support\x7fModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (ui2Button copy)'
        
         tearOffButtonProto = ui2Button copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: interaction support\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: private'
        
         unmarkButton: b = ( |
            | 
            b = tearOffButton ifTrue: [
                b outdentAndSelect: false.
            ] False: [
                b flattenAndSelect: false.
            ]. 
            b rawState: 'up'. 
            b changed. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | m isButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fComment: A UI2 menu with support
for distributed creattion by group.
-- Ungar, 6/11/95\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         groupedUI2Menu = bootstrap define: bootstrap stub -> 'globals' -> 'groupedUI2Menu' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals ui2Menu copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'groupedUI2Menu' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals groupedUI2Menu.

CopyDowns:
globals ui2Menu. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'groupedUI2Menu' -> () From: ( | {
         'Category: Grouped UI2 Menu State\x7fComment: Ordered collection of
group IDs.
-- Ungar, 6/11/95\x7fModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (vector)\x7fVisibility: public'
        
         groups <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         groupedUI2Menu = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'groupedUI2Menu' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits groupedUI2Menu.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'groupedUI2Menu' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'groupedUI2Menu' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'groupedUI2Menu' -> () From: ( | {
         'Category: Basic ui2Menu state\x7fModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            groupedUI2Menu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot'
        
         ui2Menu = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Menu' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Menu' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui2Menu.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Menu' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Menu' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Menu' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot'
        
         myComment <- 'A conventional look and feel (sorta) menu'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Menu' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
                   ui2Menu initializePrototype.
            groupedUI2Menu initializePrototype.
            morph basicSelfMenu:         ui2Menu buildBasicSelfMenu.
            morph basicMenuWhenSubmorph: ui2Menu buildBasicMenuWhenSubmorph.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Menu' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.15 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Menu' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'groupedUI2Menu' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         addButton: b ToGroup: g = ( |
             d.
            | 
            b useDefaultMenuFont.
            ( groups includes: g ) ifFalse: [
              groups: groups copyAddLast: g.
            ].
            d: buildButtonDictFromMenu.
            (d at: g) add: b.
            buildMenuFromButtonDict: d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'groupedUI2Menu' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot'
        
         buildButtonDictFromMenu = ( |
             d.
             i <- 0.
            | 
            d: dictionary copyRemoveAll.
            groups do: [|:g|
              d at: g Put: priorityQueue copy sorter: ( |
                element: a Precedes: b = ( a label < b label )
              | ).
            ].
            morphs do: [|:m|
              case if:   [ m morphTypeName = divider morphTypeName ] 
                   Then: [ i: i succ ]
                   If:   [  m isButton  && [ ( isTearOffButton: m ) not ]  ]
                   Then: [ ( d at: (groups at: i) ) add: m ].
            ].
            d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'groupedUI2Menu' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot'
        
         buildMenuFromButtonDict: d = ( |
             myTearOff.
            | 
            morphs do: [|:m| 
             case if:   [ m isButton ]
                  Then: [ ( isTearOffButton: m) ifTrue: [ myTearOff: m ] False: [ removeMorph: m ] ]
                  If:   [ m morphTypeName = divider morphTypeName ]
                  Then: [ removeMorph: m ].
            ].
            groups asVector do: [ | :g. :i |
              i = 0  ifFalse: [ addDivider ].
              ( d at: g ) orderedDo: [|:b| addButton: b].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'groupedUI2Menu' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot'
        
         isTearOffButton: b = ( |
            | 
            b script = tearOffButtonProto script).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'groupedUI2Menu' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot'
        
         morphTypeName = 'groupedUI2Menu'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'groupedUI2Menu' -> () From: ( | {
         'ModuleInfo: Module: ui2Menu InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'ui2Menu' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: menu stuff\x7fComment: xxXXX due to module problems(?)
this cannot be initialized to expression ui2Menu buildBasicMenuWhenSubmorph.
See instead modules ui2Menu postFileIn\x7fModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         basicMenuWhenSubmorph <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: menu stuff\x7fComment: xxx XXX should be ui2Menu buildBasicSelfMenu\x7fModuleInfo: Module: ui2Menu InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         basicSelfMenu <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 



 '-- Side effects'

 globals modules ui2Menu postFileIn
