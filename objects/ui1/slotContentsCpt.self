 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot'
        
         slotContentsCpt = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'slotContentsCpt' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'slotContentsCpt' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules slotContentsCpt.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         slotContentsCpt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotContentsCpt' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotContentsCpt.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         button <- bootstrap stub -> 'globals' -> 'contentsButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot'
        
         contentsMirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'slots' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         location <- bootstrap stub -> 'globals' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         slotContentsCpt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotContentsCpt.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotContentsCpt' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         size <- (1)@(1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         slot <- bootstrap stub -> 'globals' -> 'slotCpt' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         text <- bootstrap stub -> 'globals' -> 'textLines' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         = sc = ( |
            | contentsMirror = sc contentsMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: miscellaneous\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot'
        
         changeContentsTo: c IfFail: fb = ( |
            | 
            slot changeContentsTo: c IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: containing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         componentsDo: block = ( |
            | block value: button).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: containing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         container = ( |
            | slot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         containsSelf = ( |
            | contentsMirror = body objMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsIsElided = ( | {
                 'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            "Answer true iff contents string does
             not tell the whole story.
             Apologies for the hacks--dmu"
            s: text asString.
            (largeMethodString = s)
            || ['...' isSuffixOf: s]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         create: cm On: slt = ( |
            | 
            contentsMirror: cm.
            slot: slt.
            text: textFor: contentsMirror.
            makeButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot'
        
         desprout = ( |
            | button desprout).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | drawText. button draw).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         drawText = ( |
            | drawBodyText: text At: textLocation Font: textFont).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         isAssignable = ( |
            | slot isAssignable).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         isParent = ( |
            | slot isParent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrivate = ( |
            | slot isPrivate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         isPublic = ( |
            | slot isPublic).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         isSprouted = ( |
            | button isSprouted).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         largeMethodString = '<a large method>'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         makeButton = ( |
            | button: contentsButton copy createOn: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         minSize = ( |
            | 
            boxSizing minSlotContentsSize: textSize
                               ButtonSize: button minSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         mustRecreateForSlot: actualSlot = ( |
            | " return true if must recreate "
            contentsMirror = actualSlot contents  ifFalse: [ ^ true ].
            text = (textFor: actualSlot contents) ifFalse: [ ^ true ].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: positioning\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         placeAt: pt = ( |
            | 
            location: pt.
            button placeAt: 
                boxSizing contentsButtonLocationContentsSize: size
                                                ButtonSize: button size
                                                  TextFont: textFont.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         printStringID = ( |
            | text asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         redrawArrow = ( |
            | button redrawArrow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         resize: sz = ( |
            | 
            size: sz.
            button resize: button minSize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: public'
        
         setContentsButtonCluster: cluster = ( |
            | button joinCluster: cluster).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot'
        
         showContents = ( |
            | contentsIsElided ifTrue: [sprout]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot'
        
         sprout = ( |
            | button sprout).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         textFont = ( |
            | 
            preferences useFontStyles && preferences contentsInSpecialFont
                ifTrue: [ | s |
                preferences mergeAssignmentSlots && isAssignable ifTrue: [
                    "display contents using visibility of assignment slot"
                    s: body objMirror slotAt: slot basicName, ':'.
                ] False: [
                    "display contents using my visibility"
                    s: slot slotInfo.
                ].
                s visibility isPublic ifTrue: [ ^ boxSizing boxPublicFont ].
                s visibility isPrivate ifTrue: [ ^ boxSizing boxPrivateFont ].
            ].
            boxSizing boxFont).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         textFor: conMir = ( |
             charWidthLimit = 50.
             lineLimit = 5.
             txt.
            | 
            (conMir isReflecteeMethod &&
            [conMir isReflecteeActivation not])
              ifTrue: [
                 txt: (selfMethodText copyForMethod: conMir) asMethod.
                 (txt width > charWidthLimit) ||
                 [txt numberOfLines > lineLimit]
                     ifTrue: [ txt: largeMethodString ].
             ] False: [
                 txt: (conMir nameSize: charWidthLimit) asTextLines ].
             txt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: positioning\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         textLocation = ( |
            | boxSizing contentsTextPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot\x7fVisibility: private'
        
         textSize = ( |
            | textFont sizeOfString: text asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotContentsCpt' -> () From: ( | {
         'ModuleInfo: Module: slotContentsCpt InitialContents: FollowSlot'
        
         unsprout = ( |
            | button unsprout).
        } | ) 



 '-- Side effects'

 globals modules slotContentsCpt postFileIn
