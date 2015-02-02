 '$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot'
        
         sunRasterFile = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sunRasterFile' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sunRasterFile' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sunRasterFile.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot'
        
         sunRasterFile = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sunRasterFile' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sunRasterFile.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         bytesPerLine.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         colorMap.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         depth.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         fileContents.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         headerOffset.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         height <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         imageData.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot'
        
         sunRasterFile = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sunRasterFile.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'sunRasterFile' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         rasLength.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         rasMapLength.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         rasMapType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         rasType.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         width <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         formatError: s = ( |
            | 
            error: 'Cannot read SunRasterFile;\n  Reason: ', s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( | {
         'ModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | 
            'sunRasterFile(', width printString, 'x', height printString, ')').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         rHEADER_SIZE = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         rMAPTYPE_EQUAL_RGB = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         rMAPTYPE_NONE = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         rTYPE_BYTE_ENCODED = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         rTYPE_FORMAT_RGB = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         rTYPE_OLD = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         rTYPE_STANDARD = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         readAndCheckHeader = ( |
            | 
            "check magic number"
            ((16r59 = (fileContents at: 0) asByte) &&
            [(16rA6 = (fileContents at: 1) asByte) &&
            [(16r6A = (fileContents at: 2) asByte) &&
            [(16r95 = (fileContents at: 3) asByte)]]]) ifFalse: [
                formatError: 'bad magic number'.
            ].

            width:        (fileContents bigEndianIntSize: 32 Signed: false At:  4).
            height:       (fileContents bigEndianIntSize: 32 Signed: false At:  8).
            depth:        (fileContents bigEndianIntSize: 32 Signed: false At: 12).
            rasLength:    (fileContents bigEndianIntSize: 32 Signed: false At: 16).
            rasType:      (fileContents bigEndianIntSize: 32 Signed: false At: 20).
            rasMapType:   (fileContents bigEndianIntSize: 32 Signed: false At: 24).
            rasMapLength: (fileContents bigEndianIntSize: 32 Signed: false At: 28).

            bytesPerLine: (width * depth) /+ 8.
            bytesPerLine odd ifTrue: [ bytesPerLine: bytesPerLine succ ].

            ((rasType = rTYPE_STANDARD) ||
             (rasType = rTYPE_OLD)      ||
             (rasType = rTYPE_FORMAT_RGB)) ifFalse: [
                formatError: 'cannot handle raster file of type ', rasType printString.
            ].

            ((rasLength = (bytesPerLine * height)) ||
            [(rasLength = 0) && (rasType = rTYPE_OLD)]) ifFalse: [
                formatError: 'bad raster length'.
            ].

            (rasMapType = rMAPTYPE_NONE) || (rasMapType = rMAPTYPE_EQUAL_RGB) ifFalse: [
                formatError: 'cannot handle color map type ', rasMapType printString.
            ].

            (rasMapType = rMAPTYPE_NONE) ifTrue: [
                (rasMapLength != 0) ifTrue: [
                    formatError: 'non-zero length for a colormap of type NONE'.
                ].
                depth = 8 ifTrue: [
                    formatError: 'an 8-bit raster must have a color map'.
                ].
            ] False: [
                (rasMapLength <= (256 * 3)) ifFalse: [
                    formatError: 'color map too big: ', rasMapLength printString.
                ].
                depth > 8 ifTrue: [
                    formatError: 'a raster of depth ', depth printString, ' should not have a color map'.
                ].
                ((rasMapLength / 3.0) = (rasMapLength / 3) asInteger) ifFalse: [
                    formatError: 'color map length must be a multiple of 3'.
                ].
            ].

            (rasMapType = rMAPTYPE_EQUAL_RGB) && (rasMapLength = 0) ifTrue: [
                formatError: 'zero length for a colormap of type EQUAL_RGB'.
            ].

            (fileContents size = (rasLength + rasMapLength + rHEADER_SIZE)) ifFalse: [
                formatError: 'bad overall file length'.
            ].

            headerOffset: rHEADER_SIZE + rasMapLength.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         readColorMap = ( |
             bOffset.
             count.
             gOffset.
             rOffset.
            | 
            ((1 = depth) && [0 = rasMapLength]) ifTrue: [
                colorMap: ((paint named: 'white') & (paint named: 'black')) asVector.
                ^self.
            ].
            count: rasMapLength / 3.
            rOffset: rHEADER_SIZE.
            gOffset: rHEADER_SIZE + count.
            bOffset: rHEADER_SIZE + (2 * count).
            colorMap: vector copySize: count.
            count do: [| :i. r. g. b |
                r: (fileContents byteAt: (rOffset + i)) / 255.0.
                g: (fileContents byteAt: (gOffset + i)) / 255.0.
                b: (fileContents byteAt: (bOffset + i)) / 255.0.
                colorMap at: i Put: (paint copyRed: r Green: g Blue: b).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: public'
        
         readFile: filename = ( |
             f.
            | 
            f: os_file openForReading: filename.
            ('Reading raster file ', filename, '...') print.
            fileContents: f contents.
            f close.
            readAndCheckHeader.
            readColorMap.
            readImage.
            fileContents: nil.
            'Done' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         readImage = ( |
            | 
            imageData: byteVector copySize: (width * height).
            1 = depth ifTrue: [
                height do: [| :i. rowOffset. byteOffset |
                    rowOffset:  i * width.
                    byteOffset: headerOffset + (i * bytesPerLine).
                    width do: [| :j. byte. pixel |
                        byte: fileContents byteAt: (byteOffset + (j / 8)).
                        pixel: 1 && (byte >> ((7 - j) % 8)).
                        imageData at: (rowOffset + j) PutByte: pixel.
                    ].
                ].
                ^self
            ].
            8 = depth ifTrue: [
                height do: [| :i. rowOffset. byteOffset |
                    rowOffset:  i * width.
                    byteOffset: headerOffset + (i * bytesPerLine).
                    width do: [| :j. byte |
                        byte: fileContents byteAt: (byteOffset + j).
                        imageData at: (rowOffset + j) PutByte: byte.
                    ].
                ].
                ^self
            ].
            24 = depth ifTrue: [ ^readImage24Bit ].
            formatError: 'Sun rasterfiles of depth ', depth, ' are not supported').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sunRasterFile' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: sunRasterFile InitialContents: FollowSlot\x7fVisibility: private'
        
         readImage24Bit = ( |
             colors.
             nextColorIndex <- 0.
            | 
            'crudely quantizing 24-bit colors...' print.
            colors: dictionary copyRemoveAll.
            height do: [| :i. rowOffset. byteOffset |
                rowOffset:  i * width.
                byteOffset: headerOffset + (i * bytesPerLine).
                width do: [| :j. rgb. colorIndex |
                    rgb: fileContents copyFrom: byteOffset UpTo: 3 + byteOffset.
                    rgb at: 0 PutByte: (2r11000000 && (rgb byteAt: 0)).
                    rgb at: 1 PutByte: (2r11100000 && (rgb byteAt: 1)).
                    rgb at: 2 PutByte: (2r11100000 && (rgb byteAt: 2)).
                    colorIndex: colors at: rgb IfAbsent: [
                        colorIndex: nextColorIndex.
                        nextColorIndex: nextColorIndex succ.
                        colors at: rgb Put: colorIndex.
                        colorIndex].
                    imageData at: (rowOffset + j) PutByte: colorIndex.
                    byteOffset: 3 + byteOffset.
                ].
            ].

            colorMap: vector copySize: colors size.
            colors do: [| :i. :rgb. r. g. b |
                colorMap at: i Put: 
                r: (rgb byteAt: 0) / 255.0.
                g: (rgb byteAt: 1) / 255.0.
                b: (rgb byteAt: 2) / 255.0.
                colorMap at: i Put: (paint copyRed: r Green: g Blue: b).
            ].
            self).
        } | ) 



 '-- Side effects'

 globals modules sunRasterFile postFileIn
