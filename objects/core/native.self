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
            | 
            native installStartup. resend.postFileIn).
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
Try: 
native example hello.
native stdio writeStdout: \'Urg!\\n\'.\x7fModuleInfo: Creator: globals native.
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
              e isParent not ifTrue: [ e value reflectee support adjustToPlatform ]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: modules\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         example = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'example' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native example.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         hello = ( |
            | 
            support currentPlatform hello).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         support = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'support' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native example support.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         adjustToPlatform = ( |
            | 
            host osName  = 'macOSX' 
              ifTrue: [currentPlatform: x86osx]
               False: [currentPlatform: unknownPlatform].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         unknownPlatform = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> 'unknownPlatform' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support nativeModuleParent unknownPlatform.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (native support nativeModuleParent unknownPlatform)'
        
         currentPlatform <- bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> 'unknownPlatform' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         nativeModuleParent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support nativeModuleParent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'support' -> () From: ( | {
         'Category: platforms\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         x86osx = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'support' -> 'x86osx' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native example support x86osx.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'support' -> 'x86osx' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         hello = ( |
             bv.
             x.
            | 
            x: byteVector copySize: 5.
            hello_bv ifNil: [hello_bv: (native support nasm copy add: 
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
            ') assemble].
            hello_bv runNativePassing: x.
            x asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         hello_bv <- bootstrap setObjectAnnotationOf: ( 'U\x89\xe5\x8bE\b\xc6\x00H\xc6@\x01E\xc6@\x02L\xc6@\x03L\xc6@\x04O\x89\xec]\xc3' copyMutable asByteVector) From: ( |
             {} = 'ModuleInfo: Creator: globals native example support x86osx hello_bv.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'support' -> 'x86osx' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: modules\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         exampleBinding = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native exampleBinding.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         sqliteVer = ( |
            | support currentPlatform sqliteVer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         support = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native exampleBinding support.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         adjustToPlatform = ( |
            | 
            host osName  = 'macOSX' 
              ifTrue: [currentPlatform: x86osx]
               False: [currentPlatform: unknownPlatform].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> () From: ( | {
         'Category: platforms\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         x86osx = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> 'x86osx' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native exampleBinding support x86osx.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (1 _AsObject)'
        
         currentPlatform <- bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> 'x86osx' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (nil)'
        
         abs_bv <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         addressOfFct = ( |
             bv.
            | 
            bv: byteVector copySize: 4.
            fct _PointerInByteVector: bv.
            bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         clean = ( |
            | 
            lib: nil. fct: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (proxy)'
        
         fct <- bootstrap stub -> 'globals' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (proxy)'
        
         lib <- bootstrap stub -> 'globals' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         loadFct = ( |
            | fct: lib lookupFunction: 'sqlite3_libversion_number').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         loadLib = ( |
            | lib: foreignCodeDB at: '/usr/lib/libsqlite3.dylib' IfFail: [|:e| error: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'support' -> 'x86osx' -> () From: ( | {
         'Comment: Should probably return 3007012 on a recent OS X\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         sqliteVer = ( |
             bv.
             res.
            | 
            fct isLive ifFalse: [clean loadLib loadFct].
            res: byteVector copySize: 4.
            abs_bv isNil ifTrue: [abs_bv: (native support nasm copy add: 
            '
            USE32

            ; Callee responsibilities:
            PUSH  EBP       ; store callers EBP
            MOV   EBP, ESP  ; save current stack pointer in EBP
            push  ebx       ; save ebx

            ; ... Code ...
            mov   edx, dword [ebp + 8]      ; load ptr to bv into ebx
            mov   eax, dword [edx]          ; load ptr to function into eax
            mov   ecx, dword [ebp + 12]

            push  dword 0x0           ; align to 16 byte boundary for OS X
            call  eax                 ; call function 
            mov   dword [ecx], eax    ; move result to res byteVector

            ; Callee responsibilities:
            pop   ebx
            MOV   ESP, EBP  ; remove an unknown number of local data elements
            POP   EBP       ; restore callers EBP
            RET             ; return
            ') assemble].
            abs_bv runNativePassing: addressOfFct With: res.
            res cIntSize: 32 Signed: false At: 0 IfFail: [error: 'Bad Int']).
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
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: modules\x7fComment: Not working yet\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         sodium = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native sodium.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         randomInt = ( |
            | support currentPlatform randomInt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         support = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native sodium support.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         adjustToPlatform = ( |
            | 
            host osName  = 'macOSX' 
              ifTrue: [currentPlatform: x86osx]
               False: [currentPlatform: unknownPlatform].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> () From: ( | {
         'Category: platforms\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         x86osx = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native sodium support x86osx.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (native sodium support x86osx)'
        
         currentPlatform <- bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         clean = ( |
            | 
            lib: foreignCode copy. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: nativeFunctions\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         crypto_box_keypair = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> 'crypto_box_keypair' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native sodium support x86osx crypto_box_keypair.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> 'crypto_box_keypair' -> () From: ( | {
         'Category: caches\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (nil)'
        
         byteV.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> 'crypto_box_keypair' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         initialise = ( |
             a.
            | 
            str isNil ifTrue: [
            a: native support nasm copy.
            a addCdeclCalleeEntry. "Pushes 2 dwords onto stack"
            a add: '
            ; Get address of function
            mov   edx, dword [ebp + 8]  ; mov addr of bv contining addr of cfunc
            mov   eax, dword [edx]      ; mov addr of cfunc into eax
            push  dword [ebp + 12]      ; save addr of bv(res) 

            ; Call
            ; push  dword 0x0           ; align to 16 byte boundary for OS X
            call  eax                   ; call function 
            ; add   esp, 4              ; stack cleaning - remove the argument(s)
            ; add   esp, 4              ; stack cleaning - remove alignment

            ; Save Result
            pop   ecx                   ; get addr of bv(res)
            mov   dword [ecx], eax      ; move result to res byteVector
            '.
            a addCdeclCalleeReturn.
            str: a assemble asString].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> 'crypto_box_keypair' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (nil)'
        
         str.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> 'crypto_box_keypair' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         value = ( |
            | 
            byteV isNil ifTrue: [byteV: str asByteVector].
            byteV).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: initialise\x7fComment: Requires NASM in path. You don\'t need to do
this.\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         initialiseNativeFunctions = ( |
            | 
            nativeFunctions randombytes_random initialize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (proxy)'
        
         lib <- bootstrap stub -> 'globals' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         loadCaches = ( |
            | 
            lib isLoaded ifFalse: [
            lib: foreignCodeDB at: '/usr/local/lib/libsodium.4.dylib' IfFail: [|:e| error: e].
            randombytes_random_fproxy: lib lookupFunction: 'randombytes_random'.
            initialiseNativeFunctions.]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         randomInt = ( |
             res.
            | 
            loadCaches.
            res: byteVector copySize: 4.
            randombytes_random value runNativePassing: randombytes_random_fproxy machineAddressAsByteVector 
                                           With: res.
            res littleEndian32bitUnsignedAt: 0 IfFail: [|:e| error: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: nativeFunctions\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         randombytes_random <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> 'randombytes_random' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native sodium support x86osx randombytes_random.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> 'randombytes_random' -> () From: ( | {
         'Category: caches\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (nil)'
        
         byteV.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> 'randombytes_random' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         initialise = ( |
             a.
            | 
            str isNil ifTrue: [
            a: native support nasm copy.
            a addCdeclCalleeEntry. "Pushes 2 dwords onto stack"
            a add: '
            ; Get address of function
            mov   edx, dword [ebp + 8]  ; mov addr of bv contining addr of cfunc
            mov   eax, dword [edx]      ; mov addr of cfunc into eax
            push  dword [ebp + 12]      ; save addr of bv(res) 

            ; Call
            ; push  dword 0x0           ; align to 16 byte boundary for OS X
            call  eax                   ; call function 
            ; add   esp, 4              ; stack cleaning - remove the argument(s)
            ; add   esp, 4              ; stack cleaning - remove alignment

            ; Save Result
            pop   ecx                   ; get addr of bv(res)
            mov   dword [ecx], eax      ; move result to res byteVector
            '.
            a addCdeclCalleeReturn.
            str: a assemble asString].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> 'randombytes_random' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         str <- bootstrap setObjectAnnotationOf: ( 'U\x89\xe5S\x8bU\b\x8b\x02\xffu\f\xff\xd0Y\x89\x01[\x89\xec]\xc3' copyMutable) From: ( |
             {} = 'ModuleInfo: Creator: globals native sodium support x86osx randombytes_random str.

CopyDowns:
globals byteVector. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> 'randombytes_random' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         value = ( |
            | 
            byteV isNil ifTrue: [byteV: str asByteVector].
            byteV).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (nil)'
        
         randombytes_random_fproxy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: modules\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         stdio = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native stdio.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         support = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> 'support' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native stdio support.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         adjustToPlatform = ( |
            | 
            host osName  = 'macOSX' 
              ifTrue: [currentPlatform: x86osx]
               False: [currentPlatform: unknownPlatform].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (native support nativeModuleParent unknownPlatform)'
        
         currentPlatform <- bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> 'unknownPlatform' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> 'support' -> () From: ( | {
         'Category: platforms\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         x86osx = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> 'support' -> 'x86osx' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native stdio support x86osx.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: assembler\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         assembleWriteStderr = ( |
            | 
            mcWriteStderr: 
            (native support nasm 
            copy
            addCdeclCalleeEntry
            add: 
            '
            mov eax, dword [ebp + 12] ; eax = addr len
            push dword [eax]      ; push len
            push dword [ebp + 8]  ; push ptr to bv 
            push dword 2          ; push 2 = stderr
            mov eax, 0x4          ; system call number for write
            sub esp, 4            ; OS X (and BSD) system calls needs "extra space" on stack
            int 0x80              ; make the actual system call
            ')
            addCdeclCalleeReturn
            assemble.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: assembler\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         assembleWriteStdout = ( |
            | 
            mcWriteStdout: 
            (native support nasm 
            copy
            addCdeclCalleeEntry
            add: 
            '
            mov eax, dword [ebp + 12] ; eax = addr len
            push dword [eax]      ; push len
            push dword [ebp + 8]  ; push ptr to bv 
            push dword 1          ; push 1 = stdout
            mov eax, 0x4          ; system call number for write
            sub esp, 4            ; OS X (and BSD) system calls needs "extra space" on stack
            int 0x80              ; make the actual system call
            ')
            addCdeclCalleeReturn
            assemble.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> 'support' -> 'x86osx' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         bvFromInt: i = ( |
            | (byteVector copySize: 4) cIntSize: 32 Signed: false At: 0 Put: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: assembler\x7fModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         generateMachinecode = ( |
            | 
            assembleWriteStdout. assembleWriteStderr. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: machine code\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         mcWriteStderr <- bootstrap setObjectAnnotationOf: ( 'U\x89\xe5S\x8bE\f\xff0\xffu\bj\x02\xb8\x04\x00\x00\x00\x83\xec\x04\xcd\x80[\x89\xec]\xc3' copyMutable asByteVector) From: ( |
             {} = 'ModuleInfo: Creator: globals native stdio support x86osx mcWriteStderr.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> 'support' -> 'x86osx' -> () From: ( | {
         'Category: machine code\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         mcWriteStdout <- bootstrap setObjectAnnotationOf: ( 'U\x89\xe5S\x8bE\f\xff0\xffu\bj\x01\xb8\x04\x00\x00\x00\x83\xec\x04\xcd\x80[\x89\xec]\xc3' copyMutable asByteVector) From: ( |
             {} = 'ModuleInfo: Creator: globals native stdio support x86osx mcWriteStdout.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         x86MacModuleParent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'x86MacModuleParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support x86MacModuleParent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> 'support' -> 'x86osx' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'x86MacModuleParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> 'support' -> 'x86osx' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         writeStderr: s IfFail: fb = ( |
            | 
            mcWriteStderr runNativePassing: s asByteVector 
                                      With: (bvFromInt: s size).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> 'support' -> 'x86osx' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         writeStdout: s IfFail: fb = ( |
            | 
            mcWriteStdout runNativePassing: s asByteVector 
                                      With: (bvFromInt: s size).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         writeStdout: s = ( |
            | writeStdout: s IfFail: [|:e| e error: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'stdio' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         writeStdout: s IfFail: fb = ( |
            | support currentPlatform writeStdout: s IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         support = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         adjustToPlatform = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         nasm = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nasm' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support nasm.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nasm' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         add: rawString = ( |
            | s: s, rawString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nasm' -> () From: ( | {
         'Category: calling\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         addCdeclCalleeEntry = ( |
            | add: '
            ; Callee responsibilities:
            push  ebp       ; store callers EBP
            mov   ebp, esp  ; save current stack pointer in EBP
            push  ebx       ; save ebx
            ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nasm' -> () From: ( | {
         'Category: calling\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         addCdeclCalleeReturn = ( |
            | 
            add: '
            ; Callee responsibilities:
            pop   ebx       ; restore ebx
            mov   esp, ebp  ; remove an unknown number of local data elements
            pop   ebp       ; restore callers EBP
            ret             ; return
            ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nasm' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         assemble = ( |
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
            bv: f read asByteVector.
            f close.

            bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nasm' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            resend.copy s: 'USE32\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nasm' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nasm' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         print = ( |
            | s printLine. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nasm' -> () From: ( | {
         'Category: internal state\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (\'USE32\\n\')'
        
         s <- 'USE32\n'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         adjustToPlatform = ( |
            | currentPlatform: unknownPlatform).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> 'unknownPlatform' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> 'unknownPlatform' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         undefinedSelector: s Type: t Delegatee: d MethodHolder: h Arguments: a = ( |
            | 
            error: 'Unknown Platform for Native Code').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         simpleAssembler = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'simpleAssembler' -> () From: ( |
             {} = 'Comment: For testing and bootstrapping\"\x7fModuleInfo: Creator: globals native support simpleAssembler.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'simpleAssembler' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         copy = ( |
            | 
            p.copy l: list copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'simpleAssembler' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (list copy)'
        
         l <- list copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'simpleAssembler' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'simpleAssembler' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         render = ( |
             bv.
            | 
            bv: byteVector copySize: l size.
            0 to: l size - 1 Do: [|:i| bv at: i Put: l at: i].
            bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'simpleAssembler' -> () From: ( | {
         'Category: instructions\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         ret = ( |
            | l addLast: 16rC3. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'x86MacModuleParent' -> () From: ( | {
         'Category: assembler\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         assembleSafeReturn = ( |
            | 
            machinecodeSafeReturn: (native support nasm copy add: 
            '
            USE32
            RET             ; return
            ') assemble.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'x86MacModuleParent' -> () From: ( | {
         'Category: machine code\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         machinecodeSafeReturn <- bootstrap setObjectAnnotationOf: ( mutableString copySize: 1 FillingWith: '\xc3' asByteVector) From: ( |
             {} = 'ModuleInfo: Creator: globals native support x86MacModuleParent machinecodeSafeReturn.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'x86MacModuleParent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
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
