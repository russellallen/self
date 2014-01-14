 '$Revision: 30.6 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Fonts\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         fontSpec = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fontSpec' -> () From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals fontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> () From: ( | {
         'Category: state\x7fComment: One of \'sans\', \'serif\', \'mono\'\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot'
        
         fGenericFamily = 'sans'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: fontSpec InitialContents: InitializeToExpression: (\'helvetica\')\x7fVisibility: private'
        
         fName <- 'helvetica'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: fontSpec InitialContents: InitializeToExpression: (11)\x7fVisibility: private'
        
         fSize <- 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: fontSpec InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         fStyle <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> () From: ( | {
         'ModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fontSpec parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | 
            x equalsFontSpec: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fComment: pairs are immutable\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         == x = ( |
            | = x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: creating / copying\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         copyName: n = ( |
            | 
            copyName: n Size: size Style: style).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: creating / copying\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         copyName: n Size: s = ( |
            | copyName: n Size: s Style: style).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: creating / copying\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         copyName: n Size: si Style: s = ( |
            | 
            ((copy name: n) size: si) style: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: creating / copying\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         copyName: n Style: s = ( |
            | copyName: n Size: size Style: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: creating / copying\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         copyName: n Style: st Size: si = ( |
            | copyName: n Size: si Style: st).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: creating / copying\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         copySize: s = ( |
            | 
            copyName: name Size: s Style: style).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: creating / copying\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         copyStyle: st = ( |
            | 
            copyName: name Size: size Style: st).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: private'
        
         equalsFontSpec: x = ( |
            | 
            ( name = x name )
            && [ ( style = x style )
            && [   size  = x size ] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: accessors\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot'
        
         generic = ( |
            | fGenericFamily).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: mutators\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot'
        
         generic: aString = ( |
            | fGenericFamily: aString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
            name hash ^^ style hash ^^ size hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: accessors\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | fName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: mutators\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: private'
        
         name: n = ( |
            | 
            fName: n uncapitalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | 'fontSpec<', name, ', ', size printString, ', ', style, '>').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: accessors\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot'
        
         size = ( |
            | 
            fSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: mutators\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: private'
        
         size: aNumber = ( |
            | fSize: aNumber).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            storeStringWorks ifTrue: [
                'fontSpec copyName: ', (name  storeStringIfFail: [|:e| ^fb value: e]),
                            ' Size: ', (size  storeStringIfFail: [|:e| ^fb value: e]),
                           ' Style: ', (style storeStringIfFail: [|:e| ^fb value: e])
            ] False: [fb value: 'storeString does not work for this child of pair']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: private'
        
         storeStringNeeds = ( |
            | fontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: private'
        
         storeStringWorks = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: accessors\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         style = ( |
            | fStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fontSpec' -> 'parent' -> () From: ( | {
         'Category: mutators\x7fModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: private'
        
         style: aString = ( |
            | fStyle: aString uncapitalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: fontSpec InitialContents: FollowSlot'
        
         fontSpec = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'fontSpec' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'fontSpec' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules fontSpec.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fontSpec' -> () From: ( | {
         'ModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fontSpec' -> () From: ( | {
         'ModuleInfo: Module: fontSpec InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fontSpec' -> () From: ( | {
         'ModuleInfo: Module: fontSpec InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fontSpec' -> () From: ( | {
         'ModuleInfo: Module: fontSpec InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fontSpec' -> () From: ( | {
         'ModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fontSpec' -> () From: ( | {
         'ModuleInfo: Module: fontSpec InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules fontSpec postFileIn
