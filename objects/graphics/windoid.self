 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         windoid = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'windoid' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'windoid' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules windoid.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         myComment <- 'a little window for evaluating a string'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         windoid = bootstrap define: bootstrap stub -> 'globals' -> 'windoid' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'handler' From:
             bootstrap remove: 'iconName' From:
             bootstrap remove: 'name' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'size' From:
             globals x11Globals window copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'windoid' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals windoid.

CopyDowns:
globals x11Globals window. copy 
SlotsToOmit: handler iconName name parent size.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         color <- bootstrap stub -> 'globals' -> 'colormapEntry' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         editString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         fontName <- 'lucidasans-12'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         windoidEventHandler = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'windoidEventHandler' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals windoidEventHandler.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         handler <- bootstrap stub -> 'globals' -> 'windoidEventHandler' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         iconName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         msgString <- '3'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         myFont <- bootstrap stub -> 'globals' -> 'font' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         name <- '\"Type a string in me followed by a return--click to eval\"'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         windoid = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits windoid.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'windoid' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         size <- (100)@(23).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windoidEventHandler' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         buttonPress: event = ( |
            | 
            window eval.
            resend.buttonPress: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windoidEventHandler' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         expose: event = ( |
            | 
            event count = 0 ifTrue: [ window draw ].
            resend.expose: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windoidEventHandler' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         keyPress: event = ( | {
                 'ModuleInfo: Module: windoid InitialContents: FollowSlot'
                
                 keycode.
                }  {
                 'ModuleInfo: Module: windoid InitialContents: FollowSlot'
                
                 str.
                } 
            | 
            keycode: event keycode.
            str: event lookupString.
            window keycode: keycode String: str.
            resend.keyPress: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windoidEventHandler' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'simpleEventHandler' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windoidEventHandler' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         window.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: destroying\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         close = ( |
            | 
            myFont delete.
            resend.close).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         copy = ( |
            | 
            "unlike windows, a windoid is automatically opened when copied"
            parent.copy open).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         copy: str = ( | {
                 'ModuleInfo: Module: windoid InitialContents: FollowSlot'
                
                 w.
                } 
            | 
            w: parent.copy.
            w msgString: str.
            w name: str.
            w iconName: str copySize: iconNameLength.
            w open.
            w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         draw = ( |
            | 
            platformWindow clear.
            bitmap text: editString
                     At: 5@5
                   Font: myFont
                  Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         edit: str = ( |
            | 
            editString: str.
            draw).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: evaluating\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         eval = ( | {
                 'ModuleInfo: Module: windoid InitialContents: FollowSlot'
                
                 p.
                } 
            | 
            p: process copySend: message copy receiver: self
                                              Selector: 'evalMsgString'.
            p causeOfBirth: msgString.
            p resume).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: evaluating\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         evalMsgString = ( |
            | 
            msgString evalInContext: receiver
                           FileName: '<a windoid>'
                  IfFail: [ warning: 'windoid eval failed on: ', msgString ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         iconNameLength = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         init = ( |
            | 
            initFont.
            initColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         initColor = ( |
            | 
            color: colormapEntry index: screen blackPixel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         initFont = ( |
            | 
            myFont: font copyName: fontName
                               On: self
                           IfFail: [ error: 'cannot load font: ', fontName ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         keycode: keycode String: str = ( | {
                 'ModuleInfo: Module: windoid InitialContents: FollowSlot'
                
                 char.
                } 
            | 
            str size = 0 ifTrue: [ ^ self ].
            char: str at: 0.
            "delete" char asByte = 127 ifTrue: [
                editString isEmpty not ifTrue: [
                    edit: editString copyWithoutLast.
                    draw. ]. ].
            "return" char asByte = 13 ifTrue: [
                message: editString.
                ^ edit: ''. ].
            char isPrintable ifTrue: [ edit: editString, char ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: changing\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         message: str = ( |
            | 
            msgString: str.
            setName: str.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'ModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'xWindow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: evaluating\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         receiver = ( |
            | reflect: shell).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         screen = ( |
            | display screen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windoid' -> () From: ( | {
         'Category: changing\x7fModuleInfo: Module: windoid InitialContents: FollowSlot'
        
         setName: name = ( |
            | 
            platformWindow name: name.
            platformWindow iconName: name copySize: iconNameLength.
            flush).
        } | ) 



 '-- Side effects'

 globals modules windoid postFileIn
