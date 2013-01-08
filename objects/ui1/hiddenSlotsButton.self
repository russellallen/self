 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         hiddenSlotsButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'hiddenSlotsButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals hiddenSlotsButton.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hiddenSlotsButton' -> () From: ( | {
         'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         body <- bootstrap stub -> 'globals' -> 'objectBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hiddenSlotsButton' -> () From: ( | {
         'ModuleInfo: Module: hiddenSlotsButton InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: public'
        
         groupItems <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hiddenSlotsButton' -> () From: ( | {
         'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         label <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hiddenSlotsButton' -> () From: ( | {
         'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         location <- bootstrap stub -> 'globals' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         hiddenSlotsButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits hiddenSlotsButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hiddenSlotsButton' -> () From: ( | {
         'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hiddenSlotsButton' -> () From: ( | {
         'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         size <- (1)@(1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot'
        
         hiddenSlotsButton = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'hiddenSlotsButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'hiddenSlotsButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules hiddenSlotsButton.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hiddenSlotsButton' -> () From: ( | {
         'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hiddenSlotsButton' -> () From: ( | {
         'ModuleInfo: Module: hiddenSlotsButton InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hiddenSlotsButton' -> () From: ( | {
         'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hiddenSlotsButton' -> () From: ( | {
         'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'hiddenSlotsButton' -> () From: ( | {
         'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: containing\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         container = ( |
            | body).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         createLabel = ( | {
                 'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot'
                
                 numHS <- 1.
                }  {
                 'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot'
                
                 plural <- ''.
                } 
            | 
            numHS: body numberOfHiddenSlots.
            numHS > 0 ifTrue: [
                plural: numHS = 1 ifTrue: '' False: 's'.
                label: numHS printString, ' more slot', plural.
            ] False: [
                label: noHiddenSlotsLabel ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         createOn: bod = ( |
            | 
            body: bod.
            createLabel.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | 
            drawBodyEtchedRectangle: bound.
            drawBodyText: label asTextLines At: labelLocation Font: labelFont.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         hideAllSlots = ( |
            | 
            body iconified ifFalse: [ body iconifyCursorCentered ].
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         labelFont = ( |
            | boxSizing buttonFont).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: positioning\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         labelLocation = ( |
            | 
            ((width - labelSize x) / 2) @ boxSizing hsButtonTopMargin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         labelSize = ( |
            | labelFont sizeOfString: label).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         menuItems = ( | {
                 'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot'
                
                 cats.
                }  {
                 'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot'
                
                 its.
                } 
            | 
            cats: body categoriesForMenu.
            cats size = 1
              ifTrue: [ its: cats first submenuItems ]
               False: [ its: treeBag copyRemoveAll.
                        cats do: [ | :item. :cat. | its at: cat Put: item ]. ].
            groupItems, its).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: InitializeToExpression: (hierarchicalMenu copy autosort: true)\x7fVisibility: private'
        
         menuPrototype = hierarchicalMenu copy autosort: true.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         minSize = ( |
            | boxSizing minHSButtonSize: labelSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         noHiddenSlotsLabel = '       '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'menuButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         printStringID = ( |
            | label).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButton* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonAccept = ( |
            | body hasSlots ifTrue: [hideAllSlots] 
            False:  [drawUnpressed]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonDown = ( |
            | 
            body raise.
            world display.
            rightButton.rightButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonPendingAccept: change = ( |
            | 
            change ifTrue: [ animatedDrawPressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonPendingReject: change = ( |
            | 
            change ifTrue: [ animatedDrawUnpressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonReject = ( |
            | drawUnpressed. world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hiddenSlotsButton' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot\x7fVisibility: private'
        
         select: sel FixGraphics: fixGraphics = ( | {
                 'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot'
                
                 bigyaya = bootstrap stub -> 'globals' -> 'false' -> ().
                }  {
                 'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot'
                
                 cutter.
                }  {
                 'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot'
                
                 isOneSlot <- bootstrap stub -> 'globals' -> 'false' -> ().
                }  {
                 'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot'
                
                 item.
                }  {
                 'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot'
                
                 numGroups <- 0.
                }  {
                 'ModuleInfo: Module: hiddenSlotsButton InitialContents: FollowSlot'
                
                 yyold.
                } 
            | 
                    sel size = 1 ifTrue: [ 
                        item: sel first.
                        isOneSlot: body showSelection: item.
                    ].
                    sel size = 2 ifTrue: [ 
                        item: sel last.
                        isOneSlot: body showSelection: item InCategory: sel first name
                    ].
            bigyaya ifTrue: [
                    yyold: body regions bodyLefts first center y.
                    cutter: [ | y2. sbb. yold. ynew. |
                      isOneSlot ifTrue: [
                        body slotMatchingName: item hiddenSlot name
                            IfPresent: [ | :x | sbb: x ]
                            IfAbsent: [ error: 'couldnt find slot' ].
                        "y1 and y2 must be INSIDE the bodyregions, thus the succ & pred"
                        yold: sbb location y succ.
                        y2: yold + sbb size y pred.
                        ynew: (yold + y2) / 2.
                        yold @ ynew. "sorry, I hate this use of @, but convenient"
                      ] False: [
                        yyold @ body regions bodyLefts first center y.
                      ].              
                    ].
                    animator showSlotOfBody: body CuttingBlock: cutter.
            ] False: [
                    world alterBody: body By: [ body recreateCentered ].
            ].
                    world display.
                    isOneSlot ifTrue: [body showContentsOfVisibleSlot: item hiddenSlot name IfAbsent: []].
                    self).
        } | ) 



 '-- Side effects'

 globals modules hiddenSlotsButton postFileIn
