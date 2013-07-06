 '$Revision:$'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         native = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'native' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'native' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules native.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'native' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'native' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'native' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'native' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'native' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'native' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: OS and filesystem interface\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         native = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> () From: ( |
             {} = 'Comment: I contain native code!
Run with care, here be
dragons.
Try: native example returnSafely\x7fModuleInfo: Creator: globals native.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         example = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'example' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native example.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> () From: ( | {
         'Category: adjust to platform\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         adjustToPlatform = ( |
            | 
            host osName  = 'macOSX' 
              ifTrue: [currentPlatform: x86osx]
               False: [currentPlatform: unknown].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> () From: ( | {
         'Category: platforms\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         x86osx = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'x86osx' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native example x86osx.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         currentPlatform* = bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'x86osx' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> () From: ( | {
         'Category: platforms\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         unknown = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'unknown' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native example unknown.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'unknown' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'unknown' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         returnSafely = ( |
            | error: 'Unknown Platform for Native Code').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'x86osx' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'x86osx' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         returnSafely = ( |
             bv.
            | 
            bv: native nasm assemble: '
              ret
            '.
            bv _RunNativePassing: bv.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         nasm = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'nasm' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native nasm.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'nasm' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         assemble: s = ( |
             bv.
             f.
             fn.
            | 
            fn: os_file temporaryFileName.
            f: os_file openForWriting: fn, '.asm'.
            f write: s.
            f close.

            os command: 'nasm -f bin ', fn, '.asm'  IfFail: [|:e| error: e].

            f: os_file openForReading: fn.
            bv: f read asVMByteVector.
            f close.

            bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'nasm' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         simpleAssembler = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'simpleAssembler' -> () From: ( |
             {} = 'Comment: For testing and bootstrapping\"\x7fModuleInfo: Creator: globals native simpleAssembler.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'simpleAssembler' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         copy = ( |
            | 
            p.copy l: list copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'simpleAssembler' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (list copy)'
        
         l <- list copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'simpleAssembler' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'simpleAssembler' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         render = ( |
             bv.
            | 
            bv: byteVector copySize: l size.
            0 to: l size - 1 Do: [|:i| bv at: i Put: l at: i].
            bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'simpleAssembler' -> () From: ( | {
         'Category: instructions\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         ret = ( |
            | l addLast: 16rC3. self).
        } | ) 



 '-- Side effects'

 globals modules native postFileIn
