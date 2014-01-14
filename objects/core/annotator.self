 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot'
        
         annotator = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'annotator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'annotator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules annotator.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot'
        
         myComment <- 'no comment'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: public'
        
         annotator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter annotator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: public'
        
         annotateAll = ( |
            | 
            assignSlotsToModules.
            transporter moduleDictionary sortedDo: [|:m| 
              ('Checking annotations of: ', m name) printLine.
              m annotate.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: public'
        
         annotateModule: mod = ( |
             oldOrphans.
             oldSlots.
            | 
            [
              oldOrphans: (transporter moduleDictionary orphansFor: mod name) copy.
              oldSlots: mod slots copy.
              assignSlotsToModule: mod name.
              mod slots do: [|:s. |
                ensureAnnotationsOfSlot: s.
              ].
            ] untilTrue: [
                     mod isCurrent
              && [ ( oldOrphans = (transporter moduleDictionary orphansFor: mod name) )
              && [   oldSlots   = mod slots ]]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: private'
        
         askIfObjectIsCopiedDown: p = ( |
             m.
             query.
            | 
            m: p targetMirror.
            m isReflecteeMethod ifTrue: [^ self].
            m copyDowns isEmpty ifTrue: [ | cd |
              query: p fullName, ' is not annotated as being the result\n',
                     'of a copy-down. Do you wish to annotate it as being so?'.
              (userQuery askYesNo: query) ifTrue: [
                cd: transporter moduleInfo copyDown copyForParentMirror: (getParentMirrorFor: p).
                cd: cd copyForSelector:    (getSelectorFor: p Parent: cd parentMirror).
                cd: cd copyForSlotsToOmit: (getSlotsToOmitFor: p CopyDown: cd).
                m copyDowns: vector copyAddFirst: cd.
              ].
            ] False: [
              query: p printString, ' is annotated as as being the result\n',
                     'of a copy-down. Do you wish to remove this annotation?'.
              (userQuery askYesNo: query) ifTrue: [ m copyDowns: vector ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: public'
        
         assignSlotsToModule: name = ( |
            | "use orphansFor: to avoid refil of whole cache when
             just writing one module"
            [
              (transporter moduleDictionary orphansFor: name) 
               asVector sortedBy: ( |
                element: e1 Precedes: e2 = ( e1 name < e2 name)
              | ) Do: [|:s | ensureAnnotationsOfSlot: s. ].

              (name isEmpty ifTrue: [transporter moduleDictionary] 
                             False: [transporter moduleDictionary at: name]
              ) isCurrent
                ifTrue: [^self].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: public'
        
         assignSlotsToModules = ( |
            | 
            assignSlotsToModule: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'Comment: set to true for converting non-transporter
files.\x7fModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: public'
        
         automaticallyDefault = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: public'
        
         ensureAnnotationsOfSlot: s = ( |
            | 
            ensureModuleOfSlot: s.
            ensureCreatorOfContents: s.
            ensureCopyDownOfContents: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: private'
        
         ensureCopyDownOfContents: s = ( |
            | 
                s isAssignable 
            && [s initialContents isOKToFollow
            && [s contents copyDowns isEmpty not
            && [s isCreator
            && [s contents storeStringOfReflecteeIfPresent: false
                                                 IfAbsent: true]]]]
             ifTrue: [
              userQuery report: 'The contents of slot: ', s holder name, ' ', s name,
                ' is annotated as copied-down, but is in an assignable slot.',
                '\n    Upon assignment, the annotation will be lost. You may',
                '\n    want to annotate this slot as "initializeToExpression".'.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: public'
        
         ensureCreatorOfContents: s = ( |
             action.
             input.
             mir.
             msg.
             newPath.
             p.
             why.
            | 
            s module isEmpty ifTrue: [^ self].
            s isContentsFiledOut ifFalse: [^ self].
            mir: s contents.
            mir isReflecteeImmutable ifTrue: [^ self].
            mir areReflecteesSlotsMutable ifFalse: [^ self].
            mir creatorPathIfPresent: [^ self] IfAbsent: [|:e| why: e].
            mir isReflecteeMethod ifTrue: [ ^ self ].

            p: s holder creatorPath extendedBy: s name.

            setCreatorOfSlot: s Default: p Why: why).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: public'
        
         ensureModuleOfSlot: s = ( |
             action.
             guess.
             modName.
             msg.
             ok <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            s module isEmpty ifFalse: [ ^self].

            setModuleOfSlot: s 
            Default:
               s holder 
                      creatorPathIfPresent: [|:p| p targetSlot module]
                                 IfAbsent: ''.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: private'
        
         getParentMirrorFor: p = ( |
             ok <- bootstrap stub -> 'globals' -> 'false' -> ().
             parentMirr.
             query.
            | 
            query: 'Please specify the path for the source of the copy-down operation.'.
            [ok] whileFalse: [| input <- ''. parentPath |
                ok: true.  "assume path will be okay"
                input: (userQuery askString: query DefaultAnswer: input).
                parentPath: path parseFromShortName: input.
                parentMirr: parentPath targetMirrorIfAbsent: [
                    ok: false.
                    query: 'Could not parse or find target mirror for path: ', input , '.\n',
                           'Please specify the path for the source of the copy-down operation.'.
                ].
            ].
            parentMirr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: private'
        
         getSelectorFor: p Parent: pm = ( |
             ms.
             s.
            | 
            "get copy selector"
              s: (userQuery askString: 'Please specify the selector to use when copying.'
                    DefaultAnswer: 'copy').
              s first = '_' ifTrue: [ ^s ].
              ms: pm lookupKey: s.
              case if: [ms isEmpty] Then: [
                  userQuery report: ('Sorry, ', p fullName, ' does not understand "', s, '"').
              ] If: [ms size > 1] Then: [
                  userQuery report: ('Sorry, ', p fullName, ' inherits more than one "', s, '"').
              ] Else: [ ^s ].
              getSelectorFor: p Parent: pm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: private'
        
         getSlotsToOmitFor: p CopyDown: cd = ( |
             newSlotsToOmit.
             slotsToOmit.
            | 
            slotsToOmit: cd extensionalSlotsToOmitFor: p targetMirror.
            slotsToOmit: (slotsToOmit copyMappedBy: [|:s| s name]) asList.
            [| query. slotsToNotOmit. otherSlots. additionalSlotsToOmit |
              slotsToOmit isEmpty ifTrue: [
                query: 'Currently, no slots are ommited. '.
              ] False: [
                query: 'Here is the current list of slots to omit:\n'.
                slotsToOmit asVector sortedDo: [|:n| query: query & ('    ', n, '\n')].
              ].
              query: (query & 'Is this OK?') flatString.
              (userQuery askYesNo: query) ifTrue: [ ^slotsToOmit ].

              slotsToOmit isEmpty ifFalse: [
                slotsToNotOmit:
                  (userQuery askList: 'Which slots should not be omitted?'
                    DefaultItems: slotsToOmit).
                slotsToNotOmit do: [| :s | slotsToOmit remove: s IfAbsent: nil ].
              ].

              otherSlots: cd parentMirror keys asList.
              slotsToOmit do: [| :s | otherSlots remove: s IfAbsent: nil ].
              additionalSlotsToOmit:
                (userQuery askList: 'Please list additional slots to omit.'
                  DefaultItems: otherSlots).
              additionalSlotsToOmit do: [| :s |
                (cd parentMirror includesKey: s) ifTrue: [
                  slotsToOmit add: s.
                ] False: [
                  userQuery report: 'Sorry, the copied object does not include the slot ', s.
                ].
              ].

            ] loop.
            newSlotsToOmit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: private'
        
         maybeEdit: s = ( |
            | 
            (transporter moduleDictionary at: s module) canBeFiledOut
             ifFalse: [
              '(You will also have to edit ', s module, '.self.)' printLine.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: private'
        
         setCreatorOfSlot: s Default: d Why: why = ( |
             action.
             input.
             msg.
             newPath.
             pathNames.
             paths.
             slots.
            | 

            msg: (
                'Could not find creator of:\n    ' & 
                d fullName                     & 
                '\n    in module: ' & s module &
                '\n    because: '   & why      &
                '\nAction?') flatString.

            action: 'setPath' "userQuery askMultipleChoice: msg
                  Choices: ( 'Halt' & 'Skip' & 'Set creator path') asList
                  Results: ('halt' & 'skip' & 'setPath') asList".

            'halt'    = action ifTrue: [ halt. ^ self ].
            'skip'    = action ifTrue: [       ^ self ].

            userQuery show: 'Searching for possibilities'
                     While: [ slots: browseWellKnown referencesOfReflectee: s contents ].

            paths: list copyRemoveAll.
            slots do: [|:s| s holder filedOutCreatorPathIfPresent: [|:p|
              paths addLast: p extendedBy: s name
             ] IfAbsent: [].
            ].
            paths: paths asVector sortBy: ( | 
              element: p1 Precedes: p2 = (
              p1 size  compare:  p2 size
                        IfLess:  0 true
                         Equal:  [ p1 fullName < p2 fullName ]
                       Greater:  0 false) | ).
            pathNames: paths copyMappedBy: [|:p| p fullName].

            input: 
             case 
              if: [pathNames isEmpty  ||  [pathNames size > 7]] Then: [
                     userQuery askString: 'Please specify the creator path for ', d fullName,
                                          '\nor empty to set it to the null path.'
                         DefaultAnswer: d fullName
            ] If: [automaticallyDefault] Then: [ pathNames first 
            ] If: [pathNames size = 1] Then: [
                     userQuery askString: 'Please specify the creator path for ', d fullName,
                                          '\nor type empty to set it to the null path.'
                         DefaultAnswer: pathNames first
            ] Else: [ 
                     userQuery askMultipleChoice: 'Please choose the creator path for: ', d fullName
                                         Choices: ( pathNames copyAddLast: '<none>' )
                                         Results:   pathNames copyAddLast: ''
            ].

            s contents creatorSlot:
              input = ''
                ifTrue: [ (reflect: ()) creatorSlotHint ]
                 False: [ ( path parseFromShortName: input ) targetSlot ].

            maybeEdit: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: private'
        
         setModuleOfSlot: s Default: d = ( |
             action.
             modName.
             msg.
             ok <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 

            msg: 'This slot is not claimed by any module:' &
                 '\n  Slot:      ' & s name                &
                 '\n  In object: ' & s holder creatorPath fullName.
            s contents creatorPath = nullPath ifFalse: [
                msg: msg & '\n  Contents:  ' & s contents creatorPath fullName.
            ].
            d isEmpty ifFalse: [
                msg: msg & '\n  Suggested Module: ' & d.
            ].
            msg: (msg & '\nAction?') flatString.

            d isEmpty ifFalse: [ 
                action: 
                  automaticallyDefault ifTrue: 'accept' 
                    False: [
                      userQuery askMultipleChoice: msg
                      Choices: (
                        'Leave it alone' &
                        'Put in suggested module' &
                        'Put in a different module') asList
                      Results: ('skip' & 'accept' & 'specifyModule') asList].
            ] True: [
                action: userQuery askMultipleChoice: msg
                    Choices: (
                        'Leave it alone' &
                        'Put it in a module') asList
                    Results: ('skip' & 'specifyModule') asList.
            ].
            action = 'skip' ifTrue: [ ^self ].
            action = 'accept' ifTrue: [
                s module: d.
                maybeEdit: s.
                ^self.
            ].

            modName: transporter moduleDictionary
              getAModuleNameQuestion: 'Please specify the module for this slot'
                             Default: ''
                            IfCancel: [ ^ self ].
            s module: modName.
            maybeEdit: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'Comment: Like annotator, but defaults everything.
 -- Ungar, 1/23/95\x7fModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: public'
        
         defaultingAnnotator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'defaultingAnnotator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter defaultingAnnotator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'defaultingAnnotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: private'
        
         ensureCopyDownOfContents: s = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'defaultingAnnotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'transporter' -> 'annotator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'defaultingAnnotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: private'
        
         setCreatorOfSlot: s Default: d Why: why = ( |
            | 
            contents creatorPath: d.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'defaultingAnnotator' -> () From: ( | {
         'ModuleInfo: Module: annotator InitialContents: FollowSlot\x7fVisibility: private'
        
         setModuleOfSlot: s Default: d = ( |
            | 
            d isEmpty ifFalse: [
              s module: d.
            ].
            self).
        } | ) 



 '-- Side effects'

 globals modules annotator postFileIn
