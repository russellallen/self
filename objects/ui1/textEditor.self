 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         windowContext = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'windowContext' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals windowContext.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowContext' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         container <- bootstrap stub -> 'globals' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowContext' -> () From: ( | {
         'Comment: width and height of the context.\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         extent <- (100)@(100).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowContext' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         name <- 'First Context'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowContext' -> () From: ( | {
         'Comment: offset from parent window.\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         offset <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         windowContext = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'windowContext' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits windowContext.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowContext' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'windowContext' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowContext' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         componentsDo: block = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowContext' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         copySize: size = ( |
            | clone extent: size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowContext' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | drawFrame).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowContext' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         drawFrame = ( |
            | 
            drawBodySunkenRectangle: bound topLeft #! (bound bottomRight + (1@1))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowContext' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLine: p1 To: p2 = ( |
            | 
            graphic line: p1 To: p2 Color: uiColors text).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowContext' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         drawText: string At: pt = ( |
            | 
            graphic text: string 
                    At: pt+ offset 
                  Font: boxSizing textEditorFont 
                 Color: uiColors text).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowContext' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         flush = ( |
            | world flushGraphics. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowContext' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         graphic = ( |
            | container graphic).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowContext' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         location = ( |
            | offset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowContext' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowContext' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | extent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowContext' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            name, '(', bound printString, ') ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         button = bootstrap define: bootstrap stub -> 'globals' -> 'button' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'name' From:
             bootstrap remove: 'parent' From:
             globals windowContext copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'button' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals button.

CopyDowns:
globals windowContext. copy 
SlotsToOmit: name parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'button' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         command <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'button' -> 'command' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals button command.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'button' -> 'command' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         doIt: context = ( |
            | ('do: ', context printString) printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'button' -> 'command' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         doIt: context Shift: shift = ( |
            | doIt: context).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'button' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         name <- 'button'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         button = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'button' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits button.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'button' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'button' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         caret = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'caret' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals caret.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         context.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         extent <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         caret = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'caret' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits caret.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'caret' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         position <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         visible <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         myWindow = bootstrap define: bootstrap stub -> 'globals' -> 'myWindow' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals boxBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'myWindow' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals myWindow.

CopyDowns:
globals boxBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'myWindow' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         name <- 'Text Editor'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         myWindow = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'myWindow' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits myWindow.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'myWindow' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'myWindow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'myWindow' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         addContext: comp At: pt = ( |
            | 
            comp offset: pt.
            comp container: self.
            components add: comp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'myWindow' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         contextChange: con = ( |
            | 
            "change event from a context"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'myWindow' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | 
            graphic fillRectangle: size rect Color: uiColors body.
            componentsDo: [ | :c | c draw ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'myWindow' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'boxBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         textEditor = bootstrap define: bootstrap stub -> 'globals' -> 'textEditor' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'size' From:
             globals myWindow copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'textEditor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals textEditor.

CopyDowns:
globals myWindow. copy 
SlotsToOmit: parent size.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         applyButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         applyButtonName <- 'Apply'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         applyMessage.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         cancelButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         dismissButtonName <- 'Dismiss'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         interactive <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         methodSlider.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         textField = bootstrap define: bootstrap stub -> 'globals' -> 'textField' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'name' From:
             bootstrap remove: 'parent' From:
             globals windowContext copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'textField' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals textField.

CopyDowns:
globals windowContext. copy 
SlotsToOmit: name parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         methodView <- bootstrap stub -> 'globals' -> 'textField' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textEditor' -> () From: ( | {
         'Comment: hacked for dynamic resizing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         offsetFromBody <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         textEditor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'textEditor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits textEditor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'textEditor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeHandle.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         size <- (200)@(80).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         stayup <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         c.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         contents <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         current <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         hasSelection <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         in_ctrl_k <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         insertionPoint <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         isearchDirection <- 'forward'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         isearchMode <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         isearchString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         name <- 'text field'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         off <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         textField = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'textField' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits textField.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'textField' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionEnd <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         textApplication = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits textApplication.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         computeSize: s = ( |
            | (s x max: 200)@(s y max: 70)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOn: wrld = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 w.
                } 
            | 
            w: resend.copyOn: wrld.
            w init.
            w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOn: wrld Size: s = ( |
            | copyOn: wrld Size: s Do: []).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOn: wrld Size: s Do: blk = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 w.
                } 
            | 
            w: resend.copyOn: wrld.
            blk value: w.
            w size: computeSize: s.
            w init.
            w interactive: true.
            w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         currentGraphic = ( |
            | interactive ifTrue: [ window bitmap ] False: [ graphic ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         currentGraphicOffset: cpt = ( |
            | 
            interactive ifTrue: [ cpt absoluteLocation ]
                         False: [ cpt location + body offsetFromBody "resizehack" ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | 
            graphic draw.
            drawTitle.
            componentsDo: [ | :c | c draw ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         drawTitle = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 disableTitle = bootstrap stub -> 'globals' -> 'false' -> ().
                } 
            | 
            disableTitle ifTrue: [ ^ self "temporarily disable this feature" ].
            drawBodyText: printString
                      At: (10@(size y - 20))
                    Font: boxSizing textEditorFont).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         dynamicExpandSize: delta = ( |
            | 
            resize: (computeSize: size + delta) Reallocate: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         expandSize: delta = ( |
            | expandSize: delta Reallocate: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         expandSize: delta Reallocate: reallocate = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 m.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 oldLocation.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 oldRect.
                } 
            | 
            m: computeSize: size + delta.
            oldRect: size.
            oldLocation: location.
            resize: m Reallocate: reallocate.
            location: oldLocation.
            world  repairBodies: location##(m max: oldRect).
            world reclipArrows: body absoluteBound.
            world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         initGraphic = ( |
            | 
            size: size +
                  (boxSizing baseSideFaceWidth @ boxSizing baseTopFaceHeight) +
                  ((2 * sideMargin) @ topMargin).
            resizeGraphic).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'myWindow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         resize: ext = ( |
            | resize: ext Reallocate: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         resproutCopyOn: wrld = ( |
            | copyOn: wrld Size: size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         sideMargin = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textApplication' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         topMargin = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         addApply = ( |
            | 
            applyButton: (button copySize: 50@16) name: applyButtonName.
            applyButton  command: (|
                p* = traits clonable.
                textEditor.
                doIt: context = (| message |
                    message: textEditor applyMessage.
                    message ifNotNil: [
                        (message copy arguments:
                             message arguments copyAddLast:
                                 textEditor methodView contentsString) send
                        ifFalse: [^self].
                    ].
                    context body stayup ifFalse: [ context body banish ].
                    context world display.
                    self).
                doIt: context Shift: shift = (
                    "shiftkeydown means force stayup"
                    shift ifTrue: [ context body stayup: true ].
                    doIt: context. ).
            |) copy textEditor: self.
            addContext: applyButton At: (30@140) + boxFaceOffset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         contextChange: con = ( |
            | 
            con = methodSlider ifTrue: [ methodView scroll: con get_value ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         init = ( |
            | 
            offsetFromBody: 0@0.

            addApply.

            cancelButton: (button copySize: 64@16) name: dismissButtonName.
            cancelButton  command: (| 
                p* = traits clonable.
                textEditor.
                doIt: context = (textEditor display. context body banish).
                doIt: context Shift: shift = ( doIt: context ).
            |) copy textEditor: self.
            addContext: cancelButton At: (96@140) + boxFaceOffset.

            methodView: (methodView copySize: 300@100) name: 'text'.
            addContext: methodView At: (2@2) + boxFaceOffset + (16@0) +
                                       (topMargin @ sideMargin).
            methodView init.

            methodSlider: (slider copySize: 13@100) name: 'slider'.
            addContext: methodSlider At: (2@2) + boxFaceOffset + 
                                       (topMargin @ sideMargin).
            methodSlider value: 0.

            resizeHandle: resizeButton copySize: 10@10.
            addContext: resizeHandle At: 10@10.
            resize: size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         leavingTopNotify = ( |
            | 
            draw.
            display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'textApplication' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         resize: ext Reallocate: reallocate = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 line.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 w = 10.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 y.
                } 
            | 
            resend.resize: ext Reallocate: reallocate.

            methodView resize: (faceSize x - (2 * sideMargin) - 18)@
                               (faceSize y - topMargin - 26).

            methodSlider resize: 13@(faceSize y - topMargin - 26) succ.

            line: size y - 20.
            y: size x - 16.
            resizeHandle offset: y@(size y - 13).

            y: y - applyButton extent x - w.
            applyButton offset: y@line.

            y: y - cancelButton extent x - w.
            cancelButton offset: y@line.

            draw.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         resproutOn: wrld = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 e.
                } 
            | 
            e: resproutCopyOn: wrld.
            e location: location.
            e methodView addLinedTextToEnd: methodView contents.
            e methodView goto: methodView insertionPoint.
            wrld addBodyOnTop: e.
            e swoopDown.
            e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         addLinedTextToEnd: vec = ( |
            | 
            contents: vec copy.
            gotoEnd.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         addTextToEnd: str = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 first <- bootstrap stub -> 'globals' -> 'true' -> ().
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 nl.
                } 
            | 
            nl: str asTextLines.
            i: contents lastKey.
            contents: contents copySize: i + nl numberOfLines.
            nl do: [ | :line |
                first ifTrue: [ contents at: i Put: (contents at: i), line.
                                first: false. ]
                       False: [ contents at: i Put: line ].
                i: i succ.
            ].
            gotoEnd.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         apply = ( |
            | 
            world prepareToDrawOnAll.
            body applyButton command doIt: body applyButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: cursor navigation\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         backward_char = ( |
            | goto: prevCharPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         basicDraw = ( |
            | drawFrame. drawContents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: cursor navigation\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         beginning_of_line = ( |
            | goto: 0@insertionPoint y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         changeSelection = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 pt.
                } 
            | 
            "Incremental change of the text selection"
            pt: textGrid: (ptToGrid: loc).

            (inView: pt) ifFalse: [
              selectionEnd: pt.
              scrollIntoView: selectionEnd.
              drawContents. 
              ^flush
            ].

            hasSelection ifTrue: [ 
              selectionEnd = pt ifTrue: [^self]
            ] False: [
               pt = insertionPoint ifTrue: [^self].
               c off. hasSelection: true.
               selectionEnd: insertionPoint
            ].

            insertionPoint = pt ifTrue: [
               inSelection: [|:a. :b| 
                 selectionEnd: pt.
                 drawLinesFrom: a y To: b y
               ].
               c on. hasSelection: false
            ] False: [
               selectionEnd y = pt y ifTrue: [
                 selectionEnd: pt.
                 drawLine: pt y.
               ] False: [
                 inSelection: [|:a. :b|
                   selectionEnd: pt.
                   inSelection: [|:c. :d|
                     a = c ifTrue: [
                       drawLinesFrom: (b y min: d y) To: (b y max: d y)
                     ] False: [
                       b = d ifTrue: [
                         drawLinesFrom: (a y min: c y) To: (a y max: c y)
                       ] False: [
                         drawLinesFrom: (a y min: c y) To: (b y max: d y)
                       ]
                     ]
                   ]
                 ]
               ]
            ].
            flush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         changeSliderValue: redraw = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 v.
                } 
            | 
            v:  (linesToDraw < contents size ifTrue: [
                 off asFloat / (contents size - linesToDraw)
               ] False: 0) min: 1.0.
            container methodSlider changeValue: v Redraw: redraw).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         clearSelection = ( |
            | 
            "Remove the current selection"
            hasSelection ifFalse: [^self].
            inSelection: [| :a. :b |
              hasSelection: false.
              drawLinesFrom: a y To: b y.
            ].
            c on.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         clearText = ( |
            | setText: ''. gotoStart).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         clippedDo: blk = ( |
            | 
            currentGraphic setClipRectangle: (bound  copy origin: (bound origin + 1))
                                               translateBy: currentGraphicOffset: self.
            blk value.
            currentGraphic setNoClipMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         clippedWithCursorDo: blk = ( |
            | 
            clippedDo: [
              c off.
              blk value.
              hasSelection ifFalse: [ c on ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         completeSelection = ( |
            | 
            hasSelection ifFalse: [^self].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsString = ( |
            | 
            contents reduceWith: [|:s1. :s2| s1, '\n', s2]
                IfSingleton: [|:s1| s1]
                IfEmpty: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         coordinatesOfNext: str IfAbsent: block = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 currentPoint.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 strSize.
                } 
            | 
            "return the coordinates of the first occurence of str after
             the current insertionPoint"
            currentPoint: insertionPoint.
            strSize: str size.
            currentPoint x to: (contents at: currentPoint y) lastKey Do: [
                | :x |
                (match: str At: x @ currentPoint y) ifTrue: [
                    ^ x @ currentPoint y ].
            ].
            currentPoint y succ to: contents lastKey Do: [ | :y |
                0 to: (contents at: y) size - strSize Do: [ | :x |
                    (match: str At: x @ y) ifTrue: [ ^ x @ y ].
                ].
            ].
            block value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         coordinatesOfPrevious: str IfAbsent: block = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 currentPoint.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 strSize.
                } 
            | 
            "return the coordinates of the first occurence of str at or before
             the current insertionPoint"
            currentPoint: insertionPoint.
            strSize: str size.
            currentPoint x downTo: 0 Do: [
                | :x |
                (match: str At: x @ currentPoint y) ifTrue: [
                    ^ x @ currentPoint y ].
            ].
            currentPoint y pred downTo: 0 Do: [ | :y |
                (contents at: y) size - strSize downTo: 0 Do: [ | :x |
                    (match: str At: x @ y) ifTrue: [ ^ x @ y ].
                ].
            ].
            block value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         copySize: extent = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s: resend.copySize: extent.
            s isearchMode: false.
            s isearchString: ''.
            s initText.
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: selection commands\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         copy_cmd = ( |
            | 
            hasSelection ifTrue: [textBuffer contents: textInSelection ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         corner_offset = ( |
            | 1@1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         currentGraphic = ( |
            | body currentGraphic).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         currentGraphicOffset: cpt = ( |
            | body currentGraphicOffset: cpt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: selection commands\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         cut_cmd = ( |
            | copy_cmd. cut_cmd: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: selection commands\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         cut_cmd: silent = ( |
            | 
            hasSelection ifFalse: [^self].
            inSelection: [|:a. :b|
              insertionPoint: a.
              hasSelection: false.
              a y = b y ifTrue: [| l |
                "selection on same line"
                l: contents at: a y.
                contents at: a y Put: (l copyAtMost: a x), (l copyFrom: b x).
                silent ifFalse: [drawLinesFrom: a y To: a y].
                c on.
              ] False: [| line_no. diff |
                "multiple line to cut"
                contents at: a y Put: 
                  ((contents at: a y) copyAtMost: a x), 
                  ((contents at: b y) copyFrom: b x).
                line_no: a y succ.
                "delete lines [line_no..b y]"
                diff: (b y - line_no) succ.
                diff > 0 ifTrue: [
                   line_no upTo: contents size - diff Do: [|:i|
                     contents at: i Put: (contents at: i + diff)].
                  contents: contents copySize: contents size - diff.
                ].
                silent ifFalse: [drawContents].
              ]
            ].
            silent ifFalse: [flush].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         delete_char = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 col <- 0.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 line <- ''.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 lineno <- 0.
                } 
            | 
            hasSelection ifTrue: [ ^cut_cmd ].
            lineno: insertionPoint y.
            line: contents at: lineno.
            col: insertionPoint x.
            col = 0 ifTrue: [
              join_with_prev_line.
              scrollIntoView.
              basicDraw.
            ] False: [
                contents at: lineno Put:
                ((line copyAtMost: col pred), (line copyFrom: col)).
                insertionPoint: insertionPoint - (1@0).
                drawLine: lineno.
            ].
            flush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         delete_line = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 line <- ''.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 lineno <- 0.
                } 
            | 
            lineno: insertionPoint y.
            line: contents at: lineno.

            (insertionPoint x > 0) || [ lineno = contents size pred ] ifTrue: [ 
              contents at: lineno Put: (line copyAtMost: insertionPoint x).
              line: line copyFrom: insertionPoint x.
              drawLine: lineno.          
            ] False: [
              lineno upTo: contents size pred Do:[|:i|
                 contents at: i Put: (contents at: i succ)].
              contents: contents copySize: (contents size pred).
              line: line, '\n'.
              scrollIntoView.
              drawContents.
            ].

            in_ctrl_k ifFalse: [ textBuffer contents: '' ].
            textBuffer contents:  textBuffer contents, line.
            in_ctrl_k: true.

            flush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         delete_next_char = ( |
            | insertionPoint = nextCharPosition ifTrue: [^self "at end"].
            forward_char.
            delete_char).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         delete_word_backwards = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 col <- 0.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 line <- ''.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 lineno <- 0.
                } 
            | 
            lineno: insertionPoint y.
            line: contents at: lineno.
            col: insertionPoint x.
            col = 0 ifFalse: [ | index |
                index: col.
                [| :exit. c |
                  index = 0 ifTrue: exit.
                  c: line at: index pred.
                  index = col ifFalse: [
                    (c isLetter || c isDigit || (c == ':') ) ifFalse: exit.
                  ].
                  index: index pred.
                ] loopExit.

                contents at: lineno Put:
                ((line copyAtMost: index), (line copyFrom: col)).
                insertionPoint: index@insertionPoint y.
                drawLine: lineno.
            ].
            flush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 int.
                } 
            | 
            int: interactive.
            interactive: false.
            basicDraw.
            interactive: int).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         drawContents = ( |
            | 
            clippedWithCursorDo: [
                off upTo: off + linesToDraw Do: [|:i| drawLine1: i ]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         drawLine1: line_no = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 hl_range <- (0)@(0).
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 left_top <- (0)@(0).
                } 
            | 
            hl_range: (lineSelection: line_no).
            hl_range: (hl_range x * fontWidth)@
                      (hl_range y * fontWidth min: extent x).
            left_top: corner_offset + (0@(line_height *(line_no - off))).

            "draw the background"
            fill_rectangle: left_top ##! 
                            (hl_range x @ line_height) Inv: false.
            fill_rectangle: (left_top addX: hl_range x) ##!
                            (hl_range y @ line_height) Inv: true.
            fill_rectangle: (left_top addX: hl_range y) ##!
                            (extent x @ line_height)   Inv: false.

            "draw the text"
            line_no < contents size ifTrue: [
              drawText: (contents at: line_no)
                    At: left_top + (2@1)
                 Color: uiColors text
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLine: no = ( |
            | clippedWithCursorDo: [drawLine1: no]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLinesFrom: from To: to = ( |
            | 
            clippedWithCursorDo: [ from to: to Do: [|:i| drawLine1: i ]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         drawOffset = (2)@(2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         drawText: string At: pt Color: c = ( |
            | 
            currentGraphic text: string 
                             At: pt + (currentGraphicOffset: self)
                           Font: boxSizing textEditorFont 
                          Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: cursor navigation\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         end_of_line = ( |
            | goto: maxSmallInt@insertionPoint y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         fill_rectangle: rect Inv: inv = ( |
            | 
            rect width = 0 ifFalse: [
              currentGraphic
                fillRectangle: (rect translateBy: currentGraphicOffset: self)
                       Color: inv ifTrue: [ uiColors bodyLight ]
                                   False: [ uiColors body ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         fontHeight = ( |
            | boxSizing textEditorFont height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         fontWidth = ( |
            | boxSizing textEditorFont width).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: cursor navigation\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         forward_char = ( |
            | goto: nextCharPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         goto: pt = ( |
            | 
            clearSelection.
            insertionPoint: textGrid: pt.
            inView ifFalse: [ scrollIntoView. drawContents ]
                      True: [ clippedDo: [c adjust]].
            flush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         gotoEnd = ( |
            | goto: contents last size @ contents size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         gotoStart = ( |
            | goto: 0@0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         gridToPt: p = ( |
            | ((p x * fontWidth)@
            ((p y - off)* fontHeight succ succ)) + 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         hit: pt = ( |
            | interactive: true. goto: ptToGrid: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         inSelection: blk = ( |
            | 
            hasSelection ifTrue: [
              insertionPoint y > selectionEnd y ifTrue: [
                ^blk value: selectionEnd With: insertionPoint ].
              (insertionPoint y = selectionEnd y) && [
                insertionPoint x > selectionEnd x ifTrue: [
                  ^blk value: selectionEnd With: insertionPoint ]].
              blk value: insertionPoint With: selectionEnd ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         inView = ( |
            | inView: insertionPoint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         inView: pt = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 offset.
                } 
            | 
            offset: pt y - off.
            (offset >= 0) && [ offset < linesInView ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         init = ( |
            | c: caret copyFor: self Size: 6@13).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         initText = ( |
            | setText: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         insertCode: keycode String: str = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 char <- 'a'.
                } 
            | 
            in_ctrl_k ifTrue: [
              in_ctrl_k: (str size = 1) && [ (str at: 0) asByte = 11 ]].

            str size = 0 ifTrue:  [^interpretCode: keycode].
            str size = 1 ifFalse: [^false].
            char: str at: 0.

            "Backspace" char asByte = 127 ifTrue: [ ^delete_char           ].
            "Ctrl a"    char asByte = 1   ifTrue: [ ^beginning_of_line     ].
            "Ctrl b"    char asByte = 2   ifTrue: [ ^backward_char         ].
            "Ctrl d"    char asByte = 4   ifTrue: [ ^delete_next_char      ].
            "Ctrl e"    char asByte = 5   ifTrue: [ ^end_of_line           ].
            "Ctrl f"    char asByte = 6   ifTrue: [ ^forward_char          ].
            "Ctrl h"    char asByte = 8   ifTrue: [ ^delete_char           ].
            "Ctrl j"    char asByte = 10  ifTrue: [ ^split_and_indent_line ].
            "Ctrl k"    char asByte = 11  ifTrue: [ ^delete_line           ].
            "Ctrl l"    char asByte = 12  ifTrue: [ ^basicDraw             ].
            "Ctrl n"    char asByte = 14  ifTrue: [ ^next_line             ].
            "Ctrl o"    char asByte = 15  ifTrue: [ ^open_line             ].
            "Ctrl p"    char asByte = 16  ifTrue: [ ^previous_line         ].
            "Ctrl r"    char asByte = 18  ifTrue: [ ^isearchBackwardStart  ].
            "Ctrl s"    char asByte = 19  ifTrue: [ ^isearchStart          ].
            "Ctrl t"    char asByte = 20  ifTrue: [ ^transpose_chars       ].
            "Ctrl w"    char asByte = 23  ifTrue: [ ^delete_word_backwards ].
            "Crtl y"    char asByte = 25  ifTrue: [ ^paste_cmd             ].

            char = '\r' ifTrue: [
                "meta-return is the same as hitting the apply/eval button"
                cursor metaKeyDown ifTrue: [ apply ]
                                    False: [ split_line ].
            ] False: [
              char isPrintable ifTrue: [ insert_char: char ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         insert_char: char = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 col <- 0.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 line <- ''.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 lineno <- 0.
                } 
            | 
            hasSelection ifTrue: [ cut_cmd ].
            lineno: insertionPoint y.
            line: contents at: lineno.
            col: insertionPoint x.
            contents at: lineno Put:
            ((line copyAtMost: col), char,  (line copyFrom: col)).
            insertionPoint: insertionPoint + (1@0).
            drawLine: lineno.
            flush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         interactive = ( |
            | body interactive).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         interactive: bool = ( |
            | body interactive: bool).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         interpretCode: code = ( |
            | 
            "Cursor keys"
            code = 34  ifTrue: [ ^next_line     ].
            code = 31  ifTrue: [ ^backward_char ].
            code = 27  ifTrue: [ ^previous_line ].
            code = 35  ifTrue: [ ^forward_char  ].

            "Cursor keys on numerical pad"
            code = 120 ifTrue: [ ^next_line     ].
            code = 98  ifTrue: [ ^backward_char ].
            code = 76  ifTrue: [ ^previous_line ].
            code = 100 ifTrue: [ ^forward_char  ].

            "Cut Copy and Paste keys"
            code = 33  ifTrue: [ ^undo_cmd      ].
            code = 58  ifTrue: [ ^copy_cmd      ].
            code = 80  ifTrue: [ ^paste_cmd     ].
            code = 104 ifTrue: [ ^cut_cmd       ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         isearchAgain = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 currentPoint.
                } 
            | 
            hasSelection ifFalse: [ ^ search: isearchString ].
            currentPoint: insertionPoint.
            insertionPoint: selectionEnd.
            search: isearchString IfFail: [
                select: currentPoint To: selectionEnd.
                '\a' print. "bell"
                transcript printLine: 'Failing I-search: ', isearchString. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         isearchBackwardAgain = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 currentPoint.
                } 
            | 
            hasSelection ifFalse: [ ^ searchBackward: isearchString ].
            currentPoint: insertionPoint.
            insertionPoint: prevCharPosition.
            searchBackward: isearchString IfFail: [
                select: currentPoint To: selectionEnd.
                '\a' print. "bell"
                transcript printLine: 'Failing I-search backward: ',
                                      isearchString. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         isearchBackwardStart = ( |
            | isearchStart: 'backward').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         isearchDelete = ( |
            | 
            isearchString isEmpty ifTrue: [ ^ self ].
            isearchString: isearchString copyWithoutLast.
            search: isearchString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         isearchKey: keycode String: str = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 char.
                } 
            | 
            str size = 0 ifTrue: [ ^ self ].
            char: str at: 0.
            char asByte = 19 "^S" ifTrue: [ ^ isearchAgain ].
            char asByte = 18 "^R" ifTrue: [ ^ isearchBackwardAgain ].
            char asByte = 127 "del" ifTrue: [ ^ isearchDelete ].

            char isPrintable ifFalse: [ ^ isearchStop: keycode String: str ].

            isearchString: isearchString, char.
            isearchDirection = 'forward' ifTrue: [
                ^ search: isearchString ].
            isearchDirection = 'backward' ifTrue: [
                ^ searchBackward: isearchString ].
            error: 'unknown isearch direction').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         isearchStart = ( |
            | isearchStart: 'forward').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         isearchStart: dir = ( |
            | 
            isearchMode: true.
            isearchDirection: dir.
            isearchString: ''.
            container onTop ifFalse: [ container raise. world display. ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         isearchStop = ( |
            | isearchMode: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         isearchStop: keycode String: str = ( |
            | 
            isearchStop.
            goto: selectionEnd.
            keyPress: keycode String: str).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         join_with_prev_line = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 col.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 line.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 lineno.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 nc.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 subStr.
                } 
            | 
            lineno: insertionPoint y.
            line: contents at: lineno.
            col: insertionPoint x.
            lineno > 0 ifTrue: [| inCol <- 0. predLine. | 
                predLine:  contents at: lineno pred.
                inCol: predLine size.

                lineno pred upTo: contents size pred Do:[|:i|
                    contents at: i Put: (contents at: i succ)].

                contents at: lineno pred Put: (predLine, line).

                contents: contents copySize: (contents size pred).
                insertionPoint: inCol@lineno pred.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         keyPress: keycode String: str = ( |
            | 
            isearchMode ifTrue: [ ^ isearchKey: keycode String: str ].
            interactive: true.
            container onTop ifFalse: [ container raise. world display. ].
            insertCode: keycode String: str.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: cursor navigation\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         lastPositionOfLine: n = ( |
            | (contents at: n) size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButton* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonAccept = ( |
            | completeSelection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonDown = ( |
            | 
            isearchStop.
            container onTop ifFalse: [ container raise. world display. ].
            hit: loc.
            leftButton.leftButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingAccept: change = ( |
            | changeSelection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingReject: change = ( |
            | 
            [ changeSelection ] untilTrue:
               [ container window eventsPending > 0 ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonReject = ( |
            | completeSelection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         lineSelection: lineno = ( |
            | 
            inSelection: [|:a. :b| 
              lineno < a y ifTrue: [^0@0].
              lineno = a y ifTrue: [
                ^lineno = b y ifTrue: a x@b x False: a x@maxSmallInt 
              ].
              lineno < b y ifTrue: [^0@maxSmallInt ].
              lineno = b y ifTrue: [^0@b x]
            ].
            0@0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         line_height = ( |
            | fontHeight succ succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         linesInView = ( |
            | extent y /- line_height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         linesToDraw = ( |
            | 
            ["changed for" quartz].
            ( extent y /~ line_height) asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         loc = ( |
            | cursor location - absoluteLocation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         match: str At: pt = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 i <- 0.
                } 
            | 
            str do: [ | :c |
                (matchChar: c At: (pt addX: i)) ifFalse: [ ^ false ].
                i: i succ ].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         matchChar: c At: pt = ( |
            | 
            matchChar: c
                   To: ((contents at: pt y IfAbsent: [ ^ false ])
                                  at: pt x IfAbsent: [ ^ false ])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         matchChar: c1 To: c2 = ( |
            | 
            preferences isearchIgnoreCase
                ifTrue: [ c1 uncapitalize = c2 uncapitalize ]
                 False: [ c1 = c2 ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: cursor navigation\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         nextCharPosition = ( |
            | 
            insertionPoint x = (lastPositionOfLine: insertionPoint y) ifTrue: [
                insertionPoint y = contents lastKey
                    ifTrue: [ insertionPoint ]
                     False: [ 0 @ insertionPoint y succ ]
            ] False: [ insertionPoint x succ @ insertionPoint y ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: cursor navigation\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         next_line = ( |
            | goto: insertionPoint x@insertionPoint y succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         open_line = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 curr.
                } 
            | 
            curr: insertionPoint.
            split_line.
            goto: curr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'windowContext' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: selection commands\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         paste_cmd = ( |
            | 
            hasSelection ifTrue: [ cut_cmd: true ].
            textBuffer contents asString do: [|:c|
              c = '\n' ifTrue: [ split_line ] False: [ insert_char: c ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: cursor navigation\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         prevCharPosition = ( |
            | 
            insertionPoint x = 0 ifTrue: [
                insertionPoint y = 0
                    ifTrue: [ insertionPoint ]
                     False: [ (lastPositionOfLine: insertionPoint y pred) @
                              insertionPoint y pred ]
            ] False: [ insertionPoint x pred @ insertionPoint y ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: cursor navigation\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         previous_line = ( |
            | goto: insertionPoint x@insertionPoint y pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         ptToGrid: p = ( |
            | 
            (((p x - 2) / fontWidth)@(((p y - 2)/ line_height) + off)) floor asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         resize: ext = ( |
            | 
            extent: ext.
            "scroll if necessary"
            (contents size - off) < linesInView ifTrue: [
               off: contents size - linesInView max: 0.
            ].
            changeSliderValue: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         scroll: value = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 lineToScroll <- 0.
                } 
            | 
            "called when using the scrollbar, value in [0.0, 1.0]"
            lineToScroll: contents size - linesInView.
            lineToScroll > 0 ifTrue: [| new_off <- 0 |
              "compute first line to display"
              new_off: (value * lineToScroll) asInteger.
              off = new_off ifFalse: [ off: new_off. drawContents ] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         scrollIntoView = ( |
            | scrollIntoView: insertionPoint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         scrollIntoView: pt = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 offset.
                } 
            | 
            offset: pt y - off.
            offset < 0 ifTrue: [
              off: off + offset max: 0.
            ].
            offset >= linesInView ifTrue: [
              off: off + (offset - linesInView) succ min: 
                   contents size - linesInView.
            ].
            changeSliderValue: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         search: str = ( |
            | 
            search: str IfFail: [
                '\a' print. "bell"
                ^ transcript printLine: 'Failing I-search: ', str ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         search: str IfFail: block = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 p.
                } 
            | 
            p: coordinatesOfNext: str IfAbsent: [ ^ block value ].
            select: p To: p addX: str size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         searchBackward: str = ( |
            | 
            searchBackward: str IfFail: [
                '\a' print. "bell"
                ^ transcript printLine: 'Failing I-search backward: ', str ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         searchBackward: str IfFail: block = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 p.
                } 
            | 
            p: coordinatesOfPrevious: str IfAbsent: [ ^ block value ].
            select: p To: p addX: str size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         select: pt1 To: pt2 = ( |
            | 
            goto: pt1.
            selectionEnd: pt2.
            c off.
            hasSelection: true.
            drawLinesFrom: pt1 y To: pt2 y.
            flush.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionLines = ( |
            | inSelection: [|:a. :b| a y@b y]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionStart: start End: end = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 p1.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 p2.
                } 
            | 
            p1: textGrid: start.
            p2: textGrid: end.
            preferences highlightParseError && [ p1 != p2 ] ifTrue: [
              insertionPoint: p1.
              selectionEnd:   p2.
              hasSelection: true.
              scrollIntoView: start.
              drawContents. 
              flush.
            ] False: [ goto: start ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         setText: text = ( |
            | contents: (textLines copyLines: text) lines asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         split_and_indent_line = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 col.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 line.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 lineno.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 spcs.
                } 
            | 
            col:  insertionPoint x.
            lineno:  insertionPoint y.
            line:  contents at: lineno.
            spcs:  line leadingWhiteSpace.
            contents
               at: lineno
              Put: (line copySize: col), 
                   (line copySize: spcs),
                   (line copyFrom: col).
            split_line.
            goto: spcs @ insertionPoint y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         split_line = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 col.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 line.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 lineno.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 nc.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 subStr.
                } 
            | 
            hasSelection ifTrue: [ cut_cmd ].
            nc: contents copySize: (contents size succ).
            lineno: insertionPoint y.
            line: contents at: lineno.
            col: insertionPoint x.
            contents size pred downTo: lineno Do: [|:i|
                nc at: i succ Put: nc at: i ].
            subStr:  (line copyFrom: col).
            nc at: lineno Put: (line copyAtMost: col).
            nc at: lineno succ Put: subStr.
            contents: nc.
            insertionPoint: 0@(insertionPoint y + 1).
            scrollIntoView.
            basicDraw
            flush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         textGrid: pt = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 col <- 0.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 line.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 lineno <- 0.
                } 
            | 
            lineno: pt y max: 0.
            lineno >= contents size ifTrue: [ lineno: contents size pred ].
            line: contents at: lineno.
            col: pt x max: 0.
            col > line size ifTrue: [ col: line size ].
            col@lineno).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         textInSelection = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 str <- ''.
                } 
            | 
            inSelection: [| :a. :b |
              a y = b y ifTrue: [
                str: (contents at: a y).
                ^str copyFrom: a x UpTo: b x min: str size.
              ].
              str: (contents at: a y) copyFrom: a x.
              str: str, '\n'.
              a y succ upTo: b y Do: [|:i|
                str: str, (contents at: i), '\n' ].
              ^str, ((contents at: b y) copyAtMost: b x).
            ].
            '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         transpose_chars = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 col.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 line.
                } 
            | 
            line:  contents at: insertionPoint y.
             col:  insertionPoint x.
            col > 1
              ifTrue: [| tmp |
                                         tmp: line at: col - 2.
                       line at: col - 2  Put: line at: col pred.
                       line at: col pred Put: tmp.
                       drawLine: insertionPoint y.
                       flush]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textField' -> () From: ( | {
         'Category: selection commands\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         undo_cmd = ( |
            | 'Undo not implemented yet' printLine. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         demoEditor = bootstrap define: bootstrap stub -> 'globals' -> 'demoEditor' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals textEditor copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'demoEditor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals demoEditor.

CopyDowns:
globals textEditor. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'demoEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         index <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         demoEditor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'demoEditor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits demoEditor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'demoEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'demoEditor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         evalEditor = bootstrap define: bootstrap stub -> 'globals' -> 'evalEditor' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'applyButtonName' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'size' From:
             globals textEditor copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'evalEditor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals evalEditor.

CopyDowns:
globals textEditor. copy 
SlotsToOmit: applyButtonName parent size.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evalEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         applyButtonName <- 'Eval'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         evalEditor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'evalEditor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits evalEditor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evalEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'evalEditor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evalEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: InitializeToExpression: (reflect: lobby)'
        
         receiver <- reflect: lobby.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evalEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         size <- (170)@(80).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         fileEditor = bootstrap define: bootstrap stub -> 'globals' -> 'fileEditor' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'applyButtonName' From:
             bootstrap remove: 'name' From:
             bootstrap remove: 'parent' From:
             globals textEditor copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'fileEditor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals fileEditor.

CopyDowns:
globals textEditor. copy 
SlotsToOmit: applyButtonName name parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fileEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         applyButtonName <- 'Save'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fileEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         fileName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fileEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         name <- 'Self editor'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         fileEditor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fileEditor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits fileEditor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fileEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'fileEditor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         textEditor = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'textEditor' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'textEditor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules textEditor.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         myComment <- 'Lars\' text editor'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'textEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeButton = bootstrap define: bootstrap stub -> 'globals' -> 'resizeButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'name' From:
             bootstrap remove: 'parent' From:
             globals windowContext copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'resizeButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals resizeButton.

CopyDowns:
globals windowContext. copy 
SlotsToOmit: name parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'resizeButton' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         cursorOffset <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'resizeButton' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         name <- 'resize button'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'resizeButton' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         newValue <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'resizeButton' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         oldValue <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'resizeButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits resizeButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'resizeButton' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'resizeButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'resizeButton' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         savedBitmapImage.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         slider = bootstrap define: bootstrap stub -> 'globals' -> 'slider' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'name' From:
             bootstrap remove: 'parent' From:
             globals windowContext copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slider' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slider.

CopyDowns:
globals windowContext. copy 
SlotsToOmit: name parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slider' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         command <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slider' -> 'command' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slider command.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slider' -> 'command' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         doIt: context = ( |
            | ('do: ', context printString) printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slider' -> 'command' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         doIt: context Shift: shift = ( |
            | doIt: context).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slider' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         inner_box <- bootstrap stub -> 'globals' -> 'rectangle' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slider' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         name <- 'slider'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         slider = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slider' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slider.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slider' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slider' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slider' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         value <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slider' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         value_box <- bootstrap stub -> 'globals' -> 'rectangle' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         slotEditor = bootstrap define: bootstrap stub -> 'globals' -> 'slotEditor' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'size' From:
             globals textEditor copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotEditor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotEditor.

CopyDowns:
globals textEditor. copy 
SlotsToOmit: parent size.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         failMessage.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         slotEditor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotEditor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotEditor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'slotEditor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: InitializeToExpression: (reflect: lobby)'
        
         receiver <- reflect: lobby.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         size <- (170)@(80).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         successMessage.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         textBuffer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'textBuffer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals textBuffer.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textBuffer' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         contents <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textBuffer' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'button' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         animatedDrawPressed = ( |
            | 
            world prepareToDrawOnAcetate.
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'button' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         animatedDrawUnpressed = ( |
            | 
            world prepareToDrawOnAcetate.
            world windowBitmap line: absoluteBound topLeft
                                 To: absoluteBound topRight
                              Color: uiColors bodyLight.
            world windowBitmap line: absoluteBound topLeft
                                 To: absoluteBound bottomLeft
                              Color: uiColors bodyLight.
            world windowBitmap line: absoluteBound topRight
                                 To: absoluteBound bottomRight
                              Color: uiColors bodyDark.
            world windowBitmap line: absoluteBound bottomLeft
                                 To: absoluteBound bottomRight
                              Color: uiColors bodyDark.
            world prepareToDrawOnAll.
            world syncGraphics.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'button' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | 
            drawBodyRaisedRectangle: bound.
            drawBodyFilledRectangle: (bound indent: 1) Color:  uiColors body.
            drawText.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'button' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         drawText = ( |
            | 
            drawBodyText: name asTextLines
                      At: textOffset
                    Font: boxSizing fixedEditorFont).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'button' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButton* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'button' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonAccept = ( |
            | 
            command doIt: self Shift: cursor shiftKeyDown.
            repair).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'button' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonDown = ( |
            | 
            body draw.
            body raise.
            world display.
            leftButton.leftButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'button' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingAccept: change = ( |
            | 
            change ifTrue: [ animatedDrawPressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'button' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingReject: change = ( |
            | 
            change ifTrue: [ animatedDrawUnpressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'button' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonReject = ( |
            | world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'button' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'windowContext' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'button' -> () From: ( | {
         'Category: positioning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         textOffset = ( |
            | bound topLeft + (8 @ 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         adjust = ( |
            | visible ifTrue: [ off. move_caret. on ] False: [ move_caret ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         color = ( |
            | container uiColors text).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         container = ( |
            | context container).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFor: con Size: ext = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            c: copy.
            c context: con.
            c extent: ext.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         drawColor: color = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 bm.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 i <- 0.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 off <- 0.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 x <- 0.
                } 
            | 
            off: position + (context currentGraphicOffset: context).
            i: (extent x / 2) + off x.
            x: extent y pred.
            bm: context currentGraphic.
            bm line: i pred@(x + off y) To: i succ@(x + off y) Color: color.
            bm line: i@(off y)          To: i@(off y + x)      Color: color.
            bm line: i pred@off y       To: i succ@off y       Color: color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         map = ( |
            | drawColor: container uiColors text).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         move_caret = ( |
            | 
            position: context gridToPt: context insertionPoint.
            position: position - (3@0)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         off = ( |
            | visible ifTrue:  [ unmap. visible: false ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         on = ( |
            | visible ifFalse: [ move_caret. map. visible: true  ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         rect = ( |
            | (0@0) ##! extent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caret' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         unmap = ( |
            | drawColor: container uiColors body).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         editorWithReceiver = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'editorWithReceiver' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits editorWithReceiver.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'demoEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'editorWithReceiver' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'demoEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         resproutCopyOn: wrld = ( |
            | uiDemo makeAndSproutIndex: index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorWithReceiver' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         addApply = ( |
            | 
            applyButton: (button copySize: 50@16) name: applyButtonName.
            applyButton  command: (|
                p* = traits clonable.
                editor.
                doIt: context = (editor apply).
                doIt: context Shift: shift = (
                    "shiftkeydown means force stayup"
                    shift ifTrue: [ context body stayup: true ].
                    doIt: context. ).
            |) copy editor: self.
            addContext: applyButton At: (30@140) + boxFaceOffset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorWithReceiver' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOn: world Size: size Receiver: rec = ( |
            | 
            copyOn: world Size: size Do: [|:e| e receiver: rec ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorWithReceiver' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         copyOnUI = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 te.
                } 
            | 
            te: evalEditor copyOn: ui world.
            te world addBodyOnTop: te.
            te location: te cursor location.
            te constrainFullBodyToWorld.
            te swoopDown.
            te).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorWithReceiver' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         forkAndEvaluate = ( |
             mess.
             mirr.
             s.
            | 
            s: methodView contentsString.
            s isEmpty ifTrue: [^ self].
            mirr: s parseObjectBodyIfFail: [| :err. |
              methodView selectionStart: errorStart End: errorEnd.
              uiNotifier copySyncOn: world
                            Message: 'Syntax error:\n', err printString
                                 At: (body absoluteLocation addX: body size x)
                               Time: 7.
              ^self.
            ].

            mess: mirr isReflecteeMethod ifTrue: [
               message copy receiver: receiver Selector: 'evaluate:' With: mirr
            ] False: [
               message copy receiver: mirr Selector: 'reflectee'
            ].

            myUI forkAndSend: mess
                CauseOfBirth: s
                 PutResultAt: body absoluteLocation addX: body size x.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorWithReceiver' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'textEditor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorWithReceiver' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         resproutCopyOn: wrld = ( |
            | copyOn: wrld Size: size Receiver: receiver).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'evalEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         apply = ( |
            | forkAndEvaluate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'evalEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'editorWithReceiver' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'evalEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | receiver safeName copyAtMost: 25).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fileEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         addApply = ( |
            | 
            applyButton: (button copySize: 50@16) name: applyButtonName.
            applyButton  command: (|
                p* = traits clonable.
                editor.
                doIt: context = (editor saveFile).
                doIt: context Shift: shift = ( doIt: context ).
            |) copy editor: self.
            addContext: applyButton At: (30@140) + boxFaceOffset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fileEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         findTest = ( |
            | methodView find: 'at').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fileEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         openOnFile: name = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 te.
                } 
            | 
            te: copyOn: ui world Size: (500@300) Do: [|:e | e fileName: name ].
            te readFile.
            te world addBodyOnTop: te.
            te location: (100@100).
            te constrainFullBodyToWorld.
            te swoopDown.
            te).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fileEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'textEditor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fileEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         readFile = ( |
             file.
             lines.
             te.
            | 
            file: os_file copy openForReading: fileName IfFail: [
              lines: vector copySize: 1
              lines first: 'Unable to open file: ', fileName.
              ^methodView contents: lines].
            lines: file contents asTextLines lines asVector.
            file close.
            methodView contents: lines).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fileEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         saveFile = ( |
             file.
            | 
            file: os_file copy openForWriting: fileName IfFail: [
              ^error: 'Unable to open file  ', fileName].
            methodView contents do: [|:l| file writeLine: l ].
            file close).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fileEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            'editing: ', fileName printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizeButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         changeValue = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 oldBound.
                } 
            | 
            newValue: cursor location.
            oldBound: container absoluteBound.
            container dynamicExpandSize: (newValue - oldValue) + cursorOffset.
            oldValue: container location + container size.
            (container absoluteBound encloses: oldBound) ifFalse: [
                (oldBound deltaList: container absoluteBound) do: [ | :rect |
                    world eraseAcetate: rect ] ].
            container draw.
            world offScreen copy: container absoluteBound
                              To: world windowBitmap
                              At: container location.
            world syncGraphics.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizeButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         cleanupBody = ( |
            | 
            container graphic image: savedBitmapImage.
            container offsetFromBody: 0@0.
            world prepareToDrawOnAll.
            world addBodyOnTop: body.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizeButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         doResize = ( |
            | 
            container expandSize: (newValue - oldValue) + cursorOffset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizeButton' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | drawBodySunkenRectangle: bound. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizeButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButton* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizeButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonAccept = ( |
            | cleanupBody. doResize. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizeButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonDown = ( |
            | 
            oldValue: container location + container size.
            cursorOffset: oldValue - cursor location.
            body raise.
            world eraseBody: body.
            savedBitmapImage: container graphic image.
            world reclipArrows: body absoluteBound.
            container graphic image: world offScreen image.
            container offsetFromBody: container location.
            world prepareToDrawOnAcetate.
            container draw.
            world prepareToDrawOnBackground.
            world display.
            world eraseArrowLayers.
            world prepareToDrawOnAcetate.
            leftButton.leftButtonDown.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizeButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingAccept: change = ( |
            | changeValue. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizeButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingReject: change = ( |
            | changeValue. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizeButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonReject = ( |
            | cleanupBody. doResize. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizeButton' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'windowContext' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         changeValue = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 new_value <- 0.
                } 
            | 
            new_value: current_value.
            value = new_value ifFalse: [
              clear_bound_absolute.
              value: current_value.
              drawRaisedBox: value_box_rect.
              drawSunkenBox: inner_box_rect.
              world syncGraphics.
              container contextChange: self.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         changeValue: v Redraw: re = ( |
            | 
            value: (v * max_value) asInteger.
            re ifTrue: [
                 clear_bound_absolute.
                 drawRaisedBox: value_box_rect.
                 world syncGraphics.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         clearBox: box = ( |
            | 
            drawBox: box LTColor: uiColors body RBColor: uiColors body).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         clearSelection = ( |
            | 
            clearBox: inner_box_rect.
            world syncGraphics).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         clear_bound = ( |
            | 
            clear_boundOn: body graphic Offset: location).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         clear_boundOn: gr Offset: off = ( |
            | 
            gr fillRectangle: ((bound indent: 1) translateBy: off)
                       Color: uiColors body).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         clear_bound_absolute = ( |
            | 
            clear_boundOn: world windowBitmap Offset: absoluteLocation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         copySize: extent = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 s.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 w.
                } 
            | 
            s: resend.copySize: extent.
            s resize: extent.
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         currentGraphic = ( |
            | body currentGraphic).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         currentGraphicOffset: cpt = ( |
            | body currentGraphicOffset: cpt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         current_value = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 v <- 0.
                } 
            | 
            v: (cursor location - absoluteLocation) y - value_box width half.
            (0 max: v) min: max_value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | 
            clear_bound.
            drawBodySunkenRectangle: bound.
            drawBodyRaisedRectangle: value_box_rect.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         drawBox: box LTColor: ltc RBColor: rbc = ( | {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 b.
                }  {
                 'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
                
                 bm.
                } 
            | 
            bm: currentGraphic.
            b: box translateBy: currentGraphicOffset: self.
            bm line: b topLeft    To: b topRight    Color: ltc.
            bm line: b topLeft    To: b bottomLeft  Color: ltc.
            bm line: b topRight   To: b bottomRight Color: rbc.
            bm line: b bottomLeft To: b bottomRight Color: rbc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         drawRaisedBox: box = ( |
            | 
            drawBox: box LTColor: uiColors bodyLight RBColor: uiColors bodyDark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         drawSunkenBox: box = ( |
            | 
            drawBox: box LTColor: uiColors bodyDark RBColor: uiColors bodyLight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         get_value = ( |
            | value asFloat/ max_value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         inner_box_rect = ( |
            | inner_box translateBy: (0@value)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButton* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'leftButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonAccept = ( |
            | clearSelection. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonDown = ( |
            | 
            body onTop ifFalse: [
                body raise.
                world display. ].
            leftButton.leftButtonDown. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingAccept: change = ( |
            | changeValue. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonPendingReject: change = ( |
            | changeValue. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButtonReject = ( |
            | clearSelection. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         max_value = ( |
            | (bound bottom - value_box width) pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         onAcetateDo: blk = ( |
            | 
            "            world prepareToDrawOnAcetate."
                        blk value.
            "            world prepareToDrawOnAll."
                        world syncGraphics).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'windowContext' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         resize: ext = ( |
            | 
            extent: ext.
            value_box: (bound left succ@bound top succ) ##!
                       ((bound width - 2)@(bound width - 2)).
            inner_box: value_box indent: 3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slider' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: private'
        
         value_box_rect = ( |
            | value_box translateBy: (0@value)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         apply = ( |
            | forkAndParse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         forkAndParse = ( |
             mess.
             mirr.
             s.
            | 
            s: methodView contentsString.

            mirr: s asSlotIfFail: [| :err. |
              methodView selectionStart: err start End: err end.
              uiNotifier copySyncOn: world
                            Message: 'Syntax error:\n', err printString
                                 At: (body absoluteLocation addX: body size x)
                               Time: 7.
              ^self.
            ].

            stayup ifFalse: [ banish ].
            (successMessage copy arguments:
              successMessage arguments copyAddLast: mirr) send).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'editorWithReceiver' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotEditor' -> () From: ( | {
         'ModuleInfo: Module: textEditor InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | receiver safeName copyAtMost: 25).
        } | ) 



 '-- Side effects'

 globals modules textEditor postFileIn
