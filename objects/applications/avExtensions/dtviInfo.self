 '$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         dtviInfo = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'dtviInfo' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'dtviInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules dtviInfo.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/avExtensions'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         dtviInfo <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: shell shortcuts dtviInfo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: InitializeToExpression: (nil)'
        
         audioControlWorld <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: button messages\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         closeAudioControlWorld = ( |
             w.
            | 
            w: (desktop worldNamed: 'Audio').
            w close.
            w morphs do: [ | :m | m delete ].
            show5: 'Done'. times delay: 2000.  show5: '5'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: button messages\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         closeKansasWindows = ( |
             fh.
            | 
              fh: facilitatorHost.
              participantHosts do: [ | :sc |
                sc = fh ifFalse: [
                   sc world hands copy findFirst: [ | :h |
                        ((sc world winCanvasForHand: h) xDisplay name
                                    asTokensSeparatedByCharactersIn: ':') first = sc hostName
                   ] IfPresent: [ | :h |
                        show3: 'Closing on ', sc hostName.
                        h world safelyDo: [h world closeFromHand: h.].
                   ] IfAbsent: [
                        show3: 'Could not find window on ', sc hostName.
                   ].
                 ].
                sc showKansasState.
              ].
            show3: 'Done'. times delay: 2000.  show3: '3'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: button messages\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         createAudioControlWorld = ( |
             controls.
             displayName.
             hosts.
             wcs.
             yPoint.
            | 
            controls: sequence copyRemoveAll.
            hosts: participantHosts asSet. 
            (vcrHost != nil) && [vcrHost isInWorld] ifTrue: [hosts add: vcrHost.].
            hosts do: [ | :sc |
              show5: 'Making audio control for ', sc hostName.
              sc hostAudioMorph != nil ifTrue: [ 
                controls add: sc hostAudioMorph getAudioControl.
              ].
            ].
            (facilitatorHost != nil) && [facilitatorHost isInWorld] ifTrue: [
              wcs: ( facilitatorHost world winCanvases asList copyFilteredBy: [ | :wc |
                    (wc xDisplay name asTokensSeparatedByCharactersIn: ':') first = facilitatorHost hostName
                ] ).
              yPoint: ((wcs isEmpty) ifTrue: [ 900 ] False: [wcs first xDisplay screen size y - 120.]).
              displayName: ((wcs isEmpty) ifTrue: [ ^ show5: 'Couldn\'t find facilitator xDisplay.' ] False: [wcs first xDisplay name.]).
              show5: 'Opening control window on ', facilitatorHost hostName.
              audioControlWorld: audioMorph audioControlMorph putControls: controls
                                 InNewWorldOnDisplay: displayName
                                 At: 7@yPoint
                                 Limit: false
                                 SeparateBy: 18.
              show5: 'Done'. times delay: 2000.  show5: '5'.
            ] False: [
              show5: 'Could not find facilitator'.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: InitializeToExpression: (nil)'
        
         defaultAVState <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         facilitatorHost = ( |
             name.
            | 
            name: (smallComputerCarpet world winCanvases first xDisplay name asTokensSeparatedByCharactersIn: ':') first.
            participantHosts do: [ | :h | h hostName = name ifTrue: [ ^ h ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         facilitatorUnixName <- 'dtvifac'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         initAVMorphs = ( |
             ch <- 1.
            | 
            participantHosts do: [ | :m |
                m hostVideoMorph: (((videoMorph copy compression: 'CellB') scale: 2)
                                     channelNumber: ch) channelCurrent: ch.
                m hostVideoTransmitterMorph: (((videoTransmitterMorph copy scale: 2)
                                                compression: 'CellB')
                                                videoSource: m hostName)
                                                channelNumber: ch.
                " Ultra 170s do not have enough slots to have two SunVideo boards "
                (m hostName = 'dtvi5') || (m hostName = 'dtvi8') ifTrue: [
                  m hostVideoTransmitterMorph deviceName: '/dev/rtvc0'.
                ] False: [
                  m hostVideoTransmitterMorph deviceName: '/dev/rtvc1'.
                ].
                m hostAudioMorph: (audioMorph copy audioSource: m hostName)
                                   isRestricted: false.
                ch: ch + 1.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         initCarpet = ( |
            | 
            smallComputerCarpet: carpetMorph copy.
            smallComputerCarpet _AddSlots: ( |
                  middleMouseDown: evt = ( dropThroughMarker).
                  wantsMorph: m Event: e = ( | bool. conflictingM. r |
                    " Only absorb small computers "
                    bool: m morphTypeName = smallComputer morphTypeName .
                    bool ifFalse: [ ^ false ].
                    r: m globalPosition - globalPosition.
                    m globalPosition: globalPosition +
                      (((r * 3) / globalBaseBounds size) * (globalBaseBounds size / 3)) +
                      (globalBaseBounds size / 6)  +
                      (m globalBaseBounds size / -2).
                    conflictingM: nil.
                    morphsDo: [ | :mph |
                      (mph != m) && [mph globalPosition = m globalPosition] ifTrue: [
                         mph changed. mph position: mph position + (5@5). mph changed.
                      ].
                    ].
                    bool).
              | ).
            smallComputerCarpet isPersistent: true.
            smallComputerCarpet velcroFlag: false.
            smallComputerCarpet setWidth: 674.
            smallComputerCarpet setHeight: 453.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Comment: This is to be executed from the Self shell to construct a world like we set up at Chico State.
It includes a facilitator\'s control tool, a configuration area and a help area.

There are modified objects so the morph could not be saved to a file. These include
a modified carpetMorph and two modified radarViews.\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         initDTVIWorld = ( |
             c.
             fm.
             rv1.
             rv2.
             world.
            | 
            initCarpet.
            colormapExperiment init.
            " colormapExperiment init creates a new world "
            world: desktop w.
            world winCanvases first xDisplay xMoveResizeWindow: world winCanvases first xWin
                  X: 2 Y: 2 W: 1142 H: 862.
            world name: 'Kansas'.

            1 to: 6 Do: [ | :i |
              labels addLast: (labelMorph copyLabel: (i printString)
                             Font: '-*-times-bold-r-normal--'
                             FontSize: 14
                             Color: (paint named: 'black')).
            ].

            rv1: radarView copy removeAllMorphs.
            rv1 _AddSlots: ( |
              moveViewBy: pt Canvas: c = ( 
                reportDamageForCanvas: c.
                c offset: c offset - pt.
                reportDamageForCanvas: c.
                self)
              | ).
            rv1 addMorph: ((rowMorph copy borderWidth: 2) addMorph:
                ((columnMorph copy beFlexibleHorizontally beShrinkWrapVertically borderWidth: 0)
                    addAllMorphs: ((vector
                       copyAddLast:
                           (((ui2Button copyColor: (worldMorph basicSelfMenu color) Target: rv1)
                                  beFlexibleHorizontally beShrinkWrapVertically
                                  label: 'To Brady Bunch Land'
                                         FontName: '-*-helvetica-medium-r-normal--'
                                         FontSize: 12 FontColor: (paint named: 'black'))
                                  script: ('target moveViewForEvent: event To: target root globalBaseBounds ',
                                            'bottomLeft - (0@(target winCanvasForEvent: event) size y)')))
                       copyAddLast:
                           (((ui2Button copyColor: (worldMorph basicSelfMenu color) Target: rv1)
                                  beFlexibleHorizontally beShrinkWrapVertically
                                  label: '\\/ Down To Configuration land \\/'
                                         FontName: '-*-helvetica-medium-r-normal--'
                                         FontSize: 12 FontColor: (paint named: 'black'))
                                  script: 'target moveViewForEvent: event To: target root globalPosition')))).
            rv1 colorAll: worldMorph basicSelfMenu color.

            rv2: radarView copy removeAllMorphs.
            rv2 _AddSlots: ( |
              moveViewBy: pt Canvas: c = ( 
                reportDamageForCanvas: c.
                c offset: c offset - pt.
                reportDamageForCanvas: c.
                self)
              | ).
            rv2 addAllMorphs: ((vector
                       copyAddLast:
                           (((ui2Button copyColor: (radarView color) Target: rv2)
                                  beFlexibleHorizontally beShrinkWrapVertically
                                  label: 'To Help Land >'
                                         FontName: '-*-times-bold-r-normal--'
                                         FontSize: 14 FontColor: (paint named: 'black'))
                                  script: ('target moveViewForEvent: event To: target root globalBaseBounds ',
                                            'left @((target winCanvasForEvent: event) boundingBoxInWorld top)')))
                       copyAddLast:
                           (((ui2Button copyColor: (radarView color) Target: rv2)
                                  beFlexibleHorizontally beShrinkWrapVertically
                                  label: '< To configuration land'
                                         FontName: '-*-times-bold-r-normal--'
                                         FontSize: 14 FontColor: (paint named: 'black'))
                                  script: ('target moveViewForEvent: event By: (target root globalBaseBounds width - ',
                                            '(target world winCanvasForHand: event sourceHand) boundingBoxInWorld width) @0'))).
            rv2 colorAll: radarView color.

            fm: frameMorph copy color: (paint named: 'lightGray').
            (fm beRigid setWidth: 1141) setHeight: 103.
            fm addAllMorphs: (((vector
               copyAddLast:
                 (labelMorph copyLabel: 'DTVI in Kansas - start up, shut down'
                             Font: '-*-times-bold-r-normal--'
                             FontSize: 18
                             Color: (paint named: 'black')))
               copyAddLast:
                 (labelMorph copyLabel: 'To start a session, press the 6 green buttons in order, waiting for each to complete'
                             Font: '-*-times-bold-r-normal--'
                             FontSize: 14
                             Color: (paint named: 'black')))
               copyAddLast:
                 (((rowMorph copy setHeight: 63) beShrinkWrapHorizontally beRigidVertically color: (paint named: 'lightGray'))
                   addAllMorphs: (((((((vector
                      copyAddLast: (((columnMorph copy color: (paint named: 'lightGray')) borderWidth: 0)
                         addAllMorphs: ((vector
                           copyAddLast: (labels at: 0))
                           copyAddLast:
                              (((ui2Button copyColor: (radarView color) Target: self)
                                  beFlexibleHorizontally beShrinkWrapVertically
                                  label: 'Machines up, logged on?'
                                         FontName: '-*-helvetica-medium-r-normal--'
                                         FontSize: 12 FontColor: (paint named: 'black'))
                                  script: 'target machinesUpLoggedOn'))))
                      copyAddLast: (((columnMorph copy color: (paint named: 'lightGray')) borderWidth: 0)
                         addAllMorphs: (((vector
                           copyAddLast: (labels at: 1))
                           copyAddLast:
                              (((ui2Button copyColor: (radarView color) Target: self)
                                  beFlexibleHorizontally beShrinkWrapVertically
                                  label: 'Start A/V control processes'
                                         FontName: '-*-helvetica-medium-r-normal--'
                                         FontSize: 12 FontColor: (paint named: 'black'))
                                  script: 'target startAVControlProcesses'))
                           copyAddLast:
                              (((ui2Button copyColor: (worldMorph menuColor) Target: self)
                                  beFlexibleHorizontally beShrinkWrapVertically
                                  label: 'Stop A/V control processes'
                                         FontName: '-*-helvetica-medium-r-normal--'
                                         FontSize: 12 FontColor: (paint named: 'black'))
                                  script: 'target stopAVControlProcesses'))))
                      copyAddLast: (((columnMorph copy color: (paint named: 'lightGray')) borderWidth: 0)
                         addAllMorphs: (((vector
                           copyAddLast: (labels at: 2))
                           copyAddLast:
                              (((ui2Button copyColor: (radarView color) Target: self)
                                  beFlexibleHorizontally beShrinkWrapVertically
                                  label: 'Open Kansas windows'
                                         FontName: '-*-helvetica-medium-r-normal--'
                                         FontSize: 12 FontColor: (paint named: 'black'))
                                  script: 'target openKansasWindows'))
                           copyAddLast:
                              (((ui2Button copyColor: (worldMorph menuColor) Target: self)
                                  beFlexibleHorizontally beShrinkWrapVertically
                                  label: 'Close (other) Kansas windows'
                                         FontName: '-*-helvetica-medium-r-normal--'
                                         FontSize: 12 FontColor: (paint named: 'black'))
                                  script: 'target closeKansasWindows'))))
                      copyAddLast: (((columnMorph copy color: (paint named: 'lightGray')) borderWidth: 0)
                         addAllMorphs: (((vector
                           copyAddLast: (labels at: 3))
                           copyAddLast:
                              (((ui2Button copyColor: (radarView color) Target: self)
                                  beFlexibleHorizontally beShrinkWrapVertically
                                  label: 'Start audio and video links'
                                         FontName: '-*-helvetica-medium-r-normal--'
                                         FontSize: 12 FontColor: (paint named: 'black'))
                                  script: 'target startAudioAndVideoLinks'))
                           copyAddLast:
                              (((ui2Button copyColor: (worldMorph menuColor) Target: self)
                                  beFlexibleHorizontally beShrinkWrapVertically
                                  label: 'Stop audio and video links'
                                         FontName: '-*-helvetica-medium-r-normal--'
                                         FontSize: 12 FontColor: (paint named: 'black'))
                                  script: 'target stopAudioAndVideoLinks'))))
                      copyAddLast: (((columnMorph copy color: (paint named: 'lightGray')) borderWidth: 0)
                         addAllMorphs: (((vector
                           copyAddLast: (labels at: 4))
                           copyAddLast:
                              (((ui2Button copyColor: (radarView color) Target: self)
                                  beFlexibleHorizontally beShrinkWrapVertically
                                  label: 'Create audio control world'
                                         FontName: '-*-helvetica-medium-r-normal--'
                                         FontSize: 12 FontColor: (paint named: 'black'))
                                  script: 'target createAudioControlWorld'))
                           copyAddLast:
                              (((ui2Button copyColor: (worldMorph menuColor) Target: self)
                                  beFlexibleHorizontally beShrinkWrapVertically
                                  label: 'Close audio control world'
                                         FontName: '-*-helvetica-medium-r-normal--'
                                         FontSize: 12 FontColor: (paint named: 'black'))
                                  script: 'target closeAudioControlWorld'))))
                      copyAddLast: (((columnMorph copy color: (paint named: 'lightGray')) borderWidth: 0)
                         addAllMorphs: ((vector
                           copyAddLast: (labels at: 5))
                           copyAddLast:
                              (((ui2Button copyColor: (radarView color) Target: self)
                                  beFlexibleHorizontally beShrinkWrapVertically
                                  label: 'Open audio control windows'
                                         FontName: '-*-helvetica-medium-r-normal--'
                                         FontSize: 12 FontColor: (paint named: 'black'))
                                  script: 'target openAudioControlWindows'))))
                      copyAddLast: rv1))).
            fm globalPosition: 1@760.

            " Construct Configuration Land "
            world addMorph: fm.
            rv2 globalPosition: 987@1173.
            world addMorph: rv2.
            smallComputerCarpet globalPosition: 239@1118.
            world addMorph: smallComputerCarpet.

            " Now construct Help land "
            world addMorph:  ((labelMorph copyLabel: 'For help at Sun Labs:'
                             Font: '-*-times-bold-r-normal--'
                             FontSize: 14
                             Color: (paint named: 'black')) globalPosition: 1476@1152).
            world addMorph:  ((labelMorph copyLabel: 'Randy Smith  (415) 336 2620'
                             Font: '-*-times-bold-r-normal--'
                             FontSize: 14
                             Color: (paint named: 'black')) globalPosition: 1552@1182).
            world addMorph:  ((labelMorph copyLabel: 'Ron Hixon      (415) 336 6267'
                             Font: '-*-times-bold-r-normal--'
                             FontSize: 14
                             Color: (paint named: 'black')) globalPosition: 1552@1200).
            world addMorph:  ((labelMorph copyLabel: 'Don\'t press this unless you know what you\'re doing!'
                             Font: '-*-times-bold-r-normal--'
                             FontSize: 14
                             Color: (paint named: 'black')) globalPosition: 1807@1496).
            world addMorph:  ((labelMorph copyLabel: '\\/'
                             Font: '-*-times-bold-r-normal--'
                             FontSize: 14
                             Color: (paint named: 'black')) globalPosition: 1968@1518).
            world addMorph:  ((((ui2Button copyColor: (paint named: 'lightGray') Target: self)
                             beFlexibleHorizontally beShrinkWrapVertically
                             label: 'Emergency open window at Sun Labs'
                                    FontName: '-*-times-bold-r-normal--'
                                    FontSize: 14 FontColor: (paint named: 'black'))
                             script: '(desktop worldNamed: \'Kansas\') alsoOpenOnDisplay: \'kansas.sunlabs.com:0.0\'')
                             globalPosition: 1862@1535).

            world addMorph:  (radarView copy globalPosition: 0@1465).

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: InitializeToExpression: (sequence copyRemoveAll)'
        
         labels <- sequence copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: button messages\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         machinesUpLoggedOn = ( |
             failedHosts.
             failedLogins.
            | 
            failedLogins:  sequence copyRemoveAll.
            failedHosts: sequence copyRemoveAll.
            participantHosts do: [ | :c. mssg. users |
              c morphTypeName = smallComputer morphTypeName ifTrue: [ | up |
                 up: c isAlive.
                 up ifTrue: [mssg: c hostName, ' up, ']
                     False: [mssg: c hostName, ' down, '
                             failedHosts add: c ].
                users: c userNames.
                (users includes: studentUnixName) || [
                   (c = facilitatorHost) && [users includes: facilitatorUnixName] ]
                  ifTrue: [ mssg: mssg, 'logged in.']
                   False: [mssg: mssg, ' no one logged in.'.  failedLogins add: c ].
              show1: mssg.
              times delay: 200.
              ].
            ].
            (failedHosts, failedLogins) isEmpty ifTrue: [
              show1: 'OK'. times delay: 2000. show1: '1'. 
            ] False: [ | str |
              str: ''.
              failedHosts isEmpty ifFalse: [
                str: 'Not up: '.
                failedHosts do: [ | :c | 
                  str: str , ' ', c hostName.
                ].
              str: str , '. '.
              ].
              failedLogins isEmpty ifFalse: [
                str: str, 'Not logged in: '.
                failedLogins do: [ | :c | 
                  str: str , ' ', c hostName.
                ].
              ].
              show1: str.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         nonOzianDisplayNames = ( |
             dispNames.
             ns.
             w.
            | 
            dispNames: sequence copyRemoveAll.
            ns: participantHosts.
            w: ns first world.
            ns: (ns remove: facilitatorHost IfAbsent: ns).
            ns do: [ | :sc |
              w winCanvases findFirst: [ | :wc | 
                sc hostName isPrefixOf: wc xDisplay name
              ] IfPresent: [ | :wc |
                dispNames add: wc xDisplay name.
              ] IfAbsent: [].
            ].
            dispNames).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: button messages\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         openAudioControlWindows = ( |
             caps.
             hostNames.
             studentHosts.
            | 
            audioControlWorld winCanvases isEmpty ifTrue:  [
               show6: 'Must open audio control world first'.  times delay: 2000.  show6: '6'.
               ^ self ].
            studentHosts: participantHosts copy.
            studentHosts remove: facilitatorHost.
            hostNames: list copyRemoveAll.
            studentHosts do: [ | :sc. wcs. xPoint |
              show6: 'Open control for ', sc hostName.
              wcs: ( sc world winCanvases asList copyFilteredBy: [ | :wc |
                  (wc xDisplay name asTokensSeparatedByCharactersIn: ':') first = sc hostName
              ] ).
              xPoint: ((wcs isEmpty) ifTrue: [ 900 ] False: [wcs first xDisplay screen size x - 108.]).
              audioMorph audioControlMorph
                         getControlWindowsFor: (list copyRemoveAll add: sc hostName)
                         OnWorld: audioControlWorld At: xPoint @ 500.
            ].
            caps: sequence copyRemoveAll.
            audioControlWorld allMorphs do: [ | :m |
              (m morphTypeName = ui2Button   morphTypeName) || 
              (m morphTypeName = sliderMorph morphTypeName) ||
              (m morphTypeName = audioMorph  audioPropsMorph enumeratedDrawableMorph morphTypeName)
                  ifTrue: [caps add: (m makeCapTypeName: 'pressButton')].
            ].
            audioControlWorld hands do: [ | :h |
              h addAllCapabilities: caps.
            ].

            show6: 'Done'. times delay: 2000.  show6: '6'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: button messages\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         openKansasWindows = ( |
             studentHosts.
            | 
            studentHosts: participantHosts copy.
            studentHosts remove: facilitatorHost.
            studentHosts do: [ | :c |
              c showKansasState ifTrue: [
                 show3: c hostName , ' already open.'. times delay: 2000.
              ] False: [
                 show3: 'Opening to ' , c hostName.
                 c world addWindowOnDisplay: (c hostName, ':0.0')
                                     Bounds: ((0@0) # ((1142@871) - (166@136)))
                                    Limited: true.
                 c showKansasState.
              ].
            ].
            show3: 'Done'. times delay: 2000.  show3: '3'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         participantHosts = ( |
            | 
            smallComputerCarpet morphs asList copyFilteredBy: [ | :m |
               m morphTypeName = smallComputer morphTypeName ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         positionFor: c = ( |
             bdr <- 2.
             hh.
             t.
             ww.
            | 
            c = vcrHost ifTrue: [ t: 2@2] False: [
            t: ((c position + (c globalBaseBounds size / 2)) -
                   (smallComputerCarpet globalBaseBounds size / 6)) /
                        (smallComputerCarpet globalBaseBounds size / 3).
            ].
            ww: (640 / c hostVideoMorph scale) + (2 * bdr).
            hh: (480 / c hostVideoMorph scale) + (2 * bdr).
            ( t * ( ww@hh ) ) + ( bdr@bdr )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         setWorldHost = ( |
             candidates.
             errorString.
             f.
             fError.
             fErrorName.
             fName.
             fb.
             fullCmd.
             line.
             lines.
             replyCode.
             worldHostName.
            | 
             fb: [error: 'hostnmae command failed.'].
            lines: sequence copyRemoveAll.
            fName: '/tmp/tmpSelf_hostname' .
            fErrorName: fName, '_error'.
            os command: 'rm -f ', fName      IfFail: fb.
            os command: 'rm -f ', fErrorName IfFail: fb.

            fullCmd: ('csh -c \"(hostname ',' > ', fName, ') >& ', fErrorName, '\"' ).
            replyCode: (os command: fullCmd IfFail: fb).

            fError: (os_file openForReading: fErrorName).
            errorString: fError contents.
            errorString isEmpty ifFalse: [^ fb value: errorString ].
            fError close.
            replyCode = 0 ifFalse: [ ^ fb value ].
            f: os_file openForReading: fName.
            [f atEOF] whileFalse: [ 
              line: f readLine. 
              line size = 0 ifFalse: [
                lines add: line.
              ].
            ].
            f close.
            lines do: [ | :l | 
               ('unkown host'       isSuffixOf: l) ifTrue: [ ^ fb value].
               ('permission denied' isSuffixOf: l) ifTrue: [ ^ fb value].
            ].
            os command: 'rm -f ', fName      IfFail: fb.
            os command: 'rm -f ', fErrorName IfFail: fb. 
            worldHostName: lines first.
            candidates: smallComputerCarpet world allMorphs copyFilteredBy: [ | :m | 
              (m morphTypeName = smallComputer morphTypeName) && [m hostName = worldHostName]
            ].
            candidates isEmpty ifTrue:  [ ^ error: 'No small computers named ', worldHostName.].
            candidates size > 1 ifTrue: [ ^ error: 'Too many smallComputers named ', worldHostName. ].
            worldHost: candidates first.
            worldHost).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: showing in labels\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         show1: str = ( |
             m.
            | 
            m: (labels at: 0).
            m label: str.
            m world displayUpdateNow.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: showing in labels\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         show2: str = ( |
             m.
            | 
            m: (labels at: 1).
            m label: str.
            m world displayUpdateNow.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: showing in labels\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         show3: str = ( |
             m.
            | 
            m: (labels at: 2).
            m label: str.
            m world displayUpdateNow.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: showing in labels\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         show4: str = ( |
             m.
            | 
            m: (labels at: 3).
            m label: str.
            m world displayUpdateNow.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: showing in labels\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         show5: str = ( |
             m.
            | 
            m: (labels at: 4).
            m label: str.
            m world displayUpdateNow.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: showing in labels\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         show6: str = ( |
             m.
            | 
            m: (labels at: 5).
            m label: str.
            m world displayUpdateNow.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: InitializeToExpression: (nil)'
        
         smallComputerCarpet <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: button messages\x7fComment: For each relevant host, start A/V Control process if needed, close and
kill video transmitter process if it exists, and start new video
transmitter process.\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         startAVControlProcesses = ( |
             hosts.
            | 
            vcrHost = nil ifTrue: [
              hosts: participantHosts asSet 
            ] False: [
              hosts: (participantHosts asSet add: vcrHost)
            ].
            hosts do: [ | :c |
                (c existsProcessNamed: 'avcontrol') ifTrue: [
                      show2: 'A/V control already on ', c hostName.
                ] False: [
                      show2: 'Starting A/V control on ', c hostName.
                      c backgroundCommand: 'cd /opt/SUNLdtvi/bin ; setenv DISPLAY ', 
                                           facilitatorHost hostName, 
                                           ':0.0; (/usr/openwin/bin/cmdtool -Wi -label ', 
                                           c hostName, 
                                           ' ./AVcontrol &)'
                          IfFail: [
                             show2: 'Can\'t start A/V control for ', c hostName.
                      ].
                      times delay: 2500. "IMPORTANT: avoiding some race condition - 
                                          control process must be started before transmitter starts."
                ].
                c hostVideoTransmitterMorph isOpen ifTrue: [c hostVideoTransmitterMorph closeVideo].
                [c existsProcessNamed: 'rtvc_video_transmitter'] whileTrue: [
                    show2: 'Killing existing video transmitter for ', c hostName.
                    c killProcessesNamed: 'rtvc_video_transmitter' IfNone: [] IfFail: [
                       show2: 'Unable to kill transmitter for ', c hostName.
                       ^ self
                    ].
                ].
                show2: 'Starting video transmitter for ', c hostName.
                c hostVideoTransmitterMorph openVideo.
                c showProcesses.
            ].
            show2: 'Done'. times delay: 2000.  show2: '2'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: button messages\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         startAudioAndVideoLinks = ( |
             hosts.
            | 
            vcrHost = nil ifTrue: [
              hosts: participantHosts asSet 
            ] False: [
              hosts: (participantHosts asSet add: vcrHost)
            ].
            hosts do: [ | :c |
                show4: 'Starting audio on ', c hostName.
                c hostAudioMorph openAudio.
                c hostAudioMorph setPlayPortTo: c hostAudioMorph playPort.
                c hostAudioMorph setRecordPortTo: c hostAudioMorph recordPort.
                show4: 'Opening video for ', c hostName.
                startVideoFor: c.
            ].
            show4: 'Done'. times delay: 2000.  show4: '4'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         startVideoFor: c = ( |
             edge.
            | 
            c isInWorld ifTrue: [
              edge: (c world allMorphs asList copyFilteredBy: [ | :mm |
                (mm morphTypeName = screenEdge morphTypeName) &&
                    [(mm orientation) = 'top'] &&
                    [(((mm winCanvas xDisplay name) asTokensSeparatedByCharactersIn: ':') first) = c hostName] ] ).
              edge size = 0 ifTrue: [
                c hostVideoMorph globalPosition: ((positionFor: c) + (2@2)).
                c world addMorph: c hostVideoMorph.
              ] False: [
                c hostVideoMorph globalPosition: ((edge first globalPosition) + (positionFor: c) + (2@2)).
                edge first addMorph: c hostVideoMorph.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: button messages\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         stopAVControlProcesses = ( |
             failures.
             hosts.
             s.
            | 
            failures: ''.
            vcrHost = nil ifTrue: [
              hosts: participantHosts asSet 
            ] False: [
              hosts: (participantHosts asSet add: vcrHost)
            ].
            hosts do: [ | :c |
               c hostVideoTransmitterMorph isOpen ifTrue: [c hostVideoTransmitterMorph closeVideo].
               [c existsProcessNamed: 'rtvc_video_transmitter'] whileTrue: [
                   show2: 'Killing existing video transmitter for ', c hostName.
                   c killProcessesNamed: 'rtvc_video_transmitter' IfNone: [] IfFail: [
                      show2: 'Unable to kill transmitter for ', c hostName.
                      ^ self
                   ].
               ].
               (c existsProcessNamed: 'avcontrol') ifTrue: [
                 show2: 'Connecting to ', c hostName.
                 s: (os_file openTCPHost: c hostName Port: 3751 IfFail: nil).
                 s = nil ifTrue: [ 
                    failures: failures, ' '. c hostName. 
                    show2: 'Could not connect to ', c hostName.
                 ] False: [
                     s write: 'exit' IfFail: [show2: 'Write failed on ', c hostName. failures: failures, ' ', c hostName].
                     s close.
                 ].
               ].
               c showProcesses.
            ].
            failures isEmpty ifTrue: [
               show2: 'Done'. times delay: 2000.  show2: '2'.
            ] False: [
               show2: 'Close failed on ', failures.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         stopAudio = ( |
             hosts.
            | 
            vcrHost = nil ifTrue: [
              hosts: participantHosts asSet 
            ] False: [
              hosts: (participantHosts asSet add: vcrHost)
            ].
            hosts do: [ | :m |
              m hostAudioMorph  closeAudio.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'Category: button messages\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         stopAudioAndVideoLinks = ( |
            | 
            show4: 'Stopping audio'.
            stopAudio.
            show4: 'Stopping video'.
            stopVideo.
            show4: 'Stopping video transmitters'.
            stopVideoTransmitters.
            show4: 'Done'. times delay: 2000.  show4: '4'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         stopVideo = ( |
             hosts.
            | 
            vcrHost = nil ifTrue: [
              hosts: participantHosts asSet 
            ] False: [
              hosts: (participantHosts asSet add: vcrHost)
            ].
            hosts do: [ | :m |
              m hostVideoMorph isInWorld ifTrue: [
                m hostVideoMorph delete.
              ] False: [
                m hostVideoMorph isOpen ifTrue: [
                  m hostVideoMorph closeVideo.
                ].
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         stopVideoTransmitters = ( |
             hosts.
            | 
            vcrHost = nil ifTrue: [
              hosts: participantHosts asSet 
            ] False: [
              hosts: (participantHosts asSet add: vcrHost)
            ].
            hosts do: [ | :m |
              m hostVideoTransmitterMorph isInWorld ifTrue: [
                m hostVideoTransmitterMorph delete.
              ] False: [
                m hostVideoTransmitterMorph isOpen ifTrue: [
                  m hostVideoTransmitterMorph closeVideo.
                ].
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: FollowSlot'
        
         studentUnixName <- 'dtvi'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: InitializeToExpression: (nil)'
        
         vcrHost <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'dtviInfo' -> () From: ( | {
         'ModuleInfo: Module: dtviInfo InitialContents: InitializeToExpression: (nil)'
        
         worldHost <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: opening new windows\x7fComment: Open an additional window for this world on the given display.
Initially, this window will have the size defined in bounds
and its upper left-hand corner will be positioned at the
origin defined in bounds.\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         alsoOpenOnDisplay: dispName Bounds: bounds Limited: isLimited = ( |
            | 
            addWindowOnDisplay: dispName Bounds: bounds Limited: isLimited.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: dtviInfo InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpenOnDisplay: dispName Bounds: b Xil: xil Limited: isLimited = ( |
             new.
            | 
            new: copyRemoveAllMorphs.
            desktop addWorld: new. "this sets the name"
            new winCanvases: vector.
            new bufCanvases: vector.
            new hands:       vector.
            new activities:  activities copyRemoveAll.
            new uiCritical:  uiCritical copyBinary.

            new uiProcess:   nil.
            new stepProcess: nil.
            new stepWatcher: nil.
            new stepTimeoutProcess: nil.

            new xilWorld: xil.

            new damageList:         damageList copyRemoveAll.
            new addWindowOnDisplay: dispName Bounds: b Limited: isLimited.
            new reifiedObjects:     reifiedObjects copyRemoveAll.
            new outlinerActivities: outlinerActivities copyRemoveAll.

            new backgroundMenu: nil.
            new).
        } | ) 



 '-- Side effects'

 globals modules dtviInfo postFileIn
