 '30.19.1'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         selfDebugger = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfDebugger' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfDebugger' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfDebugger.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfDebugger' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfDebugger' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfDebugger' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfDebugger' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfDebugger' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: InitializeToExpression: (\'30.19.1\')\x7fVisibility: public'
        
         revision <- '30.19.1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfDebugger' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Debugger\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         selfActivationModel = bootstrap define: bootstrap stub -> 'globals' -> 'selfActivationModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'cachedIsMethod' From:
             bootstrap remove: 'cachedIsMethod:' From:
             bootstrap remove: 'parent' From:
             globals selfGeneralSlotModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfActivationModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfActivationModel.

CopyDowns:
globals selfGeneralSlotModel. copyForSpecialization 
SlotsToOmit: cachedIsMethod cachedIsMethod: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap define: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'buttonDescriptions' From:
             bootstrap remove: 'receiver' From:
             bootstrap remove: 'stepAction' From:
             bootstrap remove: 'stepOverUninterestingStuff' From:
             globals generalActivationModel parent _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfActivationModel parent.

CopyDowns:
globals generalActivationModel parent. _Clone 
SlotsToOmit: buttonDescriptions receiver stepAction stepOverUninterestingStuff.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: method\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         askUserAboutChangingMethodReferencedBy: refs To: newSlot Event: evt IfFail: fb = ( |
             nameString.
             names.
            | 
            names: refs copyMappedBy: [|:s| s holder name].
            nameString: names reduceWith: [|:a. :b| a, ', ', b].
            (userQuery 
              askMultipleChoice: 'Method is in ', nameString, '.\nReplace:'
              Choices: ('Everywhere' & ('In ', slot holder name, ' only') & 'Nowhere') asVector
              Results: (   [changeContentsEverywhereTo: newSlot Event: evt] 
                         & [slot holder changeContentsOfSlotInMeAndDescendantsTo: newSlot]
                         & [^ fb value]
                       ) asVector
            ) value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: locals\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buildLocals = ( |
             lss.
            | 
            lss: list copyRemoveAll.
            activation doLexicalScopes: [|:s| lss addFirst: s].
            lss isEmpty ifFalse: [lss removeLast].
            lss doFirst: [| :ls |
              ls do: [|:s|
                s isAssignment || [s isArgument]
                  ifFalse: [myOutliner addItem: selfSlotModel newOutlinerFor: s].
              ].
            ] MiddleLast: [| :ls |
              ls do: [|:s|
                s isAssignment
                  ifFalse: [myOutliner addItem: selfSlotModel newOutlinerFor: s].
              ].
            ] IfEmpty: [].
            resend.buildLocals).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTitle = ( |
            | 
            buildActivationTitle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             globals selfGeneralSlotModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfActivationModel parent buttonDescriptions.

CopyDowns:
globals selfGeneralSlotModel parent buttonDescriptions. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: method\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         changeMyMethodTo: newSlot Event: evt IfFail: fb = ( |
            | 
            changeReferencesToMyMethodTo: newSlot Event: evt IfFail: [^ fb value].
            trimStackAndStepInto: outermostLexicalScope.
            updateAfterStepping: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: method\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         changeReferencesToMyMethodTo: newSlot Event: evt IfFail: fb = ( |
             refs.
            | 

            refs: (referencesToContents asList copyFilteredBy: [|:s| s isCopiedDown not]) asVector.

            refs size <= 1  ifTrue: [
              changeContentsEverywhereTo: newSlot Event: evt
            ]
            False: [
              askUserAboutChangingMethodReferencedBy: refs
                                                  To: newSlot
                                               Event: evt
                                              IfFail: [^ fb value]
            ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: contents editor\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsEditorPrototype = bootstrap stub -> 'globals' -> 'uglyActivationEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         finishCommand: evt = ( |
            | 
            myProcess finish: activation.
            myProcess stepOverSimpleBytecodes.
            updateAfterStepping: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         isCommentButtonWanted = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         method = ( |
            | 
            methodForSelfActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: method source & selection\x7fComment: override for positionInMethodEditor\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         methodText = ( |
            | 
            selfMethodTextWithPositionConversion).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfGeneralSlotModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         preferredBodyColor = ( |
            | preferences outliner theme debugger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         preferredHeaderColor = ( |
            | preferences outliner theme processDebugger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         preferredTagColor = ( |
            | preferences outliner theme debuggerTag).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: method\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         referencesToContents = ( |
            | 
            browseWellKnown referencesOfReflectee: slot contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         retryCommand: evt = ( |
            | 
            myProcess killActivationsUpTo: activation number.
            myProcess continue.
            updateAfterStepping: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         revertCommand: evt = ( |
            | 
            myProcess killActivationsUpTo: activation number.
            updateAfterStepping: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         selfActivationMixin* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> 'selfActivationMixin' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfActivationModel parent selfActivationMixin.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> 'selfActivationMixin' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buildActivationTitle = ( |
            | 
            activation isReflecteeBlockMethodActivation ifTrue: [buildBlockActivationTitle]
                                                         False: [buildMethodActivationTitle]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> 'selfActivationMixin' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buildBlockActivationTitle = ( |
             f.
             homet.
             r.
             t.
            | 
            homet: buildTitleFor: outermostLexicalScope.

            r: rowMorph copyTransparent.
            r beShrinkWrap.
            r borderWidth: 0.

            r addMorphLast: buildTitleFor: activation.
            t: labelMorph copy.
            t label: ' in: '.
            t fontSpec: globals fontSpec copyName: 'verdana' Size: fontSpec size Style: 'italic'.
            r addMorphLast: t.

            f: frameMorph copy beShrinkWrap color: homet color.
            f borderWidth: 1.
            f frameStyle: f insetBezelStyle.
            f addMorphLast: homet.
            r addMorphLast: f.

            myOutliner titleEditor: nil. "not editable or updatable"

            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> 'selfActivationMixin' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buildFoldedTitleFor: act = ( |
             argCol.
             outerRow.
             rcvrCol.
             sel.
             selCol.
             sp.
             v.
            | 
            "build big old title:"
            " a row: rcvrCol sp selCol sp argCol sp argObjCol"

            outerRow: rowMorph copyTransparent topJustify beShrinkWrap borderWidth: 0.

            selCol: columnMorph copyTransparent beShrinkWrap rightJustify borderWidth: 0.
            argCol: selCol copy leftJustify.

            v: act receiverIfFail: [|:e| reflect: 'no rcvr: ', e].
            outerRow addMorph: objectPushButton copyMirror: v
                                                     Color: (preferences outliner theme processDebugger "headerColorFor: v reflectee").
            sp: transparentSpacerMorph copyH: 4.

            (selector copyStr: act selector) keywords
              with: (act asList  copyFilteredBy: [|:s| s isArgument] )
                Do: [ | :kw. :arg. r. |
                  selCol addMorphLast: labelMorphForTitle: kw, ' '.
                  r: outerRow copyRemoveAllMorphs bottomJustify.
                  r addMorphLast: labelMorphForTitle: arg name.
                  r addMorphLast: sp copy.
                  r addMorphLast: objectPushButton copyMirror: arg value 
                                                        Color: preferences outliner theme processDebugger.
                  argCol addMorphLast: r.
            ].


            outerRow addMorphLast: labelMorphForTitle: '  '.
            outerRow addMorphLast: selCol.
            outerRow addMorphLast: argCol.
            outerRow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> 'selfActivationMixin' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buildLinearTitleFor: act = ( |
             r.
             s.
             sel.
             v.
            | 
            r: rowMorph copyTransparent beShrinkWrap borderWidth: 0.

            v: act receiverIfFail: [|:e| reflect: 'no rcvr: ', e].
            r addMorphLast: 
              objectPushButton copyMirror: v
                                    Color: (preferences outliner theme processDebugger "headerColorFor: v reflectee").

            s: act selectorIfFail: 'noSelector'.
            sel: selector copyStr: s.

            case
              if:   [(reflect: s) isReflecteeString not] 
              Then: [
                r addMorphLast: objectPushButton copyMirror: (reflect: s) Color: (preferences outliner theme processDebugger "headerColorFor: s")
              ]
              If:   [sel isUnary]
              Then: [r addMorphLast: labelMorphForTitle: '  ', s]
              Else: [ | args |
                args: act asList copyFilteredBy: [|:slot| slot isArgument].

                sel keywords with: args Do: [ | :kw. :arg. |
                  r addMorphLast: labelMorphForTitle: '  ', kw, ' '.
                  r addMorphLast: labelMorphForTitle: arg name.
                  r addMorphLast: transparentSpacerMorph copyH: 2.
                  r addMorphLast: objectPushButton copyMirror: arg value Color: (preferences outliner theme processDebugger "headerColorFor: arg value reflectee").
              ].
            ].
            r centerJustify.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> 'selfActivationMixin' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buildMethodActivationTitle = ( |
            | 
            buildTitleFor: activation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> 'selfActivationMixin' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTitleFor: act = ( |
             r.
             t.
             w.
            | 
            r: buildLinearTitleFor: act.
            (selector copyStr: act selectorIfFail: [^ r]) isKeyword ifFalse: [ ^ r ].

            w:  process this hand ifNil: [ desktop worlds first ] IfNotNil: [ |:h| h world ].
            "use w for layout"
            r position: maxSmallInt half @ 0.
            w safelyDo: [ w addMorph: r ].
            t: r baseBounds width <= maxTitleWidth ifTrue: [ r ] False: [ buildFoldedTitleFor: act ].
            t safelyDo: [ t delete "so it can be munged without sema" ].
            t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> 'selfActivationMixin' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         maxTitleWidth = 300.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> 'selfActivationMixin' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         methodForSelfActivation = ( |
             orig.
             outer.
            | 

            "try to return original method to make initial values of locals
             available -- dmu"

            outer: outermostLexicalScope.
            outer isLive ifFalse: [
              ^ (reflect: (| x = ("dead activation" self) |) ) first contents
            ].
            orig: (mirror at: (outer selectorIfFail: [^ outer]) IfAbsent: [^ outer]) contents.
                  orig isReflecteeMethod 
            && [( orig codes    = outer codes )
            && [( orig literals = outer literals )]]
             ifTrue: [ orig ]
              False: [ outer ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> 'selfActivationMixin' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         slotEvenIfNone = ( |
             m.
            | 
            "override in order to make slot work even if there is none"
            "needed for top-level activations"
            m: outermostLexicalScope selectorMirrorIfFail: [nil asMirror].
            globals slots method
             copyMirror: mirror
                   Name: m isReflecteeString 
                     ifTrue: [m reflecteeStringIfFail: 'cannotGetBytesOfString']
                      False: 'notAString').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         slot = ( |
            | slotEvenIfNone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         stackDepth = ( |
             s.
            | 
            s: myProcess stack.
            s size - s topmostInterestingActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         stepAction = ( |
            | 
            activation number = 0 ifTrue: [
              myProcess stepAndSkipSimpleBytecodes.
            ] False: [
              myProcess finish: myProcess at: activation number pred
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         stepIntoCommand: evt = ( |
            | 
            myProcess stepIntoAndSkipSimpleBytecodes.
            updateAfterStepping: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         stepOverUninterestingStuff = ( |
            | 
            myProcess stepOverSimpleBytecodes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: method\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         trimStackAndStepInto: anActivation = ( |
            | 
            myProcess killActivationsUpTo: 
              myProcess stack findFirst: [|:a| a = anActivation]
                              IfPresent: [|:a| a number succ]
                               IfAbsent: [myProcess stack size pred].
            myProcess resetCauseOfError.
            myProcess step. "step into new method"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Debugger\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         selfProcessModel = bootstrap define: bootstrap stub -> 'globals' -> 'selfProcessModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalProcessModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfProcessModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfProcessModel.

CopyDowns:
globals generalProcessModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessModel' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfProcessModel' -> 'parent' -> () From: ( |
             {} = 'Comment: I implement traits for the model for the Self debugger outliner.
-- dmu 1/02\x7fModuleInfo: Creator: globals selfProcessModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         preferredBodyColor = ( |
            | preferences outliner theme debugger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         preferredColor = ( |
            | 
            preferences outliner theme selfProcessModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         preferredHeaderColor = ( |
            | preferences outliner theme processDebugger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         preferredTagColor = ( |
            | preferences outliner theme debuggerTag).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         preferredTitleColor = ( |
            | 
            preferences outliner theme processTitle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         processStackModel = ( |
            | selfProcessStackModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Debugger\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         selfProcessStackModel = bootstrap define: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalProcessStackModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfProcessStackModel.

CopyDowns:
globals generalProcessStackModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> () From: ( | {
         'Comment: true if I am filtering the stack\x7fModuleInfo: Module: selfDebugger InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         isFiltered <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfProcessStackModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         activationModelProto = ( |
            | selfActivationModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalProcessStackModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'Comment: Holds button descriptions:
category leaf is button name, 
slot name is button name in buttonCache,
method source is button script,
public slots make asynchronous buttons.\x7fModuleInfo: Creator: globals selfProcessStackModel parent buttonDescriptions.

CopyDowns:
globals generalProcessStackModel parent buttonDescriptions. _Clone 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> 'parent' -> 'buttonDescriptions' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfProcessStackModel parent buttonDescriptions parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> 'parent' -> 'buttonDescriptions' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> 'buttonDescriptions' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonsToPutInMenu = ( |
            | 
            resend.buttonsToPutInMenu copyAddFirst:
              isFiltered ifTrue: 'dontFilter' False: 'filter').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: accessing activations\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         filteredTopActivationsDo: blk = ( |
             activation.
             count <- 0.
             index.
             stack <- ((bootstrap stub -> 'globals') \/-> 'processStack') -> ().
             top.
            | 

            stack: myProcess stackWithLimit: stackDepthToShow * 10 "* 10 is a guess -- dmu".
            index:  myProcess causeOfError firstInterestingFrameOf: stack.
            index < 0 ifTrue: [ index: 0].
            stack isEmpty ifTrue: [^ self].
            top:  stack topmostInterestingActivation.
            [ (index <= top) && [count < stackDepthToShow] ] whileTrue: [
                activation: stack at: index.
                blk value: activation.
                count: count succ.
                index:  
                  activation isReflecteeMethodActivation 
                    ifTrue: [ index succ ] "don't filter methods, just blocks"
                     False: [ 1 + (findActivationStack: stack
                                                 Index: activation outermostLexicalScope
                                                  From: index succ
                                              IfAbsent: index succ) ].
            ].
            moreStack:  index <= top.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         isCommentButtonWanted = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfDebugger InitialContents: FollowSlot'
        
         processModel = ( |
            | selfProcessModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: accessing activations\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         toggleFiltering: event = ( |
            | 
            isFiltered: isFiltered not.
            myOutliner update.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: accessing activations\x7fModuleInfo: Module: selfDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         topActivationsDo: blk = ( |
            | 
            isFiltered ifTrue: [  filteredTopActivationsDo: blk]
                        False: [unfilteredTopActivationsDo: blk]).
        } | ) 



 '-- Side effects'

 globals modules selfDebugger postFileIn
