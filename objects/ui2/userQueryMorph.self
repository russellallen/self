 '$Revision: 30.14 $'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: userQueryMorph InitialContents: FollowSlot'
        
         userQueryMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'userQueryMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'userQueryMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules userQueryMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'userQueryMorph' -> () From: ( | {
         'ModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'userQueryMorph' -> () From: ( | {
         'ModuleInfo: Module: userQueryMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'userQueryMorph' -> () From: ( | {
         'ModuleInfo: Module: userQueryMorph InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'userQueryMorph' -> () From: ( | {
         'ModuleInfo: Module: userQueryMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            userQueryMorph initializePrototype.
            [resetEveryBodyOffset].
            snapshotAction addSchedulerInitialMessage:
              message copy receiver: userQueryMorph Selector: 'resetEveryBodyOffset'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'userQueryMorph' -> () From: ( | {
         'ModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.14 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'userQueryMorph' -> () From: ( | {
         'ModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         userQueryMorph = bootstrap define: bootstrap stub -> 'globals' -> 'userQueryMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'userQueryMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals userQueryMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQueryMorph' -> () From: ( | {
         'Category: User Query Morph State\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonExpressions <- bootstrap stub -> 'globals' -> 'dictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQueryMorph' -> () From: ( | {
         'Category: User Query Morph State\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonRow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQueryMorph' -> () From: ( | {
         'Category: User Query Morph State\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         doneSema <- bootstrap stub -> 'globals' -> 'semaphore' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQueryMorph' -> () From: ( | {
         'Category: User Query Morph State\x7fModuleInfo: Module: userQueryMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         editor <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         userQueryMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits userQueryMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQueryMorph' -> () From: ( | {
         'ModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'userQueryMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQueryMorph' -> () From: ( | {
         'Category: User Query Morph State\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         rawColor <- paint named: 'lightGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQueryMorph' -> () From: ( | {
         'Category: User Query Morph State\x7fModuleInfo: Module: userQueryMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         result.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQueryMorph' -> () From: ( | {
         'Category: User Query Morph State\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         widgetColumn.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: query construction\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonToColumn: aButton = ( |
            | 
            widgetColumn addMorphLast: spacerMorph copyV: 10 Color: color.
            widgetColumn addMorphLast: aButton.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: query construction\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonToRow: aButton = ( |
            | 
            buttonRow addMorphLast: spacerMorph copyH: 10 Color: color.
            buttonRow addMorphLast: aButton.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: dropping outliners onto me\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         addDroppingMorph: anObjectOutliner Event: evt = ( |
            | 
            world addMorph: anObjectOutliner.
            world moveToFront: anObjectOutliner.
            editor ifNotNil: [
              editor setText: anObjectOutliner model mirror evalName.
            ].
            delete.
            doneSema signal.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: simple queries\x7fComment: Ask the user a multiple-choice question and return the result
corresponding to the user\'s selection.
\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         askMultipleChoice: queryText Choices: choices Results: results Event: evt = ( |
             query.
             vertically.
            | 
            query: copyQuestion: queryText.
            vertically: (choices copyMappedBy: [|:c| c size]) sum  >  queryText size.
            choices with: results Do: [| :c. :r |
              vertically  ifTrue: [ query buttonInColumnLabel: c Result: r ]
                           False: [ query buttonInRowLabel:    c Result: r ].
            ].
            query popUpWhereEventHappened: evt.
            query drawAttention awaitResponse.
            query result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: simple queries\x7fComment: Ask the user a question and return the user\'s reply
(a string). The type-in field is initialized to the
given default response.\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         askString: queryText DefaultAnswer: default Event: evt = ( |
             query.
            | 
            editor: uglyTextEditorMorph copyString: default Style: ( | color = paint | ).
            editor borderWidth: 3.
            query: copyQuestion: queryText.
            query widgetColumn addMorph: editor.
            query buttonInRowLabel: 'Okay' Result: nil.
            query colorAll: query color.
            query popUpWhereEventHappened: evt.
            editor text selectAll beTypingFocusFor: evt sourceHand.
            query drawAttention awaitResponse.
            editor contentsString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: simple queries\x7fComment: Ask the user a yes or no question and return the boolean result.
\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         askYesNo: queryText Event: evt = ( |
             query.
            | 
            query: copyQuestion: queryText.
            query buttonInRowLabel: 'No'  Result: false.
            query buttonInRowLabel: 'Yes' Result: true.
            query popUpWhereEventHappened: evt.
            query drawAttention awaitResponse.
            query result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: activation\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         awaitResponse = ( |
            | 
            "Wait (on a semaphore) until the user responds. When control is
             returned, 'result' contains the value associated with
             the button pressed. The state of any other widgets
             in the dialog box can also be examined."

            "Warning; must not be called inside a safelyDo: because
             the UI thread must be running in order for the user to
             respond to the query. Since safelyDo: prevents the
             world from running, calling this method from inside
             a safelyDo: block results in deadlock."

            isInWorld  && [ process this = world stepProcess ]  ifTrue: [
                error: 'You cannot use userQueryMorphs from within the ui thread\n',
                       'because doing so would cause a deadlock. Sorry.'.
            ].
            doneSema wait.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: query construction\x7fComment: Add a button to the query under construction.\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonInColumnLabel: label Result: r = ( |
            | 
            addButtonToColumn: buttonLabel: label Result: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: query construction\x7fComment: Add a button to the query under construction.\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonInRowLabel: label Result: r = ( |
            | 
            addButtonToRow: buttonLabel: label Result: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: query construction\x7fComment: Make a button for the query.\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonLabel: label Result: r = ( |
             b.
             lines.
            | 
            b: (ui2Button copyColor: color Target: self).
            lines: label asTextLines lines copy.
            lines mapBy: [| :s |
                labelMorph copyLabel: s
                            FontSpec: b defaultFontSpec
                               Color: b defaultFontColor.
            ].
            b addAllMorphs: lines.
            buttonExpressions at: b Put: r.
            b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: activation\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonPress: b Event: evt = ( |
            | 
            "Return control to the caller by signalling the done
             semaphore after setting 'result'. See comment
             in popUpAndAwaitResponseFromHand:"

            result: (buttonExpressions at: b IfAbsent: nil).
            delete.
            doneSema signal.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: query construction\x7fComment: Build a userQueryMorph for the given question.
This method simply creates the basic query; buttons
for user reponses are added via buttonLabel:Result:.
\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyQuestion: queryText = ( |
             c.
             mphs.
             new.
            | 
            new: copyRemoveAllMorphs beShrinkWrap.
            new doneSema: (doneSema copyCount: 0 Capacity: 1).
            mphs: list copyRemoveAll.
            (queryText asTextLines) do: [| :line |
                mphs add:
                    (labelMorph copyLabel: line
                                 FontSpec: defaultFontSpec
                                    Color: defaultFontColor).
            ].
            mphs add: spacerMorph copyV: 10 Color: color.
            new buttonExpressions: buttonExpressions copyRemoveAll.
            new buttonRow:    (rowMorph    copy beFlexible borderWidth: 0).
            new widgetColumn: (columnMorph copy beFlexible borderWidth: 0).
            new widgetColumn baseMinWidth:  0.
            new widgetColumn baseMinHeight: 0.
            new buttonRow addMorph: spacerMorph copy beFlexible.
            mphs add: new widgetColumn.
            mphs add: spacerMorph copyV: 5 Color: color.
            mphs add: new buttonRow.
            c: columnMorph copy beFlexible borderWidth: 5.
            c addAllMorphs: mphs.
            new addMorph: c.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: query construction\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot'
        
         copyQuestionForNotice: queryText = ( |
             c.
             mphs.
             new.
            | 
            new: copyRemoveAllMorphs beShrinkWrap.
            "new colorAll: paint copyRed: 0 Green: 0 Blue: 0 Alpha: 0.7."
            new doneSema: (doneSema copyCount: 0 Capacity: 1).
            mphs: list copyRemoveAll.
            (queryText asTextLines) do: [| :line |
                mphs add:
                    (labelMorph copyLabel: line
                                 FontSpec: defaultFontSpec
                                    Color: defaultFontColor).
            ].
            mphs add: spacerMorph copyV: 10 Color: color.
            new buttonExpressions: buttonExpressions copyRemoveAll.
            new buttonRow:    (rowMorph    copy beFlexible borderWidth: 0).
            new widgetColumn: (columnMorph copy beFlexible borderWidth: 0).
            new widgetColumn baseMinWidth:  0.
            new widgetColumn baseMinHeight: 0.
            new buttonRow addMorph: spacerMorph copy beFlexible.
            mphs add: new widgetColumn.
            mphs add: spacerMorph copyV: 5 Color: color.
            mphs add: new buttonRow.
            c: columnMorph copy beFlexible borderWidth: 20.
            c addAllMorphs: mphs.
            new addMorph: c.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: default fonts\x7fModuleInfo: Module: userQueryMorph InitialContents: InitializeToExpression: (paint named: \'black\')\x7fVisibility: private'
        
         defaultFontColor <- paint named: 'black'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: default fonts\x7fModuleInfo: Module: userQueryMorph InitialContents: InitializeToExpression: (fontSpec copyName: \'helvetica\' Size: 12 Style: \'bold\')\x7fVisibility: private'
        
         defaultFontSpec <- fontSpec copyName: 'helvetica' Size: 12 Style: 'bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: activation\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         drawAttention = ( |
            | 
            safelyDo: [ isInWorld ifTrue: [world displayUpdateNow ]].

            "xxx remainder commented out by jhm due to flashing problems xxx"
            true ifTrue: [ ^self ].

            colorThrobTo: (paint named: 'offWhite')
            TimePerThrob: 1
               NumThrobs: infinity.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: reporting\x7fModuleInfo: Module: userQueryMorph InitialContents: InitializeToExpression: (0@0)\x7fVisibility: private'
        
         everybodyOffset <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype color: paint named: 'lightGray').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: buttonRow    IsPresentDo: [| :n | buttonRow:    n ].
            dict if: widgetColumn IsPresentDo: [| :n | widgetColumn: n ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'userQueryMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'ModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: activation\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpInCenterOfCanvasForHand: h = ( |
            | 
            popUpInWorld: h world 
                  Canvas: h winCanvasForHand 
                      At: h winCanvasForHand boundingBoxInWorld center).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: activation\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpInHand: h = ( |
            | 
            "Pop up this query in the given hand."

            colorAll: color.
            result: nil.
            h safelyDo: [ 
              h attach: self. 
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: activation\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpInWorld: w Canvas: c At: pt = ( |
             cRect.
             myRect.
            | 
            "put box in world"
            colorAll: color.
            result: nil.
            w safelyDo: [
              "This code used to use minSmallInt. When I converted to quartz, label morph heights
               were (for a while) allowed to be floats. Since our floats have limited precision,
               an arithmetic error caused excessive height when layout out there.
               I have changed the code below. -- dmu 4/32/07"
              [globalPosition: minSmallInt @ minSmallInt].
              globalPosition: c boundingBoxInWorld corner + (1000@1000).

              w addMorph: self.
              w moveToFront: self.
              layoutChanged. " be sure to lay me out "
              globalPosition: ( ( baseBounds center: pt ) restrictTo: c boundingBoxInWorld ) origin.
              changed.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: activation\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpWhereEventHappened: evt = ( |
            | 
            popUpInWorld: evt sourceHand world
                  Canvas: evt sourceHand winCanvasForHand
                      At: evt cursorPoint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: reporting\x7fComment: Present the given report to the user and wait for acknowledgement.
\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         report: s Event: evt = ( |
             report.
            | 
            report: copyQuestion: s.
            report buttonInRowLabel: 'Okay' Result: nil.
            report popUpWhereEventHappened: evt.
            report drawAttention awaitResponse.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: reporting\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         resetEveryBodyOffset = ( |
            | everybodyOffset: 0@0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: reporting\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         show: showText Event: evt = ( |
             qm.
            | 
            qm: copyQuestionForNotice: showText.
            qm popUpWhereEventHappened: evt.
            qm drawAttention.
            qm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: reporting\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         show: showText While: whileBlock Event: evt = ( |
             qm.
            | 
            qm: show: showText Event: evt.
            whileBlock onReturn: [qm safelyDo: [qm delete]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: reporting\x7fComment: Show a message to everyone using this world.
-- Ungar, 2/1/95\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         showEverybody: showText While: whileBlock = ( |
             delta.
             qms.
            | 
            qms: list copyRemoveAll.
            desktop worldsDo: [| :w |
              w winCanvases do: [| :c. qm |
                qm: copyQuestionForNotice: showText.
                qm popUpInWorld: w
                         Canvas: c
                             At: c boundingBoxInWorld center + everybodyOffset.
                delta: 0 @ qm baseBounds height.
                qm drawAttention.
                qms addLast: qm.
              ].
            ].
            everybodyOffset: everybodyOffset + delta.
            whileBlock onReturn: [
                everybodyOffset: everybodyOffset - delta.
                qms do: [|:qm| qm safelyDo: [qm delete]]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: dropping outliners onto me\x7fComment: Allow user to drop object outliner onto me to
shortcut typing in statePrintString of object.
E.g. if you have an int or int32, can drop onto
me to avoid typing in a long number. -- dmu 5/02\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
             amDebugging = bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            amDebugging ifTrue: [^ m isOutliner && [m isPluggableOutliner && [m model isSelfObjectModel]]].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'userQueryMorph' -> () From: ( | {
         'Category: reopening the world\x7fModuleInfo: Module: userQueryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         worldHasReopened = ( |
            | 
            "A userQueryMorph relies on processes which no longer are."
            delete).
        } | ) 



 '-- Side effects'

 globals modules userQueryMorph postFileIn
