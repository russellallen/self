 '$Revision: 30.15 $'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Outliner Framework (obsolete)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         outliner = bootstrap define: bootstrap stub -> 'globals' -> 'outliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'borderWidth' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'outliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals outliner.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: borderWidth parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outliner' -> () From: ( | {
         'Category: Outliner Morph State\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         body.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outliner' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: outliner InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         borderWidth <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outliner' -> () From: ( | {
         'Category: Outliner Morph State\x7fModuleInfo: Module: outliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         columnUnderHeader.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outliner' -> () From: ( | {
         'Category: Outliner Morph State\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         expander.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outliner' -> () From: ( | {
         'Category: Outliner Morph State\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         header.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outliner' -> () From: ( | {
         'Category: Outliner Morph State\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         items.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outliner' -> () From: ( | {
         'Category: expand state\x7fModuleInfo: Module: outliner InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         itemsCached <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outliner' -> () From: ( | {
         'Category: Outliner Morph State\x7fModuleInfo: Module: outliner InitialContents: InitializeToExpression: (labelMorph copy)'
        
         moduleLabel <- labelMorph copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Outliner Framework (deprecated)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         outliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( |
             {} = 'Comment: This object represents a general outliner.
Items are typically those shown when I am expanded.\x7fModuleInfo: Creator: traits outliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outliner' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'outliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outliner' -> () From: ( | {
         'Category: Outliner Morph State\x7fModuleInfo: Module: outliner InitialContents: InitializeToExpression: (morph copy)'
        
         tag <- morph copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: expanding and collapsing\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addBodyMorph = ( |
            | 
            columnUnderHeader addMorphFirst: body.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addButtonsToHeader = ( |
             bs.
            | 
            bs: buildHeaderButtons.
            bs isEmpty ifFalse: [
              header addMorphLast: flexibleSpacer copy.
              header addAllMorphs: bs.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addExpander = ( |
            | 
            header addMorphFirst: expander.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: adding & removing items in my expansion (called by children)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addItem: item = ( |
            | 
            addItemLast: item).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: adding & removing items in my expansion (called by children)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addItem: it After: a = ( |
             m.
            | 
            m: items morphs asSequence.
            m findFirst: [|:mm| mm = a]
              IfPresent: [|:mm. :i| 
                m insert: it At: i succ IfAbsent: [m addLast: it]]
              IfAbsent: [m addFirst: it].
            safelyDo: [items removeAllMorphs. items addAllMorphs: m].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: adding & removing items in my expansion (called by children)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addItem: it Before: b = ( |
             m.
            | 
            m: items morphs asSequence.
            m findFirst: [|:mm| mm = b]
              IfPresent: [|:mm. :i| m insert: it At: i]
               IfAbsent: [m addLast: it].
            safelyDo: [items removeAllMorphs. items addAllMorphs: m].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: adding & removing items in my expansion (called by children)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addItemFirst: item = ( |
            | 
            items addMorphFirst: item.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: adding & removing items in my expansion (called by children)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addItemLast: item = ( |
            | 
            items addMorphLast: item.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: adding & removing items in my expansion (called by children)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addItems: it = ( |
            | 
            it isEmpty ifTrue: [^self].
            items ifNil: [buildBody].
            items addAllMorphs: it.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildButtonLabeled: lbl Script: s IsAsync: isa = ( |
            | 
            ((((ui2Button copy label: lbl
                           FontSpec: headerButtonFontSpec
                          FontColor: preferredTitleColor)
             script: s)
             isAsynchronous: isa)
             color: preferredHeaderColor)
             target: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: building\x7fComment: Construct list of buttons to go into header.
Based on headerButtonContents\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildHeaderButtons = ( |
             buttons.
             hbc.
            | 

            hbc: headerButtonContents.
            buttons: vector copySize: hbc size.
            hbc do: [ |:ls. lbl. scrpt. :i. isa <- false|
              lbl: ls x.
              scrpt: ls y.
              scrpt first = 'A' ifTrue: [
                scrpt: scrpt copyWithoutFirst.
                isa: true.
              ].
              buttons at: i  Put: 
                buildButtonLabeled: lbl Script: scrpt IsAsync: isa.
            ].
            buttons).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildItemsHolder = ( |
            | 
            items: columnMorph copy color: (paint named: 'transparent').
            items  borderWidth: 0.
            items  leftJustify.
            items  beFlexible.
            items).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: building\x7fComment: The title is the string in the header.
Overridden to, for example, make the title editable.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTitle = ( |
            | 
            (labelMorph copyLabel: titleString)
              fontSpec: fontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: expanding and collapsing\x7fComment: Override & extend if necessary.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         collapse: evt = ( |
            | 
            isExpanded ifTrue: [
              hasCounterfactualItem ifTrue: [ 
                  expander isExpanded ifFalse: [expander expand: evt].
                  warnCounterfactualIfAbort: [^ self].
              ].
              expander isExpanded ifTrue: [ expander collapse: evt].
              columnUnderHeader removeMorph: body.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: expanding and collapsing\x7fCategory: multiple levels\x7fComment: Override to collapse extra things
such as annotations, comments, etc.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseAll: evt = ( |
            | 
            isExpanded ifTrue: [
               suboutliners do: [|:o| o collapseAll: evt]].
            collapse: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         colorForTag = ( |
            | 
            paint named: 'outlinerGray').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: expanding and collapsing\x7fCategory: intended to be overriden\x7fComment: Override to add (boxed) items
to me when expanding.
But some children use the updating mechanism instead.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         constructBoxedItems = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: expanding and collapsing\x7fCategory: intended to be overriden\x7fComment: Override to add (unboxed) items
to me when expanding.
But some children use the updating mechanism instead.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         constructItems = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: copying (part of morph copying frameword)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            copyRemoveAllMorphs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         dismissButtonContents = ('X')@('target animatedDelete').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: expanding and collapsing\x7fComment: Override & extend if necessary.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         expand: evt = ( |
            | 
            expander isNil || [isExpanded]  ifFalse: [
              expander isExpanded  ifFalse: [ expander expand: evt ].
              itemsCached ifFalse: [
                buildBody.
                constructItems.
                constructBoxedItems.
                itemsCached: true.
              ].
              safelyDo: [
                addBodyMorph.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: expanding and collapsing\x7fCategory: multiple levels\x7fComment: Multilevel expand.
Override in leaves that contain outliners
that should not expand.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         expandAll: evt = ( |
            | 
            isExpanded ifFalse: [ expand: evt].
            suboutliners do: [|:o| o expandAll: evt].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: building\x7fCategory: building blocks (never overridden)\x7fModuleInfo: Module: outliner InitialContents: InitializeToExpression: (spacerMorph copy beFlexible baseMinWidth: 5)\x7fVisibility: private'
        
         flexibleSpacer = spacerMorph copy beFlexible baseMinWidth: 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: expanding and collapsing\x7fComment: Outliners that rely on caching their expansion
items flush the cache thussly.
Not overridden, but is called by children.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         flush: evt = ( |
            | 
            isExpanded ifTrue: [ collapse: evt. ].
            itemsCached: false.
            body ifNotNil: [ removeMorph: body ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: copying (part of morph copying frameword)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         hackCopy = ( |
            | copyUsingMap: (0 = morphCount ifTrue: nil False: [dictionary copyRemoveAll])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: counterfactualism\x7fComment: Used to prevent closing an outliner with unsaved changes.
Service routine, not intended to be overriden.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         hasCounterfactualItem = ( |
            | 
            items ifNil: [ ^ false ].
            items morphsDo: [|:it| it isCounterfactual  ifTrue: [ ^ true]].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: building\x7fComment: Return a vector of points, one
per button to go at top right of outliner.
Each point contains the button\'s label and script.
Likely to be overridden.
Hack for asynchronous buttons: start script with an \"A\"\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         headerButtonContents = ( |
            | 
            vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: outliner InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         indentSubParts = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
             cm.
             rm.
            | 
            color: preferredColor. 
            removeAllMorphs.
            rm: rowMorph copy beFlexible borderWidth: 0.
            rm color: (paint named: 'transparent').
            tag: spacerMorph copyH: 3 Color: colorForTag.
            rm addMorphFirst: tag.

            cm: columnMorph copy beFlexible borderWidth: 0.
            cm color: (paint named: 'transparent').
            columnUnderHeader: newColumnUnderHeader.
            cm addMorphLast: columnUnderHeader.
            cm addMorphFirst: buildHeader.
            rm addMorphLast: cm.

            addMorphLast: rm.

            recolor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: type tests (should override some)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isCategoryOutliner = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: counterfactualism\x7fComment: Override with disjunction if
outliner has non-items that might be counterfactual.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isCounterfactual = ( |
            | hasCounterfactualItem).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: type tests (should override some)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isEntryOutliner = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: expanding and collapsing\x7fCategory: probably would not override\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isExpanded = ( |
            | 
            body isNotNil && [columnUnderHeader morphs includes: body]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: type tests (should override some)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isObjectOutliner = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: type tests (should override some)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isOutliner = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: type tests (should override some)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isPseudoCategoryOutliner = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: type tests (should override some)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isSlotOutliner = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: type tests (should override some)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isSlotsOutliner = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: copying (part of morph copying frameword)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: header             IsPresentDo: [|:n| header:            n].
            dict if: body               IsPresentDo: [|:n| body:              n].
            dict if: items              IsPresentDo: [|:n| items:             n].
            dict if: expander           IsPresentDo: [|:n| expander:          n].
            dict if: columnUnderHeader  IsPresentDo: [|:n| columnUnderHeader: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         meAndAllSuboutlinersDo: blk = ( |
            | 
            items isNotNil ifTrue: [
              items morphsDo: [|:o|
                o isOutliner ifTrue:[ o meAndAllSuboutlinersDo: blk]
              ]
            ].
            blk value: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: type tests (should override some)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         newColumnUnderHeader = ( |
             c.
            | 
            c: columnMorph copy.
            c beFlexible.
            c leftJustify.
            c borderWidth: 0.
            c baseMinHeight: 0.
            c color: (paint named: 'transparent').
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         preferences = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: building\x7fCategory: should be overridden\x7fModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         preferredTitleColor = paint named: 'transparent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: adding & removing items in my expansion (called by children)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         removeAllItems = ( |
            | 
            items ifNotNil: [ items removeAllMorphs ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         removeExpander = ( |
            | 
            header removeMorph: expander.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: adding & removing items in my expansion (called by children)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         removeItem: item = ( |
            | items removeMorph: item. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: building\x7fCategory: building blocks (never overridden)\x7fModuleInfo: Module: outliner InitialContents: InitializeToExpression: (spacerMorph copyH: 11 Color: paint named: \'black\')\x7fVisibility: private'
        
         rigidSpacer = spacerMorph copyH: 11 Color: paint named: 'black'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: expanding and collapsing\x7fCategory: multiple levels\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         suboutliners = ( |
             r.
            | 
            r: list copyRemoveAll.
            items isNotNil && isExpanded ifTrue: [
              items morphsDo: [|:o|
                o isOutliner ifTrue: [ r addLast: o]].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: building\x7fCategory: should be overridden\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | 
            statePrintString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: expanding and collapsing\x7fCategory: probably would not override\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         toggleExpandState = ( |
            | 
            toggleExpandState: ui2Event copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: expanding and collapsing\x7fCategory: probably would not override\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         toggleExpandState: evt = ( |
            | 
            isExpanded ifTrue: [collapse: evt] False: [expand: evt].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: updating\x7fComment: update the whole
enchilada now!
Rarely overridden.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         update = ( |
             q.
            | 
            q: list copyRemoveAll add: self.
            [ | qq |
              qq: list copyRemoveAll.
              q do: [|:e| e updateDo: [|:n| qq addLast: n]].
              qq isEmpty ifTrue: [^ self].
              q: qq.
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: updating\x7fCategory: should override\x7fComment: Updates this level of the outliner and
invokes blk with an argument that is the next
part of the outliner to update.
The block typically squirrels away its argument
for updating later--this is how we slice
the updating salami.
Override this method to do your updates.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         updateDo: blk = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: updating\x7fComment: Make expander appear/dissappear
when there are items to see.
Only used by certain children.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateExpander = ( |
            | 
            updateExpander:  items morphCount != 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: updating\x7fComment: Make expander appear/dissappear
when there are items to see.
Only used by certain children.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateExpander: shouldHaveExpander = ( |
            | 
            expander owner ifNil: [
              shouldHaveExpander  ifTrue: [    addExpander ]
            ]
            IfNotNil: [
              shouldHaveExpander ifFalse: [ removeExpander ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: counterfactualism\x7fComment: Could be overridden, but not usually.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         warnCounterfactualIfAbort: abortBlock = ( |
             se.
            | 
            [
              "cannot do this because of being in the wrong process"
              (
               userQuery askYesNo: 'There are unsaved changes.\n',
                                   'Please accept or cancel them by hitting the green or red button.\n',
                                   'Or hit Yes to procede anyway (and lose changes)'.
              ) ifTrue: abortBlock False: [self]
            ].

            se: syntaxErrorMorph copyTitle: 'There are unsaved changes.'
                                   Message: 'Please accept or cancel them by hitting the green or red buttons.'.
            safelyDo: [ 
              world addMorph: se.
              world moveToFront: se.
              se globalPosition: globalPosition.
              se changed.
            ].
            abortBlock value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: reopening the world\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         worldHasReopened = ( |
            | 
            "must fix cached text editors"
            itemsCached && [ expander isExpanded not ]  ifTrue: [
              body allMorphsDo: [|:m| m worldHasReopened]
            ].
            resend.worldHasReopened).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Outliner Framework (obsolete)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         nonpluggableOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'nonpluggableOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals outliner copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'nonpluggableOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals nonpluggableOutliner.

CopyDowns:
globals outliner. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: Nonpluggable Outliner State\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         boxedFrame.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: Nonpluggable Outliner State\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         boxedItems.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Outliner Framework (deprecated)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         nonpluggableOutliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits nonpluggableOutliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nonpluggableOutliner' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: adding & removing boxed items in my expansion (called by children)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addBoxedItem: item = ( |
            | 
            0 = boxedItems morphCount ifTrue: [
              items addMorphLast: boxedFrame.
            ].
            boxedItems addMorphLast: item.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: adding & removing boxed items in my expansion (called by children)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addBoxedItemFirst: item = ( |
            | 
            0 = boxedItems morphCount ifTrue: [
              items addMorphFirst: boxedFrame.
            ].
            boxedItems addMorphFirst: item.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: adding & removing boxed items in my expansion (called by children)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addBoxedItems: it = ( |
            | 
            it isEmpty ifTrue: [^self].
            0 = boxedItems morphCount ifTrue: [
              items addMorphLast: boxedFrame.
            ].
            boxedItems addAllMorphs: it.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: override these\x7fComment: Override to add appropriate buttons
to your menu.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addButtonsTo: menu = ( |
            | 
            "caller must have called
             createCachedButtons first"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: preferences (override for variation)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         annotationInfoStyle = ( |
            | 
            preferences annotationInfoStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: building\x7fComment: The body is the part created when you
expand the outliner.
Can be overridden and extended to
add e.g., module summary.
The body includes items (unboxed) followed by
boxedItems.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildBody = ( |
            | 
            body: rowMorph copy color: color.
            body  borderWidth: 0.
            body  beFlexible.

            buildItemsHolder.

            boxedItems: columnMorph copy color: color.
            boxedItems  borderWidth: 0.
            boxedItems  leftJustify.
            boxedItems  beFlexible.

            boxedFrame: frameMorph copy color: color.
            boxedFrame  borderWidth: 0. "RANDY HACK"
            boxedFrame  frameStyle: insetBezelStyle.
            boxedFrame  beFlexible.
            boxedFrame  addMorphLast: boxedItems.

            indentSubParts ifTrue: [
              body addMorphLast: rigidSpacer copy color: color
            ].
            body addMorphLast: items.
            body).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: building\x7fComment: The expander is the button you press
to expand/collapse the outliner.
Usually a triangle.
Overridden to provide different appearance:
method button for slot outliner, buttons for
index outliner. 
Index outliner should probably use something else.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildExpander = ( |
            | 
            expander: (expanderMorph copyTarget: self Action: expanderAction).
            expander).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: building\x7fComment: The header is the top part of the outliner
that you see even when it is collapsed.
This version builds a default header with an
expander and a title.
Overridden to get a different header.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildHeader = ( |
            | 
            header: outlinerHeader copyTarget: self 
                                        Style: preferences.
            header addMorphLast: buildExpander.
            header addMorphLast: buildTitle.
            addButtonsToHeader.
            header).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: should not need to override\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonPrototype = ( |
             b.
            | 
            b: ui2Button copy.
            b color: menuColor.
            b label: '' FontSpec: ui2Menu defaultFontSpec FontColor: ui2Menu defaultFontColor.
            b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: override these\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         createCachedButtons = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: override these\x7fComment: Override me with same thing so
each type of outliner remembers its own
default menu button, from the previous time.\x7fModuleInfo: Module: outliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: preferences (override for variation)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         expandWhenSprouted = ( |
            | 
            preferences expandWhenSprouted).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: building\x7fComment: Holds method that reacts
to expander button.
Overriden (rarely) to come between pressing 
and calling \"expand:\"\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         expanderAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> 'expanderAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits nonpluggableOutliner expanderAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> 'expanderAction' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            source isExpanded
              ifTrue: [ evt leftDoubleClick ifTrue: [target expandAll: evt]
                                             False: [target expand:    evt].
                        target world moveOutlinerToFront: target]
               False: [ evt leftDoubleClick ifTrue: [target expand: evt. "gak! must expand to collapse"
                                                     target collapseAll: evt]
                                              False:[target collapse: evt]].
            target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: preferences (override for variation)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         fontColor = ( |
            | preferences fontColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: preferences (override for variation)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         fontSpec = ( |
            | preferences fontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: counterfactualism\x7fComment: Used to prevent closing an outliner with unsaved changes.
Service routine, not intended to be overriden.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         hasCounterfactualItem = ( |
            | 
            resend.hasCounterfactualItem ifTrue: [ ^ true ].
            boxedItems ifNotNil: [ boxedItems morphsDo: [|:it| it isCounterfactual  ifTrue: [ ^ true]]].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: preferences (override for variation)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         headerButtonFontSpec = ( |
            | preferences headerButtonFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: copying (part of morph copying frameword)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: boxedFrame         IsPresentDo: [|:n| boxedFrame:        n].
            dict if: boxedItems         IsPresentDo: [|:n| boxedItems:        n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: preferences (override for variation)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         mediumFontSpec = ( |
            | 
            preferences mediumFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: should not need to override\x7fModuleInfo: Module: outliner InitialContents: InitializeToExpression: (paint copyRed: 0.942 Green: 0.904  Blue: 0.815)\x7fVisibility: private'
        
         menuColor = paint copyRed: 0.942 Green: 0.904  Blue: 0.815.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: preferences (override for variation)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         mergeAssignmentSlots = ( |
            | 
            preferences mergeAssignmentSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: should not need to override\x7fComment: Canonical implementation for outliners.
Would not override.\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
            | 
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: type tests (should override some)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'nonpluggableOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'outliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: should not need to override\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             menu.
             s.
            | 
            menu: ui2Menu copy.
            createCachedButtons.
            s: menu buttons size.
            addButtonsTo: menu.
            menu buttons size > s ifTrue: [
              "copy menu in order to copy buttons
               to allow two simultaneous menus w/ 
               different targets"
              menu: menu copy retargetButtonsTo: self.
              menu colorAll: menuColor.
              defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
              menu popUp: evt.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: preferences (override for variation)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         preferences = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: preferences (override for variation)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         preferredColor = ( |
            | 
            preferences color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: preferences (override for variation)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         preferredHeaderColor = ( |
            | 
            preferences headerColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: adding & removing boxed items in my expansion (called by children)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         removeBoxedItem: item = ( |
            | 
            boxedItems removeMorph: item.
            0 = boxedItems morphCount ifTrue: [
              items removeMorph: boxedFrame.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: preferences (override for variation)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         showSlotContents = ( |
            | preferences showSlotContents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: preferences (override for variation)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         simpleOutliners = ( |
            | preferences simpleOutliners).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: preferences (override for variation)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         smallFontSpec = ( |
            | preferences smallFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: should not need to override\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         styleMatchesProtoButton: b = ( |
             l.
             protoB.
             protoLabel.
            | 
            protoB: buttonPrototype.
            b color = menuColor ifFalse: [ ^false ].
            l: b findMorphWithLabel.
            protoLabel: protoB findMorphWithLabel.
            l isNotNil && [protoLabel isNotNil] ifTrue: [
              (l fontSpec = protoLabel fontSpec)  &&
               [l color = protoLabel color] ifFalse: [ ^false ].
            ].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> () From: ( | {
         'Category: expandAndCollapse\x7fCategory: multiple levels\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         suboutliners = ( |
             r.
            | 
            r: resend.suboutliners.
            items isNotNil && isExpanded ifTrue: [
              boxedItems morphsDo: [|:o|
                o isOutliner ifTrue:[ r addLast: o]]
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Outliner Framework (obsolete)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         indexOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'indexOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals nonpluggableOutliner copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'indexOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals indexOutliner.

CopyDowns:
globals nonpluggableOutliner. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'indexOutliner' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         inEditMode <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'indexOutliner' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         index.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'indexOutliner' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         outer.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Outliner Framework (deprecated)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         indexOutliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'indexOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits indexOutliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'indexOutliner' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'indexOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         outliner = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'outliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'outliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules outliner.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outliner' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outliner' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outliner' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         myComment <- 'Morphs for doing object outlining\"
            \"To do list:\"
            \" - extend with make assignable\"
            \" - make constant slot\"
            \" - Update if underlying object has changed.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outliner' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            (
                            outlinerHeader
            &               outliner
            &   nonpluggableOutliner
            &          indexOutliner 
            ) asVector do: [|:o| o initializePrototype].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outliner' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.15 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outliner' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Outliner Framework (obsolete)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         outlinerHeader = bootstrap define: bootstrap stub -> 'globals' -> 'outlinerHeader' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals rowMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'outlinerHeader' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals outlinerHeader.

CopyDowns:
globals rowMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerHeader' -> () From: ( | {
         'Category: action\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         action.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Outliner Framework (deprecated)\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         outlinerHeader = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'outlinerHeader' -> () From: ( |
             {} = 'Comment: Header morph for the outliner. Catches the middleMouseEven
          and invoke the action.\x7fModuleInfo: Creator: traits outlinerHeader.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerHeader' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'outlinerHeader' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'outlinerHeader' -> () From: ( | {
         'Category: action\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> () From: ( | {
         'Category: Programming Environment\x7fCategory: Outliner\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         annotationInfo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'ui2' -> 'annotationInfo' -> () From: ( |
             {} = 'Comment: I manage the extra information
used to edit the annotation info:
module, initialContents, creator, copydown, etc.
I expect the object to have an assignable
slot called maybeObsoleteAnnotationInfo.
I also expect to send newAnnotationMorph.
-- Ungar, 12/28/94\x7fModuleInfo: Creator: mixins ui2 annotationInfo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'annotationInfo' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addAnnotationInfo = ( |
            | 
            annotationInfo ifNotNil: [^ self].
            annotationInfo:  newAnnotationMorph.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'annotationInfo' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addAnnotationInfoButtonsTo: menu = ( |
            | 
            menu addButtonTarget: self
                     ScriptBlock: [target toggleAnnotationInfo]
                           Label:  annotationInfo
                                     ifNil:    'Show Annotation'
                                     IfNotNil: 'Hide Annotation'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'annotationInfo' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         annotationInfo = ( |
            | 
            maybeObsoleteAnnotationInfo ifNil: [^ nil].
            maybeObsoleteAnnotationInfo owner = columnUnderHeader
             ifFalse: [
              maybeObsoleteAnnotationInfo: nil.
            ].
            maybeObsoleteAnnotationInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'annotationInfo' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         annotationInfo: mi = ( |
            | 
            maybeObsoleteAnnotationInfo: mi.
            mi ifNotNil: [
              safelyDo: [ columnUnderHeader addMorphFirst: mi ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'annotationInfo' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: outliner InitialContents: InitializeToExpression: (vector copyAddFirst: \'Annotation...\')\x7fVisibility: private'
        
         annotationInfoMenuItems = vector copyAddFirst: 'Annotation...'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'annotationInfo' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         createCachedButtons = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'annotationInfo' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         isForAnnotationInfo_ButtonPress: button Event: evt = ( |
            | 
            case if: [ button label = 'Annotation...' ]
                     Then: [ toggleAnnotationInfo. true ]
                 Else: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'annotationInfo' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         removeAnnotationInfo = ( |
            | 
            annotationInfo ifNotNil: [
              annotationInfo isCounterfactual ifTrue: [
                annotationInfo warnCounterfactualIfAbort: [^ self].
              ].
              annotationInfo delete.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'annotationInfo' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         removeAnnotationInfoEvenIfCounterfactual = ( |
            | 
            annotationInfo delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'annotationInfo' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         toggleAnnotationInfo = ( |
            | 
            annotationInfo
              ifNil:    [    addAnnotationInfo]
              IfNotNil: [ removeAnnotationInfo]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'annotationInfo' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         updateAnnotationInfo = ( |
            | 
            annotationInfo ifNotNil: [
              annotationInfo update.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> () From: ( | {
         'Category: Programming Environment\x7fCategory: Outliner\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         commentButtonAndEditor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( |
             {} = 'Comment: I add behavior to support the button and comment editor
on slots or objects.
I expect the object to hold an uglyTextEditorMorph in a commentEditor slot
and an commentButtonMorph in the commentButton slot.
-- dmu 12/28/94\x7fModuleInfo: Creator: mixins ui2 commentButtonAndEditor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptComment: evt = ( |
            | 
            "forked from acceptCommentAction"
            protect: [ | str |
              str: commentEditor contentsString.
              commentHolder comment: str.
              commentEditor clearPanel.
              str isEmpty ifTrue: [ dismissCommentEditor ].
              updateComment.
              commentEditor ifNotNil: [ commentEditor frameStyle: commentEditor insetBezelStyle].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptCommentAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> 'acceptCommentAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins ui2 commentButtonAndEditor acceptCommentAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> 'acceptCommentAction' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target acceptComment: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'Comment: adds the comment button\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addCommentButtonsTo: menu = ( |
            | 
            commentEditor ifNil: [
              menu addButtonTarget: self 
                       ScriptBlock: [target addCommentEditorFor: event sourceHand]
                             Label:  'Show Comment'.
            ] IfNotNil: [
              menu addButtonTarget: self 
                       ScriptBlock: [target dismissCommentEditor]
                             Label:  'Hide Comment'.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addCommentEditor = ( |
            | 
            commentEditor ifNotNil: [dismissCommentEditor].
            commentEditor: 
             uglyMethodEditorMorph
                 copyString: commentHolder comment
                 Target: self
                 Accept: acceptCommentAction
                 Cancel: cancelCommentAction
                 Style: preferences commentStyle.
            commentEditor panel acceptButton isAsynchronous: true.
            commentEditor frameStyle: insetBezelStyle.
            commentEditor borderWidth: 1.
            commentEditor receiver: receiver.
            safelyDo: [ columnUnderHeader addMorphFirst: commentEditor ].
            commentButton open.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addCommentEditorFor: sourceHand = ( |
            | 
            addCommentEditor.
            commentEditor beTypingFocusFor: sourceHand.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'Comment: Add comment with programmer and date
if none exists.
-- Ungar, 2/2/95\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addSignatureComment: evt = ( |
            | 
            globals preferences openCommentWhenMakePublic ifFalse: [^ self].
            protect: [
              commentHolder comment isEmpty ifTrue: [
                [ " commented out: contentless-comments were too obnoxious--dmu "
                  commentHolder comment:
                    '-- ',
                    (
                      os environmentAt: 'LOGNAME'
                                IfFail: 'the phantom'
                    ) capitalize,
                    ', ',
                    time current mmddyyString.
                ].
                addCommentEditorFor: evt sourceHand.
              ].
              outer update.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildCommentButton = ( |
            | 
            commentButton:  commentButtonMorph copyTarget: self
                                                   Action: commentButtonAction
                                                    Style: preferences commentButtonStyle.
            commentHolder comment isEmpty ifFalse: [commentButton open].
            commentButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         cancelComment: evt = ( |
            | 
            commentEditor clearPanel.
            updateComment.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         cancelCommentAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> 'cancelCommentAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins ui2 commentButtonAndEditor cancelCommentAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> 'cancelCommentAction' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target cancelComment: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         commentButtonAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> 'commentButtonAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins ui2 commentButtonAndEditor commentButtonAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> 'commentButtonAction' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target toggleComment: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: InitializeToExpression: (vector copyAddFirst: \'Comment\'.)\x7fVisibility: private'
        
         commentMenuItems = vector copyAddFirst: 'Comment'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         createCachedButtons = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         dismissCommentEditor = ( |
            | 
            commentEditor ifNotNil: [
              isCommentCounterfactual ifTrue: [
                warnCounterfactualIfAbort: [^ self].
              ].
              columnUnderHeader removeMorph: commentEditor.
              commentEditor: nil.
            ].
            commentHolder comment isEmpty ifTrue: [ commentButton close ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         isCommentCounterfactual = ( |
            | 
            commentEditor isNotNil && [commentEditor isCounterfactual]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         isForComment_ButtonPress: button Event: evt = ( |
             lbl.
            | 
            lbl: button label.
            case if: [ lbl = 'Comment' ] Then: [ addCommentEditorFor: evt sourceHand. true ]
                 Else: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         toggleComment: evt = ( |
            | 
            commentEditor
              ifNil:    [ addCommentEditorFor: evt sourceHand ]  
              IfNotNil: [ dismissCommentEditor ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateComment = ( |
            | 
            case 
                 if: [commentButton isOpen not && [commentHolder comment isEmpty not]]    Then: [commentButton open]
                 If: [ commentEditor isNil ]            Then: []
                 If: [ commentEditor isCounterfactual ] Then: []
                 If: [commentEditor contentsString = commentHolder comment] Then: []
                 Else: [ commentEditor setText: commentHolder comment.  
                         commentEditor clearPanel. 
                         commentEditor frameStyle: insetBezelStyle ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexOutliner' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addButtonTo: menu = ( |
            | 
            menu addButtonTarget: self ScriptBlock: [target edit: event] Label: 'Edit'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildHeader = ( |
            | 
            header: outlinerHeader copyTarget: self 
                                        Style: preferences.
            header addMorphLast: buildTitle.

            showSlotContents ifTrue: [
              |
               acceptAction = ( |
                   actionFrom: source Target: target Event: evt = (| result |
                     result: target evalString: source contentsString
                                           Evt: evt
                                        Editor: source
                                        IfFail: [|:errorString | ^errorString printLine].
                     target outer mirror reflecteeAt: target index Put: result.
                     source string: source contentsString.
                     source editMode: source false)
                | ).
              |
              header addMorphLast: flexibleSpacer copy color: color.
              header addMorphLast: 
                 smallEditorMorph copyString: ref name
                                      Target: self
                                      Accept: acceptAction
                                       Style: preferences.
            ].
            addButtonsToHeader.
            header).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         buildHeaderButtons = ( |
            | 
            vector copyAddLast:
              pushButton copyTarget: self
                                     Action: sproutAction
                                      Style: preferences).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOuter: o Index: in = ( |
            | 
            ((copy outer: o) index: in) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexOutliner' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         edit: evt = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype.
            borderWidth: 0.
            beFlexible.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexOutliner' -> () From: ( | {
         'Category: type\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isIndexOutliner = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexOutliner' -> () From: ( | {
         'Category: type\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'indexOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexOutliner' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexOutliner' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         ref = ( |
            | reflect: outer mirror reflecteeAt: index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         sproutAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'indexOutliner' -> 'sproutAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits indexOutliner sproutAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexOutliner' -> 'sproutAction' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | target sproutIndex: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutIndex: evt = ( |
             o.
            | 
            o: world outlinerForMirror: ref.
            o position: (evt sourceHand globalPosition) translateBy: (20@0).
            world addMorph: o.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | 
            index printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isCounterfactual = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerHeader' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: tar Action: act Style: style = ( |
            | 
            ((copy target: tar) action: act) color: style color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerHeader' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: tar Style: style = ( |
            | 
            (copy target: tar) color: style color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerHeader' -> () From: ( | {
         'Category: postFileIn action\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            removeAllMorphs.
            borderWidth: 0.
            beFlexible).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerHeader' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: target IsPresentDo: [|:n| target: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerHeader' -> () From: ( | {
         'Category: type\x7fModuleInfo: Module: outliner InitialContents: FollowSlot'
        
         morphTypeName = 'outlinerHeader'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outlinerHeader' -> () From: ( | {
         'ModuleInfo: Module: outliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'rowMorph' -> ().
        } | ) 



 '-- Side effects'

 globals modules outliner postFileIn
