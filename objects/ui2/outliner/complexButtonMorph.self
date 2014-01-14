 '$Revision: 30.10 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         complexButtonMorph = bootstrap define: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals complexButtonMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         argumentEditorMorphs <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals complexButtonMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         accept = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> 'accept' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals complexButtonMorph parent accept.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> 'accept' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot'
        
         actionFrom: ed Target: tar Event: evt = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         baseCopy = ( |
             new.
            | 
            new: resend.baseCopy.
            argumentEditorMorphs ifNotNil: [
              new argumentEditorMorphs: argumentEditorMorphs copy asVector.
            ].
            selectorLabelMorphs ifNotNil: [
              new selectorLabelMorphs: selectorLabelMorphs copy asVector.
            ].
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         cancel = bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> 'accept' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: sel Target: tar Event: evt Color: col = ( |
             b.
             em.
             fem.
             i <- 0.
             m.
             rm.
             s.
             sm.
            | 
            s: selector copyStr: sel.
            s isUnary ifTrue: [ ^ nil 
             ] False: [
                m: ((resend.copy beShrinkWrap color: col)
                     target: tar) rightJustify.
                m argumentEditorMorphs: list copyRemoveAll.
                m selectorLabelMorphs: list copyRemoveAll. 
                s keywords do: [| :kw. lm |
                  rm: rowMorph copy beFlexible.
                  sm: ((spacerMorph copy beFlexible) baseMinWidth: 5) color: col.
                  rm addMorphLast: sm.
                  lm: labelMorph copy label: kw.
                  m selectorLabelMorphs addLast: lm.
                  rm addMorphLast: lm.
                  em: editorMorph copy setString: 'arg' , i printString.
                  i: i + 1.
                  m argumentEditorMorphs add: em.
                  fem: frameMorph copy frameStyle: insetBezelStyle.
                  fem addMorph: em.
                  rm addMorphLast: fem.
                  [sm: ((spacerMorph copy beFlexible) baseMinWidth: 5) color: col.
                  rm addMorphLast: sm.].
                  m addMorphLast: rm.
                 ].
                rm: (rowMorph copy beFlexible) color: col.
                b: (((ui2Button copy target: m) label: 'Do it')
                     scriptBlock: [target doIt: event GetIt: false]) color: col.
                rm addMorphLast: b.
                rm addMorphLast: labelMorph copy label: ' '.
                b: (((ui2Button copy target: m) label: 'Get it')
                     scriptBlock: [target doIt: event GetIt: true]) color: col.
                rm addMorphLast: b.
                m addMorphLast: rm.
                m colorAll: m color.
                evt sourceHand attach: m
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         doIt: evt GetIt: getIt = ( |
             args.
             errors.
             i <- 0.
             kws.
             n.
             s <- ''.
             t.
            | 
            'executing button' printLine.
            errors: false.
            kws: selectorLabelMorphs copyMappedBy: [|:lm| lm label].
            args: argumentEditorMorphs copyMappedBy: [|:em| em contentsString].
            [|:exit. t|
              kws isEmpty ifTrue: exit.
              s: s, kws removeFirst , ' '.
              args isEmpty ifTrue: exit.
              t: args removeFirst.
              t parseObjectBodyFileName: '<button>' IfFail: [| :err. se. am |
                      ('parse error: arg' , i printString) printLine.
                      am: argumentEditorMorphs asVector at: i.
                      am selectionStart: err start  End: err end.
                      se: syntaxErrorMorph copyMessage: err printString.
                      world addMorph: se.  
                      world moveToFront: se.  
                      se globalPostion: am globalPosition.
                      errors: true.
              ].
              i: i + 1 .
              s: s , t , ' '.
            ] loopExit.
            ('Script:' , s) printLine.
            errors ifTrue: [ ^self].
            n: s evalInContext: (reflect: target) FileName: 'fisk'.
            n printString printLine.
            getIt ifTrue: [
              evt sourceHand attach: world outlinerForMirror: reflect: n
            ] False: [self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> () From: ( | {
         'Category: Example\x7fComment: Example showing how to construct
a complexButtonMorph.
Perform a doIt on this method.\x7fModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         example = ( |
            | 
            copy: 'go:Go:Go:' 
                  Target: self 
                  "A poor mans method for constructing a dummy event:-)"
                  Event: (ui2Event copy sourceHand: desktop w hands first)
                  Color: color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> () From: ( | {
         'Category: Example\x7fModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         go: a Go: b Go: c = ( |
            | 
            a+b+c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            argumentEditorMorphs do: [| :p. :i. |
              dict if: p IsPresentDo: [| :n | argumentEditorMorphs at: i Put: n ].
            ].
            argumentEditorMorphs: argumentEditorMorphs asList.
            selectorLabelMorphs do: [| :p. :i. |
              dict if: p IsPresentDo: [| :n | selectorLabelMorphs at: i Put: n ].
            ].
            selectorLabelMorphs: selectorLabelMorphs asList.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
             menu.
            | 
            menu: ui2Menu copy color: nonpluggableOutliner menuColor.
            menu addButtonTarget: self ScriptBlock: [target setTarget] Label: 'Set Target'.
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            menu popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'complexButtonMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         setTarget = ( |
             last.
             myBounds.
            | 
            "Set the receiver's target to the top morph below it."
            "This just copied from ui2Button, sigh (dmu)"

            myBounds: globalBounds.
            world morphsReverseDo: [| :m |
                m = self ifTrue: [
                    last ifNotNil: [
                        target: last root.
                        target isPluggableOutliner && 
                        [target model isSelfObjectModel]  ifTrue: [
                          [|:exit|
                            target: target model mirror reflecteeIfFail: exit.
                          ] exit.
                        ].
                        ^self.
                    ].
                ].
                (myBounds intersects: m globalBounds) ifTrue: [ last: m ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            complexButtonMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         selectorLabelMorphs.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'complexButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: InitializeToExpression: (lobby)\x7fVisibility: private'
        
         target <- bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot'
        
         complexButtonMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'complexButtonMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'complexButtonMorph' -> () From: ( |
             {} = 'Comment: the prototype module object, I am created by init.self.\x7fModuleInfo: Creator: globals modules complexButtonMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'complexButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'complexButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'complexButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'complexButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'complexButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: complexButtonMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules complexButtonMorph postFileIn
