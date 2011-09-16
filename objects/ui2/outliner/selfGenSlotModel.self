 '$Revision: 30.14 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot'
        
         selfGenSlotModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfGenSlotModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfGenSlotModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfGenSlotModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfGenSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfGenSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfGenSlotModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfGenSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfGenSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfGenSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.14 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfGenSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'selfSlotModel
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         selfGeneralSlotModel = bootstrap define: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalSlotModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfGeneralSlotModel.

CopyDowns:
globals generalSlotModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> () From: ( | {
         'ModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfGeneralSlotModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: editing contents (the method)\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptContents: str Editor: ed Event: evt = ( |
            | 
            str evalObjectBodyInContext: lobby asMirror
                Prefix: '(| ', slot longKey, ' = (\n'
                Postfix: ') |)' 
                ReportingTo: newResultReporterForEditingContentsIn: ed Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fComment: return new slot outliner\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         addToObjectSlotsIn: nSlotPair IfFail: fb = ( |
             categorizedSlots.
             eo.
             mo.
            | 
            categorizedSlots: copySlotsWithCategoriesSetForAdding: nSlotPair.
            mirror addOrChange: categorizedSlots FormerlyKnownAs: '' IfAnyFail: [^ fb value].
            mo: myObjectModelIfPresent: [|:m|m myOutliner] IfAbsent: [newOutlinerFor: mirror].
            eo: myOutliner enclosingOutlinerIfPresent: [|:o| o] IfAbsent: nil.
            myOutliner removeFromEnclosingOutliner.
            eo ifNotNil: [eo safelyDo: [eo update]].
            mo showSlot: (mirror at: nSlotPair first name)
                  Event: process this birthEvent
                 IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: locals\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buildLocals = ( |
            | 
            "maybe should use a separate object to hold these:
            a slots outliner!"
            localHolder do: [|:slot|
                   slot isArgument not
                 && [ slot value isReflecteeAssignment not ]
                 ifTrue: [ myOutliner addItem: selfSlotModel newOutlinerFor: slot]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             globals generalSlotModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'Comment: Holds button descriptions:
category leaf is button name, 
slot name is button name in buttonCache,
method source is button script,
public slots make asynchronous buttons.\x7fModuleInfo: Creator: globals selfGeneralSlotModel parent buttonDescriptions.

CopyDowns:
globals generalSlotModel parent buttonDescriptions. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: executing\x7fCategory: Create button\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot'
        
         createButton = ( |
            | 
            target model createButton: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: executing\x7fCategory: Send\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         send = ( |
            | 
            target model send: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: mutating\x7fCategory: Set Module...\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot'
        
         setModule = ( |
            | 
            target model setModule: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonsToPutInMenu = ( |
            | 
            resend.buttonsToPutInMenu,
            (receiver isComplete ifFalse: vector True: [vector copyAddLast: 'send'])
              copyAddLast: 'createButton').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         changeContentsEverywhereTo: nSlot Event: evt = ( |
            | 
            slot contents defineAndSave: nSlot contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         createButton: evt = ( |
             b.
            | 
            (createComplexButton: evt) ifNil: [
              b: ui2Button copy.
              b label: slot name.
              b script: 'target ', slot name.
              b target: receiver reflectee.
              "set color and force button to be in up state"
              b color: myOutliner color. 
              evt sourceHand attach: b.
              self
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         createComplexButton: evt = ( |
            | 
            complexButtonMorph 
              copy: slot key Target: receiver reflectee Event: evt Color: myOutliner color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fCategory: find slot\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         findSlot: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory
                    findSlot: nameForBrowsing
                StartingFrom: receiver
                       Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fCategory: find slot\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         findSlotOfAssignment: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory
                    findSlot: nameForBrowsing, ':'
                StartingFrom: receiver
                       Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: editing contents (the method)\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         finishChangingContents: rr = ( |
            | 
            changeMyMethodTo: (reflect: rr result) first
                       Event: rr event
                      IfFail: [^ self]. 
              myOutliner contentsEditor clearPanel.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fCategory: implementors\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         implementors: evt = ( |
            | 
            evt sourceHand attach: 
              enumerationMorphFactory
                implementorsOf: nameForBrowsing
                  StartingFrom: receiver
                         Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fCategory: implementors\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         implementorsInFamily: evt = ( |
            | 
            evt sourceHand attach: 
              enumerationMorphFactory
                implementorsOf: nameForBrowsing
                    InFamilyOf: receiver
                         Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fCategory: implementors\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         implementorsOfAssignment: evt = ( |
            | 
            evt sourceHand attach: 
              enumerationMorphFactory
                implementorsOf: nameForBrowsing, ':'
                  StartingFrom: receiver
                         Event: evt.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fCategory: implementors\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         implementorsOfAssignmentInFamily: evt = ( |
            | 
            evt sourceHand attach: 
              enumerationMorphFactory
                implementorsOf: nameForBrowsing, ':'
                    InFamilyOf: receiver
                         Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: method selection\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         innerMethod: im SelectionForBCI: bci = ( |
             c.
             ed.
             mt.
            | 
            c: im codesIfFail: [^ (0@0) # (0@0)].
            (0 <= bci) && [bci < c size] ifFalse: [^ (0@0) # (0@0)].
            mt: methodTextWithSlots.
            ed: myOutliner contentsEditor.
            mt isDisassembled  ifTrue: [ | lineNo |
              lineNo: mt convertBCIToLine: bci.
              ( 0 @ lineNo ) # ( 0 @ lineNo succ )
            ] False: [ | ssp. csp |
              ssp: im sourceStringPositionAtBCI: bci.
              csp: mt convertPosition: ssp FormatBlock: [|:t| t formatMethodBody].
              (ed text convertScalarToPoint: csp x) # (ed text convertScalarToPoint: csp y)
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isCommentButtonWanted = ( |
            | 
              "Looking at the annotation for an activation slot
               invalidates the slot"
            slot holder isReflecteeActivation not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: type testing\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfSlotModel = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fComment: Return string for method editor\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         methodString = ( |
            | 
            methodTextWithSlots asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         methodText = ( |
            | selfMethodText).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         methodTextWithSlots = ( |
            | 
            (methodText copyForMethod: method) formatMethodBody).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         methodTextWithoutSlots = ( |
             m.
            | 
            m: methodText copyForMethod: method.
            m formatMethodBodyWithoutSlots.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot'
        
         objectModelProto = ( |
            | selfObjectModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: tearing off\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot'
        
         outlinerForTearOffCopy: evt = ( |
             mir.
             o.
            | 
            mir: (reflect: ()) copyAddSlots: slotsInMe.
            o: selfSlotModel newOutlinerFor: mir first.
            o colorAll: myOutliner color.
            o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         privateTitleFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'verdana' copyMutable Size: 12 Style: '') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals selfGeneralSlotModel parent privateTitleFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: synchronization\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         protect: blk = ( |
            | 
            synchronization.protect: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         publicTitleFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'verdana' copyMutable Size: 12 Style: 'bold') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals selfGeneralSlotModel parent publicTitleFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         send: evt = ( |
            | 
            slot name sendTo: slot holder reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fCategory: senders\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         senders: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory
                   sendersOf: nameForBrowsing
                StartingFrom: receiver
                       Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fCategory: senders\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sendersInFamily: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory
                 sendersOf: nameForBrowsing
                InFamilyOf: receiver
                     Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fCategory: senders\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sendersOfAssignment: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory
                   sendersOf: nameForBrowsing, ':'
                StartingFrom: receiver
                       Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fCategory: senders\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sendersOfAssignmentInFamily: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory
                  sendersOf: nameForBrowsing, ':'
                 InFamilyOf: receiver
                      Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         setCachedIsMethod = ( |
            | 
            cachedIsMethod: hasMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: method selection\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         setSelectionInnerMethod: im BCI: bci = ( |
             selRect.
            | 
            selRect: innerMethod: im SelectionForBCI: bci.
            myOutliner contentsEditor text selectionStart: selRect origin End: selRect corner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sliceGroupModel = ( |
            | selfSliceGroupModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sliceReferrent = ( |
            | selfSliceReferrent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot'
        
         slotNameEditorProto = ( |
            | slotNameEditorMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         synchronization* = bootstrap stub -> 'mixins' -> 'ui2' -> 'programmingSynchronization' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         titleFontSpec = ( |
            | 
            case if: [slot isNil] "editing new one"  Then: [undeclaredTitleFontSpec]
                 If: [slot visibility = privateSlot] Then: [   privateTitleFontSpec]
                 If: [slot visibility = publicSlot ] Then: [    publicTitleFontSpec]
                                                     Else: [undeclaredTitleFontSpec]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         turnIntoObjectForWorld: w Event: evt = ( |
             o.
            | 
            "Turn into an object outliner when dropped into world"
            o: w outlinerForMirror: slot holder.
            o isInWorld ifFalse: [  w addMorph: o. ].
            w moveToFront: o.
            o globalPosition: myOutliner globalPosition.
            o showSlot: slot Event: evt.
            myOutliner delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         undeclaredTitleFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'helvetica' copyMutable Size: 12 Style: '') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals selfGeneralSlotModel parent undeclaredTitleFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         updateDo: blk = ( |
            | 
            updateSlot.
            resend.updateDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: selfGenSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         updateSlot = ( |
            | 
            "slot objects get stale"
            isForEditingNew not && [slot exists]  ifTrue: [
              slot: mirror at: slot name.
            ].
            self).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'selfSlotModel' From: 'ui2/outliner'



 '-- Side effects'

 globals modules selfGenSlotModel postFileIn
