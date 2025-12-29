 '30.21.0'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot'
        
         xftDemo = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'xftDemo' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'xftDemo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules xftDemo.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (\'30.21.0\')\x7fVisibility: public'
        
         revision <- '30.21.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'pixmapCanvas' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (xlib xftDraw)\x7fVisibility: private'
        
         cachedXftDraw <- bootstrap stub -> 'globals' -> 'xlib' -> 'xftDraw' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Fonts\x7fComment: `x11Globals windowCanvas fontMap` is set to a font dictionary
(which is currently `fontDictionary` above).  We need to
reimplement the same beahvior with Xft.

Also need to teach `traits canvas text:At:FontSpec:Color`
to use it.\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         xftFontDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'xftFontDictionary' -> () From: ( |
             {} = 'Comment: See `traits abstractFontDictionary`.

The font map object needs to accomodate the X11
server-side fonts model.  In a nushell you open
a font and get its \"id\" with:
```c
Font id = XLoadFont(dpy, \"font name\");
```
A font \"id\" you obtain is then set as part of the
X11 graphics context and the server will use it
when we ask it to `XDrawString` with that context.

The \"id\" is a local handle for a remote resource
in the X11 server.  It doesn\'t tell you anything
about the font.

But you can query information about a font,
like its metrics, by retrieving its \"structure\"
from the server with:
```c
XFontStruct *s = XQueryFont(dpy, id);
```

This is where \"id\" and \"struct\" in the method names
come from and why there are two different methods.

NB: The `WindowCanvas:` argument is a bit weird.
X11 fonts are server resources and thus they belong
to a display object.

TODO: This doc comment should be moved to
`traits abstractFontDictionary` where it belongs.\x7fModuleInfo: Creator: globals x11Globals xftFontDictionary.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'xftFontDictionary' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         fonts = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Fonts\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot'
        
         xftFontDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xftFontDictionary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'xftFontDictionary' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'xftFontDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot'
        
         xftDemo <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xftDemo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (xlib xftColor)\x7fVisibility: private'
        
         cachedXftColor <- bootstrap stub -> 'globals' -> 'xlib' -> 'xftColor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (xlib xftDraw)\x7fVisibility: private'
        
         cachedXftDraw <- bootstrap stub -> 'globals' -> 'xlib' -> 'xftDraw' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (xlib xftFont)\x7fVisibility: private'
        
         cachedXftFont <- bootstrap stub -> 'globals' -> 'xlib' -> 'xftFont' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (windowCanvas)\x7fVisibility: public'
        
         canvas <- bootstrap stub -> 'globals' -> 'x11Globals' -> 'windowCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (paint copy)\x7fVisibility: public'
        
         color <- paint copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (nil)'
        
         demoMorph = bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         drawString: s At: pt = ( |
            | 
            cachedXftDraw xftDrawString8: cachedXftColor
              Font: cachedXftFont
              X: (pt x) Y: (pt y)
              String: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (\'proportional-10\')\x7fVisibility: public'
        
         fontName <- 'proportional-10'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'Comment: XftDraw for the given canvas.\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         makeDraw: c = ( |
            | 
            c createXftDraw).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         makeFont: name On: display = ( |
            | 
            display xftFontOpenNameOnScreen: display screen number
              Name: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         makePixmap = ( |
             c.
            | 

            c: x11Globals pixmapCanvas copy
              initForSameScreenAs: (desktop w anyWindowCanvas)
                Width: 100 Height: 100 Depth: 24.

            c gc foreground: (c indexForColor: (paint named: 'yellow')).
            c pixMap fillRectangle: (0@0)#(c pixMap size) GC: c gc.

            c gc foreground: (c indexForColor: (paint named: 'green')).
            c pixMap fillRectangle: (10@10)#(40@20) GC: c gc.

            c gc foreground: (c indexForColor: (paint named: 'white')).

            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'Comment: XRenderColor for the given paint.\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         makeRenderColor: p = ( |
             c.
            | 
            c: xlib xRenderColor new.
            c alpha: p alphaU16.
            c red:   p redU16.
            c green: p greenU16.
            c blue:  p blueU16.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'Comment: XftColor for the given paint.\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         makeXftColor: p On: display = ( |
             c.
             screen.
            | 

            c: xlib xftColor new.
            screen: display screen.

            display xftColorAllocValue: screen defaultVisualOfScreen
              Colormap: screen defaultColormapOfScreen
              RenderColor: (makeRenderColor: p)
              XftColor: c.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         setup = ( |
            | 
            canvas isNotNil && [ canvas isOpen ] ifFalse: [ canvas: desktop w anyWindowCanvas ].
            cachedXftColor: makeXftColor: color On: canvas display.
            cachedXftFont:  makeFont: fontName On: canvas display.
            cachedXftDraw:  makeDraw: canvas).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         xFontDrawTest <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xftDemo' -> 'xFontDrawTest' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xftDemo xFontDrawTest.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> 'xFontDrawTest' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot'
        
         color <- paint copyRed: 0.0977517 Green: 0.0977517  Blue: 0.438905.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> 'xFontDrawTest' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (nil)'
        
         fontMap.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> 'xFontDrawTest' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (nil)'
        
         gc.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> 'xFontDrawTest' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (nil)'
        
         id.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> 'xFontDrawTest' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> 'xFontDrawTest' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot'
        
         runMe = ( |
            | 
            fontMap drawString: 'ABC' OnCanvas: (desktop w anyWindowCanvas)
              At: 20@20 Font: id Color: color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> 'xFontDrawTest' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot'
        
         setup = ( |
             w.
            | 
            w: desktop w anyWindowCanvas.
            gc: w gc.
            fontMap: w fontMap.
            id: fontMap idForFontSpec: fontSpec WindowCanvas: w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'Comment: tell me to _RunScript\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         xlibTemplatesPath <- '/home/uwe/work/self/self/objects/glue/xlibTemplates.self'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftDemo' -> () From: ( | {
         'Comment: You can \'Create Button\' to run this quickly,
or copy/paste bits in the evaluator.\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         xxxRunMe = ( |
            | 
            fontName: 'Go Mono,mono-28:bold'.
            color: (paint copyHexRGB: '191970') copyAlpha: 0.8.
            "color: paint named: 'black'."

            setup. "create/make live the native stuff"

            drawString: 'Hello, World!' At: 100 @ 140.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Examples\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         xftLabelMorph = bootstrap define: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawBox' From:
             bootstrap remove: 'rawColor' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xftLabelMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawBox rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'Category: XftLabel Morph State\x7fCategory: Monkey Patching\x7fComment: Tweak me.\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            resend.baseDrawOn: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isBypassed <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fComment: nil width indicates unknown ascent\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         myAscent <- 14.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         myBox <- ((-38)@(50)) # ((99)@(68)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'Category: XftLabel Morph State\x7fModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         myCanvas.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fComment: nil width indicates unknown descent\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         myDescent <- 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'Category: XftLabel Morph State\x7fModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (nil.)\x7fVisibility: private'
        
         myDraw.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (fontSpec copyName: \'helvetica\' Size: 12 Style: \'bold\')\x7fVisibility: private'
        
         myFontSpec <- fontSpec copyName: 'helvetica' Size: 12 Style: 'bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         myLabel <- 'an xftLabelMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (20@20)\x7fVisibility: private'
        
         myPosition <- 20@20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fComment: nil myWidth indicates unknown width, ascent, and descent\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         myWidth <- 137.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'Category: XftLabel Morph State\x7fModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (nil.)\x7fVisibility: private'
        
         myXftColor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'Category: XftLabel Morph State\x7fModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         myXftFont.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Examples\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         xftLabelMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xftLabelMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xftLabelMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'xftLabelMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            xftLabelMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xftLabelMorph' -> () From: ( | {
         'Category: Label Morph State\x7fModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (paint named: \'black\')\x7fVisibility: private'
        
         rawColor <- paint named: 'black'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing alpha (for Quartz)\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         alphaU16 = ( |
            | 
            (rawAlpha * 16rFFFF) asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing alpha (for Quartz)\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         alphaU8 = ( |
            | 
            (rawAlpha * 16rFF) asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         asU16: v = ( |
            | 
            ((v * 16rFFFF) / range ) asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         asU8: v = ( |
            | 
            ((v * 16rFF) / range ) asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         blueU16 = ( |
            | 
            asU16: rawBlue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         blueU8 = ( |
            | 
            asU8: rawBlue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         greenU16 = ( |
            | 
            asU16: rawGreen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         greenU8 = ( |
            | 
            asU8: rawGreen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         redU16 = ( |
            | 
            asU16: rawRed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         redU8 = ( |
            | 
            asU8: rawRed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xFontDictionary' -> () From: ( | {
         'Category: drawing\x7fComment: XXX: Jot it down here.  The idea is for the canvases
`drawString:...` to dispatch to font-specific object
to do the drawing.  This is the X server-side fonts
version.\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot'
        
         drawString: s OnCanvas: canvas At: pt Font: id Color: c = ( |
             gc.
            | 
            gc: canvas gc.

            canvas setColor: c.
            gc font: id.
            canvas drawable drawString: s At: pt GC: gc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapCanvas' -> () From: ( | {
         'Category: basics\x7fComment: Nearly identical to xWindowCanvas>>createXftDraw,
but there is no common parent that abstracts away
drawable.\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         createXftDraw = ( |
             screen.
            | 

            screen: display screen.
            display xftDrawCreate: pixMap
              Visual: screen defaultVisualOfScreen
              Colormap: screen defaultColormapOfScreen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapCanvas' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot'
        
         noDrawString: s At: pt FontSpec: fSpec Color: c = ( |
            | 
            log debug: (
              'pixmap 0x', (pixMap hash hexPrintString),
              ' text "', s, '"').
            resend.drawString: s At: pt FontSpec: fSpec Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         xftDraw = ( |
            | 
            cachedXftDraw isLive ifFalse: [
              cachedXftDraw: createXftDraw.
              log debug: (
                'new draw for',
                ' canvas 0x', (hash hexPrintString),
                ' pixmap 0x', (pixMap hash hexPrintString)
              ).
            ]
            True: [
              log debug: (
                'OLD draw for',
                ' canvas 0x', (hash hexPrintString),
                ' pixmap 0x', (pixMap hash hexPrintString)
              ).
            ].
            cachedXftDraw).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapCanvas' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot'
        
         xxxDrawString: s At: pt FontSpec: fSpec Color: c = ( |
             draw.
             font.
             origin.
             screen.
             xc.
            | 

            log debug: (
              'pixmap 0x', (pixMap hash hexPrintString),
              ' text "', s, '"').

            winCanvas fontMap = x11Globals xftFontDictionary ifFalse: [
              winCanvas fontMap: x11Globals xftFontDictionary.
            ].

            origin: transformPt: pt.

            screen: display screen.

            xc: xlib xftColor new.
            display xftColorAllocValue: screen defaultVisualOfScreen
              Colormap: screen defaultColormapOfScreen
              Red: c redU16
              Green: c greenU16
              Blue: c blueU16
              Alpha: c alphaU16
              XftColor: xc.

            font: idForFontSpec: fSpec copySize: scaleNum: fSpec size.

            draw: xftDraw.
            clip ifNil: [
              draw xftDrawSetNoClipMask
            ]
            IfNotNil: [| o |
              o: clip origin.
              draw xftDrawSetClipRectangleX: (o x) Y: (o y)
                Width: (clip width) Height: (clip height).
            ].
            draw xftDrawString8: xc Font: (font font)
              X: (origin x) Y: (origin y)
              String: s.

            xc delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         createXftDraw = ( |
             screen.
            | 

            screen: display screen.
            display xftDrawCreate: platformWindow
              Visual: screen defaultVisualOfScreen
              Colormap: screen defaultColormapOfScreen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot'
        
         drawString: s At: pt FontSpec: fSpec Color: c = ( |
            | 
            log debug: (
              'window 0x', (platformWindow hash hexPrintString),
              ' text "', s, '"').
            resend.drawString: s At: pt FontSpec: fSpec Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             new.
            | 
            new: clone.
            new fonts: fonts copy.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
             new.
            | 
            new: clone.
            new fonts: fonts copyRemoveAll.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> () From: ( | {
         'Category: lookups\x7fCategory: helpers\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         fontAdapter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> 'fontAdapter' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xftFontDictionary fontAdapter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> 'fontAdapter' -> () From: ( | {
         'Comment: libXft wants display for many XftFont
operations, even though it should already
know that internally as far as I can tell.\x7fModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         display.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> 'fontAdapter' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         font.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> 'fontAdapter' -> () From: ( | {
         'Comment: Name used to open this font.
Only for debugging/observability.\x7fModuleInfo: Module: xftDemo InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         name.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> () From: ( | {
         'Category: lookups\x7fCategory: helpers\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         fontAdapterTraits = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> 'fontAdapterTraits' -> () From: ( |
             {} = 'Comment: For some reason libXft requires `Display` argument
to be passed to methods that take `XftFont` argument
even though, as far as I can tell, a font is tied to
the display it is opened for and that information is
available to Xft internally.\x7fModuleInfo: Creator: traits xftFontDictionary fontAdapterTraits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> 'fontAdapter' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xftFontDictionary' -> 'fontAdapterTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> 'fontAdapterTraits' -> () From: ( | {
         'Category: morphic\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         ascent = ( |
            | 
            font ascent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> 'fontAdapterTraits' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         copyXftFont: font Display: display = ( |
            | 
            copyXftFont: font Display: display Name: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> 'fontAdapterTraits' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         copyXftFont: font Display: display Name: name = ( |
             new.
            | 
            new: copy.
            new font: font.
            new display: display.
            new name: name.  "for debugging/observability"
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> 'fontAdapterTraits' -> () From: ( | {
         'Category: morphic\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         descent = ( |
            | 
            font descent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> 'fontAdapterTraits' -> () From: ( | {
         'Category: morphic\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         maxCharHeight = ( |
            | 
            font height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> 'fontAdapterTraits' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> 'fontAdapterTraits' -> () From: ( | {
         'Category: morphic\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         textWidth: s = ( |
             ext.
             width.
            | 
            ext: xlib xGlyphInfo new.
            display xftTextExtents8: font
              String: s Extents: ext.
            width: ext xOff. "sic!"
            ext delete.
            width).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> () From: ( | {
         'Category: lookups\x7fComment: \"id\" used to draw text with this font\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         idForFontSpec: fSpec WindowCanvas: wc = ( |
            | 
            xftFontForFontSpec: fSpec
              WindowCanvas: wc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractFontDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            fonts size printString, ' entries').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> () From: ( | {
         'Category: lookups\x7fComment: \"struct\" that can be used to query font metrics
for geometry calcilations\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         structForFontSpec: fSpec WindowCanvas: wc = ( |
            | 
            xftFontForFontSpec: fSpec
              WindowCanvas: wc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> () From: ( | {
         'Category: lookups\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         xftFontForFontSpec: fSpec WindowCanvas: wc = ( |
             name.
            | 
            name: xftFontNameOf: fSpec.

            fonts at: name IfAbsent: [
              | display. xf. adapter. |

              display: wc display.
              xf: display xftFontOpenNameOnScreen: display screen number Name: name.
              adapter: fontAdapter copyXftFont: xf Display: display Name: name.

              fonts at: name Put: adapter.
              adapter.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> () From: ( | {
         'Category: lookups\x7fCategory: helpers\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         xftFontNameOf: aFontSpec = ( |
            | 
            aFontSpec name,            "the font the user wants"
              ',', aFontSpec generic,  "but xft can do fallback for us"
              '-', aFontSpec size asString,
              xftFontStyleOf: aFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftFontDictionary' -> () From: ( | {
         'Category: lookups\x7fCategory: helpers\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         xftFontStyleOf: aFontSpec = ( |
             style <- ''.
            | 
            aFontSpec style isEmpty ifTrue: [ ^ style  ].

            (aFontSpec style matchesPattern: '*bold*'   IgnoreCase: true) ifTrue: [ style: style, ':Bold' ].
            (aFontSpec style matchesPattern: '*italic*' IgnoreCase: true) ifTrue: [ style: style, ':Italic' ].
            style).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftLabelMorph' -> () From: ( | {
         'Category: drawing\x7fComment: Experiment with labels without endangering
the wellbeing of my whole desktop.\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            myCanvas isNil "|| [ myCanvas != c ]"
              ifTrue: [ myCanvas: c ].

            isBypassed
              ifTrue: [ resend.baseDrawOn: c ]
               False: [ baseDrawOnXft: c ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftLabelMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         baseDrawOnXft: c = ( |
             color.
             display.
             draw.
             fname.
             font.
             origin.
            | 

            display: c display.

            " c drawable
              fillRectangle: (c transformRect: bounds)
              GC: (c gc).
            "
            origin: (c transformPt: position).

            draw: c createXftDraw.
            myDraw: draw.

            fname: makeFontName: myFontSpec.
            font: makeFont: fname On: display.
            myXftFont: font.

            color: makeXftColor: rawColor On: display.
            myXftColor: color.

            draw xftDrawString8: myXftColor
              Font: myXftFont
              X: (origin x) Y: (origin y)
              String: label.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftLabelMorph' -> () From: ( | {
         'Category: xftUtils\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         makeFont: name On: display = ( |
            | 
            display xftFontOpenNameOnScreen: display screen number
              Name: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftLabelMorph' -> () From: ( | {
         'Category: xftUtils\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         makeFontName: spec = ( |
             fcName.
            | 

            fcName: spec name, '-', spec size printString.
            spec style isEmpty ifFalse: [
              fcName: fcName, ':', spec style ].
            fcName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftLabelMorph' -> () From: ( | {
         'Category: xftUtils\x7fComment: XRenderColor for the given paint.\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         makeRenderColor: p = ( |
             c.
            | 
            c: xlib xRenderColor new.
            c alpha: p alphaU16.
            c red:   p redU16.
            c green: p greenU16.
            c blue:  p blueU16.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftLabelMorph' -> () From: ( | {
         'Category: xftUtils\x7fComment: XftColor for the given paint.\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         makeXftColor: p On: display = ( |
             c.
             screen.
            | 

            c: xlib xftColor new.
            screen: display screen.

            display xftColorAllocValue: screen defaultVisualOfScreen
              Colormap: screen defaultColormapOfScreen
              RenderColor: (makeRenderColor: p)
              XftColor: c.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftLabelMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'xftLabelMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'labelMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xftLabelMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: xftDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         setCachedSizes: c = ( |
            | 
            resend.setCachedSizes: c).
        } | ) 



 '-- Side effects'

 globals modules xftDemo postFileIn
