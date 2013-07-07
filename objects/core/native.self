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
         'Category: support\x7fComment: send \'adjustToPlatform\' too all slots, so 
they can make sure they are correctly setup\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         adjustToPlatform = ( |
            | 
            (reflect: self) do: [|:e|
              e isMethod not && 
              e isAssignment not &&
              e isParent not ifTrue: [ e value reflectee adjustToPlatform ]].
            self).
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
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (native example x86osx)'
        
         currentPlatform* <- bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'x86osx' -> ().
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
        
         hello = ( |
            | error: 'Unknown Platform for Native Code').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'unknown' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'x86osx' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         hello = ( |
             bv.
             x.
            | 
            x: byteVector copySize: 5.
            hello_bv ifNil: [hello_bv: native nasm assemble: 
            '
            USE32

            ; Callee responsibilities:
            PUSH  EBP       ; store callers EBP
            MOV   EBP, ESP  ; save current stack pointer in EBP

            ; ... Code ...
            MOV  EAX, [EBP + 8] ; Load parameter 0 into EAX
            MOV  [EAX],   byte 0x48
            MOV  [EAX+1], byte 0x45
            MOV  [EAX+2], byte 0x4C
            MOV  [EAX+3], byte 0x4C
            MOV  [EAX+4], byte 0x4F

            ; Callee responsibilities:
            MOV   ESP, EBP  ; remove an unknown number of local data elements
            POP   EBP       ; restore callers EBP
            RET             ; return
            '].
            hello_bv runNativePassing: x.
            x asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'x86osx' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (nil)'
        
         hello_bv <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'x86osx' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: support\x7fComment: registers with startup to call
\'adjustToPlatform\'\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         installStartup = ( |
            | 
            snapshotAction schedulerInitialMessages
             findFirst: [|:a | a receiver = self ] 
                   IfPresent: true
                   IfAbsent: [snapshotAction addSchedulerInitialMessage:
                          (message copy receiver: self Selector: 'adjustToPlatform')].
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
        
         adjustToPlatform = ( |
            | self).
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
        
         adjustToPlatform = ( |
            | self).
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: native\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         runNative = ( |
            | _RunNativePassing: self With: self With: self With: self With: self With: self With: self With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: native\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         runNativePassing: a = ( |
            | _RunNativePassing: a With: self With: self With: self With: self With: self With: self With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: native\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         runNativePassing: a With: b = ( |
            | _RunNativePassing: a With: b With: self With: self With: self With: self With: self With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: native\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         runNativePassing: a With: b With: c = ( |
            | _RunNativePassing: a With: b With: c With: self With: self With: self With: self With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: native\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         runNativePassing: a With: b With: c With: d = ( |
            | _RunNativePassing: a With: b With: c With: d With: self With: self With: self With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: native\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         runNativePassing: a With: b With: c With: d With: e = ( |
            | _RunNativePassing: a With: b With: c With: d With: e With: self With: self With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: native\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         runNativePassing: a With: b With: c With: d With: e With: f = ( |
            | _RunNativePassing: a With: b With: c With: d With: e With: f With: self With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: native\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         runNativePassing: a With: b With: c With: d With: e With: f With: g = ( |
            | _RunNativePassing: a With: b With: c With: d With: e With: f With: g With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: native\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         runNativePassing: a With: b With: c With: d With: e With: f With: g With: h = ( |
            | _RunNativePassing: a With: b With: c With: d With: e With: f With: g With: h).
        } | ) 



 '-- Side effects'

 globals modules native postFileIn
