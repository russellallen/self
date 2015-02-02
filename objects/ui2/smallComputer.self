 '$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         smallComputer = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'smallComputer' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'smallComputer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules smallComputer.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            transporter moduleDictionary resetFillingSemaphore.
            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: transporter moduleDictionary
                           Selector: 'resetFillingSemaphore'.
            smallComputer setSlotsFromFile: absolutePath, name, 'Proto.self'.
            resend.postFileIn.
            smallComputer initMiddleButtonMenuProto).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: kansas\x7fComment: a little computer that
represents the host of
particpating viewers in 
this world\x7fModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: public'
        
         smallComputer = bootstrap define: bootstrap stub -> 'globals' -> 'smallComputer' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smallComputer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smallComputer.

CopyDowns:
globals morph. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (sequence copyRemoveAll)'
        
         configLabelMorphs <- sequence copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (nil)'
        
         displayMorph <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (nil)'
        
         hostAudioMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (nil)'
        
         hostVideoMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (nil)'
        
         hostVideoTransmitterMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (sequence copyRemoveAll)'
        
         loggedInUserNames <- sequence copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (nil)'
        
         nameLabelMorph <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smallComputer parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         backgroundCommand: cmd = ( |
            | 
            backgroundCommand: cmd IfFail: [ error: cmd, ' failed.']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         backgroundCommand: cmd IfFail: fb = ( |
             fullCmd.
            | 

            fullCmd: ('csh -c \"(rsh ', hostName, ' \'', cmd , '\' & )' ).

            (os command: fullCmd IfFail: fb) = 0 ifFalse: [ ^ fb value ]. 

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         existsProcessNamed: proc = ( |
             cmd.
            | 
            cmd:  'ps -ef  | grep -v \'grep\' | grep ' , proc.
            (replyLinesForCommand: cmd) isEmpty not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         hideProcesses = ( |
            | 
            processLabelMorphs do: [ | :n | n delete].
            processLabelMorphs: processLabelMorphs copyRemoveAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         hideSystemConfiguration = ( |
            | 
            configLabelMorphs do: [ | :n | n delete].
            configLabelMorphs: configLabelMorphs copyRemoveAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         hideUserNames = ( |
            | 
            loggedInUserNames do: [ | :n | n delete].
            loggedInUserNames: loggedInUserNames copyRemoveAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: public'
        
         hostName = ( |
            | rawHostName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: public'
        
         hostName: str = ( |
            | 
            rawHostName: str.
            nameLabelMorph = nil ifTrue: [ ^ self ].
            nameLabelMorph label: str.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         initMiddleButtonMenuProto = ( |
            | 
            middleButtonMenuProto: ui2Menu copy colorAll: outliner preferences color.
            middleButtonMenuProto 
                    addButtonTarget: smallComputer 
                             Script: 'target showProcesses. 
                                      target showUserNames.
                                      target showUpState.
                                      target showKansasState.'
                              Label: 'update'.
            middleButtonMenuProto 
                    addButtonTarget: smallComputer 
                             Script: 'target hideProcesses. 
                                      target hideUserNames.'
                              Label: 'hide labels'.
            middleButtonMenuProto addDivider.
            middleButtonMenuProto 
                    addButtonTarget: smallComputer 
                             Script: 'target showSystemConfiguration.'
                              Label: 'show system info'.
            middleButtonMenuProto 
                    addButtonTarget: smallComputer 
                             Script: 'target hideSystemConfiguration.'
                              Label: 'hide system info'.
            middleButtonMenuProto addDivider.
            middleButtonMenuProto 
                    addButtonTarget: smallComputer 
                             Script: 'event sourceHand attach: (propertiesSheetMorph copyTarget: target).'
                              Label: 'A/V Properties'.
            middleButtonMenuProto buttons do: [ | :b | b isAsynchronous: true].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'Comment: uses ping\x7fModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: public'
        
         isAlive = ( |
            | 
            (os command: 'csh -c \"/usr/sbin/ping ' , hostName, ' 3 >& /dev/null\"') = 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         killProcessesNamed: proc IfNone: nb IfFail: fb = ( |
             cmd.
             reply.
            | 
            (existsProcessNamed: proc) ifFalse: [ ^ nb value].
            cmd:  'ps -ef  | grep ' , proc.
            (replyLinesForCommand: cmd) do: [ | :line | 
                 reply: 
                    (replyLinesForCommand: 'kill -9 ', (line asTokensSeparatedByWhiteSpace at: 1) printString). 
                 reply isEmpty ifFalse: [^ fb value].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: powerLightMorph  IsPresentDo: [| :new | powerLightMorph:   new ].
            dict if: displayMorph     IsPresentDo: [| :new | displayMorph:      new ].
            dict if: nameLabelMorph   IsPresentDo: [| :new | nameLabelMorph:    new ].
            processLabelMorphs copy do: [ | :lm |
              dict if: lm   IsPresentDo: [| :new |  
                processLabelMorphs remove: lm.
                processLabelMorphs add:    new ].
            ].
            loggedInUserNames copy do: [ | :lm |
              dict if: lm   IsPresentDo: [| :new |
               loggedInUserNames remove: lm.
               loggedInUserNames add:    new ].
            ].
            configLabelMorphs copy do: [ | :lm |
              dict if: lm   IsPresentDo: [| :new |
               configLabelMorphs remove: lm.
               configLabelMorphs add:    new ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (ui2Menu copy colorAll: outliner preferences color)'
        
         middleButtonMenuProto <- ui2Menu copy colorAll: outliner preferences color.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: e = ( |
            | popUpMenu: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         morphTypeName = 'smallComputer'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         openKansasDisplay = ( |
            | 
            world alsoOpenOnDisplay: hostName, ':0.0').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: middleButtonMenuProto copy.
            menu retargetButtonsTo: self.
            menu  popUpInWorld: world From: evt sourceHand.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         printString = ( |
            | 'a ', morphTypeName , '(', hostName , ')').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         propertySheets = ( |
             pv.
            | 
            pv: resend.propertySheets.
            (hostAudioMorph != nil) &&
              [(hostAudioMorph morphTypeName) = (audioMorph morphTypeName)] ifTrue: [
                pv: pv copyAddLast:
                   (hostAudioMorph audioPropsMorph copyTarget: hostAudioMorph).
            ].
            (hostVideoMorph != nil) &&
              [(hostVideoMorph morphTypeName) = (videoMorph morphTypeName)] ifTrue: [
                pv: pv copyAddLast:
                   (hostVideoMorph videoPropsMorph copyTarget: hostVideoMorph).
            ].
            (hostVideoTransmitterMorph != nil) &&
              [(hostVideoTransmitterMorph morphTypeName) = (videoTransmitterMorph morphTypeName)] ifTrue: [
                pv: pv copyAddLast:
                   (hostVideoTransmitterMorph videoTransmitterPropsMorph copyTarget: hostVideoTransmitterMorph).
            ].
            pv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         replyLinesForCommand: cmd = ( |
            | 
            replyLinesForCommand: cmd IfFail: [ | :reply | error: cmd, ' failed -- ', reply]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         replyLinesForCommand: cmd IfFail: fb = ( |
             errorString.
             f.
             fError.
             fErrorName.
             fName.
             fullCmd.
             line.
             lines.
             replyCode.
            | 
            lines: sequence copyRemoveAll.
            fName: '/tmp/tmpSelf_', (cmd asTokensSeparatedByCharactersIn: ' /') first.
            fErrorName: fName, '_error'.
            os command: 'rm -f ', fName      IfFail: fb.
            os command: 'rm -f ', fErrorName IfFail: fb.

            fullCmd: ('csh -c \"(rsh ', hostName, ' \'', cmd , '\' > ', fName, ') >& ', fErrorName, '\"' ).
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
            lines).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         showKansasState = ( |
             found.
            | 
            found: false.
            displayMorph stop.
            isInWorld ifFalse: [^ error: 'not in world' ].
            world winCanvases do: [ | :wc |
             (hostName = (wc display name asTokensSeparatedByCharactersIn: ':') first) ifTrue: [
                 displayMorph start.
                 found: true.
              ].
            ].
            found).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         showProcesses = ( |
             cmd.
             m.
             pt.
             reply.
             waitLabel.
            | 
            processLabelMorphs do: [ | :n | n delete].
            pt: displayMorph globalBaseBounds topLeft - (85 @ -5).
            processLabelMorphs: processLabelMorphs copyRemoveAll.

            waitLabel: ((((labelMorph copyLabel: 'Working...') globalPosition: pt) fontName: scalableFont helvetica) fontSize: 10).
            waitLabel color: (paint named: 'blue').
            addMorph: waitLabel.
            isInWorld ifTrue: [ world displayUpdateNow.].
            cmd: 'ps -ef  | grep -v \\\"grep\\\" | egrep \\\"Self|DTVI|rtvc_video_receiver|rtvc_video_transmitter|tap\\\"'. 
            reply: (replyLinesForCommand: cmd IfFail: [ | :response | waitLabel delete. error: cmd, '\n Failed -- ', response ]).
            (reply copyFilteredBy: [ | :txt | txt matchesPattern: '*Self*']) do: [ | :line | 
               m: ((((labelMorph copyLabel: 'Kansas') globalPosition: pt) fontName: scalableFont helvetica) fontSize: 10).
               processLabelMorphs add: m.
               addMorph: m.
               pt: pt + (0 @ 10).
            ].
            waitLabel changed. waitLabel globalPosition: pt. waitLabel changed.
            isInWorld ifTrue: [ world displayUpdateNow.].
            (reply copyFilteredBy: [ | :txt | txt matchesPattern: '*DTVI*']) do: [ | :line |
               m: ((((labelMorph copyLabel: 'A/V control') globalPosition: pt) fontName: scalableFont helvetica) fontSize: 10).
               processLabelMorphs add: m.
               addMorph: m.
               pt: pt + (0 @ 10).
            ].
            waitLabel changed. waitLabel globalPosition: pt. waitLabel changed.
            isInWorld ifTrue: [ world displayUpdateNow.].
            (reply copyFilteredBy: [ | :txt | txt matchesPattern: '*rtvc_video_receiver*']) do: [ | :line | 
               m: ((((labelMorph copyLabel: '   video receive') globalPosition: pt) fontName: scalableFont helvetica) fontSize: 10).
               processLabelMorphs add: m.
               addMorph: m.
               pt: pt + (0 @ 10).
            ]. 
            waitLabel changed. waitLabel globalPosition: pt. waitLabel changed.
            isInWorld ifTrue: [ world displayUpdateNow.].
            (reply copyFilteredBy: [ | :txt | txt matchesPattern: '*rtvc_video_transmitter*']) do: [ | :line | 
               m: ((((labelMorph copyLabel: '   video transmit') globalPosition: pt) fontName: scalableFont helvetica) fontSize: 10).
               processLabelMorphs add: m.
               addMorph: m.
               pt: pt + (0 @ 10).
            ].
            waitLabel changed. waitLabel globalPosition: pt. waitLabel changed.
            isInWorld ifTrue: [ world displayUpdateNow.].
            (reply copyFilteredBy: [ | :txt | txt matchesPattern: '*tap*']) do: [ | :line |
               m: ((((labelMorph copyLabel: '   audio') globalPosition: pt) fontName: scalableFont helvetica) fontSize: 10).
               processLabelMorphs add: m.
               addMorph: m. 
               pt: pt + (0 @ 10).
            ].
            waitLabel delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         showSystemConfiguration = ( |
             graphicsString.
             m.
             memoryString.
             procCount.
             procString.
             pt.
             typeString.
             vcString.
             videoCardCount.
            | 
            configLabelMorphs do: [ | :n | n delete].
            configLabelMorphs: configLabelMorphs copyRemoveAll.
            typeString: 'type unknown'.
            graphicsString: ''. 
            memoryString: 'mem size unknown'. 
            videoCardCount: 0.
            procCount: 0.
            (replyLinesForCommand: '/usr/sbin/prtconf') do: [ | :line |
              ('Memory size:' isPrefixOf: line)  ifTrue: [memoryString: (line asTokensSeparatedByWhiteSpace at: 2), ' Mb'.].
              (line matchesPattern: '*SPARCstation-20*')  ifTrue: [typeString: 'SS-20'.].
              (line matchesPattern: '*Ultra-*')           ifTrue: [typeString: 'Ultra'.].
              (line matchesPattern: '*SUNW,ffb*')         ifTrue: [graphicsString: graphicsString , 'ffb '.].
              (line matchesPattern: '*cgsix*')            ifTrue: [graphicsString: graphicsString , 'GX '.].
              (line matchesPattern: '*SUNW,sx*')          ifTrue: [graphicsString: graphicsString , 'sx '.].
              (line matchesPattern: '*bwtwo*')            ifTrue: [graphicsString: graphicsString , 'bwtwo '.].
              (line matchesPattern: '*leo*')              ifTrue: [graphicsString: graphicsString , 'leo '.].
              (line matchesPattern: '*SUNW,rtvc*')        ifTrue: [videoCardCount: videoCardCount + 1.].
              (line matchesPattern: '*Ross*')             ifTrue: [procCount: procCount + 1.].
              (line matchesPattern: '*SUNW,UltraSPARC*')  ifTrue: [procCount: procCount + 1.].
            ].
            videoCardCount = 1 ifTrue: [
              vcString: videoCardCount printString, ' videoCard'
            ] False: [
              vcString: videoCardCount printString, ' videoCards'
            ].
            procCount = 1 ifTrue: [
              procString: procCount printString, ' proc'
            ] False: [
              procString: procCount printString, ' procs'
            ].
            pt: displayMorph globalBaseBounds bottomLeft + (-20 @ 30).
            m: ((((labelMorph copyLabel: typeString, ': ', procString,' ', memoryString) 
                   globalPosition: pt) fontName: scalableFont helvetica) fontSize: 10).
            configLabelMorphs add: m.
            addMorph: m.
            pt: pt + (0 @ 12).

            m: ((((labelMorph copyLabel: graphicsString, ' ', vcString )
                   globalPosition: pt) fontName: scalableFont helvetica) fontSize: 10).
            configLabelMorphs add: m.
            addMorph: m.
            pt: pt + (0 @ 10).

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         showUpState = ( |
            | 
             isAlive ifTrue: [
               powerLightMorph color: (paint named: 'leaf')
            ] False: [
               powerLightMorph color: (paint named: 'black').
               displayMorph stop.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         showUserNames = ( |
             pt.
            | 
            loggedInUserNames do: [ | :n | n delete].
            pt: displayMorph globalBaseBounds topRight + (15 @ 5).
            loggedInUserNames: loggedInUserNames copyRemoveAll.
            userNames do: [ | :n . m |
              m: ((((labelMorph copyLabel: n) globalPosition: pt) fontName: scalableFont helvetica) fontSize: 10).
              loggedInUserNames add: m.
              addMorph: m.
              pt: pt + (0 @ 10).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot'
        
         userNames = ( |
             lines.
             reply.
            | 
            lines: (replyLinesForCommand: 'finger').
            lines: lines copyFilteredBy: [ | :l |  
                (l first != '[' ) && ( l asTokensSeparatedByWhiteSpace first != 'Login')
            ].
            reply: set copyRemoveAll.
            lines do: [ | :nl |
              reply add: nl asTokensSeparatedByWhiteSpace first
            ].
            reply).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (nil)'
        
         powerLightMorph <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (sequence copyRemoveAll)'
        
         processLabelMorphs <- sequence copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            smallComputer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputer' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (\'??\')'
        
         rawHostName <- '??'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: kansas\x7fModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: public'
        
         smallComputerDisplay = bootstrap define: bootstrap stub -> 'globals' -> 'smallComputerDisplay' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals morph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smallComputerDisplay' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smallComputerDisplay.

CopyDowns:
globals morph. copy 
SlotsToOmit: parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputerDisplay' -> () From: ( | {
         'Category: Radar Display Morph state\x7fModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         frameCount <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputerDisplay' -> () From: ( | {
         'Category: Radar Display Morph state\x7fModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (20)\x7fVisibility: public'
        
         framesBetweenUpdate <- 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputerDisplay' -> () From: ( | {
         'Category: Radar Display Morph state\x7fModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         isRunning <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputerDisplay' -> () From: ( | {
         'ModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'radarDisplayMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputerDisplay' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: smallComputer InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | radarDisplayMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputerDisplay' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (paint copyRed: 0.5 Green: 0.5 Blue: 0.5)\x7fVisibility: private'
        
         rawColor <- paint copyRed: 0.5 Green: 0.5 Blue: 0.5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputerDisplay' -> () From: ( | {
         'Category: Radar Display Morph state\x7fModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (paint copyRed: 0.93 Green: 0.96 Blue: 0.91)\x7fVisibility: public'
        
         savedColor <- paint copyRed: 0.93 Green: 0.96 Blue: 0.91.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallComputerDisplay' -> () From: ( | {
         'Category: Radar Display Morph state\x7fModuleInfo: Module: smallComputer InitialContents: InitializeToExpression: (0.05)\x7fVisibility: public'
        
         scale <- 0.05.
        } | ) 



 '-- Side effects'

 globals modules smallComputer postFileIn
