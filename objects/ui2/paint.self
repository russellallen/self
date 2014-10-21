 'Sun-$Revision: 30.15 $'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fModuleInfo: Module: paint InitialContents: FollowSlot'
        
         equalsPaint: p = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Paint\x7fComment: Psuedo paintManager for true color systems.\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractUnmappedPaintManager = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractUnmappedPaintManager' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractUnmappedPaintManager.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUnmappedPaintManager' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: InitializeToExpression: (nil)'
        
         client.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUnmappedPaintManager' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: InitializeToExpression: (nil)'
        
         clientWin.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUnmappedPaintManager' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractUnmappedPaintManager' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractUnmappedPaintManager parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUnmappedPaintManager' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         areColorsMapped = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUnmappedPaintManager' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUnmappedPaintManager' -> 'parent' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         colorInUse: c = ( |
            | 
            "Called by the client during color entry reclamation
             to indicate that the given color is in current use."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUnmappedPaintManager' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForWindow: aWin Client: c = ( |
             new.
            | 
            new: copy.
            new client: c.
            new clientWin: aWin.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUnmappedPaintManager' -> 'parent' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         indexForColor: c = ( |
            | 
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUnmappedPaintManager' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot'
        
         paint = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'paint' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'paint' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules paint.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot'
        
         myComment <- 'Paint and colormap management.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            paint resetPaintRegistry.
            "Name some paint colors."

            "some achromatic colors"
            paintNames at:   'black'        Put: (paint copyRed: 0.0  Green: 0.0  Blue: 0.0).
            paintNames at:   'white'        Put: (paint copyRed: 1.0  Green: 1.0  Blue: 1.0).
            paintNames at:   'gray'         Put: (paint copyRed: 0.5  Green: 0.5  Blue: 0.5).
            paintNames at:   'lightGray'    Put: (paint copyRed: 0.87 Green: 0.87 Blue: 0.87).
            paintNames at:   'darkGray'     Put: (paint copyRed: 0.37 Green: 0.37 Blue: 0.37).
            paintNames at:   'offWhite'     Put: (paint named: 'gray') copyBrightness: 0.92.

            "primary and secondary colors"
            paintNames at:   'red'          Put: (paint copyRed: 1.0 Green: 0.0 Blue: 0.0).
            paintNames at:   'blue'         Put: (paint copyRed: 0.0 Green: 0.0 Blue: 1.0).
            paintNames at:   'green'        Put: (paint copyRed: 0.0 Green: 1.0 Blue: 0.0).
            paintNames at:   'yellow'       Put: (paint copyRed: 1.0 Green: 1.0 Blue: 0.0).
            paintNames at:   'magenta'      Put: (paint copyRed: 1.0 Green: 0.0 Blue: 1.0).
            paintNames at:   'cyan'         Put: (paint copyRed: 0.0 Green: 1.0 Blue: 1.0).

            "other named colors"
            paintNames at:   'leaf'         Put: (paint copyRed: 0.5 Green: 0.8 Blue: 0.3).
            paintNames at:   'forest'       Put: (paint copyRed: 0.3 Green: 0.8 Blue: 0.5).
            paintNames at:   'pumpkin'      Put: (paint copyRed: 0.8 Green: 0.5 Blue: 0.3).
            paintNames at:   'khaki'        Put: (paint copyRed: 0.7 Green: 0.6 Blue: 0.3).
            paintNames at:   'teal'         Put: (paint copyRed: 0.3 Green: 0.7 Blue: 0.6).
            paintNames at:   'azure'        Put: (paint copyRed: 0.3 Green: 0.6 Blue: 0.8).
            paintNames at:   'royal'        Put: (paint copyRed: 0.5 Green: 0.3 Blue: 0.8).
            paintNames at:   'purple'       Put: (paint copyRed: 0.7 Green: 0.3 Blue: 0.8).

            "some UI colors"
            paintNames at:   'outlinerGray' Put: (paint copyRed: 0.839687 Green: 0.839687  Blue: 0.839687).

            "a non-color"
            paintNames at:   'transparent' Put: (paint copyRed: 0 Green: 0  Blue: 0 Alpha: 0)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.15 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'specialPaintManager
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Paint\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         paint = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'paint' -> () From: ( |
             {} = 'Comment: About the representation of colors:

     Externally, the red, green, and blue components of a paint
     object are floats in the range [0.0..1.0]. Internally, they
     are represented as integers in the range [0..range asInteger]
     to allow fast hashing and equality tests.

     This representation could easily be replaced with one based
     on HSV. On a pseudo-color display, conversion to RGB need
     only be done when first allocating a colormap entry for the
     color. On a direct-color display, a dictionary would be used
     to map colors to RGB triples; the cost would be about the same
     as the current cost of mapping colors to color indices.

     For a general description of color representations for computer
     graphics, including the relationship between the RGB and HSV
     color models used here, see Chapter 17 of Foley and van Dam,
     Fundamentals of Interactive Computer Graphics, Addison-Wesley,
     1982.\x7fModuleInfo: Creator: globals paint.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         idHint <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         idRegistryVersion.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         intRange = 1023.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Paint\x7fModuleInfo: Module: paint InitialContents: FollowSlot'
        
         paint = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'paint' -> () From: ( |
             {} = 'Comment: A paint object is a display-depth independent color specification.
     Its red, green, and blue components specify the relative amounts of
     these colors in the range from 0.0 (none) to 1.0 (full strength). On
     a direct-color display, these values are passed on to the hardware.
     On an indexed-color display, the index for a paint object is looked
     up in a per-window hash table. Frequently used paints are typically
     specified by name (e.g., paint named: \'red\'). These names are stored
     in the paintNames dictionary.\x7fModuleInfo: Creator: traits paint.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'paint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         range = 1023.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: InitializeToExpression: (1.0)\x7fVisibility: private'
        
         rawAlpha <- 1.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         rawBlue <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         rawGreen <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         rawRed <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Paint\x7fComment: Handles color allocation
for mapped color systems.
\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         paintManager = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'paintManager' -> () From: ( |
             {} = 'Comment: Details:
             colorToIndex -- dictionary mapping paint objects to colormap indices
             idToIndex    -- vector mapping paint IDs to colormap indices
             entryStatus  -- vector mapping colormap indices to one of
                                free     -- entry is available
                                used     -- entry is in use by UI2
                                reserved -- entry is used by another app
             client       -- the client using this paintManager
                             (the client must implement reportUsedColorsTo:)
             xColormap    -- X colormap proxy\x7fModuleInfo: Creator: globals paintManager.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paintManager' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         client <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'paintManager' -> 'client' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals paintManager client.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paintManager' -> 'client' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         reportUsedColorsTo: paintMgr = ( |
            | 
            "A paintManager client must respond to this message.
             It is used to reclaim unused colormap entries."

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paintManager' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         clientXWin <- bootstrap stub -> 'globals' -> 'xlib' -> 'window' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paintManager' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: private'
        
         colorCollector <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paintManager' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         colorToIndex <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paintManager' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         entryStatus <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paintManager' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         idToIndex <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Paint\x7fModuleInfo: Module: paint InitialContents: FollowSlot'
        
         paintManager = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( |
             {} = 'Comment: A paintManager manages the allocation of color indices on a
     pseudo-color display. This allows clients to use arbitrary colors,
     as long as they do not use more colors than than the number of color
     indices supported by the hardware at any given moment. Colors can be
     used and then forgotten; for example, a sequence of finely graduated
     shades of a color could be used during a fade-in. The colormap entries
     for such transient colors will be recycled on demand. The paintManager
     tries to respect the colormap entries used by other applications to
     avoid colormap flashing when moving the mouse between windows, but
     the current policy is to reuse these colormap entries as a desperate
     last resort.\x7fModuleInfo: Creator: traits paintManager.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paintManager' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'paintManager' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paintManager' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         policy <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'paintManager' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         xColormap.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Paint\x7fModuleInfo: Module: paint InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: public'
        
         paintNames = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | x equalsPaint: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing alpha (for Quartz)\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         alpha = ( |
            | 
            rawAlpha).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: weird color transformations\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         asDisneyOutlineColor = ( |
             backIsDark.
            | 

            "like Disney animation, soften that black
              just a bit - dmu "

            backIsDark: grayLevel < virtualGrayBrightness.

               copyHue:    hue
            Saturation:  ( backIsDark ifTrue: 0.05  False: saturation < 0.1 ifTrue: 0 False: 1 )
            Brightness:  ( backIsDark ifTrue: 0.96  False: [ brightness - 0.7 ]  )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: weird color transformations\x7fComment: The inverse of asSubduedColorForBackground:.
-- Ungar, 2/1/95\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         asEnhancedColorForBackground: backColor = ( |
            | 
            interpolate: (-1 / ( 1 - subduedFactor)) From: backColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: weird color transformations\x7fComment: Answer a color that is subdued from the receiver
towards the background color.
-- Ungar, 2/1/95\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         asSubduedColorForBackground: backColor = ( |
            | 
            interpolate: subduedFactor From: backColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         blue = ( |
            | rawBlue asFloat / range).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fCategory: X (direct-mapped)\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         blueForX = ( |
            | rawBlue << 6).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing HSV\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         brightness = ( |
            | 
            "Return the brightness of this paint color, a value between
             0.0 and 1.0."

            (rawRed max: rawGreen max: rawBlue) asFloat / range).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: registration\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         computeID = ( |
            | 
            idHint:
                (paintRegistry at: self IfAbsent: [| newID |
                    newID: nextPaintID.
                    paintRegistry at: self Put: newID.
                    newID]).
            idRegistryVersion: paintRegistryVersion.
            idHint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             new.
            | 
            new: resend.copy.
            new idHint: -1.
            new idRegistryVersion: nil.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing alpha (for Quartz)\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAlpha: a = ( |
            | copy rawAlpha: a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyBlue: b = ( |
            | 
            copy rawBlue: (((range * b) min: range) max: 0.0) asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing HSV\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyBrighterBy: d = ( |
            | copyBrightness: brightness + d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing HSV\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyBrightness: v = ( |
            | 
            copyHue: hue Saturation: saturation Brightness: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing HSV\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDarkerBy: d = ( |
            | copyBrightness: brightness - d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyGreen: g = ( |
            | 
            copy rawGreen: (((range * g) min: range) max: 0.0) asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: quantization\x7fComment: This version tries to avoid hue shifts by quantizing
in HSV space. It works better for our menus. -- dmu 3/95\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHSVQuantized = ( |
             bLevels = 6.
             hLevels = 8.
             sLevels = 5.
            | 
            "Note: levels must multiply to < 256 since the point of quantizing is to use fewer than 256 colors."

            " hue: ranges from 0 to 360; quantize linearly
              brightness: high end of scale is more sentive so use square/squareRoot trick
              saturation: low end is more important so use trick on (1 - saturation)"

            copyHue:        360.0 * ( (( hue /= 360.0     )        * hLevels pred ) round /= hLevels pred )
                Saturation:   1.0 - ( (( 1.0 - saturation ) square * sLevels pred ) round /= sLevels pred ) squareRoot
                Brightness:   0.0 + ( ((   0 + brightness ) square * bLevels pred ) round /= bLevels pred ) squareRoot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing HSV\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHue: h = ( |
            | 
            copyHue: h Saturation: saturation Brightness: brightness).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing HSV\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHue: hue Saturation: saturation Brightness: brightness = ( |
             f.
             h.
             i.
             p.
             q.
             s.
             t.
             v.
            | 
            s: (saturation asFloat max: 0.0) min: 1.0.
            v: (brightness asFloat max: 0.0) min: 1.0.
            0.0 = s ifTrue: [ ^copyRed: v Green: v Blue: v ].

            h: (hue % 360) asFloat / 60.0.
            (0.0 > h) ifTrue: [ h: 6.0 + h ].
            f: h - h truncate.              "fractional part of hue"
            p: (1.0 - s) * v.
            q: (1.0 - (s * f)) * v.
            t: (1.0 - (s * (1.0 - f))) * v.

            i: h truncate asInteger.        "integer part of hue"
            0 = i ifTrue: [ ^copyRed: v Green: t Blue: p].
            1 = i ifTrue: [ ^copyRed: q Green: v Blue: p].
            2 = i ifTrue: [ ^copyRed: p Green: v Blue: t].
            3 = i ifTrue: [ ^copyRed: p Green: q Blue: v].
            4 = i ifTrue: [ ^copyRed: t Green: p Blue: v].
            5 = i ifTrue: [ ^copyRed: v Green: p Blue: q].
            error: 'implementation error in paint').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: quantization\x7fComment: Return a quantized approximation of the receiver.\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyQuantized = ( |
            | 
            copyHSVQuantized).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: quantization\x7fComment: This version gave the best results on six web pages containing
lots of images. It quantizes in RGB space.\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRGBQuantized = ( |
             b.
             g.
             r.
            | 
            "Quantize R, G, and B independently to one of six levels, for a total
             of 6 x 6 x 6 = 216 possible colors. Use quadradically spaced steps to
             approximate the exponential response curve of the human eye. (Thanks
             to Dave Ungar for this trick). Note: I tried a number of linear and
             non-linear quantization functions in both RGB and HSV space; this
             one worked best over a sampling of pictures taken from WWW pages."

            copyRed: ((5.0 * red   square) round / 5.0) squareRoot
              Green: ((5.0 * green square) round / 5.0) squareRoot
               Blue: ((5.0 * blue  square) round / 5.0) squareRoot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRandom = ( |
            | 
            "Return a random color from the set of quantized colors. This avoids
             overloading the paint registry with too many colors, which would
             force slow paint registry resets."

            copyRed: ((5.0 * random float square) round / 5.0) squareRoot
              Green: ((5.0 * random float square) round / 5.0) squareRoot
               Blue: ((5.0 * random float square) round / 5.0) squareRoot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRed: r = ( |
            | 
            copy rawRed: (((range * r) min: range) max: 0.0) asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRed: r Green: g Blue: b = ( |
             new.
            | 
            new: copy.
            new rawRed:   (((range * r) asInteger min: intRange) max: 0).
            new rawGreen: (((range * g) asInteger min: intRange) max: 0).
            new rawBlue:  (((range * b) asInteger min: intRange) max: 0).
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRed: r Green: g Blue: b Alpha: a = ( |
            | 
            (copyRed: r Green: g Blue: b) rawAlpha: a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing HSV\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copySaturation: s = ( |
             newS.
            | 
            newS: ((0 = saturation) ifTrue: 0 False: s).
            copyHue: hue Saturation: newS Brightness: brightness).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: paint InitialContents: FollowSlot'
        
         equalsPaint: c = ( |
            | 
            == c ifTrue: [ ^true ].  "optimization"
             (rawRed   = c   rawRed) &&
            [(rawBlue  = c  rawBlue) &&
            [(rawGreen = c rawGreen)]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: namingAndPrinting\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         fullPrintString = ( |
            | 
            '(paint copyRed: ',  red printString,
                   ' Green: ', green printString,
                   ' Blue: ',   blue printString,
                   ') [' , name, ']').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: grayScale\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         grayLevel = ( |
            | 
            "Returns the gray-scale equivalent for this color according
             to the YIQ color model, which corrects for the fact that the
             sensitivity of the human eye varies across the spectrum. This
             This is the correct gray brightness level to use when displaying
             this color on a gray-scale display. See Foley and van Dam,
             Fundamentals of Interactive Computer Graphics, pg. 613 for
             additional details about the YIQ color model."

            (0.30 * red) + (0.59 * green) + (0.11 * blue)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         green = ( |
            | rawGreen asFloat / range).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fCategory: X (direct-mapped)\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         greenForX = ( |
            | 
            rawGreen << 6).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
            rawRed + rawGreen + rawBlue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing HSV\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         hue = ( |
             h.
             max.
             min.
             span.
            | 
            "Return the hue of this paint color, an angle between
             0 and 360 degrees."

            max: (rawRed max: rawGreen max: rawBlue).
            min: (rawRed min: rawGreen min: rawBlue).
            span: (max - min) asFloat.
            0.0 = span ifTrue: [ ^0.0 ].

            h: hueForMax: max Span: span.
            0.0 > h ifTrue: [ h: 6.0 + h ].
            60.0 * h).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing HSV\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         hueForMax: max Span: span = ( |
            | 
            "Private method used in hue computation, a value between
             0.0 and 1.0."

            rawRed   = max ifTrue: [^((rawGreen - rawBlue) asFloat / span)].
            rawGreen = max ifTrue: [^2.0 + ((rawBlue - rawRed) asFloat / span)].
            rawBlue  = max ifTrue: [^4.0 + ((rawRed - rawGreen) asFloat / span)].
            error: 'Implementation error in paint hue computation').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: registration\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         id = ( |
            | 
            "Return a small integer that is unique for this color. This id
             can be used by canvases to accelerate the mapping from paint
             objects to color indices."
            "Details: A global dictionary is used to map paint colors to id's.
             A paint object caches the unique id for its color to avoid doing a
             dictionary lookup every time the id is needed. The paint registry
             dictionary can be reset at any time to compact the id space for
             the colors actually in use. (The space can become fragmented since
             colors may be only used for a short while). When the color registry
             is reset, its version is updated, allowing paint objects to detect
             that their cached id is out-of-date. The motivation for this rather
             baroque mechanism is to save canvases from having to dictionary lookups
             of paint objects on every call to a graphical primitive. Instead,
             canvases can use the paint's unique id as an index into a vector of
             color indices. This saves 20-25% of the redraw time for a large outliner."

            idRegistryVersion = paintRegistryVersion ifFalse: [ computeID ].
            idHint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: interpolating\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         interpolate: p From: c = ( |
            | 
            "Use RGB interpolation; it typically does the right thing where
             HSV interpolation can lead to surprises."

            copyRed:   (   red interpolate: p From: c red   )
                Green: ( green interpolate: p From: c green )
                 Blue: (  blue interpolate: p From: c blue  )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: namingAndPrinting\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         isImmutableForFilingOut = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: namingAndPrinting\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
             distToNearest <-  1e100 "infinity".
             nearest <- ''.
             threshold = 0.07.
            | 

            paintNames isEmpty ifTrue: [ ^'an unknown color' ].
            paintNames do: [| :paint. :name. thisD |
                thisD:
                    (paint alpha - alpha) square +
                    (paint red   -   red) square +
                    (paint green - green) square +
                    (paint blue  -  blue) square.
                0.0 = thisD ifTrue: [ ^name ].
                thisD < distToNearest ifTrue: [
                    nearest: name.
                    distToNearest: thisD.
                ]
            ].
            (distToNearest < threshold)
                ifTrue: [ nearest, '-ish']
                 False: [ 'kind of ', nearest, '-ish' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: namingAndPrinting\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         named: cName = ( |
            | 
            paintNames at: cName IfAbsent: [error: 'unknown paint name']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: registration\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         nextPaintID = ( |
             r.
            | 
            paintRegistryNextID >= paintRegistryMaxID ifTrue: [ resetPaintRegistry ].
            r: paintRegistryNextID.
            paintRegistryNextID: paintRegistryNextID succ.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: weird color transformations\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         outlineColorForBackground = ( |
            | asDisneyOutlineColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: registration\x7fModuleInfo: Module: paint InitialContents: InitializeToExpression: (dictionary copyRemoveAll desiredMinCapacity: 3000)\x7fVisibility: private'
        
         paintRegistry <- dictionary copyRemoveAll desiredMinCapacity: 3000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: registration\x7fModuleInfo: Module: paint InitialContents: InitializeToExpression: (1000)\x7fVisibility: private'
        
         paintRegistryMaxID = 1000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: registration\x7fModuleInfo: Module: paint InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         paintRegistryNextID <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: registration\x7fModuleInfo: Module: paint InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         paintRegistryVersion <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: registration\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         paintRegistryVersionProto = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'paint' -> 'paintRegistryVersionProto' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits paint paintRegistryVersionProto.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> 'paintRegistryVersionProto' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing alpha (for Quartz)\x7fComment: for old paints\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         rawAlpha = 1.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         red = ( |
            | rawRed asFloat / range).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing RGB\x7fCategory: X (direct-mapped)\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         redForX = ( |
            | rawRed << 6).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: registration\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         resetPaintRegistry = ( |
            | 
            "Start a new version of the paint registry and start allocating paint ID's
             from zero. Used to compact the paint ID space."
            "Assume: this happens very rarely."

            paintRegistryVersion: paintRegistryVersionProto copy.
            paintRegistryNextID: 0.
            paintRegistry removeAll.
            (browse childrenOf: traits paintManager) do: [| :mirr |
                "notify all paintManger objects"

                "Hack! Due to use of functional addSlots, some children
                 of traits paintManager may be incomplete. Thus, we must
                 make sure the child includes the slot idToIndex."

                (mirr includesKey: 'idToIndex') ifTrue: [
                    mirr reflectee clearIDToIndexCache.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: accessing HSV\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         saturation = ( |
             max.
             min.
            | 
            "Return the saturation of this paint color, a value between
             0.0 and 1.0."

            max: (rawRed max: rawGreen max: rawBlue).
            min: (rawRed min: rawGreen min: rawBlue).
            0 = max
                ifTrue: 0
                 False: [ (max - min) asFloat / max asFloat ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: namingAndPrinting\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: namingAndPrinting\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            paintNames do: [| :paint. :name |
                "Use this color's name if it is in the dictionary."
                = paint ifTrue: [ ^'paint named: \'', name, '\'' ].
            ].
            'paint copyRed: ', (red   printString),
                   ' Green: ', (green printString),
                   '  Blue: ', (blue  printString)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: namingAndPrinting\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | paint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: weird color transformations\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         subduedFactor = 0.75.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: weird color transformations\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         textColorForBackground = ( |
            | asDisneyOutlineColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paint' -> () From: ( | {
         'Category: weird color transformations\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         virtualGrayBrightness = 0.67.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: colormap support\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         allocateEntries: count IfNone: noneBlock = ( |
             allocated <- 0.
             disp.
             okay.
             pixelVec.
            | 

            "Allocate a batch of colormap entries in the shared colormap.
             If no entries are available, invoke the given block. Return
             the number of entries actually allocated."

            "ensure we are using the shared colormap"
            policy = usingSharedColormap ifFalse: [ error: 'implementation error in paintManager' ].

            "first, try to get all the entries in one call"
            disp: clientXWin display.
            pixelVec: vector copySize: count.
            okay: true.
            disp xAllocColorCellsInColormap: xColormap
                                     Contig: false
                           PlaneMasksReturn: vector
                               PixelsReturn: pixelVec
                                     IfFail: [ okay: false ].
            okay ifTrue: [
                "got the entire batch"
                pixelVec do: [| :newIndex | entryStatus at: newIndex Put: 'free' ].
                ^count.
            ].

            "must be fewer than count entries available; allocate one at a time"
            pixelVec: vector copySize: 1.
            count do: [
                okay: true.
                disp xAllocColorCellsInColormap: xColormap
                                         Contig: false
                               PlaneMasksReturn: vector
                                   PixelsReturn: pixelVec
                                         IfFail: [ okay: false ].
                okay ifTrue: [
                    pixelVec do: [| :newIndex | entryStatus at: newIndex Put: 'free' ].
                    allocated: allocated + 1.
                ] False: [
                    allocated > 0 ifTrue: [ ^allocated ] False: [ ^noneBlock value ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         allocateIndex = ( |
            | 
            "Allocate an entry to be used for a new color. Try to find one that is
             not currently in use. If that fails, try to reclaim and/or make some entries.
             If even that fails, the client must want more than 256 colors; start
             quantizing colors. Return the index of the allocated entry."

            "Scan for a free colormap entry."
            entryStatus reverseDo: [| :status. :i |
                'free' = status ifTrue: [ ^i ].
            ].

            "Try to make some free color entries and try again."
            makeFreeColorEntries.
            entryStatus reverseDo: [| :status. :i |
                'free' = status ifTrue: [ ^i ].
            ].

            "Client wants more than 256 colors; switch to quantizing scheme and try again."
            startQuantizingColors.
            entryStatus reverseDo: [| :status. :i |
                'free' = status ifTrue: [ ^i ].
            ].

            "Too many colors! There is a bug if we reach here."
            error: 'Implementation error: could not allocate a colormap index').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         areColorsMapped = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         clearIDToIndexCache = ( |
            | 
            idToIndex size do: [| :i | idToIndex at: i Put: nil ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            clientXWin isLive  ifTrue:  [ xColormap delete].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: color reservations\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         collectReservationsFor: disp = ( |
             c.
             defaultCMap.
             n.
             namePrefix = 'X display: '.
             tempDisp.
            | 
            n: disp name copyWithoutPrefix: namePrefix.

            tempDisp: xlib display open: n.
            defaultCMap: tempDisp screen defaultColormapOfScreen.
            c: xlib xColor new allComponents.
            entryStatus: vector copySize: 256 FillingWith: 'reserved'.
            [| :exit |
                c   red: (random integer: 65535).
                c green: (random integer: 65535).
                c  blue: (random integer: 65535).
                0 = (tempDisp xAllocColorInColormap: defaultCMap Color: c)
                    ifTrue: [ exit value ]
                     False: [ entryStatus at: c pixel Put: 'free' ].
            ] loopExit.
            c delete.
            tempDisp close.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         colorInUse: c = ( |
             i.
             qc.
            | 
            "Called by the client during color entry reclamation
             to indicate that the given color is in current use."

            qc: (possiblyQuantized: c).
            i: colorToIndex at: qc IfAbsent: [
                colorCollector add: qc.
                ^self.
            ].
            entryStatus at: i Put: 'used'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         computeIndexForColor: c = ( |
             cIndex.
             qc.
            | 
            "Allocate an entry to be used for a new color and install the color
             at that colormap entry. Return the new index."

            qc: (possiblyQuantized: c).
            cIndex: colorToIndex at: qc IfAbsent: [| newI |
                "Color is not in colorToIndex dictionary; allocate a new color entry for it."
                newI: allocateIndex.
                 colorToIndex do: [| :i. :oldC |
                    "Remove the color currently using the given colormap entry."
                    newI = i ifTrue: [ colorToIndex removeKey: oldC IfAbsent: nil ].
                ].
                colorToIndex at: qc Put: newI.
                entryStatus at: newI Put: 'used'.
                storeColor: qc At: newI.
                newI.
            ].
            idToIndex at: c id Put: cIndex.
            cIndex).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForWindow: aWin Client: c = ( |
             new.
            | 

            aWin depth = 8  ifFalse: [
            ^ aWin unmappedPaintManager copyForWindow: aWin Client: c
            ].

            new: copy.
            new client: c.
            new clientXWin: aWin.
            new colorToIndex: colorToIndex copyRemoveAll.
            new entryStatus: vector copySize: 256 FillingWith: 'reserved'.
            new idToIndex:   vector copySize: paint paintRegistryMaxID.
            new policy: usingSharedColormap.
            new xColormap: aWin screen defaultColormapOfScreen.
            new xColormap window: aWin.
            new colorCollector: colorCollector copyRemoveAll.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: color reservations\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         copyReservedColorsFor: disp = ( |
             c.
             defaultCMap.
            | 
            "Copy the reserved colors into my private colormap."

            defaultCMap: disp screen defaultColormapOfScreen.
            c: xlib xColor new allComponents.
            entryStatus do: [| :status. :i. p |
                'reserved' = status ifTrue: [
                    c pixel: i.
                    disp xQueryColorInColormap: defaultCMap Color: c.
                    p: (paint
                            copyRed: c red   asFloat / 65535.0
                              Green: c green asFloat / 65535.0
                               Blue: c blue  asFloat / 65535.0).
                    i < 7 ifTrue: [
                        "Commented out because window system color names are confusing
                         and sometimes get filed out instead of the real color names"
                        " recordNameForWindowSystemColor: p Index: i. "
                    ].
                    storeColor: p At: i.
                ].
            ].
            c delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         flushOldPixmaps = ( |
             c.
             t.
             wc.
            | 
            "Throw away cached pixmaps that are not currently visible in order to
             recycle their colors."

            t: time current.
            wc: winCanvas.
            c: colorRecordingCanvas copyReset client: self.
            c offset: wc offset.
            c winCanvas: wc.
            client drawMorphs: (client hands, client rawMorphs)
                 Intersecting: wc boundingBoxInWorld
                           On: c
                       Offset: wc offset.
            wc releasePixmapsUnusedSince: t.  "release all cached pixmaps not currently visible"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         flushScreenColors = ( |
             wc.
            | 
            "Force the screen to be redrawn after a major colormap change, such
             as switching over to a private colormap. For internal use only!"

            wc: winCanvas.
            wc invalidateCachedPixmaps. "invalidate cached pixmaps; they use old colormap"
            wc redrawWindow: true. "redraw entire window"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         indexForColor: c = ( |
            | 
            "Optimization: try to use id to get color index from idToIndex cache."

            (idToIndex at: c id) ifNil: [ computeIndexForColor: c ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         makeFreeColorEntries = ( |
             desiredFree = 32.
             free <- 0.
             needed.
            | 
            "Make some free color entries, either by freeing some unused
             entries or by creating some new ones. Try hard to make at
             least one free entry."

            "Details: First, reclaim any colormap entries that are not
             currently in use. If this fails to produce a free entry,
             switch to a private colormap. Whether using the global
             colormap or a private one, try to create enough extra
             free entries to cover some number of future requests." 

            needed: reclaimUnusedColorEntries.
            entryStatus do: [| :status |
                'free' = status ifTrue: [ free: free + 1 ].
            ].
            (free >= (needed + desiredFree)) ifTrue: [ ^self ].

            "free any pixmaps not currently in use and try again"
            flushOldPixmaps.
            needed: reclaimUnusedColorEntries.
            entryStatus do: [| :status |
                'free' = status ifTrue: [ free: free + 1 ].
            ].
            (free >= (needed + desiredFree)) ifTrue: [ ^self ].

            policy = usingSharedColormap ifTrue: [
                "Using the shared colormap. Try to allocate some more entries."
                allocateEntries: (needed + desiredFree) IfNone: [
                    0 = free ifTrue: [
                        "If no more entries are available in the shared colormap, and
                         we have no free entries at all, switch to a private colormap."

                        ('\n',
                         'Warning: A ui2 window is now using a private colormap; flashing\n',
                         'may occur when moving the cursor between windows.') printLine.

                        switchToPrivateColorMap.
                        flushScreenColors.
                    ] False: [
                        "There is at least one entry free; keep using the global colormap."
                        ^self.
                    ].
                ].
            ].

            policy > usingSharedColormap ifTrue: [
                "Using a private colormap. Grab some reserved entries,
                 warning the user the first time this is done. Reserved
                 entries are grabbed in reverse order so that entries
                 used by the window system will be used last."

                policy < usingOtherAppsColors ifTrue: [
                    ('\n',
                     'Warning: A ui2 window is now using colormap entries currently in use\n',
                     'by other applications. Extreme flashing may occur when moving the\n',
                     'cursor between windows. Other windows may display false colors.\n') printLine.
                    policy: usingOtherAppsColors.
                ].

                entryStatus reverseDo: [| :status. :i |
                    'reserved' = status ifTrue: [
                        i < 7 ifTrue: [ ^self ].  "don't use entries used by the window system (0-6)"
                        entryStatus at: i Put: 'free'.
                        free: free + 1.
                        "stop if we have enough plus some extras"
                        (free >= (needed + desiredFree)) ifTrue: [ ^self ].
                    ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'ModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: color quantization\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         possiblyQuantized: c = ( |
            | 
            policy = quantizingColors ifTrue: [ c copyQuantized ] False: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: policy constants\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         quantizingColors = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         reclaimUnusedColorEntries = ( |
            | 
            "Garbage collect the colormap by clearing the used entries and asking
             the client to mark the ones that are really in use. Return the number
             of additional colors needed by the client."

            colorCollector removeAll.
            entryStatus mapBy: [| :status |
                'used' = status ifTrue: 'free' False: status.
            ].
            client reportUsedColorsTo: self.
            colorToIndex copy do: [| :i. :c |
                "remove newly freed colors from colorToIndex map"
                'free' = (entryStatus at: i) ifTrue: [ colorToIndex removeKey: c ].
            ].
            clearIDToIndexCache.

            "colorCollector holds the set of colors needed by the client
             but not already allocated (i.e., already in colorToIndex)"
            colorCollector size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: color reservations\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         recordNameForWindowSystemColor: p Index: i = ( |
            | 
            "The first seven colors are used by OpenWindows as follow:
                0: window background
                1: window text
                2: window decorations
                3: center of menu icon
                4: gray shadow
                5: gray highlight
                6: screen background (root window) color"

            0 = i ifTrue: [ paintNames at: 'windowBackground'  Put: p ].
            1 = i ifTrue: [ paintNames at: 'windowForeground'  Put: p ].
            2 = i ifTrue: [ paintNames at: 'windowDecoration1' Put: p ].
            3 = i ifTrue: [ paintNames at: 'windowDecoration2' Put: p ].
            4 = i ifTrue: [ paintNames at: 'windowShadow'      Put: p ].
            5 = i ifTrue: [ paintNames at: 'windowHilight'     Put: p ].
            6 = i ifTrue: [ paintNames at: 'windowRootScreen'  Put: p ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: color reservations\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         reserveColors = ( |
            | 
            "If this paintManager is using a private colormap, mark
             the entries in the private map that correspond to entries
             in the shared colormap that are currently in use by
             other applications. The color allocator will try to avoid
             using these 'reserved' colors. Initialize the private color
             map entries for the reserved entries with the current
             colors from the shared colormap. This will reduce color
             map flashing when moving the cursor between windows.
             UI2 objects may temporarily appear in false colors."

            policy > usingSharedColormap ifTrue: [| disp |
                disp: clientXWin display.
                clearIDToIndexCache.
                colorToIndex removeAll.
                collectReservationsFor: disp.
                copyReservedColorsFor:  disp.
                flushScreenColors.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: color quantization\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         showTrueColors = ( |
            | 
            "Return to normal (true) color allocation strategy after a period
             of high color demand has passed. This will NOT revert to using
             the shared colormap; for that you must close and reopen the ui2
             window (e.g., by writing a snapshot and restarting)."

            policy > usingSharedColormap ifTrue: [
                policy: usingPrivateColormap.
                reserveColors.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: color quantization\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: public'
        
         startQuantizingColors = ( |
            | 
            "Begin quantizing all colors displayed on my winCanvas."

            policy = usingSharedColormap ifTrue: [ switchToPrivateColorMap ].
            policy = quantizingColors ifFalse: [
                policy: quantizingColors.
                ('\n',
                  'Warning: A ui2 window is attempting to display too many colors at once.\n',
                  'Self will now quantize colors to approximate the actual colors. To return\n',
                  'to true colors when the demand for colors has dropped, evaluate:\n\n',
                  '    desktop showTrueColors\n') printLine.

                reserveColors.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: colormap support\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         storeColor: p At: i = ( |
             c.
            | 
            "Store the color of the given paint at index i in my private colormap."

            c: xlib xColor new allComponents.
            c pixel: i.
            c   red: (p   red * 65535.0) asInteger.
            c green: (p green * 65535.0) asInteger.
            c  blue: (p  blue * 65535.0) asInteger.
            xColormap storeOne: c.
            c delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: colormap support\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         switchToPrivateColorMap = ( |
             indicesToFree.
            | 
            "Switch from using the shared colormap to using a private one."

            "don't switch if we are not currently using the shared colormap"
            policy = usingSharedColormap ifFalse: [ ^self ].

            policy: usingPrivateColormap. "record the policy switch"

            "release all shared colormap entries in use"
            indicesToFree: list copyRemoveAll.
            entryStatus do: [| :status. :i |
                'reserved' = status ifFalse: [ indicesToFree add: i ].
            ].
            indicesToFree isEmpty ifFalse: [
                xColormap freeColors: indicesToFree asVector.
            ].

            "make the private colormap, reserve other applications' colors, and install it"
            xColormap: (xlib colormap createFor: clientXWin).
            reserveColors.
            xColormap installAndSync.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: policy constants\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         usingOtherAppsColors = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: policy constants\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         usingPrivateColormap = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: policy constants\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         usingSharedColormap = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'paintManager' -> () From: ( | {
         'Category: colormap entry allocation\x7fModuleInfo: Module: paint InitialContents: FollowSlot\x7fVisibility: private'
        
         winCanvas = ( |
            | 
            client winCanvases do: [| :wc |
                wc colorDict = self ifTrue: [ ^wc ].
            ].
            error: 'implementation error: bad client').
        } | ) 



 '-- Sub parts'

 bootstrap read: 'specialPaintManager' From: 'ui2'



 '-- Side effects'

 globals modules paint postFileIn
