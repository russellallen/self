 '$Revision: 30.11 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: Slice Outliner & helpers\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         inheritanceForestSlicer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> () From: ( |
             {} = 'Comment: Given a mirror, learn about all its
ancestors and/or descendants.\x7fModuleInfo: Creator: globals inheritanceForestSlicer.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> () From: ( | {
         'Category: input information\x7fModuleInfo: Module: sliceControlPanel InitialContents: InitializeToExpression: (browseWellKnown)\x7fVisibility: private'
        
         browseObject <- bootstrap stub -> 'globals' -> 'browseWellKnown' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> () From: ( | {
         'Category: results of the traversal\x7fComment: After traversing up and down, this dictionary
holds a children relation,
each key is a mirror, each value a set of mirrors that are children
of the key mirror.\x7fModuleInfo: Module: sliceControlPanel InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         children <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> () From: ( | {
         'Category: input information\x7fComment: If the ancestors and descendants must be
limited to a given set of objects, this
slot will contain a set of those mirrors.
If not, it will be nil.\x7fModuleInfo: Module: sliceControlPanel InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         limitSet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals inheritanceForestSlicer parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: ascending\x7fComment: Capture tree info for ancestors of m.
Use sawParent flag to turn joins into multiple trees.\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         ascendFrom: m = ( |
             sawParent <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            stopSet if: m IsPresentDo: [^self]
                    IfAbsentPut: [m] AndDo: [].
            ('ascendFrom: ', m name ) printLine.

            m parentsDo: [|:ps. pm|
              pm: ps contents.
              children if: pm
                       IsPresentDo: [|:cs| cs add: m]
                       IfAbsentPut: [|s|
                         s: set copyRemoveAll.
                         sawParent ifFalse: [s add: m].
                         s
                     ] AndDo: [ ascendFrom: pm].

              sawParent: true.
            ].
            sawParent ifFalse: [roots add: m].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         buildAncestorsOf: mir = ( |
             r.
            | 
            r: copyRemoveAll.
            r ascendFrom: mir.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         buildDescendantsOf: mir BrowseObject: bo = ( |
            | 
            buildDescendantsOf: mir
                  BrowseObject: bo
            LimitDescendantsTo: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         buildDescendantsOf: mir BrowseObject: bo LimitDescendantsTo: limitMirs = ( |
             r.
            | 
            r: copyRemoveAll browseObject: bo.
            r limitSet:  limitMirs ifNotNil: [limitMirs asSet].
            r roots add: mir.
            r descendFrom: mir.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         buildFamilyOf: mir BrowseObject: bo = ( |
            | 
            buildFamilyOf: mir BrowseObject: bo
            LimitDescendantsTo: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         buildFamilyOf: mir BrowseObject: bo LimitDescendantsTo: limitMirs = ( |
             r.
            | 
            r: copyRemoveAll browseObject: bo.
            r limitSet: limitMirs ifNotNil: [limitMirs asSet].
            r ascendFrom: mir.
            r stopSet remove: mir.
            r descendFrom: mir.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: accessing finished tree\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         childrenOf: aMirror Do: blk = ( |
            | 
            (children at: aMirror IfAbsent: [^ nil]) do: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            error: 'inappropriate message, use copyRemoveAll').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | 
            (((resend.copy
            stopSet: stopSet copyRemoveAll)
            roots: roots copyRemoveAll)
            children: children copyRemoveAll)
            limitSet: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: descending\x7fCategory: slow, but finds all descendants\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         descendEverywhereFrom: m = ( |
             s.
            | 
            stopSet if: m
                    IsPresentDo: [^ self]
                    IfAbsentPut: [m] AndDo: [].
            ('descending from: ', m name) printLine.

            s: set copyRemoveAll.
            children at: m Put: s.

            (browseObject childrenOf: m reflectee) do: [|:c|
              s add: c.
              descendEverywhereFrom: c.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: descending\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         descendFrom: m = ( |
            | 
            limitSet
              ifNil:    [descendEverywhereFrom:     m]
              IfNotNil: [descendOnlyToLimitSetFrom: m]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: descending\x7fCategory: fast, but only finds descendants in limitSet\x7fComment: Add children information for any descendants of m
that are between m and members of limit set.
Much faster than descendEverwhereFrom: because
we can go UP from members of limit set.
This is the head of a recursive algorithm that
goes UP and tracks deadEnds (objects known
to NOT be descendants of m) and liveEnds
(objects known TO be descendants).
Tracking these prevents cycles and saves redundant
work. We must also check with stopSet in case
a prior ascent (for family) has found an object.\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         descendOnlyToLimitSetFrom: m = ( |
             deadEnds.
             liveEnds.
             toDo.
            | 
            liveEnds: set copyRemoveAll.
            deadEnds: set copyRemoveAll.
            limitSet do: [|:x|
              is: x DescendantOf: m
                        DeadEnds: deadEnds
                        LiveEnds: liveEnds
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: descending\x7fCategory: fast, but only finds descendants in limitSet\x7fComment: See comment in descendOnlyToLimitSetFrom:

Given a mirror d, see if it is a descendant of mirror a.
 Avoid dead ends by keeping a set of non-descendant mirrors in deadEnds.
 Avoid retraversal of live paths by
 keeping set of descendant mirrors.

-- dmu 1/2000\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         is: d DescendantOf: a DeadEnds: deadEnds LiveEnds: liveEnds = ( |
            | 
            case if: [deadEnds includes: d] Then: false
                 If: [stopSet  includes: d] Then: false
                 If: [(d = a) || [liveEnds includesKey: d]] Then: true
                 Else: [
                     "search all parents"
                     d parentsDo: [|:ps. p|
                       p: ps contents.
                           "If p leads to a, must add p to liveEnds."
                           (p = a) 
                       || [(liveEnds includes: p)
                       || [is: p DescendantOf: a DeadEnds: deadEnds LiveEnds: liveEnds]]
                          ifTrue: [
                            liveEnds add: d.
                            "make sure children has key with p, set containing d"
                            children if: p
                                     IsPresentDo: [|:childs| childs add: d]
                                     IfAbsentPut: [set copyRemoveAll add: d]
                                           AndDo: [].
                          ^ true
                       ]
                     ].
                     deadEnds add: d.
                     false
                ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: accessing finished tree\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         postOrderFrom: parentMir Do: blk = ( |
            | 
            childrenOf: parentMir Do: [|:c|
              postOrderFromRoot: c Do: blk
            ].
            blk value: parentMir).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: accessing finished tree\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         rootsDo: blk = ( |
            | roots do: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         treePrint = ( |
             s.
            | 
            s: set copyRemoveAll.
            roots do: [|:r| treePrint: r Indent: 0 Stops: s].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         treePrint: n Indent: i Stops: s = ( |
            | 
            s if: n IsPresentDo: [^ self]
              IfAbsentPut: [n] AndDo: [].
            i * 2 do: [' ' print].
            n name printLine.
            children if: n
                    IsPresentDo: [|:cs| cs do: [|:c| treePrint: c Indent: i succ Stops: s]]
                    IfAbsentPut: vector AndDo: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> () From: ( | {
         'Category: results of the traversal\x7fComment: After traversal, this set
contains the roots of the trees.\x7fModuleInfo: Module: sliceControlPanel InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: private'
        
         roots <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inheritanceForestSlicer' -> () From: ( | {
         'Category: intermediate data\x7fComment: Self allows inheritance cycles, so
use this set to stop.\x7fModuleInfo: Module: sliceControlPanel InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: private'
        
         stopSet <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot'
        
         sliceControlPanel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sliceControlPanel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sliceControlPanel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sliceControlPanel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceControlPanel' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceControlPanel' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceControlPanel' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceControlPanel' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceControlPanel' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceControlPanel' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: Slice Outliner & helpers\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         sliceControlPanel = bootstrap define: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals abstractAnnotationMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> () From: ( |
             {} = 'Comment: The sliceOutliner can do many kinds
of slices. I control this.
I am exposed by the \"C\" button.\x7fModuleInfo: Creator: globals sliceControlPanel.

CopyDowns:
globals abstractAnnotationMorph. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> () From: ( | {
         'Category: Slice Control Panel State\x7fModuleInfo: Module: sliceControlPanel InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         mySliceOutliner.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sliceControlPanel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accepting changes\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptModuleInfo = ( |
            | 
            acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accepting changes\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptSliceInfo = ( |
            | 
            panel isActive: false. "to clear isCounterfactual"
            mySliceOutliner flush: process this birthEvent.
            safelyDo: [mySliceOutliner updateTitle].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         allOptionSlots = ( |
            | 
            [filters. finds. organizations. visibilities]. "browsing"

            (reflect: optionNameSpaces) gather: [|:s|
              optionSlotsInNameSpace: s contents reflectee.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         allOptions = ( |
            | 
            allOptionSlots copyMappedBy: [|:s| s contents reflectee]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: option button rows\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         buildOptionRows = ( |
             bothRow.
             buttonsColumn.
             rowNameColumn.
             rowNames.
            | 
            rowNames: optionNameSpaceSlots asVector copyMappedBy: [|:s| s name].
            rowNames: rowNames copySort.
            rowNameColumn: columnMorph copy beShrinkWrap leftJustify borderWidth: 0.
            buttonsColumn: columnMorph copy beShrinkWrap leftJustify borderWidth: 0.
            rowNames do: [|:rn. ns. lst| 
              rowNameColumn addMorphLast: buildLabel: rn capitalize, ':' Style: style.
              lst: list copyRemoveAll add: ''.
              ns: (rn sendTo: optionNameSpaces).
              (optionsInNameSpace: ns) do: [|:opt|
                lst add: opt name.
                lst add: opt.
                lst add: opt buttonName.
              ].
              buttonsColumn addMorphLast: buildButtonRow: lst.
            ].
            bothRow: rowMorph copy beShrinkWrap borderWidth: 0.
            bothRow addAllMorphs: (rowNameColumn & buttonsColumn) asVector.
            contentsColumn addMorphLast: bothRow.
            (allOptions copyFilteredBy: [|:opt| opt isDefault])
              do: [|:opt|  selectOption: opt].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: string fields\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         buildStringFields = ( |
            | 
            [childShouldImplement].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: buttons\x7fComment: Return button object for
given option object.\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonFor: option = ( |
            | 
            [
              allButton. ancestorsButton. descendantsButton. familyButton.
              categoriesButton. implementorsButton. methodsContainingButton. referencesButton. sendersButton.
              flatButton. fullHierarchicalButton. hierarchicalButton.
              anonymousButton. wellKnownButton.
            ]. "browsing"
            option buttonName sendTo: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: selected options\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonSelectionIn: nameSpace = ( |
             d.
            | 
            (optionsInNameSpace: nameSpace) do: [|:opt|
              (buttonFor: opt) isDown ifTrue: [^ opt].
              opt isDefault ifTrue: [d: opt].
            ].
            d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         copySliceOutliner: so Style: sty = ( |
            | 
            ((copy mySliceOutliner: so) style: sty) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: enumerating\x7fComment: Does the enumeration and returns outliners
to add to the sliceOutliner.\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         enumerationOutliners = ( |
            | 
            vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fCategory: traits\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         findTraits = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'findTraits' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sliceControlPanel parent findTraits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'findTraits' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         descriptionFor: controlPanel = ( |
            | 
            name, ' of ', (quote: controlPanel subjectOf: self)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'findTraits' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         enumerationResultsFor: controlPanel = ( |
            | 
            enumerationSelector 
              sendTo:   controlPanel browseObject
                With:  controlPanel subjectName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'findTraits' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         enumerationSelector = ( |
            | name, 'Of:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'findTraits' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         flatEnumerationOutlinersFor: controlPanel = ( |
             slotOutliners.
             sortedSlots.
            | 
            sortedSlots: (enumerationSlotsFor: controlPanel) asVector copySortBy: (|
                element: a Precedes: b = ( a holder name < b holder name)
            |).
            slotOutliners: sortedSlots copyMappedBy: [|:s|
              controlPanel myOutliner model flatSuboutlinerForItem: s
            ].
            slotOutliners).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fCategory: traits\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         optionTraits = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sliceControlPanel parent optionTraits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'findTraits' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            resend.initialize.

            buildOptionRows.
            buildStringFields.

            colorAll: mySliceOutliner color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: copying\x7fComment: Update the slots of this morph to refer to the new versions of
those morphs given by the the mapping dictionary. Morphs that
keep references to other morphs must implemenent this method
for copying to work correctly.  This default implementation
does no remapping.\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: mySliceOutliner IsPresentDo: [|:n| mySliceOutliner: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'sliceControlPanel'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot'
        
         myOutliner = ( |
            | mySliceOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         optionNameSpaceSlots = ( |
            | 
            (reflect: optionNameSpaces) asList copyFilteredBy: [|:s| s isParent not]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         optionNameSpaces = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sliceControlPanel parent optionNameSpaces.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         optionSlotsInNameSpace: ns = ( |
            | 
            (reflect: ns) asList copyFilteredBy: [|:s| s isParent not]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            selectFor: target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonName = ( |
            | name, 'Button').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         descriptionFor: controlPanel = ( |
            | name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         descriptionStartingAt: objName = ( |
            | 
            ' in ', name, ' of ', (quote: objName)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         isDefault = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         quote: s = ( |
            | 
            '`', s, '\'').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         selectFor: controlPanel = ( |
            | 
            controlPanel userEditedMe.
            controlPanel selectOption: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         optionsInNameSpace: ns = ( |
            | 
            (optionSlotsInNameSpace: ns) copyMappedBy: [|:s| s contents reflectee]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: selected options\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         organization = ( |
            | 
            buttonSelectionIn: optionNameSpaces organizations).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: selecting\x7fComment: Set buttons to show that opt is selected.\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         selectOption: opt = ( |
             ns.
            | 
            ns: allOptionSlots
                  findFirst: [|:s| s contents = opt asMirror]
                  IfPresent: [|:s| s holder reflectee]
                  IfAbsent: [ error: 'what?'].
            (optionsInNameSpace: ns) do: [|:o|
              (buttonFor: o) isDown: o == opt
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: subjects\x7fComment: The subject is the object of the option:
for implementors it is the slot name, etc.
So subjectName is the message to send to me
for the subject.\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: private'
        
         subjectName = ( |
            | subjectOf: find).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: subjects\x7fComment: Given an option, return
what it is concerning.
E.g. implementors returns the slotName,
references the objectName, etc.\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         subjectOf: opt = ( |
            | opt subjectName sendTo: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot'
        
         updateNoKidding = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceControlPanel' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: sliceControlPanel InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            sliceControlPanel).
        } | ) 



 '-- Side effects'

 globals modules sliceControlPanel postFileIn
