 '$Revision: 30.9 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'Category: Test suite\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         doTestStructureEditor: msg = ( |
             aMsg.
             closeDesktop <- bootstrap stub -> 'globals' -> 'false' -> ().
             t.
             theEditor.
            | 
            t: doTestAST.
            t doInterior: [|:n| 
                 n isMethodSlot ifTrue: [
                    n selector = 'foo:Bar:' ifTrue: [ aMsg: n]
                 ]]
               Sons: [ ].
            desktop isOpen ifFalse: [ desktop open. closeDesktop: true].
            theEditor: t createStructureEditor: nil.
            desktop w safelyDo: [
              theEditor currentColumn changed.
              theEditor currentColumn position: (300@150).
              theEditor currentColumn changed.
             ].
            desktop w safelyDo: [theEditor currentColumn doFlatStyle].
            nil = aMsg
               ifTrue: ['No foo:Bar: found' printLine]
               False: ['Found' printLine .
                 desktop w safelyDo: [ 
                 aMsg position currentColumn theAST setContraction: false." a hack"
                 aMsg position currentColumn expandAST].
                 desktop w safelyDo: [theEditor currentColumn doInsetBezelStyle].
                 "wait 5 sec."
                 times delay: 5000.
                 desktop w safelyDo: [aMsg position currentColumn collapseAST: nil].
                 times delay: 2000.
                 theEditor currentColumn delete.
              ].
            closeDesktop ifTrue: [desktop close].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         typeInf = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'typeInf' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax abstractSyntaxTest typeInf.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'typeInf' -> () From: ( | {
         'Comment: This is NOT a candy bar\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         bar: x = ( |
             s.
             t.
            | 
            t: labelMorph copy.
            x = 7 "syv"
              ifTrue: [ 
                s: labelMorph copy.
                foo.
              ] False: [ 
                s: set copy. 
                s add: x.
                s printString printLine.
                "t label: s printString.
                desktop w addMorph: t.
                desktop w moveToFront: t."
            ].  
            x = 7 ifTrue:[ t add: (x + 1) * 2 ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'typeInf' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         foo = ( |
            | bar: 3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'typeInf' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         main = ( |
            | 3 + 4. foo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'typeInf' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         wordCount = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'wordCount' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax abstractSyntaxTest wordCount.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'wordCount' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         main = ( |
            | 
            wordCount countWordsIn: 
             'Hello wolrd \n here is self').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'wordCount' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         panren* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Preferences\x7fComment: Preference for structureEditing formattimg.
See the string returned by this method.
-- Olm, 1/6/95\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         asIsPP: bool = ( |
            | 
            traits abstractSyntax morphPPStream styles useAsIsPP: bool).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: General morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         expanderListMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'prototype' From:
             globals frameMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax expanderListMorph.

CopyDowns:
globals frameMorph. copy 
SlotsToOmit: prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( | {
         'Category: expanderListMorph behaviour\x7fComment: add additional morphs to
the expansion list\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         add: l = ( |
            | 
            theList addAll: l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( | {
         'Category: expanderListMorph behaviour\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         buildLabel: title = ( |
            | 
            labelMorph copy label: title).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( | {
         'Category: expanderListMorph behaviour\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         collapse: evt = ( |
             l.
            | 
            l: theRow lastMorph firstMorph. "the label with title"
            theRow lastMorph removeAllMorphs.
            theRow lastMorph addMorph: l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: title List: list = ( |
             ex.
             expander.
             f.
             l.
             r.
            | 
            ex: resend.copy.
            ex theList: list.
            ex initialize: title).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: title List: list Object: obj = ( |
             ex.
             expander.
             f.
             l.
             r.
            | 
            ex: resend.copy.
            ex theList: list.
            ex color: styles frameColor.
            ex theObject: obj. "OBS - factor this in a better way!"
            ex initialize: title).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( | {
         'Category: Example\x7fComment: Shows an example on how to use this morph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         example = ( |
             exl.
             l.
            | 
            l: list copyRemoveAll.
            l add: labelMorph copy label: 'Item no. 1'.
            l add: abstractSyntax expanderListMorph 
                   copy: 'Item no.2' 
                   List: ((list copyRemoveAll 
                            add: labelMorph copy label: 'Item no. 2.1')
                            add: labelMorph copy label: 'Item no. 2.2')
                            add: labelMorph copy label: 'Item no. 2.3'.
            l add: labelMorph copy label: 'Item no. 2'.
            exl: copy: 'Expander list example' List: l.
            [desktop add: exl].
            ^exl).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( | {
         'Category: expanderListMorph behaviour\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         expand: evt = ( |
            | 
            theRow lastMorph addAllMorphs: theList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( | {
         'Category: State\x7fComment: Traits outliner expanderAction\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         expanderAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> 'expanderAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax expanderListMorph expanderAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> 'expanderAction' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            source isExpanded ifTrue: [ target expand: evt ]
                               False: [ target collapse: evt ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( | {
         'Category: Basics\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize: title = ( |
             expander.
             f.
             l.
             r.
            | 
            color: styles frameColor.
            r: rowMorph copy.
            theRow: r.
            r topJustify.
            r color: styles frameColor.
            r borderWidth: 0.
            expander: (expanderMorph copyTarget: self Action: expanderAction).
            r addMorphLast: expander.
            r addMorphLast: (labelMorph copy label: ' ') color: r color. 
            f: frameMorph copy.
            f borderWidth: 0.
            f leftJustify.
            f color: styles frameColor.
            f frameStyle: "ui2" frameMorph insetBezelStyle.
            l: buildLabel: title.
            l fontSpec: l fontSpec copySize: 12.
            f addMorphLast: l.
            r addMorphLast: f.
            addMorph: r.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( | {
         'Category: Basics\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'expanderListMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSyntax expanderListMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: styles\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         styles = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax morphPPStream styles.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( | {
         'Category: Basics\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (traits abstractSyntax morphPPStream styles)\x7fVisibility: private'
        
         styles = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( | {
         'Category: State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         theList <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( | {
         'Category: State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         theObject.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'expanderListMorph' -> () From: ( | {
         'Category: State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         theRow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         asIsPP <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         browserColor = ( |
            | 
            (paint named: 'gray') copyBrightness: 0.72).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         childrenFoundColor = ( |
            | (paint named: 'green') copyBrightness: 0.80).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultBorderWidth: style = ( |
            | 
            style =  frameMorph flatStyle ifTrue: [0]
              False: [1]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'Comment: Set the default style of
the structureEditor to flatStyle
-- Olm, 1/5/95\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         flat = ( |
            | 
            frameStyle: frameMorph flatStyle.
            frameBorder: defaultBorderWidth: frameMorph flatStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         frameBorder <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         frameColor = ( |
            | 
            "(paint named: 'blue') copyBrightness: 0.93"
            "paint copyRed: 0.643206 Green: 0.836755 Blue: 0.826979."
            "(paint named: 'gray') copyBrightness: 0.92"
            paint named: 'lightGray').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'Comment: If frameStyle is flatStyle then
frameBorder should be zero\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (frameMorph flatStyle)\x7fVisibility: private'
        
         frameStyle <- frameMorph flatStyle.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         justifyRow: row = ( |
            | 
            "row topJustify."
            row centerJustify).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         localFoundColor = ( |
            | 
            (paint named: 'green') copyBrightness: 0.60).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         notFoundColor = ( |
            | paint copyRed: 0.9 Green: 0.57 Blue: 0.59).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         perhapsFoundColor = ( |
            | 
            (paint named: 'yellow') copyBrightness: 0.75).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         rowBorder = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         selectionColor = ( |
            | (paint named: 'white') copyBrightness: 0.99).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         topFrameColor = ( |
            | 
            "(paint named: 'blue') copyBrightness: 0.93."
            (paint named: 'gray') copyBrightness: 0.75).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'Category: Setting styles\x7fComment: Preference for structureEditing formattimg.
See the string returned by this method.
-- Olm, 1/6/95\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         useAsIsPP: bool = ( |
            | 
            asIsPP: bool.
            bool 
              ifTrue: ['Structure editor will attempt to preserve your formatting']
              False: ['Structure editor will reformat your code']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'Category: Setting styles\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         useBezelStyle = ( |
            | 
            frameStyle: frameMorph bezelStyle.
            frameBorder: defaultBorderWidth: frameMorph bezelStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'Category: Setting styles\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         useFlatStyle = ( |
            | 
            frameStyle: frameMorph flatStyle.
            frameBorder: defaultBorderWidth: frameMorph flatStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> () From: ( | {
         'Category: Setting styles\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         useInsetBezelStyle = ( |
            | 
            frameStyle: frameMorph insetBezelStyle.
            frameBorder: defaultBorderWidth: frameMorph insetBezelStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: General morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         browser = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'buildLabel:' From:
             bootstrap remove: 'example' From:
             bootstrap remove: 'expand:' From:
             globals abstractSyntax expanderListMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax browser.

CopyDowns:
globals abstractSyntax expanderListMorph. copy 
SlotsToOmit: buildLabel: example expand:.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> () From: ( | {
         'Category: Browser slots\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addObject: obj Title: title = ( |
             bl.
             ex.
             l.
             m.
             t <- ''.
            | 
            theObject: reflect: obj.
            l: buildList.
            ex: abstractSyntax browser copy: title List: l Object: reflect: obj.
            ex available: true.
            add: list copyRemoveAll add: ex.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> () From: ( | {
         'Category: Browser slots\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         available <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> () From: ( | {
         'Category: Browser slots\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         browserLabel = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> 'browserLabel' -> () ToBe: bootstrap addSlotsTo: (
             globals labelMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> 'browserLabel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax browser browserLabel.

CopyDowns:
globals labelMorph. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> 'browserLabel' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonPress: button Event: evt = ( |
            | 
            button label = 'Open outliner' ifTrue: [ openOutliner: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> 'browserLabel' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: lab Object: obj = ( |
             bl.
            | 
            bl: resend.copy.
            bl label: lab.
            [
            bl fontSpec: fontSpec copyName: 'verdana' Size: 10.
            ].
            bl theObject: obj.
            bl).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> 'browserLabel' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> 'browserLabel' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         leftDoubleClick: evt = ( |
            | 
            openOutliner: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> 'browserLabel' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         middleMouseDown: evt = ( |
            | 
            evt sourceHand subscribeUntilAllUp: self.
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> 'browserLabel' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'browserLabel'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> 'browserLabel' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         openOutliner: evt = ( |
            | 
            evt sourceHand world outlinerForMirror: theObject).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> 'browserLabel' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu color: paint copyRed: 0.900293 Green: 0.855327 Blue: 0.72043.
            menu addButtonTarget: nil Label: 'Open outliner'.
            "menu addButtonTarget: nil Label: 'Add browser'."
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            (menu copy retargetButtonsTo: self)
               popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> 'browserLabel' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         theObject.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> () From: ( | {
         'Category: expanderListMorph behaviour\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         buildLabel: title = ( |
            | 
            nil != theObject
               ifTrue: [ browserLabel copy: title Object: theObject]
               False: [ (labelMorph copy label: title)
                                      fontSpec: globals fontSpec copyName: 'verdana' Size: 10 Style: 'italic']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> () From: ( | {
         'Category: Browser slots\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buildList = ( |
             bl.
             ex.
             l.
             m.
             t <- ''.
            | 
            nil = theObject ifTrue: ['Nil object' printLine.
              ^ list copy removeAll
             ].
            bl: (abstractSyntax categoryStruc copy 
                name: 'Top') elements: list copyRemoveAll.
            m: theObject.
            l: list copyRemoveAll.
            m do: [| :a. :b |
                "t: t , 'Slot: ' , a name , ' Cat:' , a category .
                a categories do: [| :c| t: t , '\n\tSub: ', c].
                t: t  , '\n'."
                "t printLine."
              bl add: a Sub: a categories.
              "l add: labelMorph copy label: a name."
            ].
            l: bl do: [| :a | slotMorph: a ]
                  Interior: [|:c . :l. m|
                     m: abstractSyntax browser copy: c name List: l.
                     m available: true.
                     m
                ].
            available: true.
            l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> () From: ( | {
         'Category: Copying\x7fComment: Creates a top-level browser.
For an example of how to use this object/method,
see method \'example\'.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: title = ( |
             ex.
             m.
            | 
            ex: copy: title List: list copyRemoveAll.
            ex color: styles browserColor.
            ^ex).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> () From: ( | {
         'Category: Example\x7fComment: Example of creating a browser 
initialized with some objects.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         example = ( |
             ex.
             m.
            | 
            ex: copy: 'An object browser'.

            ex addObject: globals Title: 'globals'.
            ex addObject: abstractSyntax Title: 'abstractSyntax'.
            ex addObject: traits abstractSyntax Title: 'traits abstractSyntax'.
            ex addObject: traits abstractSyntax structureEditorStream styles
                   Title: 'styles'.
            ex addObject: traits Title: 'traits'.
            ex addObject: traits morph Title: 'traits morph'.
            ex addObject: traits slots Title: 'traits slots'.
            ex addObject: traits slotOutliner Title: 'traits slotOutliner'.

            m: (frameMorph copy addMorph: ex) color: styles browserColor.
            [desktop add: m.].
            "desktop moveToFront: m."
            ^m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> () From: ( | {
         'Category: expanderListMorph behaviour\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         expand: evt = ( |
            | 
            theList isEmpty ifTrue: [ theList: buildList].
            theRow lastMorph addAllMorphs: theList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'browser' -> () From: ( | {
         'Category: Browser slots\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         slotMorph: slot = ( |
             ex.
            | 
            slot isArgument 
            || [slot isAssignable]
            || [slot isAssignment]
            || [slot isMethod]
            "|| [slot isParent]"
            || [slot isVectorElement] ifTrue: [
               ex: browserLabel copy: slot name Object: slot value
             ] False: [
                ex: abstractSyntax browser copy: slot name 
                            List: list copyRemoveAll
                            Object: slot value.
            ].
            ex).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (abstractSyntax emptyNode)\x7fVisibility: private'
        
         clipBoard <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyNode' -> ().
        } | ) 


 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Misc\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         doPPonMorph: anAST = ( |
             thePos.
            | 
            '\n\n>>>> starting pretty-printing on morph' printLine.
            anAST ppWidth.
            desktop w safelyDo: 
              [thePos: anAST doPP: morphPPStream new: 60].
            thePos root: anAST.
            "thePos uglyEditor theAST: anAST."
            '<<<<<<< end of pretty-printing' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: General morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         editorTextField = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'editorTextField' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'prototype' From:
             globals editorMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'editorTextField' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax editorTextField.

CopyDowns:
globals editorMorph. copy 
SlotsToOmit: prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'editorTextField' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: text = ( |
             em.
            | 
            em: resend.copy.
            em setString: text.
            em setFontSpec: outlinerPreferences mediumFontSpec
                 FontColor: (paint named: 'black').
            em).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'editorTextField' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: text Width: w Height: h = ( |
             ed.
            | 
            ed: copy: text.
            "ed setWidth: w Height: h."
            ed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'editorTextField' -> () From: ( | {
         'Category: Example\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         example = ( |
            | 
            copy: 'Flaeskesteg med sovs og kartofler').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'editorTextField' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSyntax editorTextField).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Streams\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         morphPPStream = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'morphPPStream' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'col' From:
             bootstrap remove: 'parent' From:
             globals abstractSyntax pPStream copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax morphPPStream.

CopyDowns:
globals abstractSyntax pPStream. copy 
SlotsToOmit: col parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)'
        
         col <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (list copy)'
        
         colStack <- list copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (abstractSyntax ppFrameMorph copy)'
        
         currentColumn.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (abstractSyntax ppRowMorph copy)'
        
         currentRow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         ppFrameMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppFrameMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax ppFrameMorph.

CopyDowns:
globals frameMorph. copy 
SlotsToOmit: parent prototype.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: morph types\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (abstractSyntax ppFrameMorph)'
        
         frameMorphType <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppFrameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         ppLabelMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppLabelMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals labelMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( |
             {} = 'Comment: Representation notes:

     1. To save space, a number of flags and other information is
	encoded into the single slot \'rawFlags\'.

     2. This object provides a default representation for a morph:
	the rectangle specified by \'rawBox\'. Children such as
	circleMorphs may replace this slot with their own
	representation slots (e.g., \'center\' and \'radius\').

     3. The default resize behavior of a morph is both horizontally
	and vertically rigid (for details, see the resizing category).\x7fModuleInfo: Creator: globals abstractSyntax ppLabelMorph.

CopyDowns:
globals labelMorph. copy 
SlotsToOmit: parent prototype.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: morph types\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (abstractSyntax ppLabelMorph)'
        
         labelMorphType <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppLabelMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         morphPPStream = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax morphPPStream.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         pred.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         ppRowMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppRowMorph' -> () ToBe: bootstrap addSlotsTo: (
             globals rowMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppRowMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax ppRowMorph.

CopyDowns:
globals rowMorph. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: morph types\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (abstractSyntax ppRowMorph)'
        
         rowMorphType <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppRowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         enclosingMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isLast <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         morphs.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         ppFrameMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax ppFrameMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | abstractSyntax ppFrameMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (abstractSyntax emptyNode)\x7fVisibility: private'
        
         theAST <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         theLink.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addAfter = ( |
            | 
            insert: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addBefore = ( |
            | 
            insert: true.
            [| code |
            "code: theAST inCode. "
            code: theAST enclosingListFather.
            "('addBefore:' , theAST prettyPrint , ' In: ', code prettyPrint) printLine."
            code insert: true At: theAST.
            code = code position currentColumn theAST 
               ifFalse: [ 'inconsistent frame/ast' printLine.].
            code position currentColumn collapseAST.
            code position currentColumn expandAST]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addDroppingMorph: m Event: evt = ( |
            | 
            'Drop' printLine.
            m morphsDo: [| :m | m morphsDo: [ | :n |  abstractSyntax clipBoard: n theAST ]].
            abstractSyntax clipBoard father: theAST.
            pasteAST: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addReceiver: evt = ( |
             eo.
            | 
            "assume theAST isMessage"
            theAST replaceSon: theAST receiver 
                   With: abstractSyntax unExpanded copy category: 'exp'.
            eo: owner owner.
            eo collapseAST.
            eo expandAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: morph manipulation\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         appendMorph: m = ( |
            | 
            m enclosingMorph: self.
            "addMorphLast: m."
            morphs add: m.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: morph manipulation\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         appendRow: m = ( |
            | appendMorph:m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buildMainMenu: menu = ( |
             elf.
             sel.
             selAST.
             target.
            | 
            sel: outerFrame currentSelection .
            selAST: sel theAST.
            target: selAST position currentColumn.
            selAST category = 'instance' ifTrue: [ menu addButtonTarget: nil Label: 'Open'].
            menu addButtonTarget: nil Label: 'Collapse'.
            menu addButtonTarget: nil Label: 'CollapseSubs'.
            menu addButtonTarget: nil Label: 'Copy'.
            menu addButtonTarget: nil Label: 'Paste'.
            menu addButtonTarget: nil Label: 'Cut'.
            menu addButtonTarget: nil Label: 'Delete'.
            menu addButtonTarget: nil Label: 'TextEdit'.
            elf: selAST enclosingListFather.
            elf != abstractSyntax emptyNode ifTrue: [
                menu addButtonTarget: nil Label: 'Add' , elf subListCategory , 'Before'.
                menu addButtonTarget: nil Label: 'Add' , elf subListCategory , 'After'.
            ].
            selAST isMessage && [selAST receiver = abstractSyntax emptyNode]
               ifTrue: [ menu addButtonTarget: nil Label: 'Add receiver'].
            selAST isMessage || [selAST hasCode] ifTrue: [ menu addButtonTarget: nil Label: 'Self Messages'].
            selAST isMessage ifTrue: [
               menu addButtonTarget: nil Label: 'Implementors'.
               menu addButtonTarget: nil Label: 'Senders'.
            ].
            selAST isObject ifTrue: [ menu addButtonTarget: nil Label: 'Leaf children'].
            selAST isMessage || [selAST hasCode] ifTrue: [
               menu addButtonTarget: nil Label: 'Local check'.
               menu addButtonTarget: nil Label: 'Global check'.
            ].
            (selAST isMethodSlot) || [selAST father isMethodSlot]
                  ifTrue: [ menu addButtonTarget: nil Label: 'Infer types'.
                     (checkIfTypeInfIsIn: nil) ifTrue: [
                            menu addButtonTarget: nil Label: 'Show type templates'
            ]].
            target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonPress: button Event: evt = ( |
            | 
            button label = 'Open'          ifTrue: [^openAST: evt   ].
            button label = 'Collapse'      ifTrue: [^collapseAST    ].
            button label = 'CollapseSubs'  ifTrue: [^collapseSubs   ].   
            button label = 'Copy'          ifTrue: [^copyAST: evt   ].
            button label = 'Paste'         ifTrue: [^pasteAST: evt  ].
            button label = 'Cut'           ifTrue: [^cutAST: evt    ].
            button label = 'Delete'        ifTrue: [^deleteAST: evt ].
            button label = 'TextEdit'      ifTrue: [^textEditAST ].
            button label = 'AddExpBefore'  ifTrue: [^addBefore ].
            button label = 'AddExpAfter'   ifTrue: [^addAfter ].
            button label = 'AddSlotBefore' ifTrue: [^addBefore ].
            button label = 'AddSlotAfter'  ifTrue: [^addAfter ].
            button label = 'Local check'   ifTrue: [^checkAST ].
            button label = 'Add receiver'  ifTrue: [^addReceiver: evt ].
            button label = 'Leaf children' ifTrue: [^childrenOf: evt ].
            button label = 'Self Messages' ifTrue: [^messagesToSelf: evt ].
            button label = 'Global check'  ifTrue: [^checkSelfMessages: evt ].
            button label = 'Infer types'   ifTrue: [^inferTypes: evt ].
            button label = 'Show type templates' ifTrue: [^showInferredTypes: evt ].
            button label = 'Implementors'  ifTrue: [^implementors: evt].
            button label = 'Senders'       ifTrue: [^senders: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         calledSelectors: evt = ( |
             if.
             t.
            | 
            t: ''.
            if: inf interface.
            if forExp: theAST byteCodePos In: if getMainTemplate
                 DoMethodTargets: [|:th.| 
                      t:   th target targetAst niceName , ' ' , theAST selector .
                    th outgoingDo: [| :tp | t: t , ' ' , tp index printString ].
                    topLabel addMorphLast:  labelMorph copy label: t.
                    "th target targetAst aMember 
                      makeAST createStructureEditor: evt Templates: th outgoingVector" ]
                 DoReads: [|:x| t: t , x , '\n' ]
                 DoWrites: [|:x| t: t , x , '\n']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         checkAST = ( |
            | 
            theAST
              check:  [| :msgNode | ('Found: ', msgNode selector ) printLine.
                  msgNode position labelsDo: [| :lab | lab color: msgNode position styles localFoundColor]
              ] NotFound:  [|:msgNode | 
                 ('Not found: ' , msgNode selector) printLine.
                 msgNode position labelsDo: [| :lab | lab color: msgNode position styles notFoundColor]
               ]
              Ambiguous: [| :msgNode | ('Ambiguous:' , msgNode selector) printLine ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         checkIfTypeInfIsIn: evt = ( |
             m.
             t.
            | 
            m: reflect: globals.
            m do: [|:s| 
               s name = 'inf' ifTrue: [
                 'Type inf seems to be there!' printLine.
                 ^true
              ]].
            nil != evt ifTrue: [
             t: '' & ''. " a string collector"
             t: t & 'You need to file-in the type inference code!\n'.
             t: t & 'Talk to Ole Agesen about how to do this.\n'.
             t: t & 'E-mail: ole.agesen@eng.sun.com\n'.
             t: t & 'Tel.: +1 415 336-2346\n\n'.
             t: t & 'If you are at Sun Labs, the following expression will file-in the code:\n\n'.
             t: t & '   \'~agesen/self/objects/applications/Typeinf/allti.self\' _RunScript\n'.
             t flatString printLine.
             evt sourceHand attach:
                (textViewerMorph copyTitle: 'NO type inference code available!'
                     Text: t flatString) open.
            ].
            ^false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         checkLinks: res = ( |
             check <- bootstrap stub -> 'globals' -> 'true' -> ().
             l.
             pred.
             s.
            | 
            check ifTrue: [ s: 'Check links', content.
            res = self ifFalse: 
                [ s: s , '\nhead is empty\nnext: ' , res content ].
            pred: res.
            l: res theLink.
            res isEmpty ifTrue: [s: s , '\nres is empty' ].
            " owner should be enclosingMorph"
            nil = owner ifTrue: [s: s , '\nowner is NIL' ].
            s printLine.
            [(nil != l) && [ l != res ]] whileTrue: [
              ('link element' , l content) printLine.
              nil = l owner ifTrue: ['L owner is nil' printLine.
               l theAST prettyPrint printLine.
               pred theLink: l theLink.
              ].
              l isEmpty ifTrue: ['is empty' printLine].
              pred: l.
              l: l theLink.
            ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         checkSelfMessages: evt = ( |
             error.
             errors.
             pref.
             setCol.
            | 
            'Checking messages to self:' printLine.
            error: false.
            setCol: [|:msg . :col| msg position labelsDo: [|:lab| lab color: col]].
            pref: theAST position styles.
            errors: 
              theAST 
                checkWithLeafChildren: [| :msg | setCol value: msg With: pref localFoundColor ]
                InLeaf: [| :msg | setCol value: msg With: pref childrenFoundColor ]
                NotFound: [| :msg | error: true. setCol value: msg With: pref notFoundColor]
                Ambiguous: [| :msg | error: true ].
            error ifTrue: [
              evt sourceHand attach:
                 (textViewerMorph
                       copyTitle: 'Messages not found' Text: errors flatString).
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         childrenOf: evt = ( |
             l.
             s <- ''.
            | 
            l: theAST leafChildren.
            l do: [|:m| s: s , m printString , '\n'].
            evt sourceHand attach:
                 (textViewerMorph
                       copyTitle: 'Leaf children' Text: s)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: collaps & expand\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseAST = ( |
             link.
             lm.
             of.
             row.
            | "('Collapse: ' , theAST prettyPrint ) printLine."
            outerFrame clearSelection.
            lm: abstractSyntax ppLabelMorph copyContraction: theAST contractionString.
            row: abstractSyntax ppRowMorph copy beShrinkWrap.
            abstractSyntax morphPPStream styles justifyRow: row.
            row color: abstractSyntax morphPPStream styles frameColor.
            row borderWidth: abstractSyntax morphPPStream styles rowBorder.
            row appendMorph: lm.
            row insertMorphs.
            removeAllMorphsInLinks.
            theLink: nil.
            appendMorph: row.
            insertMorphs
            theAST = abstractSyntax emptyNode ifFalse: [theAST contracted: true.]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: collaps & expand\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseSubs = ( |
            | 
            morphsDo: [| :r |
               r morphsDo: [|:f|
                  f morphTypeName = 'ppFrameMorph' ifTrue:
                     [f  collapseAST ]
            ]].
            changed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         content = ( |
             s.
            | 
            s: objectID , '['.
            "both needed when collecting elements in morphs"
            morphsDo: [|:m | s: s , m content].
            morphs do: [|:m | s: s , m content].
            s , ']').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             m.
            | 
            m: resend.copy.
            m morphs: list copyRemoveAll.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAST: evt = ( |
            | 
            abstractSyntax clipBoard: theAST copyDeep.
            abstractSyntax 
              clipBoard doPP: (abstractSyntax morphPPStream new: 30 Event: evt)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         currentSelection = ( |
            | outerFrame selection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         cutAST: evt = ( |
             enclosingFrame.
             father.
             newNode.
             thePos.
            | 
            father: theAST father.
            father = abstractSyntax emptyNode 
               ifTrue: ['The topmost AST cannot be cut' printLine ]
               False: [
                "('Cut:' , theAST prettyPrint , 'From: ' , father prettyPrint ) printLine."
                abstractSyntax clipBoard: theAST.
                newNode: abstractSyntax unExpanded copy category: theAST superCategory.
                newNode category = 'exp' 
                   ifTrue: [ newNode comment: theAST comment copyWithBlanks].
                father replaceSon: theAST With: newNode.
                doPretty: false Event: evt. "Must be before collapse/expand"
                enclosingFrame: owner owner.
                enclosingFrame collapseAST.
                enclosingFrame expandAST.
              ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteAST: evt = ( |
             oe.
            | 
            theAST isDeletable
               ifTrue: ['do delete' printLine.
                  update: nil Editor: nil.
                ]
               False: [ cutAST: evt.]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: style\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         doBezelStyle = ( |
            | setStyle: bezelStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: style\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         doFlatStyle = ( |
            | 
            setStyle: flatStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: style\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         doInsetBezelStyle = ( |
            | setStyle: insetBezelStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: collaps & expand\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         doPretty: forSub Event: evt = ( |
             theStream.
             topPos.
            | 
            abstractSyntax seStack: list copyRemoveAll.
            topPos:
              forSub 
                ifTrue: [ abstractSyntax morphPPStream newForSub: theAST position width]
                False: [ abstractSyntax morphPPStream new: 30 Event: evt].
            theStream: 
               outerFrame asIsPP 
                 ifTrue: [ theAST asIsPP: topPos ]
                 False: [ theAST doPP: topPos ].
            theStream currentRow insertMorphs.
            theStream currentColumn insertMorphs.
            abstractSyntax seStack: nil.
            theStream).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: printing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         doPrettyText = ( |
             theStream.
             topPos.
            | 
            abstractSyntax seStack: list copyRemoveAll.
            topPos: abstractSyntax pPStream copy width: 100.
            theStream: 
               outerFrame asIsPP 
                 ifTrue: [ 'asIsPP' printLine. theAST asIsPP: topPos ]
                 False: [ theAST doPP: topPos ].
            theStream).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         drawBottomOn: c Box: box Color: col = ( |
            | 
            isLast ifTrue: [
               c line: box bottomRight To: box bottomLeft  Color: col
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         drawLeftOn: c Box: box Color: col = ( |
            | 
            isFirst && [theLink != nil ] && [theLink != self ]ifTrue: [
               c line: box topLeft     To: box bottomLeft + (0@4)  Color: col.
             ] False: [
               c line: box topLeft     To: box bottomLeft  Color: col.
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         drawRightOn: c Box: box Color: col = ( |
            | 
            c line: box topRight    To: box bottomRight Color: col).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         drawTopOn: c Box: box Color: col = ( |
            | 
            isFirst ifTrue: [
               c line: box topLeft     To: box topRight    Color: col
             ] False: [
            isAfterFirst ifTrue:[
                 c line: box topLeft     To: box topRight    Color: col
             ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         enclosingBorderWidth = ( |
            | 
            morphTypeName = 'structureEditorMorph'
               ifTrue: [ (0@0)]
               False: [ 
                 (borderWidth@borderWidth) 
                 +  enclosingMorph enclosingMorph enclosingBorderWidth]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         endLink = ( |
             l.
             last.
             n.
             res.
            | 
            isEmpty 
              ifTrue: [
                "it is currently assumed that only the last ppFrameMorph
                 may be empty and therefore removed!"
                nil != theLink ifTrue: [
                   delete. "only necessary if pp/Row/Frame/Morphs 
                            added directly to the enclosing morph"
                   enclosingMorph morphs remove: self IfAbsent:[].
                   res: theLink endLink.
                ] False: [
                  '!!!!Should NOT happen: endLink is empty and theLink=nil' printLine.
                  res: self "??"
               ].
             ] False: [
               isLast: true.
               l: theLink.
               last: self.
               n: 100. "defensive hack - but should not be necessary"
               [(nil != l) && [n > 0] ] whileTrue: [
                  isMiddle ifTrue: [borderWidth: 0].
                  last: l.
                  l: l theLink.
                  n: n - 1 .
                ].
               last theLink: self.
               res: self.
              ].
            "checkLinks: res."
            ^res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: collaps & expand\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         expandAST = ( |
             theStream.
             topPos.
            | "('Expand: ' , theAST prettyPrint ) printLine."
            theAST contracted: false.
            isAtLeft "|| [theAST contracted]" "to handle contractions - need improvement"
             ifFalse: [ enclosingMorph enclosingMorph expandAST
             ] True: [
               theStream: doPretty: true Event: nil. "expandAST should have an event param"
              " theAST position should be well-defined after doPP.
                theAST position currentColumn is the  ppFrameMorph containing theAST.
                doPP returns a morphPPstream with a morph:
                structureEditorMorph[ outerRow[ frame: (theAST) [ rows ... ]
                theStream currentColumn = outerFrame"
              removeAllMorphsInLinks. 
              theStream currentColumn
                morphsDo: [|:f| f isEmpty ifFalse: [ appendMorph: f ]].
              insertMorphs.
              theAST position currentColumn: self.
              outerFrame currentSelection: abstractSyntax selection copy: theAST.
              outerFrame highLightSelection.
              "xxx why "owner" below? -- JHM"
              "owner" layoutChanged
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: printing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         fileNameSheet = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> 'fileNameSheet' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax ppFrameMorph fileNameSheet.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> 'fileNameSheet' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         copyText: text = ( |
             fs.
            | 
            fs: resend.copy.
            fs theText: text).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> 'fileNameSheet' -> () From: ( | {
         'Comment: Must be there!\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         doProp: blk = ( |
            | 
            blk value: 'foo.self'
                With: 'File name'
                With: 'Name of file to pretty-print Self code'
                With: 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> 'fileNameSheet' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> 'fileNameSheet' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (\'\')'
        
         theText <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> 'fileNameSheet' -> () From: ( | {
         'Comment: Must be there\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         update: values = ( |
            | 
            values do: [|:v| 
              v = '' ifTrue: [7 asCharacter printLine. ^false].
              theText printOnFile: v.
              ^ true
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: browsing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         implementors: evt = ( |
            | 
             evt sourceHand attach: (implementorsMorph copySelector: theAST selector Event: evt).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: basics\x7fComment: Returns true if the event (evt) is in the frame
of this morph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         inFrame: evt = ( |
             innerBounds.
            | 
            "('Event bounds: ' , evt bounds printString , ' : ' , evt cursorPoint printString , 
             ' Morph: ' , globalBounds printString , ' Position: ' , globalPosition printString) printLine.
            borderWidth printString printLine."
            "I think the next one should be 
             innerBounds: globalBounds + ((borderWidth@borderWidth) # ((0-borderWidth)@(0-borderWidth))).
             but that dont work??
            "
            innerBounds: globalBounds - ((borderWidth@borderWidth) # ((0-borderWidth)@(0-borderWidth))).
            "innerBounds printString printLine."
            (innerBounds includes: evt cursorPoint) ifTrue: [ ^false] False: [ ^true ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         inferTypes: evt = ( |
             if.
             m.
             obj.
             sel.
             slotAST.
            | 
            theAST isMethodSlot ifTrue: [ slotAST: theAST ]
              False: [
               "Then regularObject - go to enclosing method slot"
               slotAST: theAST father
             ].
            (checkIfTypeInfIsIn: evt) ifTrue: [
              ( 'Infer types: ', slotAST slotName) printLine.
              nil != inf currentTypeInfApplicationMorph
                 ifTrue: [ inf currentTypeInfApplicationMorph quit].
              m: abstractSyntax typeInfApplicationMorph copy: slotAST Editor: outerFrame.
              evt sourceHand attach: m.
              inf currentTypeInfApplicationMorph: m.
              m analyze.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fComment: Displays the inferred type of selected expression\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         inferredType: evt = ( |
             bc.
             if.
             methodMirr.
             mirr.
             mt.
             np.
             t <- ''.
             tf.
             tiAST.
             tim.
            | 
            tim: outerFrame theTypeInfMorph.
            nil != tim ifTrue: [
            tiAST: tim typeInferredMethodAST.
            (nil != tiAST) && [ theAST in: tiAST] && [ theAST != tiAST] ifTrue: [
                  tim inferredType: theAST Event: evt.
            [ if: inf interface.
              mt: outerFrame theTypeInfMorph typeInfTemplates.
              mirr: theAST enclosingObject theMirror.
              mirr isReflecteeBlock ifTrue: [
                   mirr: mirr valueSlot contents.
                   methodMirr: theAST enclosingMethodObject theMirror
                 ] False: [ methodMirr: mirr].
              (nil != mt) && [ methodMirr = mt first meth theMember] ifTrue: [
                 bc: theAST byteCodePos.
                 t: 'Type at: ' , bc printString .  
                 tf: if getTypeForExp: bc MethodMirror: mirr In: mt.
                 nil != tf ifTrue: [ np: 'Result type = ' , tf nicePrintString ]
                           False: [ np: 'An error will happen before this expression is executed!!' ].
               ] False: [ np: 'No type info available' ].
               (t , np) printLine.
               outerFrame showResultType: np.].
              ] False: [ tim removeResultType]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         insert: before = ( |
             father.
             top.
            | 
            father: theAST enclosingListFather.
            "('addAfter:' , theAST prettyPrint , ' In: ', father prettyPrint) printLine."
            father insert: before At: theAST.
            "father prettyPrint printLine."
            "father: topFrame. -- fails since owner of some enclosing row may be nil??"
            father position currentColumn collapseAST.
            father position currentColumn expandAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: morph manipulation\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         insertMorphs = ( |
            | 
            "('Frame:' , content) printLine."
            addAllMorphs: morphs.
            morphs: list copyRemoveAll.
            "morphs do: [| :m | m insertMorphs ]."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         isAfterFirst = ( |
            | 
            nil = theLink
              ifTrue: [^ false]
              False: [ ^theLink isFirst]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: collaps & expand\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         isAtLeft = ( |
            | 
            linksDo: [|:f|
               f positionInEditor x != 0
                 ifTrue: [ ^false]
             ].
            ^true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         isBeforeLast = ( |
            | 
            nil = theLink 
               ifTrue: [^false]
               False: [^false "temporarily"]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: basics\x7fComment: A frameMorph is empty if the
rowMorph it encloses has no submorphs.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         isEmpty = ( |
            | 
            morphsDo: [|:row | ^row isEmpty ].
            morphs do: [|:row | ^row isEmpty].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         isFirst = ( |
            | 
            nil = theLink 
                ifTrue:  [ ^true]
                False: [ ^theLink isLast]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         isMiddle = ( |
            | 
            (isFirst || isAfterFirst || "isBeforeLast ||" isLast) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: morph manipulation\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         layoutChange = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         leafMorphAt: pt = ( |
            | 
            (baseContainsPt: pt - owner globalPosition)
               ifTrue: [
                  morphsDo: [| :rm | 
                   rm morphsDo: [| :m |
                      m morphTypeName = 'ppFrameMorph' 
                        ifTrue: [| leaf |
                          leaf: m leafMorphAt: pt.
                          nil != leaf ifTrue: [ ^leaf ]
                  ]]].
                  ^self
              ] False: [^nil]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: Events\x7fComment: Only pick-up if in frameBorder!
Otherwise no action.
I am not sure this is a good idea?
-- Olm, 1/9/95\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            (inFrame: evt )
              ifTrue: [resend.leftMouseDown: evt]
              False: [ ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         linkWith: f = ( |
            | 
            f theLink: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: selection\x7fComment: Iterates over all ppFrameMorph
that represents this AST.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         linksDo: blk = ( |
             link.
            | 
            blk value: self. 
            link: theLink.
            "the nil test should not be necessary"
            [(nil != link) && [link != self ]] 
              whileTrue: [ 
                 blk value: link. link: link theLink ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         markAST = ( |
             setColor.
            | 
            setColor: 
               [| :morph . :col |
                  morph != nil ifTrue: [
                    morph allMorphsDo: [| :m | 
                          (m morphTypeName = 'rowMorph' )
                          || [ m morphTypeName = 'ppFrameMorph']
                          ifTrue: [ m color: col]
                    ]]].
            setColor value: topFrame With: theAST position styles frameColor.
            setColor value: self With: theAST position styles selectionColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         markSelectors: anObj Templates: tps = ( |
             sty.
            | 'MarkSelectors' printLine.
            sty: anObj position styles.
            anObj markSelectors: [| :sel . :col . c| 
                   nil = col 
                       ifTrue: [ 
                         c: sty notFoundColor.
                         (sel prettyPrint , ' = NIL' ) printLine.
                       ] False: [ (sel prettyPrint , ' = ' , col) printLine ] .
                    case
                       if: [ col = 'green'] Then: [ c: sty localFoundColor ]
                       If: [ col = 'yellow'] Then: [ c: sty perhapsFoundColor ]
                       If: [ col = 'red' ] Then: [ c: sty notFoundColor ] .
                    nil != c ifTrue: 
                        [ sel position labelsDo: [| :lab | lab color: c]].
                   ]
                  Mirror: anObj theMirror 
                  Templates: tps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesToSelf: evt = ( |
             l.
             mts.
             s <- ''.
            | 
            mts: theAST messagesToSelf.
            l: list copyRemoveAll.
            mts do: [| :m |
               (l includes: m) ifFalse: [
                 l add: m.
                 s: s , m , '\n'
              ]].
            evt sourceHand attach:
                 (textViewerMorph
                       copyTitle: 'Messages to Self' Text: s)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: basics\x7fComment: Returns the ppFrameMorph of the nearest
enclosing method.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         methodFrame = ( |
            | 
            theAST isObject && [theAST father isMethodSlot] 
               ifTrue: [ ^self ]
               Fasle: [ ^owenr owner methodFrame]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
            | 
            evt sourceHand subscribeUntilAllUp: self.

            theAST = abstractSyntax emptyNode
               ifTrue: [popUpMenu: evt]
               False: [
                  theAST contracted 
                     ifTrue: [ expandAST ]
                     False: [ popUpMenu: evt ]
               ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'ppFrameMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: morph manipulation\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         newline = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         openAST: evt = ( |
            | 
            "theAST is an instance node"
            (abstractSyntax makeASTfromMirror: 
                reflect: theAST theInstance) 
                    createStructureEditor: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         openWholeObject: evt = ( |
            | 
            theAST root createStructureEditor: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: basics\x7fComment: Returns the structureEditorMorph enclosing 
the structure editor frames (ppFrameMorph\'s).\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         outerFrame = ( |
            | 
            "('F: ' , morphTypeName) printLine."
            (morphTypeName = 'structureEditorMorph' )
               ifTrue: [ ^self ]
               False: [ ^owner owner outerFrame ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: text editing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         parseText: evt IfFail: blk = ( |
             ue.
            | 
            ue: lastMorph.
            "('Accept: ' , theAST  prettyPrint) printLine.
             ('text:' , ue contentsString )  printLine."
            "ue: theAST position uglyEditor."
            theAST 
               parseString: ue text contentsString 
               IfFail: [| :e . errorStart. errorEnd |
                  evt sourceHand attach: syntaxErrorMorph copyMessage: e printString.
                  errorStart: e errorColumn pred @ e errorLine pred.
                  errorEnd: e scannerColumn pred @ e scannerLine pred.
                  ue text selectionStart: errorStart End: errorEnd.
                  blk value
               ].
            update: evt Editor: ue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         pasteAST: evt = ( |
             enclosingFrame.
             father.
             newSon.
             oldSon.
            | 
            "theAST prettyPrint printLine."
            father: theAST father.
            father = abstractSyntax emptyNode 
               ifTrue: ['The topmost AST cannot be pasted' printLine ]
               False: [
                  oldSon: theAST.
                  newSon: abstractSyntax clipBoard.
                  father replaceSon: theAST With: newSon.
                  abstractSyntax  clipBoard: oldSon.
                  enclosingFrame: owner owner.
                  "enclosingFrame collapseAST.
                  enclosingFrame expandAST."
                  oldSon isUnexpanded ifFalse:
                     [oldSon doPP: (abstractSyntax morphPPStream new: 30) ].
              ].
            update: evt Editor: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         popUpMenu: evt = ( |
             menu.
             target.
            | 
            target: self.
            menu: ui2Menu copy.
            menu color: paint copyRed: 0.900293 Green: 0.855327 Blue: 0.72043.
            (morphTypeName = 'structureEditorMorph') && [ inFrame: evt]  
              ifTrue: [ buildTopMenu: menu ]
              False: [
                 nil = outerFrame currentSelection
                     ifTrue: [ menu addButtonTarget: nil Label: 'NO SELECTION!' ] 
                     False: [ target: buildMainMenu: menu ]
            ].
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            (menu copy retargetButtonsTo: target) popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: basics\x7fComment: When bezel/insetBezel, the width of the frame
must be considered to determine if a frame
is to the left in the editor.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         positionInEditor = ( |
            | 
            morphTypeName = 'structureEditorMorph'
               ifTrue: [ (0@0) ]
               False: [
                globalPosition
                 - enclosingMorph enclosingMorph enclosingBorderWidth
                 - outerFrame globalPosition
                 - outerFrame borderWidth
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: collaps & expand\x7fComment: For test purposes\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         positionOfThis = ( |
            | 
            'Positon of selection:' printLine.
            linksDo: [| :f |
             (f positionInEditor printString
              , ' ' , f content) printLine ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: printing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         printOnFile: evt = ( |
             first <- bootstrap stub -> 'globals' -> 'true' -> ().
             frame.
             pos.
             theAST.
            | 
            morphsDo: [| :r | "See method topFrame"
              (r morphTypeName = 'structureEditorSubFrameMorph')
               && [first] ifTrue: [
                  frame: r. theAST: r theAST. first: false.
                  frame collapseAST: evt.
               ]  False: [
                 "here should be exactly one row consisting of one frame!
                  This used to true, but the asIsPP may produce several rows"
                  r morphsDo: [ | :f | f morphTypeName printLine.
                     f morphTypeName = 'ppFrameMorph' ifTrue: [ 
                          first ifTrue: [
                             theAST: f theAST.
                             frame: f.
                             frame collapseAST. 
                             "ppFrameMorph button actions not up-to-date
                                   with having 'evt' as argument."
                             first: false
                             ] False: [ "f delete"]     
               ]]]].
            theAST setContraction: false.
            pos: doPrettyText.
            theAST setContraction: true.
            " printOnFile defines positions in AST to be instances of pPStream.
              expandAST updates these to ppMorphStream instances"
            frame expandAST.
            evt sourceHand attach:
                abstractSyntax 
                  propertySheetMorph copy: 'Structure editor' 
                                   Source: fileNameSheet copyText: pos text).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: morph manipulation\x7fComment: Remove this morph, and remove enclosing morphs
(row and frame) if it becomes empty.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         removeAllMorphsInLinks = ( |
            | 
            linksDo: [|:f| 
               f = self 
                 ifTrue: [ f removeAllMorphs]
                 False: [ f removeSelfAndEnclosingMorphs]
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: morph manipulation\x7fComment: Remove this morph and remove it 
from \'theLink\' list.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         removeMorph = ( |
             pred.
            | 
            pred: theLink.
            [(nil != pred) && [pred theLink != self ]]
              whileTrue: [ pred: pred theLink].
            nil != pred ifTrue: [pred theLink: self theLink].
            delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: morph manipulation\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         removeSelfAndEnclosingMorphs = ( |
             em.
            | 
            removeAllMorphs.
            removeMorph.
            em: enclosingMorph.
            nil != em ifTrue: [
                em " a row" isEmpty ifTrue: [ em delete].
                em: em enclosingMorph " a frame".
                "('Remove: ' , em content) printLine."
                em isEmpty ifTrue: [ em  removeSelfAndEnclosingMorphs ]
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: browsing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         senders: evt = ( |
            | 
            evt sourceHand attach: (
              sendersMorph copySelector: theAST selector Event: evt).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         setColor: col = ( |
             f.
             first <- bootstrap stub -> 'globals' -> 'true' -> ().
            | "'setColor:' printLine."
            f: self.
            [first || [(f !=nil) && [f != self]]] whileTrue: [
               "f theAST prettyPrint printLine."
               first: false.
               f allMorphsDo: [| :m | 
                    (m morphTypeName = 'ppRowMorph' )
                 || [ m morphTypeName = 'ppFrameMorph']
                 ifTrue: [ m color: col]
             ].
             f: f theLink.
             "nil = f ifTrue: ['f is nil' printLine]."
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fComment: 
-- Olm, 1/17/95\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         showInferredTypes: evt = ( |
             slotAST.
            | 
            theAST isMethodSlot ifTrue: [ slotAST: theAST ]
              False: [
               "Then regularObject - go to enclosing method slot"
               slotAST: theAST father
            ].
            nil != inf currentTypeInfApplicationMorph 
                ifTrue: [
                  inf currentTypeInfApplicationMorph 
                      showInferredTypes: slotAST
                      Editor: outerFrame.
            ] False: [ 'No type inference information available' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: basics\x7fComment: Returns the slotOutliner of which this ppFrameMorph
is a part. \x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         slotOutliner = ( |
             out.
            | 
            out: outerFrame.
            [out morphTypeName != 'slotOutliner']
               whileTrue: [
                  out: out owner.
                  nil = out ifTrue: ['OOPS: not in outliner' printLine]
               ].
            out).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         testMorph = ( |
             l.
             m.
            | 
            m: frameMorph copy.
            l: labelMorph copy label: 'Hello world'.
            m addMorphLast: l.
            l: labelMorph copy label: 'How are you?'.
            m addMorphLast: l.
            l: labelMorph copy label: 'Fine thaks!'.
            m addMorphLast: l.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: text editing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         textEditAST = ( |
             ow.
             sa.
             sb.
             thePos.
             ue.
            | 
            theAST setContraction: false.
            ue: uglyTextEditorMorph
                  copyString: theAST prettyPrint
                  Target: self
                  Accept: textEditAccept
                  Cancel: textEditCancel
                  Style: "ui2" slotOutliner preferences.
            ue resizeToText.
            outerFrame currentSelection: nil.
            removeAllMorphs.
            addMorph: ue.
            [thePos: 
               theAST 
                  doPP: 
                    abstractSyntax uglyEditorPPStream 
                        newForSub: 60 
                        Target: self 
                        Accept: textEditAccept
                        Cancel: textEditCancel.
            thePos root: theAST.
            thePos uglyEditor theAST: theAST.
            thePos uglyEditor resizeToText.
            outerFrame currentSelection: nil.
            removeAllMorphs.
            addMorph: thePos uglyEditor.].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: text editing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         textEditAccept = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> 'textEditAccept' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax ppFrameMorph textEditAccept.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> 'textEditAccept' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            "target changeMethodTo: source text contentsString
                           Editor: source
                           IfFail: [^self].
            source clearPanel"
            target parseText: evt IfFail: [^self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: text editing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         textEditCancel = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> 'textEditCancel' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax ppFrameMorph textEditCancel.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> 'textEditCancel' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            "target changeMethodTo: source text contentsString
                           Editor: source
                           IfFail: [^self].
            source clearPanel."
            target enclosingMorph removeAllMorphs.
            target doPrettyTop: evt.
            [target collapseAST: evt.
            target expandAST]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: basics\x7fComment: Returns the ppFrameMorph corresponding
to the root of the AST.
NB! There used to be one frame and one row
corresponding to the root. This may no longer
be true with asIsPP. At leats for methods in outliners
there seem to be a lits of frames/rows.
For an editor on a whole object there ssem to be
an enclosing frame/row.
This should be cleaned up.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         topFrame = ( |
            | 
            owner owner morphTypeName = 'structureEditorMorph'
               ifTrue: [ self ]
               False: [| tf | 
                  tf: owner owner topFrame.
                  tf = nil ifTrue: [ self ] False: [tf ]
               ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: updating\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         update: evt Editor: ue = ( |
             pos.
             theSlot.
            | 
            "passing ue to update:Editor should not be needed, since the syntax
             of the modified code was checked above. And if an error is discovered
             during update, ue will not mark it correctly since update parses the whole
             method body and not just the part that has been texdt-edited."
            theSlot: theAST update: evt Editor: ue.
            "('Update: ' , theSlot prettyPrint) printLine."
            "If no position in theSlot, then probably a 
             structureEditor on a morph in an outliner"
            theSlot position = abstractSyntax emptyPPStream ifTrue: [| ol |
               pos: theSlot method position.
               ol: slotOutliner.
               ol itemsCached: false.
               ol collapse: evt.
               ol expand: evt.
              ] False: [ 
                theSlot position currentColumn collapseAST.
                theSlot position currentColumn expandAST
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | 
            "it should also be checked that the dropped morph
             has the same category as the unexpanded node.
             I.e. slots may be droped on slot,
             and exps may be droped on exp"
            theAST category = 'literal' ifTrue:[ theAST theNumber printLine].
            (m morphTypeName = 'structureEditorMorph')
             &&
             [(theAST isUnexpanded 
              || [( theAST category = 'literal') && [theAST theNumber = '\'<exp>\'' ]]
              )
              || [( theAST category = 'dataSlot') 
                 ]
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         xbaseDrawBezelStyleOn: c = ( |
             b.
             box.
             l.
             r.
             shades.
             t.
             w.
             xList.
             yList.
            | 
            box: baseBounds.
            t: box top.  b: box bottom.  l: box left.  r: box right.
            w: borderWidth.
            shades: shadesForColor.

            "top"

            xList: vector copySize: 4.
            yList: xList copy.

            xList at: 0 Put: l.      yList at: 0 Put: t.
            xList at: 1 Put: r.      yList at: 1 Put: t.
            xList at: 2 Put: r - w.  yList at: 2 Put: t + w.
            xList at: 3 Put: l + w.  yList at: 3 Put: t + w.
            c fillPolygonXs: xList Ys: yList Color: shades mediumHilight.

            "bottom"
            xList at: 0 Put: l + w.  yList at: 0 Put: b - w.
            xList at: 1 Put: r - w.  yList at: 1 Put: b - w.
            xList at: 2 Put: r.      yList at: 2 Put: b.
            xList at: 3 Put: l.      yList at: 3 Put: b.
            c fillPolygonXs: xList Ys: yList Color: shades mediumShadow.

            "left"
            xList at: 0 Put: l.      yList at: 0 Put: t.
            xList at: 1 Put: l + w.  yList at: 1 Put: t + w.
            xList at: 2 Put: l + w.  yList at: 2 Put: b - w.
            xList at: 3 Put: l.      yList at: 3 Put: b.
            c fillPolygonXs: xList Ys: yList Color: shades lightHilight.

            "right"
            xList at: 0 Put: r - w.  yList at: 0 Put: t + w.
            xList at: 1 Put: r.      yList at: 1 Put: t.
            xList at: 2 Put: r.      yList at: 2 Put: b.
            xList at: 3 Put: r - w.  yList at: 3 Put: b - w.
            c fillPolygonXs: xList Ys: yList Color: shades darkShadow.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         xbaseDrawLineStyleOn: c = ( |
             box.
             shades.
            | 
            "sMiddle ifTrue: [  borderWidth: 0 is DONE in endLink
               borderWidth: 0. ^self.
               rawBox: baseBounds topLeft ## (baseBounds size - (0@2)) 
             ]."
            box: baseBounds topLeft ## (baseBounds size - (1@1)).

            shades: shadesForColor.
            frameStyle = bezelStyle ifTrue: [
              drawTopOn: c Box: box Color: shades lightHilight.
              drawLeftOn: c Box: box Color: shades lightHilight.
              drawRightOn: c Box: box Color: shades darkShadow.
              drawBottomOn: c Box: box Color: shades darkShadow.
            ] False: [
                c line: box topLeft     To: box topRight    Color: shades darkShadow.
                c line: box topLeft     To: box bottomLeft  Color: shades darkShadow.
                c line: box topRight    To: box bottomRight Color: shades lightHilight.
                c line: box bottomRight To: box bottomLeft  Color: shades lightHilight.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         xbaseDrawOn: c = ( |
            | 
            "Draw a frame around my contents. If filled is false, only the
             frame itself is drawn, leaving the center empty. Presumably this
             space will be filled by the frame's contents."
            "Optimizations:
                1. if the borderWidth is zero, draw nothing
                2. if the borderWidth is one and the frameStyle is not flat,
                   draw the bezel using one-pixel lines."
            "isMiddle ifTrue: [ borderWidth: 0 ]."
            filled ifTrue: [ c fillRectangle: baseBounds Color: color ].

            0 = borderWidth              ifTrue: [ ^self ].
            frameStyle =       flatStyle ifTrue: [ ^baseDrawFlatStyleOn:       c ].
            1 = borderWidth              ifTrue: [ ^baseDrawLineStyleOn:       c ].
            frameStyle =      bezelStyle ifTrue: [ ^baseDrawBezelStyleOn:      c ].
            frameStyle = insetBezelStyle ifTrue: [ ^baseDrawInsetBezelStyleOn: c ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: style\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         xxxsetStyle: style = ( |
             bor.
             pref.
            | 'Set style ppFrame' printLine.
            pref: abstractSyntax morphPPStream styles.
            bor: pref defaultBorderWidth: style.
            allMorphsDo:  [| :m |
              m morphTypeName = 'ppFrameMorph'
               ifTrue: [
                    m frameStyle: style.
                    m borderWidth: bor.
                    "m layoutChanged"
               ]. 
               m flushLayoutCaches
            ].
            pref frameStyle: style.
            pref frameBorder: bor.
            "xxx unnecessary, I think -- JHM
            changed.
            xxx"
            layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         structureEditorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals abstractSyntax ppFrameMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax structureEditorMorph.

CopyDowns:
globals abstractSyntax ppFrameMorph. copy 
SlotsToOmit: parent prototype.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: morph types\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (abstractSyntax structureEditorMorph)'
        
         structureEditorMorphType <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         myUglyMethodEditorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'myUglyMethodEditorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals uglyMethodEditorMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'myUglyMethodEditorMorph' -> () From: ( |
             {} = 'Comment: Representation notes:

     1. To save space, a number of flags and other information is
	encoded into the single slot \'rawFlags\'.

     2. This object provides a default representation for a morph:
	the rectangle specified by \'rawBox\'. Children such as
	circleMorphs may replace this slot with their own
	representation slots (e.g., \'center\' and \'radius\').

     3. The default resize behavior of a morph is both horizontally
	and vertically rigid (for details, see the resizing category).\x7fModuleInfo: Creator: globals abstractSyntax myUglyMethodEditorMorph.

CopyDowns:
globals uglyMethodEditorMorph. copy 
SlotsToOmit: parent prototype.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'myUglyMethodEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (false)'
        
         dirty <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'myUglyMethodEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         isEmpty.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'myUglyMethodEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'myUglyMethodEditorMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax myUglyMethodEditorMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'myUglyMethodEditorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         dropEvent: e OnSubmorphsAt: globalPt IfHandled: handledBlock = ( |
            | 
            e middleMouseDown  ifTrue: [
              middleMouseDown: e.
              handledBlock value].

            resend.dropEvent: e OnSubmorphsAt: globalPt IfHandled: handledBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'myUglyMethodEditorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
             sAst.
             x.
             y.
            | 
            evt sourceHand subscribeUntilAllUp: self.
            x: evt cursorPoint x.
            y: evt cursorPoint y.
            "'left down' , evt cursorPoint printString  
               , x printString , y printString printLine."
            x: x - text globalPosition x .
            y: y - text globalPosition y .
            x: (x / 6) .
            y: (y / 15) .
            "(theAST position inside:  x @ y) ifTrue: ['Yes' printLine ]
               False: ['No' printLine]. "
            sAst: (theAST getSelectedAST: x @ y).
            sAst  highLight.
            "sAst prettyPrint printLine."
            "text selectionStart: x @ y
                             End: (x + 3)@ (y)").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'myUglyMethodEditorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'uglyMethodEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'myUglyMethodEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         printStringDepth <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'myUglyMethodEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         printStringSize: s Depth: d = ( |
            | 12).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'myUglyMethodEditorMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | abstractSyntax myUglyMethodEditorMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'myUglyMethodEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         storeStringIfFail: b = ( |
            | 
            b value: 'fisk').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'myUglyMethodEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         theAST <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         enclosingMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         morphs.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         ppLabelMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax ppLabelMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSyntax ppLabelMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppRowMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         appendMorph: m = ( |
            | 
            "('AddtoRow: ' , objectID , m content) printLine."
            m enclosingMorph: self.

            "Morphs may be either added directly using addMorphLast,
             or collected in the list morphs for simultaneously 
             insertion which is supposed to be faster.
             See also isEmpty- and content- comments."
            addMorphLast: m.
            "morphs add: m."
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppRowMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         content = ( |
             s.
            | 
            s: objectID , '<'.
            "both needed when collecting elements in morphs"
            morphsDo: [|:m | s: s , m content].
            morphs do: [|:m | s: s , m content].
            s , '>').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppRowMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             m.
            | 
            m: resend.copy.
            m morphs: list copyRemoveAll.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppRowMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         enclosingMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppRowMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         insertMorphs = ( |
             s <- ''.
            | 
            "('Row:' , content) printLine."
            "addAllMorphs: morphs.
            morphs: list copyRemoveAll."
            "morphs do: [| :m | m insertMorphs ]."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppRowMorph' -> () From: ( | {
         'Comment: Even when collecting the row elements
in morphs before insertion, some elements may
be added incrementally and then setting morphs
to the empty list. I.e. both conditions must
be tested. When adding morphs directly, 
its is enough to test morphCounnt=0.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         isEmpty = ( |
            | 
            (morphCount = 0)
            && (morphs size = 0)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppRowMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'ppRowMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppRowMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         morphs.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         ppUglyEditorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals uglyTextEditorMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> () From: ( |
             {} = 'Comment: Representation notes:

     1. To save space, a number of flags and other information is
	encoded into the single slot \'rawFlags\'.

     2. This object provides a default representation for a morph:
	the rectangle specified by \'rawBox\'. Children such as
	circleMorphs may replace this slot with their own
	representation slots (e.g., \'center\' and \'radius\').

     3. The default resize behavior of a morph is both horizontally
	and vertically rigid (for details, see the resizing category).\x7fModuleInfo: Creator: globals abstractSyntax ppUglyEditorMorph.

CopyDowns:
globals uglyTextEditorMorph. copy 
SlotsToOmit: parent prototype.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (false)'
        
         dirty <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         ppUglyEditorMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax ppUglyEditorMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSyntax ppUglyEditorMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (
abstractSyntax node)'
        
         theAST <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: General morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         propertySheetMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'prototype' From:
             globals frameMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax propertySheetMorph.

CopyDowns:
globals frameMorph. copy 
SlotsToOmit: prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () From: ( | {
         'Category: typeInfPropertyMorph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: title Source: source = ( |
             cancel.
             f.
             ok.
             r.
             sm.
            | 
            f: resend.copy.
            f theSource: source.
            f beShrinkWrap.
            f color: paint named: 'lightGray'.
            r: rowMorph copy beFlexible.
            r color: f color.
            f addMorph: r.
            r addMorph: labelMorph copy label: title.
            f addMorph: 
              ((spacerMorph copy beFlexible) baseMinHeight: 10) color: f color.

            f fieldMorphs: list copyRemoveAll.
            f fieldTypes: list copyRemoveAll.
            source doProp: [| :current. :title. :help. :type. nf |
               nf: f numberField: title 
                     InitialValue: current
                     HelpText: help.
               f fieldMorphs add: nf.
               f addMorphLast: nf.
               f fieldTypes add: type.
             ].

            r: rowMorph copy beFlexible.
            r color: f color.
            f addMorphLast: r.

            ok: (((ui2Button copy target: f) label: 'OK')
                     scriptBlock: [target ok]) color: f color.
            r addMorphLast: ok.

            sm: ((spacerMorph copy beFlexible) baseMinWidth: 5) color: f color.
            r addMorphLast: sm.

            cancel: (((ui2Button copy target: f) label: 'Cancel')
                     scriptBlock: [target doCancel]) color: f color.
            r addMorphLast: cancel.
            ^f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () From: ( | {
         'Category: typeInfPropertyMorph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         doCancel = ( |
            | 
            'cancel button' printLine.
            delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () From: ( | {
         'Category: Examples\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         example = ( |
            | 
            copy: 'Property sheet example' Source: sourceExample).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () From: ( | {
         'Category: State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         fieldMorphs.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () From: ( | {
         'Category: State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         fieldTypes.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () From: ( | {
         'Category: typeInfPropertyMorph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         isBoolean: val = ( |
             s <- ''.
            | 
            val do: [|:c| c > ' ' ifTrue: [s: s , c]].
            "should make into lowercase"
            (val = 'false')
            || (val = 'true')).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () From: ( | {
         'Category: Examples\x7fComment: Creates a property sheet that may
be used to set memory and snapshot defaults,
such as snapshotName, code_size, eden_size, etc.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         memoryAndSnapshotDefaults = ( |
            | 
            copy: 'Memory and snapshot defaults'
              Source: memoryAndSnapshotHandler).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () From: ( | {
         'Category: Examples\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         memoryAndSnapshotHandler = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax propertySheetMorph memoryAndSnapshotHandler.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         defaults = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> 'defaults' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax propertySheetMorph memoryAndSnapshotHandler defaults.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> 'defaults' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         code_size <- 12000000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> 'defaults' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         debug_size <- 3000000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> 'defaults' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         deps_size <- 2200000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> 'defaults' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         eden_size <- 2000000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> 'defaults' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         old_size <- 24000000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> 'defaults' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         pic_size <- 1200000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> 'defaults' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         saveCode <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> 'defaults' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         snapshotName <- 'Snapshot'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> 'defaults' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         surv_size <- 300000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> 'defaults' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         writeSnap <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         doProp: blk = ( |
             a.
            | 
            a: defaults.
            blk value: a snapshotName
                With: 'Snapshot name'
                With: 'The name of the file where a snapshot is saved'
                With: 2.
            blk value: a saveCode asString
                With: 'Save code'
                With: 'If true then sparc code is saved in the snapshot'
                With: 1.
            blk value: a eden_size asString "2"
                With: 'eden_size'
                With: 'Size of eden new space'
                With: 0.
            blk value: a surv_size asString "3"
                With: 'surv_size'
                With: 'Size of survivor new space'
                With: 0.
            blk value: a old_size asString "4"
                With: 'old_size'
                With: 'Size of old space'
                With: 0.
            blk value: a code_size asString
                With: 'code_size'
                With: 'Size of code cash'
                With: 0.
            blk value: a debug_size asString "6"
                With: 'debug_size'
                With: 'Maximum size of debug information'
                With: 0.
            blk value: a deps_size asString
                With: 'eden_size'
                With: 'Size of eden new space'
                With: 0.
            blk value: a pic_size asString
                With: 'pic_size'
                With: 'Size of pic?'
                With: 0.
            blk value: a writeSnap asString "9"
                With: 'Write snapshot'
                With: 'Write snapshot when pushing "OK"'
                With: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'memoryAndSnapshotHandler' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         update: values = ( |
             a.
             d.
             i <- 0.
            | 
            a: _MemoryDefaultSpaceSizes _Clone.
            d: defaults.
            values do: [| :v. v1  |
             (1<i) && [i<9] ifTrue: [ v1: v asInteger ].

            [
              | s |
              s: asMirror at: name.
              s contents: (s contents isReflecteeInteger ifTrue: [v asInteger] False: v) asMirror
            ]. 

             case
               if: [ i = 0 ] Then: [ d snapshotName: v canonicalize. shell snapshotName: v ]
               If: [ i = 1 ] Then: [ d saveCode: v = 'true']
               If: [ i = 2 ] Then: [ d eden_size: v1.  a eden_size: v1 ]
               If: [ i = 3 ] Then: [ d surv_size: v1.  a surv_size: v1]
               If: [ i = 4 ] Then: [ d old_size: v1.   a old_size: v1 ]
               If: [ i = 5 ] Then: [ d code_size: v1.  a code_size: v1 ]
               If: [ i = 6 ] Then: [ d debug_size: v1. a debug_size: v1 ]
               If: [ i = 7 ] Then: [ d deps_size: v1.  a deps_size: v1]
               If: [ i = 8 ] Then: [ d pic_size: v1.   a pic_size: v1]
               If: [ i = 9 ] Then: [ d writeSnap: v = 'true' ].
             i: i + 1.
            ].
            d writeSnap ifTrue: [
               memory garbageCollect.
               _Tenure.
               _MemoryWriteSnapshot: shell snapshotName Compress: () Sizes: a SaveCode: d saveCode.
             ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () From: ( | {
         'Category: typeInfPropertyMorph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         numberField: title InitialValue: current HelpText: txt = ( |
             ed.
             ex.
             f.
             first.
             r.
            | 
            r: rowMorph copy beFlexible.
            r color: color.

            txt size = 0 ifTrue: [
              ex: (labelMorph copy label: title) fontSpec: labelMorph fontSpec copySize: 12.
             ] False: [
              ex: abstractSyntax expanderListMorph
                  copy: title , ' '
                  List: 
                    list copy removeAll add: 
                     abstractSyntax editorTextField "uglyTextField" copy: txt.
              ex frameStyle: flatStyle.
             ].
            r addMorphLast: ex.

            r addMorphLast: ((spacerMorph copy beFlexible) baseMinWidth: 5) color: color.

            ed: abstractSyntax editorTextField "uglyTextField"
                 copy: current  
                 Width: 100 Height: 20.
            f: (frameMorph copy color: color) frameStyle: insetBezelStyle.
            f addMorph: ed.

            r addMorphLast: f.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () From: ( | {
         'Category: typeInfPropertyMorph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         ok = ( |
             fm.
             fms.
             fts.
             il.
             p.
             type.
             val.
             values.
            | 
            values: list copyRemoveAll.
            fms: fieldMorphs copy.
            fts: fieldTypes copy.
            [|:exit|
               fms isEmpty ifTrue: exit.
               fm: fms removeFirst.
               val: value: fm.
               values add: val.
               type: fts removeFirst.
               case 
                  if: [ type = 0 ] Then: [
                       val asIntegerIfFail: ['must be integer' printLine]]
                  If: [ type = 1 ] Then: [
                      (isBoolean: val) ifFalse: ['must be boolean' printLine]]
                  If: [ type = 2 ] Then: ["a text"]
                  Else: ['Unknow type' printLine].
               "('Val: ' , val , ' type: ' , type printString) printLine"
            ] loopExit.

            theSource update: values.
            delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSyntax propertySheetMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () From: ( | {
         'Category: Examples\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         sourceExample = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'sourceExample' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax propertySheetMorph sourceExample.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'sourceExample' -> () From: ( | {
         'Comment: Must be there!\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         doProp: blk = ( |
            | 
            blk value: '0'
                With: 'Minimum limit' 
                With: 'This is the minimum limit\nof the value of the hypothecial switch'
                With: 0.
            blk value: '89'
                With: 'Maximum limit'
                With: ''
                With:  0.
            blk value: 'true'
                With: 'Beep when ok'
                With: 'If true, prints 7 asCharacter\n when ok is pressed'
                With: 1.
            blk value: 'foo.self'
                With: 'File name'
                With: 'A file name may be typed in this field'
                With: 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'sourceExample' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         text1 = ( |
             t.
            | 
            t: ''.
            t: t, 'Should be set to 0 to obtain\n'.
            t: t , 'pure expansion algorithm.\n'.
            t: t , 'Higher number means more precision'.
            t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> 'sourceExample' -> () From: ( | {
         'Comment: Must be there\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         update: values = ( |
             i <- 0.
            | 
            values do: [|:v| 
              (i = 2) && [ v = 'true'] ifTrue: [ 7 asCharacter printLine].
              v printLine.
              i: i + 1
             ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () From: ( | {
         'Category: State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         theSource.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'propertySheetMorph' -> () From: ( | {
         'Category: typeInfPropertyMorph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         value: field = ( |
             s.
            | 
            s: field lastMorph lastMorph contentsString.
            s printLine.
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: General morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         rectiLinearPolygonMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals morph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax rectiLinearPolygonMorph.

CopyDowns:
globals morph. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (true)'
        
         allLeft <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         axList.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         ayList.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (20)'
        
         baseMinHeight <- 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (20)'
        
         baseMinWidth <- 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)'
        
         borderWidth <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         enclosingPMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (true)'
        
         firstInRow <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)'
        
         frameStyle <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)'
        
         llInx <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)'
        
         lrInx <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0@0)'
        
         nextPos <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: General morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         rectiLinearPolygonMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax rectiLinearPolygonMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (true)'
        
         rowIsEmpty <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         rowMorphs <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)'
        
         ulInx <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0@0)'
        
         upperLeft <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)'
        
         urInx <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         xList.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Rectilinear polygon Morph State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         yList.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: State\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         seStack.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Streams\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         selection = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'selection' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax selection.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'selection' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         clear = ( |
            | 
            theAST != abstractSyntax emptyNode ifTrue: [
               theAST doSelection: [| :n| 
                        n position currentColumn setColor: 
                             n position styles frameColor ]
                      Start: subStart
                      End: subEnd.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'selection' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: theAST = ( |
            | 
            copy: theAST Start: nil End: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'selection' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: theAST Start: startAST End: endAST = ( |
             sel.
            | 
            sel: copy.
            sel theAST: theAST.
            sel subStart: startAST.
            sel subEnd: endAST.
            sel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'selection' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         highLight = ( |
            | 
            theAST doSelection: [| :n |
               n position currentColumn setColor: 
                 n position styles selectionColor.
               "n position currentColumn isAtLeft
                 ifTrue: ['At left' printLine]
                 False: ['Not at left' printLine]."
               ]
              Start: subStart
              End: subEnd).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'selection' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         mark: sel = ( |
            | currentSelection: sel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'selection' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'selection' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (
abstractSyntax emptyNode)'
        
         subEnd <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'selection' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (
abstractSyntax emptyNode)'
        
         subStart <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'selection' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (
abstractSyntax emptyNode)'
        
         theAST <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: General morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         sheet = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'prototype' From:
             globals frameMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax sheet.

CopyDowns:
globals frameMorph. copy 
SlotsToOmit: prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Building\x7fComment: Generate a list of of slots:
   a: inx=(value: \'a\' At: inx).
   b: inx=(value: \'b\' At: inx).
   ...
   aa: inx=(value: \'aa\' At: inx).
   ...
Is currently NOT added to the cells.
Also \'aa:\' dont work since \'aa\' cannot
be an index.
Either numbers muts be used for indexing
or \'aa\' must be converted to 27 in value:At:.
or some othere schem must be invented.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         addCellSlots = ( |
             cmx.
             mirr.
             name <- ''.
             s.
             ss.
             ssmirr.
            | 
            s: '(| \n'.
            colSize do: [| :i| 
               name: colName:i.
               s: s , name
                    , ': inx=(value: ' 
                    , '\'' , name , '\''
                    , ' At: inx)'.
               i < (colSize - 1) 
                 ifTrue: [ s: s , '.\n' ]
                 False: [ s: s , '|)' ].
             ].  
            "s printLine."
            ss: s eval.
            cmx: cellMorph copy.
            "Currently celle morphs are NOT added dynamically"
            [mirr: reflect: cmx.
            ssmirr: reflect: ss.
            ssmirr do: [|:a| mirr addSlot: a].].
            cmx).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Building\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         buildCells = ( |
             af.
             cmx.
             s.
            | 
            af: (frameMorph copy beFlexible borderWidth: 0) color: color.
            cmx: addCellSlots.

            rows: vector copySize: rowSize.
            values: vector copySize: rowSize.
            rowSize do: [|:y. r. elm. elmVals| 
               r: rowMorph copy beShrinkWrap borderWidth: 0.
               af addMorphLast: r.
               elm: vector copySize: colSize.
               rows at: y Put: elm.
               elmVals: vector copySize: colSize.
               values at: y Put: elmVals.
               colSize do: [|:x. cm|
                  cm: cmx copy: self At: x At: y.
                  r addMorphLast: cm.
                  elm at: x Put: cm.
                  elmVals at: x Put: 0.
               ]
             ].

            af).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Building\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         buildColumnHeads = ( |
             r.
            | 
            r: rowMorph copy beShrinkWrap borderWidth: 0.
            columnHeads: vector copySize: colSize.
            colSize do: [|:i. ch |  
                ch: columnHeadMorph copy: i Target: self.
                columnHeads at: i Put: ch.
                r addMorphLast: ch.
              ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Building\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         buildRowHeads = ( |
             c.
            | 
            c: columnMorph copy beShrinkWrap borderWidth: 0.
            rowHeads: vector copySize: rowSize.
            rowSize do: [|:i. rh |
                rh: rowHeadMorph copy: i Target: self.
                rowHeads at: i Put: rh.
                c addMorphLast: rh].
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Building\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         buildSheet = ( |
             af.
             c.
             r.
             rm.
             ul.
            | 
            rm: rowMorph copy beShrinkWrap borderWidth: 0.

            ul: buildUpperLeft. 
            r: buildColumnHeads.
            c: buildRowHeads.
            af: buildCells.

            (addMorphLast: 
                     (rm copy addMorphLast: ul) addMorphLast: r)
                 addMorphLast: 
                     ((rm copy addMorphLast: c) addMorphLast: af).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Building\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         buildUpperLeft = ( |
            | 
            "(frameMorph copy beRigid color: styles frameColor)
                  setWidth: rowHeadWidth Height: columnHeadHeight"
            upperLeftMorph copyTarget: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         cellMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'prototype' From:
             globals frameMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( |
             {} = 'Comment: Defines a cell in a sheet.
Each cell has an associated script and value.
Method \'script\' defines the script and is executed 
whenever the sheet is updated.
When a cell is edited, it is actually the body
of \'script\' that is edited.
Method \'value\' returns the value, which by default
is the value of the slot \'myValue\'.
To edit a cell use the middle-button menu on a cell.
To fill in a value use e.g. \"showValue: 20\"
To fill in an expression showing a value as a function
of other cells use e.g. \"showValue: (a:0) + (b:0)\"
To show a morph use e.g.
   init: [\x7fModuleInfo: Creator: globals abstractSyntax sheet cellMorph.

CopyDowns:
globals frameMorph. copy 
SlotsToOmit: prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph cells\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         a: inx = ( |
            | 
            value: 'a' At: inx).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addDroppingMorph: m Event: evt = ( |
             s.
            | 
            s: 'init:[ thisMorph: '
               , m objectIDNumber printString
               , ' as ]\n'
               , 'Update: [ ] '.
            updateScript:
              '(' , s , ')'.
            init: true.
            source update.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph cells\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         b: inx = ( |
            | 
            value: 'b' At: inx).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonPress: button Event: evt = ( |
            | 
            button label = 'Expand' ifTrue: [ expand: evt].
            button label = 'Edit' ifTrue: [ edit: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph cells\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         c: inx = ( |
            | 
            value: 'c' At: inx).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph behavior\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         cell: x At: y = ( |
            | 
            " x is a char 'a', 'b', 'c, ...
              y is an integer 0,1,2,..."
            "((source values at: y) at: (x asByte) - ('a' asByte))."
            ((source rows at: y) at: (x asByte) - ('a' asByte))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fComment: Called from slotOutliner
finishChangingMethod\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         cellChanged: name = ( |
            | 
             ('Changed: ' , name) printString .
            init: true.
            source update).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fComment: Currently this might just be objectOutliner.
The sheet really need to catch when 
finishChaningMethod is called in 
traits slotOutliner.
This could be done by making a child of
slotOutliner and redefining this method.
The idea (as suggested by the Self gurus)
was to to redefine slotOutliner is cellOutliner
and in this redefinition redefine the method.
This dont work! Probably because the code in
objectOutliner calls methods in other outliners
which dont lookup slotOutliner starting in
objectOutliner.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         cellOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'cellOutliner' -> () ToBe: bootstrap addSlotsTo: (
             globals objectOutliner copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'cellOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax sheet cellMorph cellOutliner.

CopyDowns:
globals objectOutliner. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'cellOutliner' -> () From: ( | {
         'Comment: See cellOutliner in cellMorph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         slotOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'cellOutliner' -> 'slotOutliner' -> () ToBe: bootstrap addSlotsTo: (
             globals slotOutliner copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'cellOutliner' -> 'slotOutliner' -> () From: ( |
             {} = 'Comment: Obsolete, not ported over to the pluggable outliners.
-- dmu 5/1\x7fModuleInfo: Creator: globals abstractSyntax sheet cellMorph cellOutliner slotOutliner.

CopyDowns:
globals slotOutliner. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'cellOutliner' -> 'slotOutliner' -> () From: ( | {
         'Comment: See cellOutliner in cellMorph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         finishChangingMethod: rr = ( |
             oo.
            | 
            resend.finishChangingMethod:rr.
            oo: myObjectOutliner.
            nil != oo theSheet ifTrue: [
            'goofy' printLine. oo theSheet update].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: src At: x At: y = ( |
             cm.
            | 
            cm: resend.copy beRigid.
            cm myX: x.
            cm myY: y.
            cm source: src.
            cm setWidth: src rowWidth Height: src columnHeight.
            cm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph cells\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         d: inx = ( |
            | value: 'd' At: inx).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph behavior\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         doEdit: evt = ( |
             f.
             mirr.
             s.
             ue.
            | 
            mirr: reflect: self.
            "s: (mirr slotAt: 'script') value sourceString."
            s:  (methodText copyForMethod:  
                 (mirr slotAt: 'script') value) formatMethodBody asString.
            ue: uglyMethodEditorMorph
                  copyString: s
                  Target: self
                  Accept: textEditAccept
                  Cancel: textEditCancel
                  Style: "ui2" slotOutliner preferences.
            ue resizeToText.
            f: ((frameMorph copy borderWidth: 6)
                color: source styles frameColor)
                 frameStyle: ue bezelStyle.
            f addMorphLast: 
                (((frameMorph copy borderWidth: 3)
                  color: f color)
                  frameStyle: ue insetBezelStyle)
                addMorphLast:
                  labelMorph copy label: 
                   'Script for ' 
                   , ('a' asByte + myX) asCharacter 
                   , ':' ,myY printString.
            f addMorphLast: ue.
            theEditor: f.
            world addMorph: f.
            world moveToFront: f.
            f changed.
            f globalPosition:
                evt sourceHand position - (4@4).
            f changed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph cells\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         e: inx = ( |
            | value: 'e' At: inx).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         edit: evt = ( |
             mirr.
             o.
            | 
            [mirr: reflect: self.
            o: world outlinerForMirror: mirr.
            o theSheet: self.
            o unfold: (mirr at: 'script') Event: evt.
            evt sourceHand attach: o.].
            doEdit: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph behavior\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         editAccept: evt = ( |
            | 
            updateScript: 
             '(' , theEditor lastMorph contentsString , ')'.
            theEditor lastMorph clearPanel.
            init: true.
            source update).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph behavior\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         editCancel: evt = ( |
            | 
            theEditor lastMorph clearPanel.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         expand: evt = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (false)'
        
         init <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell elements for user\x7fComment: Method that may be called in \'script\'.
\'blk1\' is executed when the cell is initialized,
which is when the script is accepted.
\'blk2\' is executed every time the sheet is
updated.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         init: blk1 Update: blk2 = ( |
            | 
            init ifTrue: [blk1 value].
            blk2 value.
            init: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         middleMouseDown: evt = ( |
            | 
            evt sourceHand subscribeUntilAllUp: self.
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph behavior\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         morph: x At: y = ( |
            | 
            (cell: x At: y) thisMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)'
        
         myValue <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)'
        
         myX <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)'
        
         myY <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell elements for user\x7fCategory: Auxillary stuff\x7fComment: Creates a sliderMorph using a sliderTarget.
Just a shorthand to avoid a large expression
in a script.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         newSlider = ( |
            | 
            (((((sliderMorph copy maxValue: 30) 
                 beRigid) width: 30) height: 60)
                  target: (sliderTarget copyTarget: self))
                   selector: 'update:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu color: paint copyRed: 0.900293 Green: 0.855327 Blue: 0.72043.
            menu addButtonTarget: nil Label: 'Expand'.
            menu addButtonTarget: nil Label: 'Edit' .
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            (menu copy retargetButtonsTo: self)
               popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSyntax sheet cellMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph behavior\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         putValue: val At: x At: y = ( |
            | 
            "(source values at: y) at: x Put: val"
            ((source rows at: y) at: x) myValue: val).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         resizePointXX: p = ( |
             b.
             pp.
            | 
            pp: p.
            pp x: globalPosition x + width.
            resend.resizePoint: pp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph behavior\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         resultReporter = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> 'resultReporter' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell elements for user\x7fComment: The script for a cell.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         script = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell elements for user\x7fComment: Method that may be called in \'script\'.
Puts a labelMorph displaying the 
value \'val\' in the cell.
Sets \'myValue:\' to \'val\'.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         showValue: val = ( |
            | 
            thisMorph: valueMorph copy: val.
            "putValue: val At: myY At: myX."
            myValue: val.
            thisMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell elements for user\x7fCategory: Auxillary stuff\x7fComment: A sliderMorph needs an object to call-back to.
This object may be used as a target and its
selector \'value:\' may be used as \'selector\'.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         sliderTarget = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'sliderTarget' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax sheet cellMorph sliderTarget.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'sliderTarget' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         copyTarget: tar = ( |
             x.
            | 
            x: resend.copy.
            x theTarget: tar.
            x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'sliderTarget' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'sliderTarget' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         theTarget.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'sliderTarget' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         update: val = ( |
            | 
            nil != theTarget
             ifTrue: 
               [theTarget myValue: val. val printString printLine.
                theTarget source update
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         source.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph behavior\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         textEditAccept = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'textEditAccept' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax sheet cellMorph textEditAccept.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'textEditAccept' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            "source clearPanel."
            target editAccept: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph behavior\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         textEditCancel = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'textEditCancel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax sheet cellMorph textEditCancel.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'textEditCancel' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            "source clearPanel."
            target editCancel: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         theEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (morph copy setWidth: 0 Height: 0)'
        
         thisMorph <- morph copy setWidth: 0 Height: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph behavior\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         updateScript: str = ( |
             longKey.
             result.
             rr.
             scriptSlot.
             selfMirr.
            | 
            longKey: 'script'.
            rr: str evalObjectBodyInContext: lobby asMirror
              Prefix:  '(| ', longKey, ' = \n'
              Postfix: ' |)'
              ReportingTo: 
                 (resultReporter copy hostMorph: self "editor") "editor: editor".

            rr didItWork ifFalse: [
             'Parsing failed in methodSlot changemethod:... ' printLine.
             ^ self.
            ].
            result: (reflect: rr result).

            selfMirr: reflect: self.
            scriptSlot: selfMirr slotAt: longKey.
            scriptSlot holder changeContentsOfSlotInMeAndDescendantsTo: result first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell elements for user\x7fComment: The value of this cell\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         value = ( |
            | 
            myValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph behavior\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         value: x At: y = ( |
            | 
            (cell: x At: y) value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Cell morph behavior\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         valueMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'valueMorph' -> () ToBe: bootstrap addSlotsTo: (
             globals labelMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'valueMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax sheet cellMorph valueMorph.

CopyDowns:
globals labelMorph. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> 'valueMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         copy: val = ( |
             l.
            | 
            l: labelMorph copy label: val asString.
            l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'cellMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | 
            evt shiftIsDown  ifTrue: [
              ^true
            ] False: [ ^false]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Iterators\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         cellsDo: blk = ( |
            | 
            "There should be a currentSize"
            rowSize do: [|:y |
              colSize do: [|:x|
                  blk value: (rows at: y) at: x
             ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Building\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         colName: i = ( |
             n <- ''.
            | 
            n: ''.
            (i / 26 ) + 1 do: [ n: n , ('a' asByte  + (i % 26)) asCharacter].
            n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Dimensions\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (5)'
        
         colSize <- 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Iterators\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         column: i Do: blk = ( |
            | 
            rowSize do: [|:y |
               blk value: (rows at: y) at: i
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Dimensions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         columnHeadHeight = 25.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         columnHeadMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'columnHeadMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'prototype' From:
             globals frameMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'columnHeadMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax sheet columnHeadMorph.

CopyDowns:
globals frameMorph. copy 
SlotsToOmit: prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'columnHeadMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonPress: button Event: evt = ( |
            | 
            button label = 'Resize' ifTrue: [ resize: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'columnHeadMorph' -> () From: ( | {
         'Category: Row sheet state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)'
        
         columnIndex <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'columnHeadMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         copy: i Target: tar = ( |
             f.
            | 
            f: resend.copy.
            f target: tar.
            f columnIndex: i.
            f beRigid.
            f setWidth: tar rowWidth Height: tar columnHeadHeight.
            f color: tar styles frameColor.
            f addMorph: labelMorph copy label: (tar colName: i).
            f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'columnHeadMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'columnHeadMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         middleMouseDown: evt = ( |
            | 
            evt sourceHand subscribeUntilAllUp: self.
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'columnHeadMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu color: paint copyRed: 0.900293 Green: 0.855327 Blue: 0.72043.
            menu addButtonTarget: nil Label: 'Resize'.
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            (menu copy retargetButtonsTo: self)
               popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'columnHeadMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSyntax sheet columnHeadMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'columnHeadMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         resize: evt = ( |
            | 
            target resizeHandleMorph copyTarget: self Event: evt World: world.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'columnHeadMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         resizePoint: p = ( |
            | 
            resend.resizePoint: (p x) @ (globalPosition y + height).

            target column: columnIndex Do: [|:m | 
                m resizePoint: (p x) @ (m globalPosition y + m height)
              ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'columnHeadMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         resizeSelf: p = ( |
            | 
            resend.resizePoint: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'columnHeadMorph' -> () From: ( | {
         'Category: Row sheet state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Sheet state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         columnHeads.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Dimensions\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (75)'
        
         columnHeight <- 75.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Copy\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            ((((resend.copy 
               beShrinkWrap 
                 leftJustify 
                   borderWidth: 0) 
                     color: styles frameColor)
                       colSize: initialSize)
                        rowSize: initialSize)
                         buildSheet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Examples\x7fComment: This method creates an empty sheet.
Values in the cells may be filled in using
the middle-button menu on a cell to open
a script editor for the cell.
See the object cellMorph, category
    Cell elements for user.
As an example, it is suggested to type-in 
the following scripts:

Cell     script
------------------------------------------
(a:0)   showValue: 12
(a:1)   init: [thisMorph: newSlider]
        Update: [myValue: thisMorph value]
(b:0)   showValue: (a:0) + (a:1)
(b:1)   init: [thisMorph: circleMorph copy]
        Update: [thisMorph radius: (b:0)]\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         example = ( |
             s.
            | 
            s: copy.
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Dimensions\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (5)'
        
         initialSize <- 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Events & update\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: m Event: evt = ( |
            | 
            isInWorld ifTrue: [
               "getSteppedEveryMSecs: 20000.
               startGettingStepped"
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSyntax sheet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         resizeHandleMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'resizeHandleMorph' -> () ToBe: bootstrap addSlotsTo: (
             globals morph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'resizeHandleMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax sheet resizeHandleMorph.

CopyDowns:
globals morph. copy

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'resizeHandleMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: tar Event: evt World: world = ( |
             rm.
            | 
            rm: resend.copy.
            rm color: (paint named: 'red').
            rm setWidth: 8 Height: 8.
            rm target: tar.
            rm oldHResizing: tar hResizing.
            rm oldVResizing: tar vResizing.
            tar beRigid.
            world addMorph: rm.
            world moveToFront: rm.
            evt sourceHand subscribeCursor: rm.
            rm moveTo: evt sourceHand position.
            rm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'resizeHandleMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         leftMouseDown: e = ( |
            | terminateResizingFrom: e sourceHand).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'resizeHandleMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         middleMouseDown: e = ( |
            | terminateResizingFrom: e sourceHand).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'resizeHandleMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         mouseMove: e = ( |
            | moveTo: e cursorPoint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'resizeHandleMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         moveTo: p = ( |
             sz.
            | 
            changed.
            globalPosition: p - (4@4).
            changed.
            target resizePoint: p.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'resizeHandleMorph' -> () From: ( | {
         'Category: resize morph state\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         oldHResizing.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'resizeHandleMorph' -> () From: ( | {
         'Category: resize morph state\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         oldVResizing.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'resizeHandleMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         rightMouseDown: e = ( |
            | terminateResizingFrom: e sourceHand).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'resizeHandleMorph' -> () From: ( | {
         'Category: resize morph state\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'resizeHandleMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         terminateResizingFrom: h = ( |
            | 
            h unsubscribeCursor: self.
            delete.
            target changed.
            target hResizing: oldHResizing.
            target vResizing: oldVResizing.
            target layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Iterators\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         row: i Do: blk = ( |
            | 
            colSize do: [|:x|
               blk value: (rows at: i) at: x
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         rowHeadMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'rowHeadMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'prototype' From:
             globals frameMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'rowHeadMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax sheet rowHeadMorph.

CopyDowns:
globals frameMorph. copy 
SlotsToOmit: prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'rowHeadMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonPress: button Event: evt = ( |
            | 
            button label = 'Resize' ifTrue: [ resize: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'rowHeadMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         copy: i Target: tar = ( |
             f.
            | 
            f: resend.copy.
            f rowIndex: i.
            f target: tar.
            f beRigid.
            f setWidth: tar rowHeadWidth Height: tar columnHeight.
            f color: tar styles frameColor.
            f addMorph: labelMorph copy label: ('0' asByte + i) asCharacter.
            f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'rowHeadMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'rowHeadMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         middleMouseDown: evt = ( |
            | 
            evt sourceHand subscribeUntilAllUp: self.
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'rowHeadMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu color: paint copyRed: 0.900293 Green: 0.855327 Blue: 0.72043.
            menu addButtonTarget: nil Label: 'Resize'.
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            (menu copy retargetButtonsTo: self)
               popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'rowHeadMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSyntax sheet rowHeadMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'rowHeadMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         resize: evt = ( |
            | 
            target resizeHandleMorph copyTarget: self Event: evt World: world.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'rowHeadMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         resizePoint: p = ( |
            | 
            resend.resizePoint: (globalPosition x + width) @ (p y).

            target row: rowIndex Do: [|:m | 
                m resizePoint: (m globalPosition x + m width) @ (p y).
                m layoutChanged.
              ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'rowHeadMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         resizeSelf: p = ( |
            | 
            resend.resizePoint: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'rowHeadMorph' -> () From: ( | {
         'Category: Row sheet state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)'
        
         rowIndex <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'rowHeadMorph' -> () From: ( | {
         'Category: Row sheet state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Dimensions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         rowHeadWidth = 25.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Sheet state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         rowHeads.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Dimensions\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (5)'
        
         rowSize <- 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Dimensions\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (75)\x7fVisibility: private'
        
         rowWidth <- 75.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Sheet state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         rows.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Events & update\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         step = ( |
            | 
            world safelyDo: [update]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Style\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         styles = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Events & update\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         update = ( |
            | 
            colSize do: [| :y |
               rowSize do: [|:x. cm|
                  cm: (rows at: y) at: x.
                  cm removeAllMorphs.
                  cm script.
                  cm addMorph: cm thisMorph.
                ]
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         upperLeftMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'upperLeftMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'prototype' From:
             globals frameMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'upperLeftMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax sheet upperLeftMorph.

CopyDowns:
globals frameMorph. copy 
SlotsToOmit: prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'upperLeftMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonPress: button Event: evt = ( |
            | 
            button label = 'Resize' ifTrue: [ resize: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'upperLeftMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         copyTarget: tar = ( |
             ul.
            | 
            ul: resend.copy.
            ul target:tar.
            ul beRigid.
            ul color: tar styles frameColor.
            ul setWidth: tar rowHeadWidth Height: tar columnHeadHeight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'upperLeftMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'upperLeftMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         middleMouseDown: evt = ( |
            | 
            evt sourceHand subscribeUntilAllUp: self.
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'upperLeftMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu color: paint copyRed: 0.900293 Green: 0.855327 Blue: 0.72043.
            menu addButtonTarget: nil Label: 'Resize'.
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            (menu copy retargetButtonsTo: self)
               popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'upperLeftMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSyntax sheet upperLeftMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'upperLeftMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         resize: evt = ( |
            | 
            target resizeHandleMorph copyTarget: self Event: evt World: world.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'upperLeftMorph' -> () From: ( | {
         'Category: Events & menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         resizePoint: p = ( |
             sx.
             sy.
            | 
            resend.resizePoint: p .
            sx: (p x - globalPosition x) asFloat / width asFloat.
            sy: (p y - globalPosition y) asFloat / height asFloat.
            target rowHeads do: [|:m|
               m resizeSelf: 
                 (p x) 
                  @ (m globalPosition y + (m height asFloat * sy) asInteger)
              ].
            target columnHeads do: [|:m|
               m resizeSelf: 
                 (m globalPosition x + (m width asFloat * sx) asInteger)
                  @  (p y)
               ].
            target cellsDo: [| :m | 
                m resizePoint: 
                  m globalPosition 
                    + ((m width asFloat * sx) asInteger 
                       @ (m height asFloat * sy) asInteger)
              ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> 'upperLeftMorph' -> () From: ( | {
         'Category: UpperLeft morph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sheet' -> () From: ( | {
         'Category: Sheet state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         values.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         asIsPP <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         currentSelection.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (
abstractSyntax ppFrameMorph)\x7fVisibility: private'
        
         endFrame <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppFrameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isSelecting <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (acceptCancelPanel copy)\x7fVisibility: private'
        
         panel <- acceptCancelPanel copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         structureEditorMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax structureEditorMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (traits abstractSyntax structureEditorMorph)'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         prototype = ( |
            | abstractSyntax ppFrameMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (
abstractSyntax ppFrameMorph copy)\x7fVisibility: private'
        
         startFrame <- 
abstractSyntax ppFrameMorph copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         theTypeInfMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'Comment: Should be eliminated;
still used in typeInfLabelMorph
buttonPress:Event for \'revert\'\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         theTypeInfPath.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: State\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         structureEditorStack <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Streams\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         structureEditorStream = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorStream' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'col' From:
             bootstrap remove: 'parent' From:
             globals abstractSyntax pPStream copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax structureEditorStream.

CopyDowns:
globals abstractSyntax pPStream. copy 
SlotsToOmit: col parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)'
        
         col <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (list copy)'
        
         colStack <- list copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (abstractSyntax ppFrameMorph copy)'
        
         currentColumn.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: morph types\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (abstractSyntax ppFrameMorph)'
        
         frameMorphType <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppFrameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: morph types\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (abstractSyntax ppLabelMorph)'
        
         labelMorphType <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppLabelMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         structureEditorStream = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax structureEditorStream.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         pred.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: morph types\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (abstractSyntax ppRowMorph)'
        
         rowMorphType <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'ppRowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: morph types\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (abstractSyntax structureEditorMorph)'
        
         structureEditorMorphType <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addMorph: m = ( |
             dist.
             mB.
             mD.
             newPos.
             oldPos.
             y.
            | 
            "debug: 'addMorph: ' M: m. debug: 'To:' M: self."
            enforceLayout: m.
            mB: m bounds.
            mD: m position - mB origin.
            "m changed."
            newPos: (globalPosition + nextPos + mD).
            rowIsEmpty ifTrue: [ 
               newPos: newPos  + (borderWidth @ borderWidth).
               rowIsEmpty: false
             ] False: [ 
               newPos: newPos + (0 @ borderWidth).
               (m morphTypeName = 'labelMorph') 
               || [m morphTypeName = 'ppLabelMorph'] ifTrue: [
                 dist: (((yList at: lrInx) - (yList at: urInx)) - m height) / 2.
                 dist: dist - borderWidth.
                 dist != 0 ifTrue: [
                    newPos: newPos + (0 @ dist).
                    m position: newPos 
                ]].
              ].
            m position: newPos.
            "m changed."
            adjustMorph: m.
            "m changed."
            "adjustMorph: m."
            resend.addMorph:m.
            "m changed."
            rowMorphs add: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addMorphLast: m = ( |
            | addMorph:m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Polygon Morph Behavior\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addPoint: p = ( |
            | 
            xList: xList copyAddLast: p x.
            yList: yList copyAddLast: p y.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         adjustMorph: sub = ( |
             mb.
             md.
             y.
            | 
            "debug: 'Adjust' M: self. debug: 'To: ' M: sub."
            "Often position is topleft corner, i.e.
             bounds = position + (width @ height)"
            mb: sub bounds. 
            md: sub position - mb origin. 
            nextPos: (sub lowerRight "mb right") @ (nextPos y).
            "redefine points ur, lr, ll"
            xList at: urInx Put: nextPos x + borderWidth. 
            yList at: urInx Put: nextPos y.
            xList at: lrInx Put: nextPos x + borderWidth. 
            y: mb bottom + borderWidth. 
            rowMorphs do: [|:m| y: y max: m bounds bottom + borderWidth ].
            yList at: lrInx Put: y.
            yList at: llInx Put: y.
            changed.
            position: position. "Update rawBox, bounds, etc."
            "debug: 'AfterAdjust:' M: self."
            "changed."
            nil != enclosingPMorph ifTrue: [ 
                enclosingPMorph adjustMorph: self 
                       NextPos: (xList at: urInx) @ (yList at: urInx).
                enclosingPMorph rowIsEmpty: false
               ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         adjustMorph: sub NextPos: nP = ( |
            | 
            adjustMorph: sub.
            nextPos: "nP"
               ((xList at: urInx) - borderWidth) @ (yList at: urInx)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         align = ( |
             yy <- 0.
            | 
            "debug: 'Align:' M: self."
            rowMorphs do: [| :m | yy: yy max: m bounds bottom].
            nil != enclosingPMorph  ifTrue: [ 
                someEncloserNotFirstInRow ifTrue: [
                   "debug: 'Not first' M: self. "
                   yy: enclosingPMorph align
              ]].
            (yy "- position y") > ((yList at: llInx) "- position y") ifTrue: [
               yList at: llInx Put: yy - position y .
               yList at: lrInx Put: yy - position y .
               position: position.
             ].
            "debug: 'AfterAlign' M: self."
            (yList at: lrInx) - borderWidth "- position y").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         allBorder = ( |
            | 
            (nil != enclosingPMorph 
               ifTrue: [ enclosingPMorph borderWidth + enclosingPMorph allBorder]
               False: [ 0 ]
            )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         baseBounds = ( |
            | rawBox).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         baseDrawBezelStyleOn: c = ( |
             bot.
             col.
             ip1.
             ip2.
             left.
             p1.
             p2.
             p3.
             pred.
             right.
             shades.
             size.
             top.
             w.
            | 
            left:0 . right: 1. top: 2 . bot: 3.
            pred: left. "just a guess should be calculated"
            w: borderWidth.
            shades: shadesForColor.

            size: axList size.
            size do: [| :i | "draw border from p1 to p2" 
             p1: (axList at: i) @ (ayList at: i).
             p2: (axList at: (i + 1) % size)  @ (ayList at: (i + 1) % size).
             p3: (axList at: (i + 2) % size)  @ (ayList at: (i + 2) % size).

             p1 y = p2 y
              ifTrue: [ "horisontal line"
                p1 x < p2 x 
                  ifTrue: [ "A top line"
                    ip1: pred = left ifTrue: [(p1 x + w) @ (p1 y + w) ]
                                     False:  [(p1 x - w) @ (p1 y + w) ].
                    ip2: p2 y < p3 y ifTrue: [(p2 x - w) @ (p2 y + w) ]
                                     False:  [(p2 x + w) @ (p2 y + w) ].
                    col: shades mediumHilight.
                    pred: top.
                  ] False: [ "'A bottom line'"
                    ip1: pred = left ifTrue: [(p1 x + w) @ (p1 y - w) ]
                                     False:  [(p1 x - w) @ (p1 y - w) ].
                    ip2: p2 y < p3 y ifTrue: [(p2 x - w) @ (p2 y - w) ]
                                     False:  [(p2 x + w) @ (p2 y - w) ].
                    col: shades mediumShadow.
                    pred: bot.
                  ].
              ] False: [ "vertical line"
                 p1 y > p2 y 
                   ifTrue: [ "A left line"
                      ip1: pred = top ifTrue: [(p1 x + w) @ (p1 y + w)]
                                      False:  [(p1 x + w) @ (p1 y - w)].
                      ip2: p2 x < p3 x ifTrue: [(p2 x + w) @ (p2 y + w)]
                                       False:  [(p2 x + w) @ (p2 y - w)].
                      col: shades lightHilight.
                      pred: left.
                    ] False: [ "A right line"
                      ip1: pred = top ifTrue: [(p1 x - w) @ (p1 y + w)]
                                      False:  [(p1 x - w) @ (p1 y - w)].
                      ip2: p2 x < p3 x ifTrue: [(p2 x - w) @ (p2 y + w)]
                                       False:  [(p2 x - w) @ (p2 y - w)].
                      col: shades darkShadow.
                      pred: right.
                    ].
              ].
              drawBorder: c From: p1 To: p2 To: ip2 To: ip1 Color: col.
             ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         baseDrawOn: c = ( |
            | 
            axList: vector copySize: xList size FillingWith: 0.
            ayList: vector copySize: yList size FillingWith: 0.

            axList size do: [| :i |
              axList at: i Put: (position x "- owner position x") + (xList at: i).
              ayList at: i Put: (position y "- owner position y") + (yList at: i).
              ].
            c fillPolygonXs: axList copy Ys: ayList copy Color: rawColor.

            frameStyle =  bezelStyle ifTrue: [ ^baseDrawBezelStyleOn: c].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: styles\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         beShrinkWrap = ( |
            | "currently ignored" self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: styles\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         bezelStyle = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         bottom = ( |
             y <- 0.
            | 
            rowMorphs do: [| :m| y: y max: m bounds bottom] .
            y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         cachedShades <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         computePolygonMorphBounds = ( |
             x1.
             x2.
             y1.
             y2.
            | 
            x1: xList at: 0.
            y1: yList at: 0.
            x2: x1.
            y2: y1.
            xList size - 1 do: [| :i |
              x1: x1 min: xList at: i+1.
              y1: y1 min: yList at: i+1.
              x2: x2 max: xList at: i+1.
              y2: y2 max: yList at: i+1   
             ].
            upperLeft: (x1 @ y1).
            (0 @ 0) ## ((x2 - x1) @ (y2 - y1))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         content = ( |
             s.
            | 
            s: 'Recti: '.
            morphsDo: [|:m | s: s , m content].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         copy = ( |
            | 
            copy: 0 @ 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         copy: startPoint = ( |
             pm.
            | 
            pm: copyForAdding: startPoint.
            pm addPoint: (startPoint x + minWidth) @ startPoint y.
            pm addPoint: (startPoint x + minWidth) @ (startPoint y + minHeight).
            pm addPoint: (startPoint x )           @ (startPoint y + minHeight).
            pm nextPos: (startPoint x) @ (startPoint y).
            pm ulInx: 0. pm urInx: 1. pm lrInx: 2. pm llInx: 3.
            pm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         copyAddSub = ( |
             oldNextPos.
             pm.
            | 
            pm: copy: nextPos.
            pm rowIsEmpty: true.
            pm enclosingPMorph: self.
            pm firstInRow: rowIsEmpty.
            pm allLeft: rowIsEmpty && [ isAllLeft].
            oldNextPos: nextPos.
            addMorph: pm.
            pm changed.
            pm position:  pm position - oldNextPos.
            pm changed.
            nextPos: (oldNextPos x + pm bounds width) @ oldNextPos y.
            adjustMorph: pm.
            pm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         copyForAdding: startPoint = ( |
             pm.
            | 
            pm: resend.copy.
            pm initialize.
            pm xList: vector copy.
            pm yList: vector copy.
            pm addPoint: startPoint.
            pm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fCategory: Debug\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         debug: t M: m = ( |
            | 
            debugOn ifTrue: [('\n' , t , ' ') print.
            m morphTypeName print.
            (' ' ,m objectID , ' ') print.
            m morphTypeName = 'labelMorph' ifTrue: [
              ( ' "', m label , '" ') print
             ].
            ' GP: ' print. m globalPosition print.
            ' Pos: ' print. m position print.
            ' Bounds:' print. m bounds print.
            m morphTypeName = 'rectiLinearPolygonMorph' ifTrue: [
               '\nur=' print. m urInx print. ' lr=' print. m lrInx print. 
               ' ll=' print. m llInx print.  ' ul=' print. m ulInx printLine. 
              m xList do:[|:x| (x printString , ' ') print ]. ' ' printLine.
              m yList do: [|:y| (y printString , ' ') print ]. ' ' printLine.
              'NextPos=' print. nextPos print. ', BorderWidth=' print. borderWidth printLine.
            ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fCategory: Debug\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         debugOn <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Polygon Morph Behavior\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         delete: n From: inx = ( |
             last.
             xl.
             yl.
            | 
            last: xList size - 1.
            last - (inx + (n - 1))
              do: [| :i |
               xList at: inx + i Put: xList at: inx + n + i.
               yList at: inx + i Put: yList at: inx + n + i.
              ].
            xl: vector copySize: xList size - 4.
            yl: vector copySize: yList size - 4.
            xl size do: [| :i |
               xl at: i Put: xList at: i.
               yl at: i Put: yList at: i.
             ].
            xList: xl.
            yList: yl).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fCategory: Newline\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         doNewline = ( |
             blpx.
             blpy.
             llP.
             lpx.
             lpy.
             lrP.
             x.
             xl.
             xpl.
             y.
             yl.
             ypl.
             yy.
            | 
            "debug: 'NewlineBefore' M: self."
            llP: (xList at: llInx) @ (yList at: llInx).
            lrP: (xList at: lrInx) @ (yList at: lrInx).
            insert: 4 After: lrInx.
            x: ((lrP x - baseMinWidth) 
                    max: (baseMinWidth + (2 * allBorder)))
                       max: llP x. 
            xList at: lrInx + 1 Put: x. yList at: lrInx + 1 Put: lrP y.
            y: lrP y + baseMinHeight.
            xList at: lrInx + 2 Put: x.         yList at: lrInx + 2 Put: y.
            xList at: lrInx + 3 Put: allBorder. yList at: lrInx + 3 Put: y.
            xList at: lrInx + 4 Put: allBorder. yList at: lrInx + 4 Put: lrP y.
            urInx: lrInx + 1 . lrInx: urInx + 1. 
            llInx: lrInx + 1. ulInx: llInx + 1.
            nextPos: (xList at: ulInx) @ (yList at: ulInx).
            rowIsEmpty: true. firstInRow: true. allLeft: true.
            position: position.
            "debug: 'NewlineAfter' M: self."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         drawBorder: c From: p1 To: p2 To: ip2 To: ip1 Color: col = ( |
             xList.
             yList.
            | 
            xList: vector copySize: 4 FillingWith: 0.
            yList: vector copySize: 4 FillingWith: 0.

            xList at: 0 Put: p1 x.     yList at: 0 Put: p1 y.
            xList at: 1 Put: p2 x.     yList at: 1 Put: p2 y.
            xList at: 2 Put: ip2 x.    yList at: 2 Put: ip2 y.
            xList at: 3 Put: ip1 x.    yList at: 3 Put: ip1 y.
            c fillPolygonXs: xList Ys: yList Color: col).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         drawBottomBorder: c From: p1 To: p2 Color: col = ( |
             w.
             xList.
             yList.
            | 
            xList: vector copySize: 4 FillingWith: 0.
            yList: vector copySize: 4 FillingWith: 0.
            w: borderWidth.

            xList at: 0 Put: p1 x.     yList at: 0 Put: p1 y.
            xList at: 1 Put: p2 x.     yList at: 1 Put: p2 y.
            xList at: 2 Put: p2 x + w. yList at: 2 Put: p2 y - w.
            xList at: 3 Put: p1 x - w. yList at: 3 Put: p1 y - w.
            c fillPolygonXs: xList Ys: yList Color: col).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         drawLeftBorder: c From: p1 To: p2 Color: col = ( |
             w.
             xList.
             yList.
            | 
            xList: vector copySize: 4 FillingWith: 0.
            yList: vector copySize: 4 FillingWith: 0.
            w: borderWidth.

            xList at: 0 Put: p1 x.      yList at: 0 Put: p1 y.
            xList at: 1 Put: p2 x.      yList at: 1 Put: p2 y.
            xList at: 2 Put: p2 x + w.  yList at: 2 Put: p2 y + w.
            xList at: 3 Put: p1 x + w.  yList at: 3 Put: p1 y - w.
            c fillPolygonXs: xList Ys: yList Color: col).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         drawRightBorder: c From: p1 To: p2 Color: col = ( |
             w.
             xList.
             yList.
            | 
            xList: vector copySize: 4 FillingWith: 0.
            yList: vector copySize: 4 FillingWith: 0.
            w: borderWidth.

            xList at: 0 Put: p1 x.      yList at: 0 Put: p1 y.
            xList at: 1 Put: p2 x.      yList at: 1 Put: p2 y.
            xList at: 2 Put: p2 x - w.  yList at: 2 Put: p2 y - w.
            xList at: 3 Put: p1 x - w.  yList at: 3 Put: p1 y + w.
            c fillPolygonXs: xList Ys: yList Color: col).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         drawTopBorder: c From: p1 To: p2 Color: col = ( |
             w.
             xList.
             yList.
            | 
            xList: vector copySize: 4 FillingWith: 0.
            yList: vector copySize: 4 FillingWith: 0.
            w: borderWidth.

            xList at: 0 Put: p1 x.      yList at: 0 Put: p1 y.
            xList at: 1 Put: p2 x.      yList at: 1 Put: p2 y.
            xList at: 2 Put: p2 x - w.  yList at: 2 Put: p2 y + w.
            xList at: 3 Put: p1 x + w.  yList at: 3 Put: p2 y + w.
            c fillPolygonXs: xList Ys: yList Color: col "paint named: 'red'").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         endFrame = ( |
            | 
            rowIsEmpty ifTrue: [
              delete: 4 From: urInx.
              urInx: (urInx - 4) % xList size.
              lrInx: urInx + 1 . llInx: lrInx + 1. ulInx: llInx + 1.
              position: position.
              nextPos: (xList at: urInx) @ (yList at: urInx).
              nil != enclosingPMorph ifTrue: [ enclosingPMorph layoutChange ].
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         enforceLayout: m = ( |
             oldPos.
             root.
            | 
            root: m root.
            root isInWorld ifFalse: [
              oldPos: root position.
              root position: (0@0).
              desktop w addMorph: root.
              desktop w removeMorph: root.
              root position: oldPos.
             ].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Example\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         example1 = ( |
             pm.
            | 
            pm: copyForAdding: 50  @ 0.
            pm addPoint: 200 @ 0.
            pm addPoint: 200 @ 150.
            pm addPoint: 50  @ 150.
            pm addPoint: 50  @ 200.
            pm addPoint: 0   @ 200.
            pm addPoint: 0   @ 50.
            pm addPoint: 50  @ 50.
            pm nextPos: (pm xList at: 0) @ (pm yList at: 0).
                 "((pm xList at: 0) + pm borderWidth)
               @ ((pm yList at: 0) + pm borderWidth)."
            pm borderWidth: 5.
            pm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Example\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         example2 = ( |
             pm.
            | 
            pm: (copy: 50@50) borderWidth:4.
            pm addMorph:labelMorph copy label: 'hest').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Example\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         example3 = ( |
             pm.
             ps.
            | 
            pm: (copy: 20@20) borderWidth:4.
            pm addMorph:labelMorph copy label: 'hest'.
            pm newLine.
            "ps: pm copyAddSub."
            pm addMorph: labelMorph copy label: 'fisk & snort'.
            pm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Example\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         example4 = ( |
             pm.
             ps.
            | 
            pm: (copy: 0 @ 0) borderWidth:4.
            pm addMorph: labelMorph copy label: 'unicorn: hest + '.
            pm addMorph: labelMorph copy label: 'wings'.
            pm addMorph: labelMorph copy label: ' * air.'.
            pm layoutChange.
            pm newLine.
            ps: pm copyAddSub.
            ps addMorph: labelMorph copy label: 'a < b '.
            ps layoutChange.
            pm addMorph: labelMorph copy label: 'ifTrue:'.
            pm layoutChange.
            ps: pm copyAddSub.
            ps addMorph: labelMorph copy label: ' [ '.
            ps newLine.
            ps addMorph: labelMorph copy label: '        food: pork dead cooked.'.
            ps newLine.
            ps addMorph: labelMorph copy label: ']'.
            ps layoutChange.
            pm addMorph: labelMorph copy label: ' IfFalse: '.
            ps: pm copyAddSub.
            ps addMorph: labelMorph copy label: ' [ pizza makeBig ].'.
            pm newLine.
            pm addMorph: labelMorph copy label: 'hest fisk'.
            pm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Example\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         example5 = ( |
             pm.
             rm.
            | 
            pm: copy borderWidth: 4.
            rm: rowMorph copy beShrinkWrap borderWidth: 0.
            pm addMorph: rm.
            rm addMorph: labelMorph copy label: 'hest'.
            "enforceLayout: pm."
            "pm layoutChange."
            pm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Example\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         example6 = ( |
             pm.
             pm1.
             pm2.
            | 
            pm: (copy: 0@0) borderWidth: 4.
            pm  addMorph: labelMorph copy label: '('.

            pm1: pm copyAddSub borderWidth: 4.
            pm2: pm1 copyAddSub borderWidth: 4.
            pm2 addMorph: labelMorph copy label: 'fisk'.
            pm2 layoutChange.
            pm1 addMorph: labelMorph copy label: ' '.
            pm1 addMorph: labelMorph copy label: 'hest'.
            pm1 layoutChange.
            pm addMorphLast: labelMorph copy label: ')'.
            pm layoutChange.
            pm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Example\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         example7 = ( |
             pm.
             ps.
             psa.
            | 
            pm: (copy: 0 @ 0) borderWidth:4.
            pm addMorph: labelMorph copy label: '('.
            psa: pm copyAddSub.
            ps: psa copyAddSub.
            ps newLine.
            ps addMorph: labelMorph copy label: '   '.
            ps addMorph: labelMorph copy label: 'foo'.
            ps addMorph: labelMorph copy label: '.'.
            psa newLine.
            ps: psa copyAddSub.
            ps addMorph: labelMorph copy label: '   '.
            ps addMorph: labelMorph copy label: 'go'.
            ps addMorph: labelMorph copy label: '.'.
            pm layoutChange.
            pm addMorph: labelMorph copy label: ')'.
            pm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Example\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         example8 = ( |
             pm.
             ps.
             ps0.
             psa.
            | 
            psa: (copy: 0 @ 0) borderWidth:8.
            psa addMorph: labelMorph copy label: '('.
            pm: psa copyAddSub borderWidth: 0.
            ps0: pm copyAddSub borderWidth: 8.
            ps: ps0 copyAddSub borderWidth: 8.
            ps addMorph: labelMorph copy label: ' '.
            ps layoutChange.
            ps newLine. " NO good if rest is not here" 
            ps addMorph: labelMorph copy label: 'foo'.
            ps layoutChange.
            ps0 addMorph: labelMorph copy label: 'bar'.
            ps0 layoutChange.
            pm addMorph: labelMorph copy label: '. '.
            pm layoutChange.
            pm newLine.
            ps: pm copyAddSub borderWidth: 8.
            ps addMorph: labelMorph copy label: 'go'.
            ps layoutChange.
            psa addMorph: labelMorph copy label: ')'.
            psa).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Example\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         example9 = ( |
             pm.
             ps.
             ps0.
            | 
            pm: (copy: 0 @ 0) borderWidth:4.
            pm addMorph: labelMorph copy label: 'ifTrue:'.
            ps0: pm copyAddSub.
            ps: ps0 copyAddSub.
            ps addMorph: labelMorph copy label: ' [ '.
            ps newLine.
            ps addMorph: labelMorph copy label: '        food: pork dead cooked.'.
            ps newLine.
            ps addMorph: labelMorph copy label: ']'.
            ps layoutChange.
            "pm addMorph: labelMorph copy label: ' IfFalse: '.
            ps: pm copyAddSub.
            ps addMorph: labelMorph copy label: ' [ pizza makeBig ].'.
            pm newLine."
            pm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: styles\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         flatStyle = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            removeAllMorphs.
            rowMorphs: list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Polygon Morph Behavior\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         insert: n After: inx = ( |
             last.
            | 
            n do: [ addPoint: 0@0 ].
            last: xList size - 1.
            "shift elements up"
            xList size - (inx +1 + n)
             do: [| :i | 
              xList at:  last - i Put: xList at: (last - 4) - i.
              yList at:  last - i Put: yList at: (last - 4) - i.
             ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: styles\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         insetBezelStyle = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         isAllLeft = ( |
            | 
            allLeft ifTrue: [ ^true].
            nil != enclosingPMorph 
                ifTrue: [ enclosingPMorph isAllLeft ].
            ^false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         layoutChange = ( |
             lrx <- 0.
             lry <- 0.
             x <- 0.
             y <- 0.
            | "debug: 'LayoutChange: ' M: self."
            lry: (yList at: urInx) + borderWidth.
            x: (xList at: ulInx) + borderWidth. "dont go left of uppelLeft"
            "y: yList at: lrInx."
            "enforceLayout: self."
            rowMorphs do: [| :m. mx. my. | 
               "debug: 'Sub morph:' M: m."
               mx: m lowerRight "bounds right" + borderWidth.
               my: m bounds bottom "+ borderWidth".
               "debugOn ifTrue: [
                 'Scan: ' print. lry print. ' ' print. my print. ' ' print. mx printLine ]."
               lry < my ifTrue: [" m is in current row"
                   x: x max: mx.
                   y: y max: my + borderWidth.
                ].
             ].
            "debugOn ifTrue: [('New X/Y: ' , x printString , ',',  y printString ) printLine]."
            xList at: urInx Put: x.
            xList at: lrInx Put: x.
            yList at: lrInx Put: y.
            yList at: llInx Put: y.
            nextPos: ((xList at: urInx) - borderWidth) @ (yList at: urInx).
            position: position.
            "layoutChanged."
            nil != enclosingPMorph ifTrue: [ enclosingPMorph layoutChange]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: styles\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         leftJustify = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         lowerRight = ( |
            | 
            bounds left + (xList at: urInx)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         morphTypeName = 'rectiLinearPolygonMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fCategory: Newline\x7fComment: Add an extra \'row\' to this morph.
The left border of the row is at x=0
of the owner of this morph.
Could be generalized to e.g.:
  newLine: n
where
 n > 0 then left border x = n
 n < 0 then left border x = lr x - x
where lr is the lower right corner ofthe previous row.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         newLine = ( |
            | 
            align. "debugOn: false."
            shiftUpDown: 0.
            doNewline.
            nil != enclosingPMorph ifTrue: [
               enclosingPMorph newLine: 0 
                                 Right: position x + (xList at: urInx)
                                Bottom: position y + (yList at: lrInx).
                     "(xList at: urInx) @ (yList at: urInx)."
               enclosingPMorph rowIsEmpty: true.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fCategory: Newline\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         newLine: nP Right: r Bottom: b = ( |
             sb.
             yy.
            | "'Newl:' print. nP print. ',' print. borderWidth printLine."
            sb: nP + borderWidth.
            doNewline.
            xList at: urInx Put: r + borderWidth.
            xList at: lrInx Put: r + borderWidth.
            yList at: lrInx Put: b + borderWidth.
            yList at: llInx Put: b + borderWidth.
            position: position.
            nil != enclosingPMorph ifTrue: [
               sb: nP + borderWidth.
               enclosingPMorph newLine: sb
                                 Right: position x + (xList at: urInx)
                                Bottom: position y + (yList at: lrInx).
               enclosingPMorph rowIsEmpty: true.
             ].
            nextPos:  "nP"
                 (xList at: urInx) @ (yList at: urInx)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         numberOfSides = ( |
            | xList size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'polygonMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         position: p = ( |
             a.
             pos.
            | 
            "      o---------------.   o = (0@0)
                   .               .
                   .  b    a=======|   b = upperleft
                   .       |       |
                   .  =====|       |
                   .  |            |
                   |===============q   q = (w@h)
               pos = b ## (q - b)
               globalPosition = globalPosition of o
            "
            a: (xList at: 0) @ (yList at: 0).
            pos: computePolygonMorphBounds.
            "'Pos:' print. p printLine. upperLeft printLine.
            pos size printLine. a printLine."
            rawBox: p ## ((upperLeft + pos size)).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeRect: r = ( |
            | 
            "Resize the receiver's base to fit into the given rectangle as well
             as possible. If the receiver cannot fill the rectangle, it should
             nestle into the upper-left corner."

            "Note: this method resizes the receiver regardless of its
             resizability settings. The sender is responsible for only
             sending this when appropriate. Even rigid morphs can be
             forcibly resized using this method."

            rawBox: r.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         shadesForColor = ( |
             c.
            | 
            c: color.
            cachedShades at: c IfAbsent: [| newShades |
                newShades: shadesRecord copy.
                newShades darkShadow:    (c copyDarkerBy: 0.2).
                newShades mediumShadow:  (c copyDarkerBy: 0.1).
                newShades mediumHilight: (c copyBrighterBy: 0.1).
                newShades lightHilight:  (c copyBrighterBy: 0.2).
                cachedShades at: c Put: newShades.
                newShades]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         shadesRecord <- bootstrap stub -> 'traits' -> 'frameMorph' -> 'shadesRecord' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fCategory: Newline\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         shiftUpDown: n = ( |
             nn.
            | 
            nn: n + borderWidth.
            allLeft
              ifTrue: [
                yList at: lrInx Put: (yList at: lrInx) - (2 * nn).
                yList at: llInx Put: (yList at: llInx) - (2 * nn).
                position: position.
                nil != enclosingPMorph
                    ifTrue: [ enclosingPMorph shiftUpDown: nn ].
                nn: 0.
              ] False: [
                nn: 0.
                nil != enclosingPMorph
                    ifTrue: [ nn: enclosingPMorph shiftUpDown: nn ].
                yList at: lrInx Put: (yList at: lrInx) + (2 * nn).
                yList at: llInx Put: (yList at: llInx) + (2 * nn).
                position: position.
                nn: nn + borderWidth.
              ].
            nn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         someEncloserNotFirstInRow = ( |
            | 
            firstInRow ifFalse: [ ^true].
            nil != enclosingPMorph ifTrue: [
               ^enclosingPMorph someEncloserNotFirstInRow
            ].
            ^false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         subBorders = ( |
            | 
            borderWidth * 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: Drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         submorphVisible: m = ( |
            | 
            "Return true if the given submorph of the receiver is
             visible. This may be true if the receiver has morphs
             sticking out. If the receiver is filled, the submorph
             is visible if its color is different. If the receiver
             is unfilled, the submorph is visible if it is visible
             on top of the frame's owner, since the color of the
             owner shows through the inside of the frame."

            noStickOuts ifFalse: [ ^true ].
            (filled && [color = m color]) ifTrue: [ ^false ].
            owner submorphVisible: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: styles\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         topJustify = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         vertexOffsets = ( |
            | 
            list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         vertexOffsets: vo = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         xAt: inx = ( |
            | xList at: inx).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         xxbaseContainsPt: p = ( |
            | 
            "True if this morph's base contains the given point. The point
             is in the coordinates of the morph that owns this morph."

            "baseBounds includes: p"
            includes: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         xxmiddleMouseDown: evt = ( |
            | 
            (includes: evt cursorPoint)
               ifTrue: ['Inside' printLine]
               False: ['Not inside' printLine]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         xxsubListsBelow: p Do: blk = ( |
             i0 <- 0.
             i1.
             in.
             or.
             size.
            | 
            "or: globalPosition origin."
            size: yList size.
            " find pq where  pq y < p y "
            i0: 0.
            [ p y > (yList at: i0) ] whileTrue: [
               i0: (i0 + 1) % size.
               i0 = 0 ifTrue: ["whole poly above p" ^self]
              ].
            'i0: ' print. i0 printLine.
             i1: i0.
            [true] whileTrue: [
             "Find p1 where p y < p1 y "
             [ p y > (yList at: i1) ] whileTrue: [':' print.
             p y printLine.
            (yList at: i1) printLine.
                 i1: (i1 + 1) % size.
                 i0 = i1 ifTrue: [^false]
               ].
            'i1:' print. i1 printLine.
             "pi1 pred above p - pi1 below p"

             "Find pn where  pn succ y < p y "
             in: i1.
             [ (yList at: (in+1)%size) > p y ] whileTrue: [';' print.
            p y printLine.
            ((in+1)%size) printLine.
            (yList at: (in+1)%size) printLine.
               in: (in + 1 ) % size.
               in = i0 ifTrue: [^false]
               ].
             blk value: ((xList at: (i1-1)% size) @ (yList at: (i1-1)%size))
                 With:  ((xList at: i1) @ (yList at: i1))
                 With:  ((xList at: in) @ (yList at: in))
                 With:  ((xList at: (in+1)% size) @ (yList at: (in+1)%size)).
             i1: (in + 1) % size.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         xxxincludes: pt = ( |
             p.
             vp1.
             vp2.
            | 
            p: pt - globalPosition.
            'Point: ' print. pt print. ',' print. p printLine.
            'Bounds: ' print. baseBounds printLine.
            'yList: ' print. yList size print. ':' print. 
            yList do: [|:e| e print. ',' print ]. '' printLine.
            (baseBounds includes: pt) ifTrue: [
            'yList: ' print. yList size print. ':' print. 
            yList do: [|:e| e print. ',' print ]. '' printLine.
              subListsBelow: p Do: [|:pb. :p1. :pn. :pa |
               'p1: ' print. p1 printLine.
               'pb: ' print. pb printLine.
               'pn: ' print. pn printLine.
               'pa: ' print. pa printLine.
               vp1: (pb - p) crossProduct: (p1 - p).
               vp2: (pa - p) crossProduct: (pn - p).
               'vp1: ' print. vp1 printLine.
               'vp2: ' print. vp2 printLine.
               ((vp1 < 0) && [vp2 > 0])
               || [ (vp1 > 0) && [ vp2 < 0 ]]
                  ifTrue: ['Crossing:' printLine. ^true]
                  False: ['Not crossing' printLine].
             ]].
            ^false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         yAt: inx = ( |
            | yList at: inx).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Morphs\x7fComment: 1st attempt to handle non-rectangular
frames in structure editor.
-- Olm, 3/22/95\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         structureEditorSubFrameMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax rectiLinearPolygonMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax structureEditorSubFrameMorph.

CopyDowns:
globals abstractSyntax rectiLinearPolygonMorph. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)'
        
         enclosingMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isLast <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         morphs.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         structureEditorSubFrameMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax structureEditorSubFrameMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (abstractSyntax emptyNode)\x7fVisibility: private'
        
         theAST <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         theLink.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Tye inference\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         templateMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'prototype' From:
             globals labelMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax templateMorph.

CopyDowns:
globals labelMorph. copy 
SlotsToOmit: prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         actualTypes: evt = ( |
            | 
            evt sourceHand attach:
                (textViewerMorph 
                    copyTitle: "'Actual types of: ' ," typeString
                    Text: longTypes) open).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonPress: button Event: evt = ( |
            | 
            button label = 'Open editor' ifTrue: [ openEditor: evt].
            button label = 'Actual types' ifTrue: [ actualTypes: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: tp TypeInfMorph: tim Direction: dir = ( |
             m.
             t <- ''.
            | 
            m: resend.copy.
            m fontSpec: fontSpec copyName: 'verdana' Size: 12.
            m theTemplate: tp.
            m theTypeInfMorph: tim.
            m direction: dir.
            (inf methodPatcher isResultOfPatch: tp meth theMember )
                ifTrue: [t: '-- Result of patch: '].
            tp nicePrintStringSize: 80 
               MainResult: [| :a | m typeString: t , a ]
               LongTypes: [| :b | m longTypes: b].
            m label: "tp printString , ' ' , " m typeString .
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'Category: templateMorph state\x7fComment: Holds the direction of this template from theTypeInfMorph.
  0: a stand-alone template - neither called or calling
  1: being called from theTypeInfTemplate
  2: calling to theTypeInfTemplate\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         direction <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         leftDoubleClick: evt = ( |
            | 
            structureEditor: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'Category: templateMorph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         longTypes <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         middleMouseDown: evt = ( |
            | 
            evt sourceHand subscribeUntilAllUp: self.
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (\'templateMorph\')\x7fVisibility: public'
        
         morphTypeName = 'templateMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         openEditor: evt = ( |
             infAST.
             mirr.
             o.
             slotOutliner.
             theAST.
             theEditor.
             thePos.
             topF.
             tps.
            | 
            nil != theTemplate ifTrue: [('Select : ' , theTemplate  mySlot slotSelector ) printLine.
             tps: set copy.
             theTemplate scopesAtDepth: 0 Do: [|:t| tps add: t].
             mirr: tps first methodHolder aMember. "mirror of object holding the method"
             useOutLiner ifTrue: [
              o: world outlinerForMirror: mirr.
              slotOutliner: o unfold: (mirr at: tps first mySlot slotSelector) Event: evt.
              slotOutliner methodStructureEditor: evt.
              slotOutliner sprout: evt.
              infAST: slotOutliner methodEditor theAST father.
              slotOutliner: o unfold: infAST slot Event: evt. "Why is this call necessary?"
              theEditor: slotOutliner methodEditor.
             ] False: [" structureEditor is used for whole object: not tested for some time"
              theEditor: theTypeInfMorph theEditor.
              topF: theEditor firstMorph firstMorph. "?? ugly"
              topF theAST theMirror = mirr ifTrue: ['In same editor' printLine.
               ] False: ['Not in same editor' printLine.
                 theAST: mirr makeAST.
                 infAST: theAST selectSlot: tps first mySlot slotSelector .
                 thePos: theAST createStructureEditor: evt .
                 theEditor: thePos currentColumn.
                 theEditor theTypeInfPath: abstractSyntax typeInfPath copy. "elim"
              ].
              theEditor select: infAST.
             ].
             inf currentTypeInfApplicationMorph newTypeInfMorph: infAST 
                 Templates: tps 
                 Path: theTypeInfMorph theTypeInfPath copy
                 Direction: direction 
                 Editor: theEditor 
                 Event: evt.
            ] False: [ 'Cannot open structure editor (theTemplate is nil)' printLine]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu color: paint copyRed: 0.900293 Green: 0.855327 Blue: 0.72043.
            menu addButtonTarget: nil Label: 'Open editor'.
            longTypes != '' ifTrue: [ menu addButtonTarget: nil Label: 'Actual types' ].
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            (menu copy retargetButtonsTo: self)
               popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSyntax templateMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'Category: templateMorph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         theTemplate.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'Category: templateMorph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         theTypeInfMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'Category: templateMorph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         typeString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'templateMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         useOutLiner <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Tye inference\x7fComment: -- Olm, 12/19/94
Represents the main-application
currently being type inferred\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         typeInfApplicationMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax typeInfApplicationMorph.

CopyDowns:
globals frameMorph. copy 
SlotsToOmit: parent prototype.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Button and menu actions\x7fComment: Perform the type inference
for the main-method
-- Olm, 1/19/95\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         analyze = ( |
             if.
            | 
            if: inf interface.
            if setMainObject: theMirror reflectee Selector: slotName.
            mainTemplates: if getMainTemplate.
            theEditor outerFrame newTypeInfTemplates: mainTemplates At: theSlotAST.
            buildUnSafeList.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Building Morph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buildButtons = ( |
             b.
             bb.
             r.
             rr.
             ss.
            | 
            bb: 
              (ui2Button copy target: self) 
               label: '' FontSpec: ui2Button defaultFontSpec
               FontSize: 12 FontColor: color ui2Button defaultFontColor.
            bb color: color.
            ss: ((spacerMorph copy beFlexible) baseMinWidth: 5) color: color.
            rr: rowMorph copy beFlexible color: color.
            r: rr copy.
            b: (bb copy label: 'Run main')  scriptBlock: [target runMain].
            r addMorphLast: b.
            r addMorphLast: ss copy.
            b: (bb copy label: 'Analyze')  scriptBlock: [target analyze].
            r addMorphLast: b.
            r addMorphLast: ss copy.
            b: (bb copy label: 'Extract')  scriptBlock: [target extract: event].
            r addMorphLast: b.
            r addMorphLast: ss copy.
            "b: (bb copy label: 'Red sends')  scriptBlock: [target redSends].
            r addMorphLast: b.
            r addMorphLast: ss copy.
            b: (bb copy label: 'Yellow sends')  scriptBlock: [target yellowSends].
            r addMorphLast: b.
            r addMorphLast: ss copy."

            b: (bb copy label: 'Properties')  scriptBlock: [target properties: event].
            r addMorphLast: b.

            addMorphLast: r.
            r: rr copy.

            b: (bb copy label: 'Clear templates')  scriptBlock: [inf solver initialize0].
            r addMorphLast: b.
            r addMorphLast: ss copy.
            b: (bb copy label: 'Clear cache')  scriptBlock: [inf solver initialize1].
            r addMorphLast: b.
            r addMorphLast: ss copy.
            b: (bb copy label: 'Clear groups')  scriptBlock: [inf solver initialize2].
            r addMorphLast: b.
            r addMorphLast: ss copy.
            b: (bb copy label: 'Quit')  scriptBlock: [target quit].

            r addMorphLast: b.
            addMorphLast: r.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Building Morph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buildHeader = ( |
            | 
            addMorphLast:
              (labelMorph copy) label: 'Main application for type inference:'.
            addMorphLast: (labelMorph copy) label: theMirror name , ' :: ' , slotName.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Building Morph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buildUnSafeList = ( |
             l.
            | 
            l: list copyRemoveAll.
            inf interface
              redTemplatesDo: [| :tp |
                (inf methodPatcher isResultOfPatch: tp meth theMember)
                  ifFalse: [
                      l add: abstractSyntax typeInfUnsafeLabelMorph copy: tp ]].
            nil != unsafeTempMorph ifTrue: [ unsafeTempMorph delete].
            unsafeTempMorph: abstractSyntax expanderListMorph copy: 'Unsafe sends' List: l.
            addMorphLast: unsafeTempMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonPress: button Event: evt = ( |
             ed.
             if.
             infAST.
             l.
             mirr.
             theAST.
             thePos.
             x.
            | 
            if: inf interface.
            l: list copyRemoveAll.
            button label = 'Non safe sends' ifTrue: [
               "NOT needed anymore since a morph with this info is 
                built by buildUnsafeList"
              'Show non-safe sends' printLine.
              if redTemplatesDo: [| :tp |
                 l add: (abstractSyntax typeInfUnsafeLabelMorph copy: tp).
              ].
            x: abstractSyntax expanderListMorph copy: 'Unsafe sends' List: l.
            addMorphLast: x.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: slotAST Editor: ed = ( |
             m.
            | 
            m: resend.copy.
            m removeAllMorphs.
            m beShrinkWrap.
            m color: paint named: 'lightGray'.
            m theSlotAST: slotAST.
            m theMirror: slotAST enclosingObject theMirror.
            m slotName: slotAST slotName.
            m theEditor: ed.
            m typeInfMorphs: list copyRemoveAll.
            m buildHeader.
            m buildButtons.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Button and menu actions\x7fComment: Extract the application
-- Olm, 1/19/95\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         extract: event = ( |
             ps.
             src.
            | 
            src: (extractSource copy 
                   slotName: slotName) theMirror: theMirror.

            ps: abstractSyntax propertySheetMorph
                       copy: 'Extract parameters'
                       Source: src.

            event sourceHand attach: ps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Button and menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         extractSource = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> 'extractSource' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax typeInfApplicationMorph extractSource.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> 'extractSource' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         doProp: blk = ( |
            | 
            blk value: 'foo.snap'
                With: 'Snapshot file name'
                With: 'Name of file where the SNAPSHOT\nof the extracted file is saved'
                With: 2 "text".
            blk value: 'foo.self'
                With: 'Source file name'
                With: 'Name of file where the SOURCE\nof the extracted file is saved'
                With: 2 "text").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> 'extractSource' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         extract = ( |
            | 
            ('\nExtracting to: "' , sourceFileName , '" and "' , snapFileName , '"') printLine.
            inf dumper dumpApp: theMirror reflectee 
                       MainSelector: slotName
                       InferTypes: true
                       SrcFileName: sourceFileName
                       SnapsFileName: snapFileName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> 'extractSource' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> 'extractSource' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (\'main\')\x7fVisibility: private'
        
         slotName <- 'main'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> 'extractSource' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (\'foo.snap\')\x7fVisibility: private'
        
         snapFileName <- 'foo.snap'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> 'extractSource' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (\'foo.self\')\x7fVisibility: private'
        
         sourceFileName <- 'foo.self'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> 'extractSource' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         theMirror.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> 'extractSource' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         update: values = ( |
             i <- 0.
            | 
            values do: [| :v |
               i = 0 ifTrue: [ snapFileName: v].
               i = 1 ifTrue: [ sourceFileName: v].
               i: i + 1.
             ].
            extract).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Type inferance state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         mainTemplates.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         middleMouseDown: evt = ( |
            | 
            evt sourceHand subscribeUntilAllUp: self.
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Basics\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (\'typeInfApplicationMorph\')\x7fVisibility: private'
        
         morphTypeName = 'typeInfApplicationMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Building Morph\x7fComment: Use this method to create new typeInfMorphs;
they are save such that Quit can remove them
-- Olm, 1/19/95\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         newTypeInfMorph: theAST Templates: tps Editor: ed = ( |
            | 
            newTypeInfMorph: theAST 
                Templates: tps 
                Path: list copyRemoveAll 
                Direction: 0 
                Editor: ed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Building Morph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         newTypeInfMorph: theAST Templates: tps Path: path Direction: dir Editor: ed = ( |
             m.
            | 
            m: abstractSyntax typeInfMorph copy: theAST 
                Templates: tps 
                Path: path
                Direction: dir
                Editor: ed.
            typeInfMorphs add: m.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Building Morph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         newTypeInfMorph: theAST Templates: tps Path: path Direction: dir Editor: ed Event: evt = ( |
             m.
            | 
            m: abstractSyntax typeInfMorph copy: theAST 
                Templates: tps 
                Path: path
                Direction: dir
                Editor: ed
                Event: evt.
            typeInfMorphs add: m.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (traits frameMorph)\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu color: paint copyRed: 0.900293 Green: 0.855327 Blue: 0.72043.
            menu addButtonTarget: nil Label: 'Non safe sends'.
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            (menu copy retargetButtonsTo: self)
               popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Button and menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         properties: event = ( |
             m.
            | 
            m: abstractSyntax propertySheetMorph 
                  copy: 'Type inference property sheet'
                  Source: propertySource.
            event sourceHand attach: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Button and menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         propertySource = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> 'propertySource' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax typeInfApplicationMorph propertySource.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> 'propertySource' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         breakIntoLines: txt = ( |
             break <- bootstrap stub -> 'globals' -> 'false' -> ().
             i <- 0.
             s <- ''.
            | 
            txt do: [| :c |
                (c <= ' ') && [ break ] ifTrue: [ s: s , '\n' . i: 0.]
                   False: [ s: s , c ].
                i: i + 1.
                break: i > 20.
              ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> 'propertySource' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         doProp: blk = ( |
             i <- 0.
            | 
            inf interface propertiesDo:
              [| :val. :title. :help. :type. type1 |
                 type ifTrue: [ type1: 0 ]
                      False: [ type1: 1 ].
                 blk value: val
                     With: title
                     With: (breakIntoLines: help)
                     With: type1.
                 val
              ] IfFail: ['illegal value' printLine]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> 'propertySource' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> 'propertySource' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         update: values = ( |
             level.
             m.
             t.
            | 
            level: 
               inf interface 
                  propertiesDo: [ values removeFirst]
                  IfFail: ['Illegal  value in property sheet' printLine].
            level = -1 
              ifTrue: [ 'No initialization' printLine]
              False: [
               t: 'You have to re-initialize the type inference code.\n'.
               t: t , 'Execute the following expression:\n'.
               t: t , '\n     inf interface initialize' , level printString.
               t: t , '\n\n'.
               t printLine.
               m: ((textViewerMorph 
                       copyTitle: 'Re-initialization needed'
                        Text: t) open) position: (400@400).
               "evt sourceHand attach:"
               desktop w addMorph: m.
               desktop w moveToFront: m.
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSyntax typeInfApplicationMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Button and menu actions\x7fComment: Quit this type inference, and make
a clean-up to remove morphs.
-- Olm, 1/19/95\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         quit = ( |
            | 
            inf currentTypeInfApplicationMorph: nil.
            typeInfMorphs do: [| :m |
              nil != m owner ifTrue: [ m delete ].
              m typeInfTemplates: nil.
              m theEditor theTypeInfMorph: nil.
              m theEditor: nil.
            ].
            typeInfMorphs: list copyRemoveAll.
            delete.
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Button and menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         redSends = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Button and menu actions\x7fComment: Run the application being analyzed\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         runMain = ( |
            | 
            'run main ' , (7 asCharacter) printLine.
            (theMirror reflectee objectIDNumber printString
             , ' _AsObject ' , slotName)
               eval).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Button and menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         showInferredTypes: theAST Editor: ed = ( |
             m.
             objMirr.
             sel.
             tps.
            | 
            'Show inferred types' printLine.
            sel: theAST slotName.
            objMirr: theAST enclosingObject theMirror.
            tps: inf interface allTemplatesForMethodNamed: sel In: objMirr.
            m: newTypeInfMorph: theAST Templates: tps Editor: ed.
            "ed addTypeInfMorph: m."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Type inferance state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (\'main\')\x7fVisibility: private'
        
         slotName <- 'main'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Type inferance state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         theEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Type inferance state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         theMirror.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Type inferance state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         theSlotAST.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Type inferance state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         typeInfMorphs <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Type inferance state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         unsafeTempMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfApplicationMorph' -> () From: ( | {
         'Category: Button and menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         yellowSends = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Tye inference\x7fComment: When you click, it displays the
templates for the selected expression\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         typeInfLabelMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfLabelMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'prototype' From:
             globals labelMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfLabelMorph' -> () From: ( |
             {} = 'Comment: Representation notes:

     1. To save space, a number of flags and other information is
	encoded into the single slot \'rawFlags\'.

     2. This object provides a default representation for a morph:
	the rectangle specified by \'rawBox\'. Children such as
	circleMorphs may replace this slot with their own
	representation slots (e.g., \'center\' and \'radius\').

     3. The default resize behavior of a morph is both horizontally
	and vertically rigid (for details, see the resizing category).\x7fModuleInfo: Creator: globals abstractSyntax typeInfLabelMorph.

CopyDowns:
globals labelMorph. copy 
SlotsToOmit: prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonPress: button Event: evt = ( |
             struc.
             tip.
            | 
            button label = 'Revert' ifTrue: [| doDelete . n |
               n: 0.
               doDelete: false.
               owner allMorphsDo: [|:m|
                  doDelete ifTrue: [
                    "Only pop if in this structureEditor.
                     Stack = { s1 s2 ... self sk+1 ... sn]
                     sn is in this editor, sk+1 - sn-1 need not be,
                     self may be or not be"
                    n: n + 1 ].
                    m = self ifTrue: [doDelete: true].
               ].
              tip: theEditor theTypeInfPath.
              struc: tip at: tip size - n - 1.
              struc editor = theEditor ifTrue: [
                  'In this editor' printLine .
                  n do: [ owner lastMorph delete].
                  theEditor clearSelection.
                  theEditor select: struc methodAST.
               ] False: [ 'Not in this editor' printLine].
              theEditor popTypeInfTemplate: n.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: str Template: tp Editor: ed = ( |
             m.
            | 
            m: resend.copy.
            m fontSpec: fontSpec copyName: 'verdana' Size: 12.
            m theEditor: ed.
            tp nicePrintStringSize: 80
               MainResult: [| :a | m typeString: str , a ]
               LongTypes: [| :b | m longTypes: b ].
            m label: m typeString.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         dropEvent: e OnSubmorphsAt: globalPt IfHandled: handledBlock = ( |
            | 
            e middleMouseDown  ifTrue: [
              middleMouseDown: e.
              handledBlock value].

            resend.dropEvent: e OnSubmorphsAt: globalPt IfHandled: handledBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         longTypes <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         middleMouseDown: evt = ( |
            | 
            evt sourceHand subscribeUntilAllUp: self.
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu color: paint copyRed: 0.900293 Green: 0.855327 Blue: 0.72043.
            menu addButtonTarget: nil Label: 'Revert'.
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            (menu copy retargetButtonsTo: self)
               popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfLabelMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSyntax typeInfLabelMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         theEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         typeString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Tye inference\x7fComment: The morph presenting type inference information. Structure: 
frameMorph [ 
 1.  expanderListMorph: showing method templates,
 2.  labelMorph: showing type of selected exp,
 3.  expanderListMorph: showing templates for selected exp
 ]
1 is created together with the typeInfMorph and
2 and 3 are created when an exp is selected by
structureEditorMorph showResultType.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         typeInfMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'prototype' From:
             globals frameMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( |
             {} = 'Comment: Representation notes:

     1. To save space, a number of flags and other information is
	encoded into the single slot \'rawFlags\'.

     2. This object provides a default representation for a morph:
	the rectangle specified by \'rawBox\'. Children such as
	circleMorphs may replace this slot with their own
	representation slots (e.g., \'center\' and \'radius\').

     3. The default resize behavior of a morph is both horizontally
	and vertically rigid (for details, see the resizing category).\x7fModuleInfo: Creator: globals abstractSyntax typeInfMorph.

CopyDowns:
globals frameMorph. copy 
SlotsToOmit: prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: typeInfMorph Methods\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buildExpander: title Templates: mtps Direction: dir = ( |
             l.
             m.
             n <- 0.
            | 
            l: list copyRemoveAll.
            "A vector with one element pr. calling method;
             each element is a vector of templates for the method"
            mtps do: [| :mtp. methLab. sl. exp . size |
               size: mtp size.
               n: n + size.
               methLab: mtp first methodHolder niceName , (' (' , size printString , ')').
               mtp size > 1 ifTrue: [
                 sl: list copyRemoveAll.
                 mtp do: [| :tp |
                     sl add: abstractSyntax templateMorph copy: tp TypeInfMorph: self Direction: dir.
                 ].
                 l add: abstractSyntax expanderListMorph copy: methLab List: sl.
                ] False: [ 
                 l add: abstractSyntax templateMorph copy: mtp first TypeInfMorph: self Direction: dir
            ]].
            l size != 0 ifTrue: [
              m: abstractSyntax expanderListMorph copy: title , ' (' , n printString , ')' List: l.
              addMorphLast: m.
            ].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: typeInfMorph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         calledTemplateMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: typeInfMorph Methods\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         calledTemplates = ( |
             if.
             l.
             m.
             mirr.
             theAST.
            | 
            if: inf interface.
            theAST: theEditor currentSelection theAST. " check if currentSelection is a list"
            "('theAst: ' ,  theAST prettyPrint ) printLine."
            mirr: theAST enclosingObject theMirror.
            mirr isReflecteeBlock ifTrue: [ mirr: mirr valueSlot contents].
            l: list copyRemoveAll.
            if forExp: theAST byteCodePos 
               MethodMirror: mirr
               In: typeInfTemplates 
               DoMethodTargets: [| :tpv|
                 m: buildExpander: 'Templates called by selection'
                    Templates: tpv Direction: 1"Called" ]
               DoReads: [ |:x | l add: (labelMorph copy label: x) fontSpec: globals fontSpec copyName: 'verdana' Size: 12 ]
               DoWrites: [|:x | l add: (labelMorph copy label: x) fontSpec: globals fontSpec copyName: 'verdana' Size: 12 ].
            "the slot may be methods, reads or writes or arbitrary combinations.
             Only methods are returned in 'm'!!!"
            nil = m ifTrue: [
             l size > 0 ifTrue: [
                m: abstractSyntax expanderListMorph copy: 'Templates called by selection ' , ' (' , l size printString , ')' List: l.
                addMorphLast: m.
               ].
             ] False: [ m add: l ].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: typeInfMorph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         callingTemplateMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: typeInfMorph Methods\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         callingTemplates = ( |
             m.
             mtps.
            | 
            mtps: inf interface callersOf: typeInfTemplates.
            callingTemplateMorph:
               buildExpander: 'Templates calling ' , typeInferredMethodAST slotName
               Templates: mtps Direction: 2"Calling".
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: Copying\x7fComment: Creates typeInfMorph for arbitrary
method relative to current main-method.
-- Olm, 1/17/95\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: slotAST Templates: tps Editor: ed = ( |
            | 
            copy: slotAST Templates: tps 
                          Path: list copyRemoveAll 
                          Direction: 0
                          Editor: ed
                          Event: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: slotAST Templates: tps Path: path Direction: dir Editor: ed = ( |
            | 
            copy: slotAST Templates: tps 
                          Path: list copyRemoveAll 
                          Direction: 0
                          Editor: ed
                          Event: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: slotAST Templates: tps Path: path Direction: dir Editor: ed Event: evt = ( |
             e.
             m.
            | 
            m: resend.copy.
            m typeInfTemplates: tps.
            m typeInferredMethodAST: slotAST.
            m theEditor: ed.
            m topJustify.
            m frameStyle: insetBezelStyle.
            m color: styles frameColor.
            m typeInfPath: path Direction: dir.
            e: abstractSyntax
               expanderListMorph 
                  copy: 'Templates for ' , slotAST slotName
                  List: m methodTemplates.
            ed markSelectors: slotAST method Templates: tps.
            m addMorphLast: e.
            m callingTemplates.
            ed addTypeInfMorph: m.
            nil != evt ifTrue: [
              m isInWorld ifFalse: [ evt sourceHand attach: m root
                ] True: [ 
                  m root moveToPosition:  
                    (evt sourceHand globalPosition) + 
                       (m root globalPosition - (e globalPosition)).
                  m world moveToFront: m root. 
                  7 asCharacter printLine.
            ]].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: typeInfMorph Methods\x7fComment: Displays the inferred type of selected expression\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         inferredType: theAST Event: evt = ( |
             bc.
             if.
             methodMirr.
             mirr.
             mt.
             np.
             t <- ''.
             tf.
             tiAST.
             tim.
            | 
            tiAST: typeInferredMethodAST.
            (nil != tiAST) && [ theAST in: tiAST] && [ theAST != tiAST] ifTrue: [
            "can only show type info for expression within the main method
            for which type inference has been performed."
              if: inf interface.
              mt: typeInfTemplates.
              mirr: theAST enclosingObject theMirror.
              mirr isReflecteeBlock ifTrue: [
                   mirr: mirr valueSlot contents.
                   methodMirr: theAST enclosingMethodObject theMirror
                 ] False: [ methodMirr: mirr].
              (nil != mt) && [ methodMirr = mt first meth theMember] ifTrue: [
                 bc: theAST byteCodePos.
                 t: 'Type at: ' , bc printString .  
                 tf: if getTypeForExp: bc MethodMirror: mirr In: mt.
                 nil != tf ifTrue: [ np: 'Type of selection= ' , tf nicePrintString ]
                           False: [ np: 'An error will happen before this expression is executed!!' ].
               ] False: [ np: 'No type info available' ].
               (t , np) printLine.
               showResultType: np.
            ] False: [ removeResultType]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: typeInfMorph Methods\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         methodTemplates = ( |
             i.
             l.
             s.
            | 
            l: list copyRemoveAll.
            i: 0.
            theTypeInfPath do: [| :st | "owner not know since copy is not finished"
               i: i+1.
               s: i printString , ': '.
               s: s , st templates first "meth" methodHolder niceName , ' :: '.   
               st templates do: [| :t | 
                    l add: abstractSyntax typeInfLabelMorph copy: s Template: t 
                       Editor: theEditor ].
               ].
            l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (\'typeInfMorph\')\x7fVisibility: private'
        
         morphTypeName = 'typeInfMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSyntax typeInfMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: typeInfMorph Methods\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         removeResultType = ( |
            | 
            nil != resultTypeMorph ifTrue: [
              resultTypeMorph delete.
              resultTypeMorph: nil.
            ].
            nil != calledTemplateMorph ifTrue: [
              calledTemplateMorph delete.
              calledTemplateMorph: nil.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: typeInfMorph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         resultTypeMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: typeInfMorph Methods\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         showResultType: t = ( |
             l.
            | 
            removeResultType.
            resultTypeMorph: 
                (labelMorph copy label: t) 
                              fontSpec: globals fontSpec copyName: 'verdana' Size: 12.
            addMorphLast: resultTypeMorph.
            calledTemplateMorph: calledTemplates).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (traits abstractSyntax morphPPStream styles)\x7fVisibility: private'
        
         styles = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: typeInfMorph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         theEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: typeInfMorph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         theTypeInfPath.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: typeInfMorph Methods\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         typeInfPath: path Direction: dir = ( |
             struc.
            | 
            struc: abstractSyntax typeInfStruc copy.
            struc templates: typeInfTemplates.
            struc methodAST: typeInferredMethodAST.
            struc editor: theEditor.
            (dir < 2) ifTrue: [
                "0: single, 1: being called from path"
                theTypeInfPath: path addLast: struc 
             ] False: [ "2: calling to path"
               theTypeInfPath: path addFirst: struc.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: typeInfMorph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         typeInfTemplates.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfMorph' -> () From: ( | {
         'Category: typeInfMorph state\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         typeInferredMethodAST.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Tye inference\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         typeInfPath = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfPath' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'prototype' From:
             globals list copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfPath' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax typeInfPath.

CopyDowns:
globals list. copy 
SlotsToOmit: prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfPath' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         add: tp At: anAST In: ed = ( |
             struc.
            | 
            struc: abstractSyntax typeInfStruc copy.
            struc templates: tp.
            struc methodAST: anAST.
            struc editor: ed.
            add: struc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfPath' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | abstractSyntax typeInfPath).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Tye inference\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         typeInfStruc = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfStruc' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax typeInfStruc.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfStruc' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         editor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfStruc' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         methodAST.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfStruc' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfStruc' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         templates.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Tye inference\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         typeInfUnsafeLabelMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfUnsafeLabelMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals labelMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfUnsafeLabelMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax typeInfUnsafeLabelMorph.

CopyDowns:
globals labelMorph. copy 
SlotsToOmit: parent prototype.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfUnsafeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         actualTypes: evt = ( |
            | 
            evt sourceHand attach:
                (textViewerMorph 
                    copyTitle: "'Actual types of: ' ," typeString
                    Text: longTypes) open).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfUnsafeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonPress: button Event: evt = ( |
            | 
            button label = 'Structure editor' ifTrue: [ structureEditor: evt].
            button label = 'Actual types' ifTrue: [ actualTypes: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfUnsafeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: tp = ( |
             m.
             t <- ''.
            | 
            m: resend.copy.
            m fontSpec: fontSpec copyName: 'verdana' Size: 12.
            m theTemplate: tp.
            (inf methodPatcher isResultOfPatch: tp meth theMember )
                ifTrue: [t: '-- Result of patch: '].
            tp nicePrintStringSize: 80 
               MainResult: [| :a | m typeString: t , a ]
               LongTypes: [| :b | m longTypes: b].
            m label: "tp printString , ' ' , " m typeString .
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfUnsafeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfUnsafeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         longTypes <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfUnsafeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         middleMouseDown: evt = ( |
            | 
            evt sourceHand subscribeUntilAllUp: self.
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfUnsafeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'labelMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfUnsafeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu color: paint copyRed: 0.900293 Green: 0.855327 Blue: 0.72043.
            longTypes size > 0 ifTrue: [ menu addButtonTarget: nil Label: 'Actual types' ].
            menu addButtonTarget: nil Label: 'Structure editor'.
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            (menu copy retargetButtonsTo: self)
               popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfUnsafeLabelMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractSyntax  typeInfUnsafeLabelMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfUnsafeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         structureEditor: evt = ( |
             infAST.
             mirr.
             theAST.
             theEditor.
             thePos.
             tps.
            | 
            nil != theTemplate ifTrue: [
                "('Select : ' , theTargetHandler target targetSlot slotSelector ,
                  ' using: ' , theTargetHandler target targetAst niceName) printLine."
                "mirr: theTargetHandler target targetAst aMember."
                mirr: theTemplate "meth" methodHolder aMember.
                theAST: mirr makeAST.
                infAST: theAST selectSlot:  theTemplate "meth" mySlot slotSelector .
                thePos: theAST createStructureEditor: evt .
                theEditor: thePos currentColumn.
                theEditor theTypeInfPath: abstractSyntax typeInfPath copy.
                tps: vector copySize: 1 FillingWith: theTemplate.
                theEditor add: tps At: infAST.
                theEditor select: infAST.
                infAST position currentColumn 
                        markSelectors: infAST method Templates: tps.
            ] False: [ 
              'Cannot open structure editor since theTemplates is nil' printLine
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfUnsafeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         theTemplate.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfUnsafeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         typeString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Streams\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         uglyEditorPPStream = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'uglyEditorPPStream' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'col' From:
             bootstrap remove: 'parent' From:
             globals abstractSyntax pPStream copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'uglyEditorPPStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax uglyEditorPPStream.

CopyDowns:
globals abstractSyntax pPStream. copy 
SlotsToOmit: col parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'uglyEditorPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         col <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         uglyEditorPPStream = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'uglyEditorPPStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax uglyEditorPPStream.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'uglyEditorPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'uglyEditorPPStream' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'uglyEditorPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         uglyEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: General morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         uglyTextField = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'uglyTextField' -> () ToBe: bootstrap addSlotsTo: (
             globals uglyTextEditorMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'uglyTextField' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax uglyTextField.

CopyDowns:
globals uglyTextEditorMorph. copy

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'uglyTextField' -> () From: ( | {
         'Category: uglyTextField\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: text = ( |
             ue.
            | 
            ue: resend.copyString: text 
                Target: self
                Accept: dummyAccept Cancel: dummyCancel
                Style: "ui2" slotOutliner preferences.
            "To get rid of the green/red panel.
             If created without Accept:Cancel, there will be
             no panel, but the editor breaks on meta-return"
            ue lastMorph firstMorph delete.
            ue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'uglyTextField' -> () From: ( | {
         'Category: uglyTextField\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: text Width: w Height: h = ( |
             ed.
            | 
            ed: copy: text.
            ed setWidth: w Height: h.
            ed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'uglyTextField' -> () From: ( | {
         'Category: uglyTextField\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         dummyAccept = bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> 'accept' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'uglyTextField' -> () From: ( | {
         'Category: uglyTextField\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         dummyCancel = bootstrap stub -> 'globals' -> 'complexButtonMorph' -> 'parent' -> 'accept' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'uglyTextField' -> () From: ( | {
         'Category: Example\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         example = ( |
            | 
            copy: 'Flaeskesteg med sovs og kartofler').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Preferences\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         useBezelStyle = ( |
            | 
            traits abstractSyntax morphPPStream styles useBezelStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Preferences\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         useFlatStyle = ( |
            | traits abstractSyntax morphPPStream styles useFlatStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Preferences\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         useInsetBezelStyle = ( |
            | traits abstractSyntax morphPPStream styles useInsetBezelStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         structureEditing = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'structureEditing' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'structureEditing' -> () From: ( |
             {} = 'Comment: the prototype module object, I am created by init.self.\x7fModuleInfo: Creator: globals modules structureEditing.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'structureEditing' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'structureEditing' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'structureEditing' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'structureEditing' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'structureEditing' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         , t = ( |
             m.
             p.
            | 
            p: + t size. 
            p addLabel: t.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         ,, t = ( |
             m.
             p.
            | 
            p: + t size.
            p currentRow appendMorph: abstractSyntax ppLabelMorph copyContraction: t.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: asIsstructure editor\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         add: t = ( |
            | , t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addFrame = ( |
             frame.
            | 

            currentColumn morphTypeName = 'structureEditorSubFrameMorph' 
             ifTrue: [
               frame: currentColumn copyAddSub.
               'Set enc' printLine.
               frame enclosingPMorph: currentColumn
             ] False: [ frame: frameMorphType copy ].
            frame beShrinkWrap.
            frame leftJustify.
            frame borderWidth: styles frameBorder.
            "frame setHeight: 15."
            frame color: styles frameColor.
            frame frameStyle: styles frameStyle.
            currentRow appendMorph: frame.
            currentColumn: frame. 
            "nil != currentRow ifTrue: [ currentRow insertMorphs]."
            addRow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addLabel: t = ( |
             lastFrame.
            | 
            currentRow morphCount > 0 ifTrue: [
               lastFrame: currentRow lastMorph.
               lastFrame morphTypeName = frameMorphType morphTypeName ifTrue: [
                   lastFrame morphCount > 1 ifTrue: [ currentRow bottomJustify]
                ]
              ].
            currentRow appendMorph: labelMorphType copy: t.
            "currentColumn layoutChange." "Note not layoutChanged").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addOuterFrame = ( |
             frame.
            | 
            frame: structureEditorMorphType copy.
            frame beShrinkWrap.
            frame leftJustify.
            frame borderWidth: styles frameBorder.
            "frame setHeight: 15."
            frame color: styles frameColor.
            frame frameStyle: frameMorph insetBezelStyle.
            "currentRow appendMorph: frame."
            currentColumn: frame.
            addRow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addRow = ( |
            | 
            currentRow: rowMorphType copy .
            currentRow beShrinkWrap.
            styles justifyRow: currentRow.
            "currentRow setHeight: 15."
            currentRow color: styles frameColor.
            currentRow position: currentColumn position.
            currentRow borderWidth: styles rowBorder.
            currentColumn appendRow: currentRow.
            currentColumn morphCount > 1
              ifTrue: [| w | "'top justify1' printLine."
                currentColumn  firstMorph topJustify.
                w: currentColumn owner owner.
                nil != w ifTrue: [ "'top justify2' printLine."
                     w firstMorph topJustify.
                     w: w owner owner.
                     nil != w ifTrue: [ "'top justify3' printLine."
                          w firstMorph topJustify.
                          [w: w owner owner.
                          nil != w ifTrue: [  'top justify4' printLine.
                              w firstMorph topJustify.
                              w: w owner owner.
                              nil != w ifTrue: [ 'top justify5' printLine.
                                  w firstMorph topJustify.
                                  w: w owner owner.
                                  nil != w ifTrue: [ 'top justify 6' printLine.
                                       w firstMorph topJustify.

                   ]]]].
                ]]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: asIsstructure editor\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsEnd: endPos = ( |
             m.
             p.
             p1.
            | 
            "What are the relations between endPos, p1 and m?"
            "endPos currentColumn is the last ppFrameMorph representing
             the AST being printed. It may be empty since we may have
             written an eol as part of the whitespace ending the AST
             being printed. An empty ppFrameMorph is removed by endLink"
            endPos currentColumn endLink.

            p: markEnd: endPos.
            "p currentColumn isEmpty may be true, but p is returned as the 
             position to continue writing to. I.e. more stuff may be added"

            p1: abstractSyntax seStack removeLast.
            "m: p1 currentColumn endLink." 

            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: asIsstructure editor\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsInvisibleStart: anAST = ( |
             p.
            | 
            p: markStartNotVisible: anAST.
            abstractSyntax seStack add: p.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: asIsstructure editor\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsStart: anAST = ( |
             p.
            | 
            p: markStart: anAST.
            abstractSyntax seStack add: p.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         break: size Next: next Indent: indent Break: break = ( |
             newPos <- 0.
             s <- ''.
            | 

            break || [ ( col + size + next )  >  width ]  ifTrue: [
                 s:  '' copySize: indent col - colStack last
                     FillingWith: ' '.
                 newPos:  newLine: indent col.
            ] False: [
                 s: '' copySize: size FillingWith: ' '.
                 newPos: + size.
            ].
            newPos addLabel: s.
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: asIsstructure editor\x7fComment: For each node in the AST a markStart is printed before a PP of the node,
and a markEnd is printed after the PP of the node. For nodes which should
not give rise to a new frame, markStartNotVisible is called instead.
When doing asIsPP, asIsStart, asIsInvisibleStart, and asIsEnd are used.

emitSep prints blanks, newlines, dots(\'.\') and comments associated with a node.

When a newline is printed, a number of nodes may currently be printing. I.e.
a markStart has been called, but the corresponding markEnd has NOT been called.

All non-terminated markStart\'s are pushed on the stack seStack.
This stack is popped and a markEnd is called.
When the newline has been printed, a markStart is called for each element
on the stack.

asIsEnd also links together all frames representing a give node.
asIsEnd is only called from asIsPP in children of node.
To \'terminate\' a line, emitSep calls markEnd.

Problems:
- one or more markStart may have been called without anything real being printed yet.
  A markEnd of these will show small empty frames at the end of the line.
  markEnd will thus remove empty frames.
- Removing empty frames doesn\'t seem to work correctly, since some of these empty
  and deleted morphs seem to be in the ppFrame-list for a ppFrame. And since
  they have no owner, this gives an error if their owner is accessed.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         emitSep: s = ( |
             nl.
             p.
             t <- ''.
            | 
            p: copy. 
            s do: [| :c| 
              c = '\n' ifTrue: [ | l . size | 
                  t: t , ' '. "Hack to handle empty lines"
                  l: list copyRemoveAll. "('emitSep1: ' , t ) printLine."
                  t != '' ifTrue: [ p: p , t. t: ''. ].
                  "('AST:' , p currentColumn theAST prettyPrint) printLine."
                  size: abstractSyntax seStack size .
                  size do: [| pp| 
                       pp: abstractSyntax seStack removeLast.
                       "pp currentRow insertMorphs. 
                       p currentRow insertMorphs."
                       l add: pp.
                       p: p markEnd: p.
                  ].
                  p: p newLine: 0.
                  size  do: [| a . e |
                     e: l removeLast.
                     "('Link:' , e currentColumn morphTypeName) printLine."
                     p: p markStart: e currentColumn theAST.
                     e currentColumn linkWith: p currentColumn.
                     abstractSyntax seStack add: p.
                   ].
                ] False: [ t: t , c . ]
            ].
            "('emitSep1: ' , t ) printLine."
            t != '' ifTrue: [ p: p , t ].
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: iterators\x7fComment: An AST is represented by the following morphs
    C
      R(1)   e(1,1) e(1,2) ... e(1,1k)
      ...
      R(n)   e(n,1) e(n,2) ... e(n,nk)
where
 C is a currentColumn which is a ppFrameMorph
 R(i) is a rowMorph
 e(i,i) is either 
 * a labelMorph representing the label of the root of this AST
   The root is thus all of the e(i,i) which are labelMorphs
 * a ppFrameMorph representing a sub-AST of the AST\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         labelsDo: blk = ( |
            | 
            currentColumn 
               linksDo: [| :aPPFrameMorph |
                  aPPFrameMorph morphsDo: [| :row |
                    row morphsDo: [| :elm | 
                      elm morphTypeName = 'labelMorph' ifTrue: [blk value: elm ]]]
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: marking\x7fComment: Protocol in some client AST node:
  position: pos markStart: self.
  ...
  position markEnd: newPos.
position of the node holds the morph info about the node.
currentColumn/currentPosition in self should thus reflect 
position of the node.
Returns a new position reflecting positions in enclosing AST.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         markEnd: endPos = ( |
             m.
             p.
            | 
            [currentColumn morphCount > 1 ifTrue: ["'do topjustify' printLine."
               currentColumn morphsDo: [| :m | m topJustify]].].
            "endPos currentRow insertMorphs."
            endPos currentColumn insertMorphs. "? "
            "self[endRow,endCol]: endPos[row,col]. p: endPos."
            p: resend.markEnd: endPos.

            "m: p currentColumn."
            "FIX below"
            p currentRow: p currentRow enclosingMorph enclosingMorph.
            p currentColumn insertMorphs.
            p currentColumn: p currentColumn enclosingMorph "more fix" enclosingMorph.
            p colStack removeLast.
            [m isEmpty ifTrue: ["'delete empty morph' printLine."
              "m delete" " should p be returned here?"].].
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: marking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         markStart = ( |
             p.
            | 
            p: resend.markStart.
            p addFrame.
            p colStack addLast: p col.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: marking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         markStart: anAST = ( |
             p.
            | 
            p: markStart.
            p currentColumn theAST: anAST.
            p pred: self.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: marking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         markStartNotVisible: anAST = ( |
             currentBorderWidth.
             p.
            | 
            "!! The current version of rectiLinerarPolygonMorph
            does not respond properly to having borderWidth changed
            after being created. I.e. it MUTS be created with
            the correct borderWidth. The fix below temporarily 
            overwrites styles frameBorder"
            currentBorderWidth: styles frameBorder.
            styles frameBorder: 0.
            p: markStart: anAST.
            "p currentColumn borderWidth: 0."
            styles frameBorder: currentBorderWidth.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         new: w = ( |
            | 
            new: w Event: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         new: w Event: evt = ( |
             main.
             p.
            | p: copy .
            p width: w.
            p addOuterFrame.
            " This should be cleaned up! If nil, new:Evt: is probably
              called from slotOutliner to open a method using the
              structureEditor. In that case we dont want borders around
              the editor - we have later decided that we want these
              borders. "
            nil != evt ifTrue: [
                p currentColumn borderWidth: 8.
                "p currentRow borderWidth: 0."
                p currentColumn frameStyle: frameMorph bezelStyle.
            ] False: [
              p currentColumn borderWidth: 5.
              "p currentRow borderWidth: 0."
             ].
            "p currentRow color: styles topFrameColor."
            p currentColumn insertMorphs.
            "p currentRow insertMorphs."
            nil = evt ifTrue: [
               p currentColumn position: (50@50).
               desktop w addMorph: p currentColumn .
               desktop w moveToFront: p currentColumn.
             ] False: [ evt sourceHand attach: "main "p currentColumn].
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         newForSub: w = ( |
             p.
            | p: copy .
            p width: w.
            p currentRow: abstractSyntax ppRowMorph copy.
            p currentColumn: abstractSyntax ppFrameMorph copy.
            p currentRow enclosingMorph: p currentColumn.

            p addFrame.
            p currentColumn insertMorphs.
            p currentRow insertMorphs.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         newLine: n = ( |
             p.
            | 
            nil != currentRow ifTrue: [ currentRow insertMorphs].

            p: resend.newLine: n.
            p addRow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> () From: ( | {
         'Category: morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         useRectiFrame = ( |
            | 
            frameMorphType: abstractSyntax structureEditorSubFrameMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fComment: Implements a pretty-printer that
keeps the formatting information
from the original source text.
Defaults to the adaptive pretty-printer
but is redefined in most childs of node.
\'pos\' must be a pPStream or one of its childs.
See asIsPP for an initial call;
See also abstractSyntax examples.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos = ( |
            | doPP: pos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         createStructureEditor: evtOrNil = ( |
             thePos.
             topPos.
            | thePPWidth = 0 ifTrue: [ppWidth].
            abstractSyntax seStack: list copyRemoveAll.

            (nil = evtOrNil ifTrue: [desktop w] False: [evtOrNil sourceHand world]) safelyDo:
              [traits abstractSyntax morphPPStream styles asIsPP 
                  ifTrue: [
                   '>>>>>> creating asIs structure editor ...' printLine.
                    topPos: abstractSyntax structureEditorStream new: 90 Event: evtOrNil.
                    topPos useRectiFrame.
                    thePos: asIsPP: topPos
                  ] False: [
                   '>>>>>> creating re-formatting structure editor ...' printLine.
                    topPos: abstractSyntax morphPPStream new: 90 Event: evtOrNil.
                    thePos: doPP: topPos
                  ]
              ]. 
            abstractSyntax seStack: nil.
            "thePos root: self."
            "topPos currentRow insertMorphs.<<<<<<"
            topPos currentColumn insertMorphs.
            "thePos currentRow insertMorphs.<<<<<"
            thePos currentColumn asIsPP: traits abstractSyntax morphPPStream styles asIsPP.
            thePos currentColumn theAST:self.
            thePos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'Category: asIsstructure editor\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsEnd: endPos = ( |
             m.
             p.
             p1.
            | 
            "What are the relations between endPos, p1 and m?"
            "endPos currentColumn is the last ppFrameMorph representing
             the AST being printed. It may be empty since we may have
             written an eol as part of the whitespace ending the AST
             being printed. An empty ppFrameMorph is removed by endLink"
            "endPos currentColumn endLink.  - OBS just copied from
                    morphPPStream to experiment with asIsPP on a file"

            p: markEnd: endPos.
            "p currentColumn isEmpty may be true, but p is returned as the 
             position to continue writing to. I.e. more stuff may be added"

            p1: abstractSyntax seStack removeLast.
            "m: p1 currentColumn endLink." 

            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'Category: asIsstructure editor\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsInvisibleStart: anAST = ( |
             p.
            | 
            p: markStartNotVisible: anAST.
            abstractSyntax seStack add: p.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'Category: asIsstructure editor\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsStart: anAST = ( |
             p.
            | 
            p: markStart: anAST.
            abstractSyntax seStack add: p.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'Category: asIsstructure editor\x7fComment: Note! This method has just been copied form morphPPStream in order
to experiment with asIsPP onto a file. A clean-up should be made!
---
For each node in the AST a markStart is printed before a PP of the node,
and a markEnd is printed after the PP of the node. For nodes which should
not give rise to a new frame, markStartNotVisible is called instead.
When doing asIsPP, asIsStart, asIsInvisibleStart, and asIsEnd are used.

emitSep prints blanks, newlines, dots(\'.\') and comments associated with a node.

When a newline is printed, a number of nodes may currently be printing. I.e.
a markStart has been called, but the corresponding markEnd has NOT been called.

All non-terminated markStart\'s are pushed on the stack seStack.
This stack is popped and a markEnd is called.
When the newline has been printed, a markStart is called for each element
on the stack.

asIsEnd also links together all frames representing a give node.
asIsEnd is only called from asIsPP in children of node.
To \'terminate\' a line, emitSep calls markEnd.

Problems:
- one or more markStart may have been called without anything real being printed yet.
  A markEnd of these will show small empty frames at the end of the line.
  markEnd will thus remove empty frames.
- Removing empty frames doesn\'t seem to work correctly, since some of these empty
  and deleted morphs seem to be in the ppFrame-list for a ppFrame. And since
  they have no owner, this gives an error if their owner is accessed.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         emitSep: s = ( |
             nl.
             p.
             t <- ''.
            | 
            p: copy. 
            s do: [| :c| 
              c = '\n' ifTrue: [
                  t: t , ' '. "Hack to handle empty lines"
                  t: t , '\n'. "added for editor version using rectiFrames
                                for printOnFile to print newlines,
                                but NOT understood why this was necessary"
                  indent do: [ t: t , ' ' ]. "to be able to PP objects with slots"
                  t != '' ifTrue: [ p: p , t. t: ''. ].
                  p: p newLine: 0.
                ] False: [ t: t , c . ]
            ].
            t != '' ifTrue: [ p: p , t ].
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         addExpAfter = ( |
            | 
            enclosingFrame "owner owner" addExpAfter).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         addExpBefore = ( |
            | 
            enclosingFrame "owner owner" addExpBefore).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         appendMorph: m = ( |
            | 
            'Never here' printLine.
            addMorphLast: m.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonPress: button Event: evt = ( |
            | 
            button label = 'Collapse'     ifTrue: [^collapseAST    ].
            button label = 'Copy'         ifTrue: [^copyAST     ].
            button label = 'Paste'        ifTrue: [^pasteAST    ].
            button label = 'Cut'          ifTrue: [^cutAST      ].
            button label = 'TextEdit'     ifTrue: [^textEditAST ].
            button label = 'AddExpBefore' ifTrue: [^addExpBefore].
            button label = 'AddExpAfter'  ifTrue: [^addExpAfter ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseAST = ( |
             of.
            | 
            of: enclosingFrame outerFrame.
            nil != of currentSelection ifTrue: [
              'Current selction <> nil' printLine.
            ] False: ['No selection' printLine].
            enclosingFrame "owner owner" collapseAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         content = ( |
            | 
            '"' , label , '"').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         copxxy = ( |
             m.
            | 
            m: resend.copy.
            m morphs: list copyRemoveAll.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: t = ( |
             p.
            | 
            p: copy.
            "p color: paint copyRed: 0.699902 Green: 0.699902 Blue: 0.699902."
            p fontSpec: fontSpec copyName: '6x13' Size: 12.
            p label: t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         copyAST = ( |
            | 
            enclosingFrame "owner owner" copyAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         copyContraction: t = ( |
             p.
            | 
            p: resend.copy.
            p label: t.
            p fontSpec: fontSpec copyName: 'verdana' Size: 12 Style: 'bold'.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         cutAST = ( |
            | 
            enclosingFrame "owner owner"  cutAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         enclosingFrame = ( |
             ef.
            | 
            ef: enclosingMorph.
            ef morphTypeName = 'ppRowMorph' ifTrue: [
               ef: ef owner].
            ef).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         expandAST = ( |
            | 
            " owner owner = a frame"
            enclosingFrame "owner owner" expandAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         insertMorphs = ( |
            | 
            addAllMorphs: morphs.
            morphs do: [| :m | m insertMorphs ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         leftDoubleClick: evt = ( |
             frame.
             theAST.
            | 
            frame: enclosingFrame "owner owner".
            theAST: frame theAST.
            frame outerFrame clearSelection.
            theAST contracted
               ifTrue: [ frame expandAST]
               False: ['Not contracted' printLine]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         leftMouseDown: evt = ( |
             m.
             of.
            | 
            evt sourceHand subscribeUntilAllUp: self.
            of: enclosingFrame outerFrame.
            of isSelecting: true.
            of startFrame: enclosingFrame).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         leftMouseUp: evt = ( |
             col.
             of.
            | 
            of: enclosingFrame outerFrame.
            col:  enclosingFrame theAST position styles selectionColor.
            of startFrame setColor: col.
            of endFrame setColor: col.
            enclosingFrame outerFrame isSelecting: false.
            "The next message displays the inferred type of the section,
             but only if types have been inferred"
            enclosingFrame inferredType: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         middleMouseDown: evt = ( |
            | 
            evt sourceHand subscribeUntilAllUp: self.
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         mouseMove: evt = ( |
             m.
             of.
             oo.
             sf.
            | 
            "This event is only meaningfull if leftMouseDown is active.
             but it also called when middleMouseDown:evt is called.
             middleMouseDown may execute expandAST which removes this morph from
             the enclosing morph and thereby making owner (owner owener) nil."
            "(nil != owner) && [ oo: owner owner. oo != nil ] &&"
            [oo: enclosingFrame. oo != nil ] value &&
            [ of: oo outerFrame. of isSelecting ]
              ifTrue: [
                m: oo topFrame leafMorphAt: evt cursorPoint.
                m != nil ifTrue: [
                  sf: of startFrame.
                  of clearSelection.
                  of currentSelection: sf theAST extent: m theAST.
                  of highLightSelection.
              ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'labelMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         pasteAST = ( |
            | 
            enclosingFrame "owner owner" pasteAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
            | 
            enclosingFrame "owner owner" popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppLabelMorph' -> () From: ( | {
         'Category: menu actions\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         textEditAST = ( |
            | 
            enclosingFrame "owner owner" textEditAST.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         changed = ( |
            | 
            "dirty: true." resend.changed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         dropEvent: e OnSubmorphsAt: globalPt IfHandled: handledBlock = ( |
            | 
            dirty ifTrue: ['Was cahnged' printLine].
            (dirty = false) && [ e middleMouseDown ]   ifTrue: [
              middleMouseDown: e.
              handledBlock value].

            resend.dropEvent: e OnSubmorphsAt: globalPt IfHandled: handledBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp: evt = ( |
            | 
            self "'left up' printLine").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
             sAst.
             x.
             y.
            | 
            evt sourceHand subscribeUntilAllUp: self.
            x: evt cursorPoint x.
            y: evt cursorPoint y.
            "'left down' printLine.
            evt cursorPoint printLine.
            x printString printLine.
            y printString printLine.
            ('Editor pos:' ,  position printString, ' Global: ' ,
            globalPosition printString) printLine."
            x: x - text globalPosition x .
            y: y - text globalPosition y .
            x: (x / 6) .
            y: (y / 15) .
            "(theAST position inside:  x @ y) ifTrue: ['Yes' printLine ]
               False: ['No' printLine]. "
            sAst: (theAST getSelectedAST: x @ y).
            sAst  highLight.
            "sAst prettyPrint printLine."
            "text selectionStart: x @ y
                             End: (x + 3)@ (y)").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: evt = ( |
            | 
            "'fisk' printLine."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         rightMouseDown: evt = ( |
            | 'right down' printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppUglyEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         xallowSubmorphsToGetEvent: evt = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'Category: Type inference\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         add: tp At: anAST = ( |
             m.
            | 
            "Called by structureEditor in
                typeInfUnsafeMorph and templateLabelMorph"
            "Also done in copyMain for typeInfMorph "
            theTypeInfPath add: tp At: anAST In: self.
            m: inf currentTypeInfApplicationMorph
                  newTypeInfMorph: anAST
                  Templates: tp
                  Editor: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'Category: Type inference\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addTypeInfMorph: tim = ( |
            | 
            nil != theTypeInfMorph ifTrue: [ theTypeInfMorph delete].
            theTypeInfMorph: tim.
            addMorphLast: tim).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         baseColor = ( |
            | 
            ((paint named: 'green') copyBrightness: 0.95)
               copySaturation: 0.4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         beTypingFocusFor: sourcehand = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTopMenu: menu = ( |
            | 
            menu addButtonTarget: nil Label: 'PrintOnFile'.
            menu addButtonTarget: nil Label: 'bezelStyle'.
            menu addButtonTarget: nil Label: 'flatStyle'.
            menu addButtonTarget: nil Label: 'insetBezelStyle'.
            menu addButtonTarget: nil Label: 'Color frames'.
            asIsPP ifTrue: [ menu addButtonTarget: nil Label: 'Reformat'.]
                    False: [ menu addButtonTarget: nil Label: 'No reformat'].
            abstractSyntax emptyNode != theAST father ifTrue:
                [ menu addButtonTarget: nil Label: 'Structure editor on whole object'].
            menu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonPress: button Event: evt = ( |
            | 
            button label = 'PrintOnFile'   ifTrue: [^printOnFile: evt].
            button label = 'bezelStyle'    ifTrue: [^doBezelStyle ].
            button label = 'flatStyle'     ifTrue: [^doFlatStyle ].
            button label = 'insetBezelStyle'  ifTrue: [^doInsetBezelStyle ].
            button label = 'Color frames'  ifTrue: [^colorFrames: evt Color: baseColor ].
            button label = 'Reformat' ifTrue: [^reDo: evt Format: false].
            button label = 'No reformat' ifTrue: [^reDo: evt Format: true].
            button label = 'Structure editor on whole object' ifTrue: [^openWholeObject: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         clearSelection = ( |
            | 
            nil != currentSelection ifTrue: [ currentSelection clear]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'Category: style\x7fComment: Just an experiment in generating colors.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         colorFrames: evt Color: col = ( |
            | 
            color: col.
            morphsDo: [| :m |
              m morphTypeName = 'structureEditorSubFrameMorph'
                ifTrue: [ m colorFrames: evt Color: col Level: 1
              ]
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'Category: style\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         doBezelStyle = ( |
            | setStyle: bezelStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'Category: style\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         doFlatStyle = ( |
            | 
            setStyle: flatStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'Category: style\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         doInsetBezelStyle = ( |
            | setStyle: insetBezelStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         firstPPFrame = ( |
            | 
            "structureEditorMorph
               [ppRowMorph [ppFrameMorph[...]]]"
            firstMorph firstMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         highLightSelection = ( |
            | 
            nil != currentSelection ifTrue: [ currentSelection highLight]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'structureEditorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'Category: Type inference\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         newTypeInfTemplates: tp At: anAST = ( |
            | 
            "Called from typeInfApplicationMorph analyze"

            "theTypeInfMorph is now also a slot in typeInfMorph"
            theTypeInfPath: abstractSyntax typeInfPath copyRemoveAll.
            add: tp At: anAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'Category: Type inference\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         popTypeInfTemplate: n = ( |
             struc.
            | 
            "we pop one too much, and then push it again
             to get the morphs updated"
            n + 1 do: [ struc: theTypeInfPath removeLast ].
            add: struc templates At: struc methodAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         popUpMenu: evt = ( |
             menu.
             target.
            | 
            target: self.
            menu: ui2Menu copy.
            menu color: paint copyRed: 0.900293 Green: 0.855327 Blue: 0.72043.
            buildTopMenu: menu.
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            (menu copy retargetButtonsTo: target) popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         reDo: evt Format: format = ( |
            | 
            ('redo:' ,  morphTypeName ) printLine.
            true || [outerFrame asIsPP != format]
               ifTrue: ['Change' printLine.
                  "outerFrame" asIsPP: format.
                  "outerFrame" firstPPFrame expandAST
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         select: anAST = ( |
            | 
            clearSelection.
            theAST selectSlot: anAST.
            currentSelection: 
              ((abstractSyntax selection copy theAST: anAST)
                          subStart: anAST) subEnd: anAST.
            highLightSelection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'Category: style\x7fComment: Not up-to-date for structureEditorSubFrameMorph.
the frameStyle and borderWidth is changed, but
no re-layout of the sub-morphs is made.
If the first printing was in bezel, the flat style
will have too wide frames. If original flat,
a bezel style will lack space for the border.x\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         setStyle: style = ( |
             bor.
            | 'Set style' printLine.
            bor: styles defaultBorderWidth: style.
            allMorphsDo:  [| :m |
               (m morphTypeName = 'ppFrameMorph')
            || [m morphTypeName = 'structureEditorSubFrameMorph']
               ifTrue: [
                    m frameStyle: style.
                    m borderWidth: bor.
                    "m layoutChanged"
               ]. 
               m flushLayoutCaches
            ].
            styles frameStyle: style.
            styles frameBorder: bor.
            layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'Category: style\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (traits abstractSyntax morphPPStream styles)\x7fVisibility: private'
        
         styles = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'Category: eventsXXX\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         xXXdropEvent: e OnSubmorphsAt: globalPt IfHandled: handledBlock = ( |
            | 
            e middleMouseDown  ifTrue: [
              middleMouseDown: e.
              handledBlock value].

            resend.dropEvent: e OnSubmorphsAt: globalPt IfHandled: handledBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorMorph' -> () From: ( | {
         'Category: eventsXXX\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         xxxbuildTopMenu: menu = ( |
            | 
            menu addButtonTarget: nil Label: 'PrintOnFile'.
            menu addButtonTarget: nil Label: 'bezelStyle'.
            menu addButtonTarget: nil Label: 'flatStyle'.
            menu addButtonTarget: nil Label: 'insetBezelStyle'.
            asIsPP ifTrue: [ menu addButtonTarget: nil Label: 'Reformat'.]
                    False: [ menu addButtonTarget: nil Label: 'No reformat'].
            abstractSyntax emptyNode != theAST father ifTrue:
                [ menu addButtonTarget: nil Label: 'Structure editor on whole object'].
            menu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         , t = ( |
             m.
             p.
            | 
            p: + t size. 
            p addLabel: t.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         ,, t = ( |
             m.
             p.
            | 
            p: + t size.
            p currentColumn appendMorph: abstractSyntax ppLabelMorph copyContraction: t.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: asIsstructure editor\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         add: t = ( |
            | , t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addFrame = ( |
             frame.
            | 

            currentColumn morphTypeName = 'structureEditorSubFrameMorph' 
             ifTrue: [
               frame: currentColumn copyAddSub.
               "frame enclosingPMorph: currentColumn. not needed!"
               frame enclosingMorph: currentColumn.
             ] False: [ 
               frame: frameMorphType copy.
               currentColumn appendMorph: frame
              ].
            "frame beShrinkWrap.
            frame leftJustify."
            frame borderWidth: styles frameBorder.
            "frame setHeight: 15."
            frame color: styles frameColor.
            frame frameStyle: styles frameStyle.
            "currentRow appendMorph: frame."
            currentColumn: frame. 
            "nil != currentRow ifTrue: [ currentRow insertMorphs]."
            "addRow").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addLabel: t = ( |
             lm.
            | 
            lm: (labelMorphType copy: t).
            lm computeWidthInWorld: desktop w.
            currentColumn appendMorph: lm.
            currentColumn layoutChange. "Note not layoutChanged").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addOuterFrame = ( |
             frame.
            | 
            frame: structureEditorMorphType copy.
            frame beShrinkWrap.
            frame leftJustify.
            frame borderWidth: styles frameBorder.
            frame color: styles frameColor.
            frame frameStyle: frameMorph insetBezelStyle.
            "currentRow appendMorph: frame."
            currentColumn: frame.
            "addRow").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addRow = ( |
            | 
            currentRow: rowMorphType copy .
            currentRow beShrinkWrap.
            styles justifyRow: currentRow.
            "currentRow setHeight: 15."
            currentRow color: styles frameColor.
            currentRow position: currentColumn position.
            currentRow borderWidth: styles rowBorder.
            currentColumn appendRow: currentRow.
            currentColumn morphCount > 1
              ifTrue: [| w | "'top justify1' printLine."
                currentColumn  firstMorph topJustify.
                w: currentColumn owner owner.
                nil != w ifTrue: [ "'top justify2' printLine."
                     w firstMorph topJustify.
                     w: w owner owner.
                     nil != w ifTrue: [ "'top justify3' printLine."
                          w firstMorph topJustify.
                          [w: w owner owner.
                          nil != w ifTrue: [  'top justify4' printLine.
                              w firstMorph topJustify.
                              w: w owner owner.
                              nil != w ifTrue: [ 'top justify5' printLine.
                                  w firstMorph topJustify.
                                  w: w owner owner.
                                  nil != w ifTrue: [ 'top justify 6' printLine.
                                       w firstMorph topJustify.

                   ]]]].
                ]
               ]
             ] .
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: asIsstructure editor\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsEnd: endPos = ( |
             m.
             p.
             p1.
            | 
            "What are the relations between endPos, p1 and m?"
            "endPos currentColumn is the last ppFrameMorph representing
             the AST being printed. It may be empty since we may have
             written an eol as part of the whitespace ending the AST
             being printed. An empty ppFrameMorph is removed by endLink"
            "endPos currentColumn endLink."

            p: markEnd: endPos.
            "p currentColumn isEmpty may be true, but p is returned as the 
             position to continue writing to. I.e. more stuff may be added"

            "p1: abstractSyntax seStack removeLast."
            "m: p1 currentColumn endLink." 

            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: asIsstructure editor\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsInvisibleStart: anAST = ( |
             p.
            | 
            p: markStartNotVisible: anAST.
            "abstractSyntax seStack add: p."
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: asIsstructure editor\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsStart: anAST = ( |
             p.
            | 
            p: markStart: anAST.
            "abstractSyntax seStack add: p."
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         break: size Next: next Indent: indent Break: break = ( |
             newPos <- 0.
             s <- ''.
            | 
            "for e.g. slotLis asIsPP: calls doPP:, 
             which calls this method"
            break || [ ( col + size + next )  >  width ]  ifTrue: [
             "Some hacking here to make this work for objects:
              colStack ignored"
                 s:  '' copySize: ((indent col "- colStack last") max: 0)
                     FillingWith: ' '.
                 newPos:  newLine: indent col.
            ] False: [
                 s: '' copySize: size FillingWith: ' '.
                 newPos: + size.
            ].
            newPos addLabel: s.
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: asIsstructure editor\x7fComment: For each node in the AST a markStart is printed before a PP of the node,
and a markEnd is printed after the PP of the node. For nodes which should
not give rise to a new frame, markStartNotVisible is called instead.
When doing asIsPP, asIsStart, asIsInvisibleStart, and asIsEnd are used.

emitSep prints blanks, newlines, dots(\'.\') and comments associated with a node.

When a newline is printed, a number of nodes may currently be printing. I.e.
a markStart has been called, but the corresponding markEnd has NOT been called.

All non-terminated markStart\'s are pushed on the stack seStack.
This stack is popped and a markEnd is called.
When the newline has been printed, a markStart is called for each element
on the stack.

asIsEnd also links together all frames representing a give node.
asIsEnd is only called from asIsPP in children of node.
To \'terminate\' a line, emitSep calls markEnd.

Problems:
- one or more markStart may have been called without anything real being printed yet.
  A markEnd of these will show small empty frames at the end of the line.
  markEnd will thus remove empty frames.
- Removing empty frames doesn\'t seem to work correctly, since some of these empty
  and deleted morphs seem to be in the ppFrame-list for a ppFrame. And since
  they have no owner, this gives an error if their owner is accessed.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         emitSep: s = ( |
             nl.
             p.
             t <- ''.
            | 
            "t: ''."
            p: copy. 
            s do: [| :c | 
              c = '\n'  
                ifTrue: [ | l. size | 
                  t: t , ' '. "Hack to handle empty lines"
                  t != '' ifTrue: [ p: p , t. t: ''. ].
                  p: p newLine: 0.
                  indent do: [ t: t , ' '].
                ] False: [ t: t , c . ]
            ].
            t != '' ifTrue: [ p: p , t ].
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: iterators\x7fComment: An AST is represented by a structurerEditorSubFrameMorph
containing a list of 
  * structureEditorMorphs corresponding to sub-ASTs,
and
  * ppLabelMorphs corresponding to the labesl of the 
    root of the AST\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         labelsDo: blk = ( |
            | 
            currentColumn morphsDo: [| :elm | 
                      elm morphTypeName = 'labelMorph' ifTrue: [blk value: elm ]
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: marking\x7fComment: Protocol in some client AST node:
  position: pos markStart: self.
  ...
  position markEnd: newPos.
position of the node holds the morph info about the node.
currentColumn/currentPosition in self should thus reflect 
position of the node.
Returns a new position reflecting positions in enclosing AST.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         markEnd: endPos = ( |
             m.
             p.
            | 
            p: resend.markEnd: endPos.
            p currentColumn insertMorphs.
            p currentColumn endFrame.
            p currentColumn: p currentColumn enclosingMorph.
            "p colStack removeLast."
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: marking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         markStart = ( |
             p.
            | 
            p: resend.markStart.
            p addFrame.
            p colStack addLast: p col.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: marking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         markStart: anAST = ( |
             p.
            | 
            p: markStart.
            p currentColumn theAST: anAST.
            p pred: self.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: marking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         markStartNotVisible: anAST = ( |
             currentBorderWidth.
             p.
            | 
            "!! The current version of rectiLinerarPolygonMorph
            does not respond properly to having borderWidth changed
            after being created. I.e. it MUST be created with
            the correct borderWidth. The fix below temporarily 
            overwrites styles frameBorder"
            currentBorderWidth: styles frameBorder.
            styles frameBorder: 0.
            p: markStart: anAST.
            "p currentColumn borderWidth: 0."
            styles frameBorder: currentBorderWidth.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         new: w = ( |
            | 
            new: w Event: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         new: w Event: evt = ( |
             main.
             p.
            | p: copy .
            p width: w.
            p addOuterFrame.
            " This should be cleaned up! If nil, new:Evt: is probably
              called from slotOutliner to open a method using the
              structureEditor. In that case we dont want borders around
              the editor - we have later decided that we want these
              borders. "
            nil != evt ifTrue: [
                p currentColumn borderWidth: 8.
                p currentColumn frameStyle: frameMorph bezelStyle.
            ] False: [
              p currentColumn borderWidth: 5.
             ].
            p currentColumn insertMorphs.
            nil = evt ifTrue: [
               p currentColumn position: (50@50).
               desktop w addMorph: p currentColumn .
               desktop w moveToFront: p currentColumn.
             ] False: [ evt sourceHand attach: p currentColumn].
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         newForSub: w = ( |
             p.
            | p: copy .
            p width: w.
            "p currentRow: abstractSyntax ppRowMorph copy."
            p currentColumn: abstractSyntax structureEditorSubFrameMorph copy.
            "p currentRow enclosingMorph: p currentColumn."

            p addFrame.
            p currentColumn insertMorphs.
            "p currentRow insertMorphs."
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         newLine: n = ( |
             em.
             p.
            | 
            "nil != currentRow ifTrue: [ currentRow insertMorphs]."

            p: resend.newLine: n.
            p currentColumn newLine.
            "em: p currentColumn enclosingPMorph.
            nil != em ifTrue: [
               em newLine.
             ]."
            "p addRow"
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: styles\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         styles = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'morphPPStream' -> 'styles' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorStream' -> () From: ( | {
         'Category: morphs\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         useRectiFrame = ( |
            | 
            frameMorphType: abstractSyntax structureEditorSubFrameMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addAfter: evt = ( |
            | 
            insert: false Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addBefore: evt = ( |
            | 
            insert: true Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addDroppingMorph: m Event: evt = ( |
            | 
            'Drop' printLine.
            m morphsDo: [| :m | abstractSyntax clipBoard: m theAST ].
            abstractSyntax clipBoard father: theAST.
            pasteAST: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         addReceiver: evt = ( |
             eo.
            | 
            "assume theAST isMessage"
            theAST replaceSon: theAST receiver 
                   With: abstractSyntax unExpanded copy category: 'exp'.
            eo: enclosingMorph.
            eo expandAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: morph manipulation\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         appendMorph: m = ( |
            | 
            m enclosingMorph: self.
            addMorphLast: m.
            "morphs add: m."
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: morph manipulation\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         appendRow: m = ( |
            | 
            rowMorphs size != 0 ifTrue: [ newLine ].
            appendMorph:m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buildMainMenu: menu = ( |
             elf.
             sel.
             selAST.
             target.
            | 
            sel: outerFrame currentSelection .
            selAST: sel theAST.
            target: selAST position currentColumn.
            selAST category = 'instance' ifTrue: [ menu addButtonTarget: nil Label: 'Open'].
            menu addButtonTarget: nil Label: 'Collapse'.
            menu addButtonTarget: nil Label: 'CollapseSubs'.
            menu addButtonTarget: nil Label: 'Copy'.
            menu addButtonTarget: nil Label: 'Paste'.
            menu addButtonTarget: nil Label: 'Cut'.
            menu addButtonTarget: nil Label: 'Delete'.
            menu addButtonTarget: nil Label: 'TextEdit'.
            elf: selAST enclosingListFather.
            elf != abstractSyntax emptyNode ifTrue: [
                menu addButtonTarget: nil Label: 'Add' , elf subListCategory , 'Before'.
                menu addButtonTarget: nil Label: 'Add' , elf subListCategory , 'After'.
            ].
            selAST isMessage && [selAST receiver = abstractSyntax emptyNode]
               ifTrue: [ menu addButtonTarget: nil Label: 'Add receiver'].
            selAST isMessage || [selAST hasCode] ifTrue: [ menu addButtonTarget: nil Label: 'Self Messages'].
            selAST isMessage ifTrue: [
               menu addButtonTarget: nil Label: 'Implementors'.
               menu addButtonTarget: nil Label: 'Senders'.
            ].
            selAST isObject ifTrue: [ menu addButtonTarget: nil Label: 'Leaf children'].
            selAST isMessage || [selAST hasCode] ifTrue: [
               menu addButtonTarget: nil Label: 'Local check'.
               menu addButtonTarget: nil Label: 'Global check'.
            ].
            (selAST isMethodSlot) || [selAST father isMethodSlot]
                  ifTrue: [ menu addButtonTarget: nil Label: 'Infer types'.
                     (checkIfTypeInfIsIn: nil) ifTrue: [
                            menu addButtonTarget: nil Label: 'Show type templates'
            ]].
            target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTopMenu: menu = ( |
            | 
            menu addButtonTarget: nil Label: 'PrintOnFile'.
            menu addButtonTarget: nil Label: 'bezelStyle'.
            menu addButtonTarget: nil Label: 'flatStyle'.
            menu addButtonTarget: nil Label: 'insetBezelStyle'.
            menu addButtonTarget: nil Label: 'Color frames'.
            asIsPP ifTrue: [ menu addButtonTarget: nil Label: 'Reformat'.]
                    False: [ menu addButtonTarget: nil Label: 'No reformat'].
            abstractSyntax emptyNode != theAST father ifTrue:
                [ menu addButtonTarget: nil Label: 'Structure editor on whole object'].
            menu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonPress: button Event: evt = ( |
            | 
            button label = 'Open'          ifTrue: [^openAST: evt      ].
            button label = 'Collapse'      ifTrue: [^collapseAST: evt  ].
            button label = 'CollapseSubs'  ifTrue: [^collapseSubs: evt ].   
            button label = 'Copy'          ifTrue: [^copyAST: evt      ].
            button label = 'Paste'         ifTrue: [^pasteAST: evt     ].
            button label = 'Cut'           ifTrue: [^cutAST: evt       ].
            button label = 'Delete'        ifTrue: [^deleteAST: evt    ].
            button label = 'TextEdit'      ifTrue: [^textEditAST: evt  ].
            button label = 'AddExpBefore'  ifTrue: [^addBefore: evt    ].
            button label = 'AddExpAfter'   ifTrue: [^addAfter: evt     ].
            button label = 'AddSlotBefore' ifTrue: [^addBefore: evt    ].
            button label = 'AddSlotAfter'  ifTrue: [^addAfter: evt     ].
            button label = 'Local check'         ifTrue: [^checkAST          ].
            button label = 'Add receiver'  ifTrue: [^addReceiver: evt  ].
            button label = 'PrintOnFile'   ifTrue: [^printOnFile: evt  ]. "Note: now defined in
                structureEditorMorph"
            button label = 'bezelStyle'    ifTrue: [^doBezelStyle      ].
            button label = 'flatStyle'     ifTrue: [^doFlatStyle       ].
            button label = 'insetBezelStyle'  ifTrue: [^doInsetBezelStyle ].
            button label = 'Color frames'  ifTrue: [^doColorFrames: evt Color: baseColor ].
            button label = 'Leaf children'  ifTrue: [^childrenOf: evt ].
            button label = 'Self Messages'  ifTrue: [^messagesToSelf: evt ].
            button label = 'Global check'  ifTrue: [^checkSelfMessages: evt ].
            button label = 'Infer types'  ifTrue: [^inferTypes: evt ].
            button label = 'Show type templates' ifTrue: [^showInferredTypes: evt ].
            button label = 'Reformat' ifTrue: [^reDo: evt Format: false].
            button label = 'No reformat' ifTrue: [^reDo: evt Format: true].
            button label = 'Implementors' ifTrue: [^implementors: evt].
            button label = 'Senders' ifTrue: [^senders: evt].
            button label = 'Structure editor on whole object' ifTrue: [^openWholeObject: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         calledSelectors: evt = ( |
             if.
             t.
            | 
            t: ''.
            if: inf interface.
            if forExp: theAST byteCodePos In: if getMainTemplate
                 DoMethodTargets: [|:th.| 
                      t:   th target targetAst niceName , ' ' , theAST selector .
                    th outgoingDo: [| :tp | t: t , ' ' , tp index printString ].
                    topLabel addMorphLast:  labelMorph copy label: t.
                    "th target targetAst aMember 
                      makeAST createStructureEditor: evt Templates: th outgoingVector" ]
                 DoReads: [|:x| t: t , x , '\n' ]
                 DoWrites: [|:x| t: t , x , '\n']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         checkAST = ( |
            | 
            theAST
              check:  [| :msgNode | ('Found: ', msgNode selector ) printLine.
                  msgNode position labelsDo: [| :lab | lab color: msgNode position styles localFoundColor]
              ] NotFound:  [|:msgNode | 
                 ('Not found: ' , msgNode selector) printLine.
                 msgNode position labelsDo: [| :lab | lab color: msgNode position styles notFoundColor]
               ]
              Ambiguous: [| :msgNode | ('Ambiguous:' , msgNode selector) printLine ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         checkIfTypeInfIsIn: evt = ( |
             m.
             t.
            | 
            m: reflect: globals.
            m do: [|:s| 
               s name = 'inf' ifTrue: [
                 'Type inf seems to be there!' printLine.
                 ^true
              ]].
            nil != evt ifTrue: [
             t: '' & ''. " a string collector"
             t: t & 'You need to file-in the type inference code!\n'.
             t: t & 'Talk to Ole Agesen about how to do this.\n'.
             t: t & 'E-mail: ole.agesen@eng.sun.com\n'.
             t: t & 'Tel.: +1 415 336-2346\n\n'.
             t: t & 'If you are at Sun Labs, the following expression will file-in the code:\n\n'.
             t: t & '   \'~agesen/self/objects/applications/Typeinf/allti.self\' _RunScript\n'.
             t flatString printLine.
             evt sourceHand attach:
                (textViewerMorph copyTitle: 'NO type inference code available!'
                     Text: t flatString) open.
            ].
            ^false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         checkLinks: res = ( |
             check <- bootstrap stub -> 'globals' -> 'true' -> ().
             l.
             pred.
             s.
            | 
            check ifTrue: [ s: 'Check links', content.
            res = self ifFalse: 
                [ s: s , '\nhead is empty\nnext: ' , res content ].
            pred: res.
            l: res theLink.
            res isEmpty ifTrue: [s: s , '\nres is empty' ].
            " owner should be enclosingMorph"
            nil = owner ifTrue: [s: s , '\nowner is NIL' ].
            s printLine.
            [(nil != l) && [ l != res ]] whileTrue: [
              ('link element' , l content) printLine.
              nil = l owner ifTrue: ['L owner is nil' printLine.
               l theAST prettyPrint printLine.
               pred theLink: l theLink.
              ].
              l isEmpty ifTrue: ['is empty' printLine].
              pred: l.
              l: l theLink.
            ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         checkSelfMessages: evt = ( |
             error.
             errors.
             pref.
             setCol.
            | 
            'Checking mesages to self:' printLine.
            error: false.
            setCol: [|:msg . :col| msg position labelsDo: [|:lab| lab color: col]].
            pref: theAST position styles.
            errors: 
              theAST 
                checkWithLeafChildren: [| :msg | setCol value: msg With: pref localFoundColor ]
                InLeaf: [| :msg | setCol value: msg With: pref childrenFoundColor ]
                NotFound: [| :msg | error: true. setCol value: msg With: pref notFoundColor]
                Ambiguous: [| :msg | error: true ].
            error ifTrue: [
              evt sourceHand attach:
                 (textViewerMorph
                       copyTitle: 'Messages not found' Text: errors flatString).
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         childrenOf: evt = ( |
             l.
             s <- ''.
            | 
            l: theAST leafChildren.
            l do: [|:m| s: s , m printString , '\n'].
            evt sourceHand attach:
                 (textViewerMorph
                       copyTitle: 'Leaf children' Text: s)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: collaps & expand\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseAST: evt = ( |
             newTf.
             of.
             pos.
             tf.
             topAST.
            | 
            "('Collapse: ' , theAST prettyPrint ) printLine."
            theAST = abstractSyntax emptyNode ifFalse: [ theAST contracted: true ].
            doPrettyTop: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: collaps & expand\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseSubs: evt = ( |
            | 
            morphsDo: [| :f|
                  f morphTypeName = 'structureEditorSubFrameMorph' ifTrue:
                     [f theAST contracted: true ]
            ].
            doPrettyTop: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: style\x7fComment: Just an experiment in generating colors.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         colorFrames: evt Color: col Level: n = ( |
             col1.
            | 
            "Do NOT give new color to frames corresponding to
             invisible intermediate ASTs.
             More state is needed to handle this in the case
             of flatStyle."
            (borderWidth > 0) || [frameStyle = flatStyle]
               ifTrue: [
                 "col1: col copySaturation: 1.0 - ( 0.1 * n)."
                 col1: col copyHue: (col hue - 30) % 360.
                "col1: col1 copyBrightness: 1.0 - ( 0.01 * n)."
               ] False: [col1: col].
            color: col1.
            morphsDo: [| :m |
              m morphTypeName = 'structureEditorSubFrameMorph'
                ifTrue: [ m colorFrames: evt Color: col1 Level: n+1
              ]
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         content = ( |
             s.
            | 
            s: 'StrucSub:' , objectID , '['.
            "both needed when collecting elements in morphs"
            morphsDo: [|:m | s: s , m content].
            morphs do: [|:m | s: s , m content].
            s , ']').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             m.
            | 
            m: resend.copy.
            m morphs: list copyRemoveAll.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAST: evt = ( |
            | 
            abstractSyntax clipBoard: theAST copyDeep.
            abstractSyntax clipBoard createStructureEditor: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         copyAddSub = ( |
             pm.
            | 
            pm: resend.copyAddSub.
            pm morphs: list copyRemoveAll.
            pm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         currentSelection = ( |
            | outerFrame selection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         cutAST: evt = ( |
             father.
             newNode.
             thePos.
            | 
            father: theAST father.
            father = abstractSyntax emptyNode 
               ifTrue: ['The topmost AST cannot be cut' printLine ]
               False: [
                "('Cut:' , theAST prettyPrint , 'From: ' , father prettyPrint ) printLine."
                abstractSyntax clipBoard: theAST.
                newNode: abstractSyntax unExpanded copy category: theAST superCategory.
                newNode category = 'exp' 
                   ifTrue: [ newNode comment: theAST comment copyWithBlanks].
                father replaceSon: theAST With: newNode.
                abstractSyntax clipBoard createStructureEditor: evt.
                father update: evt Editor: nil
              ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteAST: evt = ( |
             oe.
            | 
            theAST isDeletable
               ifTrue: ['do delete' printLine.
                  update: nil Editor: nil.
                ]
               False: [ cutAST: evt.]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: collaps & expand\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         doPretty: forSub Event: evt = ( |
             theStream.
             topPos.
            | 
            abstractSyntax seStack: list copyRemoveAll.
            topPos:
              forSub 
                ifTrue: [ abstractSyntax structureEditorStream newForSub: theAST position width]
                False: [ abstractSyntax structureEditorStream new: 30 Event: evt].
            theStream: 
               outerFrame asIsPP 
                 ifTrue: [ theAST asIsPP: topPos ]
                 False: [ theAST doPP: topPos ].
            "theStream currentRow insertMorphs."
            theStream currentColumn insertMorphs.
            abstractSyntax seStack: nil.
            theStream).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: printing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         doPrettyText = ( |
             theStream.
             topPos.
            | 
            abstractSyntax seStack: list copyRemoveAll.
            topPos: abstractSyntax pPStream copy width: 100.
            theStream: 
               outerFrame asIsPP 
                 ifTrue: [ theAST asIsPP: topPos ]
                 False: [ theAST doPP: topPos ].
            theStream).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: collaps & expand\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         doPrettyTop: evt = ( |
             newTf.
             of.
             pos.
             tf.
            | 
            tf: topFrame.
            pos: tf doPretty: true Event: evt. "this seems to give an extra frame"
            pos currentColumn morphsDo: [| :m | newTf: m].
            of: tf outerFrame.
            tf delete.
            newTf enclosingMorph: of.
            of addMorph: newTf.
            of layoutChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         drawBottomOn: c Box: box Color: col = ( |
            | 
            isLast ifTrue: [
               c line: box bottomRight To: box bottomLeft  Color: col
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         drawLeftOn: c Box: box Color: col = ( |
            | 
            isFirst && [theLink != nil ] && [theLink != self ]ifTrue: [
               c line: box topLeft     To: box bottomLeft + (0@4)  Color: col.
             ] False: [
               c line: box topLeft     To: box bottomLeft  Color: col.
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         drawRightOn: c Box: box Color: col = ( |
            | 
            c line: box topRight    To: box bottomRight Color: col).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         drawTopOn: c Box: box Color: col = ( |
            | 
            isFirst ifTrue: [
               c line: box topLeft     To: box topRight    Color: col
             ] False: [
            isAfterFirst ifTrue:[
                 c line: box topLeft     To: box topRight    Color: col
             ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         enclosingBorderWidth = ( |
            | 
            morphTypeName = 'structureEditorMorph'
               ifTrue: [ (0@0)]
               False: [ 
                 (borderWidth@borderWidth) 
                 +  enclosingMorph enclosingBorderWidth]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         endLink = ( |
             l.
             last.
             n.
             res.
            | 
            isEmpty 
              ifTrue: [
                "it is currently assumed that only the last ppFrameMorph
                 may be empty and therefore removed!"
                nil != theLink ifTrue: [
                   delete. "only necessary if pp/Row/Frame/Morphs 
                            added directly to the enclosing morph"
                   enclosingMorph morphs remove: self IfAbsent:[].
                   res: theLink endLink.
                ] False: [
                  '!!!!Should NOT happen: endLink is empty and theLink=nil' printLine.
                  res: self "??"
               ].
             ] False: [
               isLast: true.
               l: theLink.
               last: self.
               n: 100. "defensive hack - but should not be necessary"
               [(nil != l) && [n > 0] ] whileTrue: [
                  isMiddle ifTrue: [borderWidth: 0].
                  last: l.
                  l: l theLink.
                  n: n - 1 .
                ].
               last theLink: self.
               res: self.
              ].
            "checkLinks: res."
            ^res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: collaps & expand\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         expandAST = ( |
             theStream.
             topPos.
            | 
            "('Expand: ' , theAST prettyPrint ) printLine."
            theAST contracted: false.
            doPrettyTop: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: printing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         fileNameSheet = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> 'fileNameSheet' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: browsing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         implementors: evt = ( |
            | 
             evt sourceHand attach: (implementorsMorph copySelector: theAST selector Event: evt).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: basics\x7fComment: Returns true if the event (evt) is in the frame
of this morph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         inFrame: evt = ( |
             innerBounds.
            | 
            "('Event bounds: ' , evt bounds printString , ' : ' , evt cursorPoint printString , 
             ' Morph: ' , globalBounds printString , ' Position: ' , globalPosition printString) printLine.
            borderWidth printString printLine."
            "I think the next one should be 
             innerBounds: globalBounds + ((borderWidth@borderWidth) # ((0-borderWidth)@(0-borderWidth))).
             but that dont work??
            "
            innerBounds: globalBounds - ((borderWidth@borderWidth) # ((0-borderWidth)@(0-borderWidth))).
            "innerBounds printString printLine."
            (innerBounds includes: evt cursorPoint) ifTrue: [ ^false] False: [ ^true ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         inferTypes: evt = ( |
             if.
             m.
             obj.
             sel.
             slotAST.
            | 
            theAST isMethodSlot ifTrue: [ slotAST: theAST ]
              False: [
               "Then regularObject - go to enclosing method slot"
               slotAST: theAST father
             ].
            (checkIfTypeInfIsIn: evt) ifTrue: [
              ( 'Infer types: ', slotAST slotName) printLine.
              nil != inf currentTypeInfApplicationMorph
                 ifTrue: [ inf currentTypeInfApplicationMorph quit].
              m: abstractSyntax typeInfApplicationMorph copy: slotAST Editor: outerFrame.
              evt sourceHand attach: m.
              inf currentTypeInfApplicationMorph: m.
              m analyze.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fComment: Displays the inferred type of selected expression\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         inferredType: evt = ( |
             bc.
             if.
             methodMirr.
             mirr.
             mt.
             np.
             t <- ''.
             tf.
             tiAST.
             tim.
            | 
            tim: outerFrame theTypeInfMorph.
            nil != tim ifTrue: [
            tiAST: tim typeInferredMethodAST.
            (nil != tiAST) && [ theAST in: tiAST] && [ theAST != tiAST] ifTrue: [
                  tim inferredType: theAST Event: evt.
            [ if: inf interface.
              mt: outerFrame theTypeInfMorph typeInfTemplates.
              mirr: theAST enclosingObject theMirror.
              mirr isReflecteeBlock ifTrue: [
                   mirr: mirr valueSlot contents.
                   methodMirr: theAST enclosingMethodObject theMirror
                 ] False: [ methodMirr: mirr].
              (nil != mt) && [ methodMirr = mt first meth theMember] ifTrue: [
                 bc: theAST byteCodePos.
                 t: 'Type at: ' , bc printString .  
                 tf: if getTypeForExp: bc MethodMirror: mirr In: mt.
                 nil != tf ifTrue: [ np: 'Result type = ' , tf nicePrintString ]
                           False: [ np: 'An error will happen before this expression is executed!!' ].
               ] False: [ np: 'No type info available' ].
               (t , np) printLine.
               outerFrame showResultType: np.].
              ] False: [ tim removeResultType]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         insert: before Event: evt = ( |
             father.
             top.
            | 
            father: theAST enclosingListFather.
            "('addAfter:' , theAST prettyPrint , ' In: ', father prettyPrint) printLine."
            father insert: before At: theAST.
            "father prettyPrint printLine."
            father position currentColumn collapseAST: evt.
            father position currentColumn expandAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: morph manipulation\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         insertMorphs = ( |
            | 
            "('Frame:' , content) printLine."
            addAllMorphs: morphs.
            morphs: list copyRemoveAll.
            "morphs do: [| :m | m insertMorphs ]."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         isAfterFirst = ( |
            | 
            nil = theLink
              ifTrue: [^ false]
              False: [ ^theLink isFirst]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: collaps & expand\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         isAtLeft = ( |
            | 
            linksDo: [|:f|
               f positionInEditor x != 0
                 ifTrue: [ ^false]
             ].
            ^true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         isBeforeLast = ( |
            | 
            nil = theLink 
               ifTrue: [^false]
               False: [^false "temporarily"]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: basics\x7fComment: A frameMorph is empty if the
rowMorph it encloses has no submorphs.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         isEmpty = ( |
            | 
            morphsDo: [|:row | ^false "row isEmpty" ].
            morphs do: [|:row | ^false "row isEmpty" ].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         isFirst = ( |
            | 
            nil = theLink 
                ifTrue:  [ ^true]
                False: [ ^theLink isLast]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         isMiddle = ( |
            | 
            (isFirst || isAfterFirst || "isBeforeLast ||" isLast) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         leafMorphAt: pt = ( |
            | 
            (baseContainsPt: pt - owner globalPosition)
               ifTrue: [
                  morphsDo: [| :m |
                      m morphTypeName = 'structureEditorSubFrameMorph' 
                        ifTrue: [| leaf |
                          leaf: m leafMorphAt: pt.
                          nil != leaf ifTrue: [ ^leaf ]
                  ]].
                  ^self
              ] False: [^nil]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: events\x7fComment: Only pick-up if in frameBorder!
Otherwise no action.
I am not sure this is a good idea?
-- Olm, 1/9/95\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            (inFrame: evt )
              ifTrue: [resend.leftMouseDown: evt]
              False: [ ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         linkWith: f = ( |
            | 
            f theLink: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: selection\x7fComment: Iterates over all ppFrameMorph
that represents this AST.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         linksDo: blk = ( |
             link.
            | 
            blk value: self. 
            link: theLink.
            "the nil test should not be necessary"
            [(nil != link) && [link != self ]] 
              whileTrue: [ 
                 blk value: link. link: link theLink ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         markAST = ( |
             setColor.
            | 
            setColor: 
               [| :morph . :col |
                  morph != nil ifTrue: [
                    morph allMorphsDo: [| :m | 
                          (m morphTypeName = 'rowMorph' )
                          || [ m morphTypeName = 'ppFrameMorph']
                          ifTrue: [ m color: col]
                    ]]].
            setColor value: topFrame With: theAST position styles frameColor.
            setColor value: self With: theAST position styles selectionColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         markSelectors: anObj Templates: tps = ( |
             sty.
            | 'MarkSelectors' printLine.
            sty: anObj position styles.
            anObj markSelectors: [| :sel . :col . c| 
                   nil = col 
                       ifTrue: [ 
                         c: sty notFoundColor.
                         (sel prettyPrint , ' = NIL' ) printLine.
                       ] False: [ (sel prettyPrint , ' = ' , col) printLine ] .
                    case
                       if: [ col = 'green'] Then: [ c: sty localFoundColor ]
                       If: [ col = 'yellow'] Then: [ c: sty perhapsFoundColor ]
                       If: [ col = 'red' ] Then: [ c: sty notFoundColor ] .
                    nil != c ifTrue: 
                        [ sel position labelsDo: [| :lab | lab color: c]].
                   ]
                  Mirror: anObj theMirror 
                  Templates: tps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesToSelf: evt = ( |
             l.
             mts.
             s <- ''.
            | 
            mts: theAST messagesToSelf.
            l: list copyRemoveAll.
            mts do: [| :m |
               (l includes: m) ifFalse: [
                 l add: m.
                 s: s , m , '\n'
              ]].
            evt sourceHand attach:
                 (textViewerMorph
                       copyTitle: 'Messages to Self' Text: s)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: basics\x7fComment: Returns the ppFrameMorph of the nearest
enclosing method.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         methodFrame = ( |
            | 
            theAST isObject && [theAST father isMethodSlot] 
               ifTrue: [ ^self ]
               Fasle: [ ^owenr owner methodFrame]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
            | 
            evt shiftIsDown ifTrue: [ resend.middleMouseDown: evt
             ] False: [
              evt sourceHand subscribeUntilAllUp: self.

              theAST = abstractSyntax emptyNode
                ifTrue: [popUpMenu: evt]
                False: [
                   theAST contracted 
                     ifTrue: [ expandAST ]
                     False: [ popUpMenu: evt ]
               ].
             self.
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'structureEditorSubFrameMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         openAST: evt = ( |
            | 
            "theAST is an instance node"
            (abstractSyntax makeASTfromMirror: 
                reflect: theAST theInstance) 
                    createStructureEditor: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         openWholeObject: evt = ( |
            | 
            theAST root createStructureEditor: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: basics\x7fComment: Returns the structureEditorMorph enclosing 
the structure editor frames (ppFrameMorph\'s).\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         outerFrame = ( |
            | 
            "('outerFrame: ' , morphTypeName) printLine."
            (morphTypeName = 'structureEditorMorph' )
               ifTrue: [ ^self ]
               False: [ ^ enclosingMorph outerFrame ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'rectiLinearPolygonMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: text editing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         parseText: evt IfFail: blk = ( |
             ue.
            | 
            ue: enclosingMorph lastMorph.
            "('Accept: ' , theAST  prettyPrint) printLine.
             ('text:' , ue contentsString )  printLine."
            "ue: theAST position uglyEditor."
            theAST 
               parseString: ue text contentsString 
               IfFail: [| :e . errorStart. errorEnd |
                  evt sourceHand attach: syntaxErrorMorph copyMessage: e printString.
                  errorStart: e errorColumn pred @ e errorLine pred.
                  errorEnd: e scannerColumn pred @ e scannerLine pred.
                  ue text selectionStart: errorStart End: errorEnd.
                  blk value
               ].
            update: evt Editor: ue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: edit\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         pasteAST: evt = ( |
             father.
             newSon.
             oldSon.
            | 
            "theAST prettyPrint printLine."
            father: theAST father.
            father = abstractSyntax emptyNode 
               ifTrue: ['The topmost AST cannot be pasted' printLine ]
               False: [
                  oldSon: theAST.
                  newSon: abstractSyntax clipBoard.
                  father replaceSon: theAST With: newSon.
                  abstractSyntax clipBoard: oldSon.
                  oldSon isUnexpanded ifFalse:
                     [oldSon createStructureEditor: evt].
                  update: evt Editor: nil.
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         popUpMenu: evt = ( |
             menu.
             target.
            | 
            target: self.
            menu: ui2Menu copy.
            menu color: paint copyRed: 0.900293 Green: 0.855327 Blue: 0.72043.
            (morphTypeName = 'structureEditorMorph') && [ inFrame: evt]  
              ifTrue: [ buildTopMenu: menu ] "Now in structureEditorMorph"
              False: [
                 nil = outerFrame currentSelection
                     ifTrue: [ menu addButtonTarget: nil Label: 'NO SELECTION!' ] 
                     False: [ target: buildMainMenu: menu ]
            ].
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            (menu copy retargetButtonsTo: target) popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: basics\x7fComment: When bezel/insetBezel, the width of the frame
must be considered to determine if a frame
is to the left in the editor.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         positionInEditor = ( |
            | 
            morphTypeName = 'structureEditorMorph'
               ifTrue: [ (0@0) ]
               False: [
                globalPosition
                 - enclosingMorph "!enclosingMorph" enclosingBorderWidth
                 - outerFrame globalPosition
                 - outerFrame borderWidth
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: collaps & expand\x7fComment: For test purposes\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         positionOfThis = ( |
            | 
            'Positon of selection:' printLine.
            linksDo: [| :f |
             (f positionInEditor printString
              , ' ' , f content) printLine ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: printing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         printOnFile: evt = ( |
             first <- bootstrap stub -> 'globals' -> 'true' -> ().
             frame.
             pos.
             theAST.
            | 
            "Note: since structureEditorMorph inherits from ppFrameMorph
             the ppFrameMorph version of printOnFile:evt is called when
             printing. Not this one! Ugly."
            morphsDo: [| :f | "See method topFrame"
              f morphTypeName printLine.
                 f morphTypeName = 'structureEditorSubFrameMorph' ifTrue:
                   [ first ifTrue: [
                       theAST: f theAST.
                       frame: f.
                       first: false
                     ] False: [ "f delete"]
            ]].
            frame collapseAST: evt.
            theAST setContraction: false.
            pos: doPrettyText.
            theAST setContraction: true.
            " printOnFile defines positions in AST to be instances 
              of position. expandAST updates these to ppMorphStream instances"
            frame expandAST.
            evt sourceHand attach:
                abstractSyntax 
                  propertySheetMorph copy: 'Structure editor' 
                                   Source: fileNameSheet copyText: pos text).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: morph manipulation\x7fComment: Remove this morph, and remove enclosing morphs
(row and frame) if it becomes empty.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         removeAllMorphsInLinks = ( |
            | 
            linksDo: [|:f| 
               f = self 
                 ifTrue: [ f removeAllMorphs]
                 False: [ f removeSelfAndEnclosingMorphs]
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: morph manipulation\x7fComment: Remove this morph and remove it 
from \'theLink\' list.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         removeMorph = ( |
             pred.
            | 
            pred: theLink.
            [(nil != pred) && [pred theLink != self ]]
              whileTrue: [ pred: pred theLink].
            nil != pred ifTrue: [pred theLink: self theLink].
            delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: morph manipulation\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         removeSelfAndEnclosingMorphs = ( |
             em.
            | 
            removeAllMorphs.
            removeMorph.
            em: enclosingMorph.
            nil != em ifTrue: [
                em " a row" isEmpty ifTrue: [ em delete].
                em: em enclosingMorph " a frame".
                "('Remove: ' , em content) printLine."
                em isEmpty ifTrue: [ em  removeSelfAndEnclosingMorphs ]
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: browsing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         senders: evt = ( |
            | 
            evt sourceHand attach: (
              sendersMorph copySelector: theAST selector Event: evt).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         setColor: col = ( |
             f.
             first <- bootstrap stub -> 'globals' -> 'true' -> ().
            | 
            allMorphsDo: [| :m | 
               (m morphTypeName = 'structureEditorSubFrameMorph')
                 ifTrue: [m color: col ]].
            "f: self.
            [first || [(f !=nil) && [f != self]]] whileTrue: [
               first: false.
               f allMorphsDo: [| :m | 
                    (m morphTypeName = 'structureEditorSubFrameMorph')
                 ifTrue: [ m color: col]
             ].
             f: f theLink.
            ]").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fComment: 
-- Olm, 1/17/95\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         showInferredTypes: evt = ( |
             slotAST.
            | 
            theAST isMethodSlot ifTrue: [ slotAST: theAST ]
              False: [
               "Then regularObject - go to enclosing method slot"
               slotAST: theAST father
            ].
            nil != inf currentTypeInfApplicationMorph 
                ifTrue: [
                  inf currentTypeInfApplicationMorph 
                      showInferredTypes: slotAST
                      Editor: outerFrame.
            ] False: [ 'No type inference information available' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: basics\x7fComment: Returns the slotOutliner of which this ppFrameMorph
is a part. \x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         slotOutliner = ( |
             out.
            | 
            out: outerFrame.
            [out morphTypeName != 'slotOutliner']
               whileTrue: [
                  out: out owner.
                  nil = out ifTrue: ['OOPS: not in outliner' printLine]
               ].
            out).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: checking\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         testMorph = ( |
             l.
             m.
            | 
            m: frameMorph copy.
            l: labelMorph copy label: 'Hello world'.
            m addMorphLast: l.
            l: labelMorph copy label: 'How are you?'.
            m addMorphLast: l.
            l: labelMorph copy label: 'Fine thaks!'.
            m addMorphLast: l.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: text editing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         textEditAST: evt = ( |
             ow.
             sa.
             sb.
             thePos.
             ue.
            | 
            topFrame != self ifTrue: [ topFrame textEditAST: evt 
             ] False: [
              theAST setContraction: false.
              ue: uglyTextEditorMorph
                  copyString: theAST prettyPrint
                  Target: self
                  Accept: textEditAccept
                  Cancel: textEditCancel
                  Style: "ui2" slotOutliner preferences.
              ue resizeToText.
              outerFrame currentSelection: nil.
              ow: enclosingMorph.
              delete.
              ow addMorph: ue.
              self.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: text editing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         textEditAccept = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> 'textEditAccept' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: text editing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         textEditCancel = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'ppFrameMorph' -> 'textEditCancel' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: basics\x7fComment: Returns the ppFrameMorph corresponding
to the root of the AST.
NB! There used to be one frame and one row
corresponding to the root. This may no longer
be true with asIsPP. At leats for methods in outliners
there seem to be a lits of frames/rows.
For an editor on a whole object there ssem to be
an enclosing frame/row.
This should be cleaned up.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         topFrame = ( |
            | 
            enclosingMorph morphTypeName = 'structureEditorMorph'
               ifTrue: [ self ]
               False: [| tf | 
                  tf: enclosingMorph topFrame.
                  tf = nil ifTrue: [ self ] False: [tf ]
               ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: updating\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         update: evt Editor: ue = ( |
             pos.
             theSlot.
            | 
            "passing ue to update:Editor should not be needed, since the syntax
             of the modified code was checked above. And if an error is discovered
             during update, ue will not mark it correctly since update parses the whole
             method body and not just the part that has been texdt-edited."
            theSlot: theAST update: evt Editor: ue.
            "('Update: ' , theSlot prettyPrint) printLine."
            "If no position in theSlot, then probably a 
             structureEditor on a morph in an outliner"
            theSlot position = abstractSyntax emptyPPStream ifTrue: [| ol |
               pos: theSlot method position.
               ol: slotOutliner.
               ol itemsCached: false.
               ol collapse: evt.
               ol expand: evt.
              ] False: [ 
                theSlot position currentColumn collapseAST.
                theSlot position currentColumn expandAST
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | 
            "it should also be checked that the dropped morph
             has the same category as the unexpanded node.
             I.e. slots may be droped on slot,
             and exps may be droped on exp"
            theAST category = 'literal' ifTrue:[ theAST theNumber printLine].
            (m morphTypeName = 'structureEditorMorph')
             &&
             [(theAST isUnexpanded 
              || [( theAST category = 'literal') && [theAST theNumber = '\'<exp>\'' ]]
              )
              || [( theAST category = 'dataSlot') 
                 ]
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         xXXdropEvent: e OnSubmorphsAt: globalPt IfHandled: handledBlock = ( |
            | 
            e middleMouseDown  ifTrue: [
              middleMouseDown: e.
              handledBlock value].

            resend.dropEvent: e OnSubmorphsAt: globalPt IfHandled: handledBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         xbaseDrawBezelStyleOn: c = ( |
             b.
             box.
             l.
             r.
             shades.
             t.
             w.
             xList.
             yList.
            | 
            "missing initialization ofXlist and yList "
            box: baseBounds.
            t: box top.  b: box bottom.  l: box left.  r: box right.
            w: borderWidth.
            shades: shadesForColor.

            xList: vector copySize: 4.
            yList: xList copy.

            "top"
            xList at: 0 Put: l.      yList at: 0 Put: t.
            xList at: 1 Put: r.      yList at: 1 Put: t.
            xList at: 2 Put: r - w.  yList at: 2 Put: t + w.
            xList at: 3 Put: l + w.  yList at: 3 Put: t + w.
            c fillPolygonXs: xList Ys: yList Color: shades mediumHilight.

            "bottom"
            xList at: 0 Put: l + w.  yList at: 0 Put: b - w.
            xList at: 1 Put: r - w.  yList at: 1 Put: b - w.
            xList at: 2 Put: r.      yList at: 2 Put: b.
            xList at: 3 Put: l.      yList at: 3 Put: b.
            c fillPolygonXs: xList Ys: yList Color: shades mediumShadow.

            "left"
            xList at: 0 Put: l.      yList at: 0 Put: t.
            xList at: 1 Put: l + w.  yList at: 1 Put: t + w.
            xList at: 2 Put: l + w.  yList at: 2 Put: b - w.
            xList at: 3 Put: l.      yList at: 3 Put: b.
            c fillPolygonXs: xList Ys: yList Color: shades lightHilight.

            "right"
            xList at: 0 Put: r - w.  yList at: 0 Put: t + w.
            xList at: 1 Put: r.      yList at: 1 Put: t.
            xList at: 2 Put: r.      yList at: 2 Put: b.
            xList at: 3 Put: r - w.  yList at: 3 Put: b - w.
            c fillPolygonXs: xList Ys: yList Color: shades darkShadow.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         xbaseDrawLineStyleOn: c = ( |
             box.
             shades.
            | 
            "sMiddle ifTrue: [  borderWidth: 0 is DONE in endLink
               borderWidth: 0. ^self.
               rawBox: baseBounds topLeft ## (baseBounds size - (0@2)) 
             ]."
            box: baseBounds topLeft ## (baseBounds size - (1@1)).

            shades: shadesForColor.
            frameStyle = bezelStyle ifTrue: [
              drawTopOn: c Box: box Color: shades lightHilight.
              drawLeftOn: c Box: box Color: shades lightHilight.
              drawRightOn: c Box: box Color: shades darkShadow.
              drawBottomOn: c Box: box Color: shades darkShadow.
            ] False: [
                c line: box topLeft     To: box topRight    Color: shades darkShadow.
                c line: box topLeft     To: box bottomLeft  Color: shades darkShadow.
                c line: box topRight    To: box bottomRight Color: shades lightHilight.
                c line: box bottomRight To: box bottomLeft  Color: shades lightHilight.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         xbaseDrawOn: c = ( |
            | 
            "Draw a frame around my contents. If filled is false, only the
             frame itself is drawn, leaving the center empty. Presumably this
             space will be filled by the frame's contents."
            "Optimizations:
                1. if the borderWidth is zero, draw nothing
                2. if the borderWidth is one and the frameStyle is not flat,
                   draw the bezel using one-pixel lines."
            "isMiddle ifTrue: [ borderWidth: 0 ]."
            filled ifTrue: [ c fillRectangle: baseBounds Color: color ].

            0 = borderWidth              ifTrue: [ ^self ].
            frameStyle =       flatStyle ifTrue: [ ^baseDrawFlatStyleOn:       c ].
            1 = borderWidth              ifTrue: [ ^baseDrawLineStyleOn:       c ].
            frameStyle =      bezelStyle ifTrue: [ ^baseDrawBezelStyleOn:      c ].
            frameStyle = insetBezelStyle ifTrue: [ ^baseDrawInsetBezelStyleOn: c ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: style\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         xxxdoBezelStyle = ( |
            | setStyle: bezelStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: style\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         xxxdoFlatStyle = ( |
            | 
            setStyle: flatStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: style\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         xxxdoInsetBezelStyle = ( |
            | setStyle: insetBezelStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'structureEditorSubFrameMorph' -> () From: ( | {
         'Category: menu actions\x7fCategory: style\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         xxxsetStyle: style = ( |
             bor.
             pref.
            | 'Set style' printLine.
            pref: abstractSyntax morphPPStream styles.
            bor: pref defaultBorderWidth: style.
            allMorphsDo:  [| :m |
              m morphTypeName = 'ppFrameMorph'
               ifTrue: [
                    m frameStyle: style.
                    m borderWidth: bor.
                    "m layoutChanged"
               ]. 
               m flushLayoutCaches
            ].
            pref frameStyle: style.
            pref frameBorder: bor.
            layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'uglyEditorPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         , t = ( |
             p.
            | 
            p: + t size. 
            (p uglyEditor) text appendString t.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'uglyEditorPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         break: size Next: next Indent: indent Break: break = ( |
             newPos <- 0.
             s <- ''.
            | 

            break || [ ( col + size + next )  >  width ]  ifTrue: [
                 s:  '\n',  ('' copySize: indent col FillingWith: ' ').
                 newPos:  newLine: indent col.
            ] False: [
                 s: '' copySize: size FillingWith: ' '.
                 newPos: + size.
            ].
            uglyEditor text appendString: s.
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'uglyEditorPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: private'
        
         new: w = ( |
             p.
            | 
            p: newForSub: w 
               Target: nil 
               Accept: nil 
               Cancel: nil.
            desktop w addMorph: p uglyEditor.
            desktop w moveToFront: p uglyEditor.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'uglyEditorPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         newForOutliner: w = ( |
             p.
            | p: copy .
            p uglyEditor: abstractyntax myUglyMethodEditorMorph
                      copyString: '' 
                         Style: outlinerPreferences.
            'add to world' printLine.
            p width: w.
            p uglyEditor setWidth: w * 6 Height: 650.
            desktop w addMorph: p uglyEditor.
            desktop w moveToFront: p uglyEditor.
            'done' printLine.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'uglyEditorPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         newForSub: w Target: tar Accept: acc Cancel: can = ( |
             p.
            | p: copy .
            "p uglyEditor: 
               abstractSyntax myUglyEditor 
                   copyString: '' Style: outlinerPreferences."
            p uglyEditor: 
                abstractSyntax ppUglyEditorMorph
                     copyString: ''
                     Target: (tar = nil ifTrue: [p] False: [tar])
                     Accept: acc
                     Cancel: can
                      Style: "ui2" slotOutliner preferences.
            p width: w.
            p uglyEditor setWidth: w * 6 Height: 650.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'uglyEditorPPStream' -> () From: ( | {
         'ModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fCategory: structure editor\x7fComment: Multiply the width and height of
all submorphs and this morph with
sw and sh and thereby scale its size.
May hit the limits set by baseMinHeight
and baseMinWidth.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         doScaleToWidth: sw Height: sh = ( |
             newHeight.
             newWidth.
            | 
            morphsDo: [|:m| m doScaleToWidth: sw Height: sh].
            newWidth: (width asFloat * sw) asInteger.
            newHeight: (height asFloat * sh) asInteger.
            newWidth < baseMinWidth ifTrue: [
                 ('Cannot shrink width: (', morphTypeName , ')' 
                  , newWidth printString, '/' , baseMinWidth printString) printLine
              ].
            newHeight < baseMinHeight ifTrue: [
                 ('Cannot shrink height: (', morphTypeName , ')' 
                  , newHeight printString, '/' , baseMinHeight printString) printLine
              ].
            setWidth:  newWidth Height: newHeight.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fCategory: structure editor\x7fComment: The actual height of this morph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
             b.
            | 
            b: bounds.
            b corner y - b origin y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: geometry\x7fCategory: structure editor\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         lowerRight = ( |
            | 
            bounds right).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fCategory: structure editor\x7fComment: This is an attempt to define a method
that actually sets the width and height of a morph
to w and h, even if the submorphs are rigid and
needs more space than w and h.
The method computes relative scale factors and 
apply them to all submorphs.
It, however, only works partially!
Some morphs have non-assignable baseMinHeight and baseMinWidth,
and it is not possible to scale below these sizes,
see e.g. sliderMorph.\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         scaleToWidth: w Height: h = ( |
             sh.
             sw.
            | 
            sw: w asFloat / width asFloat. sw printString printLine.
            sh: h asFloat / height asFloat.
            doScaleToWidth: sw Height: sh).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fCategory: structure editor\x7fComment: The actual width of this morph\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
             b.
            | 
            b: bounds.
            b corner x - b origin x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: abstract syntax\x7fComment: Return last line if more than one line
of string before this exp\x7fModuleInfo: Module: structureEditing InitialContents: FollowSlot'
        
         forASTBlanks = ( |
             moreThanOneLine <- bootstrap stub -> 'globals' -> 'false' -> ().
             s <- ''.
            | 
            0 to: size - 1 Do: [|:i . ch|
              ch: at: i.
              case 
               if: [ch = '#'] Then: [    
                   moreThanOneLine ifTrue: [ ^s ]
                   False: [ ^'' ]]
               If: [ ch = '\n' ] Then: [ 
                   s: '\n' . moreThanOneLine: true.]
               Else: [ s: s , ch ]
            ].
            ^'').
        } | ) 



 '-- Side effects'

 globals modules structureEditing postFileIn
