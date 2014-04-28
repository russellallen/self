 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         menuButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'menuButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals menuButton.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menuButton' -> () From: ( | {
         'ModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         container <- bootstrap stub -> 'globals' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menuButton' -> () From: ( | {
         'ModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         location <- bootstrap stub -> 'globals' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menuButton' -> () From: ( | {
         'ModuleInfo: Module: menuButton InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: public'
        
         menuItems <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         menuButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits menuButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menuButton' -> () From: ( | {
         'ModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'menuButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menuButton' -> () From: ( | {
         'ModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         size <- (1)@(1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: menuButton InitialContents: FollowSlot'
        
         menuButton = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'menuButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'menuButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules menuButton.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'menuButton' -> () From: ( | {
         'ModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'menuButton' -> () From: ( | {
         'ModuleInfo: Module: menuButton InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'menuButton' -> () From: ( | {
         'ModuleInfo: Module: menuButton InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'menuButton' -> () From: ( | {
         'ModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'menuButton' -> () From: ( | {
         'ModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> () From: ( | {
         'ModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         annotationButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'userInterface' -> 'annotationButton' -> () From: ( |
             {} = 'Comment: bundle of stuff for buttons that manipulate annotations--dmu\x7fModuleInfo: Creator: mixins userInterface annotationButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'annotationButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         changeCategoryTo: str = ( |
            | 
            annotationHolder category: str.
            body recreate.
            world display.
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'annotationButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         changeCommentTo: str = ( |
            | 
            annotationHolder comment: str.
            body recreate.
            world display.
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'annotationButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         changeModuleTo: str = ( |
            | 
            annotationHolder moduleInfo: 
              annotationHolder moduleInfo parse: str.
            body recreate.
            world display.
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'annotationButton' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         editCategory = ( |
            | 
            openTextEditorSelecting: annotationHolder category
                      Name: 'Category of ', annotationHolder name
                     Apply: 'changeCategoryTo:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'annotationButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         editCategoryString = ( |
            | editStringFor: 'category').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'annotationButton' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         editComment = ( |
            | 
            openTextEditorSelecting: annotationHolder comment
                               Name: 'Comment on ', annotationHolder name
                              Apply: 'changeCommentTo:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'annotationButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         editCommentString = ( |
            | editStringFor: 'comment').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'annotationButton' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         editIsComplete = ( |
            | 
            openTextEditorSelecting: annotationHolder isComplete storeString
                               Name: 'IsComplete on ', annotationHolder name
                              Apply: 'changeIsCompleteTo:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'annotationButton' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         editModule = ( |
            | 
            openTextEditorSelecting: annotationHolder moduleInfo asString
              Name: 'Module of ', annotationHolder name
              Apply: 'changeModuleTo:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'annotationButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         editModuleString = ( |
            | editStringFor: 'moduleInfo').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'annotationButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         editStringFor: annoField = ( | {
                 'ModuleInfo: Module: menuButton InitialContents: FollowSlot'
                
                 a.
                }  {
                 'ModuleInfo: Module: menuButton InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            a: annotationHolder annotation.
            s: (a has: annoField) ifTrue: [
                (a prefixFor: annoField), 
                ' ', 
                (
                    (a getField: annoField) asString 
                        copyAtMostWithEllipsis: editStringLimit
                )
            ] False: [
                'No ', annoField
            ].
            s shrinkwrapped).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'userInterface' -> 'annotationButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         editStringLimit = 50.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         animatedDrawPressed = ( |
            | 
            world prepareToDrawOnAcetate.
            world windowBitmap rectangle: (absoluteBound topLeft + (1@1)) #!
                                          (absoluteBound bottomRight - (2@2))
                                   Color: uiColors body.
            world windowBitmap line: absoluteBound topLeft
                                 To: absoluteBound topRight
                              Color: uiColors bodyDark.
            world windowBitmap line: absoluteBound topLeft
                                 To: absoluteBound bottomLeft
                              Color: uiColors bodyDark.
            world windowBitmap line: absoluteBound topRight
                                 To: absoluteBound bottomRight
                              Color: uiColors bodyLight.
            world windowBitmap line: absoluteBound bottomLeft
                                 To: absoluteBound bottomRight
                              Color: uiColors bodyLight.
            world prepareToDrawOnAll.
            world syncGraphics.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         animatedDrawUnpressed = ( |
            | 
            world prepareToDrawOnAcetate.
            world windowBitmap rectangle: (absoluteBound topLeft + (1@1)) #!
                                          (absoluteBound bottomRight - (2@2))
                                   Color: uiColors body.
            world windowBitmap rectangle: (absoluteBound topLeft + (1@1)) #!
                                          (absoluteBound bottomRight - (1@1))
                                   Color: uiColors bodyLight.
            world windowBitmap rectangle: absoluteBound topLeft #!
                                          (absoluteBound bottomRight - (2@2))
                                   Color: uiColors bodyDark.
            world prepareToDrawOnAll.
            world syncGraphics.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         busyRepair = ( |
            | drawBusy. repair. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: containing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         componentsDo: block = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         createOn: cpt = ( |
            | 
            container: cpt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | drawBodyEtchedRectangle: bound).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         drawBusy = ( |
            | drawBodySunkenRectangle: bound).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         drawPressed = ( |
            | 
            drawBodyRectangle: (bound topLeft + (1@1)) #!
                               (bound bottomRight - (2@2))
                        Color: uiColors body.
            drawBodySunkenRectangle: bound).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         drawRepair = ( |
            | draw.     repair. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         drawUnpressed = ( |
            | draw).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         erase = ( |
            | drawBodyFilledRectangle: bound Color: uiColors body).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseRepair = ( |
            | erase.    repair. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonDown = ( |
            | selectMenu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         menuPrototype = bootstrap stub -> 'globals' -> 'menu' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         noSelect: fixGraphics = ( |
            | fixGraphics value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         openTextEditor: contents Name: name Apply: selector = ( |
            | 
            openTextEditor: contents Name: name Apply: selector SelectionStart: 0@0 End: 0@0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         openTextEditor: contents Name: name Apply: selector SelectionStart: s End: e = ( | {
                 'ModuleInfo: Module: menuButton InitialContents: FollowSlot'
                
                 te.
                } 
            | 
            te: textEditor copyOn: world
                             Size: (body size x@ 80)
                               Do: [|:e| e name: name].
            te methodView setText: contents.           
            te methodView selectionStart: s End: e.
            te applyMessage: message copy receiver: self 
                                          Selector: selector.
            world addBodyOnTop: te.
            te location: textEditorLocation.
            te constrainFullBodyToWorld.
            te swoopDown.       
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         openTextEditorSelecting: contents Name: name Apply: selector = ( |
            | 
            openTextEditor: contents Name: name Apply: selector SelectionStart: 0@0 End: infinity@infinity.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'ModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: positioning\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         placeAt: pt = ( |
            | location: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: public'
        
         resize: sz = ( |
            | size: sz).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         select: sel FixGraphics: fixGraphics = ( |
            | fixGraphics value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menuButton' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: menuButton InitialContents: FollowSlot\x7fVisibility: private'
        
         selectMenu = ( |
            | 
            erase.
            body raise.
            repair.
            (menuPrototype copy
              createFromBound: absoluteBound Items: menuItems World: world)
                select: [ | :n |
                          busyRepair.
                          select: n FixGraphics: [ drawRepair ]. ]
                IfNone: [ noSelect: [ drawRepair ]. ].
            self).
        } | ) 



 '-- Side effects'

 globals modules menuButton postFileIn
