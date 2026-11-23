 '$Revision: 30.5 $'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         quartz = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'quartz' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'quartz' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules quartz.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.5 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- bootstrap setObjectAnnotationOf: ( 'qDrawable
cgDirectDisplay
quartz_wrappers
quartzForFF
' copyMutable) From: ( |
             {} = 'ModuleInfo: Creator: globals modules quartz subpartNames.

CopyDowns:
globals byteVector. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         quartz = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'Category: quartz font objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         atsFontFamilyIterator = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontFamilyIterator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontFamilyIterator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz atsFontFamilyIterator.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'Category: quartz font objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         atsFontFamilyIterator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontFamilyIterator' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz atsFontFamilyIterator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontFamilyIterator' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontFamilyIterator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'Category: quartz font objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         atsFontIterator = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontIterator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontIterator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz atsFontIterator.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'Category: quartz font objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         atsFontIterator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontIterator' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz atsFontIterator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontIterator' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontIterator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'Category: quartz font objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         atsFontMetrics = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontMetrics' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontMetrics' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz atsFontMetrics.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'Category: quartz font objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         atsFontMetrics = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontMetrics' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz atsFontMetrics.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontMetrics' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontMetrics' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'Category: quartz font objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         cgFont = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'cgFont' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'cgFont' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz cgFont.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'Category: quartz font objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         cgFont = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'cgFont' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz cgFont.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'cgFont' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'cgFont' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         colorSpace = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'colorSpace' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'colorSpace' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz colorSpace.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         colorSpace = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'colorSpace' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz colorSpace.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'colorSpace' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'colorSpace' -> ().
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'Category: graphics (ui1)\x7fComment: ui1 platform colormap on Quartz. The X path installs an 8-bit CLUT in the
server; here the CLUT is a 256*3 software byte table that the window flush
feeds to blitIndexedTo: (index -> RGB). storeOne:/queryOne: use xlib xColor
(16-bit components) as the carrier, matching colormap.self. -- claude & dmu
5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         colormap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'colormap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz colormap.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'colormap' -> () From: ( | {
         'Comment: 256*3 bytes, RGB per index; consumed by the window flush as the blitIndexedTo: CLUT. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         clut.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'Category: graphics (ui1)\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         colormap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'colormap' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz colormap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'colormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         win.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         context = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'context' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'context' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz context.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'context' -> () From: ( | {
         'Comment: current font name + size, recorded by font: so drawString: can lay the text out with CoreText (drawCTText:) -- the CGContextSelectFont/ShowText legacy path gives tight per-glyph advances. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         curFontName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         curFontSize <- 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: ui1 GC state\x7fComment: per-context GC state CG cannot represent on its 8-bit indexed bytes: the raw
palette index of the last foregroundColor: (the fill colour, always set on the
same context it draws into). The plane mask + raster function are SHARED, not
per-context (see globals quartz gcPlaneMask/gcRasterFn) because ui1/X use one
display gc. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         indexFG <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'context' -> () From: ( | {
         'Comment: effective CG line width (0 normalised to 1), tracked so drawLine: can render thin axis-aligned lines as exact 1px rects (crisp bevels) while thick lines still stroke. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         lineWidthValue <- 1.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         context = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz context.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         dataProvider = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'dataProvider' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'dataProvider' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz dataProvider.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         dataProvider = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'dataProvider' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz dataProvider.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'dataProvider' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'dataProvider' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawable = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'drawable' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractDrawable deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'drawable' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz drawable.

CopyDowns:
globals abstractDrawable. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawable = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz drawable.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'drawable' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         event = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: enumerating\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         allClassesAndKindsDo: blk = ( |
            | 
            (reflect: classes) do: [|:s. className|
              className: s key.
              ((reflect: kinds) includesKey: className) ifTrue: [
                (reflect: className sendTo: kinds) do: [|:s. kindValue|
                   kindValue: s value reflectee.
                   blk value: className With: (className sendTo: classes) With: s key With: s value reflectee.
                ]
              ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui2 events\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         buttonNames = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals quartz event parent buttonNames.
'.
                    | ) ) _Clone: 3 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent') \/-> 'buttonNames') -> () _At: 0 Put: (
     'left')

 ((bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent') \/-> 'buttonNames') -> () _At: 1 Put: (
     'middle')

 ((bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent') \/-> 'buttonNames') -> () _At: 2 Put: (
     'right')

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: registering interest\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         catchAllEventsForPlatformWindow: w = ( |
            | 
            allClassesAndKindsDo: [|:className. :class. :kindName. :kind|
              w addHandledEventClass: class Kind: kind.
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: registering interest\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         catchEventsForPlatformWindow: w = ( |
            | 
            allClassesAndKindsDo: [|:className. :class. :kindName. :kind|
              (case if: [className = 'mouse'   ] Then: [     (kind = kinds mouse down)
                                                         || [(kind = kinds mouse up)
                                                         || [(kind = kinds mouse dragged)
                                                         || [(kind = kinds mouse moved)
                                                         || [(kind = kinds mouse wheelMoved)]]]]]
                    If: [className = 'window'  ] Then: [     (kind = kinds window boundsChanged)
                                                         || [(kind = kinds window drawContent)
                                                         || [(kind = kinds window handleActivate)
                                                         || [(kind = kinds window close)]]] ]
                    If: [className = 'keyboard'] Then: [kind <= kinds keyboard rawKeyUp]
                   Else: false)
              ifTrue: [w addHandledEventClass: class Kind: kind].
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         classes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent classes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         accessiblity = 'acce'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         appearance = 'appm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         appleEvent = 'eppc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         application = 'appl'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         command = 'cmds'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         control = 'cntl'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         ink = 'ink '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         keyboard = 'keyb'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menu = 'menu'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         mouse = 'mous'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         service = 'serv'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         system = 'macs'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tablet = 'tblt'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         text = 'text'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         toolbar = 'tbar'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         toolbarItem = 'tbit'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         toolbarItemView = 'tbiv'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tsmDocumentAccess = 'tdac'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         volume = 'vol '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'classes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         window = 'wind'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         delete = ( |
            | 
            release. kill. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: event parameters\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getPointParam: ptype = ( |
            | 
            getPointParam: ptype IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: event parameters\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getPointParam: ptype IfFail: fb = ( |
             r.
            | 
            r: raw_getPointParam: ptype IfFail: [|:e| ^ fb value: e].
            r first @ r last).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: event parameters\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getRectParam: ptype = ( |
            | getRectParam: ptype IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: event parameters\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getRectParam: ptype IfFail: fb = ( |
             r.
            | 
            r: raw_getRectParam: ptype IfFail: [|:e| ^ fb value: e].
            ((r at: 0) @ (r at: 1)) ## ((r at: 2) @ (r at: 3))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: event parameters\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getSizeParam: ptype = ( |
            | getSizeParam: ptype IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: event parameters\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getSizeParam: ptype IfFail: fb = ( |
            | 
            getPointParam: ptype IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         isMotionEvent = ( |
            | 
            "does not seem to help"
            [
            (getClass = classes mouse)
             && [|k| k: getKind. (k = kinds mouse moved) || [k = kinds mouse dragged]]
            ].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kindString = ( |
             c.
             k.
            | 
            c: getClass.
            k: getKind.
            allClassesAndKindsDo: [|:cn. :cc. :kn. :kk|
              (c = cc) && [k = kk] ifTrue: [^ cn, '.', kn]
            ].
            k printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kinds = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         appearance = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'appearance' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds appearance.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'appearance' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         scrollBarVariantChanged = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( | {
         'Comment: handled by std handler\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         appleEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'appleEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds appleEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         application = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds application.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         activated = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         activeWindowChanged = 111.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         availableWindowBoundsChanged = 110.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         deactivated = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         focusDrawer = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         focusMenuBar = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         focusNextDocumentWindow = 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         focusNextFloatingWindow = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         focusToolbar = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         frontSwitched = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         getDockTileMenu = 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         hidden = 107.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         isEventInInstantMouser = 104.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         launchNotification = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         launched = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         quit = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         shown = 108.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         systemUIModeChanged = 109.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'application' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         terminated = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         command = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'command' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds command.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'command' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         process = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'command' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         updateStatus = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         control = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'control' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds control.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         ink = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'ink' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds ink.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'ink' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         gesture = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'ink' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         point = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'ink' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         text = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         keyboard = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'keyboard' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds keyboard.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'keyboard' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         hotKeyPressed = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'keyboard' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         hotKeyReleased = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'keyboard' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         rawKeyDown = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'keyboard' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         rawKeyModifiersChanged = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'keyboard' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         rawKeyRepeat = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'keyboard' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         rawKeyUp = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menu = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'menu' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds menu.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         mouse = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'mouse' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds mouse.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'mouse' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         down = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'mouse' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         dragged = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'mouse' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         entered = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'mouse' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         exited = 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'mouse' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         moved = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'mouse' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         up = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'mouse' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         wheelMoved = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         service = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'service' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds service.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'service' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         copy = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'service' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         getTypes = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'service' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         paste = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'service' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         perform = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tablet = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'tablet' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds tablet.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'tablet' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         point = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'tablet' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         proximity = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         text = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'text' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds text.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'text' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         filterText = 14.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'text' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         getSelectedText = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'text' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         offsetToPos = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'text' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         posToOffset = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'text' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         showHideBottomWindow = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'text' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         unicodeForKeyEvent = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'text' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         unicodeText = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'text' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         updateActiveInputArea = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         timer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'timer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds timer.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'timer' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         idling = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'timer' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         started = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'timer' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         stopped = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tsmDocumentAccess = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'tsmDocumentAccess' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds tsmDocumentAccess.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         window = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent kinds window.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         activated = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         boundsChanged = 27.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         boundsChanging = 26.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         clickActivation = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         clickCloseRgn = 35.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         clickCollapseRgn = 34.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         clickContentRgn = 37.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         clickDragRgn = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         clickModality = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         clickProxyIconRgn = 38.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         clickResizeRgn = 33.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         clickStructureRgn = 42.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         clickToolbarButtonRgn = 41.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         clickZoomRgn = 36.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         close = 72.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         closeAll = 74.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         closed = 73.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         collapse = 66.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         collapseAll = 68.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         collapsed = 67.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         collapsing = 86.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         constrain = 83.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         contextualMenuSelect = 78.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         cursorChange = 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         deactivated = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         dispose = 1005.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         dragCompleted = 31.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         dragHilite = 1006.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         dragStarted = 30.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         drawContent = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         drawFrame = 1000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         drawGrowBox = 1011.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         drawPart = 1001.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         drawerClosed = 223.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         drawerClosing = 222.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         drawerOpened = 221.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         drawerOpening = 220.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         expand = 69.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         expandAll = 71.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         expanded = 70.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         expanding = 87.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         focusAcquired = 200.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         focusContent = 202.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         focusDrawer = 204.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         focusRelinquish = 201.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         focusToolbar = 203.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         getClickActivation = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         getClickModality = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         getDockTileMenu = 90.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         getGrowImageRegion = 1012.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         getIdealSize = 80.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         getMaximumSize = 82.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         getMinimumSize = 81.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         getRegion = 1002.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         handleActivate = 91.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         handleContentClick = 85.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         handleDeactivate = 92.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         hidden = 25.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         hiding = 23.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         hitTest = 1003.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         init = 1004.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         measureTitle = 1010.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         modified = 1007.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         paint = 1013.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         pathSelect = 79.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         proxyBeginDrag = 128.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         proxyEndDrag = 129.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         resizeCompleted = 29.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         resizeStarted = 28.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         setupProxyDragImage = 1008.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         sheetClosed = 213.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         sheetClosing = 212.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         sheetOpened = 211.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         sheetOpening = 210.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         showing = 22.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         shown = 24.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         stateChanged = 1009.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         toolbarSwitchMode = 150.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         transitionCompleted = 89.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         transitionStarted = 88.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         update = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         zoom = 75.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         zoomAll = 77.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'kinds' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         zoomed = 76.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         modifierMasks = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'modifierMasks' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent modifierMasks.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'modifierMasks' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         anyButton = ( |
            | leftButton || middleButton || rightButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'modifierMasks' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         capsLock = 1024.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'modifierMasks' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         command = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'modifierMasks' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         control = 4096.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'modifierMasks' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         fn = 131072.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'modifierMasks' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         leftButton = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'modifierMasks' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         middleButton = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'modifierMasks' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         numLock = 65536.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'modifierMasks' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         option = 2048.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'modifierMasks' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         rightButton = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'modifierMasks' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         shift = 512.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         parameters = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent parameters.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         accessibilityEventQueued = 'aequ'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         accessibleActionDescription = 'acds'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         accessibleActionName = 'acnm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         accessibleActionNames = 'acns'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         accessibleAttributeName = 'atnm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         accessibleAttributeNames = 'atns'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         accessibleAttributeParameter = 'atpa'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         accessibleAttributeSettable = 'atst'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         accessibleAttributeValue = 'atvl'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         accessibleChild = 'achl'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         accessibleObject = 'aobj'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         attributes = 'attr'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         availableBounds = 'avlb'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         bounds = 'boun'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         cGContextRef = 'cntx'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         clickActivation = 'clac'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         clickCount = 'ccnt'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlAction = 'caup'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlClickActivationResult = 'ccar'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlCurrentOwningWindow = 'ccow'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlCurrentPart = 'cnpc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlDataBuffer = 'cdbf'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlDataBufferSize = 'cdbs'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlDataTag = 'cdtg'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlDrawDepth = 'cddp'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlDrawInColor = 'cdic'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlFeatures = 'cftr'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlFocusEverything = 'cfev'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlFrameMetrics = 'cfmt'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlHit = 'chit'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlIndicatorDragConstraint = 'cidc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlIndicatorOffset = 'ciof'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlIndicatorRegion = 'cirn'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlInvalRgn = 'civr'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlIsGhosting = 'cgst'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlMessage = 'cmsg'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlOptimalBaselineOffset = 'cobo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlOptimalBounds = 'cobn'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlOriginalOwningWindow = 'coow'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlParam = 'cprm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlPart = 'cprt'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlPartAutoRepeats = 'caur'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlPartBounds = 'cpbd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlPrefersShape = 'cpsh'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlPreviousPart = 'copc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlRef = 'ctrl'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlRegion = 'crgn'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlResult = 'crsl'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlSubControl = 'csub'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlSubview = 'csvw'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlValue = 'cval'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlWouldAcceptDrop = 'cldg'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         currentBounds = 'crct'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         currentDockDevice = 'cdgd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         currentDockRect = 'cdrc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         currentMenuTrackingMode = 'cmtm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         currentWindow = 'curw'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         deviceColor = 'devc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         deviceDepth = 'devd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         dimensions = 'dims'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         enableMenuForKeyEvent = 'fork'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         enabled = 'enab'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         eventRef = 'evnt'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         gDevice = 'gdev'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         grafPort = 'graf'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         hICommand = 'hcmd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         index = 'indx'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         initCollection = 'icol'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inkGestureBounds = 'gbnd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inkGestureHotspot = 'ghot'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inkGestureKind = 'gknd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inkKeyboardShortcut = 'ikbd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inkTextRef = 'iwrd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         isInInstantMouser = 'imou'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         keyCode = 'kcod'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         keyMacCharCodes = 'kchr'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         keyModifiers = 'kmod'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         keyUnicodes = 'kuni'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         keyboardType = 'kbdt'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         launchErr = 'err '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         launchRefCon = 'lref'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         maximumSize = 'mxsz'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuCommand = 'mcmd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuCommandKeyBounds = 'mcmb'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuContext = 'mctx'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuDirection = 'mdir'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuDismissed = 'mdis'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuDrawState = 'mdrs'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuEventOptions = 'meop'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuFirstOpen = '1sto'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuFrameView = 'mfrv'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuIconBounds = 'micb'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuIsPopup = 'mpop'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuItemBounds = 'mitb'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuItemHeight = 'mith'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuItemIndex = 'item'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuItemType = 'mitp'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuItemWidth = 'mitw'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuMarkBounds = 'mmkb'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuPopupItem = 'mpit'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuRef = 'menu'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuTextBaseline = 'mtbl'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuTextBounds = 'mtxb'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuType = 'mtyp'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuVirtualBottom = 'mvrb'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuVirtualTop = 'mvrt'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         minimumSize = 'mnsz'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         modalWindow = 'mwin'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         mouseButton = 'mbtn'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         mouseChord = 'chor'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         mouseDelta = 'mdta'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         mouseLocation = 'mloc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         mouseTrackingRef = 'mtrf'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         mouseWheelAxis = 'mwax'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         mouseWheelDelta = 'mwdl'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         mutableArray = 'marr'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         newMenuTrackingMode = 'nmtm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         newScrollBarVariant = 'nsbv'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         nextControl = 'cnxc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         originalBounds = 'orct'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         parentMenu = 'mprm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         parentMenuItem = 'mpri'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         pasteboardRef = 'pbrd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         postTarget = 'ptrg'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         previousBounds = 'prct'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         previousDockDevice = 'pdgd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         previousDockRect = 'pdrc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         previousWindow = 'prvw'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         processID = 'psn '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         reason = 'why?'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         result = 'ansr'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         rgnHandle = 'rgnh'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         scrapRef = 'scrp'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         serviceCopyTypes = 'svsd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         serviceMessageName = 'svmg'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         servicePasteTypes = 'svpt'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         serviceUserData = 'svud'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         shape = 'shap'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         startControl = 'cstc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         systemUIMode = 'uimd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tSMDocAccessCharacterCount = 'tdct'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tSMDocAccessEffectiveRange = 'tder'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tSMDocAccessLineBounds = 'tdlb'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tSMDocAccessLockCount = 'tdlc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tSMDocAccessReplyATSFont = 'tdaf'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tSMDocAccessReplyATSUGlyphSelector = 'tdrg'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tSMDocAccessReplyCharacterRange = 'tdrr'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tSMDocAccessReplyCharactersPtr = 'tdrp'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tSMDocAccessReplyFontSize = 'tdrs'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tSMDocAccessRequestedCharacterAttributes = 'tdca'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tSMDocAccessSendCharacterIndex = 'tdsi'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tSMDocAccessSendCharacterRange = 'tdsr'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tSMDocAccessSendCharactersPtr = 'tdsp'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tSMSendComponentInstance = 'tsci'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tSMSendRefCon = 'tsrc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tabletEventType = 'tblt'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tabletPointRec = 'tbrc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tabletProximityRec = 'tbpx'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputGlyphInfoArray = 'glph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputReplyFMFont = 'trfm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputReplyFont = 'trft'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputReplyGlyphInfoArray = 'rgph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputReplyLeadingEdge = 'trle'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputReplyLineAscent = 'trla'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputReplyLineHeight = 'trlh'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputReplyMacEncoding = 'trme'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputReplyPoint = 'trpt'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputReplyPointSize = 'trpz'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputReplyRegionClass = 'trrg'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputReplySLRec = 'trsl'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputReplyShowHide = 'trsh'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputReplyText = 'trtx'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputReplyTextAngle = 'trta'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputReplyTextOffset = 'trto'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendClauseRng = 'tscl'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendCurrentPoint = 'tscp'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendDraggingMode = 'tsdm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendFixLen = 'tsfx'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendHiliteRng = 'tshi'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendKeyboardEvent = 'tske'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendLeadingEdge = 'tsle'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendPinRng = 'tspn'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendReplaceRange = 'tsrp'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendSLRec = 'tssl'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendShowHide = 'tssh'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendText = 'tstx'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendTextOffset = 'tsto'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendTextServiceEncoding = 'tsse'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendTextServiceMacEncoding = 'tssm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         textInputSendUpdateRng = 'tsup'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         transactionID = 'trns'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         typeTabletPointRec = 'tbrc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         typeTabletProximityRec = 'tbpx'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         userData = 'usrd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         wheelDelta = 'mdta'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowDefPart = 'wdpc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowDragHiliteFlag = 'wdhf'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowFeatures = 'wftr'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowGrowRect = 'grct'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowModifiedFlag = 'wmff'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowMouseLocation = 'wmou'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowPartCode = 'wpar'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowProxyGWorldPtr = 'wpgw'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowProxyImageRgn = 'wpir'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowProxyOutlineRgn = 'wpor'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowRef = 'wind'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowRegionCode = 'wshp'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowStateChangedFlags = 'wscf'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowTitleFullWidth = 'wtfw'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowTitleTextWidth = 'wttw'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowTransitionAction = 'wtac'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'parameters' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowTransitionEffect = 'wtef'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: enumerating\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         printAllClassesAndKinds = ( |
            | 
            allClassesAndKindsDo: [|:className. :class. :kindName. :kind|
              (className, ': ', class, '  kindName: ', kindName, ':  ', kind printString) printLine
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui2 events\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         setEvtPrefix = ( |
            | 'setUI2EventForClass_').
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui1 events\x7fComment: fill a shared uiEvent (the ui2 abstractUI2Event family) for ui1 from this
native Cocoa event, using ui1s proven Quartz decode: ui2-canonical type/
cursorPoint/keystrokes + X-style state (xStateMaskFromChord:), so the X-masked
x11Globals ui2Event ui1 builds reads correctly and ui1s cursor (X masks) works
via the events X-canonical newState. -- claude & dmu 5/2026\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI1Event: aUI1Evt = ( |
             cls.
            | 
            cls: getClass.
            case if: [cls = classes mouse   ] Then: [ setUI1Mouse:  aUI1Evt ]
                 If: [cls = classes keyboard ] Then: [ setUI1Key:    aUI1Evt ]
                 If: [cls = classes window   ] Then: [ setUI1Window: aUI1Evt ]
                Else: [ ].
            aUI1Evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui1 events\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         setUI1Key: aUI1Evt = ( |
             cc.
             k.
            | 
            k: getKind.
            "the .mm stores keyMacCharCodes as a uint32 char code (not utf8Text), so read it as uint32"
            cc: getUnsignedParam: parameters keyMacCharCodes Type: types uint32 IfFail: 0.
            aUI1Evt state: xStateMaskFromChord: 0 Modifiers:
                             (getUnsignedParam: parameters keyModifiers Type: types uint32 IfFail: 0).
            aUI1Evt keycode: getUnsignedParam: parameters keyCode Type: types uint32 IfFail: 0.
            aUI1Evt keystrokes: cc = 0 ifTrue: '' False: [cc asCharacter asString].
            aUI1Evt type:
             case if: [k = kinds keyboard rawKeyDown  ] Then: 'keyDown'
                  If: [k = kinds keyboard rawKeyRepeat] Then: 'keyDown'
                  If: [k = kinds keyboard rawKeyUp    ] Then: 'keyUp'
                                                        Else: 'keyDown'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui1 events\x7fComment: Button number only on down/up. Wheel and synthetic leave have no mbtn. -- grok 08/26/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         setUI1Mouse: aUI1Evt = ( |
             bn.
             k.
             pt.
            | 
            k: getKind.
            pt: getPointParam: parameters windowMouseLocation IfFail: [0@0].
            aUI1Evt cursorPoint: pt.
            aUI1Evt state: xStateMaskFromChord:
                             (getUnsignedParam: parameters mouseChord   Type: types uint32 IfFail: 0)
                                       Modifiers:
                             (getUnsignedParam: parameters keyModifiers Type: types uint32 IfFail: 0).
            bn: 'left'.
            (k = kinds mouse down) || [k = kinds mouse up] ifTrue: [
                bn: case if: [ui1ButtonNumber = 2] Then: 'middle'
                         If: [ui1ButtonNumber = 3] Then: 'right'
                                                   Else: 'left'.
            ].
            aUI1Evt type:
             case if: [k = kinds mouse down] Then: [bn, 'MouseDown']
                  If: [k = kinds mouse up  ] Then: [bn, 'MouseUp']
                                             Else: 'mouseMotion'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui1 events\x7fComment: ui1 close/resize/expose. configureNotify/expose bounds are filled by the
source from the platformWindow (the native event carries no useful bounds
here). -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         setUI1Window: aUI1Evt = ( |
             k.
            | 
            k: getKind.
            "ui2 window vocab; ui1 reads typeName (windowDelete->clientMessage etc.) and
             isDeleteWindow (=windowDelete). bounds filled by the source from the
             platformWindow. -- claude & dmu 5/2026"
            aUI1Evt type:
             case if: [k = kinds window close         ] Then: 'windowDelete'
                  If: [k = kinds window boundsChanged  ] Then: 'windowResize'
                  If: [k = kinds window drawContent    ] Then: 'windowExpose'
                                                         Else: [ aUI1Evt type ].
            self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui2 events\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         setUI2Event: ui2Evt = ( |
            | 
            [ "browsing"
              setUI2EventForClass_ignored: 0.
              setUI2EventForClass_keyb: 0.
              setUI2EventForClass_mous: 0.
              setUI2EventForClass_wind: 0.
            ].
            setUI2Time: ui2Evt.
            setEvtPrefix, getClass, ':' sendTo: self With: ui2Evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui2 events\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         setUI2EventForClass_ignored: aUI2Evt = ( |
            | 
            [('setUI2EventForClass_ignored: ignoring event of class: ', getClass, ' kind: ', kindString)
              printLine.].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui2 events\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         setUI2EventForClass_keyb: aUI2Evt = ( |
             charCode.
             kind.
             macCharCodes.
             mods.
             type.
            | 

            kind: getKind.

            macCharCodes: getUnsignedCharParam: parameters keyMacCharCodes Type: types utf8Text IfFail: [^ self].
            [charCode: getUnsignedParam: parameters keyCode Type: types uint32 IfFail: [^ self]].
            mods: getUnsignedParam: parameters keyModifiers Type: types uint32 IfFail: [^ self].
            [type: getUnsignedParam: parameters keyboardType Type: types uint32 IfFail: [^ self]].

            [
              (kindString, ': charCode=', charCode printString,
                            ', macCharCodes=', macCharCodes printString,
                            ', type=', type printString,
                            ', mods=', mods printString) printLine.
            ].
            aUI2Evt state: mods.
            aUI2Evt keycode: macCharCodes.
            aUI2Evt keystrokes: macCharCodes asCharacter.
            aUI2Evt type:
             case
              if: [kind = kinds keyboard rawKeyDown  ]  Then:  'keyDown'
              If: [kind = kinds keyboard rawKeyRepeat]  Then:  'keyDown'
              If: [kind = kinds keyboard rawKeyUp    ]  Then:  'keyUp'
              Else: [aUI2Evt type].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui2 events\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         setUI2EventForClass_mous: aUI2Evt = ( |
             count.
             k.
             waxis.
             wpc.
            | 

            aUI2Evt cursorPoint: getPointParam: parameters windowMouseLocation IfFail: [0@0].

            aUI2Evt state:  
               (  getUnsignedParam: parameters mouseChord   Type: types uint32 IfFail: 0 )
            || (  getUnsignedParam: parameters keyModifiers Type: types uint32 IfFail: 0 ).

            waxis:   (getUnsignedShortParam: parameters mouseWheelAxis
                                         Type: types mouseWheelAxis
                                       IfFail: 1) = 0 ifTrue: 'X' False: 'Y'.

            "pos-> scroll up (move text down)"
            aUI2Evt wheelDelta: getSignedParam: parameters mouseWheelDelta Type: types sint32 IfFail: 0.

            count: getUnsignedParam: parameters clickCount Type: types uint32 IfFail: 0.

            wpc: getSignedShortParam: parameters windowPartCode Type: types windowPartCode IfFail: -1.
            k: getKind.

            aUI2Evt type: 
             case if: [quartz window partCodes inDesk     = wpc] Then: ['windowLeave']
                  If: [quartz window partCodes inContent != wpc] Then: [aUI2Evt type]
                  If: [kinds mouse moved      = k] Then: 'mouseMotion'
                  If: [kinds mouse dragged    = k] Then: 'mouseMotion'
                  If: [kinds mouse wheelMoved = k] Then: ['wheelMovedIn', waxis]
                  If: [kinds mouse up         = k] Then: [whichButton, 'MouseUp']
                  If: [kinds mouse down       = k] Then: [whichButton, (count > 1  ifTrue: 'DoubleClick' False: 'MouseDown')]
                                                   Else: ['mouseMotion'] "ALL mouse events carry location info").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui2 events\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         setUI2EventForClass_wind: aUI2Evt = ( |
             k.
             pt.
            | 
            k: getKind.
            pt: getPointParam: parameters windowMouseLocation IfFail: [0@0].

            aUI2Evt type:
             case if: [k = kinds window boundsChanged  ] Then: 'windowExpose' "expose/resize/close see adjustForCanvas:"
                  If: [k = kinds window handleActivate ] Then: 'windowEnter'
                  If: [k = kinds window drawContent    ] Then: 'windowExpose'
                  If: [k = kinds window close          ] Then: 'windowDelete'
                                                         Else: aUI2Evt type.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui2 events\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         setUI2Time: aUI2Evt = ( |
            | 
            aUI2Evt timeStamp: getSecondsSinceBoot * 1000.0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         types = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz event parent types.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         atsFontRef = 'atsf'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         cfIndex = 'cfix'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         cfRange = 'cfrn'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         cgContextRef = 'cntx'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         char = 'TEXT'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         clickActivationResult = 'clac'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         collection = 'cltn'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlActionUPP = 'caup'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlFrameMetrics = 'cins'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlPartCode = 'cprt'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         controlRef = 'ctrl'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         decimalStruct = 'decm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         eventHotKeyID = 'hkid'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         eventTargetRef = 'etrg'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         fsVolumeRefNum = 'voln'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         gWorldPtr = 'gwld'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         gdHandle = 'gdev'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         glyphSelector = 'glfs'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         grafPtr = 'graf'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         hiCommand = 'hcmd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         hiPoint = 'hipt'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         hiRect = 'hirc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         hiShapeRef = 'shap'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         hiSize = 'hisz'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         ieee32BitFloatingPoint = 'sing'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         ieee64BitFloatingPoint = 'doub'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         indicatorDragConstraint = 'cidc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuCommand = 'mcmd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuDirection = 'mdir'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuEventOptions = 'meop'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuItemIndex = 'midx'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuRef = 'menu'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         menuTrackingMode = 'mtmd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         modalClickResult = 'wmcr'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         mouseButton = 'mbtn'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         mouseTrackingRef = 'mtrf'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         mouseWheelAxis = 'mwax'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         osStatus = 'osst'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         pasteboardRef = 'pbrd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         qdRgnHandle = 'rgnh'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         scrapRef = 'scrp'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         sint16 = 'shor'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         sint32 = 'long'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         sint64 = 'comp'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tabletPointRec = 'tbrc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tabletPointerRec = 'tbrc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         tabletProximityRec = 'tbpx'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         themeMenuItemType = 'tmit'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         themeMenuState = 'tmns'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         themeMenuType = 'tmty'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         uint32 = 'magn'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         utf8Text = 'utf8'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         voidPtr = 'void'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowDefPartCode = 'wdpt'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowModality = 'wmod'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowPartCode = 'wpar'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowRef = 'wind'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowRegionCode = 'wshp'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowTransitionAction = 'wtac'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         windowTransitionEffect = 'wtef'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> 'types' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         x128BitFloatingPoint = 'ldbl'.
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui1 events\x7fComment: a Mac one-ui1 button mouse fakes the middle/right ui1 button with
option/control/command, the same mapping ui2s whichButton uses. Returns the X
ui1 button number 1/2/3. Wheel and synthetic leave have no mbtn; IfFail: 1. -- claude & grok & dmu 5/26, 8/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         ui1ButtonNumber = ( |
             b.
             m.
            | 
            b: getUnsignedShortParam: parameters mouseButton Type: types mouseButton IfFail: 1.
            b = 1 ifTrue: [
              m: getUnsignedParam: parameters keyModifiers Type: types uint32 IfFail: 0.
              b: case if: [(m && modifierMasks option ) != 0] Then: 2
                      If: [(m && modifierMasks command) != 0] Then: 3
                      If: [(m && modifierMasks control) != 0] Then: 2
                                                              Else: 1.
            ].
            b).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui2 events\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         undefinedSelector: sel Type: t Delegatee: d MethodHolder: mh Arguments: args = ( |
            | 
            (setEvtPrefix isPrefixOf: sel)
             ifFalse: [error: 'really unknown: ', sel]
                True: [setEvtPrefix, 'ignored:' sendTo: self WithArguments: args]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui2 events\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         whichButton = ( |
             b.
             c.
            | 
            b: getUnsignedShortParam: parameters mouseButton Type: types mouseButton.

            "Swap middle and right buttons if wanted"
            preferences swapMouseButtons ifTrue: [
              case
                if: [ 2 = b ] Then: [ b: 3 ]
                If: [ 3 = b ] Then: [ b: 2 ]
            ].

            b = 1 ifTrue: [|m|
              "use control and option for now"
              m: getUnsignedParam: parameters keyModifiers Type: types uint32.
              b: case if: [(m &&  modifierMasks option ) != 0] Then: 2
                      If: [(m &&  modifierMasks command) != 0] Then: 3
                     "let OS X two-button mouse right button be middle"
                      If: [(m &&  modifierMasks control) != 0] Then: 2
                                                               Else: 1.
            ].

            buttonNames at: 0 max: buttonNames size pred min: b pred).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> () From: ( | {
         'Category: converting to ui1 events\x7fComment: ui1 reads the event `state` as an X11 state mask (cursor leftButtonDown =
state && button1Mask, shiftKeyDown = state && shiftMask, ...). Translate the
Mac mouse chord (bit0 left, bit1 right, bit2 middle) and Carbon modifiers into
that mask. X11 constants: button1=256 button2=512 button3=1024, shift=1 lock=2
control=4 mod1=8. (&&/|| are bitwise on Self integers.) Without this, drag
failed -- the raw Mac chord bit (left=1) ANDed with button1Mask (256) is 0, so
the modal drag loop saw the ui1 button as up. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         xStateMaskFromChord: chord Modifiers: mods = ( |
             s.
            | 
            s: 0.
            (chord && 1) != 0 ifTrue: [s: s || 256].   "Mac left   -> button1Mask"
            (chord && 4) != 0 ifTrue: [s: s || 512].   "Mac middle -> button2Mask"
            (chord && 2) != 0 ifTrue: [s: s || 1024].  "Mac right  -> button3Mask"
            (mods && modifierMasks shift)    != 0 ifTrue: [s: s || 1].  "shiftMask"
            (mods && modifierMasks control)  != 0 ifTrue: [s: s || 4].  "controlMask"
            (mods && modifierMasks option)   != 0 ifTrue: [s: s || 8].  "mod1Mask (meta/alt)"
            (mods && modifierMasks capsLock) != 0 ifTrue: [s: s || 2].  "lockMask"
            s).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'Comment: I take the place of both the X font ID object
(used to draw)
and the X font struct object (used to measure text).\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fontIDAndStruct = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz fontIDAndStruct.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         atsFont.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         fontSpec.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         metrics.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'Comment: I take the place of both the X font ID object
(used to draw)
and the X font struct object (used to measure text).\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fontIDAndStruct = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz fontIDAndStruct.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         adjustRectangle: r Width: borderWidth = ( |
            | 
            "Need rectangle:r Width: w Color: c to be consistent across quartz/mac/X,
            so override me"
            (r origin +  (borderWidth /+ 2)) # (r corner + (1 max: borderWidth /- 2))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         arcPathWithin: r From: startAngle Spanning: spanAngle GC: gc = ( |
             c.
             cw.
             end.
             h.
             start.
             w.
            | 
            c: r center.
            start: mapUI2Angle: startAngle.
            end:   mapUI2Angle: startAngle + spanAngle.
            w: r width.  h: r height.
            cw: spanAngle >= 0.

            gc beginPath.
            w = h ifTrue: [
              gc addArcX: c x Y:c y
                  Radius: w half
                  StartAngle: start
                  EndAngle:   end
                 Clockwise: cw
            ]
            False: [
              gc withNewGStateDo: [
                gc translateCTM_X: c x Y: c y.
                gc scaleCTM_X: r width asFloat half
                            Y: r height asFloat half.
                gc addArcX: 0 Y: 0 Radius: 1
                 StartAngle: start EndAngle: end
                 Clockwise: cw
              ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         bezier: pt1 Control: c1 Control: c2 To: pt2 Width: w = ( |
            | 
            gc lineWidth: w.
            gc bezier: pt1 Control: c1 Control: c2 To: pt2.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         copyArea: rect To: aPlatformWindowOrDrawable At: pt GC: srcGC = ( |
             dstBottom.
             dstLeft.
             dstTop.
             gc.
             qDstX.
             qDstY.
             z.
            | 
            gc: aPlatformWindowOrDrawable gc.

            "Quartz always copies ENTIRE layer, so adjust point in dst.
             gc getCTM_A is the view zoom while drawing image content into a
             zoomed buffer, and 1.0 for the buffer->window blit and at 100%;
             scaling dst by it makes cached pixmaps/images zoom along with the
             vector geometry that the CTM already scales."

            z: gc getCTM_A.

            dstLeft:   (pt x - rect left) * z.
            dstTop:    (pt y - rect top)  * z.
            dstBottom: dstTop + (height * z).

            "Further, dstX and Y will be used with identity CTM so we have
             to translate to Quartz coordinates."

            qDstX: dstLeft.
            qDstY: aPlatformWindowOrDrawable height - dstBottom.
            gc withClip: pt ## rect size "this rect is in ui2 coordinates"
                     Do: [
              gc setIdentityCTM.
              1.0 = z
                ifTrue:  [gc drawLayer: self X: qDstX Y: qDstY]
                 False: [gc drawLayer: self X: qDstX Y: qDstY Width: (width * z) Height: (height * z)]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         depth = ( |
            | 
            32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawArcWithin: r From: startAngle Spanning: spanAngle GC: gc = ( |
            | 
            spanAngle = 360 ifTrue: [
              gc strokeEllipseX: r origin x Y: r origin y Width: r width Height: r height.
            ]
            False: [
              arcPathWithin: r From: startAngle Spanning: spanAngle GC: gc.
              gc strokePath.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawArcWithin: rect From: startAngle Spanning: spanAngle Width: w GC: gc = ( |
            | 
            resend.drawArcWithin: (rect indent: w asFloat half)
              From: startAngle
              Spanning: spanAngle
              Width: w
              GC: gc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLine: pt1 To: pt2 GC: gc = ( |
            | 
            "Crisp 1px bevels: ui1 draws box edges/highlights/sunken-frames as horizontal or vertical 1px lines. A CG strokePath at integer coords (antialiasing off) lands a 1px stroke between pixel rows AND the +1 nudge below shifts it off the filled faces -- so corners gap and the sunken type-area bevel vanishes. Render a thin axis-aligned line as an exact 1px filled rect in the same logical (top-down) coords the faces use; only thick or truly diagonal lines still stroke. -- claude & dmu 5/26"
            (gc lineWidthValue <= 1) ifTrue: [
              pt1 y = pt2 y ifTrue: [
                gc fillRectIntegerX: (pt1 x min: pt2 x) Y: pt1 y
                              Width: (((pt1 x max: pt2 x) - (pt1 x min: pt2 x)) + 1) Height: 1.
                ^ self ].
              pt1 x = pt2 x ifTrue: [
                gc fillRectIntegerX: pt1 x Y: (pt1 y min: pt2 y)
                              Width: 1 Height: (((pt1 y max: pt2 y) - (pt1 y min: pt2 y)) + 1).
                ^ self ].
            ].
            gc beginPath.
            gc moveToPointX: pt1 x succ Y: pt1 y succ.
            gc addLineToPointX: pt2 x succ Y: pt2 y succ.
            gc strokePath.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLines: ptlist GC: gc = ( |
            | 
            gc beginPath.
            ptlist    doFirst: [|:p| gc moveTo: p]
                   MiddleLast: [|:p| gc addLineTo: p].
            gc closePath.
            gc strokePath.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawPoint: pt GC: gc = ( |
            | 
            gc fillRectX: pt x Y: pt y Width: 1 Height: 1.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'

         drawPolygonIntegerXs: xs Ys: ys GC: gc = ( |
            | 
            gc drawPolygonIntegerXs: xs Ys: ys.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawRectangle: r GC: gc = ( |
            | 
            gc drawRectangle: r.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawString: str At: pt GC: gc = ( |
            | 
            gc drawString: str At: pt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillArcWithin: r From: startAngle Spanning: spanAngle GC: gc = ( |
            | 
            spanAngle = 360 ifTrue: [
              gc fillEllipseIn: r
            ]
            False: [
              arcPathWithin: r From: startAngle Spanning: spanAngle GC: gc.
              (spanAngle % 360) = 0 ifFalse: [ | c |
                c: r center.
                gc addLineTo: c.
                gc closePath.
              ].
              gc fillPath.
            ].
            self).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Comment: ui1 fills polygons by point list; quartz.self only had the IntegerXs:Ys: form. Convert the point list to x/y vectors (same as the X path) and delegate. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygon: ptlist GC: gc = ( |
             i <- 0.
             xv.
             yv.
            | 
            xv: vector copySize: ptlist size.
            yv: vector copySize: ptlist size.
            ptlist do: [| :p |
               xv at: i Put: p x asSmallInteger.
               yv at: i Put: p y asSmallInteger.
               i: i + 1. ].
            fillPolygonIntegerXs: xv Ys: yv GC: gc).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygonIntegerXs: xs Ys: ys GC: gc = ( |
            | 
            gc fillPolygonIntegerXs: xs Ys: ys.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillRectangle: r GC: gc = ( |
            | 
            gc fillRectangle: r.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         mapUI2Angle: a = ( |
            | 
            "ccw 0 = right, degrees -> cw 0 = top radians"
            (a negate asFloat / 180.0) * pi).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractDrawable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         screen = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | 
            width @ height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing modes\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         translucentlyDo: blk = ( |
            | 
            gc withNewGStateDo: [
              gc setAlpha: 0.5.
              blk value.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing modes\x7fComment: Font smoothing follows AA: ui1 slot labels want both off so 12pt Verdana is bilevel like indexed. -- grok 08/26/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         withAntialiasing: bool Do: blk = ( |
            | 
            gc withNewGStateDo: [
              gc setShouldAntialias: bool.
              gc setShouldSmoothFonts: bool.
              blk value.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> () From: ( | {
         'Category: drawing modes\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         withClip: newClip Do: blk = ( |
            | 
            gc withClip: newClip Do: blk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         graf = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'graf' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals quartz drawable deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'graf' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz graf.

CopyDowns:
globals quartz drawable. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'Comment: needed for textWidth:\x7fModuleInfo: Module: quartz InitialContents: InitializeToExpression: (quartz graf)\x7fVisibility: public'
        
         port <- bootstrap stub -> 'globals' -> 'quartz' -> 'graf' -> ().
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'Category: ui1 GC state\x7fComment: ui1/X share ONE display gc, so plane_mask:/function: set via any drawables gc
affect the next op regardless of which drawable it targets -- e.g. copy:Mask:
sets gxAnd via the SOURCE image gc, then the mask+image copies run through
OTHER contexts. On Quartz each context is a separate object, so this shared
raster-function + plane-mask state must live GLOBALLY to mirror display gc;
otherwise the masked stencil blit (box shape mask -> 3-D corners, drag
acetate) is silently ignored. foreground/font stay per-context (always set on
the same context they draw into). -- claude & dmu 5/27\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         gcPlaneMask <- 255.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         gcRasterFn <- 3.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'graf' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         gc.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         graf = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'graf' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz graf.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'graf' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'graf' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         image = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'image' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'image' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz image.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         image = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz image.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'image' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         imageSource = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'imageSource' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'imageSource' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz imageSource.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         imageSource = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'imageSource' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz imageSource.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'imageSource' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'imageSource' -> ().
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'Category: graphics (ui1)\x7fComment: ui1 offscreen pixmap on Quartz: an 8-bit indexed drawable backed by a
grayscale CGBitmapContext (gray byte = palette index).
createForSameScreenAs:Size:Depth: builds one; bitmap.self drives it like any
drawable, passing this objects own gc. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         indexedPixmap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'indexedPixmap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz indexedPixmap.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         context.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         height <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'Category: graphics (ui1)\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         indexedPixmap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz indexedPixmap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'Comment: same-size indexed scratch buffer for plane-masked CG shape draws (fillPolygon/lines/text). CG cannot plane-mask its own path fills, so a masked shape is drawn into this scratch (preloaded with the dest bytes) then merged back through the plane mask. Lazily created by maskedScratch; nil for unmasked drawables (ui2). -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         scratch.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         width <- 0.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         layer = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'layer' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals quartz drawable deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'layer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz layer.

CopyDowns:
globals quartz drawable. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'layer' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         gc.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         layer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'layer' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz layer.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'layer' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'layer' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         pattern = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'pattern' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'pattern' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz pattern.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'pattern' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'pattern' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz pattern parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'pattern' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         platformWindow = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'platformWindow' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'platformWindow' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz platformWindow.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Comment: the index->RGB palette (256*3 bytes) the display blit feeds to blitShadowWithCLUT:. Set when ui1 installs a colormap into this window (quartz colormap install), mirroring X xSetWindow:Colormap:. nil until then -> sync/flush paint nothing. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         currentCLUT.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         platformWindow = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz platformWindow.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         quartzWindow.
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Comment: ui1 8-bit indexed shadow (a quartz indexedPixmap). When set (makeShadow, ui1 only), gc routes drawing here so direct window draws (ui1 caret, etc.) are indexed like the offscreens; blit shadow->trueColour window at display. nil for ui2 windows (which draw true colour directly). -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         shadow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'Category: graphics (ui1)\x7fComment: ui1 fetches its blur/acetate stipple patterns (gray/lightGray/...) from
macToolbox qdGlobals. Direct 32-bit uses the pattern template as CG alpha
(see rgbaContext fillStippled); the 1-bit image is unused, so these stay
nullImage placeholders. -- claude & grok & dmu 5/26, 8/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         qdGlobals = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'qdGlobals' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz qdGlobals.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'qdGlobals' -> () From: ( | {
         'Comment: every standard QD pattern name returns the null image placeholder (stippling is solid for now). -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         black = ( |
            | nullImage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'qdGlobals' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         darkGray = ( |
            | nullImage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'qdGlobals' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         gray = ( |
            | nullImage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'qdGlobals' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         lightGray = ( |
            | nullImage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'qdGlobals' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'qdGlobals' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         white = ( |
            | nullImage).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         textLayout = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'textLayout' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'textLayout' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz textLayout.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         textLayout = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz textLayout.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         textStyle = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'textStyle' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'textStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz textStyle.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         textStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'textStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz textStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'textStyle' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'textStyle' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         window = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'window' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'window' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz window.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         grafPort.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         window = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz window.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fCategory: Quartz (0 .. 255)\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         blueForQuartz = ( |
            | 
            intRange = 1023 ifTrue: [ rawBlue >> 2 ] False: [blue * 255]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fCategory: Quartz (0 .. 255)\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         greenForQuartz = ( |
            | intRange = 1023 ifTrue: [ rawGreen >> 2 ] False: [green * 255]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fCategory: Quartz (0 .. 255)\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         redForQuartz = ( |
            | 
            intRange = 1023 ifTrue: [ rawRed >> 2 ] False: [red * 255]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         quartz = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'Category: quartz font objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         atsFont = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFont' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz atsFont.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'Category: quartz font objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         atsFontFamily = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontFamily' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz atsFontFamily.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontFamilyIterator' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         elementProto = bootstrap stub -> 'globals' -> 'quartz' -> 'atsFontFamily' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontFamilyIterator' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fontOrFontFamilyIterators* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontFamilyIterator' -> 'fontOrFontFamilyIterators' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz atsFontFamilyIterator fontOrFontFamilyIterators.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontFamilyIterator' -> 'fontOrFontFamilyIterators' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         createLocal = ( |
            | createContext: kATSFontContextLocal Options: kATSOptionFlagsDefaultScope).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontFamilyIterator' -> 'fontOrFontFamilyIterators' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         do: blk = ( |
            | 
            idsDo: [|:id| blk value: elementProto copyID: id]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontFamilyIterator' -> 'fontOrFontFamilyIterators' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         idsDo: blk = ( |
             it.
            | 
            it: createLocal.
            [
              [|id|
                id: it nextIfFail: [^ nil].
                blk value: id
              ] loop
            ] onReturn: [it release]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontFamilyIterator' -> 'fontOrFontFamilyIterators' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kATSFontContextLocal = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontFamilyIterator' -> 'fontOrFontFamilyIterators' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kATSOptionFlagsDefaultScope = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontFamilyIterator' -> 'fontOrFontFamilyIterators' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontIterator' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         elementProto = bootstrap stub -> 'globals' -> 'quartz' -> 'atsFont' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontIterator' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fontOrFontFamilyIterators* = bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontFamilyIterator' -> 'fontOrFontFamilyIterators' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'atsFontMetrics' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'cgFont' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colorSpace' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         colorRenderingIntent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'colorSpace' -> 'colorRenderingIntent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz colorSpace colorRenderingIntent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colorSpace' -> 'colorRenderingIntent' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         absoluteColorimetric = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colorSpace' -> 'colorRenderingIntent' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         default = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colorSpace' -> 'colorRenderingIntent' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         perceptual = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colorSpace' -> 'colorRenderingIntent' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         relativeColorimetric = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colorSpace' -> 'colorRenderingIntent' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         saturation = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colorSpace' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         createColorVectorFrom: im = ( |
             bytesPerEntry = 3.
             x.
            | 

            x: byteVector copySize: im colors size * bytesPerEntry.
            im colors size do: [|:i. c. j.  |
              c: im colors at: i.
              j: bytesPerEntry * i.
              x at: j     Put: c   redForQuartz.
              x at: j + 1 Put: c greenForQuartz.
              x at: j + 2 Put: c  blueForQuartz.
            ].
            x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colorSpace' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         createForIndexedImage: im = ( |
             g.
             r.
            | 
            g: createGenericRGB.
            r: createIndexedBasedOn: g  ColorTable:  createColorVectorFrom: im.
            g release.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colorSpace' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colormap' -> () From: ( | {
         'Comment: private colormap, so allocation just stores the requested colour. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         allocColor: xc = ( |
            | storeOne: xc. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         createFor: w Depth: d = ( |
            | copy initForWindow: w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         initForWindow: w = ( |
            | 
            win: w.
            clut: byteVector copySize: 768.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colormap' -> () From: ( | {
         'Comment: install this colormap into its window: record the CLUT on the platformWindow (where the display blit reads it) and re-convert the shadow, so a CLUT change repaints without ui1 redrawing -- this is colour-map animation. Mirrors X xSetWindow:Colormap:; install does not flush (matches the X warning that install without sync is suspect), installAndSync does. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         install = ( |
            | win isNil ifFalse: [ win currentCLUT: clut. win displayShadow ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         installAndSync = ( |
            | install. win isNil ifFalse: [ win flush ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colormap' -> () From: ( | {
         'Comment: read one entry back into xc (16-bit components). -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         queryOne: xc = ( |
             p.
            | 
            p: xc pixel.
            xc red:   ((clut at: (p * 3))       << 8).
            xc green: ((clut at: ((p * 3) + 1)) << 8).
            xc blue:  ((clut at: ((p * 3) + 2)) << 8).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         store: colors = ( |
            | colors do: [| :c | storeOne: c]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'colormap' -> () From: ( | {
         'Comment: store one entry: xc carries pixel + 16-bit r/g/b; keep the high byte. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         storeOne: xc = ( |
             p.
            | 
            p: xc pixel.
            clut at: (p * 3)       Put: (xc red   >> 8).
            clut at: ((p * 3) + 1) Put: (xc green >> 8).
            clut at: ((p * 3) + 2) Put: (xc blue  >> 8).
            self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: pts, rcts -> scalars\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         addArcCenter: pt Radius: r StartAngle: start EndAngle: end Clockwise: cw = ( |
            | 
            addArcX: pt x Y: pt y Radius: r StartAngle: start EndAngle: end Clockwise: cw).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: pts, rcts -> scalars\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         addCurveWithControlPoints: c1 And: c2 To: dst = ( |
            | 
            addCurveToPointCP1X: c1 x CP1Y: c1 y CP2X: c2 x CP2Y: c2 y X: dst x Y: dst y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: pts, rcts -> scalars\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         addLineTo: pt = ( |
            | addLineToPointX: pt x Y: pt y).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Comment: background colour only matters for stippled/opaque fills, which are deferred; record nothing for now. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         backgroundColor: i = ( |
            | self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         bezier: pt1 Control: c1 Control: c2 To: pt2 = ( |
            | 
            beginPath.
            moveTo: pt1.
            addCurveWithControlPoints: c1 And: c2 To: pt2.
            strokePath).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         blendMode = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz context blendMode.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         color = 14.
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'Comment: kCGBlendModeCopy -- source RGB replaces dest, ignores source alpha.\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         copy = 17.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         colorBurn = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         colorDodge = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         darken = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         difference = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         exclusion = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         hardLight = 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         hue = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         lighten = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         luminosity = 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         multiply = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         normal = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         overlay = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         saturation = 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         screen = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'blendMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         softLight = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         dashedLineWidth: w = ( |
            | self).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         dashes: d = ( |
            | self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: dashed lines\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         dashes: dashByteVec Offset: os = ( |
            | 
            setLineDashPhase: 0 Lengths: dashByteVec mapBy: [|:b| b asFloat] Into: vector copySize: dashByteVec size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawImage: qim At: rect = ( |
            | 
            drawImage: qim X: rect left Y: rect top Width: rect width Height: rect height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLayer: layer At: pt = ( |
            | 
            drawLayer: layer X: pt x Y: pt y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLines: ptList = ( |
            | 
            beginPath.
            ptList doFirst: [|:p|    moveTo: p]
                MiddleLast: [|:p| addLineTo: p].
            closePath.
            strokePath).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawPolygonIntegerXs: xs Ys: ys = ( |
             first <- bootstrap stub -> 'globals' -> 'true' -> ().
            | 
            beginPath.
            xs with: ys Do: [|:x. :y|
              first ifTrue: [    moveToPointX: x Y: y. first: false ]
                     False: [ addLineToPointX: x Y: y].
            ].
            closePath.
            strokePath).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawRectangle: r = ( |
            | 
            strokeRectX: r left Y: r top Width: r width Height: r height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawString: s At: pt = ( |
            | 
            setTextDrawingMode: textMode fill.
            "CoreText layout (proper advances) instead of the deprecated showTextAtPoint; paints with the current fill colour (= palette index in the indexed offscreen) via kCTForegroundColorFromContextAttribute in the prim. -- claude & dmu 5/26"
            drawCTText: s FontName: curFontName Size: curFontSize asFloat
                     X: pt x asFloat Y: pt y asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: pts, rcts -> scalars\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillEllipseIn: r = ( |
            | 
            fillEllipseX: r left Y: r top Width: r width Height: r height).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillOpaqueStippled = ( |
            | self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygonIntegerXs: xs Ys: ys = ( |
             first <- bootstrap stub -> 'globals' -> 'true' -> ().
            | 
            beginPath.
            xs with: ys Do: [|:x. :y|
              first ifTrue: [    moveToPointX: x Y: y. first: false ]
                     False: [ addLineToPointX: x Y: y].
            ].
            closePath.
            fillPath).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: drawing\x7fComment: rectangle fill honouring the ui1 GC plane mask + raster function. The common
case (no plane mask, copy mode) takes the fast CG path; otherwise the masked
byte-level prim applies the raster op + plane mask on the indexed bytes, so
acetate/arrow overlays do not clobber the underlying planes. Coords are
integer ui1/X logical pixels. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillRectIntegerX: ix Y: iy Width: iw Height: ih = ( |
            | 
            ((quartz gcPlaneMask = 255) && [quartz gcRasterFn = 3])
              ifTrue: [ fillRectX: ix Y: iy Width: iw Height: ih ]
              False:  [ fillIndexedMaskedX: ix Y: iy Width: iw Height: ih
                                      Index: indexFG
                                       Mask: quartz gcPlaneMask
                                   Function: quartz gcRasterFn ].
            self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillRectangle: r = ( |
            | 
            fillRectIntegerX: r left Y: r top Width: r width Height: r height).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Comment: Remaining X11-GC protocol for ui1. Colour/line/clip map to live CGContext state (foregroundColor:/lineWidth:/font: already do). The raster-op functions (gx*) return the real X11 GXfunction codes but function: is a no-op for now (everything draws in copy mode -- XOR rubber-banding deferred); plane_mask:, clipping and dashes are likewise deferred. Indexed 8-bit: stipple stays a no-op (no alpha channel). Direct 32-bit rgbaContext maps stipple to setAlpha:. -- claude & grok & dmu 5/26, 8/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillSolid = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillStippled = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Comment: Direct rgbaContext sets CG alpha from the pattern density. Indexed no-op. -- grok 08/26/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         stippleAlphaFrom: pattern = ( |
            | self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         font: aQuartzFontIDAndStruct = ( |
            | 
            curFontName: aQuartzFontIDAndStruct postScriptName.
            curFontSize: aQuartzFontIDAndStruct fontSize.
            selectFont: curFontName Size: curFontSize).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Comment: ui1 drives its drawable through an X11-style GC; teach a quartz context that protocol by translating to CGContext state. The arg is a colormapEntry (cme); its `index` is the 8-bit palette index (the X GC does `foreground: cme index`). Write it as the gray byte -- the indexed offscreen is 8-bit grayscale with antialiasing off, so the byte survives intact (verified: fill 137 -> pixelValueAt: = 137). -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         foregroundColor: cme = ( |
             gray.
            | 
            indexFG: cme index.
            gray: cme index asFloat / 255.0.
            setGrayFillColorGray:   gray Alpha: 1.0.
            setGrayStrokeColorGray: gray Alpha: 1.0.
            self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         foreground: aPaint = ( |
            | 
              setFillColorRed: aPaint red Green: aPaint green Blue: aPaint blue Alpha: aPaint alpha.
            setStrokeColorRed: aPaint red Green: aPaint green Blue: aPaint blue Alpha: aPaint alpha).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         function: f = ( |
            | quartz gcRasterFn: f. self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: CTM\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getCTM_A = ( |
            | 
            getCTM_AIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: CTM\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getCTM_AIfFail: fb = ( |
            | ( raw_getCTMIfFail: [|:e| ^ fb value: e]) at: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: CTM\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getCTM_B = ( |
            | getCTM_BIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: CTM\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getCTM_BIfFail: fb = ( |
            | ( raw_getCTMIfFail: [|:e| ^ fb value: e]) at: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: CTM\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getCTM_C = ( |
            | getCTM_CIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: CTM\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getCTM_CIfFail: fb = ( |
            | ( raw_getCTMIfFail: [|:e| ^ fb value: e]) at: 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: CTM\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getCTM_D = ( |
            | getCTM_DIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: CTM\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getCTM_DIfFail: fb = ( |
            | ( raw_getCTMIfFail: [|:e| ^ fb value: e]) at: 3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: CTM\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getCTM_TX = ( |
            | getCTM_TXIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: CTM\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getCTM_TXIfFail: fb = ( |
            | ( raw_getCTMIfFail: [|:e| ^ fb value: e]) at: 4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: CTM\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getCTM_TY = ( |
            | getCTM_TYIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: CTM\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getCTM_TYIfFail: fb = ( |
            | ( raw_getCTMIfFail: [|:e| ^ fb value: e]) at: 5).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getClipRectangle = ( |
            | 
            (getClipX @ getClipY) ## (getClipWidth @ getClipHeight)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: TextMatrix\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getTextMatrix_A = ( |
            | getTextMatrix_AIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: TextMatrix\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getTextMatrix_AIfFail: fb = ( |
            | ( raw_getTextMatrixIfFail: [|:e| ^ fb value: e]) at: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: TextMatrix\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getTextMatrix_B = ( |
            | getTextMatrix_BIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: TextMatrix\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getTextMatrix_BIfFail: fb = ( |
            | ( raw_getTextMatrixIfFail: [|:e| ^ fb value: e]) at: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: TextMatrix\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getTextMatrix_C = ( |
            | getTextMatrix_CIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: TextMatrix\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getTextMatrix_CIfFail: fb = ( |
            | ( raw_getTextMatrixIfFail: [|:e| ^ fb value: e]) at: 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: TextMatrix\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getTextMatrix_D = ( |
            | getTextMatrix_DIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: TextMatrix\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getTextMatrix_DIfFail: fb = ( |
            | ( raw_getTextMatrixIfFail: [|:e| ^ fb value: e]) at: 3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: TextMatrix\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getTextMatrix_TX = ( |
            | getTextMatrix_TXIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: TextMatrix\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getTextMatrix_TXIfFail: fb = ( |
            | ( raw_getTextMatrixIfFail: [|:e| ^ fb value: e]) at: 4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: TextMatrix\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getTextMatrix_TY = ( |
            | getTextMatrix_TYIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: TextMatrix\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getTextMatrix_TYIfFail: fb = ( |
            | ( raw_getTextMatrixIfFail: [|:e| ^ fb value: e]) at: 5).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         gxAnd = ( |
            | 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         gxClear = ( |
            | 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         gxCopy = ( |
            | 3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         gxOr = ( |
            | 7).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         gxXor = ( |
            | 6).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         lineCap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'lineCap' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz context lineCap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'lineCap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         butt = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'lineCap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         round = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'lineCap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         square = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         lineJoin = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'lineJoin' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz context lineJoin.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'lineJoin' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         bevel = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'lineJoin' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         miter = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'lineJoin' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         round = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         lineWidth: w = ( |
            | 
            "other systems use line width 0 for fine lines, not Quartz"
            lineWidthValue: w = 0 ifTrue: 1 False: w.
            setLineWidth: lineWidthValue.
            w = 0 ifTrue: [setLineDashPhase: 0 Lengths: vector].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: pts, rcts -> scalars\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         moveTo: p = ( |
            | moveToPointX: p x Y: p y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         pathMode = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'pathMode' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz context pathMode.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'pathMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         eoFill = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'pathMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         eoFillStroke = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'pathMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         fill = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'pathMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         fillStroke = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'pathMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         stroke = 2.
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         plane_mask: m = ( |
            | quartz gcPlaneMask: m. self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: CTM\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         printCTM = ( |
             r.
            | 
            r: getCTM_A printString, ' ', getCTM_B printString, ' ', getCTM_C printString, ' ', getCTM_D printString, ' ', getCTM_TX printString, ' ', getCTM_TY printString.
            r printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: compensating for quartz/ui2 coordinate mismatch\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         setCTMForZeroAtTopHeight: height = ( |
            | 
            getCTM_TY = 0   ifTrue: [
              translateCTM_X: 0 Y: height.
              scaleCTM_X: 1.0 Y: -1.
            ].
            setTextMatrixToInvert.
            self).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         setClipMask: m = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         setClipOrigin: p = ( |
            | self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         setClipRectangle: r = ( |
            | 
            r ifNil: [ ^ self ].
            clipToRectX: r left Y: r top Width: r width Height: r height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: compensating for quartz/ui2 coordinate mismatch\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         setIdentityCTM = ( |
            | 
            getCTM_B != 0  ifTrue: [
              getCTM_B = getCTM_C  ifTrue: [rotateCTM_Radians: getCTM_B]
                False: [error: 'unimplemented']
            ].
            scaleCTM_X: getCTM_A inverse Y: getCTM_D inverse.
            translateCTM_X: getCTM_TX negate Y: getCTM_TY negate.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         setNoClipMask = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: compensating for quartz/ui2 coordinate mismatch\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         setTextMatrixToInvert = ( |
            | 
            (getTextMatrix_D = -1) || [getCTM_TY = 0] ifTrue: [
              ^ self
            ].
            setTextMatrix_A: 1 B: 0 C: 0 D: -1
                         TX: 0 TY: 0).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         stipple: s = ( |
            | self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         textEncoding = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'textEncoding' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz context textEncoding.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'textEncoding' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         fontSpecific = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'textEncoding' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         macRoman = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         textMode = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'textMode' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz context textMode.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'textMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         clip = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'textMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         fill = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'textMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         fillClip = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'textMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         fillStroke = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'textMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         fillStrokeClip = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'textMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         invisible = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'textMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         stroke = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> 'textMode' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         strokeClip = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: blending\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         withBlendMode: b Do: blk = ( |
            | 
            withNewGStateDo: [
              setBlendMode: b.
              blk value
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         withClip: newClip Do: blk = ( |
            | 
            withNewGStateDo: [
              setClipRectangle: newClip.
              blk value
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: compensating for quartz/ui2 coordinate mismatch\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         withIdentCTMDo: blk = ( |
            | 
            withNewGStateDo: [
              setIdentityCTM.
              blk value
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         withNewGStateDo: blk = ( |
            | 
            saveGState.
            blk onReturn: [restoreGState]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'dataProvider' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         event = bootstrap stub -> 'globals' -> 'quartz' -> 'event' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         ascent = ( |
            | 
            metrics ascent * fontSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         boundsOfString: s = ( |
            | 
            "getGlyphBounds fails for some reason when reopening a factory morph"
            [quartz textStyle  getGlyphBoundsFor: s FontID: atsFont id Size: fontSize].
            quartz textStyle  getUnjustifiedBoundsFor: s FontID: atsFont id Size: fontSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         capHeight = ( |
            | metrics capHeight * fontSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForFontSpec: aFontSpec Port: aCGrafPort = ( |
             r.
            | 
            r: copy.
            r fontSpec: aFontSpec.
            r port: aCGrafPort. 
            r atsFont: quartz atsFont findFromFontSpec: aFontSpec.
            r metrics: r atsFont getHorizontalMetrics.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | [todo ui1 dmu experimental]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'Comment: X11 drawing.self places the baseline at top + (height - descender). Ceil to a pixel so Helvetica Neue and Helvetica Neue Medium (12pt 2.56 vs 2.60) share a descender and therefore a baseline. -- claude & dmu 8/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         descender = ( |
            | 
            descent ceil asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         descent = ( |
            | 
            metrics descent negate* fontSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fontSize = ( |
            | fontSpec size * quartzFontEnlargement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'Comment: X11 font.height is an integer (ascent+descent). Ceil the CT line box so 12pt Helvetica Neue (14.32) and Medium (14.65) both become 15; round() split them 14 vs 15 and slot names no longer lined up with contents. -- claude & dmu 8/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | 
            maxCharHeight ceil asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         heightOfString: s = ( |
            | 
            (sizeOfString: s) y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         leading = ( |
            | 
            metrics leading * fontSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         maxCharHeight = ( |
            | 
            ascent + descent  + leading).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         postScriptName = ( |
            | atsFont postScriptName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         quartzFontEnlargement = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'Comment: X11 sizeOfString is width @ (nLines * font height). The ATSU unjustified-bounds vector is (0, ascent, width, descent); turning that into a rectangle and taking its height collapsed to ascent, so ui1 boxes were too short and labels sat on the bottom (4 more slots). Width still comes from the layout bounds. -- claude & dmu 8/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         sizeOfString: s = ( |
            | 
            ((boundsOfString: s) width ceil asSmallInteger)
              @ ((s occurrencesOf: '\n') succ * height)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         statePrintString = ( |
            | atsFont ifNil: '' IfNotNil: [atsFont statePrintString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         textWidth: aString = ( |
            | 
            widthOfString: aString).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'Comment: max char advance in font units (normalized by size, like ascent/descent); `width` = widMax * fontSize. Was referenced by width but never defined. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         widMax = ( |
            | metrics maxAdvanceWidth).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
            | 
            widMax * fontSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         widthOfString: s = ( |
            | 
            (sizeOfString: s) x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'fontIDAndStruct' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         xfont = ( |
            | [todo ui1 dmu experimental]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'graf' -> () From: ( | {
         'Category: opening & closing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            endContext: gc IfFail: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'graf' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | 
            (getWindowIfFail: [^0]) height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'graf' -> () From: ( | {
         'Category: opening & closing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            gc: beginContext.
            gc setCTMForZeroAtTopHeight: height.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'graf' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'graf' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
            | getWindow width).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         alphaInfoConstants = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'alphaInfoConstants' -> () From: ( |
             {} = 'Comment: see CGImageAlphaInfo in CGImage.h\x7fModuleInfo: Creator: traits quartz image alphaInfoConstants.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'alphaInfoConstants' -> () From: ( | {
         'Comment: No color data, just alpha\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         alphaOnly = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'alphaInfoConstants' -> () From: ( | {
         'Comment: e.g. non-premultiplied ARGB\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         first = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'alphaInfoConstants' -> () From: ( | {
         'Comment: e.g. non-premultiplied RGBA\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         last = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'alphaInfoConstants' -> () From: ( | {
         'Comment: e.g., RGB\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         none = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'alphaInfoConstants' -> () From: ( | {
         'Comment: e.g., XRGB\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         noneSkipFirst = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'alphaInfoConstants' -> () From: ( | {
         'Comment: e.g., RGBX\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         noneSkipLast = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'alphaInfoConstants' -> () From: ( | {
         'Comment: e.g., premultiplied ARGB\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         premultipliedFirst = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'alphaInfoConstants' -> () From: ( | {
         'Comment: e.g., premultiplied RGBA\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         premultipliedLast = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         bitmapInfoConstants = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'bitmapInfoConstants' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz image bitmapInfoConstants.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'bitmapInfoConstants' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         alphaInfoMask = 31.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'bitmapInfoConstants' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         byteOrder16Big = 12288.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'bitmapInfoConstants' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         byteOrder16Little = 4096.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'bitmapInfoConstants' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         byteOrder32Big = 16384.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'bitmapInfoConstants' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         byteOrder32Little = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'bitmapInfoConstants' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         byteOrderDefault = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'bitmapInfoConstants' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         byteOrderMask = 28672.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> 'bitmapInfoConstants' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         floatComponents = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         createDirectFromUI2Image: im = ( |
             bits.
             bytesPerPixel = 4.
             colorSpace.
             dataProvider.
             r.
            | 
            colorSpace: quartz colorSpace createGenericRGB.
            bits: byteVector copySize: bytesPerPixel * im pixelData size.

            im pixelData size do: [|:i. j. c|
              c: im colors at: im pixelData at: i.
              j: i * bytesPerPixel.
              bits at: j + 0 Put: c   redForQuartz.
              bits at: j + 1 Put: c greenForQuartz.
              bits at: j + 2 Put: c  blueForQuartz.
              bits at: j + 3 Put: 
                im masked && [(im pixelData at: i) = im transparentPixelValue]
                  ifTrue: 0 False: 255.
            ].
            dataProvider: quartz dataProvider createForBytes: bits.

            r: createWidth: im width
                 Height: im height
            BitsPerComponent: 8
            BitsPerPixel: 32
            BytesPerRow: im width * bytesPerPixel
            ColorSpace: colorSpace
            BitmapInfo: bitmapInfoConstants byteOrder32Big || alphaInfoConstants last
            DataProvider: dataProvider
            ShouldInterpolate: true 
            ColorRenderingIntent: colorSpace colorRenderingIntent default.

            colorSpace release.
            dataProvider release.

            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         createFromPNGBytes: bytes = ( |
             dataProvider.
             r.
            | 
            dataProvider: quartz dataProvider createForBytes: bytes.
            r: createWithPNGDataProvider: dataProvider
               ShouldInterpolate: true
               ColorRenderingIntent: quartz colorSpace colorRenderingIntent default.
            dataProvider release.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         createFromPNGFile: fileName = ( |
            | 
            createFromPNGBytes: fileName asFileContents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         createFromUI2Image: im = ( |
            | 
            "For debugging, can use direct"
            [createDirectFromUI2Image: im].
            createIndexedFromUI2Image: im).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         createIndexedFromUI2Image: im = ( |
             bits.
             colorSpace.
             dataProvider.
             r.
             rr.
             t.
            | 
            colorSpace: quartz colorSpace createForIndexedImage: im.
            bits: im pixelData.

            dataProvider: quartz dataProvider createForBytes: bits.

            r:       createWidth: im width
                          Height: im height
                BitsPerComponent: 8
                    BitsPerPixel: 8
                     BytesPerRow: im width
                      ColorSpace: colorSpace
                      BitmapInfo: bitmapInfoConstants  byteOrder32Big
                    DataProvider: dataProvider
               ShouldInterpolate: true 
            ColorRenderingIntent: colorSpace colorRenderingIntent default.

            colorSpace release.
            dataProvider release.

            im masked ifFalse: [^ r].

            t: im transparentPixelValue.
            rr: r createWithMaskingColors_MinC1: t MaxC1: t
             MinC2: 255 MaxC2: 255
             MinC3: 255 MaxC3: 255
             MinC4:   1 MaxC4:   0.
            r release.
            rr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'image' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'imageSource' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'Comment: index-preserving bitblt between indexed offscreens -- the engine for ui1s double-buffer flush (graphic->offScreen->window-shadow) and for scrolling. destImage is another indexedPixmap or, when copying to the screen via windowBitmap, the platformWindow (whose indexedContext is its shadow). The CopyIndexedArea_wrap prim copies the raw palette-index bytes, so no colour conversion happens here; index->trueColour is deferred to the shadow->window blit. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         copyArea: srcRect To: destImage At: destPt GC: gc = ( |
             dc.
            | 
            "ui1/X share ONE display gc, so plane_mask/function are GLOBAL (quartz
             gcPlaneMask/gcRasterFn) -- they may be set via a context other than the
             one this copy runs through (e.g. copy:Mask: sets gxAnd via the source
             image gc; windowBitmap planeMask: via the window). Read the shared state,
             not any per-context slot. -- claude & dmu 5/27"
            dc: destImage indexedContext.
            ((quartz gcPlaneMask = 255) && [quartz gcRasterFn = 3])
              ifTrue: [
                context copyIndexedAreaTo: dc
                                     SrcX: srcRect left
                                     SrcY: srcRect top
                                    Width: srcRect width
                                   Height: srcRect height
                                    DestX: destPt x
                                    DestY: destPt y ]
              False: [
                context copyIndexedMaskedAreaTo: dc
                                           SrcX: srcRect left
                                           SrcY: srcRect top
                                          Width: srcRect width
                                         Height: srcRect height
                                          DestX: destPt x
                                          DestY: destPt y
                                           Mask: quartz gcPlaneMask
                                       Function: quartz gcRasterFn ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'Comment: build an 8-bit indexed offscreen of the given size. The source drawable and depth are accepted for protocol compatibility with the X path; the offscreen is always 8-bit grayscale (the only indexed depth ui1 uses; a 32-bit display buffer is a separate concern handled at blit time). -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         createForSameScreenAs: db Size: sz Depth: dp = ( |
            | 
            copy initOffscreenSize: sz).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | context release. scratch isNil ifFalse: [ scratch release ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         depth = ( |
            | 8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'Comment: plane-masked line. Thin axis-aligned lines use the inherited drawLine:To:GC: (its fillRectIntegerX path already honours the plane mask AND keeps the crisp 1px bevel); diagonal/thick lines stroke a CG path that ignores the mask, so route those through withMaskedGC:Do: -- arrow shafts (line:To:Width:) and XOR rubber-banding. -- claude & dmu 5/2026\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLine: pt1 To: pt2 GC: gc = ( |
            | 
            ((gc lineWidthValue <= 1) && [(pt1 x = pt2 x) || [pt1 y = pt2 y]]) ifTrue: [
              ^ resend.drawLine: pt1 To: pt2 GC: gc ].
            withMaskedGC: gc Do: [| :c |
              c beginPath.
              c moveToPointX: pt1 x succ Y: pt1 y succ.
              c addLineToPointX: pt2 x succ Y: pt2 y succ.
              c strokePath]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'Comment: plane-masked polyline. CG strokePath ignores the plane mask + raster function, so route through withMaskedGC:Do: -- needed for arrow polylines/control-points and XOR rubber-banding under a plane/arrow mask. Fast path (mask 255 / copy) strokes straight into our context (unchanged from the inherited drawable). -- claude & dmu 5/2026\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLines: ptlist GC: gc = ( |
            | withMaskedGC: gc Do: [| :c | c drawLines: ptlist]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'Comment: plane-masked polygon fill. ui1s motion blur (and other acetate shapes) fill polygons under a plane mask; CG path fills ignore the mask, so route through withMaskedGC:Do: -- otherwise the swept polygon clobbers the whole byte every frame (a permanent body-colour trail). -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygonIntegerXs: xs Ys: ys GC: gc = ( |
            | withMaskedGC: gc Do: [| :c | c fillPolygonIntegerXs: xs Ys: ys]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'Comment: ui1 draws through this objects own context, which answers the X11-GC protocol. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         gc = ( |
            | context).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'Comment: the CGContext that holds this drawables index bytes (the bitblt destination). -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         indexedContext = ( |
            | context).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         initOffscreenSize: sz = ( |
            | 
            width:  sz x.
            height: sz y.
            context: (quartz context makeIndexedOffscreenWidth: sz x Height: sz y).
            "The offscreen is a bottom-up CGBitmapContext; the display blit (blitIndexedTo: into the flipped window) flips the whole buffer vertically, which lands fills/lines at the right top-down spot but would render glyphs upside down. Pre-invert the text matrix (D:-1) so glyphs are drawn mirrored here and come out upright after that flip -- the indexed-offscreen analogue of what setCTMForZeroAtTopHeight: does for the true-colour window gc. Persists across font changes (like the ui2 path). -- claude & dmu 5/26"
            context setTextMatrix_A: 1 B: 0 C: 0 D: -1 TX: 0 TY: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'Comment: lazily build the same-size scratch context for plane-masked CG shape draws (preset like the real offscreen: AA off via the prim, text matrix inverted for upright glyphs). -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         maskedScratch = ( |
            | 
            scratch isNil ifTrue: [
              scratch: quartz context makeIndexedOffscreenWidth: width Height: height.
              scratch setTextMatrix_A: 1 B: 0 C: 0 D: -1 TX: 0 TY: 0.
            ].
            scratch).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         pixelValueAt: pt = ( |
            | context indexedPixelAtX: pt x Y: pt y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         presentToWindow: pw = ( |
            | 
            pw currentCLUT isNil ifFalse: [ pw blitShadowWithCLUT: pw currentCLUT ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | width @ height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'indexedPixmap' -> () From: ( | {
         'Comment: run a CG shape draw under the gcs plane mask + raster function. CG cannot plane-mask its own path fills, so when the gc is non-default we preload the scratch with our bytes, let drawBlock draw the shape into it (foreground gray preset from the gcs indexFG), then merge scratch -> self through the mask -- untouched scratch pixels equal our bytes so the merge is a no-op there. The all-ones/copy case draws straight into our context (the fast path). drawBlock takes the context to draw into. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         withMaskedGC: gc Do: drawBlock = ( |
             g.
             sc.
            | 
            ((quartz gcPlaneMask = 255) && [quartz gcRasterFn = 3]) ifTrue: [
              drawBlock value: context.
              ^ self ].
            g: gc indexFG asFloat / 255.0.
            sc: maskedScratch.
            context copyIndexedAreaTo: sc SrcX: 0 SrcY: 0 Width: width Height: height DestX: 0 DestY: 0.
            sc setGrayFillColorGray:   g Alpha: 1.0.
            sc setGrayStrokeColorGray: g Alpha: 1.0.
            drawBlock value: sc.
            sc copyIndexedMaskedAreaTo: context
                                  SrcX: 0 SrcY: 0
                                 Width: width Height: height
                                 DestX: 0 DestY: 0
                                  Mask: quartz gcPlaneMask
                              Function: quartz gcRasterFn.
            self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'layer' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | releaseIfFail: []. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'layer' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         createWithContext: c Size: p = ( |
            | 
            createWithContext: c Size: p IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'layer' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         createWithContext: c Size: p IfFail: fb = ( |
            | 
            (createWithContext: c Width: p x Height: p y IfFail: [|:e| ^ fb value: e]
            ) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'layer' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            gc: getGC.
            gc setCTMForZeroAtTopHeight: height.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'layer' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         pattern = bootstrap stub -> 'globals' -> 'quartz' -> 'pattern' -> 'parent' -> ().
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Comment: blit the indexed shadow to the true-colour window through the given CLUT (256*3 bytes). Used by the display/flush. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         blitShadowWithCLUT: clut = ( |
            | shadow gc blitIndexedTo: quartzWindow gc CLUT: clut X: 0 Y: 0. self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         catchEvents = ( |
            | 
            quartz event catchEventsForPlatformWindow: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            quartzWindow close.
            basicCloseIfFail: [].
            self).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         copyArea: srcRect To: destImage At: destPt GC: g = ( |
            | shadow copyArea: srcRect To: destImage At: destPt GC: g. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Comment: ui1 asks the platform window for its bit depth (macWindow isColor8 = platformWindow depth = 8). Report 8 so ui1 takes its indexed-colour path (plain ui1 uiWorld, drawing into 8-bit indexed offscreens). The window is really true colour; the 8->trueColour conversion happens at the offscreen->window flush (blitIndexedTo:). -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         depth = ( |
            | 8).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         display = ( |
            | quartzWindow).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Comment: convert the indexed shadow to the true-colour window through the currently-installed colormap. No-op until a colormap is installed (currentCLUT nil). -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         displayShadow = ( |
            | 
            shadow ifNotNil: [| :s | s presentToWindow: self ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawArcWithin: r From: sa Spanning: spa GC: g = ( |
            | shadow drawArcWithin: r From: sa Spanning: spa GC: g. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawArcWithin: r From: sa Spanning: spa Width: w GC: g = ( |
            | shadow drawArcWithin: r From: sa Spanning: spa Width: w GC: g. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Comment: ui1 draws the ui1 caret and other direct-to-window graphics through the drawable protocol; forward them to the 8-bit shadow (which is a quartz drawable). The gc passed in is already the shadow gc (see gc above). -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLine: a To: b GC: g = ( |
            | shadow drawLine: a To: b GC: g. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLines: ptlist GC: g = ( |
            | shadow drawLines: ptlist GC: g. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawPoint: pt GC: g = ( |
            | shadow drawPoint: pt GC: g. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawPolygonIntegerXs: xs Ys: ys GC: g = ( |
            | shadow drawPolygonIntegerXs: xs Ys: ys GC: g. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawRectangle: r GC: g = ( |
            | shadow drawRectangle: r GC: g. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawString: str At: pt GC: g = ( |
            | shadow drawString: str At: pt GC: g. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Comment: Recreate the ui1 shadow (32-bit BGRA or 8-bit indexed) when the Cocoa window size has changed, then beginContext so ensureBitmapContext rebuilds the IOSurface. No-op for ui2 (shadow nil). -- dmu 8/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         ensureShadowSize = ( |
            | 
            shadow ifNil: [^ self].
            (shadow size = size) ifTrue: [^ self].
            (shadow depth > 8)
                ifTrue: [makeRGBAShadow]
                 False: [shadow delete. makeShadow].
            quartzWindow grafPort initialize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillArcWithin: r From: sa Spanning: spa GC: g = ( |
            | shadow fillArcWithin: r From: sa Spanning: spa GC: g. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygon: ptlist GC: g = ( |
            | shadow fillPolygon: ptlist GC: g. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygonIntegerXs: xs Ys: ys GC: g = ( |
            | shadow fillPolygonIntegerXs: xs Ys: ys GC: g. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillRectangle: r GC: g = ( |
            | 
            shadow fillRectangle: r GC: g. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         flush = ( |
            | displayShadow. quartzWindow gc flush. self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Category: accessing quartz objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         gc = ( |
            | shadow isNil ifTrue: [quartzWindow gc] False: [shadow gc]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getAndInitWindow = ( |
             w.
            | 
            w: getQuartzWindow.
            w initialize.
            w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         globalToLocal: pt = ( |
            | 
            "Already window-local"
            pt - innerOriginOffsetFromBorder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Category: accessing quartz objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         grafPort = ( |
            | quartzWindow grafPort).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Comment: the indexed CGContext that receives bytes when this window is a copyArea destination (ui1 update copies the worlds offScreen here through windowBitmap). That is the shadow. On a window resize the shadow must track the new size first (ui1 resizes its graphic/offScreen and redraws, then update copies into here), else the blit cant cover the window. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         indexedContext = ( |
            | ensureShadowSize. shadow gc).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Category: window size & position based on outer frame pos & size\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         innerOriginOffsetFromBorder = ( |
            | 
            quartzWindow innerOriginOffsetFromBorder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         isOpen = ( |
            | raw_isOpenIfFail: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         localToGlobal: pt = ( |
            | 
            pt + (globalToLocal: 0@0) negate + position).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         openDisplay: displayName BoundingBox: bbox WindowName: wn = ( |
            | 
            openDisplay: displayName
                   Left: bbox left
                    Top: bbox top
                  Width: bbox width
                 Height: bbox height
               MinWidth: 16
               MaxWidth: -1
              MinHeight: 16
              MaxHeight: -1
             WindowName: wn
               IconName: wn
               FontName: 'times'
               FontSize: 10.
            quartzWindow: getAndInitWindow.
            catchEvents.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Category: window size & position based on outer frame pos & size\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         outerSize = ( |
            | 
            (width + insetLeft + insetRight)
            @
            (height + insetTop + insetBottom)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Category: window size & position based on outer frame pos & size\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         outerSize: pt = ( |
             b.
             pos.
             t.
            | 
            pos: position.
            setLeft: pos x
                Top: pos y
              Width: pt x 
             Height: pt y.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Comment: pixel read goes to the shadow. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         pixelValueAt: pt = ( |
            | shadow pixelValueAt: pt).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Category: window size & position based on outer frame pos & size\x7fComment: The outer position\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         position = ( |
            | 
            (left @ top) - (insetLeft @ insetTop)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Category: window size & position based on outer frame pos & size\x7fComment: Sets the outer position\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         position: pt = ( |
             s.
            | 
            s: outerSize.
            setLeft: pt x
                Top: pt y
              Width: s x
             Height: s y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         serverName = 'quartz'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Category: window size & position based on outer frame pos & size\x7fComment: Returns the inner size\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         size = ( |
            | 
            width @ height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Category: window size & position based on outer frame pos & size\x7fComment: Sets the inner size, oy!\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         size: pt = ( |
            | 
            outerSize: pt + 
              ( (insetLeft + insetRight) @ (insetTop + insetBottom) ).
            quartzWindow close. "just to do the endContext"
            quartzWindow: getAndInitWindow. 
            self).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Comment: ui1s screenOperations flush (ui1 uiWorld syncGraphics -> macWindow sync) and double-buffer flush (macWindow flush) both land here: convert the indexed shadow to the true-colour window and push it to the IOSurface so the next event-pump cycle blits it to the view. The X path mapped these to XSync/XFlush; here they are the indexed->trueColour display. -- claude & dmu 5/26\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         sync = ( |
            | displayShadow. quartzWindow gc flush. self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Comment: XXXX Added by EE 8/5/99
because traits worldMorph windowEvent
sends wc xWin ungrabPointer with a 
copy of this object as the xWin\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         ungrabPointer = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         warpPointerTo: pt = ( |
             gp.
            | 
            gp: localToGlobal: pt.
            warpPointerToX: gp x Y: gp y.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: getting bounds\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         boundsTypes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> 'boundsTypes' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz textLayout boundsTypes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> 'boundsTypes' -> () From: ( | {
         'Comment: width determined from halfway between two characters\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kATSUseCaretOrigins = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> 'boundsTypes' -> () From: ( | {
         'Comment: Use glyph origin in device space.
Usefull for adjusting text in screen\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kATSUseDeviceOrigins = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> 'boundsTypes' -> () From: ( | {
         'Comment: Use glyph origin in fractional absolute bounds.
Ideal for laid-out text or scaling on the screen.\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kATSUseFractionalOrigins = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         createForStyle: aQuartzTextStyle Bytes: aByteVector = ( |
            | 
            createForStyle: aQuartzTextStyle Bytes: aByteVector IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         createForStyle: aQuartzTextStyle Bytes: aByteVector IfFail: fb = ( |
            | 
            createForStyle: aQuartzTextStyle Bytes: aByteVector From: kATSUFromTextBeginning Size: kATSUToTextEnd IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: getting bounds\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getGlyphBounds = ( |
            | 
            getGlyphBoundsFrom: kATSUFromTextBeginning Size: kATSUToTextEnd).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: getting bounds\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getGlyphBoundsFrom: start Size: n = ( |
            | 
            getGlyphBoundsFrom: start Size: n IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: getting bounds\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getGlyphBoundsFrom: start Size: n IfFail: fb = ( |
            | 
            rectangleFromVector:
              raw_getGlyphBoundsAtX: 0 Y: 0
                  Start: start  Count: n
                  BoundsType: boundsTypes kATSUseFractionalOrigins
                  IfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: getting bounds\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getUnjustifiedBounds = ( |
            | 
            getUnjustifiedBoundsFrom: kATSUFromTextBeginning Size: kATSUToTextEnd).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: getting bounds\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getUnjustifiedBoundsFrom: start Size: n = ( |
            | 
            getUnjustifiedBoundsFrom: start Size: n IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: getting bounds\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getUnjustifiedBoundsFrom: start Size: n IfFail: fb = ( |
            | 
            rectangleFromVector:
              raw_getUnjustifiedBoundsStart: start
                                      Count: n
                                     IfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: getting bounds\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getUnjustifiedBoundsIfFail: fb = ( |
            | 
            getUnjustifiedBoundsFrom: kATSUFromTextBeginning Size: kATSUToTextEnd IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         kATSUFromTextBeginning = -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         kATSUToTextEnd = -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: getting bounds\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         measureTextImage = ( |
            | 
            measureTextImageFrom: kATSUFromTextBeginning Size: kATSUToTextEnd).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: getting bounds\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         measureTextImageFrom: start Size: n = ( |
            | 
            measureTextImageFrom: start Size: n IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: getting bounds\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         measureTextImageFrom: start Size: n IfFail: fb = ( |
            | 
            rectangleFromVector:
              raw_measureTextImageStart: start
                                  Count: n
                                 IfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textLayout' -> () From: ( | {
         'Category: getting bounds\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         rectangleFromVector: v = ( |
            | 
            ((v at: 0) @ (v at: 1)) # (( v at: 2) @ (v at: 3))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textStyle' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getGlyphBoundsFor: aByteVector FontID: fid Size: fsize = ( |
             tl.
             ts.
            | 
            ts: create.
            ts setFontID: fid Size: fsize.
            tl: quartz textLayout createForStyle: ts Bytes: aByteVector.
            [tl getGlyphBounds] onReturn: [tl dispose.  ts dispose]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textStyle' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getUnjustifiedBoundsFor: aByteVector FontID: fid Size: fsiz = ( |
             tl.
             ts.
            | 
            ts: create.
            ts setFontID: fid Size: fsiz.
            tl: quartz textLayout createForStyle: ts Bytes: aByteVector.
            [tl getUnjustifiedBounds] onReturn: [tl dispose.  ts dispose]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textStyle' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         measureTextImageFor: aByteVector FontID: fid Size: fsize = ( |
             tl.
             ts.
            | 
            ts: create.
            ts setFontID: fid Size: fsize.
            tl: quartz textLayout createForStyle: ts Bytes: aByteVector.
            [tl measureTextImage] onReturn: [tl dispose.  ts dispose]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'textStyle' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: layers\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         asLayerSize: aPoint = ( |
            | 
            quartz layer createWithContext: gc Size: aPoint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: opeining and closing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            wasClosedByVM ifFalse: [grafPort close].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: mapping newlines for Mac paste buffer\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fetchFromClipboard = ( |
            | 
            fetchFromClipboardIfFail: 
             [|:e| ^error: 'fetchFromClipboard failed: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: mapping newlines for Mac paste buffer\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fetchFromClipboardIfFail: fb = ( |
            | 
            mapFromMac: unmappedFetchFromClipboardIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         flush = ( |
            | 
            "may have been closed by VM if user hit red button"
            wasClosedByVM ifFalse: [
              worldMorph doubleBuffering ifTrue: [gc synchronize]
                                          False: [gc flush].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: accessing quartz objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         gc = ( |
            | grafPort gc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getRegion: r = ( |
            | getRegion: r IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getRegion: r IfFail: fb = ( |
             v.
            | 
            v: raw_getRegion: r IfFail: [|:e| ^ fb value: e].
            ((v at: 0) @ (v at: 1)) # ((v at: 2) @ (v at: 3))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getStructureWidths = ( |
            | getStructureWidthsIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         getStructureWidthsIfFail: fb = ( |
             v.
            | 
            v: raw_getStructureWidthsIfFail: [|:e| ^ fb value: e].
            ((v at: 0) @ (v at: 1)) ## ((v at: 2) @ (v at: 3))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | getPortBottom - getPortTop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: opeining and closing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            setPortWindowPort.
            grafPort: getPort.
            grafPort initialize.
            activate: true.
            show.
            setUserFocus.
            bringToFront.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         innerOriginOffsetFromBorder = ( |
             v.
            | 
            v: raw_getStructureWidthsIfFail: [^ 0@0].
            (v at: 0) @ (v at: 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: mapping newlines for Mac paste buffer\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         mapFromMac: str = ( |
            | 
            str asString copyMutable copyMappedBy: [|:c|
              c = '\r' ifTrue: '\n' False: c]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: mapping newlines for Mac paste buffer\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         mapToMac: str = ( |
            | 
            str copyMutable copyMappedBy: [|:c| 
              c = '\n' ifTrue: '\r' False: c
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: accessing quartz objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         name = ( |
            | 
            'quartz').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: accessing quartz objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         originalName = ( |
            | name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         partCodes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'partCodes' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz window partCodes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'partCodes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inCollapseBox = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'partCodes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inContent = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'partCodes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inDesk = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'partCodes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inDrag = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'partCodes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inGoAway = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'partCodes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inGrow = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'partCodes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inMenuBar = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'partCodes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inNoWindow = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'partCodes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inProxyIcon = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'partCodes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inStructure = 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'partCodes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inSysWindow = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'partCodes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inToolbarButton = 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'partCodes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inZoomIn = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'partCodes' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         inZoomOut = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         regions = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'regions' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz window regions.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'regions' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kWindowCloseBoxRgn = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'regions' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kWindowCollapseBoxRgn = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'regions' -> () From: ( | {
         'Comment: empy when collapsed\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kWindowContentRgn = 33.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'regions' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kWindowDragRgn = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'regions' -> () From: ( | {
         'Comment: Carbon forward - bounds of the window\xd5s port in global coordinates; not affected by CollapseWindow\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kWindowGlobalPortRgn = 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'regions' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kWindowGrowRgn = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'regions' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kWindowOpaqueRgn = 35.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'regions' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kWindowStructureRgn = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'regions' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kWindowTitleBarRgn = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'regions' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kWindowTitleProxyIconRgn = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'regions' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kWindowTitleTextRgn = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'regions' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kWindowToolbarButtonRgn = 41.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'regions' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kWindowUpdateRgn = 34.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> 'regions' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         kWindowZoomBoxRgn = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: accessing quartz objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         serverName = 'this Mac'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | width @ height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: mapping newlines for Mac paste buffer\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         storeToClipboard: t0 = ( |
            | 
            storeToClipboard: t0 IfFail: 
             [|:e| ^error: 'storeToClipboard: failed: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: mapping newlines for Mac paste buffer\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         storeToClipboard: t0 IfFail: fb = ( |
            | 
            unmappedStoreToClipboard: (mapToMac: t0) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: opeining and closing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         wasClosedByVM = ( |
            | 
            "happens because VM lets standard handler
             process window close event"
            getPortIfFail: [^ true].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'window' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
            | getPortRight - getPortLeft).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         quartzBufferCanvas = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartzBufferCanvas.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         bezier: pt1 Control: c1 Control: c2 To: pt2 Width: w Color: c = ( |
            | 
            quartzCanvasTraits.bezier: pt1 Control: c1 Control: c2 To: pt2 Width: w Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            layer ifNotNil: [layer close].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForWindowCanvas: wc Bounds: b = ( |
            | 
            copy initForSameScreenAs: wc Width: b width Height: b height Depth: drawable depth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawFromImage: aUI2Image = ( |
             h.
             quartzImage.
             w.
            | 

            quartzImage: quartz image createFromUI2Image: aUI2Image.
            w: aUI2Image width.
            h: aUI2Image height.
            initForSameScreenAs: winCanvas Width: w Height: h Depth: drawable depth.
            gc withIdentCTMDo: [ gc drawImage: quartzImage X: 0 Y: 0 Width: w Height: h ].
            [
             "debugging"
              winCanvas gc drawImage: quartzImage X: 20 Y: 30 Width: 100 Height: 100.  
              winCanvas gc withIdentCTMDo: [winCanvas gc drawLayer: layer X: 20 Y: 120].
            ].
            quartzImage release.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawMaskFromImage: x = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: accessing quartz objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         drawable = ( |
            | 
            layer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: accessing quartz objects\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         gc = ( |
            | 
            layer gc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: positioning and sizing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | layer height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         indexForColor: c = ( |
            | 
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         initForSameScreenAs: aWindowCanvas Width: w Height: h Depth: d = ( |
            | 
            winCanvas: aWindowCanvas.
            layer: winCanvas quartzWindow asLayerSize: w@h).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         isOpen = ( |
            | 
            layer ifNil: false IfNotNil: [|:w| w isLive]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         quartzCanvasTraits* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> 'quartzCanvasTraits' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartzBufferCanvas quartzCanvasTraits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> 'quartzCanvasTraits' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         bezier: pt1 Control: c1 Control: c2 To: pt2 Width: w Color: c = ( |
            | 
            setColor: c.
            drawable bezier: (transformPt: pt1)
                    Control: (transformPt: c1)
                    Control: (transformPt:  c2)
                         To: (transformPt: pt2)
                      Width: w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> 'quartzCanvasTraits' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         clip = ( |
            | 
            gc getClipRectangle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> 'quartzCanvasTraits' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         clip: r = ( |
            | 
            gc setClipRectangle: r.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> 'quartzCanvasTraits' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         testText = ( |
            | 
            "for debugging"
            text: 'asdf' At: 30@50 FontSpec: winCanvas fontMap fonts keys first Color: paint named: 'black').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> 'quartzCanvasTraits' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         translucentlyDo: blk = ( |
            | 
            drawable translucentlyDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> 'quartzCanvasTraits' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         withClip: newClip Do: blk = ( |
            | 
            "Execute the given block, doing all drawing with the
             given clipping rectangle. Nested clipping rectangles
             are composed by quartz which always intersects clips."

            drawable withClip: (transformRect: newClip) Do: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> 'quartzCanvasTraits' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         withMask: m Offset: o Do: blk = ( |
            | 
            "use Alpha, no masks"
            blk value.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: positioning and sizing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | 
            layer isNil || [layer isLive not]  ifTrue: [^ 0@0].
            layer size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         translucentlyDo: blk = ( |
            | 
            quartzCanvasTraits.translucentlyDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: positioning and sizing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
            | layer width).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         withClip: newClip Do: blk = ( |
            | 
            quartzCanvasTraits.withClip: newClip Do: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         withMask: m Offset: o Do: blk = ( |
            | 
            quartzCanvasTraits.withMask: m Offset: o Do: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Fonts\x7fModuleInfo: Module: quartz InitialContents: FollowSlot'
        
         quartzFontDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartzFontDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartzFontDictionary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzFontDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             new.
            | 
            new: clone.
            new fonts: fonts copy.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzFontDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
             new.
            | 
            new: clone.
            new fonts: fonts copyRemoveAll.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzFontDictionary' -> () From: ( | {
         'Category: lookups\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         idAndFontFor: fSpec WindowCanvas: wc = ( |
             r.
            | 
            r: fonts if: fSpec IsPresentDo: [|:v| v]
                              IfAbsentPut: [ quartz fontIDAndStruct 
                                                 copyForFontSpec: fSpec Port: wc grafPort ]
                                  AndDo: [|:v| v].
            "may be stale with dead port"
            r port isLive ifTrue: [^ r].
            wc grafPort isLive
              ifFalse: [error: 'need live port'].
            fonts removeKey: fSpec.
            idAndFontFor: fSpec WindowCanvas: wc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzFontDictionary' -> () From: ( | {
         'Category: lookups\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         idForFontSpec: fSpec WindowCanvas: wc = ( |
            | 
            "on mac, one struct does both"
            idAndFontFor: fSpec WindowCanvas: wc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzFontDictionary' -> () From: ( | {
         'ModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractFontDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzFontDictionary' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            fonts size printString, ' entries').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzFontDictionary' -> () From: ( | {
         'Category: lookups\x7fModuleInfo: Module: quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         structForFontSpec: fSpec WindowCanvas: wc = ( |
            | 
            "on mac, one struct does both"
            idAndFontFor: fSpec WindowCanvas: wc).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'qDrawable' From: 'graphics'
 bootstrap read: 'cgDirectDisplay' From: 'graphics'
 bootstrap read: 'quartz_wrappers' From: 'glue'
 bootstrap read: 'quartzForFF' From: 'graphics'



 '-- Side effects'

 globals modules quartz postFileIn
