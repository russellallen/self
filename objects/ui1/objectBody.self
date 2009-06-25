 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         objectBody = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'objectBody' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'objectBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules objectBody.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         objectBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals objectBody.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         allSubmenu <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         animatingFromArrows <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         animatingToArrows <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         blueprint <- bootstrap stub -> 'globals' -> 'boxBlueprint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         objectBodySizing = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'objectBodySizing' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals objectBodySizing.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         builder <- bootstrap stub -> 'globals' -> 'objectBodySizing' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         categoriesForMenu <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         fromArrows <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: InitializeToExpression: (0)'
        
         graphLevel <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         graphic <- bootstrap stub -> 'globals' -> 'boxBitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'Comment: maps names of sprouted hidden slots to arrows\x7fModuleInfo: Module: objectBody InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         hiddenSlotArrows <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         hsButton <- bootstrap stub -> 'globals' -> 'hiddenSlotsButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         objButton <- bootstrap stub -> 'globals' -> 'objectButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         objMirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'slots' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         objectBody = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits objectBody.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         regions <- bootstrap stub -> 'globals' -> 'objBodyRegions' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         sendables <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         size <- (1)@(1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         slots <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         sndButton <- bootstrap stub -> 'globals' -> 'sendButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         toArrows <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         world <- bootstrap stub -> 'globals' -> 'uiWorld' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBodySizing' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         bodycenterloc.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBodySizing' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         bodyloc.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBodySizing' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         footerloc.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBodySizing' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         footernameloc.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBodySizing' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         maxSlotContentsWidth <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBodySizing' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         maxSlotNameWidth <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBodySizing' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         nameloc.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         objectBodySizing = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'objectBodySizing' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits objectBodySizing.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBodySizing' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'objectBodySizing' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBodySizing' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         slotHeight <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectBodySizing' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsHeight <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         absoluteFrontFace = ( |
            | frontFace translateBy: absoluteLocation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         absoluteLocationForArrowhead: arr = ( |
            | edgePointClosestTo: arr tail).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         absoluteLocationForArrowtail: a = ( |
            | 
            "hard codes arrowhead policy"
            (absoluteFrontFace indent: 2)
                pointClosestToRectangle: (a toCpt absoluteBound)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         absoluteLocationForMovingArrowtail: a = ( |
            | 
            (absoluteFrontFace indent: 2) pointClosestToPoint: a trueHead).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         addCategory: aSlot Counter: counter = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 cat.
                } 
            | 
            cat: aSlot category.
            cat isEmpty ifTrue: [cat: uncategorized].
            (categoriesForMenu includesKey: cat) ifFalse: [ | m |
                categoriesForMenu at: cat Put: menuItem copy name: cat.
                counter at: cat Put: 1.
            ] True: [
                counter at: cat Put: (counter at: cat) succ.
            ].
            cat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         addGroupsToCategories: counter = ( |
            | 
            categoriesForMenu size = 1 ifTrue: [ ^ self ].
            categoriesForMenu do: [ | :item. :cat. hidden. total. |
                hidden: item submenuItems size.
                total: counter at: cat.
                hidden < total ifTrue: [
                    item submenuItems addFirst: menuItem copy name: none. ].
                item submenuItems addFirst: menuItem copy name: only.
                hidden > 0 ifTrue: [
                    item submenuItems addFirst: menuItem copy name: all. ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         addHiddenSlot: aSlot ToCategory: cat = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 hsmi.
                } 
            | 
            hsmi: hiddenSlotMenuItem copy hiddenSlot: aSlot.
            (categoriesForMenu at: cat) submenuItems add: hsmi.
            allSubmenu add: hsmi.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: addingMessges\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         addMessage: msg = ( |
            | addMessages: list copyRemoveAll add: msg).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: addingMessges\x7fComment: sendables is a set,
	 so adding more than one of the same message has no effect\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         addMessages: msgs = ( |
            | msgs do: [ | :m | sendables add: m ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         addSlotsHeight: h = ( |
            | 
            builder slotsHeight: builder slotsHeight + h).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         all = '  All '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         bodyMatchingSlot: slot IfPresent: db IfAbsent: ab = ( |
            | 
            slots findFirst: [ | :s | s fullName = slot fullName ]
                  IfPresent: [ | :s | db value: s ]
                   IfAbsent: [ ab value ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         bodyName: obj = ( |
            | 
            objMirror isReflecteeMethod ifTrue: [ ^ obj nameSize: infinity ].
            objMirror isReflecteeString ifTrue: [ ^ stringName: obj reflectee ].
            obj nameSize: nameLengthLimit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         calculateRegions = ( |
            | 
            regions headerLeft:
                (0@0) # (builder nameloc x pred @ builder bodyloc y pred).
            regions headerCenter:
                (builder nameloc x @ 0) #
                ((graphic width - builder nameloc x) @ builder bodyloc y pred).
            regions headerRight:
                (regions headerCenter topRight addX: 1) #
                (graphic width @ builder bodyloc y pred).
            regions bodyLefts removeAll.
            regions bodyLefts add:
                (0 @ builder bodyloc y) #
                (builder maxSlotNameWidth @ builder footerloc y pred).
            regions bodyLeftSpaces removeAll.
            regions bodyLeftSpaces add:
                (regions bodyLefts first topRight addX: 1) #
                (builder bodycenterloc x pred @ builder footerloc y pred).
            regions bodyRights removeAll.
            regions bodyRights add:
                builder bodycenterloc #
                "the -25 is to compensate for button and right side"
                (((builder bodycenterloc x + builder maxSlotContentsWidth) - 15)
                   @ builder footerloc y pred).
            regions bodyRightSpaces removeAll.
            regions bodyRightSpaces add:
                (regions bodyRights first topRight addX: 1) #
                (graphic width @ builder footerloc y pred).
            regions footerLeft:
                (0 @ builder footerloc y) #
                (builder footernameloc x @ graphic height).
            regions footerCenter:
                (regions footerLeft topRight addX: 1) #
                ((graphic width - builder  footernameloc x) @ graphic height).
            regions footerRight:
                (regions footerCenter topRight addX: 1) #
                (graphic width @ graphic height).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: changing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         changeContentsOfHiddenSlot: k To: newMir IfFail: fb = ( |
            | 
            objMirror at: k 
                    PutContents: newMir
                      IfFail: [ | :e |
                                warning: 'Could not change contents of ',
                                      'this slot to the selected object: ',
                                      e.
                                ^ fb value ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         clean = ( |
            | 
            hsButton: hsButton  copy.
            objButton: objButton  copy.
            sndButton: sndButton copy.
            slots:            slots            copyRemoveAll.
            sendables:        sendables        copyRemoveAll.
            graphic:          graphic          copy.
            fromArrows:       fromArrows       copyRemoveAll.
            toArrows:         toArrows         copyRemoveAll.
            hiddenSlotArrows: hiddenSlotArrows copyRemoveAll.
            name:             name             copy.
            allSubmenu:   allSubmenu   copyRemoveAll.
            regions: objBodyRegions copy.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: kbdResponse\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         clearGraphLevels = ( |
            | 
            currentGraphLevel: 0.
            world bodies do: [ | :b | b graphLevel: 0 ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         collectSizes: slot = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 sz.
                } 
            | 
            sz: slot minSize.
            addSlotsHeight: sz y.
            builder slotHeight: sz y.
            setMaxSlotContentsWidth: slot contentsMinSize x.
            setMaxSlotNameWidth: slot nameMinSize x.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         componentsDo: block = ( |
            | 
            slots do: block.
            block value: objButton.
            hasSlots  ifTrue: [ block value: hsButton ].
            hasSendables ifTrue: [ block value: sndButton ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         computeSize = ( |
            | 
            size:
                boxSizing objectBodySizeWithNameSize: nameSize 
                                        MaxSlotWidth: builder maxSlotWidth
                                         SlotsHeight: builder slotsHeight
                                       ObjButtonSize: objButton minSize
                                        HSButtonSize: (hasSlots  
                                                       ifTrue: [
                                                        hsButton minSize.
                                                       ] False: [ 0@0 ])
                                      SendButtonSize: sndButton minSize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         create: obj On: scr = ( |
            | 
            create: obj On: scr WithBlueprint: boxBlueprintDict lookup: obj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         create: obj On: scr WithBlueprint: bp = ( |
            | 
            objMirror: obj.
            world: scr.
            blueprint: bp.
            addMessages: bp messages.
            graphic noSaveUnder.
            name: bodyName: objMirror.
            recreate.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         create: obj On: scr WithMessages: msgs = ( |
            | 
            objMirror: obj.       "addMessages sends objMirror"
            addMessages: msgs.
            create: obj On: scr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: kbdResponse\x7fModuleInfo: Module: objectBody InitialContents: InitializeToExpression: (0.)'
        
         currentGraphLevel <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         desprout: name IfAbsent: block = ( |
            | 
            slots do: [ | :s | s basicName = name ifTrue: [ ^ s desprout ] ].
            (hiddenSlotNames includes: name) ifFalse: [
                block value: name With: objMirror ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBase = ( |
            | 
            graphic:
                ((graphic copyFor: window Size: size)
                    createDepth: boxSizing baseSideFaceWidth @
                                 boxSizing baseTopFaceHeight 
                           Skew: boxSizing baseDepthSkew
                     UIColors: uiColors)
                 background: world graphic.
            graphic draw.
            builder nameloc: nameLocation.
            drawBodyText: name At: builder nameloc Font: nameFont.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         edgeIntersectionFromCenterTo: pt = ( |
             r.
            | 
            " this was in rectangle.self
            >            intersectionsWithLineFrom: p1 To: p2 = ( | 
            >                b.
            >                bi.
            >                d.
            >                m.
            >                mi.
            >                r.
            >                xbottom.
            >                xmax.
            >                xmin.
            >                xtop.
            >                yleft.
            >                ymax.
            >                ymin.
            >                yright.
            >             | 
            >             r: list copyRemoveAll.
            >             xmin: p1 x min: p2 x.
            >             xmax: p1 x max: p2 x.
            >             ymin: p1 y min: p2 y.
            >             ymax: p1 y max: p2 y.
            >             d: p2 - p1.
            >             d x = 0 ifTrue: [
            >                 (ymin <= top) && [top <= ymax]
            >                     ifTrue: [ r add: p1 x @ top ].
            >                 (ymin <= bottom) && [bottom <= ymax]
            >                     ifTrue: [ r add: p1 x @ bottom ].
            >                  ^ r ].
            >             d y = 0 ifTrue: [
            >                 (xmin <= left) && [left <= xmax]
            >                     ifTrue: [ r add: left @ p1 y ].
            >                 (xmin <= right) && [right <= xmax]
            >                     ifTrue: [ r add: right @ p1 y ].
            >                  ^ r ].
            >             m: d y /= d x.
            >             mi: d x /= d y.
            >             b: p1 y - (m * p1 x).
            >             bi: p1 x - (mi * p1 y).
            >             yleft: (m * left) + b.
            >             yright: (m * right) + b.
            >             xtop: (mi * top) + bi.
            >             xbottom: (mi * bottom) + bi.
            >             (ymin <= yleft) && [(yleft <= ymax) &&
            >               [includes: left @ yleft]] ifTrue: [ r add: left @ yleft ].
            >             (ymin <= yright) && [(yright <= ymax) &&
            >               [includes: right @ yright]] ifTrue: [ r add: right @ yright ].
            >             (xmin <= xtop) && [(xtop <= xmax) &&
            >               [includes: xtop @ top]] ifTrue: [ r add: xtop @ top ].
            >             (xmin <= xbottom) && [(xbottom <= xmax) &&
            >               [includes: xbottom @ bottom]]
            >                 ifTrue: [ r add: xbottom @ bottom ].
            >             r).
            "
                        r: absoluteFrontFace intersectionsWithLineFrom: pt
                            To: absoluteFrontFace center.
                        r size > 1 ifTrue: [ warning: 'arrow miscalculation' ].
                        r isEmpty ifTrue: [ ^ pt ]. "box is obscuring pt"
                        r first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         edgePointClosestTo: p = ( |
            | absoluteFrontFace pointClosestToPoint: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating fakeness\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         fakeSlotsDo: block = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         flushHiddenSlots = ( |
            | 
            hiddenSlotDict removeAll.
            hiddenSlotArrows removeAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         frontFace = ( |
            | graphic frontBound).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         getSprouted = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 sprouted <- bootstrap stub -> 'globals' -> 'list' -> ().
                } 
            | 
            sprouted: sprouted copyRemoveAll.
            slots do: [ | :s | 
                s isSprouted ifTrue: [
                      s unsprout.
                      sprouted add: s slotInfo name.
                  ].
            ].
            hiddenSlotArrows do: [ | :arr. :slot. | 
                sprouted add: slot name.
                arr removeFromLists.
            ].
            hiddenSlotArrows removeAll.
            sprouted).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         hasHiddenSlots = ( |
            | hiddenSlots isEmpty not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: addingMessges\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         hasSendables = ( |
            | sendables isEmpty not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         hasSlots = ( |
            | numberOfSlots > 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         hiddenSlotDict = ( |
            | myUI hiddenSlotDict).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         hiddenSlotNames = ( |
            | 
            hiddenSlots copyMappedBy: [ | :hs | hs name asString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         hiddenSlots = ( |
            | "hack to get persistence--dmu"
            hiddenSlotDict at: objMirror
                     IfAbsent: [ | r |
                                 r: makeHiddenSlots.
                                 hiddenSlotDict at: objMirror Put: r.
                                 r ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         hide: sb = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 cursorXRatio <- 0.5.
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 isAPrevSlot <- bootstrap stub -> 'globals' -> 'true' -> ().
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 prevSlot.
                } 
            | 
            prevSlot: slotBefore: sb IfNone: [isAPrevSlot: false].
            cursorXRatio: (cursor location x - absoluteLocation x) /= width.
            hideSlots:  (list copyRemoveAll add: sb)
            Constrain:  cursor location
                   To: [ | x. y. |
                         x: (cursorXRatio * width) round asInteger.
                         y: slots isEmpty
                            ifTrue: [ frontFace center y ]
                             False: [ isAPrevSlot
                                ifFalse: [ sproutCursorOffset y ]
                                   True: [ prevSlot location y +
                                           prevSlot height ]
                            ].
                       (x@y) + absoluteLocation ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         hide: name IfAbsent: block = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 names.
                } 
            | 
            slots do: [ | :s |
                s basicName = name asString ifTrue: [
                    hiddenSlots add: s slotInfo.
                    s unsprout.
                    world alterBody: self By: [ recreate ].
                    ^ self ] ].
            (hiddenSlotNames includes: name) ifFalse: [
                block value: name With: objMirror ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         hideSlotIf: block = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 slots <- bootstrap stub -> 'globals' -> 'list' -> ().
                } 
            | 
            slots: slots copyRemoveAll.
            objMirror          do: [ | :s | slots addLast: s ].
            fakeSlotsDo: [ | :s | slots addLast: s ].
            slots do: [ | :s |
                (block value: s) ifTrue: [ hiddenSlots add: s ] ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         hideSlots: slotsToHide Constrain: a To: b = ( |
            | 
            world alterBody: self By: [
                slotsToHide do: [ | :sb | hiddenSlots add: sb slotInfo ].
                recreate.
                solveLocationConstrain: a To: b.
                constrainPartialBodyToWorld.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         iconified = ( |
            | slots isEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         iconifyCursorCentered = ( |
            | 
            hideSlots: slots Constrain:  cursor location 
                                    To: [absoluteFrontFace center]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         iconifyRemainCentered = ( |
            | 
            hideSlots: slots Constrain:  absoluteFrontFace center
                                    To: [absoluteFrontFace center]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         iconifyStayPut = ( |
            | 
            hideSlots: slots Constrain: location
                                    To: [location]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         isBodyFor: obj = ( |
            | objMirror = obj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: screenManagement\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         isIconic = ( |
            | slots isEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: kbdResponse\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         kbdCopy = ( |
            | myUI slotsInPasteBuffer: objMirror asVector. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: kbdResponse\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         kbdCut = ( |
            | kbdCopy. banish).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: kbdResponse\x7fComment: iconify and sprout parents\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         kbdF2 = ( |
            | 
            sproutParentsAt: 0 @ absoluteLocation y.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: kbdResponse\x7fComment: iconify and sprout parents breadth-first\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         kbdF3 = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 boxesAlreadySprouted <- bootstrap stub -> 'globals' -> 'set' -> ().
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 boxesJustSprouted <- bootstrap stub -> 'globals' -> 'list' -> ().
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 boxesToSprout <- bootstrap stub -> 'globals' -> 'list' -> ().
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 horizontalSpacing <- 200.
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 x <- 0.
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 y <- 0.
                } 
            | 
            cursor shiftKeyDown ifTrue: [ clearGraphLevels ].
            currentGraphLevel: currentGraphLevel succ.
            graphLevel: currentGraphLevel.
            boxesToSprout: boxesToSprout copyRemoveAll add: self.  
            boxesAlreadySprouted: boxesAlreadySprouted copyRemoveAll.
            iconifyRemainCentered.
            world display.
            y: absoluteLocation y.
            [ boxesToSprout isEmpty ] whileFalse: [ 
                boxesJustSprouted: boxesJustSprouted copyRemoveAll.
                x: graphLevel * horizontalSpacing.
                boxesToSprout do: [|:b. bs | 
                    b graphLevel: currentGraphLevel.
                    bs: b sproutParentsAt: x @ y.
                    bs do: [|:b|
                        b graphLevel: currentGraphLevel.
                        (boxesJustSprouted includes: b) ifFalse: [
                            x: x max: b absoluteBound right.
                            boxesJustSprouted add: b.
                            x: x + 15. "space out next group of parents"
                        ].
                    ].
                ].
                boxesAlreadySprouted addAll: boxesToSprout.
                boxesToSprout:     boxesToSprout     copyRemoveAll.

                y: infinity.
                boxesJustSprouted do: [|:b|
                    y: y min: b absoluteLocation y.
                   (b objMirror = (reflect: lobby) )
                || [boxesAlreadySprouted includes: b]  ifFalse: [
                     (boxesToSprout includes: b)
                         ifFalse: [boxesToSprout add: b].
                   ].
                ].
            ].
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: kbdResponse\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         kbdF4 = ( |
             children.
             lim = 20.
            | 
            children:
                browseWellKnown childrenOfReflectee: body objMirror.
            children size > lim ifTrue: [
                uiNotifier copySyncOn: world
                              Message: body objMirror name, ' has ', children size printString, ' children.\n',
                                         'Showing only ', lim printString, ' of them.'
                                   At: body location + (10@10).
                children:  children copySize: lim.
            ].
            children isEmpty ifTrue: [
                uiNotifier copySyncOn: world
                              Message: body objMirror name, ' has no well-known children'
                                   At: body location + (10@10).
                ^self
            ].
            children do: [| :kidMirror. kid |
                kid:  kidMirror reflectee.
                kidMirror hasCreator ifTrue: [
                    ui add: kid.
                    kidMirror names do: [| :n |
                        (kidMirror slotAt: n) value == body objMirror
                            ifTrue: [ui sprout: n On: kidMirror]
                    ].
                ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: kbdResponse\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         kbdPaste = ( |
            | 
            objMirror addSlots: myUI slotsInPasteBuffer.
            update.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: kbdResponse\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         kbdProps = ( |
            | 
            myUI addMirror: (reflect: objMirror) At: location + (width@0).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: enumerating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         leftSproutConstraintBlock: b = ( |
            | 
            b absoluteBound right @ b sproutCursorPosition y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: enumerating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         leftSproutConstraintLocation: cpt = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 space = 50.
                } 
            | 
            (absoluteBound left - space) @ cpt absoluteBound center y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         makeButtons = ( |
            | 
            hasSlots ifTrue: [
                hsButton createOn: self.
                hsButton groupItems: menuGroupItems. ].
            objButton createOn: self.
            sndButton createOn: self Messages: sendables.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         makeHiddenSlots = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 hs.
                } 
            | 
            hs: blueprint initialHiddenSlotsFor: self.
            preferences mergeAssignmentSlots ifTrue: [ | hsna |
                hsna: list copyRemoveAll.
                hs filterBy: [ | :s | s value isReflecteeAssignment not ]
                       Into: hsna.
                hs: hsna asSet 
            ].
            hs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         makeSlots = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 counter <- bootstrap stub -> 'globals' -> 'dictionary' -> ().
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 d <- bootstrap stub -> 'globals' -> 'dictionary' -> ().
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 f <- bootstrap stub -> 'globals' -> 'list' -> ().
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 t <- bootstrap stub -> 'globals' -> 'list' -> ().
                } 
            | 
            resetLineFigures.
            "merge in existing slots"

            d: d copyRemoveAll.
            slots do: [ | :sb | d at: sb fullName Put: sb ].
            slots removeAll.

            t: t copyRemoveAll.

            preferences mergeAssignmentSlots ifTrue: [
                objMirror filterBy: [ | :s | s value isReflecteeAssignment not]
                              Into: t.
            ] False: [ objMirror do: [ | :s | t add: s ] ].

            f: f copyRemoveAll.
            fakeSlotsDo: [ | :s | t addLast: s. f add: s. ].

            t: t asVector sort.

            categoriesForMenu: dictionary copyRemoveAll.
            counter: dictionary copyRemoveAll.
            allSubmenu: allSubmenu copyRemoveAll.
            t do: [ | :aSlot. cat. |
                cat: addCategory: aSlot Counter: counter.
                (hiddenSlots includes: aSlot) ifTrue: [
                    addHiddenSlot: aSlot ToCategory: cat.
                ] False: [ | sb. ds. found <- true. |
                    ds: d at: aSlot fullName IfAbsent: [ found: false ].
                    sb: 
                          found 
                       && [ (ds mustRecreateForSlot: aSlot) not ]
                          ifTrue: [ ds ]
                           False: [ slotCpt copy create: aSlot
                                                     On: self
                                                   Fake: (f includes: aSlot) ].
                    collectSizes: sb.              
                    sb resetFirstLast.
                    slots addLast: sb.
                ].
            ].

            addGroupsToCategories: counter.

            slots isEmpty ifFalse: [
                  slots first first: true.
                  slots last last: true. ].
            setButtonClusters.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fComment: \'menuGroups\' is added after this object is created--see below\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         menuGroupItems = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 groupItems <- bootstrap stub -> 'globals' -> 'list' -> ().
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 hasParents <- bootstrap stub -> 'globals' -> 'false' -> ().
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 hasPublic <- bootstrap stub -> 'globals' -> 'false' -> ().
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 hasWellKnown <- bootstrap stub -> 'globals' -> 'false' -> ().
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 testingBlock.
                } 
            | 
            testingBlock: [ | :s |
                s isParent ifTrue: [ hasParents: true ].
                publicSlot = s visibility ifTrue: [ hasPublic: true ].
                  s isVectorElement ifTrue: [
                    s holder hasCreator ifTrue: [hasWellKnown: true].
                  ].
            ].

            objMirror do: [ | :s | testingBlock value: s ].
            fakeSlotsDo: [ | :s | testingBlock value: s ].

            groupItems: groupItems copyRemoveAll.

            numberOfHiddenSlots > 0 ifTrue: [ | allItems |
                allItems: (menuItem copy name: all) submenuItems: allSubmenu.
                groupItems addLast: allItems ].
            slots size > 0 ifTrue: [
                groupItems addLast: menuItem copy name: none ].
            hasParents ifTrue: [
                groupItems addLast: menuItem copy name: parents ].
            hasPublic ifTrue: [
                groupItems addLast: menuItem copy name: public ].
            hasWellKnown ifTrue: [
                groupItems addLast: menuItem copy name: wellKnown ].

            groupItems).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: InitializeToExpression: (
(\'  All \' & \'  None \' & \'  Parents \' & \'  Public \' & \'  Well-Known Indexable \') asList
)\x7fVisibility: public'
        
         menuGroups = 
('  All ' & '  None ' & '  Parents ' & '  Public ' & '  Well-Known Indexable ') asList
.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         nameFont = ( |
            | boxSizing titleFont: objMirror isReflecteeMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         nameLengthLimit = 80.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         nameLocation = ( |
            | 
            boxSizing objectBodyNamePosition: name asString
                                   FaceWidth: width
                                 ButtonWidth: objButton minSize x
                                    IsMethod: objMirror isReflecteeMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: changing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         nameOfHiddenSlotWithArrow: arr = ( |
            | 
            hiddenSlotArrows do: [ | :a. :s. | a = arr ifTrue: [ ^ s key ] ].
            error: 'could not find hidden slot with this arrow').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         nameSize = ( |
            | nameFont sizeOfString: name asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         none = '  None '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating fakeness\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         numberOfFakeSlots = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfHiddenSlots = ( |
            | hiddenSlots size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         numberOfRealSlots = ( |
            | objMirror size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         numberOfSlots = ( |
            | numberOfRealSlots + numberOfFakeSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         offscreenHome = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 f.
                } 
            | 
            f: myUI offscreenHomeDict at: objMirror IfAbsent: [ | h |
                h: randomHome.
                myUI offscreenHomeDict at: objMirror Put: h.
                h ].
            f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         only = '  Only '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         onlyHideSlots: slotsToHide Constrain: a To: b = ( |
            | 
            hiddenSlots removeAll.
            hideSlots: slotsToHide Constrain: a To: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'boxBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         parents = '  Parents '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         protoFor: mir = ( |
            | 
            mir isReflecteeActivation       ifTrue: [ ^ activationBody ].
            mir isReflecteeAssignment       ifTrue: [ ^ assignmentBody ].
            mir isReflecteeBlock            ifTrue: [ ^ blockBody ].
            mir isReflecteeBlockMethod      ifTrue: [ ^ blockMethodBody ].
            mir isReflecteeBlockMethodActivation
                ifTrue: [ ^ blockMethodActivationBody ].
            mir isReflecteeByteVector       ifTrue: [ ^ byteVectorBody ].
            mir isReflecteeFctProxy         ifTrue: [ ^ fctProxyBody ].
            mir isReflecteeFloat            ifTrue: [ ^ floatBody ].
            mir isReflecteeInteger          ifTrue: [ ^ integerBody ].
            mir isReflecteeMethod           ifTrue: [ ^ methodBody ].
            mir isReflecteeMethodActivation ifTrue: [ ^ methodActivationBody ].
            mir isReflecteeMirror           ifTrue: [ ^ mirrorBody ].
            mir isReflecteeProcess          ifTrue: [ ^ processBody ].
            mir isReflecteeProxy            ifTrue: [ ^ proxyBody ].
            mir isReflecteeSlots            ifTrue: [ ^ slotsBody ].
            mir isReflecteeString           ifTrue: [ ^ canonicalStringBody ].
            mir isReflecteeVector           ifTrue: [ ^ vectorBody ].
            mir isReflecteeProfiler         ifTrue: [ ^ slotsBody ].
            error: 'unknown object type').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         public = '  Public '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         recreate = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 sproutTheseLater <- bootstrap stub -> 'globals' -> 'list' -> ().
                } 
            | 
            sproutTheseLater: getSprouted.

            graphic release.
            builder: objectBodySizing copy.
            name: bodyName: objMirror.

            objMirror isReflecteeActivation && [objMirror isLive] ifTrue: [
                makeSlots.
                "if the activation has died along the way, redo"
                objMirror isLive ifFalse: [ makeSlots ].
            ] False: [ makeSlots ].

            makeButtons.
            computeSize.
            drawBase.
            sizePlaceAndDrawSlots.
            sizePlaceAndDrawButtons.

            calculateRegions.

            redrawSlotArrowsFromNames: sproutTheseLater.
            recreateNames.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         recreateCentered = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 ctr.
                } 
            | 
            ctr: absoluteFrontFace center.
            recreate.
            solveLocationConstrain: ctr To: [ absoluteFrontFace center ].
            constrainPartialBodyToWorld.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         recreateNames = ( |
            | 
            slots do: [ | :s | 
                s name recreate
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         redrawHiddenSlotArrow: slot IfAbsent: b = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            (objMirror includes: slot)
                ifFalse: [ ^ self ]."slot may no longer exist--dmu"
            world findBody: slot contents IfFound: [ |:b. a. t. |
                t: slot isParent ifTrue: [ boxSizing parentArrowWidth ]
                                  False: [ boxSizing dataArrowWidth   ].
                a: uiArrow copy from: self To: b Width: t.
                hiddenSlotArrows at: slot Put: a.
            ] IfNone: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         redrawHiddenSlotArrowFromName: n = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 slot.
                } 
            | 
            slot: objMirror at: n IfAbsent: [ ^ self ].
            world findBody: slot contents IfFound: [ |:b. a. t. |
                t: slot isParent ifTrue: [ boxSizing parentArrowWidth ]
                                  False: [ boxSizing dataArrowWidth   ].
                a: uiArrow copy from: self To: b Width: t.
                hiddenSlotArrows at: slot Put: a.
            ] IfNone: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         redrawSlotArrows: slts = ( |
            | 
            slts do: [ | :slot |
                 redrawVisibleSlotArrow: slot IfAbsent: [
                     redrawHiddenSlotArrow: slot IfAbsent: [].
                 ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         redrawSlotArrowsFromNames: slotNames = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 slot.
                } 
            | 
            slotNames do: [ | :n |
                slotMatchingName: n
                       IfPresent: [ | :slot | 
                            redrawVisibleSlotArrow: slot slotInfo IfAbsent: []]
                        IfAbsent: [ redrawHiddenSlotArrowFromName: n ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         redrawVisibleSlotArrow: slot IfAbsent: block = ( |
            | 
            slots findFirst: [ |:s| s slotInfo = slot.  ]
                  IfPresent: [ |:s| s redrawArrow. ]
                   IfAbsent: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         removeHiddenSlot: s = ( |
            | hiddenSlots remove: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         removeHiddenSlotWithName: name = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 sr.
                } 
            | 
            hiddenSlots do: [ | :slot | slot name asString = name asString
                    ifTrue: [ sr: slot ] ].
            hiddenSlots remove: sr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceSlot: sb With: newSb = ( |
            | 
            slots remove: sb.
            slots add: newSb.
            world alterBody: self By: [recreate].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         representsObject = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         representsObject: mir = ( |
            | objMirror = mir).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         resetLineFigures = ( |
            | 
            builder slotHeight: 0.
            builder slotsHeight: 0.
            builder maxSlotContentsWidth: 0.
            builder maxSlotNameWidth: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         resproutOn: wrld = ( |
            | 
            wrld sproutBodyFor: objMirror
                     Constrain: [ | :b | b location ]
                            To: location).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         selectSubmenuGroup: name Category: cat = ( |
            | 
            name = all  ifTrue: [ ^ showAllSlotsInCategory: cat ].
            name = only ifTrue: [ ^ showOnlySlotsInCategory: cat ].
            name = none ifTrue: [ ^ showNoSlotsInCategory: cat ].
            error: 'could not find submenu group').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         setButtonClusters = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 cbCluster.
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 sbCluster.
                } 
            | 
            sbCluster: list copyRemoveAll.
            cbCluster: list copyRemoveAll.
            slots do: [ | :s |
                s setSlotButtonCluster: sbCluster.
                s setContentsButtonCluster: cbCluster. ].
            objButton joinCluster: sbCluster.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         setMaxSlotContentsWidth: w = ( |
            | 
            builder maxSlotContentsWidth: builder maxSlotContentsWidth max: w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         setMaxSlotNameWidth: w = ( |
            | 
            builder maxSlotNameWidth: builder maxSlotNameWidth max: w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         show: name IfAbsent: block = ( |
            | 
            (hiddenSlotNames includes: name) ifTrue: [
                removeHiddenSlotWithName: name.
                world alterBody: self By: [ recreate ].
                ^ self ].
            slots do: [ | :s |
                s basicName = name asString ifTrue: [ ^ self ] ].
            block value: name With: objMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         showAll = ( |
            | 
            onlyHideSlots: vector
                Constrain:  absoluteFrontFace center
                       To: [absoluteFrontFace center]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         showAllSlotsInCategory: cat = ( |
            | 
            (categoriesForMenu at: cat) submenuItems do: [ | :i |
                (submenuGroups includes: i name) ifFalse: [
                    removeHiddenSlot: i hiddenSlot ] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         showContentsOf: slotName IfAbsent: fb = ( |
            | 
            show: slotName IfAbsent: [^ fb value].
            showContentsOfVisibleSlot: slotName IfAbsent: [^ fb value].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         showContentsOfVisibleSlot: name IfAbsent: block = ( |
            | 
            slots findFirst: [ |:s| s basicName = name ]
                  IfPresent: [ |:s| s showContents ]
                   IfAbsent: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         showNoSlotsInCategory: cat = ( |
            | 
            cat = uncategorized ifTrue: [
                hideSlotIf:
                    [ | :s. c | c: s category.  c isEmpty || [c = cat] ]
            ] False: [
                hideSlotIf:
                    [ | :s | s category = cat ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         showOnlySlotsInCategory: cat = ( |
            | 
            cat = uncategorized ifTrue: [
                showOnlySlotsSatisfying:
                    [ | :s. c | c: s category.  c isEmpty || [c = cat] ]
            ] False: [
                showOnlySlotsSatisfying:
                    [ | :s | s category = cat ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         showOnlySlotsSatisfying: block = ( |
            | 
            hiddenSlots removeAll.
            hideSlotIf: [ | :s | (block value: s) not ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         showParents = ( |
             kids <- list copyRemoveAll.
            | 
            kids: kids copy.
            slots filterBy: [|:s| 
              (
                s isParent && 
               [s contents anySatisfy: [|:s| s isParent]]
              ) not] Into: kids.
            onlyHideSlots: kids
                Constrain:  absoluteFrontFace center
                       To: [absoluteFrontFace center]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         showSelection: item = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 n.
                } 
            | 
                        "return true if item was a slot"
                        n: item name.
                        (menuGroups includes: n) ifTrue: [
                            updateHiddenSlotGroup: n. ^ false ].
                        (categoriesForMenu includesKey: n) ifTrue: [
                            showAllSlotsInCategory: n. ^ false ].
                        showSlot: item hiddenSlot.
            "            animator showSlot: item hiddenSlot OfBody: self."
                        true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         showSelection: item InCategory: cat = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 n.
                } 
            | 
                        "return true iff item was one slot"
                        n: item name.
                        (submenuGroups includes: n) ifTrue: [
                            selectSubmenuGroup: n Category: cat. ^ false ].
                        showSlot: item hiddenSlot.
            "            animator showSlot: item hiddenSlot OfBody: self."
                        true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         showSlot: sl = ( |
            | removeHiddenSlot: sl).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         sizePlaceAndDrawButtons = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 sbWidth <- 0.
                } 
            | 
            objButton resize: objButton minSize.
            objButton placeAt: boxSizing objectButtonLocation.
            objButton draw.
            hasSendables ifTrue: [
                sndButton resize: sndButton minSize.
                sndButton placeAt: boxSizing sendButtonLocationBodySize: size
                                              SendButtonSize: sndButton size.
                sndButton draw.
                sbWidth: sndButton size x. ].
            hasSlots ifTrue: [ | p |
                hsButton resize:
                   (boxSizing hiddenSlotButtonWidthForSlotWidth: slotWidth
                                                SendButtonWidth: sbWidth) @
                   hsButton minSize y.
                p: boxSizing hsButtonLocationBodyHeight: height
                                         HSButtonHeight: hsButton height.
                hsButton placeAt: p.
                builder footerloc: p.
                hsButton draw.
                builder footernameloc: hsButton labelLocation + p.
            ] False: [
                builder footerloc: 0 @ size y.
                builder footernameloc: 0 @ size y.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         sizePlaceAndDrawSlots = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 pt.
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 tab.
                } 
            | 
            pt: boxSizing firstSlotPositionWithName: name asString
                                          IsMethod: objMirror isReflecteeMethod.
            tab: boxSizing slotTab: builder maxSlotNameWidth
                         NameWidth: nameSize x
                         SlotWidth: builder maxSlotWidth.
            builder bodyloc: 0 @ pt y.
            builder bodycenterloc: (tab + boxSizing baseLeftMargin) @ pt y.
            slots do: [ | :slot |
                slot resize: slotWidth @ slot minSize y SeparatedAt: tab.
                slot placeAt: pt.
                slot draw.
                pt: pt x @ (pt y + slot height).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         slotBefore: sb IfNone: noneBlock = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            slots first = sb ifTrue: [^noneBlock value].
            slots doFirst: [|:s|
                s = sb ifTrue: [^noneBlock value].
                r: s.
            ] MiddleLast: [|:s|
                s = sb ifTrue: [^r].
                r: s.
            ] IfEmpty: [^noneBlock value].
            error: 'argument not present').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         slotMatchingBody: sb IfPresent: db IfAbsent: ab = ( |
            | 
            objMirror findFirst: [ | :s | s fullName = sb fullName ]
                      IfPresent: [ | :s | db value: s ]
                       IfAbsent: [ ab value ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         slotMatchingName: sn IfPresent: db IfAbsent: ab = ( |
            | 
            slots findFirst: [ | :s | 
                s slotInfo name = sn ]
                  IfPresent: [ | :s | db value: s ]
                   IfAbsent: [ ab value ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         slotWidth = ( |
            | 
            width - boxSizing baseLeftMargin - boxSizing baseRightMargin -
            boxSizing baseSideFaceWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: enumerating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         sprout: er Blueprint: blueprint FromCpt: cpt = ( |
            | 
            "return new body"
            world findBody: er
                   IfFound: [ | :foundBody | foundBody wiggle ]
                    IfNone: [ | bod |
                              bod: world
                               sproutBodyFor: er
                                   Blueprint: blueprint
                                   Constrain: [ | :b |
                                              leftSproutConstraintBlock: b ]
                                          To: leftSproutConstraintLocation: cpt.
                             animator sproutBody: bod
                                       FromPoint: cpt absoluteCenter.
                             animator displayAndFadeOutAcetate.
                             bod ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: enumerating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         sprout: er FromCpt: cpt = ( |
            | 
            sprout: er Blueprint: (boxBlueprintDict lookup: er) FromCpt: cpt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         sprout: name IfAbsent: block = ( |
            | 
            sproutVisibleSlot: name IfAbsent: [
                (hiddenSlotNames includes: name)
                   ifTrue: [ sproutHiddenSlot: name ]
                    False: [ block value: name With: objMirror ] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         sproutCursorOffset = ( |
            | 
            graphic width half @
            (boxSizing objectBodyTopMiddleHeight + 
             boxSizing boxFont height half)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         sproutCursorPosition = ( |
            | location + sproutCursorOffset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: enumerating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutEnumeration: enum Type: type Blueprint: blueprint SlotName: slotName FromCpt: cpt = ( |
             er.
            | 
            er: enumResult copySize: enum size.
            er type:        type.
            er desiredText: slotName.
            er fromMirror:  objMirror.
            enum mapBy: [ | :m |
                  type = 'senders' ifTrue: [ m ] False: [
                  type = 'implementors' ifTrue: [ m reflectee ] False: [
                  m isReflecteeMethod ifTrue: [ m mirror ]
                                             False: [ m reflectee ] ] ] ]
                  Into: er.
            er: reflect: er.
            sprout: er Blueprint: blueprint FromCpt: cpt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         sproutHiddenSlot: name = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 arr.
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 slot.
                } 
            | 
            slot: objMirror slotAt: name.
            arr: hiddenSlotArrows at: slot IfAbsent: [
                arr: sprout: slot contents
                BeginningAt: hsButton absoluteCenter
                   IsParent: slot isParent
                  Constrain: absoluteFrontFace topCenter - (0 @ 30)
                         To: [ | :b |  b absoluteFrontFace bottomCenter ].
                hiddenSlotArrows at: slot Put: arr.
                ^ arr toCpt. ].
            arr toCpt raise.
            world display.
            arr animateSprouting.
            arr toCpt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         sproutParentsAt: p = ( |
             bot <- 0.
             left <- 0.
             nextBot <- 0.
             parentList <- bootstrap stub -> 'globals' -> 'list' -> ().
             parentSet <- bootstrap stub -> 'globals' -> 'set' -> ().
             sp = 10.
             ss.
            | 
            iconifyRemainCentered.
            world display.
            parentSet:  parentSet  copyRemoveAll.
            parentList: parentList copyRemoveAll.
            left: p x max: sp.
            bot:  p y - sp.
            nextBot: bot.

            ss: list copyRemoveAll.
            objMirror do: [|:s| s isParent 
                            && [s value anySatisfy: [|:s| s isParent]] ifTrue: [ss add: s]].

            ss do: [|:s. b. newLeft. newTop |
                b: sprout: s name IfAbsent: [error: 'should not happen'].
                b iconifyRemainCentered.
              b graphLevel = 0 ifTrue: [
                graphLevel: currentGraphLevel.
                newLeft: left.
                newTop:  bot - b height.
                (newLeft + b width)  >  world size x
                  ifTrue: [
                    newLeft: sp.
                    bot: nextBot.
                    newTop: bot - b height.
                ].
                newTop < 0 ifTrue: [
                    bot: world size y.
                    nextBot: bot.
                    left: sp.
                    newLeft: left.
                    newTop: bot - b height.
                ].
                b moveTo: newLeft @ newTop.
              ].
                left: b absoluteBound right + sp.
                nextBot: nextBot min: (b absoluteBound top - sp).
                (parentSet includes: b) ifFalse: [
                    parentList addLast: b.
                    parentSet  add:     b.
                ].
            ].
            parentList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutToSlot: str = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 paths.
                } 
            | 
            paths:  body objMirror pathsToKey: str.
            paths isEmpty ifTrue: [
              uiNotifier copySyncOn: world
                             Message: 'No slot called ', str
                                  At: location + (20@20).
              ^ false.
            ].
            paths do: [| :path. current. |
              current:  body objMirror.
              path doFirstMiddle: [|:el|
                ui show:   el On: current.
                ui sprout: el On: current.
                current:  (current at: el) contents.
              ] Last: [|:el|
                ui showContentsOf: el On: current "only sprout if needed"
              ] IfEmpty: [].
            ].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         sproutVisibleSlot: name IfAbsent: block = ( |
            | 
            slots findFirst: [ |:s| s basicName = name ]
                  IfPresent: [ |:s| s sprout ]
                   IfAbsent: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         sprouting* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'sproutable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | (bodyName: objMirror) asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         stringLineLimit = 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         stringName: str = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 tl.
                } 
            | 
            tl: str asTextLines wrapLinesAt: nameLengthLimit.
            tl truncateWithEllipsisAfterLine: stringLineLimit.
            tl printStringSize: infinity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: InitializeToExpression: (
(\'  All \' & \'  Only \' & \'  None \') asList
)\x7fVisibility: public'
        
         submenuGroups = 
('  All ' & '  Only ' & '  None ') asList
.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: hidingAndShowingSlots\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         uncategorized = 'Uncategorized'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         unsprout: arr = ( |
            | 
            arr removeFromLists.
            hiddenSlotArrows copy do: [ | :a. :slot. |
                arr = a ifTrue: [ hiddenSlotArrows removeKey: slot ] ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         updateHiddenSlotGroup: n = ( |
            | 
            all       = n ifTrue: [ ^ showOnlySlotsSatisfying: [|:s| true] ].
            none      = n ifTrue: [ ^ showOnlySlotsSatisfying: [|:s| false] ].
            parents   = n ifTrue: [ ^ showOnlySlotsSatisfying: [|:s|
                                       s isParent] ].
            public    = n ifTrue: [ ^ showOnlySlotsSatisfying: [|:s|
                                       s visibility = publicSlot] ].
            wellKnown = n ifTrue: [ ^ showOnlySlotsSatisfying: [|:s|
                                       s isVectorElement && [s isWellKnown]] ].
            error: 'cannot find menu group').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: updating\x7fComment: only call this from the uiWorld
	 returns bool indicating whether an update happened\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot'
        
         updateUntil: untilBlock = ( | {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 mustRecreate <- bootstrap stub -> 'globals' -> 'false' -> ().
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 oldHiddenSlots.
                }  {
                 'ModuleInfo: Module: objectBody InitialContents: FollowSlot'
                
                 unreconciledSlots.
                } 
            | 
            untilBlock value ifTrue: [^false].

            "immutable strings will not change, so we can exit the update.
             this also cuts down on updating time for really large strings."
            objMirror isReflecteeString ifTrue: [ ^ false ].

            name asString = (bodyName: objMirror) ifFalse: [
                mustRecreate: true.
            ].

            unreconciledSlots: dictionary copy.
            objMirror do: [|:s|
                untilBlock value ifTrue: [^false].
                "don't add assignment slots if the ui is merging them"
                preferences mergeAssignmentSlots && [s isAssignment] ifFalse: [
                    unreconciledSlots at: s fullName Put: s. ].
            ].

            fakeSlotsDo: [|:s| 
                untilBlock value ifTrue: [^false].
                unreconciledSlots at: s fullName Put: s.
            ].

            "check visible slots against actual slots;
             rebuild if any contents of any visible slots differed,
             or if a visible slot has been removed."

            slots do: [ | :sb. |
                untilBlock value ifTrue: [^false].
                (unreconciledSlots includesKey: sb fullName) ifFalse: [
                    mustRecreate: true. "to remove this goner"
                ] True: [ | actualSlot |
                    " this is a real, visible slot "
                    actualSlot: unreconciledSlots at: sb fullName.
                    unreconciledSlots removeKey: actualSlot fullName.
                        ( sb mustRecreateForSlot: actualSlot) ifTrue: [
                        mustRecreate: true.
                    ].
                ].
            ].

            "check hidden slots against actual slots;
             rebuild if any contents of any hidden slots differed 
             and it was sprouted, or if a new slot was added."
            oldHiddenSlots: hiddenSlots copy.
            hiddenSlots removeAll.
            unreconciledSlots do: [ | :s |
                (oldHiddenSlots includes: s) 
                  ifFalse: [ mustRecreate: true ] "a brand-new slot"
                     True: [
                       hiddenSlots add: s.
                       (hiddenSlotArrows includesKey: s) &&
                       [(hiddenSlotArrows at: s) toCpt objMirror !=
                        (objMirror slotAt: s name) contents]
                           ifTrue: [ mustRecreate: true ].
                ].
            ].
            "If a hidden slot has been removed, must recreate to fix 
             menubar label"
            oldHiddenSlots size = hiddenSlots size ifFalse: [
                mustRecreate: true.
            ].

            "Menu names may have changed, so just rebuild hidden name list"
            mustRecreate ifTrue: [recreate].
            mustRecreate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBody' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         wellKnown = '  Well-Known Indexable '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBodySizing' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: public'
        
         maxSlotWidth = ( |
            | maxSlotNameWidth + maxSlotContentsWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectBodySizing' -> () From: ( | {
         'ModuleInfo: Module: objectBody InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 



 '-- Side effects'

 globals modules objectBody postFileIn
