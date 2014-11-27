 '$Revision:$'
 '
Copyright 1992-2014 AUTHORS.
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
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'native' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'native' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (\'nativeExamples
\')\x7fVisibility: private'
        
         subpartNames <- 'nativeExamples
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: OS and filesystem interface\x7fModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         native = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> () From: ( |
             {} = 'Comment: I contain native code!
Run with care, here be dragons.
This is a replacement for hardcoded
primitives. It should be low level.\x7fModuleInfo: Creator: globals native.
'.
            | ) .
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
        
         nativeMethod = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> () From: ( |
             {} = 'Comment: An immutable native method. 
Takes up to 8 byteVectors as 
arguments, returns self.
May blow up the VM.\x7fModuleInfo: Creator: globals native support nativeMethod.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (time)'
        
         lastStartupTime <- bootstrap stub -> 'globals' -> 'time' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support nativeMethod parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         arity = ( |
            | rawArity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         bytes = ( |
            | rawByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: private\x7fCategory: c support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         cCompile: c = ( |
             f.
             fn.
            | 
            checkForCCompilerIfFail: [^ error: 'Compiler not found'].

            fn: os_file temporaryFileName.
            os command: 'rm ', fn, '.c'.
            os command: 'rm ', fn, '.o'.

            f: os_file openForWriting: fn, '.c'.
            f write: c.
            f close.

            os command: 'cc -O2 -ffreestanding -m32 -c -o ', fn, '.o ', fn, '.c'  IfFail: [|:e| error: e].

            f: os_file openForReading: fn, '.o'.
            rawByteVector: f read asByteVector.
            f close.

            rawByteVector: rawByteVector copyFrom: 16r100 UpTo: rawByteVector size. "Ignore header"
            rawSource: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: private\x7fCategory: c support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         checkForCCompilerIfFail: fb = ( |
            | os command: 'cc' IfFail: [^ fb]. true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: private\x7fCategory: x86 nasm support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         checkForNasmIfFail: fb = ( |
            | os command: 'nasm' IfFail: [^ fb]. true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         copy = ( |
             c.
            | 
            "This may need to change if we 
            get working again on other 
            chips. 11/14 rca"
            c: resend.copy. 
            c rawByteVector: x86Default.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         copyForBytes: bytes Arity: arity SafeCPUs: safeCPUSet SafeOSs: safeOSSet Source: sourceString = ( |
            | 
            [ copy ] onReturn: [|:c|
              c rawByteVector: bytes.
              c rawArity: arity.
              c rawSafeCPUs: safeCPUSet.
              c rawSafeOSs: safeOSSet.
              c rawSource: sourceString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         copyForC: c Arity: a = ( |
            | 
            (((copy cCompile: c) 
                    rawArity: a)
                  rawSafeOSs: (set copy add: host osName))
                 rawSafeCPUs: (set copy add: 'x86')).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         copyForx86Asm: c Arity: a = ( |
            | 
            (((copy x86Assemble: c) 
                       rawArity: a)
                     rawSafeOSs: (set copy add: host osName))
                    rawSafeCPUs: (set copy add: 'x86')).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: private\x7fCategory: safe default\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         emptyBV = bootstrap stub -> 'globals' -> 'byteVector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         isForSource: s = ( |
            | rawSource = s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: transporter\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         isImmutableForFilingOut = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         isSafeForCPU: cpu = ( |
            | rawSafeCPUs includes: cpu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         isSafeForOS: os = ( |
            | rawSafeOSs includes: os).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: private\x7fCategory: sanity\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         sanityCheck: a = ( |
            | 
            "We assume that if this isn't the first time
            we've been called this session that all is OK,
            otherwise we will already have core dumped"
            lastStartupTime == vmStartupTime ifFalse: [
              (rawSafeOSs includes: host osName) ifFalse: [^ error: 'Not compiled for this OS'].
              (rawSafeCPUs includes: 'x86')      ifFalse: [^ error: 'Not compiled for this CPU'].
              rawByteVector _MarkExecutable. 
              lastStartupTime: vmStartupTime.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         source = ( |
            | rawSource).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: transporter\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         storeStringIfFail: fb = ( |
            | 
            'native support nativeMethod 
                copyForBytes: ', ( rawByteVector storeStringIfFail: '\'\' asByteVector'), '
                       Arity: ', (      rawArity storeStringIfFail: '0'), '
                    SafeCPUs: ', (   rawSafeCPUs storeStringIfFail: '(set copyRemoveAll)'), '
                     SafeOSs: ', (    rawSafeOSs storeStringIfFail: '(set copyRemoveAll)'), '
                      Source: ', (     rawSource storeStringIfFail: '\'\'')).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: transporter\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         storeStringNeeds = ( |
            | 
            native support nativeMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: value\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         unsafeValueWith: a With: b With: c With: d With: e With: f With: g With: h = ( |
            | 
            "No sanity check! sanityCheck: 8."
            rawByteVector _RunNativePassing: a 
                          With: b 
                          With: c 
                          With: d 
                          With: e 
                          With: f 
                          With: g 
                          With: h .
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: value\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         value = ( |
            | 
            sanityCheck: 0.
            rawByteVector _RunNativePassing: emptyBV
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: value\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         valueWith: a = ( |
            | 
            sanityCheck: 1.
            rawByteVector _RunNativePassing: a asByteVector
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: value\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         valueWith: a With: b = ( |
            | 
            sanityCheck: 2.
            rawByteVector _RunNativePassing: a asByteVector
                          With: b asByteVector
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: value\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         valueWith: a With: b With: c = ( |
            | 
            sanityCheck: 3.
            rawByteVector _RunNativePassing: a asByteVector
                          With: b asByteVector
                          With: c asByteVector
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: value\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         valueWith: a With: b With: c With: d = ( |
            | 
            sanityCheck: 4.
            rawByteVector _RunNativePassing: a asByteVector
                          With: b asByteVector
                          With: c asByteVector
                          With: d asByteVector
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: value\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         valueWith: a With: b With: c With: d With: e = ( |
            | 
            sanityCheck: 5.
            rawByteVector _RunNativePassing: a asByteVector
                          With: b asByteVector
                          With: c asByteVector
                          With: d asByteVector
                          With: e asByteVector
                          With: emptyBV
                          With: emptyBV
                          With: emptyBV.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: value\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         valueWith: a With: b With: c With: d With: e With: f = ( |
            | 
            sanityCheck: 6.
            rawByteVector _RunNativePassing: a asByteVector
                          With: b asByteVector
                          With: c asByteVector
                          With: d asByteVector
                          With: e asByteVector
                          With: f asByteVector
                          With: emptyBV
                          With: emptyBV.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: value\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         valueWith: a With: b With: c With: d With: e With: f With: g = ( |
            | 
            sanityCheck: 7.
            rawByteVector _RunNativePassing: a asByteVector
                          With: b asByteVector
                          With: c asByteVector
                          With: d asByteVector
                          With: e asByteVector
                          With: f asByteVector
                          With: g asByteVector
                          With: emptyBV.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: value\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         valueWith: a With: b With: c With: d With: e With: f With: g With: h = ( |
            | 
            sanityCheck: 8.
            rawByteVector _RunNativePassing: a asByteVector
                          With: b asByteVector
                          With: c asByteVector
                          With: d asByteVector
                          With: e asByteVector
                          With: f asByteVector
                          With: g asByteVector
                          With: h asByteVector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: private\x7fCategory: x86 nasm support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         x86Assemble: asm = ( |
             f.
             fn.
            | 
            checkForNasmIfFail: [^ error: 'Nasm not found'].

            fn: os_file temporaryFileName.
            f: os_file openForWriting: fn, '.asm'.
            f write: asm.
            f close.

            os command: 'nasm -f bin ', fn, '.asm'  IfFail: [|:e| error: e].

            f: os_file openForReading: fn.
            rawByteVector: f read asByteVector.
            f close.

            rawSource: asm.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> 'parent' -> () From: ( | {
         'Category: private\x7fCategory: safe default\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         x86Default = ( |
            | (byteVector copySize: 1) at: 0 Put: 16rC3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (0)'
        
         rawArity <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (byteVector)'
        
         rawByteVector <- bootstrap stub -> 'globals' -> 'byteVector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         rawSafeCPUs <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         rawSafeOSs <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (\'\')'
        
         rawSource <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         testAll = ( |
            | 
            (reflect: native) do: [|:s| 
            s isParent || s isMethod || s isAssignment
             ifFalse: [
               (s value includesKey: 'test') 
                 ifTrue: [
                  s value reflectee test]]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Simple accessing for native\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         readByte = ( |
            | cIntSize: 8 Signed: false At: 0 IfFail: [error: 'Bad Int']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Simple accessing for native\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         readInt32 = ( |
            | cIntSize: 32 Signed: false At: 0 IfFail: [error: 'Bad Int']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Simple accessing for native\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         writeByte: b = ( |
            | cIntSize: 8 Signed: false At: 0 Put: b IfFail: [error: 'Bad Int']. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Simple accessing for native\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         writeInt32: i = ( |
            | cIntSize: 32 Signed: false At: 0 Put: i IfFail: [error: 'Bad Int']. self).
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



 '-- Sub parts'

 bootstrap read: 'nativeExamples' From: 'core'



 '-- Side effects'

 globals modules native postFileIn
