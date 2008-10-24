 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot\x7fVisibility: public'
        
         generalLeafModel = bootstrap define: bootstrap stub -> 'globals' -> 'generalLeafModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalLeafModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalLeafModel.

CopyDowns:
globals generalModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> () From: ( | {
         'ModuleInfo: Module: generalLeafModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalLeafModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: finding the slot in situ\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot\x7fVisibility: public'
        
         addInSituButtonToHeader = ( |
            | 
            addButtonToHeader: buildSproutInSituButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: editing whole thing\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot'
        
         areMorphsRemovedWhenEditingWholeThing = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot'
        
         buildExpander = ( |
             lptm.
            | 
            lptm: pluggableOutlinerLeafPointerTailMorph copyForLeafOutliner: myOutliner.
            myOutliner expander: lptm headMorph firstMorph.
            lptm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: finding the slot in situ\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buildSproutInSituButton = ( |
            | 
            ((ui2Button copy
                   label: 'IN SITU'
                FontSpec: headerButtonFontSpec
               FontColor: ui2Button defaultFontColor)
             scriptBlock: [target sproutInSitu: event])
                  target: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot'
        
         buttonIcon = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '       ' &
    '       ' &
    '0000000' &
    '       ' &
    '0000000' &
    '       ' &
    '       ' ) asVector
 Colors: (
    (paint named: 'black') &
    (paint named: 'black')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: globals generalLeafModel parent buttonIcon.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot'
        
         constructItems = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: contents label\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot'
        
         contentsLabelFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'times' Size: 12 Style: 'italic') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals generalLeafModel parent contentsLabelFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: contents label\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsLengthLimit = 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot'
        
         expandSproutee = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: contents label string\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot\x7fVisibility: private'
        
         oneLinerContentsString = ( |
            | 
            referrent statePrintString copyAtMostWithEllipsis: 40).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot'
        
         outlinerForSprouting: evt IfNone: nb = ( |
            | 
            nb value: 'a child should have implemented me').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: copying & creating\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot\x7fVisibility: private'
        
         outlinerPrototype = ( |
            | 
            pluggableLeafOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalLeafModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot\x7fVisibility: public'
        
         preferredColor = ( |
             o.
            | 
            o: myOutliner owner.
            o isNil || [o isHandMorph] "don't change color when being carried"
                ifTrue: [myOutliner color]
                 False: [o color]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: finding the slot in situ\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot\x7fVisibility: public'
        
         removeInSituButtonFromHeader = ( |
            | 
            removeButtonFromHeader: buildSproutInSituButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot'
        
         showSlotContents = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: generalLeafModel InitialContents: FollowSlot'
        
         sprout: evt = ( |
            | 
            myOutliner sproutWithArrow: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: generalLeafModel InitialContents: FollowSlot'
        
         generalLeafModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'generalLeafModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'generalLeafModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules generalLeafModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalLeafModel' -> () From: ( | {
         'ModuleInfo: Module: generalLeafModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalLeafModel' -> () From: ( | {
         'ModuleInfo: Module: generalLeafModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalLeafModel' -> () From: ( | {
         'ModuleInfo: Module: generalLeafModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalLeafModel' -> () From: ( | {
         'ModuleInfo: Module: generalLeafModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalLeafModel' -> () From: ( | {
         'ModuleInfo: Module: generalLeafModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalLeafModel' -> () From: ( | {
         'ModuleInfo: Module: generalLeafModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'generalSlotModel
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'generalSlotModel' From: 'ui2/outliner'



 '-- Side effects'

 globals modules generalLeafModel postFileIn
