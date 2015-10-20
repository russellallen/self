 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot'
        
         xIconMaker = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'xIconMaker' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'xIconMaker' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules xIconMaker.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot'
        
         myComment <- 'The format of X icon files is as follows:

            /* Format_version=1, Width=32, Height=32, Depth=1, Valid_bits_per_item=16
            */
            0x0FFF,0xFC00,
            0x0800,0x0600,
            0x0800,0x0500,
            0x09F7,0xA480,'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: xIconMaker InitialContents: FollowSlot'
        
         xIconMaker = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xIconMaker' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xIconMaker.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         bitsPerItem <- 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         buffer.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         currentPos <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         data <- bootstrap stub -> 'globals' -> 'byteVector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         depth <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         height <- 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: xIconMaker InitialContents: FollowSlot'
        
         xIconMaker = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xIconMaker' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xIconMaker.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xIconMaker' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         width <- 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         getHexDigit = ( |
             c.
            | 
            c: nextChar.
            c isDigit ifTrue: [^ c asByte - '0' asByte].
            ('a' <= c) && [c <= 'f'] ifTrue: [
                       ^10 + (c asByte - 'a' asByte)].
            ('A' <= c) && [c <= 'F'] ifTrue: [
                       ^10 + (c asByte - 'A' asByte)].
            error: 'Not a digit').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         getNextNonWhitespace = ( |
             c.
            | 
            [ c: nextChar ] untilFalse: [ whitespace includes: c ].
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         getNextWord = ( |
             c.
             w <- ''.
            | 
            c: getNextNonWhitespace.
            [ w: w, c.
              c: nextChar. ] untilTrue: [ whitespace includes: c ].
            w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         nextChar = ( |
            | 
            currentPos: currentPos succ.
            buffer at: currentPos pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         nextLine = ( |
             c.
             s <- ''.
            | 
            [ c: nextChar. c = '\n' ] whileFalse: [ s: s, c ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         parseHeader = ( |
             line.
            | 
            line: nextLine.
            nextLine.
            (line asTokensSeparatedByCharactersIn: '/* ,') do: [|:t. p|
               p: t asTokensSeparatedByCharactersIn: '='.
               p size = 2 ifTrue: [| name. value|
                 name:  p  first.
                 value: p last asInteger.
                 name = 'Height'              ifTrue: [ height: value ].
                 name = 'Width'               ifTrue: [ width:  value ].
                 name = 'Depth'               ifTrue: [ depth:  value ].
                 name = 'Valid_bits_per_item' ifTrue: [ bitsPerItem: value ].
              ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: public'
        
         parseIconFile: filename = ( |
             bytesAcross.
             file.
             size <- 0.
            | 

            file: os_file openForReading: filename.
            buffer: file contents.
            file close.
            currentPos: 0.

            parseHeader.
            size: (width * height * depth) /+ 8.
            data: byteVector copySize: size.
            (size / 2) do: [|:i|
              skipToNextHex.
              data at: i*2        Put: (getHexDigit << 4) || getHexDigit.
              data at: (i*2) succ Put: (getHexDigit << 4) || getHexDigit.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         skipToNextHex = ( |
             c.
            | 
            c: getNextNonWhitespace.
            c = ',' ifTrue: [ c: getNextNonWhitespace ].
            c = '0' ifTrue: [ c: getNextNonWhitespace ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xIconMaker' -> () From: ( | {
         'ModuleInfo: Module: xIconMaker InitialContents: FollowSlot\x7fVisibility: private'
        
         whitespace = ' 	

,'.
        } | ) 



 '-- Side effects'

 globals modules xIconMaker postFileIn
