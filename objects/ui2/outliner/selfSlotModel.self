 '$Revision: 30.12 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfSlotModel InitialContents: FollowSlot'
        
         selfSlotModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlotModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlotModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfSlotModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfSlotModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfSlotModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfSlotModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.12 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'selfPseudoSlotModel
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         selfSlotModel = bootstrap define: bootstrap stub -> 'globals' -> 'selfSlotModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfGeneralSlotModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSlotModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSlotModel.

CopyDowns:
globals selfGeneralSlotModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSlotModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: editing the name\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptChangingNameTo: newName Editor: ed Event: evt = ( |
             n.
             new.
             newContents.
             newSlot.
             result.
             rr.
             stringToParse.
            | 
            "this method is used to change the slot's name, when you double click on it"

            rr: newResultReporterForChangingNameInEditor: ed Event: evt.

            newName  
              evalObjectBodyInContext: (reflect: lobby)
                               Prefix: '| '
                              Postfix:  (case if:    [ slot value isReflecteeMethod ]
                                              Then:  ' = (self) |' 
                                              If:    [ slot isAssignable ]
                                              Then:  ' <- 0 | '
                                              Else:  ' = 0 | ')
                          ReportingTo: rr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: editing whole thing\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptEditWholeThing: str Editor: ed Event: evt = ( |
            | 
            str evalObjectBodyInContext: lobby asMirror
                Prefix: '| '
                Postfix: ' |'
                ReportingTo: 
                  newResultReporterForEditingWholeThingIn: ed Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: locals\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buildLocals = ( |
            | 
            "no locals on regular slots--yet.
            would need to get them to update"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'setModule' From:
             globals selfGeneralSlotModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'Comment: Holds button descriptions:
category leaf is button name, 
slot name is button name in buttonCache,
method source is button script,
public slots make asynchronous buttons.\x7fModuleInfo: Creator: globals selfSlotModel parent buttonDescriptions.

CopyDowns:
globals selfGeneralSlotModel parent buttonDescriptions. _Clone 
SlotsToOmit: setModule.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: mutating\x7fCategory: annotations\x7fCategory: Make creator\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         makeCreator = ( |
            | 
            target model makeCreator: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: mutating\x7fCategory: visibility\x7fCategory: Make private\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         makePrivate = ( |
            | 
            target model makePrivate: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: mutating\x7fCategory: visibility\x7fCategory: Make public\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         makePublic = ( |
            | 
            target model makePublic: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: mutating\x7fCategory: visibility\x7fCategory: Make undeclared\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         makeUndeclared = ( |
            | 
            target model makeUndeclared: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: mutating\x7fCategory: annotations\x7fCategory: Set Module...\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot'
        
         setModule = ( |
            | 
            target model setModule: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonsToPutInMenu = ( |
             r.
            | 
            isForEditingNew ifTrue:  [^ vector].
            slot exists     ifFalse: [^ resend.buttonsToPutInMenu].

            r: list copyRemoveAll.
            r: ('edit' & 'tearOffCopy' & 'tearOff' & nil & 'userDefined' & nil) asList.
            r addAll: visibilityChangingButtons.
            r addLast: myOutliner showOrHideComment.
            slot isAnnotationIgnored ifFalse: [
              r addAll: (myOutliner showOrHideAnnotation & 'setModule') asVector.
              slot isWorthAskingAboutCreator ifTrue:  [ r addLast: 'makeCreator' ].
              r addLast: nil.
            ].
            r addAll: resend.buttonsToPutInMenu.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: editing the method\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         changeMyMethodTo: newSlot Event: evt IfFail: fb = ( |
            | 
            slot holder
              changeContentsOfSlotInMeAndDescendantsTo: newSlot.
            "set this straight for the sake of the updateMethodEditor method"
            myOutliner cachedContentsString: myOutliner contentsEditor contentsString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot'
        
         comment = ( |
            | slot comment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot'
        
         comment: c = ( |
            | 
            slot comment: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: copy-down slots\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot'
        
         copyDownColor = paint copyRed: 0.86999 Green: 0.820137  Blue: 0.820137.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: editing whole thing\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         copySlotsWithCategoriesSetForAdding: mirr = ( |
            | 
            mirr asVector copyMappedBy: [|:s|  s copyHolderForCategories: categoryList]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: editing whole thing\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         editNewWholeThingString = ( |
            | 
            'slotName =  slotContents\n',
            '         Or             \n',
            'slotName <- slotContents\n\n',
            '------- Examples --------\n', 
            'Constants:\n',
            '          pi =  3.14159\n',
            '   greetUser = ( userQuery report: \'hi\' )  \"A method body is in parens.\"\n',
            '         + x = ( add: x )                  \"Binary selectors like +\n',
            '                                            take a single argument.\"\n',
            'add: a To: b = ( a + b )                   \"Keyworded notation allows\n',
            '                                            one or more arguments.\"\n',
            'Assignables:\n',
            '      items <- list copyRemoveAll          \"Can access this slot, or set\n',
            '                                            it (using \'items: newList\').\"\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         localHolder = ( |
            | slot contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         makeCreator: evt = ( |
            | 
            protect: [
              slot makeCreator.
            ].
            safelyDo: [myOutliner update].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: changing visibility\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         makePrivate: evt = ( |
            | 
            setVisibilityTo: privateSlot Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: changing visibility\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         makePublic: evt = ( |
            | 
            setVisibilityTo: publicSlot Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: changing visibility\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         makeUndeclared: evt = ( |
            | 
            setVisibilityTo: undeclaredSlot Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot'
        
         method = ( |
            | slot contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         newAnnotationMorph = ( |
            | 
            pluggableSlotModuleMorph copySlotOutliner: myOutliner
                                                Style: annotationInfoStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot'
        
         preferredBodyColor = ( |
            | 
            slot isNotNil && [slot isCopiedDown]
              ifTrue: [ preferences outliner colorScheme copiedDownSlotBody ]
               False: [ preferences outliner colorScheme normalSlotBody ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: copy-down slots\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         preferredColor = ( |
             c.
            | 
            c: resend.preferredColor.
            slot isNotNil && [slot isCopiedDown]
              ifTrue: [copyDownColor]
               False: [c]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot'
        
         preferredHeaderColor = ( |
            | 
            slot isNotNil && [slot isCopiedDown]
              ifTrue: [ preferences outliner colorScheme copiedDownSlotBody ]
               False: [ preferences outliner colorScheme normalSlotBody ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         receiver = ( |
            | 
            mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         setModule: event = ( |
            | 
            (selfModuleSetter copyForOutliner: myOutliner)
              setModuleOfSlot: slot Event: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: changing visibility\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         setVisibilityTo: vis Event: evt = ( |
            | 
            protect: [
              safelyDo: [
                slot exists ifTrue: [ slot visibility: vis].
              ].
            ].
            myOutliner enclosingOutlinerIfPresent: [|:eo|
              eo safelyDo: [eo update "reorder slots"]
            ].
            safelyDo: [myOutliner update].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: editing the name\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         unprotectedFinishChangingName: rr = ( |
             n.
             new.
             newContents.
             newSO.
             newSlot.
            | 

            newSlot: (reflect: rr result) first.
            n: newSlot name.

            newContents: slot contents copyAdoptingArgumentSlotsFrom: newSlot contents.

            "put adjusted method into new slot"
             newSlot: newSlot copyHolderForContents: newContents IfFail: [|:err|
               userQuery report: 'setting contents failed ', err.
               ^ self.
            ].

            newSO: changeSlotInObjectTo: (vector copyAddFirst: newSlot) IfFail: [^ self].

            newSO safelyDo: [
              newSO titleEditor slot: slot.
              newSO titleEditor editMode: false.
              newSO enclosingOutlinerIfPresent: [|:eo| eo update] IfAbsent: [].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: editing whole thing\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         unprotectedFinishChangingWholeThing: rr = ( |
             eo.
             mirr.
             newSO.
             ow.
             p.
             str.
            | 
            eo: myOutliner enclosingOutlinerIfPresent: [|:o| o] IfAbsent: nil.
            mirr: reflect: rr result.

            validateObjectWithNewSlots: mirr
             IfOK:    []
             IfNone:  [ isForEditingNew ifFalse: [
                          mirror removeSlotsFromMeAndDescendants: slotsInMe.
                        ].
                        ^ myOutliner removeFromEnclosingOutliner
             ]
             IfError: [|:e| ^ rr event sourceHand attach: syntaxErrorMorph copyMessage: e].

            str: wholeThingEditor contentsString.

            ow: myOutliner world.

            newSO:
             isForEditingNew  ifTrue: [ addToObjectSlotsIn:    mirr IfFail: [^ self] ]
                               False: [ changeSlotInObjectTo:  mirr IfFail: [^ self] ].

            myOutliner doneEditingWholeThing.
            newSO model slot maybeSetInitialContentsFromEditString: str.
            newSO safelyDo: [newSO updateAnnotationInfo].

            eo ifNotNil: [eo safelyDo: [eo update]].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         updateSlot = ( |
            | 
            resend.updateSlot.
            updateSlotColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         updateSlotColor = ( |
            | 
            preferredColor != myOutliner color
              ifTrue: [myOutliner colorAll: preferredColor].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: editing whole thing\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         validateObjectWithNewSlots: mirr IfOK: ob IfNone: nb IfError: eb = ( |
            | 
            case
             if: [mirr size  = 0]       Then: nb
             If: [mirr size  = 1]       Then: ob
             If: [mirr size  > 2]       Then: [eb value: 'Text evaluates to several slots']
             If: [mirr first isMethod]  Then: [eb value: 'Cannot create an assignable method']
                                        Else: ob).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfSlotModel InitialContents: FollowSlot'
        
         visibilityChangingButtons = ( |
             v.
            | 
            v: slot visibility.
            ('makePublic' & 'makeUndeclared' & 'makePrivate' & nil) asList
              remove:
                case if: [ v =     privateSlot ] Then: 'makePrivate'
                     If: [ v =  undeclaredSlot ] Then: 'makeUndeclared'
                     If: [ v =      publicSlot ] Then: 'makePublic').
        } | ) 



 '-- Sub parts'

 bootstrap read: 'selfPseudoSlotModel' From: 'ui2/outliner'



 '-- Side effects'

 globals modules selfSlotModel postFileIn
