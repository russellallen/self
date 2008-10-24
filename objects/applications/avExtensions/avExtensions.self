 '$Revision: 30.9 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fCategory: avExtensions\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         audioMorph = bootstrap define: bootstrap stub -> 'globals' -> 'audioMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals audioMorph.

CopyDowns:
globals morph. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'\')'
        
         audioSource <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0)'
        
         averageEnergy <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (3751)'
        
         controlPort <- 3751.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (false)'
        
         isJoined <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (false)'
        
         isOpen <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (true)'
        
         isReceiving <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (false)'
        
         isRestricted <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (true)'
        
         isTransmitting <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (sequence copy)'
        
         listeningTo <- sequence copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0)'
        
         logEnergy <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0)'
        
         monitorGain <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'238.0.0.2\')'
        
         multicastGroup <- '238.0.0.2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0@0)'
        
         oldGlobalPosition <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals audioMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         audioControlMorph = bootstrap define: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'borderWidth' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals columnMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals audioMorph parent audioControlMorph.

CopyDowns:
globals columnMorph. copyRemoveAllMorphs 
SlotsToOmit: borderWidth parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         borderWidth <- 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         filled <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         frameStyle <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (false)'
        
         isStepping <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals audioMorph parent audioControlMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         anyXilWorlds = ( |
             xil.
            | 
            xil: false.
            desktop worlds do: [ | :w |
              xil: (xil || w xilWorld).
            ].
            xil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'Comment: Make sure it is stepping 
if it is in a world\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            resend.baseDrawOn: c.
            isStepping ifFalse: [
              getSteppedEveryMSecs: 2000.
              isStepping: true.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (rectangle from: (0@0) To: (90@184))'
        
         controlBounds <- rectangle from: (0@0) To: (90@184).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'Comment: Stop stepping when deleted\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | 
            isStepping ifTrue: [
              stopGettingStepped.
              isStepping: false.
            ].
            resend.delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         findControlsInWorld: world = ( |
            | 
            world allMorphs copyFilteredBy: [ | :m |
              (m morphTypeName) = (audioMorph audioControlMorph morphTypeName)]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         findParticipantNodes = ( |
             plst.
            | 
            plst: set copyRemoveAll.
            desktop worlds do: [ | :w |
              w winCanvases do: [ | :c |
                plst add: (c xDisplay serverName asTokensSeparatedByCharactersIn: ':') first.
              ].
            ].
            plst).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getAudioControl = ( |
             cm0.
             cm1.
             cm2.
             ed1.
             ed2.
             fm.
             gray.
             h.
             leaf.
             rm.
             w.
            | 
            gray: (paint named: 'lightGray').
            leaf: (paint named: 'leaf').
            fm: audioControlMorph copy color: gray.
            rm: (rowMorph copy color: gray) borderWidth: 1.
            cm0: (((columnMorph copy color: gray) borderWidth: 1) addAllMorphs:
                 (((((vector copyAddLast:
                           ((getLightButtonColor: gray
                            Target: self 
                            Step: false
                            Script: 'target isOpen ifTrue: [target closeAudio] False: [target openAudio]'
                            OnTest: 'isJoined && isOpen'
                            Vertical: true) label: 'Power'))
                    copyAddLast:
                           (spacerMorph copyH: 5 Color: gray))
                    copyAddLast:
                           (labelMorph copyLabel: audioSource))
                    copyAddLast:
                           (spacerMorph copyH: 5 Color: gray))
                    copyAddLast:
                           (rm))).
            ed1: buildMyEnumeratedFieldDrawables:
                        (getSpeakerMorph & getHeadphoneMorph & getLineOutMorph) asVector
                        Values: ('speaker' & 'headphone' & 'line-out') asVector
                        InitialValue: playPort.
            (ed1 target: self) selector: 'setPlayPortTo:'.
            ed2: buildMyEnumeratedFieldDrawables:
                        (getMicMorph & getLineInMorph) asVector
                        Values: ('microphone' & 'line-in') asVector
                        InitialValue: recordPort.
            (ed2 target: self) selector: 'setRecordPortTo:'.
            " This is to insure the two buttons are the same height. "
            w: ioMorphButtonWidth.
            h: ioMorphButtonHeight.
            (((ed1 beRigid baseMinWidth: w) setWidth: w) baseMinHeight: h) setHeight: h.
            (((ed2 beRigid baseMinWidth: w) setWidth: w) baseMinHeight: h) setHeight: h.
            cm1: ((columnMorph copy color: gray) borderWidth: 1) centerJustify
                 addAllMorphs:
                 (((((vector copyAddLast: ed1)
                    copyAddLast:
                           (spacerMorph copyH: 5 Color: gray))
                    copyAddLast:
                           (getLightButtonColor: gray
                            Target: self
                            Script: 'target isReceiving ifTrue: [target receiveOff] False: [target receiveOn]'
                            OnTest: 'isJoined && isReceiving'
                            Vertical: true))
                    copyAddLast:
                           (spacerMorph copyH: 5 Color: gray))
                    copyAddLast:
                           (getSliderColor: gray Min: 0 Max: 255
                            Target: self Selector: 'setPlayGainTo:'
                            Vertical: true)).
            cm2: ((columnMorph copy color: gray) borderWidth: 1) centerJustify
                 addAllMorphs:
                 (((((vector copyAddLast: ed2)
                    copyAddLast:
                           (spacerMorph copyH: 15 Color: gray))
                    copyAddLast:
                           (getLightButtonColor: gray
                            Target: self
                            Script: 'target isTransmitting ifTrue: [target transmitOff] False: [target transmitOn]'
                            OnTest: 'isJoined && isTransmitting'
                            Vertical: true))
                    copyAddLast:
                           (spacerMorph copyH: 5 Color: gray))
                    copyAddLast:
                           (getSliderColor: gray Min: 0 Max: 255
                            Target: self Selector: 'setRecordGainTo:'
                            Vertical: true)).
            rm addAllMorphs: ((vector copyAddLast:
                                 cm1)
                          copyAddLast:
                                 cm2).
            fm addMorph: cm0.
            fm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getControlWindowsFor: plst OnWorld: world = ( |
            | 
            getControlWindowsFor: plst OnWorld: world At: (0@0)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getControlWindowsFor: plst OnWorld: world At: point = ( |
             bnds.
             clst.
             wc.
             xil.
            | 
            clst: findControlsInWorld: world.
            (clst size) = 0 ifTrue: [
              ^ nil.
            ].
            plst do: [ | :p |
              clst findFirst: [ | :el |
                p = getHostForControl: el
              ] IfPresent: [ | :el |
                 world winCanvases findFirst: [ | :can |
                    p = (can xDisplay serverName asTokensSeparatedByCharactersIn: ':') first
                 ] IfPresent: [ ] IfAbsent: [
                   world alsoOpenOnDisplay: (getDisplayFor: p)
                         Bounds: (point ## (el globalBaseBounds size)) Limited: true.
                   world winCanvases findFirst: [ | :can |
                      p = (can xDisplay serverName asTokensSeparatedByCharactersIn: ':') first
                   ] IfPresent: [ | :can |
                      can offset: (0@0) - (el globalPosition).
                      matchColorForWorld: world Canvas: can.
                   ] IfAbsent: [ ^ error: 'not found'] .
                 ].
              ] IfAbsent: [ ^ error: 'not found'].
            ].
            world go.
            world).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getControls = ( |
             clst.
             plst.
            | 
            " First get controls for all participants "
            plst: findParticipantNodes.
            clst: getControlsFor: plst.
            " Now see if there are additional audioMorphs open "
            audioMorph openAudioSessions do: [ | :am |
              plst findFirst: [ | :el |
                am audioSource = el
              ] IfPresent: [] IfAbsent: [
                clst add: (am getAudioControl).
              ].
            ].
            clst).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getControlsFor: seq = ( |
             clst.
            | 
            clst: sequence copyRemoveAll.
            seq do: [ | :el |
              audioMorph openAudioSessions findFirst: [ | :am |
                am audioSource = el
              ] IfPresent: [ | :am |
                clst add: am getAudioControl.
              ] IfAbsent: [
                clst add: ((audioMorph copy audioSource: el) getAudioControl).
              ].
            ].
            clst).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getControlsInNewWorld = ( |
             clst.
             plst.
             world.
            | 
            plst: findParticipantNodes.
            (plst size) = 0 ifTrue: [
              ^ nil.
            ].
            clst: getControls.
            world: putControls: clst
                   InNewWorldOnDisplay: (getDisplayFor: plst first)
                   At: (0@0) Limit: true SeparatedBy: 20.
            world != nil ifTrue: [
              getControlWindowsFor: (plst copy removeFirst) OnWorld: world.
            ].
            world).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getDisplayFor: host = ( |
             clst.
            | 
            desktop worlds do: [ | :w |
              w winCanvases findFirst: [ | :c |
                  host = (c xDisplay serverName asTokensSeparatedByCharactersIn: ':') first
                ] IfPresent: [ | :c |
                    ^ c xDisplay name.
                ] IfAbsent: [
                  ^ (host, ':0').
                ].
              ].
              self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getHostForControl: aControl = ( |
            | 
            aControl allMorphsDo: [ | :m |
              ((m morphTypeName) = (sliderMorph morphTypeName)) &&
                [(m target morphTypeName) = (audioMorph morphTypeName)] ifTrue: [
                ^ m target audioSource.
              ].
            ].
            ^ nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         matchColorForWorld: aWorld Canvas: aCanvas = ( |
             oldwc.
            | 
            aWorld xilWorld ifTrue: [
              oldwc: matchXilWindowForWorld: aWorld Canvas: aCanvas.
            ] False: [
              ^ self.
            ].
            oldwc = nil ifTrue: [ ^ self. ].
            aCanvas colorDict colorToIndex: oldwc colorDict colorToIndex copy.
            aCanvas colorDict idToIndex: oldwc colorDict idToIndex copy.
            aCanvas colorDict colorToIndex keys do: [ | :k |
               aCanvas colorDict storeColor: k At: (aCanvas colorDict colorToIndex at: k)
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         matchWindowForWorld: aWorld Canvas: aCanvas = ( |
             host.
             oldwc.
             oldworld.
            | 
            host: (aCanvas xDisplay serverName asTokensSeparatedByCharactersIn: ':') first.
            desktop worlds do: [ | :w |
              (w != aWorld) & (w isXil not) ifTrue: [
                w winCanvases do: [ | :c |
                  ((c xDisplay serverName asTokensSeparatedByCharactersIn: ':') first) = host ifTrue: [
                    ^ w.
                  ].
                ].
              ].
            ].
            ^ nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         matchXilWindowForWorld: aWorld Canvas: aCanvas = ( |
            | 
            desktop worlds do: [ | :w |
              (w != aWorld) && (w xilWorld) ifTrue: [
                w winCanvases do: [ | :c |
                  (c xDisplay name) = (aCanvas xDisplay name) ifTrue: [
                    ^ c.
                  ].
                ].
              ].
            ].
            ^ nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         morphTypeName = 'audioControlMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         putControls: controlList InNewWorldOnDisplay: dsply = ( |
            | 
            putControls: controlList InNewWorldOnDisplay: dsply
                         At: (0@0) Limit: false SeparatedBy: 20).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         putControls: controlList InNewWorldOnDisplay: dsply At: point Limit: limit SeparateBy: pixelcnt = ( |
             bnds.
             c.
             clst.
             world.
             xil.
            | 
            (controlList size) = 0 ifTrue: [
              ^ nil.
            ].
            clst: controlList copy.
            c: clst first.
            c globalPosition: 0@0.
            " bnds: c bounds.  !!! Comes up with 0@0 # 100@80 -- not even close... "
            limit ifTrue: [
              bnds: controlBounds.
            ] False: [
              bnds: ((0@0) # ((((controlBounds size x) * (clst size)) +
                             (pixelcnt * ((clst size) - 1))) @ (controlBounds size y))).
            ].
            xil: anyXilWorlds.
            world: worldMorph copyOpenOnDisplay: (dsply) 
                                Bounds: bnds Xil: xil Limited: limit.
            world name: 'Audio'.
            world addMorph: c.
            clst remove: c.
            matchColorForWorld: world Canvas: world winCanvases first.
            clst do: [ | :cel |
              cel globalPosition: (c globalPosition) + (((c width) + pixelcnt)@0).
              world addMorph: cel.
              c: cel.
            ].
            world go.
            world).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         step = ( |
             lm.
            | 
            lm: allMorphs copyFilteredBy: [ | :m |
              m morphTypeName = audioMorph lightMorph morphTypeName
            ].
            lm do: [ |:m |
              m doStepping ifFalse: [
                m step.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | frameMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioControlMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196)\x7fVisibility: private'
        
         rawColor <- paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: metering\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         audioFeedback = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioFeedback' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals audioMorph parent audioFeedback.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioFeedback' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (true)'
        
         continue <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioFeedback' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         findTarget = ( |
             targ.
            | 
            targ: (((tokens first) asTokensSeparatedByCharactersIn: ':=') last).
            audioMorph openAudioSessions do: [ | :obj |
              (obj audioSource) = targ ifTrue: [
                tokens remove: (tokens first).
                ^ obj.
              ].
            ].
            ('Unable to find object matching ', targ, ' in token ', (tokens first)) printLine.
            ^ nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioFeedback' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         initKeywords = ( |
            | 
            keywords: list copyRemoveAll.
            keywords add: (((keyword copy) key: 'logEnergy:') evalValue: true).
            keywords add: (((keyword copy) key: 'averageEnergy:') evalValue: true).
            keywords add: (((keyword copy) key: 'playGain:') evalValue: true).
            keywords add: (((keyword copy) key: 'recordGain:') evalValue: true).
            keywords add: (((keyword copy) key: 'monitorGain:') evalValue: true).
            keywords add: (((keyword copy) key: 'playPort:') evalValue: false).
            keywords add: (((keyword copy) key: 'recordPort:') evalValue: false).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioFeedback' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         keywords <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( |
             {} = 'Comment: The methods in \'Models\' need to be
copied to your specific feedback
engine and tailored to your needs.\x7fModuleInfo: Creator: globals feedbackEngine parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioFeedback' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         parent* <- bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioFeedback' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (10035)'
        
         port <- 10035.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioFeedback' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         socket.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioFeedback' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         tokens.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioFeedback' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0)'
        
         totalBytes <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         audioGlobalPosition = ( |
            | 
            world winCanvases do: [ | :c |
              (c xDisplay serverName asTokensSeparatedByCharactersIn: ':') first 
                = audioSource  ifTrue: [
                   ^ c boundingBoxInWorld center.
                ].
            ].
            ^ globalBaseBounds center).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         audioHost = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioHost' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals audioMorph parent audioHost.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioHost' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0)'
        
         audioLevel <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioHost' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'\')'
        
         hostName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioHost' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'\')'
        
         ipAddr <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioHost' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0)'
        
         level <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioHost' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Activities\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         audioPropsMorph = bootstrap define: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals subPropertiesSheetMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals audioMorph parent audioPropsMorph.

CopyDowns:
globals subPropertiesSheetMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         audioSourceField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         inputField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         monitorGainField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         multicastGroupField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         outputField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals audioMorph parent audioPropsMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptPropertyChanges = ( |
             scl.
            | 
            target audioSource: (contentsOfTextField: audioSourceField).
            target multicastGroup: (contentsOfTextField: multicastGroupField).
            target ttl: (contentsOfTextField: ttlField) eval. "to parse float or int"
            target port: (contentsOfTextField: portField) eval. "to parse float or int"

            " NOTE: Many of the target fields can be asynchronously modified
                    be feedback processing. Don't depend on them. "
            target setRecordPortTo: (contentsOfEnumeratedField: inputField).
            target recordPort: (contentsOfEnumeratedField: inputField).
            target setPlayPortTo: (contentsOfEnumeratedField: outputField).
            target playPort: (contentsOfEnumeratedField: outputField).
            target setPlayGainTo: (contentsOfTextField: playGainField) eval asInteger.
            target playGain: (contentsOfTextField: playGainField) eval asInteger.
            target setRecordGainTo: (contentsOfTextField: recordGainField) eval asInteger.
            target recordGain: (contentsOfTextField: recordGainField) eval asInteger.
            target setMonitorGainTo: (contentsOfTextField: monitorGainField) eval asInteger.
            target monitorGain: (contentsOfTextField: monitorGainField) eval asInteger.

            (contentsOfEnumeratedField: powerField) ifTrue: [
              target isJoined ifFalse: [
                target openAudio.
              ].
            ] False: [
              target closeAudio.
            ].
            target restrictListening: (contentsOfEnumeratedField: restrictedField).
            (contentsOfEnumeratedField: receiveField) ifTrue: [
              target receiveOn.
            ] False: [
              target receiveOff.
            ].
            (contentsOfEnumeratedField: transmitField) ifTrue: [
              target transmitOn.
            ] False: [
              target transmitOff.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         buildMyEnumeratedFieldNamed: n Drawables: morphs Values: values InitialValue: v = ( |
             f.
            | 
            defaultButtonHolder: ui2Menu initializeDefaultButtonHolder: defaultButtonHolder.
            f: audioMorph audioPropsMorph enumeratedDrawableMorph 
                  copyItemDrawables: morphs Values: values DefaultButtonHolder: defaultButtonHolder.
            f setSelectedIndex: (values asVector keyAt: v).
            buildFieldLabel: n ContentMorph: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         buildPropertyEntries = ( |
            | 
            multicastGroupField: (buildTextFieldNamed:  'Multicast Group (next start)' String: target multicastGroup).
            portField: (buildTextFieldNamed:  'Port (next start)' String: target port printString).
            ttlField: (buildTextFieldNamed:  'Multicast TTL (next start)' String: target ttl printString).
            audioSourceField: (buildTextFieldNamed:  'Audio Source / Hostname (next start)' String: target audioSource).
            playGainField: (buildTextFieldNamed:  'Play Volume' String: target playGain printString).
            recordGainField: (buildTextFieldNamed:  'Transmit Volume' String: target recordGain printString).
            monitorGainField: (buildTextFieldNamed:  'Monitor Volume' String: target monitorGain printString).
            restrictedField:     (buildEnumeratedFieldNamed: 'Volume at Distance'
                    Labels: ('Varies by Distance' & 'Full Volume') asVector
                    Values: (true & false) asVector
                    InitialValue: target isRestricted).
            " inputField:     (buildEnumeratedFieldNamed: 'Input'
                    Labels: ('Microphone' & 'Line In') asVector
                    Values: ('microphone' & 'line-in') asVector
                    InitialValue: target recordPort). "
            inputField:     (buildMyEnumeratedFieldNamed: 'Input'
                    Drawables: (target getMicMorph & target getLineInMorph) asVector
                    Values: ('microphone' & 'line-in') asVector
                    InitialValue: target recordPort).
            " outputField:     (buildEnumeratedFieldNamed: 'Output'
                    Labels: ('Speakers' & 'Headphones' & 'Line Out') asVector
                    Values: ('speaker' & 'headphone' & 'line-out') asVector
                    InitialValue: target playPort). "
            outputField:     (buildMyEnumeratedFieldNamed: 'Output'
                    Drawables: (target getSpeakerMorph & target getHeadphoneMorph & target getLineOutMorph) asVector
                    Values: ('speaker' & 'headphone' & 'line-out') asVector
                    InitialValue: target playPort).
            powerField:     (buildEnumeratedFieldNamed: 'Power'
                    Labels: ('On' & 'Off') asVector
                    Values: (true & false) asVector
                    InitialValue: target isJoined).
            receiveField:     (buildEnumeratedFieldNamed: 'Other Speakers'
                    Labels: ('Listen' & 'Mute') asVector
                    Values: (true & false) asVector
                    InitialValue: true).
            transmitField:     (buildEnumeratedFieldNamed: 'Transmit'
                    Labels: ('On' & 'Mute') asVector
                    Values: (true & false) asVector
                    InitialValue: true).
            (audioSourceField & powerField & inputField & outputField & restrictedField
              & playGainField & recordGainField & monitorGainField
              & receiveField & transmitField
              & multicastGroupField & portField & ttlField) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: m = ( |
            | 
            copyTarget: m Title: 'Audio Properties').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         enumeratedDrawableMorph = bootstrap define: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'borderWidth' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals audioMorph parent audioPropsMorph parent enumeratedDrawableMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: borderWidth parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         borderWidth <- 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> () From: ( | {
         'Category: Drawable Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         currentDrawable.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> () From: ( | {
         'Category: Drawable Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (vector copyRemoveAll)\x7fVisibility: private'
        
         itemDrawables <- vector copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> () From: ( | {
         'Category: Drawable Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (vector copyRemoveAll)\x7fVisibility: private'
        
         itemValues <- vector copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals audioMorph parent audioPropsMorph parent enumeratedDrawableMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> () From: ( | {
         'Comment: Return true (the default) if submorphs should have a
chance to handle the given event. Descendents may override
this method to keep submorphs from seeing certain kinds of
events. For example, a morph that is sensitive to leftMouseDown
could prevent its submorphs from seeing these events since
otherwise a submorph\'s handling of leftMouseDown events
(e.g., to grab the morph) would prevent the button itself
from seeing the event.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         allowSubmorphsToGetEvent: evt = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         copyItemDrawables: mlist Values: values DefaultButtonHolder: dbh = ( |
             h.
             new.
             w.
            | 
            new: copy.
            new color: (paint named: 'lightGray').
            new itemDrawables: mlist asVector.
            mlist size > 0 ifFalse: [
                error: 'Item drawables list must be non-empty'.
            ].
            values size > 0 ifTrue: [
                values size = mlist size ifFalse: [
                    error: 'Size of values list must match size of item drawables list'.
                ].
                new itemValues: values asVector.
            ] False: [
                new itemValues: nil.
            ].
            " Set minimum height & width to hold largest morphs "
            w: mlist first bounds width.
            h: mlist first bounds height.
            mlist do: [ | :m |
                w < m bounds width ifTrue: [
                     w: m bounds width.
                ].
                h < m bounds height ifTrue: [
                     h: m bounds height.
                ].
            ].
            new addMorph: ((((rowMorph copy color: new color) borderWidth: 1)
                              centerJustify) addAllMorphs:
                                     ((vector copyAddLast:
                                        ((spacerMorph copy beFlexible
                                           baseMinWidth: 5) color: new color))
                                     copyAddLast:
                                        ((frameMorph copy beRigid
                                           color: new color)
                                           setWidth: 12 Height: 8))).
            w: w + 22.
            h: h + 6.
            new baseMinWidth: w.
            new setWidth: w.
            new baseMinHeight: h.
            new setHeight: h.
            new beRigid.
            new setSelectedIndex: 0.
            new defaultButtonHolder: dbh.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         getSelectedValue = ( |
            | 
            nil = itemValues
                ifTrue: [ ^selectedIndex ]
                 False: [ ^itemValues at: selectedIndex ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype.
            color: (paint named: 'black').
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
             gray.
             m.
            | 
            gray: paint named: 'lightGray'.
            m: ui2Menu copy color: gray.
            itemDrawables do: [| :morph. :i |
                m addButton: ((((ui2Button copyColor: gray Target: self)
                           script: 'target selectionFrom: button')
                       buttonArgs: (vector copyAddLast: i))
                            addMorph: morph).
            ].
            m defaultButtonHolder: defaultButtonHolder.
            m popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'enumeratedDrawableMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         notifyTarget = ( |
            | 
            (nil = target) || (nil = selector) ifFalse: [
                selector sendTo: target With: (itemValues at: selectedIndex).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         oldStuff = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> 'oldStuff' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals audioMorph parent audioPropsMorph parent enumeratedDrawableMorph parent oldStuff.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> 'oldStuff' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: input output morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         copyItemDrawables: mlist Values: values DefaultButtonHolder: dbh = ( |
             h.
             new.
             w.
            | 
            new: copy.
            new color: (paint named: 'lightGray').
            new beShrinkWrap.
            new itemDrawables: mlist asVector.
            mlist size > 0 ifFalse: [
                error: 'Item drawables list must be non-empty'.
            ].
            values size > 0 ifTrue: [
                values size = mlist size ifFalse: [
                    error: 'Size of values list must match size of item drawables list'.
                ].
                new itemValues: values asVector.
            ] False: [
                new itemValues: nil.
            ].
            " Set minimum height & width to hold largest morphs "
            w: mlist first bounds width.
            h: mlist first bounds height.
            mlist do: [ | :m |
                w < m bounds width ifTrue: [
                     w: m bounds width.
                ].
                h < m bounds height ifTrue: [
                     h: m bounds height.
                ].
            ].
            new baseMinWidth: w.
            new baseMinHeight: h.
            new addMorph: ((((rowMorph copy color: new color) borderWidth: 1)
                              centerJustify) addMorph:
                                     ((((columnMorph copy color: new color)
                                         borderWidth: 2)
                                        centerJustify) addMorph:
                                              (((frameMorph copy beRigid
                                                color: (paint named: 'darkGray'))
                                                setWidth: 8 Height: 4)))).
            new setSelectedIndex: 0.
            new defaultButtonHolder: dbh.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> 'oldStuff' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: input output morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getHeadphoneMorph = ( |
             vs.
            | 
            vs: list copyRemoveAll.
            vs add: (2 @ 15).
            vs add: (0 @ 12).
            vs add: (0 @ 7).
            vs add: (2 @ 5).
            vs add: (2 @ 3).
            vs add: (6 @ 0).
            vs add: (10 @ 0).
            vs add: (14 @ 3).
            vs add: (14 @ 5).
            vs add: (16 @ 7).
            vs add: (16 @ 12).
            vs add: (14 @ 15).
            vs add: (12 @ 15).
            vs add: (12 @ 4).
            vs add: (8 @ 0).
            vs add: (4 @ 4).
            vs add: (4 @ 15).
            (((polygonMorph copy) vertices: vs) color: (paint named: 'black'))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> 'oldStuff' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: input output morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getLineInMorph = ( |
             black.
             c1.
             c2.
             pm.
             vs.
            | 
            black: (paint named: 'black').
            vs: list copyRemoveAll.
            vs add: (6 @ 0).
            vs add: (12 @ 7).
            vs add: (8 @ 7).
            vs add: (8 @ 18).
            vs add: (4 @ 18).
            vs add: (4 @ 7).
            vs add: (0 @ 7).
            pm: (polygonMorph copy vertices: vs) color: black.
            c1: (circleMorph copy radius: 11) color: black.
            c2: (circleMorph copy radius: 8) color: (paint named: 'lightGray').
            c1 addMorph: c2.
            c2 position: (0 @ 0).
            c2 addMorph: pm.
            pm position: (0 @ -3).
            c1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> 'oldStuff' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: input output morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getLineOutMorph = ( |
             black.
             c1.
             c2.
             pm.
             vs.
            | 
            black: (paint named: 'black').
            vs: list copyRemoveAll.
            vs add: (4 @ 0).
            vs add: (4 @ 11).
            vs add: (0 @ 11).
            vs add: (6 @ 18).
            vs add: (12 @ 11).
            vs add: (8 @ 11).
            vs add: (8 @ 0).

            " vs add: (6 @ 0).
            vs add: (12 @ 7).
            vs add: (8 @ 7).
            vs add: (8 @ 18).
            vs add: (4 @ 18).
            vs add: (4 @ 7).
            vs add: (0 @ 7). "
            pm: (polygonMorph copy vertices: vs) color: black.
            c1: (circleMorph copy radius: 11) color: black.
            c2: (circleMorph copy radius: 8) color: (paint named: 'lightGray').
            c1 addMorph: c2.
            c2 position: (0 @ 0).
            c2 addMorph: pm.
            pm position: (-2 @ 1).
            c1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> 'oldStuff' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: input output morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getMicMorph = ( |
             vs.
            | 
            vs: list copyRemoveAll.
            vs add: (2 @ 0).
            vs add: (7 @ 0).
            vs add: (9 @ 2).
            vs add: (9 @ 7).
            vs add: (8 @ 8).
            vs add: (16 @ 16).
            vs add: (16 @ 19).
            vs add: (5 @ 8).
            vs add: (3 @ 9).
            vs add: (1 @ 7).
            vs add: (0 @ 5).
            vs add: (0 @ 2).
            ((polygonMorph copy vertices: vs) color: (paint named: 'black'))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> 'oldStuff' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: input output morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getSpeakerMorph = ( |
             vs.
            | 
            vs: list copyRemoveAll.
            vs add: (0 @ 0).
            "vs add: (5 @ 2)."
            vs add: (8 @ 7).
            vs add: (13 @ 8).
            vs add: (13 @ 12).
            vs add: (8 @ 13).
            "vs add: (5 @ 18)."
            vs add: (0 @ 20).
            ((polygonMorph copy vertices: vs) color: (paint named: 'black'))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> 'oldStuff' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: input output morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         oldCopyItemDrawables: mlist Values: values DefaultButtonHolder: dbh = ( |
             h.
             new.
             w.
            | 
            new: copy.
            new color: (paint named: 'lightGray').
            new beShrinkWrap.
            new itemDrawables: mlist asVector.
            mlist size > 0 ifFalse: [
                error: 'Item drawables list must be non-empty'.
            ].
            values size > 0 ifTrue: [
                values size = mlist size ifFalse: [
                    error: 'Size of values list must match size of item drawables list'.
                ].
                new itemValues: values asVector.
            ] False: [
                new itemValues: nil.
            ].
            " Set minimum height & width to hold smallest morphs "
            w: mlist first bounds width.
            h: mlist first bounds height.
            mlist do: [ | :m |
                w > m bounds width ifTrue: [
                     w: m bounds width.
                ].
                h > m bounds height ifTrue: [
                     h: m bounds height.
                ].
            ].
            new baseMinWidth: w.
            new baseMinHeight: h.
            new addMorph: (((rowMorph copy color: new color) borderWidth: 1) addMorph:
                 (((columnMorph copy color: new color) borderWidth: 2) addMorph:
                           ((polygonMorph copy) vertices: ((((list copyRemoveAll)
                                                add: (0 @ 0))
                                                add: (6 @ 0))
                                                add: (3 @ 8))))).
            new setSelectedIndex: 0.
            new defaultButtonHolder: dbh.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> 'oldStuff' -> () From: ( | {
         'Category: Audio Activities\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         oldGetSliderColor: color Min: min Max: max Target: target Selector: sel Vertical: vert = ( |
             fm.
             h.
             len.
             o.
             s.
             v.
             w.
            | 
            fm: ((frameMorph copy color: color)
                            frameStyle: (frameMorph insetBezelStyle))
                            beShrinkWrap borderWidth: 2.
            v: vector copyRemoveAll.
            vert ifTrue: [
              w: 10.
              h: (((max - min) + 1) / 3) asInteger.
              len: h.
              o: sliderMorph vertical.
            ] False: [
              w: (((max - min) + 1) / 3) asInteger.
              h: 10.
              len: w.
              o: sliderMorph horizontal.
              v: v copyAddLast:
                    (getHashMarksColor: color
                      Length: len Vertical: vert).
            ].
            v: v copyAddLast:
                    (((((((sliderMorph copy color: color)
                         setWidth: w Height: h) beRigid
                         minValue: min) maxValue: max)
                         target: target) selector: sel)
                         orientation: o).
            vert ifTrue: [
              v: v copyAddLast:
                    (getHashMarksColor: color
                         Length: len Vertical: vert).
              fm addMorph: (((rowMorph copy color: color)
                            borderWidth: 0)
                            addAllMorphs: v).
            ] False: [
              fm addAllMorphs: v.
            ].
            fm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         selectionFrom: button = ( |
            | 
            setSelectedIndex: button buttonArgs first.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> 'parent' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         setSelectedIndex: i = ( |
             mlst.
             own.
            | 
            selectedIndex: ((i max: 0) min: itemDrawables size).
            currentDrawable = nil ifTrue: [
                own: self.
                morphs do: [ | :m |
                    m morphTypeName = rowMorph morphTypeName ifTrue: [
                        own: m.
                    ].
                ].
            ] False: [
                own: currentDrawable owner.
                currentDrawable delete.
            ].
            currentDrawable: (itemDrawables at: selectedIndex) copy.
            own morphs size > 0 ifTrue: [ | v |
                v: vector copyAddLast: currentDrawable.
                own morphs do: [ | :m |
                    v: v copyAddLast: m.
                ].
                own removeAllMorphs.
                own addAllMorphs: v.
            ] False: [
                own addMorph: currentDrawable.
            ].
            notifyTarget.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | frameMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196)\x7fVisibility: private'
        
         rawColor <- paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> () From: ( | {
         'Category: Drawable Morph State\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         selectedIndex <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> () From: ( | {
         'Category: Drawable Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         selector.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> 'enumeratedDrawableMorph' -> () From: ( | {
         'Category: Drawable Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: audioSourceField IsPresentDo: [| :n | audioSourceField: n ].
            dict if: inputField IsPresentDo: [| :n | inputField: n ].
            dict if: outputField IsPresentDo: [| :n | outputField: n ].
            dict if: multicastGroupField IsPresentDo: [| :n | multicastGroupField: n ].
            dict if: portField IsPresentDo: [| :n | portField: n ].
            dict if: ttlField IsPresentDo: [| :n | ttlField: n ].
            dict if: playGainField IsPresentDo: [| :n | playGainField: n ].
            dict if: recordGainField IsPresentDo: [| :n | recordGainField: n ].
            dict if: monitorGainField IsPresentDo: [| :n | monitorGainField: n ].
            dict if: powerField IsPresentDo: [| :n | powerField: n ].
            dict if: receiveField IsPresentDo: [| :n | receiveField: n ].
            dict if: transmitField IsPresentDo: [| :n | transmitField: n ].
            dict if: restrictField IsPresentDo: [| :n | restrictField: n ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'audioPropsMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         playGainField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         portField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         powerField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | subPropertiesSheetMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         receiveField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         recordGainField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         restrictedField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         transmitField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'audioPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         ttlField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         audioWidth = ( |
            | 
            world winCanvases do: [ | :c |
              (c xDisplay serverName asTokensSeparatedByCharactersIn: ':') first 
                = audioSource  ifTrue: [
                   ^ c boundingBoxInWorld size.
                ].
            ].
            ^ 1000).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Activities\x7fComment: Draw the base of this morph on the given canvas.

This method is used to permit adjusting audio volume
based on the location of an audio morph rather than
the position of a window.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: aCanvas = ( |
            | 
            resend.baseDrawOn: aCanvas.
            isOpen ifTrue: [
              globalPosition = oldGlobalPosition ifFalse: [
                world winCanvases do: [| :c |
                  moveCanvas: c From: c boundingBoxInWorld By: 0@0.
                ].
                oldGlobalPosition: globalPosition.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         buildMyEnumeratedFieldDrawables: morphs Values: values InitialValue: v = ( |
             dbh.
             f.
            | 
            dbh: ui2Menu initializeDefaultButtonHolder: dbh.
            f: audioMorph audioPropsMorph enumeratedDrawableMorph 
                  copyItemDrawables: morphs Values: values DefaultButtonHolder: dbh.
            f setSelectedIndex: (values asVector keyAt: v).
            f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         closeAudio = ( |
            | 
            openAudioSessions remove: self IfAbsent: [].
            quit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         closeSocket = ( |
            | 
            (socket != nil) && [socket isOpen] ifTrue: [
              socket close.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: metering\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createAudioMeter = ( |
             fm.
             rm.
            | 
            fm: frameMorph copy.
            fm beShrinkWrap.
            fm color: (paint copyHue: 186 Saturation: 0.444 Brightness: 0.9).
            rm: rowMorph copy.
            rm beRigid.
            rm setWidth: 200.
            rm setHeight: 150.
            bootstrap addSlotsTo: rm From: ( |
                      value <- 0.
                      silenceLevel <- 20.
                      target <- nil.
                      ticks <- list copyRemoveAll.
                      maxTicks <- 63.
                      copy = ( | nm |
                              nm: resend.copy.
                              nm ticks: nm ticks removeAll.
                              nm morphs do: [ | :m |
                                  nm ticks add: m ].
                              nm
                             ).
                      step = ( | nr |
                                target isOpen ifFalse: [^ self].
                                value: (target logEnergy).
                                nr: morph copy.
                                nr setWidth: 3.
                                value > silenceLevel ifTrue: [
                                   nr color: (paint named: 'white').
                                   nr setHeight: (height * value) / 256.
                                ] False: [
                                   nr color: (paint named: 'black').
                                   nr setHeight: 2.
                                ].
                                (ticks size) > maxTicks ifTrue: [ | t |
                                  t: ticks first.
                                  ticks remove: t.
                                  t delete.
                                ].
                                ticks add: nr.
                                addMorph: nr.
                                changed.
                              self
                             ).
                      start = (getSteppedEveryMSecs: 1000. self).
                      stop = (stopGettingStepped. self).
            | ).
            rm target: self.
            fm addMorph: rm.
            rm color: fm color.
            desktop w addMorph: fm.
            monitorLevels.
            rm start.
            fm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (traits ui2Menu defaultButtonHolderPrototype copy)'
        
         defaultButtonHolder <- traits ui2Menu defaultButtonHolderPrototype copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Activities\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         delete = ( |
            | 
            ('delete audioMorph for ', audioSource) printLine.
            resend.delete.
            openAudioSessions do: [ | :a |
              a stopListeningTo: audioSource.
              (a audioSource, ' stopListeningTo: ', audioSource) printLine.
              stopListeningTo: a audioSource.
              (audioSource, ' stopListeningTo: ', a audioSource) printLine.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: control morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getAudioControl = ( |
             cm0.
             cm1.
             cm2.
             ed1.
             ed2.
             fm.
             gray.
             h.
             leaf.
             rm.
             w.
            | 
            gray: (paint named: 'lightGray').
            leaf: (paint named: 'leaf').
            fm: audioControlMorph copy color: gray.
            rm: (rowMorph copy color: gray) borderWidth: 1.
            cm0: (((columnMorph copy color: gray) borderWidth: 1) addAllMorphs:
                 (((((vector copyAddLast:
                           ((getLightButtonColor: gray
                            Target: self 
                            Step: false
                            Script: 'target isOpen ifTrue: [target closeAudio] False: [target openAudio]'
                            OnTest: 'isJoined && isOpen'
                            Vertical: true) label: 'Power'))
                    copyAddLast:
                           (spacerMorph copyH: 5 Color: gray))
                    copyAddLast:
                           (labelMorph copyLabel: audioSource))
                    copyAddLast:
                           (spacerMorph copyH: 5 Color: gray))
                    copyAddLast:
                           (rm))).
            ed1: buildMyEnumeratedFieldDrawables:
                        (getSpeakerMorph & getHeadphoneMorph & getLineOutMorph) asVector
                        Values: ('speaker' & 'headphone' & 'line-out') asVector
                        InitialValue: playPort.
            (ed1 target: self) selector: 'setPlayPortTo:'.
            ed2: buildMyEnumeratedFieldDrawables:
                        (getMicMorph & getLineInMorph) asVector
                        Values: ('microphone' & 'line-in') asVector
                        InitialValue: recordPort.
            (ed2 target: self) selector: 'setRecordPortTo:'.
            " This is to insure the two buttons are the same height. "
            w: ioMorphButtonWidth.
            h: ioMorphButtonHeight.
            (((ed1 beRigid baseMinWidth: w) setWidth: w) baseMinHeight: h) setHeight: h.
            (((ed2 beRigid baseMinWidth: w) setWidth: w) baseMinHeight: h) setHeight: h.
            cm1: ((columnMorph copy color: gray) borderWidth: 1) centerJustify
                 addAllMorphs:
                 (((((vector copyAddLast: ed1)
                    copyAddLast:
                           (spacerMorph copyH: 5 Color: gray))
                    copyAddLast:
                           (getLightButtonColor: gray
                            Target: self
                            Script: 'target isReceiving ifTrue: [target receiveOff] False: [target receiveOn]'
                            OnTest: 'isJoined && isReceiving'
                            Vertical: true))
                    copyAddLast:
                           (spacerMorph copyH: 5 Color: gray))
                    copyAddLast:
                           (getSliderColor: gray Min: 0 Max: 255
                            Target: self Selector: 'setPlayGainTo:'
                            Vertical: true)).
            cm2: ((columnMorph copy color: gray) borderWidth: 1) centerJustify
                 addAllMorphs:
                 (((((vector copyAddLast: ed2)
                    copyAddLast:
                           (spacerMorph copyH: 15 Color: gray))
                    copyAddLast:
                           (getLightButtonColor: gray
                            Target: self
                            Script: 'target isTransmitting ifTrue: [target transmitOff] False: [target transmitOn]'
                            OnTest: 'isJoined && isTransmitting'
                            Vertical: true))
                    copyAddLast:
                           (spacerMorph copyH: 5 Color: gray))
                    copyAddLast:
                           (getSliderColor: gray Min: 0 Max: 255
                            Target: self Selector: 'setRecordGainTo:'
                            Vertical: true)).
            rm addAllMorphs: ((vector copyAddLast:
                                 cm1)
                          copyAddLast:
                                 cm2).
            fm addMorph: cm0.
            fm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: copying\x7fComment: Gets an audioMorph in a frame with an image
and On / Off buttons.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getAudioMorph = ( |
             am.
             cm.
             fm.
             im.
             rm.
            | 
            fm: frameMorph copy.
            cm: columnMorph copy.
            rm: rowMorph copy.
            am: audioMorph copy.
            fm addMorph: cm.
            cm addMorph: rm.
            cm addMorph: am.
            fm colorAll: (paint named: 'lightGray').
            am addMorph: ('headset2.morph.self' runScript).
            cm addMorph: ((labelMorph copy) label: 'Audio').
            rm addMorph: ((((ui2Button copy) label: 'Off')
                             script: 'target closeAudio') target: am).
            rm addMorph: ((((ui2Button copy) label: 'On')
                             script: 'target openAudio') target: am).
            am beShrinkWrap.
            rm beShrinkWrap.
            cm beShrinkWrap.
            fm beShrinkWrap.
            fm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: copying\x7fComment: Gets an audioMorph in a frame with a
headset image and On / Off buttons.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getAudioMorphFor: host = ( |
            | 
            getAudioMorphFor: host
               Image: ('headset2.morph.self' runScript)
               Label: (getNameForHost: host)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: copying\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getAudioMorphFor: host Image: im Label: lbl = ( |
             am.
             cm.
             fm.
             rm.
            | 
            fm: frameMorph copy.
            cm: columnMorph copy.
            rm: rowMorph copy.
            am: audioMorph copy.
            fm addMorph: cm.
            cm addMorph: rm.
            cm addMorph: am.
            fm colorAll: (paint named: 'lightGray').
            am addMorph: (im).
            am audioSource: host.
            cm addMorph: ((labelMorph copy) label: lbl).
            rm addMorph: ((((ui2Button copy) label: 'Off')
                             script: 'target closeAudio') target: am).
            rm addMorph: ((((ui2Button copy) label: 'On')
                             script: 'target openAudio') target: am).
            am beShrinkWrap.
            rm beShrinkWrap.
            cm beShrinkWrap.
            fm beShrinkWrap.
            fm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: control morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getControlsInNewWorld = ( |
            | 
            audioControl getControlsInNewWorld).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: control morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getHashMarksColor: color Length: len Vertical: vert = ( |
             black.
             fm.
             marks <- 9.
             sl.
             v.
            | 
            black: (paint named: 'black').
            (len / 8) < 5 ifTrue: [marks: 5].
            sl: (((len - (marks * 2)) / (marks - 1)) - 1) asInteger.
            v: vector copyRemoveAll.
            vert ifTrue: [
              v: v copyAddLast: (spacerMorph copyV: 2 Color: color).
            ] False: [
              v: v copyAddLast: (spacerMorph copyH: 2 Color: color).
            ].
            1 to: marks Do: [ | :i. m. l |
              m: morph copy beRigid.
              i odd ifTrue: [ l: 6 ] False: [ l: 3 ].
              vert ifTrue: [
                m setWidth: l Height: 2.
              ] False: [
                m setWidth: 2 Height: l.
              ].
              (((marks - 1) / 2) + 1) = i ifTrue: [
                m color: (paint named: 'red').
              ] False: [
                m color: black.
              ].
              v: v copyAddLast: m.
              i < marks ifTrue: [
                vert ifTrue: [
                  v: v copyAddLast: (spacerMorph copyV: sl Color: color).
                ] False: [
                  v: v copyAddLast: (spacerMorph copyH: sl Color: color).
                ].
              ].
            ].
            fm: ((frameMorph copy beRigid color: color) leftJustify
                  frameStyle: frameMorph flatStyle) borderWidth: 0.
            vert ifTrue: [
              fm setWidth: 8 Height: len.
              fm addAllMorphs: v.
            ] False: [
              fm setWidth: len Height: 8.
              fm addMorph: (((rowMorph copy color: color) bottomJustify
                              borderWidth: 0) addAllMorphs: v).
            ].
            fm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: input output morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getHeadphoneMorph = ( |
             vs.
            | 
            vs: list copyRemoveAll.
            vs add: (2 @ 15).
            vs add: (0 @ 12).
            vs add: (0 @ 7).
            vs add: (2 @ 5).
            vs add: (2 @ 3).
            vs add: (6 @ 0).
            vs add: (10 @ 0).
            vs add: (14 @ 3).
            vs add: (14 @ 5).
            vs add: (16 @ 7).
            vs add: (16 @ 12).
            vs add: (14 @ 15).
            vs add: (12 @ 15).
            vs add: (12 @ 4).
            vs add: (8 @ 0).
            vs add: (4 @ 4).
            vs add: (4 @ 15).
            (((polygonMorph copy) vertices: vs) color: (paint named: 'black'))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: control morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getHorizontalAudioControl = ( |
             cm.
             ed1.
             ed2.
             fm.
             gray.
             h.
             leaf.
             rm0.
             rm1.
             rm2.
             w.
            | 
            gray: (paint named: 'lightGray').
            leaf: (paint named: 'leaf').
            fm: frameMorph copy color: gray.
            cm: (columnMorph copy color: gray) borderWidth: 1.
            fm addMorph: cm.
            ed1: buildMyEnumeratedFieldDrawables:
                       (getSpeakerMorph & getHeadphoneMorph & getLineOutMorph) asVector
                       Values: ('speaker' & 'headphone' & 'line-out') asVector
                       InitialValue: playPort.
            (ed1 target: self) selector: 'setPlayPortTo:'.
            ed2: buildMyEnumeratedFieldDrawables:
                        (getMicMorph & getLineInMorph) asVector
                        Values: ('microphone' & 'line-in') asVector
                        InitialValue: recordPort.
            (ed2 target: self) selector: 'setRecordPortTo:'.
            " This is to insure the two buttons are the same height. "
            w: ioMorphButtonWidth.
            h: ioMorphButtonHeight.
            (((ed1 beRigid baseMinWidth: w) setWidth: w) baseMinHeight: h) setHeight: h.
            (((ed2 beRigid baseMinWidth: w) setWidth: w) baseMinHeight: h) setHeight: h.
            rm0: (((rowMorph copy color: gray) borderWidth: 1) addAllMorphs:
                 ((((vector copyAddLast:
                           ((getLightButtonColor: gray
                            Target: self Script: 'target mute'
                            OnTest: 'isJoined && isOpen'
                            Vertical: false) label: 'Power'))
                    copyAddLast:
                           (spacerMorph copy beFlexible color: gray))
                    copyAddLast:
                           (labelMorph copyLabel: audioSource))
                    copyAddLast:
                           (spacerMorph copy beFlexible color: gray))).
            rm1: ((rowMorph copy color: gray) borderWidth: 1) addAllMorphs:
                 (((((vector copyAddLast: ed1)
                    copyAddLast:
                           (spacerMorph copyH: 5 Color: gray))
                    copyAddLast:
                           (getLightButtonColor: gray
                            Target: self Script: 'target mute'
                            OnTest: 'isJoined && isReceiving'
                            Vertical: false))
                    copyAddLast:
                           (spacerMorph copyH: 5 Color: gray))
                    copyAddLast:
                           (getSliderColor: gray Min: 0 Max: 255
                            Target: self Selector: 'setPlayGainTo:'
                            Vertical: false)).
            rm2: ((rowMorph copy color: gray) borderWidth: 1) addAllMorphs:
                 (((((vector copyAddLast: ed2)
                    copyAddLast:
                           (spacerMorph copyH: 5 Color: gray))
                    copyAddLast:
                           (getLightButtonColor: gray
                            Target: self Script: 'target transmitOff'
                            OnTest: 'isJoined && isTransmitting'
                            Vertical: false))
                    copyAddLast:
                           (spacerMorph copyH: 5 Color: gray))
                    copyAddLast:
                           (getSliderColor: gray Min: 0 Max: 255
                            Target: self Selector: 'setRecordGainTo:'
                            Vertical: false)).
            cm addAllMorphs: (((vector copyAddLast:
                                 rm0)
                          copyAddLast:
                                 rm1)
                          copyAddLast:
                                 rm2).
            fm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: control morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getLightButtonColor: color Target: target Script: sc OnTest: test Vertical: vert = ( |
            | 
            getLightButtonColor: color Target: target Step: false Script: sc OnTest: test Vertical: vert).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: control morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getLightButtonColor: color Target: target Step: step Script: sc OnTest: test Vertical: vert = ( |
             b.
            | 
            b: (((ui2Button copyColor: color Target: self)
                  beFlexibleHorizontally beShrinkWrapVertically)
                  script: sc).
            vert ifTrue: [
                b beFlexibleHorizontally beShrinkWrapVertically.
            ] False: [
                b beShrinkWrapHorizontally beFlexibleVertically.
            ].
            b addMorph: (((((frameMorph copy) color: color) borderWidth: 1)
                             frameStyle: (frameMorph insetBezelStyle))
                             addMorph: ((((lightMorph copy target: target)
                                          expression: test) doStepping: step))).
            b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: input output morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getLineInMorph = ( |
             black.
             c1.
             c2.
             pm.
             vs.
            | 
            black: (paint named: 'black').
            vs: list copyRemoveAll.
            vs add: (4 @ 0).
            vs add: (8 @ 5).
            vs add: (5 @ 5).
            vs add: (5 @ 14).
            vs add: (3 @ 14).
            vs add: (3 @ 5).
            vs add: (0 @ 5).
            pm: (polygonMorph copy vertices: vs) color: black.
            c1: (circleMorph copy radius: 8) color: black.
            c2: (circleMorph copy radius: 6) color: (paint named: 'lightGray').
            c1 addMorph: c2.
            c2 position: (0 @ 0).
            c2 addMorph: pm.
            pm position: (0 @ -3).
            c1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: input output morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getLineOutMorph = ( |
             black.
             c1.
             c2.
             pm.
             vs.
            | 
            black: (paint named: 'black').
            vs: list copyRemoveAll.
            vs add: (3 @ 0).
            vs add: (3 @ 9).
            vs add: (0 @ 9).
            vs add: (4 @ 14).
            vs add: (8 @ 9).
            vs add: (5 @ 9).
            vs add: (5 @ 0).

            pm: (polygonMorph copy vertices: vs) color: black.
            c1: (circleMorph copy radius: 8) color: black.
            c2: (circleMorph copy radius: 6) color: (paint named: 'lightGray').
            c1 addMorph: c2.
            c2 position: (0 @ 0).
            c2 addMorph: pm.
            pm position: (-1 @ 0).
            c1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: input output morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getMicMorph = ( |
             vs.
            | 
            vs: list copyRemoveAll.
            vs add: (2 @ 0).
            vs add: (6 @ 0).
            vs add: (8 @ 2).
            vs add: (8 @ 6).
            vs add: (7 @ 7).
            vs add: (12 @ 14).
            vs add: (12 @ 17).
            vs add: (5 @ 7).
            vs add: (3 @ 8).
            vs add: (1 @ 6).
            vs add: (0 @ 4).
            vs add: (0 @ 2).
            ((polygonMorph copy vertices: vs) color: (paint named: 'black'))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: copying\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getNameForHost: host = ( |
            | 
            desktop w hands do: [ | :h |
              (h userInfo displayHostName) = host ifTrue: [
                ^ (h userInfo preferredName).
              ].
            ].
            ^ host).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: copying\x7fComment: Gets an audioMorph in a frame with a
radio image and On / Off buttons.
Also sets audio input to line-in
and label to \'Radio\'.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getRadioMorphFor: host = ( |
             fm.
            | 
            fm: getAudioMorphFor: host
                Image: ('radio.morph.self' runScript)
                Label: 'Radio'.
            fm allMorphs do: [ | :m |
              (m morphTypeName) = 'audioMorph' ifTrue: [
                m recordPort: 'line-in'.
              ].
            ].
            fm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: control morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getSliderColor: color Min: min Max: max Target: target Selector: sel Vertical: vert = ( |
             fm.
             h.
             len.
             o.
             sm.
             v.
             w.
            | 
            fm: ((frameMorph copy color: color)
                            frameStyle: (frameMorph insetBezelStyle))
                            beShrinkWrap borderWidth: 2.
            v: vector copyRemoveAll.
            vert ifTrue: [
              w: 10.
              h: (((max - min) + 1) / 3) asInteger.
              len: h.
              o: sliderMorph vertical.
              sm: (rowMorph copy color: color) borderWidth: 0.
            ] False: [
              w: (((max - min) + 1) / 3) asInteger.
              h: 10.
              len: w.
              o: sliderMorph horizontal.
              sm: (columnMorph copy color: color) borderWidth: 0.
              v: v copyAddLast:
                    (getHashMarksColor: color
                      Length: len Vertical: vert).
            ].
            fm addMorph: 
                    (((((((sliderMorph copy color: color)
                         setWidth: w Height: h) beRigid
                         minValue: min) maxValue: max)
                         target: target) selector: sel)
                         orientation: o).
            v: v copyAddLast: fm.
            vert ifTrue: [
              v: v copyAddLast:
                    (getHashMarksColor: color
                         Length: len Vertical: vert).
            ].
            sm beShrinkWrap addAllMorphs: v.
            sm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: input output morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getSpeakerMorph = ( |
             vs.
            | 
            vs: list copyRemoveAll.
            vs add: (0 @ 0).
            vs add: (5 @ 5).
            vs add: (8 @ 6).
            vs add: (8 @ 9).
            vs add: (5 @ 10).
            vs add: (0 @ 15).
            ((polygonMorph copy vertices: vs) color: (paint named: 'black'))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: copying\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getSpeakerMorphFor: host = ( |
             fm.
            | 
            fm: getAudioMorphFor: host
                Image: ('mic-spkr.morph.self' runScript)
                Label: (getNameForHost: host).
            fm allMorphs do: [ | :m |
              (m morphTypeName) = 'audioMorph' ifTrue: [
                m playPort: 'speaker'.
              ].
            ].
            fm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: Opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         initSocket = ( |
            | 
            totalBytes: 0.
            audioSource = '' ifTrue: [
              error: 'audioSource not specified'.
            ] False: [
              socket: (os_file openTCPHost: audioSource Port: controlPort IfFail: [ | :err |
                  ('audioMorph connection failed, check for DTVI process on ',
                    audioSource) printLine.
                  socket: nil.
                  ^ self.
                ].
              ).
              sendLine: ('name=audioMorph:', audioSource, '\n').
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: control morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         ioMorphButtonHeight = ( |
             h.
             mlist.
            | 
            " Set minimum height to hold largest morphs "
            mlist: (getSpeakerMorph & getHeadphoneMorph & getLineOutMorph &
               getMicMorph & getLineInMorph) asVector.
            h: mlist first bounds height.
            mlist do: [ | :m |
                h < m bounds height ifTrue: [
                     h: m bounds height.
                ].
            ].
            h: h + 6.
            ^ h).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: control morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         ioMorphButtonWidth = ( |
             mlist.
             w.
            | 
            " Set minimum width to hold largest morphs "
            mlist: (getSpeakerMorph & getHeadphoneMorph & getLineOutMorph &
               getMicMorph & getLineInMorph) asVector.
            w: mlist first bounds width.
            mlist do: [ | :m |
                w < m bounds width ifTrue: [
                     w: m bounds width.
                ].
            ].
            w: w + 24.
            ^ w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         join = ( |
            | 
            (socket != nil) && [socket isOpen] ifFalse: [
              initSocket.
              socket = nil ifTrue: [
                ^ self.
              ].
              socket isOpen ifFalse: [
                ^ self.
              ].
            ].
            isOpen ifFalse: [
              openAudio.
            ].
            send: 'join ', audioSource, ' ', multicastGroup,
                  ':', port printString.
            send: 'set ', audioSource, '(ttl) ', ttl printString.
            isJoined: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         leave = ( |
            | 
            send: 'leave'.
            isJoined: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: control morphs\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         lightMorph = bootstrap define: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'borderWidth' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals columnMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals audioMorph parent lightMorph.

CopyDowns:
globals columnMorph. copyRemoveAllMorphs 
SlotsToOmit: borderWidth parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         borderWidth <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> () From: ( | {
         'Category: Light Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (false)'
        
         doStepping <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> () From: ( | {
         'Category: Light Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         expression.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         filled <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         frameStyle <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> () From: ( | {
         'Category: Light Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (false)'
        
         isStepping <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> () From: ( | {
         'Category: Light Morph State\x7fComment: In a non-XIL world the color was
paint copyRed: 0.05 Green 0.6 Blue: 0.3.\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (paint named: \'black\')'
        
         lightOffColor <- paint named: 'black'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> () From: ( | {
         'Category: Light Morph State\x7fComment: In a non-XIL world the color was
paint copyRed: 0.1 Green 1.0 Blue: 0.57.\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (paint named: \'leaf\')'
        
         lightOnColor <- paint named: 'leaf'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals audioMorph parent lightMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> 'parent' -> () From: ( | {
         'Comment: Make sure it is stepping 
if it is in a world\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            resend.baseDrawOn: c.
            isStepping ifTrue: [
              ^ self.
            ].
            doStepping ifTrue: [
              getSteppedEveryMSecs: 1000.
              isStepping: true.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> 'parent' -> () From: ( | {
         'Comment: Stop stepping when deleted\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | 
            isStepping ifTrue: [
              stopGettingStepped.
              isStepping: false.
            ].
            resend.delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         morphTypeName = 'audioLightMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         step = ( |
            | 
            nil = target ifFalse: [
              (expression evalInContext: (reflect: target)
                 FileName: '<eval lightButton>'
                 IfFail: [
                   stopGettingStepped.
                   ^ self.
                 ] asString)
              ifTrue: [
                   color: lightOnColor.
              ] False: [
                   color: lightOffColor.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | frameMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196)\x7fVisibility: private'
        
         rawColor <- paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> 'lightMorph' -> () From: ( | {
         'Category: Light Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         listen = ( |
            | 
            send: 'mute off'.
            isTransmitting: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         listenTo: aHost = ( |
            | 
            listenTo: aHost Level: 100).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         listenTo: aHost Level: level = ( |
             ah.
             ipstr.
             lv.
             oldlv.
            | 
            aHost = audioSource ifTrue: [
              ^ self.
            ].
            isJoined ifTrue: [
              " level is 1 - 100, we must convert it to 31 - 0 "
              lv: (32 - ((32 * level) /= 100)) asInteger.
              lv >= 32 ifTrue: [
                stopListeningTo: aHost.
                ^ self.
              ].
              " drop self to get around multicast loopback "
              aHost = audioSource ifTrue: [
                stopListeningTo: aHost.
                ^ self.
              ].
              ipstr: nil.
              listeningTo do: [ | :ah |
                (ah hostName) = aHost ifTrue: [
                  oldlv: ah audioLevel.
                  ah audioLevel: lv.
                  ah level: level.
                  ipstr: ah ipAddr.
                ].
              ].
              ipstr = nil ifTrue: [
                "add a new entry."
                ah: audioHost copy.
                ah hostName: aHost.
                ah ipAddr: (stringForHost: aHost).
                ah level: level.
                listeningTo add: ah.
                oldlv: nil.
                ipstr: ah ipAddr.
              ].
              oldlv = lv ifFalse: [
                send: ' ; listento ', ipstr, ' ', lv printString.
              ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: mouse\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         middleMouseDown: evt = ( |
            | 
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: metering\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         monitorLevels = ( |
            | 
            send: ('levelfeedback audioLevelFeedbackFor:',
                   audioSource, ' 152.70.20.132:10035').
            send: 'set energyfeedbackinteval 3'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Activities\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         morphTypeName = 'audioMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         moveCanvas: aCanvas From: aBoundingBox By: delta = ( |
             d1sq.
             d2sq.
             level.
             movehost.
             rsq.
            | 

            isOpen ifFalse: [
              ^ self.
            ].
            movehost: (aCanvas xDisplay serverName asTokensSeparatedByCharactersIn: ':') first.
            openAudioSessions do: [ | :a |
              (((a audioSource) = movehost) && (a isInWorld)) ifTrue: [
                  rsq: (((a audioGlobalPosition) translateBy: (delta negate))
                           - audioGlobalPosition ) square.
                  d1sq: a audioWidth square.
                  d2sq:   audioWidth square. 
                  level: 100.0 * ( (d1sq + d2sq) /= (d1sq + d2sq + ( 8 * rsq))).
                  a listenTo: audioSource Level: level. 
                  listenTo: movehost Level: level. 
                  ^ self.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         mute = ( |
            | 
            isTransmitting: false.
            send: 'mute on'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: Opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         openAudio = ( |
             str.
            | 
            (socket != nil) && [socket isOpen] ifFalse: [
              initSocket.
              socket = nil ifTrue: [
                ^ self.
              ].
              socket isOpen ifFalse: [
                ^ self.
              ].
            ].
            audioSource != '' ifTrue: [
              openAudioSessions add: self.
              startAudioOn: audioSource.
              isOpen: true.
              join.
              receiveOn.
              transmitOn.
              isRestricted ifTrue: [
                listeningTo do: [ | :ah |
                  send: ' ; listento ', (ah ipAddr), ' ', (ah audioLevel printString).
                  str: ah hostName, ' ', ah ipAddr, ' ',
                       ah level printString, ' ',
                       ah audioLevel printString.
                  str printLine.
                ].
                restrictListening: true.
                " drop self to get around multicast loopback "
                stopListeningTo: audioSource.
              ].
            ] False: [
              error: 'audioSource not specified'.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: Opening\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (sequence copyRemoveAll)'
        
         openAudioSessions <- sequence copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: mouse\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu addButtonTarget: self Script: 'event sourceHand attach: (target getAudioControl)' Label: 'Audio Control'.
            isOpen ifTrue: [
              menu addButtonTarget: self Script: 'target restart' Label: 'Restart'.
              menu addButtonTarget: self Script: 'target closeAudio' Label: 'Close'.
              menu addDivider.
              isReceiving ifTrue: [
                menu addButtonTarget: self Script: 'target receiveOff'  Label: 'Stop Receiving'.
              ] False: [
                menu addButtonTarget: self Script: 'target receiveOn'  Label: 'Start Receiving'.
              ].
              menu addButtonTarget: self Script: 'target setPlayPortTo: \'speaker\'' Label: 'Speakers'.
              menu addButtonTarget: self Script: 'target setPlayPortTo: \'headphone\'' Label: 'Headphones'.
              menu addButtonTarget: self Script: 'target setPlayPortTo: \'line-out\'' Label: 'Line Out'.
              menu addDivider.
              isTransmitting ifTrue: [
                menu addButtonTarget: self Script: 'target transmitOff'  Label: 'Stop Transmitting'.
              ] False: [
                menu addButtonTarget: self Script: 'target transmitOn'  Label: 'Start Transmitting'.
              ].
              menu addButtonTarget: self Script: 'target setRecordPortTo: \'microphone\'' Label: 'Microphone'.
              menu addButtonTarget: self Script: 'target setRecordPortTo: \'line-in\'' Label: 'Line In'.
            ] False: [
              menu addButtonTarget: self Script: 'target openAudio' Label: 'Open'.
            ].
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            menu colorAll: menu color.
            menu popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Activities\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         propertySheets = ( |
            | 
            resend.propertySheets copyAddLast: 
                (audioPropsMorph copyTarget: self)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         quit = ( |
            | 
            leave.
            send: 'quit'.
            closeSocket.
            isOpen: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         receiveOff = ( |
            | 
            isReceiving: false.
            send: 'receive off'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         receiveOn = ( |
            | 
            send: 'receive on'.
            isReceiving: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: Opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         restart = ( |
            | 
            closeAudio.
            times delay: 100.  " Give it time to finish. "
            openAudio.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         restrictListening: trueFalse = ( |
            | 
            isJoined ifTrue: [
              trueFalse ifTrue: [
                (listeningTo size) == 0 ifTrue: [
                  openAudioSessions do: [ | :target |
                    openAudioSessions do: [ | :source |
                      target != source ifTrue: [
                        target listenTo: (source audioSource).
                      ].
                    ].
                  ].
                ].
                send: 'restrict on'.
              ] False: [
                send: 'restrict off'.
              ].
            ].
            isRestricted: trueFalse.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: sending\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         send: str = ( |
            | 
            sendLine: ('routeto=audio ', str, '\n')).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: sending\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         sendLine: str = ( |
            | 
            (socket != nil) && [socket isOpen] ifTrue: [
              " socket write:IfFail returns number of bytes transferred. "
              totalBytes: totalBytes +
                (socket write: str IfFail: [ | :err |
                  ('Error ', err printString,
                    ' writing to audio via DTVI process on ',
                    audioSource) printLine.
                  closeSocket.
                  ^ self.
                ]).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         setMonitorGainTo: n = ( |
            | 
            send: 'setgain monitor ', (n asInteger) printString.
            monitorGain: n asInteger.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         setPlayGainTo: n = ( |
            | 
            send: 'setgain play ', (n asInteger) printString.
            playGain: n asInteger.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         setPlayPortTo: str = ( |
            | 
            (str = 'speaker') || (str = 'headphone') ||
              (str = 'line-out') ifTrue: [ 
                send: 'setport play ', str.
                playPort: str.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         setRecordGainTo: n = ( |
            | 
            send: 'setgain record ', (n asInteger) printString.
            recordGain: n asInteger.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         setRecordPortTo: str = ( |
            | 
            (str = 'microphone') || (str = 'line-in') ifTrue: [ 
                send: 'setport record ', str.
                recordPort: str.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: Opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         startAudioOn: aHost = ( |
            | 
            (socket != nil) && [socket isOpen] ifTrue: [
              aHost = '' ifTrue: [
                error: 'audioSource not specified'.
              ] False: [
                sendLine: 'fork=audio ./rttap\n'.
                isOpen: true.
              ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         stopListeningTo: aHost = ( |
             ipstr.
            | 
            isJoined ifTrue: [
              ipstr: stringForHost: aHost.
              listeningTo do: [ | :ah |
                ah = nil ifFalse: [
                  (ah hostName) = aHost ifTrue: [
                    send: 'drop ', ah ipAddr.
                    listeningTo remove: ah.
                  ].
                ].
              ]. 
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         stringForHost: aHost = ( |
             ip.
             ipstr.
            | 
            " CAVEAT: Using first IP address only
              on the premise clients have only one.
              There is no guarantee it will match
              the address in the audio messages. "
            ip: ((os hostAddressesForName: aHost) first).
            ipstr: (ip at: 0) printString, '.',
                   (ip at: 1) printString, '.',
                   (ip at: 2) printString, '.',
                   (ip at: 3) printString.
            ipstr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         transmitOff = ( |
            | 
            isTransmitting: false.
            send: 'transmit off'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> 'parent' -> () From: ( | {
         'Category: Audio Activities\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         transmitOn = ( |
            | 
            isTransmitting: true.
            send: 'transmit on'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0)'
        
         playGain <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'headphone\')'
        
         playPort <- 'headphone'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (10033)'
        
         port <- 10033.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            audioMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0)'
        
         recordGain <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'microphone\')'
        
         recordPort <- 'microphone'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         socket.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0)'
        
         totalBytes <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'audioMorph' -> () From: ( | {
         'Category: Audio Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (16)'
        
         ttl <- 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fCategory: avExtensions\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         bradyBunchMorph = bootstrap define: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'borderWidth' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals columnMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals bradyBunchMorph.

CopyDowns:
globals columnMorph. copyRemoveAllMorphs 
SlotsToOmit: borderWidth parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> () From: ( | {
         'Category: Brady Bunch State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         across.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> () From: ( | {
         'Category: Brady Bunch State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (sequence copy)'
        
         bbVideoMorphs <- sequence copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         borderWidth <- 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> () From: ( | {
         'Category: Brady Bunch State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'JPeg\')'
        
         compression <- 'JPeg'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> () From: ( | {
         'Category: Brady Bunch State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         down.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         filled <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> () From: ( | {
         'Category: Brady Bunch State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0)'
        
         firstChannel <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         frameStyle <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> () From: ( | {
         'Category: Brady Bunch State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (8)'
        
         lastChannel <- 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals bradyBunchMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'Category: Brady Bunch Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createBradyBunch = ( |
            | 
            createBradyBunchWithNames: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'Category: Brady Bunch Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createBradyBunch: x By: y = ( |
            | 
            " Use the values from the default bradyBunchMorph
              so we can make a global change only once. "
            createBradyBunch: x By: y
              From: (bradyBunchMorph firstChannel)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'Category: Brady Bunch Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createBradyBunch: x By: y From: firstchan = ( |
            | 
            " Use the values from the default bradyBunchMorph
              so we can make a global change only once. "
            createBradyBunch: x By: y From: firstchan
              To: (firstchan + ((x * y) - 1))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'Category: Brady Bunch Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createBradyBunch: x By: y From: firstchan To: lastchan = ( |
            | 
            " Use the values from the default bradyBunchMorph
              so we can make a global change only once. "
            createBradyBunch: x By: y From: firstchan
              To: lastchan
              Scale: (bradyBunchMorph scale)
              Compression: (bradyBunchMorph compression)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'Category: Brady Bunch Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createBradyBunch: x By: y From: firstchan To: lastchan Scale: scl Compression: cp = ( |
             bb.
             chan.
             col.
             row.
             vm.
            | 
            bb: bradyBunchMorph copy.
            bb across: x.
            bb down: y.
            bb firstChannel: firstchan.
            bb lastChannel: lastchan.
            bb scale: scl.
            bb compression: cp.
            bb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'Category: Brady Bunch Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createBradyBunch: x By: y Scale: scl = ( |
            | 
            " Use the values from the default bradyBunchMorph
              so we can make a global change only once. "
            createBradyBunch: x By: y From: 0 To: (x * y)
              Scale: scl
              Compression: (bradyBunchMorph compression)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'Category: Brady Bunch Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createBradyBunchWithNames: with = ( |
             chan.
             col.
             row.
             vm.
            | 
            chan: firstChannel.
            col: columnMorph copy.
            addMorph: col.
            col color: color.
            " desktop w addMorph: self. "
            1 to: down Do: [
              row: rowMorph copy.
              col addMorph: row.
              row color: color.
              1 to: across Do: [ | rcol |
                rcol: columnMorph copy.
                rcol color: color.
                row addMorph: rcol.
                vm: videoMorph copy.
                bbVideoMorphs add: vm.
                vm compression: compression.
                vm scale: scale.
                vm channelNumber: chan.
                rcol addMorph: vm.
                with ifTrue: [
                  rcol addMorph: (labelMorph copy label: (getNameForChannel: chan)).
                ].
                chan: chan + 1.
                chan > lastChannel ifTrue: [
                  videoMorph repositionWindows.
                  ^ self.
                ].
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'Category: Brady Bunch Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createNamedBradyBunch = ( |
            | 
            createBradyBunchWithNames: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | 
            deleteBradyBunch. 
            resend.delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'Category: Brady Bunch Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         deleteBradyBunch = ( |
            | 
            bbVideoMorphs do: [ | :vm |
              vm closeVideo.
              vm delete.
            ].
            bbVideoMorphs removeAll.
            morphsReverseDo: [ | :m |
              m delete.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (vector cloneSize: 20)'
        
         fakeNames <- vector cloneSize: 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'Category: Brady Bunch Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getNameForChannel: chan = ( |
            | 
            videoTransmitterMorph transmitters do: [ | :tm |
              ((tm channelNumber) = (chan)) ifTrue: [
                world hands do: [ | :h |
                  (h userInfo displayHostName) = (tm videoSource) ifTrue: [
                    ^ (h userInfo preferredName).
                  ].
                ].
                ^ videoSource.
              ].
            ].
            ^ 'No Transmitter Active').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         morphTypeName = 'bradyBunchMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'Category: Brady Bunch Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         scaleBradyBunchTo: n = ( |
            | 
            bbVideoMorphs reverseDo: [ | :vm |
              videoTransmitterMorph transmitters do: [ | :tm |
                ((tm channelNumber) = (vm channelCurrent)) ifTrue: [
                  tm scale: n.
                  tm newScale.
                ].
              ].
              vm scale: n.
              vm newScale.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'Category: Brady Bunch Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         scaleDownBradyBunch = ( |
            | 
            bbVideoMorphs reverseDo: [ | :vm |
              videoTransmitterMorph transmitters do: [ | :tm |
                ((tm channelNumber) = (vm channelCurrent)) ifTrue: [
                  tm scaleDown.
                ].
              ].
              vm scaleDown.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'Category: Brady Bunch Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         scaleUpBradyBunch = ( |
            | 
            bbVideoMorphs reverseDo: [ | :vm |
              videoTransmitterMorph transmitters do: [ | :tm |
                ((tm channelNumber) = (vm channelCurrent)) ifTrue: [
                  tm scaleUp.
                ].
              ].
              vm scaleUp.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         useFakeNames = ( |
            | 
            0 to: ((world hands size) - 1) Do: [ | :i |
              (world hands at: i) userInfo preferredName: (fakeNames at: i).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | frameMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196)\x7fVisibility: private'
        
         rawColor <- paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bradyBunchMorph' -> () From: ( | {
         'Category: Brady Bunch State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (2)'
        
         scale <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fCategory: avExtensions\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         dtviMorph = bootstrap define: bootstrap stub -> 'globals' -> 'dtviMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'borderWidth' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals dtviMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: borderWidth parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (sequence copyRemoveAll)'
        
         activeParticipants <- sequence copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Audio Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (10033)'
        
         audioPort <- 10033.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Audio\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         audioPortField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         borderWidth <- 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Video\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         colorField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Video Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'high\')'
        
         colorLevel <- 'high'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Video Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'JPeg\')'
        
         compression <- 'JPeg'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Video\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         compressionField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Video Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (1)'
        
         currentChannel <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Video Setup State\x7fComment: Name of the video device to use.
Present to allow a host to have multiple
video transmitters active.\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'/dev/rtvc0\')'
        
         deviceName <- '/dev/rtvc0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Video\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         deviceNameField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Video Setup State\x7fComment: 1 = composite port 1
2 = composite port 2
0 = S-VHS port\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (1)'
        
         devicePort <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Video\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         devicePortField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (false)'
        
         expertMode <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Video Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (1)'
        
         firstChannel <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Video\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         firstChannelField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Video\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         frameRateField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Audio\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         inputField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Audio Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (false)'
        
         isRestricted <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Layout\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         labelField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Layout Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         layout.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Layout\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         layoutField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Layout\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         layoutRatioField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Layout Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (2)'
        
         minFromBorder <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Layout\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         minFromBorderField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Audio Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0)'
        
         monitorGain <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Audio\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         monitorGainField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Network Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'238.0.0.2\')'
        
         multicastGroup <- '238.0.0.2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Network\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         multicastGroupField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Audio\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         outputField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals dtviMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Audio\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptAudioPropertyChanges = ( |
            | 
            target audioPort: (contentsOfTextField: audioPortField) eval. "to parse float or int"
            target recordPort: (contentsOfEnumeratedField: inputField).
            target playPort: (contentsOfEnumeratedField: outputField).
            target playGain: (contentsOfTextField: playGainField) eval.
            target recordGain: (contentsOfTextField: recordGainField) eval.
            target monitorGain: (contentsOfTextField: monitorGainField) eval.
            target isRestricted: (contentsOfEnumeratedField: restrictedField).
            target receive: (contentsOfEnumeratedField: receiveField).
            target transmit: (contentsOfEnumeratedField: transmitField).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Layout\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         acceptLayoutPropertyChanges = ( |
            | 
            target ratioHorizontalToVertical: (contentsOfTextField: layoutRatioField) eval. "to parse float or int"
            target minFromBorder: (contentsOfTextField: minFromBorderField) eval. "to parse float or int"
            target layout: (contentsOfEnumeratedField: layoutField).
            target withLabel: (contentsOfEnumeratedField: labelField).
            target sWidth: (640 / (contentsOfEnumeratedField: scaleField)) + minFromBorder.
            target sHeight: ((480 / (contentsOfEnumeratedField: scaleField)) + minFromBorder) + 25.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Network\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptNetPropertyChanges = ( |
            | 
            target multicastGroup: (contentsOfTextField: multicastGroupField).
            target ttl: (contentsOfTextField: ttlField) eval. "to parse float or int"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Video\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptVideoPropertyChanges = ( |
            | 
            target firstChannel: (contentsOfTextField: firstChannelField) eval. "to parse float or int"
            (target activeParticipants size) = 0 ifTrue: [
              target currentChannel: target firstChannel.
            ].
            target videoPort: (contentsOfTextField: videoPortField) eval. "to parse float or int"
            target processName: (contentsOfTextField: processNameField).
            target colorLevel: (contentsOfEnumeratedField: colorField).
            target skipRate: (contentsOfEnumeratedField: frameRateField).
            target compression: (contentsOfEnumeratedField: compressionField).
            target deviceName: (contentsOfEnumeratedField: deviceNameField).
            target devicePort: (contentsOfEnumeratedField: devicePortField).
            target scale: (contentsOfEnumeratedField: scaleField).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         applyProperties = ( |
            | 
            acceptNetPropertyChanges.
            acceptVideoPropertyChanges.
            acceptAudioPropertyChanges.
            acceptLayoutPropertyChanges.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Audio\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         buildAudioPropertyEntries = ( |
            | 
            audioPortField: (buildTextFieldNamed:  'Audio Port' String: target audioPort printString).
            playGainField: (buildTextFieldNamed:  'Play Volume' String: target playGain printString).
            recordGainField: (buildTextFieldNamed:  'Transmit Volume' String: target recordGain printString).
            monitorGainField: (buildTextFieldNamed:  'Monitor Volume' String: target monitorGain printString).
            restrictedField:     (buildEnumeratedFieldNamed: 'Volume at Distance'
                    Labels: ('Varies by Distance' & 'Full Volume') asVector
                    Values: (true & false) asVector
                    InitialValue: target isRestricted).
            inputField:     (buildEnumeratedFieldNamed: 'Input'
                    Labels: ('Microphone' & 'Line In') asVector
                    Values: ('microphone' & 'line-in') asVector
                    InitialValue: target recordPort).
            outputField:     (buildEnumeratedFieldNamed: 'Output'
                    Labels: ('Speakers' & 'Headphones' & 'Line Out') asVector
                    Values: ('speaker' & 'headphone' & 'line-out') asVector
                    InitialValue: target playPort).
            receiveField:     (buildEnumeratedFieldNamed: 'Other Speakers'
                    Labels: ('Listen' & 'Mute') asVector
                    Values: (true & false) asVector
                    InitialValue: true).
            transmitField:     (buildEnumeratedFieldNamed: 'Transmit'
                    Labels: ('On' & 'Mute') asVector
                    Values: (true & false) asVector
                    InitialValue: true).


            expertMode ifTrue: [
              ((buildTitle: 'Audio')
                & inputField & outputField & restrictedField
                & playGainField & recordGainField & monitorGainField
                & receiveField & transmitField
                & audioPortField) asVector
            ] False: [
              ((buildTitle: 'Audio')
                & inputField & outputField
                & playGainField & recordGainField) asVector
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Field Construction\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         buildEnumeratedFieldNamed: n Labels: labels Values: values InitialValue: v = ( |
             f.
            | 
            defaultButtonHolder: ui2Menu initializeDefaultButtonHolder: defaultButtonHolder.
            f: enumeratedTypeLabelMorph copyItemNames: labels Values: values DefaultButtonHolder: defaultButtonHolder.
            f setSelectedIndex: (values asVector keyAt: v).
            f fontName: scalableFont timesBold.
            f fontSize: outlinerPreferences mediumFontSize.
            buildFieldLabel: n ContentMorph: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Field Construction\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         buildFieldLabel: s ContentMorph: contentM = ( |
             labelM.
             r.
            | 
            labelM: labelMorph copyLabel: s
                Font:     scalableFont times
                FontSize: outlinerPreferences mediumFontSize
                Color:    (paint named: 'black').
            r: rowMorph copy color: color.
            r borderWidth: 0.
            r beFlexible.
            r baseMinHeight: (outlinerPreferences mediumFontSize + 6).
            r addAllMorphs: (
                labelM &
                ((spacerMorph copy beFlexible color: color) baseMinWidth: 5) &
                contentM) asVector.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Layout\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         buildLayoutPropertyEntries = ( |
            | 
            layoutField:     (buildEnumeratedFieldNamed: 'Session Arrangement'
                    Labels: ('Top' & 'Left' & 'Right' & 'Bottom'
                           & 'Top and Left' & 'Bottom and Right'
                           & 'Around Edges' & 'Center') asVector
                    Values: (onTop & onLeft & onRight & onBottom
                           & onTopAndLeft & onBottomAndRight
                           & onAllEdges & onCenter) asVector
                    InitialValue: onTop).
            labelField:     (buildEnumeratedFieldNamed: 'Add Labels'
                    Labels: ('True' & 'False') asVector
                    Values: (true & false) asVector
                    InitialValue: target withLabel).
            layoutRatioField: (buildTextFieldNamed:  'Ratio Horizontal To Vertical'
                    String: target ratioHorizontalToVertical printString).
            minFromBorderField: (buildTextFieldNamed:  'Minimum from Border'
                    String: target minFromBorder printString).
            expertMode ifTrue: [
              ((buildTitle: 'Session Layout')
                & labelField & minFromBorderField
                & layoutField & layoutRatioField) asVector
            ] False: [
              ((buildTitle: 'Participant Grouping Layout')
                & labelField  & layoutField) asVector
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Network\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         buildNetPropertyEntries = ( |
            | 
            multicastGroupField: (buildTextFieldNamed:  'Multicast Group (next start)' String: target multicastGroup).
            ttlField: (buildTextFieldNamed:  'Multicast TTL (next start)' String: target ttl printString).
            ((buildTitle: 'Network') & multicastGroupField & ttlField) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Field Construction\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTextFieldNamed: n String: s = ( |
             e.
             f.
            | 
            e: editorMorph copy.
            e setFont: scalableFont timesBold
                FontSize:  outlinerPreferences mediumFontSize
                FontColor: (paint named: 'black').
            e appendString: s.
            s isEmpty ifTrue: [ e appendString: '   ' ].
            e color: (paint named: 'offWhite').
            e borderWidth: 1.
            f: frameMorph copy beShrinkWrap color: color.
            f frameStyle: f insetBezelStyle.
            f borderWidth: 2.
            f addMorph: e.
            buildFieldLabel: n ContentMorph: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Setup\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         buildTitle: title = ( |
             line.
             titleR.
            | 
            line: frameMorph copy color: color.
            line borderWidth: 1.
            line frameStyle: line insetBezelStyle.
            line setHeight: 2.
            line beFlexibleHorizontally.
            line beRigidVertically.

            titleR: rowMorph copy color: color.
            titleR borderWidth: 0.
            titleR beFlexible.
            titleR addAllMorphs: (
                (line copy beRigid setWidth: 15)          &
                (spacerMorph copyH: 5 Color: color)       &
                (labelMorph copyLabel: title
                    Font:     scalableFont timesItalic
                    FontSize: outlinerPreferences mediumFontSize
                    Color:    paint named: 'black')       &
                (spacerMorph copyH: 5 Color: color)       &
                line copy) asVector.

            titleR).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Video\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         buildVideoPropertyEntries = ( |
             fpsval.
             initfpsval.
            | 

            " Used here to set frameRateField: InitialValue: when the skipRate isn't in the list for Values:
              If frameRateField: Labels: are changed, this vector needs a corresponding change. "
            fpsval: (0 & 1 & 2 & 3 & 4 & 5 & 6 & 9 & 14 & 29 & 59 & 149 & 299 & 449
                     & 899 & 1349 & 1799 & 3599 & 8999 & 17999) asVector.
            fpsval do: [ | :v |
              (target skipRate) >= v ifTrue: [
                 initfpsval: v.
              ].
            ].

            firstChannelField: (buildTextFieldNamed:  'Begin at Channel' String: target firstChannel printString).
            videoPortField: (buildTextFieldNamed:  'Beginning Video Port' String: target videoPort printString).
            processNameField: (buildTextFieldNamed:  'Process Name' String: target processName).
            scaleField:     (buildEnumeratedFieldNamed: 'Video Size'
                    Labels: ('Full (640 x 480)' & 'Normal (320 x 240)'
                           & 'Half (160 x 120)' & 'Quarter (80 x 60)') asVector
                    Values: (1 & 2 & 4 & 8) asVector
                    InitialValue: target scale).
            compressionField:     (buildEnumeratedFieldNamed: 'Compression'
                    Labels: ('JPeg' & 'CellB') asVector
                    Values: ('JPeg' & 'CellB') asVector
                    InitialValue: target compression).
            colorField:     (buildEnumeratedFieldNamed: 'Color Level'
                    Labels: ('High Color' & 'Medium Color'
                           & 'Low Color' & 'High GrayScale'
                           & 'Medium GrayScale' & 'Low GrayScale') asVector
                    Values: ('high' & 'medium' & 'low' & 'highgray' & 'mediumgray' & 'lowgray') asVector
                    InitialValue: target colorLevel).
            frameRateField:     (buildEnumeratedFieldNamed: 'Frame Rate'
                    Labels: ('30 fps' & '15 fps' & '10 fps' & '7.5 fps' & '6 fps' & '5 fps' & '4.3 fps'
                             & '3 fps' & '2 fps' & '1 fps' & '2 sec/frame' & '5 sec/frame' & '10 sec/frame'
                             & '15 sec/frame' & '30 sec/frame' & '45 sec/frame' & '60 sec/frame'
                             & '2 min/frame' & '5 min/frame' & '10 min/frame') asVector
                    Values: fpsval
                    InitialValue: initfpsval).
            deviceNameField:     (buildEnumeratedFieldNamed: 'Video Device'
                    Labels: ('SunVideo Board 0' & 'SunVideo Board 1'
                             & 'SunVideo Board 2' & 'SunVideo Board 3') asVector
                    Values: ('/dev/rtvc0' & '/dev/rtvc1' & '/dev/rtvc2' & '/dev/rtvc3') asVector
                    InitialValue: target deviceName).
            devicePortField:     (buildEnumeratedFieldNamed: 'Device Port'
                    Labels: ('Port 1' & 'Port 2'
                             & 'S-VHS Port') asVector
                    Values: (1 & 2 & 0) asVector
                    InitialValue: target devicePort).

            expertMode ifTrue: [
              ((buildTitle: 'Video')
                & firstChannelField & scaleField & frameRateField & compressionField & colorField
                & videoPortField & deviceNameField & devicePortField & processNameField) asVector
            ] False: [
              ((buildTitle: 'Video')
                & firstChannelField & scaleField & frameRateField & compressionField) asVector
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Field Construction\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsOfEnumeratedField: f = ( |
            | f lastMorph getSelectedValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Field Construction\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsOfTextField: f = ( |
            | f lastMorph firstMorph contentsString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         copy = ( |
             cp.
            | 
            cp: resend.copy.
            cp activeParticipants: sequence copyRemoveAll.
            cp target: cp.
            cp currentChannel: cp firstChannel.
            cp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Audio\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createAudioMorphFor: part = ( |
            | 
            part myAudioMorph: initAudioMorphFor: (part myHost).
            " Set width & height to something small
              CAVEAT: when an audioMorph has an image tied to it
                      this will change. "
            part myAudioMorph setWidth: 20.
            part myAudioMorph setHeight: 20.
            part myAudioMorph position:
                 ((part myVideoTransmitterMorph globalPosition) + ( (-20) @ 0 )).
            part myAudioMorph addMorph: ((labelMorph copyLabel: 'A') position:
                 ((part myAudioMorph globalPosition) + (5 @ 15))).

            part myAudioMorph openAudio.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Manage Participants\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createLabelFor: part = ( |
            | 
            part myLabel: ((labelMorph copyLabel: (getPreferredNameForHost: part myHost))
                 position: (part myVideoMorph globalPosition
                            + (0 @ ((480 / (part myVideoMorph scale)) + 15)))).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Manage Participants\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createParticipantFor: edge = ( |
             host.
             part.
            | 
            host: (getHostNameForEdge: edge).
            "  participant group already active? "
            activeParticipants do: [ | :p |
              (p myHost) = host ifTrue: [
                ^ self.
              ].
            ].
            part: dtviParticipant copy.
            part myDtviMorph: self.
            activeParticipants add: part.
            part myEdge: edge.
            part myHost: host.
            createVideoMorphFor: part.
            edge addMorph: part myVideoMorph.
            createVideoTransmitterMorphFor: part.
            createAudioMorphFor: part.
            withAVMorphs ifTrue: [
              edge addMorph: part myVideoTransmitterMorph.
              edge addMorph: part myAudioMorph.
            ].
            withLabel ifTrue: [
              createLabelFor: part.
              edge addMorph: part myLabel.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Manage Participants\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createParticipants = ( |
             chan.
             edges.
             sess.
            | 
            edges: sequence copyRemoveAll.
            world morphs do: [ | :m |
              (m morphTypeName) = 'screenEdge' ifTrue: [
                edges addLast: m.
              ].
            ].
            layout = onTop ifTrue: [
              edges do: [ | :e |
                (e orientation) = 'top' ifTrue: [
                  createSessionFor: e.
                  currentChannel: currentChannel + 1.
                ].
              ].
            ].
            layout = onLeft ifTrue: [
              edges do: [ | :e |
                (e orientation) = 'left' ifTrue: [
                  createSessionFor: e.
                  currentChannel: currentChannel + 1.
                ].
              ].
            ].
            layout = onRight ifTrue: [
              edges do: [ | :e |
                (e orientation) = 'right' ifTrue: [
                  createSessionFor: e.
                  currentChannel: currentChannel + 1.
                ].
              ].
            ].
            layout = onBottom ifTrue: [
              edges do: [ | :e |
                (e orientation) = 'bottom' ifTrue: [
                  createSessionFor: e.
                  currentChannel: currentChannel + 1.
                ].
              ].
            ].
            videoMorph repositionWindows.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Video\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createVideoMorphFor: part = ( |
            | 
            part myVideoMorph: initVideoMorphForChannel: currentChannel.
            part myVideoMorph position: (positionFor: part).

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Video\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createVideoTransmitterMorphFor: part = ( |
            | 
            part myVideoTransmitterMorph: initVideoTransmitterMorphFor: part myHost
                 Channel: channelCurrent.
            part myVideoTransmitterMorph setWidth: 20.
            part myVideoTransmitterMorph setHeight: 20.
            part myVideoTransmitterMorph position:
                 (part myVideoMorph globalPosition
                  + (((640 / (part myVideoMorph scale))
                     - (part myVideoTransmitterMorph width))
                        @ ((480 / (part myVideoMorph scale)) + 2))).

            part myVideoTransmitterMorph addMorph: ((labelMorph copyLabel: 'V') position:
                 ((part myVideoTransmitterMorph globalPosition) + (5 @ 15))).

            part myVideoTransmitterMorph openVideo.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Manage Participants\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         dismissAllParticipants = ( |
            | 
            activeParticipants copy do: [ | :part |
              dismissParticipant: part.
            ].
            activeParticipants removeAll.
            currentChannel: firstChannel.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Manage Participants\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         dismissParticipant: part = ( |
            | 
            ((part myLabel) != nil) && [part myLabel isInWorld] ifTrue: [
              part myLabel delete.
            ].
            (part myAudioMorph) != nil ifTrue: [
              part myAudioMorph isOpen ifTrue: [
                part myAudioMorph closeAudio.
              ].
              part myAudioMorph isInWorld ifTrue: [
                part myAudioMorph delete.
              ].
            ].
            ((part myVideoTransmitterMorph) != nil) && [part myVideoTransmitterMorph isOpen] ifTrue: [
              part myVideoTransmitterMorph closeVideo.
              part myVideoTransmitterMorph isInWorld ifTrue: [
                part myVideoTransmitterMorph delete.
              ].
            ].
            " A videoMorph is open only when it is in a world. "
            ((part myVideoMorph) != nil) && [part myVideoMorph isOpen] ifTrue: [
              part myVideoMorph delete.
            ].
            activeParticipants remove: part.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Manage Participants\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         dtviParticipant = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> 'dtviParticipant' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals dtviMorph parent dtviParticipant.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> 'dtviParticipant' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         myAudioMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> 'dtviParticipant' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         myDtviMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> 'dtviParticipant' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         myEdge.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> 'dtviParticipant' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         myHost.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> 'dtviParticipant' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         myLabel.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> 'dtviParticipant' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         myVideoMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> 'dtviParticipant' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         myVideoTransmitterMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> 'dtviParticipant' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> 'dtviParticipant' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals dtviMorph parent dtviParticipant parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> 'dtviParticipant' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> 'dtviParticipant' -> 'parent' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         middleMouseDown: evt = ( |
            | 
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> 'dtviParticipant' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> 'dtviParticipant' -> 'parent' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy.
            myAudioMorph = nil ifFalse: [
              menu addButtonTarget: self
                   Script: 'event sourceHand attach: (target myAudioMorph getAudioControl)'
                   Label: 'Audio Control'.
              menu addButtonTarget: self
                   Script: 'event sourceHand attach: (target myAudioMorph popUpMenu: event)'
                   Label: 'Audio Menu'.
              menu addDivider.
            ].
            myVideoTransmitterMorph = nil ifFalse: [
              menu addButtonTarget: self
                   Script: 'event sourceHand attach: (target myVideoTransmitterMorph popUpMenu: event)'
                   Label: 'Video Transmitter Menu'.
              menu addDivider.
            ].
            myVideoMorph = nil ifFalse: [
              menu addButtonTarget: self
                   Script: 'event sourceHand attach: (target myVideoMorph popUpMenu: event)'
                   Label: 'Video Menu'.
              menu addDivider.
            ].
            myDtviMorph = nil ifFalse: [
              menu addButtonTarget: self
                   Script: 'event sourceHand attach: (target myDtviMorph dismissParticipants)'
                   Label: 'Dismiss All Partcipants'.
            ].
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            menu colorAll: menu color.
            menu popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Setup\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getExpertSetup = ( |
             fm.
            | 
            fm: copy.
            fm expertMode: true.
            getSetupFor: fm.
            fm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getHostNameForEdge: edge = ( |
            | 
            ((edge winCanvas xDisplay name) asTokensSeparatedByCharactersIn: ':') first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getPreferredNameForHost: host = ( |
            | 
            world hands do: [ | :h |
              (h userInfo displayHostName) = (host) ifTrue: [
                ^ (h userInfo preferredName).
              ].
            ].
            ^ host).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Setup\x7fComment: Assumes prototype has expertMode: false\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getSetup = ( |
             fm.
            | 
            fm: copy.
            getSetupFor: fm.
            fm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Setup\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getSetupFor: fm = ( |
             cm.
             props.
             rm.
             rm2.
            | 
            cm: columnMorph copy.
            fm addMorph: cm.
            rm: rowMorph copy.
            rm addMorph: ((((ui2Button copy) label: 'Apply')
                             script: 'target applyProperties') target: fm).
            rm addMorph: ((((ui2Button copy) label: 'Create')
                             script: 'target createSessions') target: fm).
            rm addMorph: ((((ui2Button copy) label: 'Dismiss')
                             script: 'target dismissSessions') target: fm).
            rm2: rowMorph copy.
            rm2 addMorph: ((((ui2Button copy) label: 'Scale Up')
                             script: 'target scaleUp') target: fm).
            rm2 addMorph: ((((ui2Button copy) label: 'Scale Down')
                             script: 'target scaleDown') target: fm).
            cm addAllMorphs: (fm buildNetPropertyEntries,
                              fm buildVideoPropertyEntries,
                              fm buildAudioPropertyEntries,
                              fm buildLayoutPropertyEntries,
                              ((vector copyAddLast: rm) copyAddLast: rm2)).
            fm colorAll: (paint named: 'lightGray').
            rm beShrinkWrap.
            rm2 beShrinkWrap.
            cm beShrinkWrap.
            fm beShrinkWrap.
            fm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Audio\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         initAudioMorphFor: host = ( |
             am.
            | 
            am: audioMorph copy.
            am audioSource: host.
            am multicastGroup: multicastGroup.
            am ttl: ttl.
            am port: audioPort.
            am playGain: playGain.
            am recordGain: recordGain.
            am monitorGain: monitorGain.
            am playPort: playPort.
            am recordPort: recordPort.
            am isRestricted: isRestricted.
            am).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Video\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         initVideoMorphForChannel: n = ( |
             vm.
            | 
            vm: videoMorph copy.
            vm compression: compression.
            vm scale: scale.
            vm channelNumber: n.
            vm channelCurrent: n.
            vm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Video\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         initVideoTransmitterMorphFor: host Channel: n = ( |
             tm.
            | 
            tm: videoTransmitterMorph copy.
            tm compression: compression.
            tm videoSource: host.
            tm scale: scale.
            tm channelNumber: currentChannel.
            tm skipRate: skipRate.
            tm deviceName: deviceName.
            tm processName: processName.
            tm channelNumber: n.
            tm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         morphTypeName = 'dtviMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Layout\x7fCategory: layout values\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         onAllEdges = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Layout\x7fCategory: layout values\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (4)'
        
         onBottom = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Layout\x7fCategory: layout values\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         onBottomAndRight = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Layout\x7fCategory: layout values\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         onCenter = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Layout\x7fCategory: layout values\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         onLeft = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Layout\x7fCategory: layout values\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (3)'
        
         onRight = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Layout\x7fCategory: layout values\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         onTop = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Layout\x7fCategory: layout values\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         onTopAndLeft = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Manage Participants\x7fComment: If we want to tack a session to the closest edge we will
need to capture all four edges.

Order for edges within winCanvas is bottom, left, right, top\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         orderEdges: edges = ( |
            | 
            " order for edges within winCanvas is bottom, left, right, top "
            edges  copySortBy: 
            ( |
             p* = traits clonable.
             element: e1 Precedes: e2 = (
               (e1 winCanvas identityHash) compare: (e2 winCanvas identityHash)
                  IfLess: false
                    Equal: [(e1 orientation) < (e2 orientation)]
                    Greater: true)
            | )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Layout\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         positionFor: part = ( |
            | 
            (part myEdge orientation) = 'top' ifTrue: [
              ^ positionOnTopFor: part.
            ].
            (part myEdge orientation) = 'left' ifTrue: [
              ^ positionOnLeftFor: part.
            ].
            (part myEdge orientation) = 'right' ifTrue: [
              ^ positionOnRightFor: part.
            ].
            (part myEdge orientation) = 'bottom' ifTrue: [
              ^ positionOnBottomFor: part.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Layout\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         positionOnBottomFor: part = ( |
             myX.
             myY.
             s.
            | 
            myY: (part myEdge winCanvas size x) - sHeight.
            s: activeParticipants size - 1.
            [(sWidth * s) > ((part myEdge winCanvas size x) - sWidth)] whileTrue: [
              myY: myY - sHeight.
              s: s - (((part myEdge winCanvas size x) / sWidth) asInteger).
            ].
            myX: s * sWidth.
            (point copyX: myX Y: myY) - (part myEdge winCanvas offset)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Layout\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         positionOnLeftFor: part = ( |
             myX.
             myY <- 0.
             s.
            | 


              " CAVEAT: has not been changed to calculate along the left!!! "

            s: activeParticipants size - 1.
            [(sWidth * s) > ((part myEdge winCanvas size x) - sWidth)] whileTrue: [
              myY: myY + sHeight.
              s: s - (((part myEdge winCanvas size x) / sWidth) asInteger).
            ].
            myX: s * sWidth.
            (point copyX: myX Y: myY) - (part myEdge winCanvas offset)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Layout\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         positionOnRightFor: part = ( |
             myX.
             myY <- 0.
             s.
            | 


              " CAVEAT: has not been changed to calculate along the right!!! "

            s: activeParticipants size - 1.
            [(sWidth * s) > ((part myEdge winCanvas size x) - sWidth)] whileTrue: [
              myY: myY + sHeight.
              s: s - (((part myEdge winCanvas size x) / sWidth) asInteger).
            ].
            myX: s * sWidth.
            (point copyX: myX Y: myY) - (part myEdge winCanvas offset)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Layout\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         positionOnTopFor: part = ( |
             myX.
             myY <- 0.
             s.
            | 
            s: activeParticipants size - 1.
            [(sWidth * s) > ((part myEdge winCanvas size x) - sWidth)] whileTrue: [
              myY: myY + sHeight.
              s: s - (((part myEdge winCanvas size x) / sWidth) asInteger).
            ].
            myX: s * sWidth.
            (point copyX: myX Y: myY) - (part myEdge winCanvas offset)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Video\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         scaleDown = ( |
            | 
            activeParticipants reverseDo: [ | :part |
              part myVideoTransmitterMorph scaleDown.
              part myVideoMorph scaleDown.
              withAVMorphs ifTrue: [
                part myVideoTransmitterMorph position: 
                     (((640 / (part myVideoMorph scale))
                       - (part myVideoTransmitterMorph width))
                         @ ((480 / (part myVideoMorph scale)) + 5)).
                part myVideoTransmitterMorph changed.
                part myAudioMorph position:
                     ((part myVideoTransmitterMorph position) + ( (-20) @ 0 )).
                part myAudioMorph changed.
              ].
              (part myLabel) != nil ifTrue: [
                part myLabel changed.
                part myLabel position:
                     (0 @ ((480 / (part myVideoMorph scale)) + 15)).
                part myLabel changed.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> 'parent' -> () From: ( | {
         'Category: Video\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         scaleUp = ( |
            | 
            activeParticipants reverseDo: [ | :part |
              part myVideoTransmitterMorph scaleUp.
              part myVideoMorph scaleUp.
              withAVMorphs ifTrue: [
                part myVideoTransmitterMorph position: 
                     (((640 / (part myVideoMorph scale))
                       - (part myVideoTransmitterMorph width))
                         @ ((480 / (part myVideoMorph scale)) + 5)).
                part myVideoTransmitterMorph changed.
                part myAudioMorph position:
                     ((part myVideoTransmitterMorph position) + ( (-20) @ 0 )).
                part myAudioMorph changed.
              ].
              (part myLabel) != nil ifTrue: [
                part myLabel position:
                     (0 @ ((480 / (part myVideoMorph scale)) + 15)).
                part myLabel changed.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Audio Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (150)'
        
         playGain <- 150.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Audio\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         playGainField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Audio Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'headphone\')'
        
         playPort <- 'headphone'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Video Setup State\x7fComment: Name used to refer to the process for this
video transmitter.
Present to allow a host to have multiple
video transmitters active.\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'video\')'
        
         processName <- 'video'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Video\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         processNameField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            dtviMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Layout Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (2)'
        
         ratioHorizontalToVertical <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196)\x7fVisibility: private'
        
         rawColor <- paint copyRed: 0.224829 Green: 0.450635  Blue: 0.600196.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Audio Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (true)'
        
         receive <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Audio\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         receiveField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Audio Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (125)'
        
         recordGain <- 125.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Audio\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         recordGainField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Audio Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'microphone\')'
        
         recordPort <- 'microphone'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Audio\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         restrictedField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Layout Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         sHeight.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Layout Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         sWidth.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Video Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (2)'
        
         scale <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Video\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         scaleField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Video Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (5)'
        
         skipRate <- 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Audio Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (true)'
        
         transmit <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Audio\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         transmitField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Network Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (16)'
        
         ttl <- 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Network\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         ttlField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Video Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (3751)'
        
         videoPort <- 3751.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Properties\x7fCategory: Video\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         videoPortField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Layout Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (false)'
        
         withAVMorphs <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dtviMorph' -> () From: ( | {
         'Category: Setup State\x7fCategory: Layout Setup State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (true)'
        
         withLabel <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fCategory: avExtensions\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         feedbackEngine = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'feedbackEngine' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals feedbackEngine.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (true)'
        
         continue <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         keywords <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Category: parsing and processing\x7fComment: Not necessarily complete.

parseTokens separates on \':\' and \'=\' so
the value names are separated from the values.
The method names won\'t be complete because
they reflect only the first token, not the
full method name.

For this to work correctly would require
something that re-assembles the value names
so the result is something like:

\'apply:Values:To:\' sendTo: target 
                   With: value1
                   With: value2
                   With: value3.

It might be possible to accomplish this
with something like:
(tl at: 0, \':\', tl at: 2, \':\', tl at: 4, \':\')
                   sendTo: target 
                   With: (tl at: 1)
                   With: (tl at: 3)
                   With: (tl at: 5).

The problem is we no lnger have a safety check
to insure the method exists. We could move the
logic of re-assembling the method name to
parseTokens and set the key to the fully
qualified method name.

NOTE: evalValues is applied to all values, we
      may want to have eval1, eval2, ... and
      evaluate them one at a time going to an
      intermediate list.
\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         apply: k Values: tl To: target = ( |
             nv.
            | 
            nv: (tl size).
            (k numValues) != nv ifTrue: [
              ('apply:Values:To: keyword ', k key,
                ' number of values should be ',
                k numValues printString,
                ' found ', nv printString) printLine.
              (k numValues) < nv ifTrue: [
                nv = k numValues.
              ].
            ].
            nv = 0 ifTrue: [
              ^ k key sendTo: target.
            ].
            nv = 1 ifTrue: [
              k evalValue ifTrue: [
                ^ (k key) sendTo: target With: ((tl at: 0) eval).
              ] False: [
                ^ (k key) sendTo: target With: (tl at: 0).
              ].
            ].
            nv = 2 ifTrue: [
              k evalValue ifTrue: [
                ^ (k key) sendTo: target
                          With: ((tl at: 0) eval)
                          With: ((tl at: 1) eval).
              ] False: [
                ^ (k key) sendTo: target
                          With: (tl at: 0)
                          With: (tl at: 1).
              ].
            ].
            nv = 3 ifTrue: [
              k evalValue ifTrue: [
                ^ (k key) sendTo: target
                          With: ((tl at: 0) eval)
                          With: ((tl at: 1) eval)
                          With: ((tl at: 2) eval).
              ] False: [
                ^ (k key) sendTo: target
                          With: (tl at: 0)
                          With: (tl at: 1)
                          With: (tl at: 2).
              ].
            ].
            nv = 4 ifTrue: [
              k evalValue ifTrue: [
                ^ (k key) sendTo: target
                          With: ((tl at: 0) eval)
                          With: ((tl at: 1) eval)
                          With: ((tl at: 2) eval)
                          With: ((tl at: 3) eval).
              ] False: [
                ^ (k key) sendTo: target
                          With: (tl at: 0)
                          With: (tl at: 1)
                          With: (tl at: 2)
                          With: (tl at: 3).
              ].
            ].
            nv = 5 ifTrue: [
              k evalValue ifTrue: [
                ^ (k key) sendTo: target
                          With: ((tl at: 0) eval)
                          With: ((tl at: 1) eval)
                          With: ((tl at: 2) eval)
                          With: ((tl at: 3) eval)
                          With: ((tl at: 4) eval).
              ] False: [
                ^ (k key) sendTo: target
                          With: (tl at: 0)
                          With: (tl at: 1)
                          With: (tl at: 2)
                          With: (tl at: 3)
                          With: (tl at: 4).
              ].
            ].
            nv = 6 ifTrue: [
              k evalValue ifTrue: [
                ^ (k key) sendTo: target
                          With: ((tl at: 0) eval)
                          With: ((tl at: 1) eval)
                          With: ((tl at: 2) eval)
                          With: ((tl at: 3) eval)
                          With: ((tl at: 4) eval)
                          With: ((tl at: 5) eval).
              ] False: [
                ^ (k key) sendTo: target
                          With: (tl at: 0)
                          With: (tl at: 1)
                          With: (tl at: 2)
                          With: (tl at: 3)
                          With: (tl at: 4)
                          With: (tl at: 5).
              ].
            ].
            nv = 7 ifTrue: [
              k evalValue ifTrue: [
                ^ (k key) sendTo: target
                          With: ((tl at: 0) eval)
                          With: ((tl at: 1) eval)
                          With: ((tl at: 2) eval)
                          With: ((tl at: 3) eval)
                          With: ((tl at: 4) eval)
                          With: ((tl at: 5) eval)
                          With: ((tl at: 6) eval).
              ] False: [
                ^ (k key) sendTo: target
                          With: (tl at: 0)
                          With: (tl at: 1)
                          With: (tl at: 2)
                          With: (tl at: 3)
                          With: (tl at: 4)
                          With: (tl at: 5)
                          With: (tl at: 6).
              ].
            ].
            nv = 8 ifTrue: [
              k evalValue ifTrue: [
                ^ (k key) sendTo: target
                          With: ((tl at: 0) eval)
                          With: ((tl at: 1) eval)
                          With: ((tl at: 2) eval)
                          With: ((tl at: 3) eval)
                          With: ((tl at: 4) eval)
                          With: ((tl at: 5) eval)
                          With: ((tl at: 6) eval)
                          With: ((tl at: 7) eval).
              ] False: [
                ^ (k key) sendTo: target
                          With: (tl at: 0)
                          With: (tl at: 1)
                          With: (tl at: 2)
                          With: (tl at: 3)
                          With: (tl at: 4)
                          With: (tl at: 5)
                          With: (tl at: 6)
                          With: (tl at: 7).
              ].
            ].
            nv = 9 ifTrue: [
              k evalValue ifTrue: [
                ^ (k key) sendTo: target
                          With: ((tl at: 0) eval)
                          With: ((tl at: 1) eval)
                          With: ((tl at: 2) eval)
                          With: ((tl at: 3) eval)
                          With: ((tl at: 4) eval)
                          With: ((tl at: 5) eval)
                          With: ((tl at: 6) eval)
                          With: ((tl at: 7) eval)
                          With: ((tl at: 8) eval).
              ] False: [
                ^ (k key) sendTo: target
                          With: (tl at: 0)
                          With: (tl at: 1)
                          With: (tl at: 2)
                          With: (tl at: 3)
                          With: (tl at: 4)
                          With: (tl at: 5)
                          With: (tl at: 6)
                          With: (tl at: 7)
                          With: (tl at: 8).
              ].
            ].
            ('apply:Values:To: keyword ', k key, ' requires ',
              k numValues printString, ' values - not supported')
              printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Category: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         closeSocket = ( |
            | 
            (socket != nil) && [socket isOpen] ifTrue: [
              socket close.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Comment: When copying create a new keywords list\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             fb.
            | 
            fb: resend.copy.
            fb keywords: list copyRemoveAll.
            fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Category: parsing and processing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         findKey: kwd Target: targ = ( |
            | 
            keywords do: [ | :k |
              (k key) = kwd ifTrue: [
                kwd sendTo: target.
                ^ true.
              ].
            ].
            'Unable to find keyword ', kwd printLine.
            ^ false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Category: parsing and processing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         findKey: kwd Values: tl Target: targ = ( |
            | 
            keywords do: [ | :k |
              (k key) = kwd ifTrue: [
                apply: k Values: tl To: targ.
                ^ true.
              ].
            ].
            'Unable to find keyword ', kwd printLine.
            ^ false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Category: parsing and processing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         findKeyFor: tl Target: targ = ( |
             kwd.
             vl.
            | 
            (tl size) = 1 ifTrue: [
              ^ findKey: (tl first) Target: targ.
            ].
            tl size odd ifTrue: [
              ('findKeyFor:Target: odd number of arguments for ',
                tl first) printLine.
              ^ false.
            ].
            kwd: ''.
            vl: list copyRemoveAll.
            0 to: (tl size - 1) By: 2 Do: [ | :i |
              kwd: (kwd, (tl at: i), ':').
              vl add: (tl at: (i + 1)).
            ].
            keywords do: [ | :k |
              (k key) = kwd ifTrue: [
                apply: k Values: vl To: targ.
                ^ true.
              ].
            ].
            ('findKeyFor:Target: unable to find keyword ',
              kwd) printLine.
            ^ false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Category: Models\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         findTarget = ( |
             targ.
            | 
            targ: (((tokens first) asTokensSeparatedByCharactersIn: ':=') last).
            " !!! Replace objectList with the actual object list "
            objectlist do: [ | :obj |
              " !!! Replace name with the field to compare against "
              (obj name) = targ ifTrue: [
                tokens remove: (tokens first).
                ^ obj.
              ].
            ].
            ('Unable to find object matching ', (tokens first)) printLine.
            ^ nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         forkHandler = ( |
             msg.
            | 
            (socket != nil) && [socket isOpen] ifTrue: [
              continue: true.
              msg: (message copy receiver: self
                                Selector: 'handleFeedback')
                                fork resume.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         handleFeedback = ( |
            | 
            [continue] whileTrue: [
              tokens: readSocketAsTokens.
              parseTokens.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Category: Models\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         initKeywords = ( |
            | 
            keywords: list copyRemoveAll.
            "
              To define a keyword that needs no value use:

              keywords add: (((keyword copy) key: 'keyword') numValues: 0).

              To define a keyword that needs one numeric value use:

              keywords add: (((keyword copy) key: 'keyword') evalValue: true).

              To define a keyword that needs one string value use:

              keywords add: (((keyword copy) key: 'averageEnergy') evalValue: false).

            "
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         keyword = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> 'keyword' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals feedbackEngine parent keyword.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> 'keyword' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (true)'
        
         evalValue <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> 'keyword' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'keyword\')'
        
         key <- 'keyword'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> 'keyword' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (1)'
        
         numValues <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> 'keyword' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         openSocket = ( |
            | 
            totalBytes: 0.
            " If already open, close it then re-open it.
              There may be a change in port number, etc. "
            (socket != nil) && [socket isOpen] ifTrue: [
              socket close.
            ].
            " socket: (os_file openUDPOnPort: port IfFail: [ | :err | "
            socket: (openUDPOnPort: port IfFail: [ | :err |
                ('audio level open failed: ', err) printLine.
                 socket: nil.
                ^ self.
              ].
            ).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         openUDPOnPort: port IfFail: errBlk = ( |
             s.
            | 
            " Move to traits os_file, remove all the os_file references "
            s: os_file socketDomain: os_file socketConstants pf_inet Type: os_file socketConstants sock_dgram Protocol: 0
               IfFail: [|:e| ^ errBlk value: 'socket failed: ', e].

            s setsockoptLevel: os_file socketConstants sol_socket OptName: os_file socketConstants so_reuseaddr
              OptVal: (byteVector copySize_4 at: 3 Put: 1) IfFail: [ | :err | ('setsockopt sol_socket, so_reuseaddr failed: ', err) printLine].

            s bindFamily: os_file socketConstants af_inet Port: port Address: os_file inetConstants in_addr_any
                  IfFail: [|:err|   s closeIfFail: [].  ^ errBlk value: 'bind failed: ', err].

            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Category: parsing and processing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         parseTokens = ( |
             targ.
            | 
            (tokens size) = 0 ifTrue: [
              ^ self.
            ].
            targ: findTarget.
            targ = nil ifTrue: [
              ^ self.                " Nothing else to do... "
            ].
            tokens do: [ | :tok. tl |
              tl: (tok asTokensSeparatedByCharactersIn: ':=').
              (tl size) = 2 ifFalse: [
                ('Unable to parse token ', tok) printLine.
                ^ self.
              ].
              (findKeyFor: tl Target: targ) ifFalse: [
                " Do you want to permit unused keywords? If so, take out this action "
                ^ self.
              ].
            ].
            ^ self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         readSocketAsTokens = ( |
             buf.
             words.
            | 
            (socket != nil) && [socket isOpen] ifTrue: [
              buf: socket readMin: 1 IfFail: [ | :err |
                ('Error reading audio level socket: ', err) printLine.
                ^ list copyRemoveAll.    " return an empty list "
              ].
              words: buf asTokensSeparatedByWhiteSpace.
              ^ words.
            ].
            ^ list copyRemoveAll.    " return an empty list ").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Category: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         shutDown = ( |
            | 
            continue: false.
            closeSocket.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> 'parent' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         startUp = ( |
            | 
            (keywords size) = 0 ifTrue: [
              initKeywords.
            ].
            openSocket.
            forkHandler.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (10034)'
        
         port <- 10034.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         socket.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         tokens.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'feedbackEngine' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0)'
        
         totalBytes <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         avExtensions = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'avExtensions' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'avExtensions' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules avExtensions.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'avExtensions' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'avExtensions' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/avExtensions'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'avExtensions' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'avExtensions' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'avExtensions' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'avExtensions' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fCategory: avExtensions\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         videoMorph = bootstrap define: bootstrap stub -> 'globals' -> 'videoMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals videoMorph.

CopyDowns:
globals morph. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (1)'
        
         channelCurrent <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (1)'
        
         channelNumber <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'high\')'
        
         colorLevel <- 'high'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'JPeg\')'
        
         compression <- 'JPeg'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         delayedDeleteQueue.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         forwardMiddleMouseTo.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (false)'
        
         isOpen <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (false)'
        
         isPaused <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0@0)'
        
         oldGlobalPosition <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         oldVideoOwner.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         oldVideoWorld.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals videoMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Shapes\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         addNewRegion: reg = ( |
            | 
            (reg = nil) ifFalse: [
              (reg xEmptyRegion) ifTrue: [
                reg xDestroyRegion.
              ] False: [
                setNewRegion: reg.
                previousRegion: reg.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         addToDelayQueue: vw = ( |
            | 
            delayedDeleteQueue = nil ifTrue: [
              delayedDeleteQueue: sequence copyRemoveAll.
            ].
            (delayedDeleteQueue size) = 0 ifTrue: [
              startGettingStepped.
            ].
            (vw xWin isLive) && (vw xWin display isLive) ifTrue: [
              vw xWin display xMoveWindow: vw xWin X: (-1000) Y: (-1000).
            ].
            vw deleteAfter: (time current addMsec: 1000). " 1 second delay. "
            delayedDeleteQueue add: vw.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Morph Activity\x7fComment: Override traits Morph to close the X window
in all cases.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         animatedDelete = ( |
            | 
            isOpen ifTrue: [
               "unjoin in case embedded in morph."
               unjoin.
              unmapVideo.
            ].
            resend.animatedDelete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         backingOff = ( |
            | 
            videoWindows do: [ | :vw |
              vw receiver send: 'window=',
                    vw xWin windowDescriptor printString,
                    ' backing=no '.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         backingOn = ( |
            | 
            videoWindows do: [ | :vw |
              vw receiver send: 'window=',
                    vw xWin windowDescriptor printString,
                    ' backing=yes '.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Morph Activity\x7fComment: Override copy to initialize videoMorph
specific variables.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         baseCopy = ( |
             vid.
            | 
            vid: resend.baseCopy.
            vid videoWindows: sequence copy.
            isOpen ifTrue: [
              videoWindows do: [ | :vw |
                vid copyWindowOn: (vw winCanvas).
              ].
              delayedDeleteQueue: nil.
            ].
            vid).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Morph Activity\x7fComment: Draw the base of this morph on the given canvas.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: aCanvas = ( |
            | 
            isOpen ifTrue: [
              videoWindows do: [ | :vw |
                " CAVEAT: aCanvas is a pixmapCanvas, not a winCanvas! "
                (vw winCanvas) = (aCanvas winCanvas) ifTrue: [
                  moveWindow: vw To: globalPosition.
                  ^ self.
                ].
              ].
            ] False: [
              openVideo.
              ^ self.
            ].

            "resend.baseDrawOn: aCanvas."
            globalPosition = oldGlobalPosition ifFalse: [ | delta |
              delta: globalPosition - oldGlobalPosition.
              world winCanvases do: [| :c |
                moveWindowsOn: c By: delta.
              ].
              oldGlobalPosition: globalPosition.
            ].
            isOpen ifFalse: [
              openVideo.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Shapes\x7fComment: Note: previously reset the shape to the whole window
by setting resetRegion with:

  resetReg: xlib region xCreateRegion.
  resetReg xUnionRectWithRegion: resetReg
           X: 0 Y: 0
           Width: (640 / scale) Height: (480 / scale).

Changed it to only reset that portion that needs to be
displayed (i.e. the union of the new region with the
old region) with:

  resetReg: deltaRegion: reg.
\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         changeRegion = ( |
             reg.
             resetReg.
            | 
            reg: coveredRegion.
            previousRegion = nil ifTrue: [
              (reg = nil) ifTrue: [
                ^ self.
              ].
              (reg xEmptyRegion) ifTrue: [
                reg xDestroyRegion.
                ^ self.
              ].
              setNewRegion: reg.
              previousRegion: reg.
            ] False: [
              reg = nil ifTrue: [
                clearRegion.
                ^ self.
              ].
              (reg xEmptyRegion) ifTrue: [
                clearRegion.
                reg xDestroyRegion.
                ^ self.
              ].
              (reg xEqualRegion: previousRegion) ifTrue: [
                reg xDestroyRegion.
                ^ self.
              ].
              resetReg: deltaRegion: reg.
              resetReg = nil ifTrue: [
                setNewRegion: reg.
              ] False: [
                setNewRegion: reg Delta: resetReg.
                resetReg xDestroyRegion.
              ].
              previousRegion xDestroyRegion.
              previousRegion: reg.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         channel: n = ( |
            | 
            videoWindows do: [ | :vw |
              vw receiver send: 'channel=', n printString,
                    ' window=', vw xWin windowDescriptor printString.
            ].
            channelCurrent: n.
            "isInWorld ifTrue: [
              world morphs do: [ | :t |
                t morphTypeName = 'videoTransmitterMorph' ifTrue: [
                  t channelNumber = channelCurrent ifTrue: [
                    scale: t scale.
                    setWidth: (640 / scale).
                    setHeight: (480 / scale).
                  ].
                ].
              ].
            ]."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         channelDown = ( |
            | 
              channelCurrent > 0 ifTrue: [
                channel: (channelCurrent - 1).
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         channelReset = ( |
            | 
            channel: channelNumber).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         channelUp = ( |
            | 
            channel: (channelCurrent + 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         checkDelayedQueue = ( |
             cur.
             dq.
            | 
            cur: time current.
            dq: delayedDeleteQueue copy.
            dq do: [ | :vw |
              cur < (vw deleteAfter) ifFalse: [
                "('Deleting window, current time ',
                  cur printString,
                  ' is after ',
                  vw deleteAfter printString) printLine."
                (vw xWin isLive) && (vw xWin display isLive) ifTrue: [
                  vw xWin delete.
                ].
                delayedDeleteQueue remove: vw.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Shapes\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         clearRegion = ( |
            | 
            previousRegion = nil ifTrue: [
              ^ self.
            ].
            forceClearRegion.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         closeVideo = ( |
            | 
            isInWorld ifTrue: [
              stopGettingStepped.
            ].
            videoWindows do: [| :vw |
              (vw receiver) = nil ifFalse: [
                vw receiver stopVideo: vw.
              ].
              (vw xWin isLive) && (vw xWin display isLive) ifTrue: [
                vw xWin delete.
              ].
            ].
            videoWindows removeAll.
            clearRegion.
            isOpen: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: copying\x7fComment: Need decide where to put the xWin created!!!\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         copyWindowOn: aCanvas = ( |
             delta.
             height.
             vidwin.
             width.
             xdisplay.
             xloc.
             xwin.
             yloc.
            | 
            delta: globalPosition + aCanvas offset.
            xdisplay: aCanvas xDisplay.
            width: 640.
            height: 480.
            (scale > 0) ifTrue: [
              width: (640 / scale).
              height: (480 / scale).
            ].
            self setWidth: width.
            self setHeight: height.
            xwin: xdisplay xCreateSimpleWindowIn: aCanvas xWin
               X: (delta x) Y: (delta y)
               Width: width Height: height
               BorderWidth:0 Border: xdisplay screen blackPixel
               Background: xdisplay screen whitePixel.
            xwin display: xdisplay.
            xwin depth: xdisplay screen depth.
            vidwin: videoWindow copy.
            vidwin xWin: xwin.
            vidwin winCanvas: aCanvas.
            videoWindows add: vidwin.
            xwin map.
            videoReceiver startVideo: vidwin With: 'channel=', channelCurrent printString,
                  ' color=', colorLevel,
                  ' scale=', scale printString,
                  ' addwindow=', xwin windowDescriptor printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Shapes\x7fComment: Returns nil if there is no covered region.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         coveredRegion = ( |
             lst.
             reg.
            | 
            lst: rectanglesAbove.
            (lst size = 0) ifTrue: [
              ^ nil.
            ].
            reg: xlib region xCreateRegion.
            lst do: [ | :rect |
              reg xUnionRectWithRegion: reg
                   X: rect origin x Y: rect origin y
                   Width: rect width Height: rect height.
            ].
            (reg xEmptyRegion) ifTrue: [
                reg xDestroyRegion.
                ^ nil.
            ].
            reg).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Shapes\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         createMasks = ( |
             sz.
            | 
            sz: point copyX: ( (640 / scale) - 1 ) Y: ( (480 / scale) -1 ).
            videoWindows do: [ | :vw. gcf. gcm |

              vw fullmask: xlib pixmap createForSameScreenAs: (vw xWin) Size: sz Depth: 1.
              gcf: xlib graphicsContext createForSameScreenAs: vw fullmask.
              gcf fillSolid.
              gcf graphics_exposures: true.
              gcf background: ((paint named: 'white') id).
              gcf foreground: ((paint named: 'black') id).
              vw fullmask fillRectangle: (rectangle from: 0@0 To: sz) GC: gcf.
              vw mask: xlib pixmap createForSameScreenAs: (vw xWin) Size: sz Depth: 1.
              gcm: xlib graphicsContext createForSameScreenAs: vw mask.
              gcm fillSolid.
              gcm graphics_exposures: true.
              gcm background: ((paint named: 'white') id).
              gcm foreground: ((paint named: 'black') id).
              vw mask fillRectangle: (rectangle from: 20@20 To: 60@60) GC: gcm.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Shapes\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         cutRect = ( |
            | 
            videoWindows do: [ | :vw |
              (vw xWin isLive) ifTrue: [
                "vw xWin display xShapeCombineMask: (vw xWin) 
                         DestKind: 0 X: 0 Y: 0 Mask: (vw mask)
                         Operation: 0."
                vw xWin display xShapeCombineRectangle: (vw xWin) 
                        DestKind: 0 X: 40 Y: 40
                        Width: 60 Height: 60
                        Operation: 3.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (traits ui2Menu defaultButtonHolderPrototype copy)'
        
         defaultButtonHolder <- traits ui2Menu defaultButtonHolderPrototype copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Morph Activity\x7fComment: Override traits morph delete to close
X window and quit video receiver.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | 
            isInWorld && [(owner = world) not] ifTrue: [
              " take it away from current owner. "
              world addMorph: self.
            ].
            isInWorld ifTrue: [
              stopGettingStepped.
            ].
            resend.delete.
            isOpen ifTrue: [
               closeVideo.
            ]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Shapes\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         deltaRegion: reg = ( |
             resetReg.
            | 
            previousRegion = nil ifTrue: [
                ^ nil.
            ] False: [
              resetReg: xlib region xCreateRegion.
              resetReg xUnionRegion: resetReg Region: previousRegion.
              resetReg xSubtractRegion: resetReg Region: reg.
              (resetReg xEmptyRegion) ifTrue: [
                resetReg xDestroyRegion.
                ^ nil.
              ].
            ].
            resetReg).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Morph Activity\x7fComment: Change the shape of the video window to show morphs
that are on top of the videoMorph.

Note: previously called method setRegion. Now
calling method changeRegion.
\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         drawOn: aCanvas = ( |
            | 
            isOpen ifTrue: [
              (videoWindows size = world winCanvases size) ifFalse: [
                reconcileVideoInWorld.
              ].
              changeRegion.
            ].
            resend.drawOn: aCanvas.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Shapes\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         forceClearRegion = ( |
             reg.
             resetReg.
            | 
            reg: xlib region xCreateRegion.
            videoWindows size > 0 ifTrue: [
              resetReg: xlib region xCreateRegion.
              resetReg xUnionRectWithRegion: resetReg
                       X: 0 Y: 0
                       Width: (640 / scale) Height: (480 / scale).
              videoWindows do: [ | :vw |
                (vw xWin isLive) ifTrue: [
                  vw xWin display xShapeCombineRegion: (vw xWin) 
                          DestKind: 0 X: 0 Y: 0 Region: resetReg
                          Operation: 0.
                ].
              ].
            ].
            previousRegion = nil ifFalse: [
              previousRegion xDestroyRegion.
            ].
            previousRegion: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: copying\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getUI2Image: vw = ( |
             bv.
             cm.
             nc.
             uim.
             xim.
            | 

            " CAVEAT: Only works for video windows of depth 8. "

            xim: vw xWin display xGetImage: vw xWin
                 X: 0 Y: 0 Width: rawBox width Height: rawBox height
                 PlaneMask: 16rffff Format: (traits xlib drawable zPixmap).
            bv: byteVector copySize: ((rawBox width) * (rawBox height)).
            xim xImageGetData: bv.
            cm: byteVector copySize: 256.
            nc: 1.
            bv bytesDo: [ | :b |
              b = 0 ifFalse: [
                (cm at: b) = 0 ifTrue: [
                  cm at: b Put: nc.
                  nc: nc + 1.
                ].
              ].
            ].
            uim: ui2Image copy.
            uim width: rawBox width.
            uim height: rawBox height.
            uim pixelData: bv.
            uim colors: vector copySize: nc.
            uim colors at: 0 Put: (paint named: 'black').
            54 to: 255 Do: [ | :i |
              (cm at: i) = 0 ifFalse: [ | cx. xp |
                cx: colormapExperiment colorValues at: (i - 54).
                xp: xilPaint copy.
                xp rawRed: (cx at: 0).
                xp rawGreen: (cx at: 1).
                xp rawBlue: (cx at: 2).
                uim colors at: (cm at: i) Put: xp.
              ].
            ].
            0 to: ((bv size) - 1) Do: [ | :i |
              bv at: i Put: (cm at: (bv at: i)).
            ].
            uim).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: copying\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getVideoImageMorph = ( |
             im.
            | 
            im: imageMorph copy.

            " CAVEAT: Must use video window of depth 8 to grab image
                      because Self only works in depth 8 and the
                      captured image is a Self image. "

            videoWindows do: [ | :vw |
              (vw xWin depth = 8) ifTrue: [
                previousRegion = nil ifTrue: [
                  im image: getUI2Image: vw.
                ] False: [
                  " There is something occluding part of the image. "
                  forceClearRegionOn: vw.
                  vw xWin display xSyncDiscardingIf: false.
                  im image: getUI2Image: vw.
                  setNewRegion: previousRegion OnWindow: vw xWin.
                ].
                im setWidth: im image width.
                im setHeight: im image height.
                ^ im.
              ].
            ].
            'videoMorph getImageMorph found no 8 bit video windows' printLine.
            im).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         invalidValue: str = ( |
            | 
            lobby defaultBehavior error: str, ' missing from videoMorph').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Morph Activity\x7fComment: This message is sent to a morph immediately after it has been
dropped into a new owner.  By default, this method does nothing.
Descendants may override this method if they wish to perform
some operation when they are dropped into a new context.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: newOwner Event: evt = ( |
             newWorld.
            | 
            resend.justDroppedInto: newOwner Event: evt.

            isOpen ifFalse: [
              openVideo.
            ].
            oldVideoOwner = newOwner ifFalse: [
              oldVideoOwner: newOwner.
            ].
            newOwner isWorldMorph ifTrue: [
              newWorld: newOwner.
            ] False: [
              newWorld: newOwner root owner.
            ].
            oldVideoWorld = newWorld ifFalse: [
              moveVideoToWorld: newWorld.
              oldVideoWorld: newWorld.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: mouse\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         middleMouseDown: evt = ( |
            | 
            forwardMiddleMouseTo = nil ifTrue: [
              popUpMenu: evt
            ] False: [
              forwardMiddleMouseTo popUpMenu: evt
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Morph Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         morphTypeName = 'videoMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Shapes\x7fComment: return a collection of those morphs that will be drawn after
the receiver is drawn. (drawn above me, so to speak)\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         morphsAbove = ( |
             found.
             mam.
             morphsToConsider.
            | 
            "BUG: May not work correctly when one hand carries objects overlapping
            with the receiver while the receiver is in another hand.

            Roughly two cases. 
              1: receiver is in a hand. Only the other morphs in that hand
                 are considered, along with the submorphs of the receiver.
              2: receiver not in a hand. Threee sources of overlap are: the
                 receiver's morphs, the morphs in the world (and their submorphs)
                 and the morphs in all the world's hands (and their submorphs)"

            mam: allMorphs copyFilteredBy: [ | :m |  
              (m globalBaseBounds intersects: globalBaseBounds) && (!= m) ].
            root morphTypeName = handMorph morphTypeName ifTrue: [
               morphsToConsider: (root allMorphs copyFilteredBy: [ | :mm |
                                    (root != mm) && (!= mm)]).
            ] False: [
               morphsToConsider: vector copyRemoveAll.
               world hands do: [ | :h | 
                     morphsToConsider: morphsToConsider, h morphs. 
               ].
               morphsToConsider: morphsToConsider, world morphs.
            ].
            found: false.
            morphsToConsider reverseDo: [ | :m |
               found ifTrue: [
                 (m globalBounds intersects: globalBaseBounds) ifTrue: [
                    m noStickOuts ifTrue: [
                      mam add: m
                    ] False: [  
                      m allMorphs do: [ | :mm |
                         (mm globalBaseBounds intersects: globalBaseBounds) ifTrue: [
                             mam add: mm
                         ].
                      ].
                   ].
                 ].
               ].
               (found not) && (m = root) ifTrue: [ found: true].
            ].
            mam).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         moveVideoToWorld: aWorld = ( |
             vid.
             vwlist.
            | 

            vwlist: videoWindows copy.
            vwlist do: [ | :vw |
              (vw xWin isLive) ifTrue: [
                "vw xWin unmap."
              ].
            ].
            aWorld winCanvases do: [| :c |
              vid: (openWindowOn: c).
              videoReceiver startVideo: vid With:
                  ' scale=', scale printString,
                  ' compress=', compression,
                  ' color=', colorLevel,
                  ' start channel=', channelCurrent printString.
            ].
            "Now close the old window"
            vwlist do: [ | :vw |
              (vw receiver) = nil ifFalse: [
                vw receiver stopVideo: vw.
              ].
              videoWindows remove: vw.
              addToDelayQueue: vw.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         moveWindow: vw To: loc = ( |
             delta <- (20)@(312).
            | 
            delta: loc + (vw winCanvas offset).
            (vw localPosition) = delta ifFalse: [
              vw xWin display xMoveWindow: vw xWin X: (delta x) Y: (delta y).
              vw localPosition: delta.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: movement\x7fComment: The following is useful for debugging...

(\'moveWindowsOn: \', aCanvas xDisplay name,
  \' globalPosition = \', globalPosition printString,
  \' canvas offset = \', aCanvas offset printString,
  \' delta = \', delta printString) printLine.
\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         moveWindowsOn: aCanvas By: delta = ( |
            | 
            videoWindows do: [ | :vw |
              (vw winCanvas) = aCanvas ifTrue: [
                vw xWin display xMoveWindowBy: vw xWin X: (delta x) Y: (delta y).
                vw localPosition: delta + vw localPosition.
              ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         newScale = ( |
            | 
            scale > 0 ifTrue: [
              setWidth: (640 / scale).
              setHeight: (480 / scale).
              forceClearRegion.
              changeRegion.
              videoWindows do: [ | :vw |
                vw receiver send: 'scale=', scale printString,
                    ' window=', vw xWin windowDescriptor printString.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         oldStep = ( |
             cur.
             dq.
            | 
            cur: time current.
            dq: delayedDeleteQueue copy.
            dq do: [ | :vw |
              cur < (vw deleteAfter) ifFalse: [
                "('Deleting window, current time ',
                  cur printString,
                  ' is after ',
                  vw deleteAfter printString) printLine."
                (vw xWin isLive) && (vw xWin display isLive) ifTrue: [
                  vw xWin delete.
                ].
                delayedDeleteQueue remove: vw.
              ].
            ].
            delayedDeleteQueue size < 1 ifTrue: [
              stopGettingStepped.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         openPseudoColor8WindowOn: aCanvas Width: width Height: height X: x Y: y = ( |
             xdisplay.
             xwin.
            | 
            xdisplay: aCanvas xDisplay.
            xwin: xdisplay xCreateSimpleWindowIn: aCanvas xWin
               X: x Y: y
               Width: width Height: height
               BorderWidth:0 Border: xdisplay screen blackPixel
               Background: xdisplay screen whitePixel.
            xwin display: xdisplay.
            xwin depth: xdisplay screen depth.
            xwin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         openTrueColorWindowOn: aCanvas Width: width Height: height X: x Y: y = ( |
             cmap.
             visual.
             winattr.
             xdisplay.
             xwin.
            | 
            xdisplay: aCanvas xDisplay.
            visual: xdisplay trueColorVisual.
            cmap: xdisplay xCreateColormapWindow: xdisplay screen rootWindowOfScreen
                  Visual: visual Allocate: false.
            winattr: xlib xSetWindowAttributes new.
            winattr colormap: cmap.
            " HACK! Shortcut to get black.
              Assume it is always 1. "
            winattr borderPixel: 1.
            " HACK! White doesn't come up right in TrueColor.
              Assume it is the maximum of all elements. "
            winattr backgroundPixel: 16rffffff.
            xwin: xdisplay xCreateIOWindowIn: aCanvas xWin
               X: x Y: y
               Width: width Height: height Depth: 24
               Visual: visual Attributes: winattr.
            xwin display: xdisplay.
            xwin depth: 24.
            xwin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         openVideo = ( |
            | 
            openVideoOnWorld: world.
            isOpen: true.
            backingOn.
            startGettingStepped.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         openVideoOnWorld: aWorld = ( |
             vid.
            | 
            channelCurrent: channelNumber.
            aWorld winCanvases do: [| :c |
              vid: (openWindowOn: c).
              startVideoOn: vid.
            ].
            oldVideoWorld: aWorld.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: opening\x7fComment: Need to capture the xWin created!!!

The following is useful for debugging.
(\'openWindowOn: \', xdisplay name,
  \' globalPosition = \', globalPosition printString,
  \' canvas offset = \', aCanvas offset printString,
  \' delta = \', delta printString) printLine.
\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         openWindowOn: aCanvas = ( |
             delta.
             height.
             vidwin.
             width.
             xdisplay.
             xwin.
            | 
            delta: globalPosition + aCanvas offset.
            xdisplay: aCanvas xDisplay.
            width: 640.
            height: 480.
            (scale > 0) ifTrue: [
              width: (640 / scale).
              height: (480 / scale).
            ].
            self setWidth: width.
            self setHeight: height.
            " The test for JPeg implies the window will not display in
              TrueColor unless it is defined as JPeg at open time. "
            (xdisplay isTrueColor) && (compression = 'JPeg') ifTrue: [
              xwin: openTrueColorWindowOn: aCanvas
                    Width: width
                    Height: height
                    X: (delta x) Y: (delta y).
            ] False: [
              xwin: openPseudoColor8WindowOn: aCanvas
                    Width: width
                    Height: height
                    X: (delta x) Y: (delta y).
            ].
            vidwin: videoWindow copy.
            vidwin xWin: xwin.
            vidwin winCanvas: aCanvas.
            vidwin localPosition: delta.
            vidwin videoMorph: self.
            videoWindows add: vidwin.
            xwin map.
            vidwin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         pause = ( |
            | 
            videoWindows do: [ | :vw |
              vw receiver send: 'window=',
                    vw xWin windowDescriptor printString,
                    ' stop '.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Morph Activity\x7fComment: Pop up a new windows containing this morph on the given X displays.
The morph is moved from its current world into a new world.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         popUpInWindowOn: dispNames = ( |
             newW.
             sz.
            | 
            sz: bounds size.

            dispNames doFirst: [ | :dn |  
              newW: worldMorph copyOpenOnDisplay: dn Bounds: (50@50) ## sz.
            ] MiddleLast: [ | :dn |
              newW alsoOpenOnDisplay: dn.
            ].

            newW addMorph: self.
            globalPosition: 0@0.

            newW go.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: mouse\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu addButtonTarget: self Script: 'event sourceHand attach: (target getVideoControl)' Label: 'Video Control'.
            isOpen ifTrue: [
              menu addButtonTarget: self Script: 'target restart' Label: 'Restart'.
              menu addButtonTarget: self Script: 'target closeVideo' Label: 'Close'.
              menu addDivider.
              isPaused ifTrue: [
                menu addButtonTarget: self Script: 'target resume'  Label: 'Resume'.
              ] False: [
                menu addButtonTarget: self Script: 'target pause'  Label: 'Pause'.
              ].
              menu addDivider.
              menu addButtonTarget: self Script: 'target scaleUp' Label: 'Expand'.
              menu addButtonTarget: self Script: 'target scaleDown' Label: 'Shrink'.
              menu addDivider.
              menu addButtonTarget: self Script: 'target channelUp' Label: 'Channel Up'.
              menu addButtonTarget: self Script: 'target channelDown' Label: 'Channel Down'.
            ] False: [
              menu addButtonTarget: self Script: 'target openAudio' Label: 'Open'.
            ].
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            menu colorAll: menu color.
            menu popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Morph Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         propertySheets = ( |
            | 
            resend.propertySheets copyAddLast: 
                (videoPropsMorph copyTarget: self)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            videoMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         reconcileVideoInWorld = ( |
             vid.
            | 

            " Find any video window for winCanvases that no longer exist."
            videoWindows do: [ | :vw |
              vw winCanvas isOpen ifFalse: [
                (vw receiver) = nil ifFalse: [
                  vw receiver stopVideo: vw.
                ].
                videoWindows remove: vw.
              ].
            ].

            " See if the world changed. "
            oldVideoWorld = world ifFalse: [
              moveVideoToWorld: world.
            ].

            " Find any winCanvases the video is not already open on. "
            world winCanvases do: [ | :c |
              vid: nil.
              videoWindows do: [ | :vw |
                (vw winCanvas) = c ifTrue: [
                  vid: vw.
                ].
              ].
              vid = nil ifTrue: [
                vid: (openWindowOn: c).
                videoReceiver startVideo: vid With:
                    ' scale=', scale printString,
                    ' compress=', compression,
                    ' color=', colorLevel,
                    ' depth=', vid xWin depth printString,
                    ' start channel=', channelCurrent printString.
                previousRegion = nil ifFalse: [
                  setNewRegion: previousRegion OnWindow: vid xWin.
                ].
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Shapes\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         rectanglesAbove = ( |
             gbb.
            | 
            gbb: globalBaseBounds.
            morphsAbove mapBy: [ | :m | 
              (m globalBaseBounds intersect: gbb) translateBy: gbb origin negate]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         repositionWindows = ( |
            | 
            videoWindows do: [ | :vw.  can. delta |
              can: vw winCanvas.
              delta: globalPosition + (can offset).
              vw xWin display xMoveWindow: vw xWin X: (delta x) Y: (delta y).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         resume = ( |
            | 
            videoWindows do: [ | :vw |
              vw receiver send: 'window=',
                    vw xWin windowDescriptor printString,
                    ' start '.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Morph Activity\x7fComment: Trying to catch right mouse menu\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         rightMouseDown: event = ( |
            | 
            changed.
            resend.rightMouseDown: event.
            changed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         scaleDown = ( |
            | 
            scale < 16 ifTrue: [
              scale: (scale * 2) asInteger.
              newScale.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         scaleUp = ( |
            | 
            scale > 1 ifTrue: [
              scale: (scale / 2) asInteger.
              newScale.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Shapes\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         setNewRegion: reg = ( |
            | 
            videoWindows do: [ | :vw |
              setNewRegion: reg OnWindow: vw xWin.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Shapes\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         setNewRegion: reg Delta: resetReg = ( |
            | 
            videoWindows do: [ | :vw |
              vw xWin isLive ifTrue: [
                "Add in the portion of the old region that is no longer covered."
                vw xWin display xShapeCombineRegion: (vw xWin) 
                                DestKind: 0 X: 0 Y: 0 Region: resetReg
                                Operation: 1.
                setNewRegion: reg OnWindow: vw xWin.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Shapes\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         setNewRegion: reg OnWindow: win = ( |
            | 
            win isLive ifFalse: [
              ^ self.
            ].
            "Subtract the region that is covered."
            win display xShapeCombineRegion: (win) 
                        DestKind: 0 X: 0 Y: 0 Region: reg
                        Operation: 3.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Shapes\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         setRegion = ( |
             lst.
             reg.
             resetReg.
            | 
            reg: xlib region xCreateRegion.
            lst: rectanglesAbove.
            lst do: [ | :rect |
              reg xUnionRectWithRegion: reg
                   X: rect origin x Y: rect origin y
                   Width: rect width Height: rect height.
            ].
            previousRegion = nil ifFalse: [
              (reg xEqualRegion: previousRegion) ifTrue: [
                reg xDestroyRegion.
                ^ self.
              ].
            ].
            resetReg: xlib region xCreateRegion.
            resetReg xUnionRectWithRegion: resetReg
                     X: 0 Y: 0
                     Width: (640 / scale) Height: (480 / scale).
            videoWindows do: [ | :vw |
              (vw xWin isLive) ifTrue: [
                vw xWin display xShapeCombineRegion: (vw xWin) 
                           DestKind: 0 X: -1 Y: -1 Region: resetReg
                           Operation: 0.
                (reg xEmptyRegion) ifFalse: [
                  vw xWin display xShapeCombineRegion: (vw xWin) 
                             DestKind: 0 X: -1 Y: -1 Region: reg
                             Operation: 3.
                ].
              ].
            ].
            resetReg xDestroyRegion.
            (reg xEmptyRegion) ifTrue: [
              reg xDestroyRegion.
              previousRegion = nil ifFalse: [
                previousRegion xDestroyRegion.
                previousRegion: nil.
              ].
            ] False: [
              previousRegion = nil ifFalse: [
                previousRegion xDestroyRegion.
              ].
              previousRegion: reg.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Shapes\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         setShape = ( |
            | 
            videoWindows do: [ | :vw |
              vw xWin display xShapeCombineMask: (vw xWin) 
                           DestKind: 0 X: 0 Y: 0 Mask: (vw mask)
                           Operation: 0.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         skip: n = ( |
            | 
            isInWorld ifTrue: [
              videoTransmitterMorph transmitters do: [ | :t |
                t channelNumber = channelCurrent ifTrue: [
                  t skip: n.
                ].
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         startVideoOn: aVideoWindow = ( |
            | 
            videoReceiver startVideo: aVideoWindow With:
                ' scale=', scale printString,
                ' compress=', compression,
                ' color=', colorLevel,
                ' depth=', aVideoWindow xWin depth printString,
                ' start channel=', channelNumber printString.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: movement\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         step = ( |
            | 
            globalPosition = oldGlobalPosition ifFalse: [
              oldGlobalPosition: globalPosition.
              videoWindows do: [ | :vw |
                moveWindow: vw To: oldGlobalPosition.
              ].
            ].
            reconcileVideoInWorld.
            delayedDeleteQueue = nil ifTrue: [
              ^ self.
            ].
            delayedDeleteQueue size > 0 ifTrue: [
              checkDelayedQueue.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         unmapVideo = ( |
            | 
            videoWindows do: [| :vw |
              vw receiver stopVideo: vw.
              (vw xWin isLive) && (vw xWin display isLive) ifTrue: [
                vw xWin unmap.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Basic Morph Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         videoPropsMorph = bootstrap define: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals subPropertiesSheetMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals videoMorph parent videoPropsMorph.

CopyDowns:
globals subPropertiesSheetMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         channelField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         colorField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         currentChannelField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         frameRateField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals videoMorph parent videoPropsMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> 'parent' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptPropertyChanges = ( |
             fr.
             scl.
            | 
            target channelNumber: (contentsOfTextField: channelField) eval. "to parse float or int"
            target channel: (contentsOfTextField: currentChannelField) eval. "to parse float or int"
            target colorLevel: (contentsOfEnumeratedField: colorField).
            fr: (contentsOfEnumeratedField: frameRateField).
            fr = noTransmitterForTarget ifFalse: [
              target skip: fr.
            ].
            scl: (contentsOfEnumeratedField: scaleField).
            (target scale) = scl ifFalse: [
              target scale: scl.
              target newScale.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> 'parent' -> () From: ( | {
         'Category: property specifics\x7fComment: The values for fps are not all inclusive. It is possible for a videoTransmitterMorph
to have a skipRate that does not have a corresponding fps value. Extra logic is used
to get the next lower value that is valid for fps.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         buildPropertyEntries = ( |
             fpsval.
             initfpsval.
             skip.
            | 

            " Used here to set frameRateField: InitialValue: when the skipRate isn't in the list for Values:
              If frameRateField: Labels: are changed, this vector needs a corresponding change. "
            fpsval: (0 & 1 & 2 & 3 & 4 & 5 & 6 & 9 & 14 & 29 & 59 & 149 & 299 & 449
                     & 899 & 1349 & 1799 & 3599 & 8999 & 17999 & noTransmitterForTarget) asVector.
            skip: currentFrameRate.
            fpsval do: [ | :v |
              skip >= v ifTrue: [
                 initfpsval: v.
              ].
            ].

            channelField: (buildTextFieldNamed:  'Channel (next start)' String: target channelNumber printString).
            currentChannelField: (buildTextFieldNamed:  'Current Channel' String: target channelCurrent printString).
            scaleField:     (buildEnumeratedFieldNamed: 'Video Size'
                    Labels: ('Full (640 x 480)' & 'Normal (320 x 240)'
                           & 'Half (160 x 120)' & 'Quarter (80 x 60)') asVector
                    Values: (1 & 2 & 4 & 8) asVector
                    InitialValue: target scale).
            colorField:     (buildEnumeratedFieldNamed: 'Color Level (next start)'
                    Labels: ('High Color' & 'Medium Color'
                           & 'Low Color' & 'High GrayScale'
                           & 'Medium GrayScale' & 'Low GrayScale') asVector
                    Values: ('high' & 'medium' & 'low' & 'highgray' & 'mediumgray' & 'lowgray') asVector
                    InitialValue: target colorLevel).
            frameRateField:     (buildEnumeratedFieldNamed: 'Frame Rate'
                    Labels: ('30 fps' & '15 fps' & '10 fps' & '7.5 fps' & '6 fps' & '5 fps' & '4.3 fps'
                             & '3 fps' & '2 fps' & '1 fps' & '2 sec/frame' & '5 sec/frame' & '10 sec/frame'
                             & '15 sec/frame' & '30 sec/frame' & '45 sec/frame' & '60 sec/frame'
                             & '2 min/frame' & '5 min/frame' & '10 min/frame' & 'No Transmitter') asVector
                    Values: fpsval
                    InitialValue: initfpsval).
            (channelField & currentChannelField & scaleField & frameRateField & colorField) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: m = ( |
            | copyTarget: m Title: 'Video Properties').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> 'parent' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         currentFrameRate = ( |
            | 
            (target isInWorld) ifTrue: [
              target world morphs do: [ | :t |
                t morphTypeName = 'videoTransmitterMorph' ifTrue: [
                  (t channelNumber) = (target channelCurrent) ifTrue: [
                    ^ t skipRate.
                  ].
                ].
              ].
            ].
            noTransmitterForTarget).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> 'parent' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: currentChannelField IsPresentDo: [| :n | currentChannelField: n ].
            dict if: channelField IsPresentDo: [| :n | channelField: n ].
            dict if: scaleField IsPresentDo: [| :n | scaleField: n ].
            dict if: colorField IsPresentDo: [| :n | colorField: n ].
            dict if: frameRateField IsPresentDo: [| :n | frameRateField: n ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'videoPropsMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> 'parent' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (32767)'
        
         noTransmitterForTarget <- 32767.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            videoMorph videoPropsMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         scaleField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         videoWindow = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoWindow' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals videoMorph parent videoWindow.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoWindow' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         deleteAfter.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoWindow' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         fullmask.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoWindow' -> () From: ( | {
         'Comment: This is the position of the video window in the
winCanvas. i.e. in X terms in it\'s parent window.\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0@0)'
        
         localPosition <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoWindow' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         mask.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoWindow' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoWindow' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         receiver.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoWindow' -> () From: ( | {
         'Comment: Permits videoReceiver
access to videoMorph\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         videoMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoWindow' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         winCanvas.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> 'parent' -> 'videoWindow' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         xWin.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( | {
         'Category: Video Shape State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         previousRegion.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (4)'
        
         scale <- 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (sequence copyRemoveAll)'
        
         videoWindows <- sequence copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fCategory: avExtensions\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         videoReceiver = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'videoReceiver' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals videoReceiver.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> () From: ( | {
         'Category: videoReceiverState\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         activeVideoWindows.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> () From: ( | {
         'Category: videoReceiverState\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (false)'
        
         isOpen <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals videoReceiver parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         closeReceiver = ( |
            | 
            activeVideoWindows do: [ | :avw |
              avw receiver: nil.
            ].
            activeVideoWindows removeAll.
            send: 'quit'.
            closeSocket.
            isOpen: false.
            receivers remove: self IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         closeSocket = ( |
            | 
            (socket != nil) && [socket isOpen] ifTrue: [
              socket close.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Basic Activity\x7fComment: When copying, initialize a new socket\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             rec.
            | 
            rec: resend.copy.
            rec activeVideoWindows: sequence copy.
            (rec socket != nil) && [rec socket isOpen] ifTrue: [
              rec initSocket.
            ].
            rec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getReceiverFor: aVideoWindow = ( |
             rec.
            | 
            rec: nil.
            receivers do: [ | :r |
              (r xDisplay name) = (aVideoWindow winCanvas xDisplay name) ifTrue: [
                rec: r.
              ].
            ].
            rec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         getReceiverForDisplay: aDisplay = ( |
             rec.
            | 
            rec: nil.
            receivers do: [ | :r |
              (r xDisplay name) = (aDisplay name) ifTrue: [
                rec: r.
              ] False: [
                ('Old display ', r xDisplay name,
                  ' != new display ', aDisplay name)
                  printLine.
              ].
            ].
            rec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         initSocket = ( |
            | 
            totalBytes: 0.
            socket: (os_file openTCPHost: receiverHostName Port: port IfFail: [ | :err |
                  ('videoReceiver connection failed, check for DTVI process on ',
                    receiverHostName) printLine.
                  socket: nil.
                  ^ self.
                ].
            ).
            sendLine: ('name=videoReceiver:', receiverHostName, '\n').
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         openReceiverOnDisplay: aDisplay Window: win With: str = ( |
             host.
            | 

            host: (aDisplay serverName asTokensSeparatedByCharactersIn: ':') first.
            receiverHostName: host.
            recieverTaskName: 'receiver'.
            xDisplay: aDisplay.
            openReceiverWith:
                ' display=', aDisplay name,
                ' usewindow=yes window=', win windowDescriptor printString,
                ' multicast=yes ', str.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         openReceiverWith: str = ( |
            | 
            (socket != nil) && [socket isOpen] ifFalse: [
              initSocket.
            ].
            (socket != nil) && [socket isOpen] ifTrue: [
               " Added interval=30 to get performance info "
               sendLine: ('fork=', recieverTaskName,
                       ' rtvc_video_receiver interval=30 ',
                       str, '\n').
            ].
            isOpen: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (traits clonable)'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            videoReceiver).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (sequence copy)'
        
         receivers <- sequence copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         restart = ( |
             wl.
            | 
            wl: activeVideoWindows copy.
            send: 'quit'.       " Quit the receiver process "
            times delay: 100.   " Give it a chance to finish. "
            activeVideoWindows removeAll.
            wl do: [ | :w |
              w videoMorph startVideoOn: w.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: sending\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         send: str = ( |
            | 
            sendLine: ('routeto=receiver ', str, '\n')).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: sending\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         sendLine: str = ( |
            | 
            (socket != nil) && [socket isOpen] ifTrue: [
              " socket write:IfFail: returns number of bytes transferred. "
              totalBytes: totalBytes +
                (socket write: str IfFail: [ | :err |
                  ('Error ', err printString,
                    ' writing to video receiver via DTVI process on ',
                    receiverHostName) printLine.
                  closeSocket.
                  ^ self.
                ]).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         startVideo: aVideoWindow With: str = ( |
             rec.
            | 

            rec: getReceiverFor: aVideoWindow.
            rec = nil ifTrue: [
              rec: videoReceiver copy.
              rec openReceiverOnDisplay: aVideoWindow winCanvas xDisplay 
                  Window: aVideoWindow xWin With: str.
              receivers add: rec.
            ] False: [
              (rec activeVideoWindows size) > 0 ifTrue: [
                rec send:
                   'addwindow=',
                   aVideoWindow xWin windowDescriptor printString,
                   ' ', str.
              ] False: [
                " This occurs during a restart "
                rec openReceiverOnDisplay: aVideoWindow winCanvas xDisplay 
                    Window: aVideoWindow xWin With: str.
              ].
            ].
            aVideoWindow receiver: rec.
            rec activeVideoWindows add: aVideoWindow.
            rec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         stopAllVideosOnDisplay: aDisplay = ( |
             rec.
            | 
            rec: getReceiverForDisplay: aDisplay.
            rec = nil ifFalse: [
              rec closeReceiver.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         stopVideo: aVideoWindow = ( |
            | 
            (activeVideoWindows size) = 1 ifTrue: [
              closeReceiver.
            ] False: [
              stopVideoForWindow: aVideoWindow xWin.
              activeVideoWindows remove: aVideoWindow.
              aVideoWindow receiver: nil.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> 'parent' -> () From: ( | {
         'Category: Video Activity\x7fCategory: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         stopVideoForWindow: aWin = ( |
            | 
            aWin isLive ifTrue: [
              send: 'dropwindow=',
                    aWin windowDescriptor printString.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> () From: ( | {
         'Category: videoReceiverState\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (3751)'
        
         port <- 3751.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> () From: ( | {
         'Category: videoReceiverState\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         receiverHostName.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> () From: ( | {
         'Category: videoReceiverState\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         recieverTaskName.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> () From: ( | {
         'Category: videoReceiverState\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         socket.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> () From: ( | {
         'Category: videoReceiverState\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0)'
        
         totalBytes <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoReceiver' -> () From: ( | {
         'Category: videoReceiverState\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         xDisplay.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fCategory: avExtensions\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         videoTransmitterMorph = bootstrap define: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawBox' From:
             globals morph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals videoTransmitterMorph.

CopyDowns:
globals morph. copy 
SlotsToOmit: parent prototype rawBox.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (1)'
        
         channelCurrent <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (1)'
        
         channelNumber <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'JPeg\')'
        
         compression <- 'JPeg'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Morph State\x7fComment: Name of the video device to use.
Present to allow a host to have multiple
video transmitters active.\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'/dev/rtvc0\')'
        
         deviceName <- '/dev/rtvc0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (false)'
        
         isOpen <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         videoTransmitterMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits videoTransmitterMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (3751)'
        
         port <- 3751.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Morph State\x7fComment: Name used to refer to the process for this
video transmitter.
Present to allow a host to have multiple
video transmitters active.\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'video\')'
        
         processName <- 'video'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | videoTransmitterMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (((0)@(0)) # ((45)@(25)))'
        
         rawBox <- ((0)@(0)) # ((45)@(25)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (4)'
        
         scale <- 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (8)'
        
         skipRate <- 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         socket.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0)'
        
         totalBytes <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Morph State\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (\'\')'
        
         videoSource <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         moveVideoBy: delta = ( |
             bbox.
            | 
            bbox: boundingBoxInWorld.
            desktop worlds do: [| :w |
              w winCanvases do: [| :c |
                c = self ifTrue: [
                  w allMorphsDo: [| :m |
                    m morphTypeName = 'videoMorph' ifTrue: [
                      m moveWindowsOn: c By: delta.
                    ].
                    m morphTypeName = 'audioMorph' ifTrue: [
                      m moveCanvas: self From: bbox By: delta.
                    ].
                  ].
                ].
              ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         offset = ( |
            | rawOffset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         offset: x = ( |
            | 
            moveVideoBy: x - rawOffset.
            rawOffset: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (0@0)'
        
         rawOffset <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: popUp/Down\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpInWorldPart2 = ( |
            | 
            "Part 2 of popping up in the world: add receiver to the world."
            "Note: Assume that the caller has set the receiver's owner to be
             the world in which the menu should appear."

            addToWorld: owner.
            popUpTime: time current.
            "This is intended to force video windows to change shape."
            world allMorphsDo: [| :m |
              m morphTypeName = 'videoMorph' ifTrue: [
                (m bounds intersects: bounds) ifTrue: [
                  m changeRegion.
                ].
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Basic Activity\x7fComment: Draw the base of this morph on the given canvas.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: aCanvas = ( |
            | 
            resend.baseDrawOn: aCanvas.
            isOpen ifFalse: [
              openVideo.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         channel: n = ( |
            | 
            send: 'channel=', n printString.
            channelCurrent: n.
            "HACK CITY..."
            n = 0 ifTrue: [ setWidth: 320 Height: 240]
                   False: [ setWidth: 160 Height: 120]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         channelDown = ( |
            | 
              channelCurrent > 0 ifTrue: [
                channel: (channelCurrent - 1).
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         channelReset = ( |
            | 
            channel: channelNumber).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         channelUp = ( |
            | 
            channel: (channelCurrent + 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         closeSocket = ( |
            | 
            (socket != nil) && [socket isOpen] ifTrue: [
              socket close.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         closeVideo = ( |
            | 
            stopVideoOn: videoSource.
            closeSocket.
            isOpen: false.
            transmitters remove: self IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Basic Activity\x7fComment: Establish new socket for the copy.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             vid.
            | 
            vid: resend.copy.
            (vid socket != nil) && [vid socket isOpen] ifTrue: [
              vid initSocket.
            ].
            vid).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Basic Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | 
            isOpen ifTrue: [
               closeVideo.
            ]. 
            resend.delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         initSocket = ( |
            | 
            totalBytes: 0.
            videoSource = '' ifTrue: [
              error: 'videoSource not specified'.
            ].
            socket: (os_file openTCPHost: videoSource Port: port IfFail: [ | :err |
                  ('videoTransmitterMorph connection failed, check for DTVI process on ',
                    videoSource) printLine.
                  socket: nil.
                  ^ self.
              ].
            ).
            sendLine: ('name=videoTransmitterMorph:', videoSource, '\n').
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Basic Activity\x7fComment: This message is sent to a morph immediately after it has been
dropped into a new owner.  By default, this method does nothing.
Descendants may override this method if they wish to perform
some operation when they are dropped into a new context.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: newOwner Event: evt = ( |
            | 
            resend.justDroppedInto: newOwner Event: evt.
            isOpen ifFalse: [
              openVideo.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Basic Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         morphTypeName = 'videoTransmitterMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         newScale = ( |
            | 
            scale > 0 ifTrue: [
                send: 'scale=', scale printString.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         openVideo = ( |
            | 
            (socket != nil) && [socket isOpen] ifFalse: [
              initSocket.
              socket = nil ifTrue: [
                ^ self.
              ].
            ].
            videoSource != '' ifTrue: [
              startVideoOn: videoSource.
              isOpen: true.
              transmitters add: self.
            ] False: [
              error: 'videoSource not specified'.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         pause = ( |
            | 
            send: 'stop ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Basic Activity\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         propertySheets = ( |
            | 
            resend.propertySheets copyAddLast:
                (videoTransmitterPropsMorph copyTarget: self)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         restart = ( |
            | 
            closeVideo.
            times delay: 100.  " Allow time for it to finish. "
            openVideo.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         resume = ( |
            | 
            send: 'start').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         scaleDown = ( |
            | 
            scale < 16 ifTrue: [
              scale: (scale * 2) asInteger.
              newScale.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         scaleUp = ( |
            | 
            scale > 1 ifTrue: [
              scale: (scale / 2) asInteger.
              newScale.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: sending\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         send: str = ( |
            | 
            sendLine: ('routeto=', processName, ' ', str, '\n')).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: sending\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         sendLine: str = ( |
            | 
            (socket != nil) && [socket isOpen] ifTrue: [
              " socket write:IfFail: returns number of bytes transferred. "
              totalBytes: totalBytes +
                (socket write: str IfFail: [ | :err |
                  ('Error ', err printString,
                    ' writing to video transmitter via DTVI process on ',
                    videoSource) printLine.
                  closeSocket.
                  ^ self.
                ]).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: controls\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         skip: n = ( |
            | 
            send: 'skip=', n printString.
            skipRate: n.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         startVideoOn: aHost = ( |
             win.
             winid.
            | 
            (socket != nil) && [socket isOpen] ifTrue: [
              videoSource = '' ifTrue: [
                error: 'videoSource not specified'.
              ] False: [
                 sendLine:
                        ('fork=', processName,
                         ' rtvc_video_transmitter',
                         ' device=', deviceName,
                         ' multicast=yes ttl=4',
                         ' skip=', skipRate printString,
                         ' scale=', scale printString,
                         ' compress=', compression,
                         ' channel=', channelNumber printString,
                         '\n').
              ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: closing\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         stopVideoOn: aHost = ( |
             win.
             winid.
            | 
            (socket != nil) && [socket isOpen] ifTrue: [
               sendLine: 'routeto=', processName, ' quit\n'.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'Category: Video Transmitter Activity\x7fCategory: opening\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (sequence copyRemoveAll)'
        
         transmitters <- sequence copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot'
        
         videoTransmitterPropsMorph = bootstrap define: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals subPropertiesSheetMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits videoTransmitterMorph videoTransmitterPropsMorph.

CopyDowns:
globals subPropertiesSheetMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         channelField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         colorField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         compressionField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         deviceNameField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         devicePortField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         frameRateField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits videoTransmitterMorph videoTransmitterPropsMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> 'parent' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptPropertyChanges = ( |
             scl.
            | 
            target channelNumber: (contentsOfTextField: channelField) eval. "to parse float or int"
            target videoSource: (contentsOfTextField: videoSourceField).
            target processName: (contentsOfTextField: processNameField).
            " target colorLevel: (contentsOfEnumeratedField: colorField). "      " Not Implemented Yet... "
            target skip: (contentsOfEnumeratedField: frameRateField).
            target compression: (contentsOfEnumeratedField: compressionField).
            target deviceName: (contentsOfEnumeratedField: deviceNameField).
            " target devicePort: (contentsOfEnumeratedField: devicePortField). "     " Not Implemented Yet... "
            scl: (contentsOfEnumeratedField: scaleField).
            (target scale) = scl ifFalse: [
              target scale: scl.
              " target newScale. "     " Not Implemented Yet... "
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> 'parent' -> () From: ( | {
         'Category: property specifics\x7fComment: The values for fps are not all inclusive. It is possible for a videoTransmitterMorph
to have a skipRate that does not have a corresponding fps value. Extra logic is used
to get the next lower value that is valid for fps.\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         buildPropertyEntries = ( |
             fpsval.
             initfpsval.
            | 

            " Used here to set frameRateField: InitialValue: when the skipRate isn't in the list for Values:
              If frameRateField: Labels: are changed, this vector needs a corresponding change. "
            fpsval: (0 & 1 & 2 & 3 & 4 & 5 & 6 & 9 & 14 & 29 & 59 & 149 & 299 & 449
                     & 899 & 1349 & 1799 & 3599 & 8999 & 17999) asVector.
            fpsval do: [ | :v |
              (target skipRate) >= v ifTrue: [
                 initfpsval: v.
              ].
            ].

            channelField: (buildTextFieldNamed:  'Channel (next start)' String: target channelNumber printString).
            videoSourceField: (buildTextFieldNamed:  'Video Source / Hostname (next start)' String: target videoSource).
            processNameField: (buildTextFieldNamed:  'Process Name (next start)' String: target processName).
            scaleField:     (buildEnumeratedFieldNamed: 'Video Size (next start)'
                    Labels: ('Full (640 x 480)' & 'Normal (320 x 240)'
                           & 'Half (160 x 120)' & 'Quarter (80 x 60)') asVector
                    Values: (1 & 2 & 4 & 8) asVector
                    InitialValue: target scale).
            compressionField:     (buildEnumeratedFieldNamed: 'Compression (next start)'
                    Labels: ('JPeg' & 'CellB') asVector
                    Values: ('JPeg' & 'CellB') asVector
                    InitialValue: target compression).
            colorField:     (buildEnumeratedFieldNamed: 'Color (next start)'
                    Labels: ('Color' & 'GrayScale') asVector
                    Values: ('high' & 'highgray') asVector
                    InitialValue: 'high').
            deviceNameField:     (buildEnumeratedFieldNamed: 'Device (next start)'
                    Labels: ('SunVideo Board 0' & 'SunVideo Board 1'
                             & 'SunVideo Board 2' & 'SunVideo Board 3') asVector
                    Values: ('/dev/rtvc0' & '/dev/rtvc1' & '/dev/rtvc2' & '/dev/rtvc3') asVector
                    InitialValue: target deviceName).
            devicePortField:     (buildEnumeratedFieldNamed: 'Device Port (next start)'
                    Labels: ('Port 1' & 'Port 2'
                             & 'S-VHS Port') asVector
                    Values: (1 & 2 & 0) asVector
                    InitialValue: 1).
            frameRateField:     (buildEnumeratedFieldNamed: 'Frame Rate'
                    Labels: ('30 fps' & '15 fps' & '10 fps' & '7.5 fps' & '6 fps' & '5 fps' & '4.3 fps'
                             & '3 fps' & '2 fps' & '1 fps' & '2 sec/frame' & '5 sec/frame' & '10 sec/frame'
                             & '15 sec/frame' & '30 sec/frame' & '45 sec/frame' & '60 sec/frame'
                             & '2 min/frame' & '5 min/frame' & '10 min/frame') asVector
                    Values: fpsval
                    InitialValue: initfpsval ).
            (frameRateField & scaleField & channelField & videoSourceField & compressionField
              & colorField & deviceNameField & devicePortField & processNameField) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: m = ( |
            | 
            copyTarget: m Title: 'Video Transmitter Properties').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> 'parent' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: frameRateField IsPresentDo: [| :n | frameRateField: n ].
            dict if: scaleField IsPresentDo: [| :n | scaleField: n ].
            dict if: channelField IsPresentDo: [| :n | channelField: n ].
            dict if: videoSourceField IsPresentDo: [| :n | videoSourceField: n ].
            dict if: compressionField IsPresentDo: [| :n | compressionField: n ].
            dict if: colorField IsPresentDo: [| :n | colorField: n ].
            dict if: deviceNameField IsPresentDo: [| :n | deviceNameField: n ].
            dict if: devicePortField IsPresentDo: [| :n | devicePortField: n ].
            dict if: processNameField IsPresentDo: [| :n | processNameField: n ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'videoTransmitterPropsMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         processNameField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: avExtensions InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            traits videoTransmitterMorph videoTransmitterPropsMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         scaleField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'videoTransmitterMorph' -> 'videoTransmitterPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: avExtensions InitialContents: InitializeToExpression: (nil)'
        
         videoSourceField.
        } | ) 



 '-- Side effects'

 globals modules avExtensions postFileIn
