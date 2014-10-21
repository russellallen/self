 '$Revision: 30.18 $'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         circleMorph = bootstrap define: bootstrap stub -> 'globals' -> 'circleMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawBox' From:
             bootstrap remove: 'rawColor' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'circleMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals circleMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawBox rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'circleMorph' -> () From: ( | {
         'Category: circleMorph State\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         center <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         circleMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits circleMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'circleMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'circleMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'circleMorph' -> () From: ( | {
         'Category: circleMorph State\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         radius <- 50.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'circleMorph' -> () From: ( | {
         'Category: circleMorph State\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         rawColor <- paint named: 'leaf'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         labelMorph = bootstrap define: bootstrap stub -> 'globals' -> 'labelMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawBox' From:
             bootstrap remove: 'rawColor' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'labelMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals labelMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawBox rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'labelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fComment: nil width indicates unknown ascent\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         myAscent <- 14.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'labelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         myBox.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'labelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fComment: nil width indicates unknown descent\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         myDescent <- 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'labelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fModuleInfo: Module: morphLib InitialContents: InitializeToExpression: (fontSpec copyName: \'verdana\' Size: 12 Style: \'bold\')\x7fVisibility: private'
        
         myFontSpec <- fontSpec copyName: 'verdana' Size: 12 Style: 'bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'labelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         myLabel <- 'a labelMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'labelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fModuleInfo: Module: morphLib InitialContents: InitializeToExpression: (20@20)\x7fVisibility: private'
        
         myPosition <- 20@20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'labelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fComment: nil myWidth indicates unknown width, ascent, and descent\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         myWidth.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         labelMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits labelMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'labelMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'labelMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'labelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fModuleInfo: Module: morphLib InitialContents: InitializeToExpression: (paint named: \'black\')\x7fVisibility: private'
        
         rawColor <- paint named: 'black'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         lineMorph = bootstrap define: bootstrap stub -> 'globals' -> 'lineMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawBox' From:
             bootstrap remove: 'rawColor' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'lineMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals lineMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawBox rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'lineMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         p1 <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'lineMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         p2 <- (100)@(100).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         lineMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'lineMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits lineMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'lineMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'lineMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'lineMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         rawColor <- paint named: 'transparent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'lineMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         width <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot'
        
         morphLib = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'morphLib' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'morphLib' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules morphLib.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morphLib' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morphLib' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morphLib' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot'
        
         myComment <- 'A library of basic morphs.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morphLib' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            "dropping morphs fall through labelMorphs by default"
            labelMorph fontSpec: globals fontSpec copyName: 'verdana' Style: 'bold'.
            selectionInListMorph fontSpec: globals fontSpec copyName: 'verdana' Size: 12 Style: 'bold'.
            sliderMorph initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morphLib' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.18 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morphLib' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         polygonMorph = bootstrap define: bootstrap stub -> 'globals' -> 'polygonMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawBox' From:
             bootstrap remove: 'rawColor' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'polygonMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals polygonMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawBox rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'polygonMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         movingOffset.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         polygonMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits polygonMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'polygonMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'polygonMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'polygonMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         position <- (16)@(14).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'polygonMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         rawColor <- paint named: 'blue'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'polygonMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         vertexOffsets <- [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals polygonMorph vertexOffsets.
'.
                    | ) ) _Clone: 2 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'polygonMorph') \/-> 'vertexOffsets') -> () _At: 0 Put: (
     (0)@(10))

 ((bootstrap stub -> 'globals' -> 'polygonMorph') \/-> 'vertexOffsets') -> () _At: 1 Put: (
     (10)@(0))

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionInListMorph = bootstrap define: bootstrap stub -> 'globals' -> 'selectionInListMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawBox' From:
             bootstrap remove: 'rawColor' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selectionInListMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selectionInListMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawBox rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionInListMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: InitializeToExpression: (globals fontSpec copyName: \'verdana\' Size: 12 Style: \'bold\')\x7fVisibility: public'
        
         fontSpec <- globals fontSpec copyName: 'verdana' Size: 12 Style: 'bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionInListMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         height <- 60.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionInListMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         items <- [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals selectionInListMorph items.
'.
                    | ) ) _Clone: 3 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'selectionInListMorph') \/-> 'items') -> () _At: 0 Put: (
     'item1')

 ((bootstrap stub -> 'globals' -> 'selectionInListMorph') \/-> 'items') -> () _At: 1 Put: (
     'item2')

 ((bootstrap stub -> 'globals' -> 'selectionInListMorph') \/-> 'items') -> () _At: 2 Put: (
     'item3')

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionInListMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         lineSpacing <- 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionInListMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'selectionInListMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits selectionInListMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionInListMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'selectionInListMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionInListMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         position <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionInListMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         rawColor <- paint named: 'teal'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionInListMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         selectedIndex <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionInListMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionColor <- paint named: 'white'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionInListMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         textColor <- paint named: 'transparent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectionInListMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         width <- 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         sliderMorph = bootstrap define: bootstrap stub -> 'globals' -> 'sliderMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawBox' From:
             bootstrap remove: 'rawColor' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sliderMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sliderMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawBox rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         height <- 80.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         maxValue <- 100.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         minValue <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         myValue <- 50.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         orientation <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         sliderMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sliderMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'sliderMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         position <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         rawColor <- paint named: 'khaki'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderMorph' -> () From: ( | {
         'Comment: selector of notification message\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         selector.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         sliderColor <- paint named: 'transparent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderMorph' -> () From: ( | {
         'Comment: target of notification message\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         width <- 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         spacerMorph = bootstrap define: bootstrap stub -> 'globals' -> 'spacerMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'spacerMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals spacerMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spacerMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinHeight <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spacerMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinWidth <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         spacerMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'spacerMorph' -> () From: ( |
             {} = 'Comment: This morph is just used for spacing in rows and columns.
     It does not draw itself if its color matches that of its owner.\x7fModuleInfo: Creator: traits spacerMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spacerMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'spacerMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spacerMorph' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: morphLib InitialContents: InitializeToExpression: (paint named: \'transparent\')\x7fVisibility: private'
        
         rawColor <- paint named: 'transparent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         ascent = ( |
            | 
            "Approximate if actual ascent is not known."

            myWidth ifNil: [
                "try to fill font info caches by sending 'width'
                 to myself; if this fails, myWidth will still be nil"
                width.
            ].
            myWidth
                ifNil:    [ myFontSpec size  "crude approximation" ]
                IfNotNil: [ myAscent ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseBounds = ( |
             w.
            | 
            w: width.
            (myBox isNil || [myBox width != w]) ifTrue: [
                myBox: (position - (0 @ ascent ceil asInteger)) ## (w @ (ascent + descent) ceil asInteger).
            ].
            myBox).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
             h.
            | 
            "hack to prevent boxes at end of selector editing caused by newlines"
            h: (label lastIfAbsent: ' ') = '\n' ifTrue: [label copyWithoutLast] False: [label].
            c text: h At: position
                FontSpec: myFontSpec
                Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: newC = ( |
            | 
            "See comment in traits morph for general idea.
             Here, for readability, do not change color."
            morphsDo: [| :m | m colorAll: newC ].
            "color: newC textColorForBackground." 
            " - disabled Aug13 rca to stop outliners coloring wrong"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         computeWidthInWorld: w = ( |
             m.
            | 
            "Compute and cache my width in the given world."

            setCachedSizes: w anyOpenWindowCanvas.
            myBox: nil.
            m: self.
            [m isNil] whileFalse: [
                m flushLayoutCaches.
                m: m owner.
            ].
            width).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         copyLabel: s = ( |
            | copy label: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         copyLabel: s FontSpec: fSpec Color: c = ( |
             new.
            | 
            new: copy.
            new label: s.
            new fontSpec: fSpec.
            new color: c.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         descent = ( |
            | 
            "Approximate if actual descent is not known."

            myWidth ifNil: [
                "try to fill font info caches by sending 'width'
                 to myself; if this fails, myWidth will still be nil"
                width.
            ].
            myWidth
                ifNil:    [ myFontSpec size / 3 "crude approximation" ]
                IfNotNil: [ myDescent ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         flushCachedWidth = ( |
            | 
            myWidth: nil.
            myBox: nil.
            flushLayoutCaches.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         fontSpec = ( |
            | myFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         fontSpec: fSpec = ( |
            | 
            changed.
            myFontSpec: fSpec.
            flushCachedWidth.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: layout\x7fComment: always rigid\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         isFlexibleHorizontally = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: layout\x7fComment: always rigid\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         isFlexibleVertically = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         label = ( |
            | myLabel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         label: s = ( |
            | 
            safelyDo: [
              changed.
              myLabel: s.
              flushCachedWidth.
              layoutChanged.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'labelMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         position = ( |
            | myPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         position: p = ( |
            | 
            myPosition: p.
            myBox: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: keystrokes\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         processInput: s = ( |
            | 
            error: 'This is a relic, if you want to revive it,
                    it will need a mixin from ui2Event to handle
                    all the control character messages'.
            changed.
            ( s =   8 asCharacter ) ||
            ( s = 127 asCharacter ) ifTrue: [
               "backspace or delete: delete last character"
               ^ label: label copySize: (label size pred max: 0).
            ].
            ( s = 21 asCharacter ) ifTrue: [
               "^U: delete all"
               ^ label: label copySize: 0.
            ].
            label: label, s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         propertySheets = ( |
            | 
            resend.propertySheets copyAddLast:
                (labelPropsMorph copyTarget: self)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeRect: r = ( |
            | 
            position: r origin + (0 @ ascent).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         setCachedSizes: c = ( |
             xfnt.
            | 
            xfnt: (c structForFontSpec: myFontSpec).
            "Quartz uses floats but UI2 layouts cannot cope"
            myWidth:  (xfnt textWidth: label) ceil asInteger.
            myAscent: xfnt ascent ceil asInteger.
            myDescent: xfnt descent ceil asInteger.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         setWidth: w Height: h = ( |
            | 
            h = fontSpec size ifTrue: [ ^self ].
            fontSpec: fontSpec copySize: h.
            layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            resend.statePrintString, ' [', label escaped, ']').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
             to.
            | 
            myWidth ifNotNil: [ ^ myWidth " cache is valid " ].
            "my width is not yet known; attempt to compute it"
            to: topmostOwner.
            to isWorldMorph ifFalse: [
              "width cannot be determined; return a crude guess"
              ^ (myFontSpec size * label size) half.
            ].
            [|m|
            "compute and cache my width"
            setCachedSizes: to anyOpenWindowCanvasIfNone: [^ 17].
            myBox: nil.
            m: self.
            [m isNil] whileFalse: [
              m flushLayoutCaches.
              m: m owner.
            ].
            ] value.
            myWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: reopening the world\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         worldHasReopened = ( |
            | 
            flushCachedWidth.
            layoutChanged.
            resend.worldHasReopened).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         updatingLabelMorph = bootstrap define: bootstrap stub -> 'globals' -> 'updatingLabelMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'myLabel' From:
             bootstrap remove: 'myLabel:' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals labelMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'updatingLabelMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals updatingLabelMorph.

CopyDowns:
globals labelMorph. copyRemoveAllMorphs 
SlotsToOmit: myLabel myLabel: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'updatingLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         count <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'updatingLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         expression <- 'printString'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'updatingLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: InitializeToExpression: (time current)\x7fVisibility: private'
        
         lastUpdateTime <- time current.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'updatingLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         myLabel <- 'Press the middle button'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         updatingLabelMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits updatingLabelMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'updatingLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'updatingLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         sampleInterval <- 250.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'updatingLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseBounds = ( |
             centerX.
             centerY.
            | 
            centerX: center x.
            centerY: center y.
            ((centerX - radius)@(centerY - radius)) # ((centerX + radius)@(centerY + radius))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseContainsPt: p = ( |
            | (p - center) square squareRoot <= radius).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            c fillCircleCenteredAt: center Diameter: radius double Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: newC = ( |
            | 
            "See comment in traits morph for general idea.
             Here, for legibility, do not change color."

            morphsDo: [| :m | m colorAll: newC ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'circleMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         position = ( |
            | center).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         position: p = ( |
            | center: p. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         resizePoint: p = ( |
             dx.
             dy.
            | 
            changed.
            dx: p x - center x.
            dy: p y - center y.
            radius: ((dx square + dy square) squareRoot asInteger max: 3).
            layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeRect: r = ( |
            | 
            center: r center.
            radius: (r width min: r height) half.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lineMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseBounds = ( |
            | p1 # p2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lineMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseContainsPt: p = ( |
             closestP.
             dX.
             dY.
            | 
            (baseBounds includes: p) ifFalse: [ ^false ].
            dX: p2 x - p1 x.
            dY: p2 y - p1 y.
            "the larger of dX abs and dY abs is non-zero"
            dX absoluteValue > dY absoluteValue ifTrue: [
                closestP: p1 + (((p2 - p1) * (p x - p1 x)) / dX).
            ] False: [
                closestP: p1 + (((p2 - p1) * (p y - p1 y)) / dY).
            ].
            (p - closestP) square squareRoot <= 10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lineMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            c line: p1 To: p2 Width: width Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lineMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lineMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'lineMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lineMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lineMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         position = ( |
            | (p1 + p2) / 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lineMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         position: p = ( |
             delta.
            | 
            delta: p - position.
            p1: p1 + delta.
            p2: p2 + delta.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lineMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeRect: r = ( |
             dX.
             dY.
            | 
            dX: p2 x - p1 x.
            dY: p2 y - p1 y.
            dX > 0 ifTrue: [
                "p2 is to the right of p1"
                dY < 0 ifTrue: [
                    p1: r left  @ r bottom.
                    p2: r right @ r top.
                ] False: [
                    p1: r left  @ r top.
                    p2: r right @ r bottom.
                ].
            ] False: [
                "p1 is to the right of p2"
                dY < 0 ifTrue: [
                    p1: r right @ r bottom.
                    p2: r left  @ r top.
                ] False: [
                    p1: r right @ r top.
                    p2: r left  @ r bottom.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lineMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         statePrintString = ( |
            | 
            resend.statePrintString,  ' (', p1 printString, '->', p2 printString, ')').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         addVertex: pt = ( |
            | 
            changed.
            vertexOffsets: vertexOffsets copyAddLast: pt - position.
            changed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: basics\x7fComment: Makes a one bit deep X pixmap
  -- Randy, 5/18/95\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         asXBitMap = ( |
             c1.
             c8.
             pc.
            | 
            pc: pixmapCanvasPrototypeForMyScreen.
            c8: (pc copyForSameScreenAs: world winCanvases first
                            Width:  baseBounds width
                            Height: baseBounds height
                            Depth: 8).
            c1: (pc copyForSameScreenAs: world winCanvases first
                            Width:  baseBounds width
                            Height: baseBounds height
                            Depth: 1).
            c8 fillColor: (paint named: 'white').
            c8 fillPolygon: (vertexOffsets copyAddFirst: (0@0)) Color: (paint named: 'black').

            "SSLOWWW ! Be patient for anything big."
            c8 size x do: [ | :x |
              c8 size y do: [ | :y . pv |
                pv: (c8 drawable pixelValueAt: x@y).
                pv = (c8 indexForColor: (paint named: 'black')) ifTrue: [
                   c1 gc foreground: 1. 
                ] False: [
                   c1 gc foreground: 0.
                ].
                c1 drawable drawPoint: x@y GC: c1 gc.
              ].
            ].
            c8 close.
            c1 drawable "must send delete to this when you are done to free memory").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseBounds = ( |
             maxX <- 0.
             maxY <- 0.
             minX <- 0.
             minY <- 0.
            | 
            vertexOffsets do: [| :o. x. y | 
                x: o x.
                y: o y.
                minX: x min: minX.
                minY: y min: minY.
                maxX: x max: maxX.
                maxY: y max: maxY.
            ].
            ((position x + minX) @ (position y + minY)) #
            ((position x + maxX) @ (position y + maxY))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseContainsPt: pt = ( |
             inside <- 0.
             p.
             vp1.
             vp2.
            | 
            p: pt - position.
            (baseBounds includes: pt) ifTrue: [
              subListsBelow: p Do: [|:pb. :p1. :pn. :pa |
               vp1: (pb - p) crossProduct: (p1 - p).
               vp2: (pa - p) crossProduct: (pn - p).
               ((vp1 <= 0) && [vp2 > 0])
               || [ (vp1 > 0) && [ vp2 <= 0 ]]
                  ifTrue: ["'Crossing:' printLine." inside: inside + 1]
                  False: [ "'Not crossing' printLine"].
             ]].
            inside odd).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            c fillPolygon: vertices Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: newC = ( |
            | 
            "See comment in traits morph for general idea.
             Here, for legibility, do not change color."

            morphsDo: [| :m | m colorAll: newC ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             new.
            | 
            new: resend.copy.
            new vertexOffsets: vertexOffsets copy mapBy: [| :pt | pt copy ].
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: Examples\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         example1 = ( |
             pm.
             vs.
            | 
            pm: copy.
            vs: list copyRemoveAll.
            vs add: (0   @ 0).
            vs add: (100 @ 0).
            vs add: (60  @ 40).
            vs add: (100 @ 30).
            vs add: (100 @ 70).
            vs add: (60  @ 60).
            vs add: (100 @ 100).
            vs add: (0   @ 100).
            vs add: (40  @ 60).
            vs add: (0   @ 70).
            vs add: (0   @ 30).
            vs add: (40  @ 40).
            pm vertices: vs.
            pm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         flipLeftRight = ( |
            | 
            changed.
            vertexOffsets mapBy: [| :o | o x negate @ o y ].
            changed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         flipUpDown = ( |
            | 
            changed.
            vertexOffsets mapBy: [| :o | o x @ o y negate ].
            changed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         imageAsCursorForHand: aHandMorph = ( |
             canvXWin.
             conversion.
             curse.
             fg.
             pix.
            | 
            conversion: 16rFFFF. "Different scales of color range"
            fg: (((xlib xColor new) red: (color red   * conversion) asInteger) 
                                  green: (color green * conversion) asInteger) 
                                   blue: (color blue  * conversion) asInteger.
            pix: asXBitMap.
            canvXWin: (aHandMorph world winCanvasForHand: aHandMorph) platformWindow.
            curse: xlib cursor createOnDisplay: canvXWin display
                           Shape: pix
                            Mask: pix
                              FG: fg
                              BG: fg 
                         Hotspot: 0@0.
            canvXWin defineCursor: curse.
            fg delete.
            pix delete.
            curse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            evt shiftIsDown ifFalse: [
                resend.leftMouseDown: evt.
            ] True: [
                evt metaIsDown ifTrue: [
                    "Add a new point"
                    addVertex: 0@0.
                    movingOffset: vertexOffsets lastKey.
                ] False: [| mouseOffset. closest |
                    movingOffset: (offsetNearest: evt cursorPoint).
                    evt controlIsDown ifTrue: [
                        "Try to delete a point..."
                         numberOfSides > 3 ifTrue: [
                             "...but only if that would leave at least 3 sides"
                             movingOffset = -1 ifFalse: [
                               vertexOffsets: (vertexOffsets asSequence removeKey: movingOffset) asVector.
                             ] True: [ | p |
                               p: vertexOffsets first.
                               vertexOffsets: vertexOffsets copyRemoveFirst mapBy: [|:o| o - p ].
                               globalPosition: globalPosition + p.
                             ].
                             movingOffset: nil.
                             changed.
                         ].
                    ^self.   "don't subscribe to move events for delete"
                    ].
                ].
                evt sourceHand subscribeUntilAllUp: self.
            ].             
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot'
        
         middleMouseDown: evt = ( |
            | 
            evt shiftIsDown ifTrue: [
                color: paint copyRandom. 
                changed
             ] False: [ resend.middleMouseDown: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'polygonMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: evt = ( |
             newOffset.
            | 
            newOffset: (evt cursorPoint - globalPosition).
            movingOffset ifNotNil: [
                changed.
                movingOffset = -1 ifFalse: [
                  vertexOffsets at: movingOffset Put: newOffset.
                ] True: [
                  "move the others in the opposite direction"
                  vertexOffsets mapBy: [|:vo| vo - newOffset].
                  globalPosition: globalPosition + newOffset.
                ].
                changed.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfSides = ( |
            | vertexOffsets size + 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         offsetNearest: pt = ( |
             distSq.
             r.
             relPt.
            | 
            "Return the index from vertexOffsets closest to the given global point."

            relPt: pt - globalPosition.
            distSq: relPt square.
            r: -1.
            vertexOffsets do: [| :thisO. :i. thisD |
                thisD: (relPt - thisO) square.
                thisD < distSq ifTrue: [
                    r: i.
                    distSq: thisD.
                ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeRect: r = ( |
             bbnds.
            | 
            bbnds: baseBounds.
            position: position + (r origin - bbnds origin).
            ((bbnds  width = r  width) &&
             [bbnds height = r height]) ifFalse: [| factor. newVertices |
                "change shape to fit into r"
                factor: (r width  asFloat / bbnds width  asFloat) @
                        (r height asFloat / bbnds height asFloat).
                newVertices: vertices mapBy:
                    [| :o | (r origin + ((o - r origin) * factor)) asInteger ].
                vertices: newVertices.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         rot180 = ( |
            | 
            changed.
            vertexOffsets mapBy: [| :o | o x negate @ o y negate ].
            changed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         rot270 = ( |
            | 
            changed.
            vertexOffsets mapBy: [| :o | o y negate @ o x ].
            changed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         rot90 = ( |
            | 
            changed.
            vertexOffsets mapBy: [| :o | o y @ o x negate ].
            changed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         scaleBy: pt = ( |
            | 
            changed.
            vertexOffsets mapBy:
                [| :o | (pt x * o x) asInteger @ (pt y * o y) asInteger ].
            changed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         subListsBelow: p Do: blk = ( |
             i.
             i0.
             i1.
             in.
            | 
            " find pq where  pq y < p y "
            i0: 0.
            [ p y > (yAt: i0) ] whileTrue: [
               i0: (i0 + 1) % numberOfSides.
               i0 = 0 ifTrue: ["whole poly above p" ^self]
              ].
            i1: i0. i: 0. 
            [true] whileTrue: [
             "Find p1 where p y < p1 y "
             [ p y > (yAt: i1) ] whileTrue: [
                 i1: (i1 + 1) % numberOfSides.
                 i0 = i1 ifTrue: [^false].
                 i: i + 1. "to avoid looping - there seems to be an error"
                 i > (numberOfSides + 4) ifTrue: [ ^false]
               ].
             "pi1 pred above p - pi1 below p"

             "Find pn where  pn succ y < p y "
             in: i1. 
             [ (yAt: (in+1)%numberOfSides) > p y ] whileTrue: [
               in: (in + 1 ) % numberOfSides.
               in = i0 ifTrue: [^false].
               i: i + 1. "to avoid looping - there seems to be an error"
               i > numberOfSides ifTrue: [ ^false]
             ].
             blk value: ((xAt: (i1-1)%+ numberOfSides) @ (yAt: (i1-1) %+ numberOfSides))
                 With:  ((xAt: i1) @ (yAt: i1))
                 With:  ((xAt: in) @ (yAt: in))
                 With:  ((xAt: (in+1)% numberOfSides) @ (yAt: (in+1) %+ numberOfSides)).
             i1: (in + 1) %+ numberOfSides.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         vertices = ( |
            | 
            (vertexOffsets copy copyAddFirst: 0@0) mapBy: [| :o | position + o ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         vertices: newVertices = ( |
             vList.
            | 
            changed.
            vList: newVertices copy asList.
            vList isEmpty ifFalse: [ position: vList removeFirst ].
            vertexOffsets: (vList asVector mapBy: [| :o | o - position ]).
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         xAt: inx = ( |
            | 
            inx = 0 ifTrue: [ 0 ]
                    False: [ (vertexOffsets at: inx - 1) x ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'polygonMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         yAt: inx = ( |
            | 
            inx = 0 ifTrue: [ 0 ]
                    False: [ (vertexOffsets at: inx - 1) y ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionInListMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseBounds = ( |
            | position ## (width@height)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionInListMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
             box.
            | 
            box: baseBounds.
            c fillRectangle: box Color: color.
            (0 <= selectedIndex) ifTrue: [
                c fillRectangle: selectedTextBox Color: selectionColor.
            ].

            items do: [| :item. :i |
                c text: item At: (originForIndex: i)
                  FontSpec: fontSpec Color: textColor.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionInListMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinHeight = ( |
            | (items size * lineSpacing) + 8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionInListMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinWidth = ( |
             minW.
             w.
            | 
            minW: 10.
            w: topmostOwner.
            w isWorldMorph ifTrue: [| xfnt |
                xfnt: (w anyOpenWindowCanvas structForFontSpec: fontSpec).
                items do: [| :s | minW: (minW max: (xfnt textWidth: s)) ].
            ].
            minW + 8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionInListMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            evt sourceHand subscribeUntilAllUp: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionInListMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'selectionInListMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionInListMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: evt = ( |
             localP.
             offset.
            | 
            selectedIndex: (evt cursorPoint y - globalPosition y) / lineSpacing.
            (0 <= selectedIndex) && [selectedIndex < items size]
                ifFalse: [selectedIndex: -1].
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionInListMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         originForIndex: i = ( |
             box.
            | 
            box: baseBounds.
            (box left + 4) @ (box top + (lineSpacing * i succ) + -1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionInListMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionInListMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeRect: r = ( |
            | 
            position: r origin.
            width:    r width.
            height:   r height.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionInListMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         selectedTextBox = ( |
             box.
            | 
            box: baseBounds.
            rectangle
                from: ((box left  + 2) @ (box top + 2 + (lineSpacing * selectedIndex)))
                To:   ((box right - 2) @ (box top + 2 + (lineSpacing * selectedIndex succ)))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionInListMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         selection = ( |
            | 
            0 <= selectedIndex ifTrue: [ items at: selectedIndex ] False: [ nil ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectionInListMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         statePrintString = ( |
            | 
            resend.statePrintString, '(selectedIndex: ', selectedIndex printString, ')').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseBounds = ( |
            | position ## (width@height)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            isVertical ifTrue: [
              verticalDrawOn: c.
            ] False: [
              horizontalDrawOn: c.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinHeight = ( |
            | 
            orientation = vertical ifTrue: 15
              False: 8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinWidth = ( |
            | 
            orientation = vertical ifTrue: 8
              False: 15).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot'
        
         beHorizontal = ( |
            | 
            orientation: horizontal.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot'
        
         beVertical = ( |
            | 
            orientation: vertical.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: c = ( |
            | 
            resend.colorAll: c.
            sliderColor: c outlineColorForBackground.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: target setting\x7fModuleInfo: Module: morphLib InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: layout\x7fCategory: orientation values\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot'
        
         horizontal = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot'
        
         horizontalDrawOn: c = ( |
             box.
             sliderBox.
             sliderOffset.
             sliderX.
            | 
            box: baseBounds.
            sliderOffset: ((value - minValue) * (width - 2)) / (maxValue - minValue).

            " Gives left > right... Need to sync with horizontalMouseMove: evt "
            " sliderX: box right - ((sliderOffset max: 1) min: (width - 2)) asInteger. "
            sliderX: box left + ((sliderOffset max: 1) min: (width - 2)) asInteger.
            sliderBox: ((sliderX - 1)@(box top  "+ 1")) #
                       ((sliderX + 1)@(box bottom "- 1")).
            c fillRectangle: box            Color: color.
            c fillRectangle: sliderBox      Color: sliderColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot'
        
         horizontalMouseMove: evt = ( |
             localP.
             offset.
            | 
            localP: evt cursorPoint - globalPosition.
            offset: ((width - localP x) max: 0) min: width.
            " Gives left > right... Need to sync with horizontalDrawOn: "
            " value: minValue + ((offset * (maxValue - minValue)) asFloat / width). "
            value: maxValue - ((offset * (maxValue - minValue)) asFloat / width).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype beFlexible).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot'
        
         isHorizontal = ( |
            | 
            orientation = horizontal).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot'
        
         isVertical = ( |
            | 
            orientation = vertical).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            (evt sourceHand capabilitySet includes: capabilities pressButton) 
              ifFalse: [ ^ self ].
            evt sourceHand subscribeUntilAllUp: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: target IsPresentDo: [|:n| target: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: target setting\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
             menu.
            | 
            menu: ui2Menu copy color: nonpluggableOutliner menuColor.
            menu addButtonTarget: self ScriptBlock: [target setTarget] Label: 'Set Target'.
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            menu popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'sliderMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: evt = ( |
             localP.
             offset.
            | 
            changed.
            isVertical ifTrue: [
              verticalMouseMove: evt.
            ] False: [
              horizontalMouseMove: evt.
            ].
            notifyTarget.
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         notifyTarget = ( |
            | 
            (nil = target) || (nil = selector) ifFalse: [
                selector sendTo: target With: value.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: layout\x7fCategory: orientation values\x7fComment: Added to handle all sliderMorphs
that existed prior to adding the
horizontal sliderMorph\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot'
        
         orientation = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         propertySheets = ( |
            | 
            resend.propertySheets copyAddLast: 
                (sliderPropsMorph copyTarget: self)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeRect: r = ( |
            | 
            position: r origin.
            width:    r width.
            height:   r height.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: target setting\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         setTarget = ( |
             last.
             myBounds.
            | 
            "Set the receiver's target to the top morph below it."

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
                    ].
                ].
                (myBounds intersects: m globalBounds) ifTrue: [ last: m ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            resend.statePrintString,
                '(value: ', myValue printString,
                ' min: ',  minValue printString,
                ' max: ',  maxValue printString, ')').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         value = ( |
            | myValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         value: newValue = ( |
            | 
            myValue = newValue ifFalse: [
                myValue: newValue.
                notifyTarget.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: layout\x7fCategory: orientation values\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot'
        
         vertical = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot'
        
         verticalDrawOn: c = ( |
             box.
             sliderBox.
             sliderOffset.
             sliderY.
            | 
            box: baseBounds.
            sliderOffset: ((value - minValue) * (height - 2)) / (maxValue - minValue).
            sliderY: box bottom - ((sliderOffset max: 1) min: (height - 2)) asInteger.
            sliderBox: ((box left  "+ 1")@(sliderY - 1)) #
                       ((box right "- 1")@(sliderY + 1)).
            c fillRectangle: box            Color: color.
            c fillRectangle: sliderBox      Color: sliderColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot'
        
         verticalMouseMove: evt = ( |
             localP.
             offset.
            | 
            localP: evt cursorPoint - globalPosition.
            offset: ((height - localP y) max: 0) min: height.
            value: minValue + ((offset * (maxValue - minValue)) asFloat / height).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         wheelMovedBy: delta = ( |
            | 
            value: minValue max: maxValue min:
                 value + (delta  * (maxValue - minValue)).
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'spacerMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            "Optimization: suppress drawing if this morph's color matches
             that of its owner."

            (owner submorphVisible: self) ifTrue: [ resend.baseDrawOn: c ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'spacerMorph' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         copyH: hSpace Color: c = ( |
             new.
            | 
            new: copyRemoveAllMorphs color: c.
            new beRigidHorizontally.
            new beFlexibleVertically.
            new setWidth: hSpace.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'spacerMorph' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         copyV: vSpace Color: c = ( |
             new.
            | 
            new: copyRemoveAllMorphs color: c.
            new beFlexibleHorizontally.
            new beRigidVertically.
            new setHeight: vSpace.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'spacerMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'spacerMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'spacerMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: basics\x7fComment: Override in order to update the target of a copied
performanceMonitor whose target is itself; the copy
should be self-referential as well.

\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         baseCopy = ( |
             new.
            | 
            new: resend.baseCopy.
            self = target ifTrue: [ new target: new ].
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         copyPerformanceMonitor = ( |
             new.
            | 
            new: copy.
            new target: new.
            new expression: 'framesPerSecondString'.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: t Expression: e = ( |
             new.
            | 
            new: copy.
            new target: t.
            new expression: e.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: morphLib InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         elapsedMSecs = ( |
            | 
            time current - lastUpdateTime).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: performance monitor\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         framesPerSecondString = ( |
            | 
            elapsedMSecs > 0
                ifTrue: [ ((1000 * count) / elapsedMSecs) printString, ' frames/sec' ]
                 False: [ 'infinite frames/sec' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         getNewLabel = ( |
            | 
            target ifNotNil: [
                (expression evalInContext: (reflect: target) FileName: '<No file>') asString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: m Event: evt = ( |
            | isInWorld ifTrue: [ startGettingStepped ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: target IsPresentDo: [| :n | target: n ].
            resend.mapReferencesUsing: dict.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
            | popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'updatingLabelMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: performance monitor\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         msecsPerFrameString = ( |
            | 
            count > 0
                ifTrue: [ (elapsedMSecs / count) printString, ' msec/frame' ]
                 False: [ 'infinite msec/frame' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'labelMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy color: nonpluggableOutliner menuColor.
            menu addButtonTarget: self ScriptBlock: [target setTarget] Label: 'Set Target'.
            menu addButtonTarget: self
                     ScriptBlock: [(message copy receiver: target Selector: 'setExpression') forkForBirthEvent: event]
                           Label: 'Set Expression'.
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            menu popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         setExpression = ( |
            | 
            expression:
              (userQuery askString: 'What message should I send?' DefaultAnswer: expression)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         setTarget = ( |
             last.
             myBounds.
            | 
            "Set the receiver's target to the top morph below it."

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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: performance monitor\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         showFrameRate: showFrameRate = ( |
            | 
            showFrameRate
                ifTrue: [ expression: 'framesPerSecondString' ]
                 False: [ expression: 'msecsPerFrameString' ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         startGettingStepped = ( |
            | 
            startSampleInterval.
            resend.startGettingStepped.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: private'
        
         startSampleInterval = ( |
            | 
            count: 0.
            lastUpdateTime: time current.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'updatingLabelMorph' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: morphLib InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | 
            count: count + 1.
            elapsedMSecs > sampleInterval ifTrue: [
                changed.
                label: getNewLabel asString.
                startSampleInterval.
            ].
            self).
        } | ) 



 '-- Side effects'

 globals modules morphLib postFileIn
