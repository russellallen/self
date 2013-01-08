 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: Histogram\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         imageMorph = bootstrap define: bootstrap stub -> 'globals' -> 'imageMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'imageMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals imageMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: Histogram\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2Image = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui2Image' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui2Image.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'imageMorph' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         image <- bootstrap stub -> 'globals' -> 'ui2Image' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: Histogram\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         imageMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'imageMorph' -> () From: ( |
             {} = 'Comment: An imageMorph displays a ui2Image (i.e., a masked pixmap).\x7fModuleInfo: Creator: traits imageMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'imageMorph' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'imageMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot'
        
         pixmapMorphs = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pixmapMorphs' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pixmapMorphs' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pixmapMorphs.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pixmapMorphs' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pixmapMorphs' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pixmapMorphs' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot'
        
         myComment <- 'This module provide support for pixmaps and pixmap movies.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pixmapMorphs' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pixmapMorphs' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: Histogram\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         movieMorph = bootstrap define: bootstrap stub -> 'globals' -> 'movieMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'movieMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals movieMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'movieMorph' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         currentFrame <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'movieMorph' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         frameIncrement <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'movieMorph' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         frames <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'movieMorph' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         lastFrameTime <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'movieMorph' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         msecsPerFrame <- 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: Histogram\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         movieMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'movieMorph' -> () From: ( |
             {} = 'Comment: A movieMorph displays a sequence of ui2Images.\x7fModuleInfo: Creator: traits movieMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'movieMorph' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'movieMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Image' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         colorQuantizing <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Image' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         colors <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Image' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         contentsChangedFlag <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Image' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         height <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Image' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         masked <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: Histogram\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2Image = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( |
             {} = 'Comment: A ui2Image represents a potentially self-masking picture of
     up to 256 colors (255 colors if self-masking). The pixel values are
     stored in a byteVector, where the color of pixels with value v is
     at offset v in the colors vector. If the image is self-masking, the
     special pixel value, transparentPixelValue, indicates which pixels
	 are transparent (i.e., are not drawn).

     Note: Reading X bitmap and pixmap files requires xBitmapMaker.self
     and xPixmapMaker.self.\x7fModuleInfo: Creator: traits ui2Image.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Image' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'ui2Image' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Image' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         pixelData <- bootstrap stub -> 'globals' -> 'byteVector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Image' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: InitializeToExpression: (255)\x7fVisibility: public'
        
         transparentPixelValue <- 255.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Image' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         width <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'imageMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseContainsPt: p = ( |
             localP.
             pixelValue.
            | 
            (baseBounds includes: p) ifFalse: [ ^false ].
            image masked ifFalse: [ ^true ].

            "p falls within the bounds of a masked image;
             does it hit a non-transparent pixel?"
            localP: p - baseBounds origin.
            pixelValue:
                image pixelData
                          at: ((image width * localP y) + localP x)
                    IfAbsent: [ ^false ].
            pixelValue != image transparentPixelValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'imageMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            c image: image At: position.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'imageMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsChanged = ( |
            | 
            image contentsChangedFlag: true.
            setWidth: image width Height: image height.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'imageMorph' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyImage: i = ( |
            | copy setImage: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'imageMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'imageMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'imageMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'imageMorph' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'imageMorph' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         setImage: i = ( |
            | 
            image: i.
            contentsChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movieMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsChanged = ( |
            | 
            frames do: [| :frame | frame contentsChangedFlag: true ].
            updateDimensions.
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movieMorph' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFrames: imageList = ( |
             new.
            | 
            new: copy.
            new frames: imageList.
            new currentFrame: 0.
            new contentsChanged.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movieMorph' -> () From: ( | {
         'Category: playing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         framesPerSecond = ( |
            | 
            msecsPerFrame = 0 ifTrue: infinity False: [(1000 / msecsPerFrame) asInteger]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movieMorph' -> () From: ( | {
         'Category: playing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         framesPerSecond: fps = ( |
            | 
            msecsPerFrame: fps = 0 ifTrue: infinity False: [1000.0 /= fps]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movieMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         image = ( |
            | frames at: currentFrame).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movieMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'movieMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movieMorph' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'imageMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movieMorph' -> () From: ( | {
         'Category: examples\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         snowWhiteExample = ( |
            | 
            " Double-click after the left quote below and select Get It
              from the middle-button menu"
            " movieMorph snowWhiteExample "

            movieMorph copyFrames: snowWhiteFrames).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movieMorph' -> () From: ( | {
         'Category: examples\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         snowWhiteFrames = ( |
            | 
            "Read in twelve frames of a simple flipbook, assuming that given image
             files (in Sun rasterFile format) are in your current directory."

            (
            (ui2Image copyFromSunRasterFile: 'SW.50.1.ras') &
            (ui2Image copyFromSunRasterFile: 'SW.50.2.ras') &
            (ui2Image copyFromSunRasterFile: 'SW.50.3.ras') &
            (ui2Image copyFromSunRasterFile: 'SW.50.4.ras') &
            (ui2Image copyFromSunRasterFile: 'SW.50.5.ras') &
            (ui2Image copyFromSunRasterFile: 'SW.50.6.ras') &
            (ui2Image copyFromSunRasterFile: 'SW.50.7.ras') &
            (ui2Image copyFromSunRasterFile: 'SW.50.8.ras') &
            (ui2Image copyFromSunRasterFile: 'SW.50.9.ras') &
            (ui2Image copyFromSunRasterFile: 'SW.50.10.ras') &
            (ui2Image copyFromSunRasterFile: 'SW.50.11.ras') &
            (ui2Image copyFromSunRasterFile: 'SW.50.12.ras')
            ) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movieMorph' -> () From: ( | {
         'Category: playing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         startGettingStepped = ( |
            | 
            lastFrameTime: times real msec.
            resend.startGettingStepped.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movieMorph' -> () From: ( | {
         'Category: playing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
             deltaT.
            | 
            deltaT: times real msec - lastFrameTime.
            deltaT >= msecsPerFrame ifTrue: [
                currentFrame: (currentFrame + frameIncrement) % frames size.
                updateDimensions.
                changed.
                lastFrameTime: times real msec.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movieMorph' -> () From: ( | {
         'Category: playing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         updateDimensions = ( |
             bbnds.
             f.
            | 
            f: (frames at: currentFrame).
            bbnds: baseBounds.
            ((bbnds width  != f  width) ||
             [bbnds height != f height]) ifTrue: [
                setWidth: f width Height: f height.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: storing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         charForPixel: p = ( |
            | 
            masked && [p = transparentPixelValue] ifTrue: [ ^' ' ].
            p < 10 ifTrue: [ ^('0' asByte + p) asCharacter ].
            p < 36 ifTrue: [ ^('a' asByte + (p - 10)) asCharacter ].
            p < 62 ifTrue: [ ^('A' asByte + (p - 36)) asCharacter ].
            error: 'pixel value ', p printString, ' is too large (62 or more)').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: storing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         colorMapStoreString = ( |
             s.
            | 
            s: ' Colors: ('.
            colors size = 1 ifTrue: [
                s: s & 'vector copyAddLast: ' & colors first storeString & ')'.
            ] False: [
                "2 or more colors"
                s: s & '\n'.
                colors do: [| :c. :i |
                    s: s & '    (' & c storeString.
                    i < colors lastKey
                        ifTrue: [ s: s & ') &\n' ]
                         False: [ s: s & ')) asVector' ].
                ].
            ].
            s flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: privateConvertingToPixmaps\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         colorsFor: paintMgr = ( |
            | 
            "Return a (copied) vector of colors, possibly quantized."
            "Details: If the colorQuantizing flag is true, quantize
             the colors using a function suitable for images. If the
             paint manager is quantizing, do not do this image-specify
             quantizing to avoid double-quantizing artifacts."

            (colorQuantizing &&
             [paintMgr areColorsMapped &&
             [paintMgr policy != paintMgr quantizingColors] ]) ifTrue: [
                colors copy mapBy: [| :c | c copyRGBQuantized ].
            ] False: [
                colors copy.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creationSupport\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         convertColorString: cs = ( |
            | 
            "Convert a color string from an X pixmap file into a paint object."
            "Note: this method does not completely implement the spec, although
             it works for most common cases."

            "common named colors"
            cs = 'black' ifTrue: [ ^paint named: 'black' ].
            cs = 'white' ifTrue: [ ^paint named: 'white' ].
            ((cs = 'gray') || [cs = 'grey'])  ifTrue: [| grayLevel |
                grayLevel: 192.0 / 255.0.
                ^paint copyRed: grayLevel Green: grayLevel Blue: grayLevel.
            ].
            ((cs = 'dim gray') || [cs = 'dim grey']) ifTrue: [| grayLevel |
                grayLevel: 84.0 / 255.0.
                ^paint copyRed: grayLevel Green: grayLevel Blue: grayLevel.
            ].
            ((cs = 'light gray') || [cs = 'light grey']) ifTrue: [| grayLevel |
                grayLevel: 168.0 / 255.0.
                ^paint copyRed: grayLevel Green: grayLevel Blue: grayLevel.
            ].

            "read color of form grayDDD, where DDD is in decimal from 0 to 100"
            (('gray' isPrefixOf: cs) || ['grey' isPrefixOf: cs]) ifTrue: [| grayLevel |
                grayLevel: (cs copyFrom: 4 UpTo: cs size) asInteger asFloat / 100.0.
                ^paint copyRed: grayLevel Green: grayLevel Blue: grayLevel.
            ].

            "read color of form #RRGGBB, where components are in hex from 0 to 255"
            (cs first = '#') && [cs size = 7] ifTrue: [| r. g. b |
                r: (cs copyFrom: 1 UpTo: 3) hexAsInteger asFloat / 255.0.
                g: (cs copyFrom: 3 UpTo: 5) hexAsInteger asFloat / 255.0.
                b: (cs copyFrom: 5 UpTo: 7) hexAsInteger asFloat / 255.0.
                ^paint copyRed: r Green: g Blue: b.
            ].
            error: 'Bad color string in pixmap file: ', cs.
            ^paint named: 'blue').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             new.
            | 
            new: clone.
            new colors: colors copy.
            new pixelData: pixelData copy.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFromBitmapFile: fileName = ( |
            | copy readFromBitmapFile: fileName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFromIconFile: fileName = ( |
            | 
            copy readFromIconFile: fileName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFromIconFile: iconFileName MaskFile: maskFileName = ( |
             mask.
             new.
            | 
            new:  copyFromIconFile: iconFileName.
            mask: copyFromIconFile: maskFileName.
            new maskBy: mask.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFromPixmapFile: fileName = ( |
            | copy readFromPixmapFile: fileName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFromPixmapFile: pmFileName MaskFile: bmFileName = ( |
             mask.
             new.
            | 
            new:  copyFromPixmapFile: pmFileName.
            mask: copyFromBitmapFile: bmFileName.
            new maskBy: mask.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFromSunRasterFile: fileName = ( |
            | copy readFromSunRasterFile: fileName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: privateConvertingToPixmaps\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         copyIntoPixmap: pixmapC Mask: maskC = ( |
            | 
            "Copy this image's data into a pixmap canvas and, if self-masking,
             a mask pixmap canvas of depth 1 (i.e., a bitmap)."

            pixmapC drawFromImage: self.
            masked ifTrue: [maskC drawMaskFromImage: self].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyPixelLines: lines Colors: cList = ( |
            | 
            "Initialize this ui2Image from the given collections of
             pixel lines and colors. Each element of lines is a string
             containing only digits, upper-case letters, lower-case
             letters, and spaces. Letters and digits are mapped to
             pixel values, which are used as indices into cList to
             determine the pixel's color. Case is significant. Space
             characters indicate that the associated pixel should be
             transparent. All lines must have the same length, which
             determines the width of the image. There must be an
             entry in colors for each pixel value plus an extra
             entry (at the end) to be used for displaying the
             transparent pixels in non-masked mode. (The latter is
             only required if lines contain at least one
             transparent pixel.)"

            copy setFromPixelLines: lines Colors: cList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWidth: w Height: h Color: c = ( |
             new.
            | 
            "Return an image of the given dimensions filled with the given color."

            new: clone.
            new width: w.
            new height: h.
            new colors: vector copyAddLast: c.
            new pixelData: byteVector copySize: (w * h) FillingWith: 0.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWidth: w Height: h Masked: mFlag HexString: s Colors: cList = ( |
             new.
            | 
            "Create a new ui2Image initialized from the given string
             of hexidecimal pixel values. The hex string may contain
             non-printing characters such as newlines, which are
             ignored. The only other characters allowed are the
             hexidecimal digits 0-9, a-f, and A-F."

            new: copy.
            new width: w.
            new height: h.
            new masked: mFlag.
            new pixelData: (hexStringToBytes: s).
            new colors: cList.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creationSupport\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         hexDigitsOf: s Do: b = ( |
             decimal.
             lowercaseHex.
             uppercaseHex.
            | 
            "Evaluate the given block once for each hexidecimal digit in
             the given string. The block is evaluated with the integer value
             of the hex digit (e.g., 15 for the digit 'E'). Skip non-printing
             characters in s but give an error if a non-hex digit printable
             character is encountered."

            decimal: '0' asByte.
            uppercaseHex: 'A' asByte.
            lowercaseHex: 'a' asByte.
            s do: [| :char. :i |
                case if: [('0' <= char) && [char <= '9']] Then: [
                    b value: (char asByte - decimal).
                ] If: [('A' <= char) && [char <= 'F']] Then: [
                    b value: 10 + (char asByte - uppercaseHex).
                ] If: [('a' <= char) && [char <= 'f']] Then: [
                    b value: 10 + (char asByte - lowercaseHex).
                ] If: [(char <= ' ') || [char = '\xff']] Then: [
                    "this is a non-printing character; skip it"
                ] Else: [
                    error: char, ' is not a hexidecimal digit at index ', i printString.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creationSupport\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         hexStringToBytes: s = ( |
             j.
             lastDigit.
             r.
            | 
            "Convert the given string of hexdecimal digits into a byteVector.
             Non-printing characters are skipped. The given string must
             contain an even number of hexidecimal digits."

            r: byteVector copySize: s size.
            lastDigit: nil.
            j: 0.
            hexDigitsOf: s Do: [| :digit |
                lastDigit ifNil: [
                    lastDigit: digit.
                ] IfNotNil: [
                    r at: j Put: (lastDigit << 4) || digit.
                    j: j + 1.
                    lastDigit: nil.
                ].
            ].
            lastDigit ifNotNil: [
                error: 'given string must contain an even number of hexidecimal digits'.
            ].
            r: r copySize: j.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: masking\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         makeLastColorIndex: pixel = ( |
             newColors.
             oldToNewMap.
            | 
            "Move the color with the given index to the end of the colors vector.
             By convention, the last color of a self-masking image indicates
             which pixels are transparent."

            pixel = colors size pred ifTrue: [
                ^self.  "color is already at end"
            ].

            (pixel >= 0) ifFalse: [ error: 'color map indices must be positive' ].
            (pixel < colors size) ifFalse: [
                error: 'color map index ', pixel printString, ' is out of range'.
            ].

            "build new color map and a mapping from old to new indices"
            newColors:   colors copy mapBy: nil.
            oldToNewMap: colors size asVector.
            oldToNewMap at: pixel Put: colors lastKey.
            pixel succ to: oldToNewMap lastKey Do: [| :i |
                "slide colors after pixel down one slot"
                newColors   at: (i - 1) Put: (colors at: i).
                oldToNewMap at: i Put: (i - 1).
            ].
            newColors at: newColors lastKey Put: (colors at: pixel).
            colors: newColors.

            "transform the pixel data using the mapping"
            pixelData mapBy: [| :cIndex | oldToNewMap at: cIndex ].
            masked ifTrue: [
                transparentPixelValue: (oldToNewMap at: transparentPixelValue).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: masking\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         maskBy: maskImage = ( |
             mask.
             maskPixels.
            | 
            "Mask this image using the given image as a cookie-cutter mask.
             The argument image must be the same size as the receiver. For
             each zero-valued pixel in the argument, the corresponding pixel
             in the receiver is marked transparent."

            ((maskImage width  =  width) &&
             [maskImage height = height]) ifFalse: [
                error: 'The mask image must be the same size as the receiver'.
            ].
            colors size > 255 ifTrue: [
                error: 'A self-masking image cannot have more than 255 colors'.
            ].
            colors: colors copyAddLast: (paint named: 'black').
            transparentPixelValue: colors lastKey.
            maskPixels: maskImage pixelData.
            pixelData mapBy: [| :pixel. :i |
                0 = (maskPixels at: i) ifTrue: transparentPixelValue False: pixel.
            ].
            masked: true.
            contentsChangedFlag: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: masking\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         maskColor: c = ( |
            | 
            "Mask this image using the given color to indicate transparency.
             That is, all pixels of this image having the given color will
             be transparent when the image is displayed. The given color must
             appear in the image."

            transparentPixelValue: colors keyAt: c IfAbsent: [
                error: 'The given color does not appear in this image'.
            ].
            masked: true.
            makeLastColorIndex: transparentPixelValue.
            contentsChangedFlag: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'ModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: storing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         pixelDataHexString = ( |
             hexDigit.
             j.
             r.
            | 
            "Return my pixel data encoded as a hexidecimal string."

            hexDigit: '0123456789abcdef'.
            r: mutableString copySize: (height * ((2 * width) + 1)).
            j: 0.
            height do: [| :row. rowStart |
                rowStart: row * width.
                width do: [| :i. byte |
                    byte: pixelData at: rowStart + i.
                    r at: j     PutByte: (hexDigit byteAt: (byte >> 4)).
                    r at: j + 1 PutByte: (hexDigit byteAt: (byte && 15)).
                    j: j + 2.
                ].
                r at: j Put: '\n'.
                j: j + 1.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creationSupport\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         pixelForChar: char = ( |
            | 
            ' ' = char ifTrue: [
                masked: true.
                transparentPixelValue: colors lastKey.
                ^transparentPixelValue.
            ].
            (('0' <= char) && [char <= '9']) ifTrue: [
                ^(char asByte - '0' asByte).
            ].
            (('a' <= char) && [char <= 'z']) ifTrue: [
                ^(char asByte - 'a' asByte) + 10.
            ].
            (('A' <= char) && [char <= 'Z']) ifTrue: [
                ^(char asByte - 'A' asByte) + 36.
            ].
            error: 'pixel lines must contain only letters, digits, and spaces').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: quantizing\x7fComment: Quantize my colors so I will be less likely to
make the colormap overflow. Applications that use a
lot of colorful images can quantize them in order to
delay or prevent global color quantization with the
attendant shifting of menu and other colors.
\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         quantizeColors = ( |
            | 
            colorQuantizing ifFalse: [
                colorQuantizing: true.
                contentsChangedFlag: true.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creationSupport\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         readFromBitmapFile: fileName = ( |
             bytesPerRow.
             m.
            | 
            "Initialize the receiver from an X bitmap file (monochrome)."
            "Aside: Yes, it wastes space to use an entire byte to store each
             bit of the bitmap. But for the time being, this cost is worth it
             to have a single, uniform representation for image data."

            m: xBitmapMaker copy parseBitmapFile: fileName.
            colors: ((paint named: 'white') & (paint named: 'black')) asVector.

            width: m width.
            height: m height.
            bytesPerRow: width /+ 8.
            pixelData: byteVector copySize: (width * height).
            height do: [| :i. rowOffset. byteOffset |
                rowOffset:  width * i.
                byteOffset: bytesPerRow * i.
                width do: [| :j. byte. pixel |
                    byte: m data at: (byteOffset + (j / 8)).
                    pixel: 1 && (byte >> (j % 8)).
                    pixelData at: (rowOffset + j) Put: pixel.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creationSupport\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         readFromIconFile: fileName = ( |
             bytesPerRow.
             m.
            | 
            "Initialize the receiver from a Sun icon file (monochrome)."
            "Aside: Yes, it wastes space to use an entire byte to store each
             bit of the bitmap. But for the time being, this cost is worth it
             to have a single, uniform representation for image data."

            m: xIconMaker copy parseIconFile: fileName.
            colors: ((paint named: 'white') & (paint named: 'black')) asVector.

            width: m width.
            height: m height.
            bytesPerRow: width /+ 8.
            pixelData: byteVector copySize: (width * height).
            height do: [| :i. rowOffset. byteOffset |
                rowOffset:  width * i.
                byteOffset: bytesPerRow * i.
                width do: [| :j. byte. pixel |
                    byte: m data at: (byteOffset + ((width pred - j) / 8)).
                    pixel: 1 && (byte >> (j % 8)).
                    pixelData at: (rowOffset + (width pred - j)) Put: pixel.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creationSupport\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         readFromPixmapFile: fileName = ( |
             i.
             m.
             strToIndex.
            | 
            "Initialize the receiver from an X pixmap file."

            m: xPixmapMaker copy parsePixmapFile: fileName.
            m colorDict size > 256 ifTrue: [
                ^error: 'Cannot create a ui2Image with over 256 colors'.
            ].

            "For each color in this pixmap, build dictionaries that:
                1. map the pixelString to a unique index, and
                2. map this index to a ui2 paint"
            i: 0.
            colors: vector copySize: m colorDict size.
            strToIndex: dictionary copyRemoveAll.
            m colorDict do: [| :colorStr. :pixelStr |
                strToIndex at: pixelStr Put: i.
                colors at: i Put: (convertColorString: colorStr). 
                i: i + 1.
            ].

            "Convert the pixel data from pixelStrings into 8-bit values
             stored in the pixelData byteVector."
            width: m width.
            height: m height.
            pixelData: byteVector copySize: (width * height).
            height do: [| :i. row. rowOffset |
                row: m data at: i.
                rowOffset: width * i.
                row do: [| :pixelStr. :j |
                    pixelData at: (rowOffset + j) Put: (strToIndex at: pixelStr).
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creationSupport\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         readFromSunRasterFile: fileName = ( |
             f.
            | 
            "Initialize the receiver from a Sun raster file."
            "See the manpage for rasterfile for format details."

            f: sunRasterFile copy readFile: fileName.
            width: f width.
            height: f height.
            pixelData: f imageData.
            colors: f colorMap.
            removeUnusedColors.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creationSupport\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         removeUnusedColors = ( |
             colorUsed.
             newColors.
             nextC.
             oldToNewMap.
            | 
            "Remove unused colors from the colors array, compact it, and
             remap the pixel data accordingly. This is needed because some
             graphic applications produce image files with large numbers of
             unused colors in their color tables; removing the unused entries
             from the ui2Image simplifies color allocation issues later."

            colorUsed: colors copy mapBy: false.
            pixelData do: [| :cIndex | colorUsed at: cIndex Put: true ].
            (colorUsed includes: false) ifFalse: [ ^self ].  "all colors used"

            newColors:   colors copy mapBy: nil.
            oldToNewMap: colors copy mapBy: nil.
            nextC: 0.
            colors do: [| :c. :cIndex |
                (colorUsed at: cIndex) ifTrue: [
                    newColors at: nextC Put: c.
                    oldToNewMap at: cIndex Put: nextC.
                    nextC: nextC + 1.
                ].
            ].

            masked ifTrue: [
                (colorUsed at: transparentPixelValue) ifTrue: [
                    transparentPixelValue: (oldToNewMap at: transparentPixelValue).
                ] False: [
                    "no transparent pixels"
                    masked: false.
                ].
            ].

            pixelData mapBy: [| :cIndex | oldToNewMap at: cIndex ].
            colors: newColors copySize: nextC.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creationSupport\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         setFromPixelLines: lines Colors: cList = ( |
            | 
            "Initialize this ui2Image from the given collections of
             pixel lines and colors. See comment in copyPixelLines:Colors:)"

            colors: cList asVector copy.
            height: lines size.
            width:  lines first size.
            pixelData: byteVector copySize: height * width.
            masked: false.
            height do: [| :i. line. rowOffset |
                rowOffset: i * width.
                line: lines at: i.
                line size = width ifFalse: [
                    error: 'all lines must have the same length'.
                ].
                line do: [| :char. :j. pixel |
                    pixel: pixelForChar: char.
                    pixel < colors size ifFalse: [
                        error: 'not enough colors to represent pixel \'', char,
                               '\' in line ', j printString.
                    ].
                    pixelData at: rowOffset + j Put: pixel.
                ].
            ].
            contentsChangedFlag: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
                        width printString, ' by ', height printString,
            ', ', colors size printString, ' colors').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: storing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         storeStringForLargeColorMap = ( |
             s.
            | 
            "This version of storeString can be used with up to 256 colors.
             However, it encodes each pixel as two hexidecimal digits, thus
             it consumes somewhat more space that storeStringForSmallColorMap."

            s: '[ui2Image copyWidth: ' & width printString &
               ' Height: ' & height printString      &
               ' Masked: ' & masked printString      &
               ' HexString: (\'\n' & pixelDataHexString & '\')'.
            s: s & colorMapStoreString & '] value'.
            s flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: storing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         storeStringForSmallColorMap = ( |
             s.
            | 
            "This version of storeString yields a somewhat readable/editable string
             that uses one byte per pixel; however, it can only be used if the number
             of colors is limited to 62 (or 63, including the mask pixel value)."

            (colors size <= 62) || [masked && (colors size <= 63)] ifFalse: [
                ^ error: 'caller should have ensured that receiver had small number of colors'.
            ].

            s: '[ui2Image copyPixelLines: (\n'.
            height do: [| :row. :i |
                s: s & '    \'' & (stringForRow: row) & '\''.
                i < height pred
                    ifTrue: [ s: s & ' &\n' ]
                     False: [ s: s & ' ) asVector\n' ].
            ].
            s: s & colorMapStoreString & '] value'.
            s flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: storing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: failBlock = ( |
            | 
            "Return a string that can be evaluated to create a ui2Image
             with the same contents as the receiver."

            removeUnusedColors. "make color map as small as possible"

            masked ifTrue: [
                "make sure transparent pixel is last entry in color map"
                transparentPixelValue = colors size pred ifFalse: [
                    makeLastColorIndex: transparentPixelValue.
                    transparentPixelValue: colors size pred.
                ].
            ].

            (colors size <= 62) || [masked && (colors size <= 63)]
                ifTrue: [ storeStringForSmallColorMap ]
                 False: [ storeStringForLargeColorMap ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: storing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | ui2Image).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: storing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         stringForRow: i = ( |
             rowOffset.
             s.
            | 
            s: mutableString copySize: width.
            rowOffset: width * i.
            width do: [| :i |
                s at: i Put: (charForPixel: (pixelData at: rowOffset + i)).
            ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: masking\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         unmask = ( |
            | 
            "Make this image display with no mask."

            masked: false.
            contentsChangedFlag: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: quantizing\x7fModuleInfo: Module: pixmapMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         unquantizeColors = ( |
            | 
            colorQuantizing ifTrue: [
                colorQuantizing: false.
                contentsChangedFlag: true.
            ].
            self).
        } | ) 



 '-- Side effects'

 globals modules pixmapMorphs postFileIn
