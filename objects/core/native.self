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
native example hello
native sodium randomInt\x7fModuleInfo: Creator: globals native.
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
         'Category: modules\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
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

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (native support nativeModuleParent unknownPlatform)'
        
         currentPlatform* <- bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> 'unknownPlatform' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         nativeModuleParent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support nativeModuleParent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> () From: ( | {
         'Category: platforms\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         x86osx = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'x86osx' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native example x86osx.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'example' -> 'x86osx' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         hello = ( |
             bv.
             x.
            | 
            x: byteVector copySize: 5.
            hello_bv ifNil: [hello_bv: native support nasm assemble: 
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
         'Category: support\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (nil)'
        
         hello_bv <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: modules\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         exampleBinding <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native exampleBinding.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> () From: ( | {
         'Category: adjust to platform\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         adjustToPlatform = ( |
            | 
            host osName  = 'macOSX' 
              ifTrue: [currentPlatform: x86osx]
               False: [currentPlatform: unknownPlatform].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (native support nativeModuleParent unknownPlatform)'
        
         currentPlatform* <- bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> 'unknownPlatform' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> () From: ( | {
         'Category: platforms\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         x86osx = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'x86osx' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native exampleBinding x86osx.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'x86osx' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (nil)'
        
         abs_bv <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         addressOfFct = ( |
             bv.
            | 
            bv: byteVector copySize: 4.
            fct _PointerInByteVector: bv.
            bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         clean = ( |
            | 
            lib: nil. fct: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'x86osx' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (proxy)'
        
         fct <- bootstrap stub -> 'globals' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'x86osx' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (proxy)'
        
         lib <- bootstrap stub -> 'globals' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         loadFct = ( |
            | fct: lib lookupFunction: 'sqlite3_libversion_number').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         loadLib = ( |
            | lib: foreignCodeDB at: '/usr/lib/libsqlite3.dylib' IfFail: [|:e| error: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'exampleBinding' -> 'x86osx' -> () From: ( | {
         'Comment: Should probably return 3007012 on a recent OS X\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         sqliteVer = ( |
             bv.
             res.
            | 
            fct isLive ifFalse: [clean loadLib loadFct].
            res: byteVector copySize: 4.
            abs_bv isNil ifTrue: [abs_bv: native support nasm assemble: 
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
            '].
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
         'Category: modules\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         sodium = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native sodium.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> () From: ( | {
         'Category: adjust to platform\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         adjustToPlatform = ( |
            | 
            host osName  = 'macOSX' 
              ifTrue: [currentPlatform: x86osx]
               False: [currentPlatform: unknownPlatform].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (native support nativeModuleParent unknownPlatform)'
        
         currentPlatform* <- bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> 'unknownPlatform' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> () From: ( | {
         'Category: platforms\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         x86osx = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native sodium x86osx.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         clean = ( |
            | 
            lib: foreignCode copy. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> () From: ( | {
         'Category: nativeFunctions\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         crypto_box_keypair = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> 'crypto_box_keypair' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native sodium x86osx crypto_box_keypair.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> 'crypto_box_keypair' -> () From: ( | {
         'Category: caches\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (nil)'
        
         byteV <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> 'crypto_box_keypair' -> () From: ( | {
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

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> 'crypto_box_keypair' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (nil)'
        
         str.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> 'crypto_box_keypair' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         value = ( |
            | 
            byteV isNil ifTrue: [byteV: str asByteVector].
            byteV).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> () From: ( | {
         'Category: initialise\x7fComment: Requires NASM in path. You don\'t need to do
this.\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         initialiseNativeFunctions = ( |
            | 
            nativeFunctions randombytes_random initialize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (proxy)'
        
         lib <- bootstrap stub -> 'globals' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         loadCaches = ( |
            | 
            lib isLoaded ifFalse: [
            lib: foreignCodeDB at: '/usr/local/lib/libsodium.4.dylib' IfFail: [|:e| error: e].
            randombytes_random_fproxy: lib lookupFunction: 'randombytes_random'.
            initialiseNativeFunctions.]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeModuleParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> () From: ( | {
         'Comment: Should probably return 3007012 on a recent OS X\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         randomInt = ( |
             res.
            | 
            loadCaches.
            res: byteVector copySize: 4.
            randombytes_random value runNativePassing: randombytes_random_fproxy machineAddressAsByteVector 
                                           With: res.
            res littleEndian32bitUnsignedAt: 0 IfFail: [|:e| error: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> () From: ( | {
         'Category: nativeFunctions\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         randombytes_random <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> 'randombytes_random' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native sodium x86osx randombytes_random.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> 'randombytes_random' -> () From: ( | {
         'Category: caches\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (nil)'
        
         byteV <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> 'randombytes_random' -> () From: ( | {
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

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> 'randombytes_random' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         str <- bootstrap setObjectAnnotationOf: ( 'U\x89\xe5S\x8bU\b\x8b\x02\xffu\f\xff\xd0Y\x89\x01[\x89\xec]\xc3' copyMutable) From: ( |
             {} = 'ModuleInfo: Creator: globals native sodium x86osx randombytes_random str.

CopyDowns:
globals byteVector. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> 'randombytes_random' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         value = ( |
            | 
            byteV isNil ifTrue: [byteV: str asByteVector].
            byteV).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> 'x86osx' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (nil)'
        
         randombytes_random_fproxy <- bootstrap stub -> 'globals' -> 'nil' -> ().
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
        
         asm = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'asm' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support asm.
'.
            | ) .
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'Comment: For use in native framework.
Very dangerous - use with care.\x7fModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         pointerInByteVector = ( |
             bv.
            | 
            bv: byteVector copySize: 4.
            _PointerInByteVector: bv.
            bv).
        } | ) 



 '-- Side effects'

 globals modules native postFileIn
