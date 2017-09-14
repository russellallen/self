 '0.1.0'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


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
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (\'0.1.0\')\x7fVisibility: public'
        
         revision <- '0.1.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'native' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (\'nativeExamples
\')\x7fVisibility: private'
        
         subpartNames <- 'nativeExamples
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: native code\x7fModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
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
        
         buffer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support buffer.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         char = bootstrap define: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'char' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals byteVector copySize_1 ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'char' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support buffer char.

CopyDowns:
globals byteVector. copySize_1 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'char' -> () _ByteAt: 0 Put: (
     0)

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'char' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'char' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support buffer char parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'char' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'byteVector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'char' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         read = ( |
            | 
            cIntSize: 8 Signed: false At: 0 IfFail: [error: 'Bad Int']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'char' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         write: i IfFail: fb = ( |
            | 
            ((i > 255) || (i < 0)) ifTrue: [^ fb value: 'Value out of range']. 
            cIntSize: 8 Signed: false At: 0 Put: i IfFail: [error: 'Bad Int']. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'char' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         storeStringNeeds = ( |
            | native support buffer char).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         uint32 = bootstrap define: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'uint32' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals byteVector copySize_4 ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'uint32' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support buffer uint32.

CopyDowns:
globals byteVector. copySize_4 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'uint32' -> () _ByteAt: 0 Put: (
     0)

 bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'uint32' -> () _ByteAt: 1 Put: (
     0)

 bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'uint32' -> () _ByteAt: 2 Put: (
     0)

 bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'uint32' -> () _ByteAt: 3 Put: (
     0)

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'uint32' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'uint32' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support buffer uint32 parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'uint32' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'byteVector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'uint32' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot\x7fVisibility: public'
        
         read = ( |
            | 
            cIntSize: 32 Signed: false At: 0 IfFail: [
            (65536 * cIntSize: 16 Signed: false At: 0) +
            (cIntSize: 16 Signed: false At: 2)]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'uint32' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         write: i IfFail: fb = ( |
            | 
            cIntSize: 32 Signed: false At: 0 Put: i IfFail: [error: 'Bad Int']. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> 'uint32' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         storeStringNeeds = ( |
            | native support buffer uint32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         cNativeParent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support cNativeParent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         basicInclude = '
// We are in freestanding mode
// Only these std header files
// are available
// C99 standard 4.6
#include <float.h>
#include <iso646.h>
#include <limits.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h> 
#include <stdint.h>

typedef void *oop;
typedef int32_t smi;

typedef uint8_t *bv_char(oop);
typedef void    *proxy_ptr(oop);
typedef bool     is_smi(oop);
typedef void     failure(void *FB, uint32_t err);

#define BADTYPEERROR   2
#define OVERFLOWERROR  5

#define SMI_MAX  536870911
#define SMI_MIN -536870912

#define BV_CHAR ((bv_char*)      useful[0])
#define PROXY_PTR ((proxy_ptr*)  useful[1])
#define IS_SMI  ((is_smi*)       useful[2])
#define FAILURE ((failure*)      useful[3])

'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> () From: ( | {
         'Category: support\x7fComment: for easier access\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         buffer = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         cCompile: source IfFail: fb = ( |
             c.
             err.
             f.
             fn.
             rawByteVector.
            | 
            os command: 'cc' IfFail: [^ fb value: 'C Compiler Not Found'].

            c: basicInclude, source. 

            fn: os_file temporaryFileName.
            os command: 'rm ', fn, '.c'.
            os command: 'rm ', fn, '.o'.

            f: os_file openForWriting: fn, '.c'.
            f write: c.
            f close.

            [
            os command: 'cc -O2 -ffreestanding -m32 -c -o ', fn, '.o ', fn, '.c &>', fn, '.err'  IfFail: [|:e| error: e].
            ] value.
            [
            os command: 'ccomp -c -o ', fn, '.o ', fn, '.c &>', fn, '.err'  IfFail: [|:e| error: e].
            ].
            [
            os command: 'tcc -c -o ', fn, '.o ', fn, '.c &>', fn, '.err'  IfFail: [|:e| error: e].
            ].

            f: os_file openForReading: fn, '.err'.
            err: f readIfFail: ''.
            f close.
            err size > 0 ifTrue: [^ fb value: err].


            f: os_file openForReading: fn, '.o'.
            rawByteVector: f read asByteVector.
            f close.

            rawByteVector: rawByteVector copyFrom: 16r100 UpTo: rawByteVector size. "Ignore header"
            rawByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> () From: ( | {
         'Category: external libraries\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         proxyForFunction: s Library: l IfFail: fb = ( |
            | (proxyForLibrary: l IfFail: [^ fb value: 'Cannot find shared library']) lookupFunction: s IfFail: [^ fb value: 'Cannot find function']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> () From: ( | {
         'Category: external libraries\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         proxyForLibrary: l IfFail: fb = ( |
            | 
            foreignCodeDB at: l IfFail: [^ fb value: 'Could not load library']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         recompileIfFail: fb = ( |
            | 
            compiled: byteVector copyRemoveAll.
            reloadIfFail: [|:e| ^  fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         reloadIfFail: fb = ( |
             b.
            | 
            compiled isEmpty ifTrue: [compiled: cCompile: source IfFail: [|:e| ^ fb value: e]].
            nativeCode: fctProxy copy.
            nativeCode _AllocateBytes: compiled size IfFail: [|:e| ^ fb value: 'Native Recompile Error: Couldn\'t allocate storage'].
            (nativeCode _GetSizeOfAllocatedMemory = compiled size) ifFalse: [|:e| ^ fb value: 'Native Recompile Error: Size error'].
            nativeCode _LoadByteVector: compiled AtOffset: 0 IfFail: [|:e| ^ fb value: 'Native Recompile Error: Couldn\'t load byteVector'].
            b: byteVector copySize: nativeCode _GetSizeOfAllocatedMemory.
            nativeCode _ReadByteVector: b AtOffset: 0.
            (b = compiled) ifFalse: [ ^ fb value: 'Native Recompile Error: Storage failed'].
            nativeCode _NoOfArgs: arity.
            (nativeCode _NoOfArgs = arity) ifFalse: [ ^ fb value: 'Native Recompile Error: Arity storage error'].
            (nativeCode isLive) ifFalse: [ ^ fb value: 'Native Recompile Error: Compiled code not live'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         runNativeIfFail: fb = ( |
            | 
            nativeCode _RunNativeIfFail: [
              reloadIfFail: [|:e| ^ fb value: e].
              nativeCode _RunNativeIfFail: [|:e | ^ fb value: e]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         runNativeWith: a IfFail: fb = ( |
            | 
            nativeCode _RunNativeWith: a IfFail: [
              reloadIfFail: [|:e| ^ fb value: e].
              nativeCode _RunNativeWith: a IfFail: [|:e | ^ fb value: e]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         runNativeWith: a With: b IfFail: fb = ( |
            | 
            nativeCode _RunNativeWith: a 
                                 With: b 
                               IfFail: [
                      reloadIfFail: [|:e| ^ fb value: e].
                       nativeCode _RunNativeWith: a 
                                            With: b
                                          IfFail: [|:e | ^ fb value: e]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         runNativeWith: a With: b With: c IfFail: fb = ( |
            | 
            nativeCode _RunNativeWith: a  
                                 With: b
                                 With: c
                               IfFail: [
                      reloadIfFail: [|:e| ^ fb value: e].
                       nativeCode _RunNativeWith: a
                                            With: b
                                            With: c
                                          IfFail: [|:e | ^ fb value: e]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         sm2 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm2' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support sm2.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm2' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         , aWord = ( |
            | words addLast: aWord. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm2' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         asBinaryCode = ( |
             b.
            | 
            b: byteVector copyRemoveAll.
            words do: [|:w|
              b: b, w asByteVector].
            b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm2' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         copy = ( |
            | 
            resend.copy words: list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         ia32_macos = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32_macos' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support stackMachine ia32_macos.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm2' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         machine* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32_macos' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm2' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm2' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         words <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         sm3 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm3' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support sm3.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm3' -> () From: ( | {
         'Category: core-data\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         add_uint32 = ( |
            | 
            "  Add two uint32 on stack.
               pop ecx
               add Ê Êeax,ecx
            "
            addCode: '\x5B\x01\xD8' asByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm3' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: native InitialContents: InitializeToExpression: (\'\')'
        
         code <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm3' -> () From: ( | {
         'Category: compiler\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         compile: s = ( |
            | 
            (parse: s) do: [|:t|
              (t includes: ',')
                ifTrue: [" Literal " 
                    addCode: push: (t splitOn: ',') first asInteger]
                 False: [t sendTo: self]].
            code).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm3' -> () From: ( | {
         'Category: compiler\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         copyCompile: s = ( |
            | 
            copy compile: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm3' -> () From: ( | {
         'Category: core-data\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         mul_uint32 = ( |
            | 
            "  Mul two uint32 on stack.
               pop ecx
               mul ecx
            "
            addCode: '\x59\xF7\xE1' asByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm3' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm3' -> () From: ( | {
         'Category: compiler\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         parse: s = ( |
            | 
            s asTokensSeparatedByItemsSatisfying: [|:c| (c = ' ') || (c = '\n')]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm3' -> () From: ( | {
         'Category: literals\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         push: uint32 = ( |
            | 
            '\x50' asByteVector,                              "push eax"
            '\xB8' asByteVector, ((byteVector copySize: 4)    "mov eax, lit"
                       cIntSize: 32                            
                         Signed: false 
                             At: 0 
                            Put: uint32 
                         IfFail: [error: 'Bad Int'])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm3' -> () From: ( | {
         'Category: core-data\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         sub_uint32 = ( |
            | 
            "  Sub two uint32 on stack.
               pop ecx
               sub eax,ecx
            "
            addCode: '\x59\x29\xC8' asByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm3' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         testAll = ( |
            | testParser).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'sm3' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         testParser = ( |
            | 
            [ (parse: '2 3 add\nadd') = ('2' & '3' & 'add' & 'add') asSequence ] assert. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         stackMachine = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> () From: ( |
             {} = 'Comment: This implements a tagetable compiler
for a very simple stack language.\x7fModuleInfo: Creator: globals native support stackMachine.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         generic = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support stackMachine generic.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: core-data\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         add_uint32 = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         chunk = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'chunk' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support stackMachine generic chunk.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'chunk' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         copyOnByteVector: bv = ( |
            | 
            heldValue: holderPrototypes byteVectorHolder copyOn: bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'chunk' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (nil)'
        
         heldValue.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'chunk' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         holderPrototypes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'chunk' -> 'holderPrototypes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support stackMachine generic chunk holderPrototypes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'chunk' -> 'holderPrototypes' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         byteVectorHolder = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'chunk' -> 'holderPrototypes' -> 'byteVectorHolder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support stackMachine generic chunk holderPrototypes byteVectorHolder.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'chunk' -> 'holderPrototypes' -> 'byteVectorHolder' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         bv.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'chunk' -> 'holderPrototypes' -> 'byteVectorHolder' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         copyOn: bv = ( |
            | copy bv: bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'chunk' -> 'holderPrototypes' -> 'byteVectorHolder' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'chunk' -> 'holderPrototypes' -> 'byteVectorHolder' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         value = ( |
            | bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'chunk' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'chunk' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         value = ( |
            | heldValue value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         code = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'code' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support stackMachine generic code.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         , w = ( |
            | words addLast: w. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         copy = ( |
            | resend.copy words: list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         render = ( |
             b.
            | 
            b: byteVector copyRemoveAll. words do: [|:w| b: b, w value]. b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         words <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: core-stack\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         drop = ( |
            | childResponsiblity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: core-os\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         enter: arity = ( |
            | childResponsiblity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: core-control\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         jump: l = ( |
            | childResponsiblity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: core-control\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         jumpNotZero: l = ( |
            | childResponsiblity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: core-control\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         jumpZero: l = ( |
            | childResponsiblity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: core-control\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         label: s = ( |
            | childResponsiblity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: core-os\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         leave = ( |
            | childResponsiblity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: core-stack\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         load32 = ( |
            | childResponsiblity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: core-data\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         mul_uint32 = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: core-stack\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         pick = ( |
            | childResponsiblity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: extensions\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         pick0 = ( |
            | (push: 0), pick).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: extensions\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         pick1 = ( |
            | (push: 1), pick).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: extensions\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         pick2 = ( |
            | (push: 2), pick).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: extensions\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         pick3 = ( |
            | (push: 3), pick).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: extensions\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         pick4 = ( |
            | (push: 4), pick).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: core-stack\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         push: lit = ( |
            | childResponsiblity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: core-stack\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         store32 = ( |
            | childResponsiblity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: core-data\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         sub_uint32 = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> () From: ( | {
         'Category: core-stack\x7fComment: Replace with rot\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         swap = ( |
            | childResponsiblity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         ia32 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32' -> () From: ( |
             {} = 'Comment: TOS is in eax.
ebx is used for scratch
arguments are popped before stack calculations\x7fModuleInfo: Creator: globals native support stackMachine ia32.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32' -> () From: ( | {
         'Category: core-data\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         add_uint32 = ( |
            | 
            "  Add two uint32 on stack.
               pop ecx
               add Ê Êeax,ecx
            "
            chunk copyOnByteVector:
              '\x5B\x01\xD8' asByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32' -> () From: ( | {
         'Category: core-stack\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         drop = ( |
            | 
            "  Top of stack is number to drop 
               ie if stack is a b c :1, after drop stack will be a :b 
               0: Êbb 04 00 00 00 Ê Ê Ê Ê Êmov Ê Êebx,0x4
               5: Êf7 e3 Ê Ê Ê Ê Ê Ê Ê Ê Ê mul Ê Êebx
               7: Ê01 c4 Ê Ê Ê Ê Ê Ê Ê Ê Ê add Ê Êesp,eax
               9: Ê58 Ê Ê Ê Ê Ê Ê Ê Ê Ê Ê Êpop Ê Êeax

            "
            chunk copyOnByteVector:
              '\xBB\x04\x00\x00\x00\xF7\xE3\x01\xC4\x58' asByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32' -> () From: ( | {
         'Category: core-stack\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         load32 = ( |
            | 
            "  Push the value found at address tos 
               ( adr -- [adr] )
               mov eax, dword ptr [eax]
            "
            chunk copyOnByteVector:
               '\x8B\x00' asByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32' -> () From: ( | {
         'Category: core-data\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         mul_uint32 = ( |
            | 
            "  Mul two uint32 on stack.
               pop ecx
               mul ecx
            "
            chunk copyOnByteVector:
              '\x59\xF7\xE1' asByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'generic' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32' -> () From: ( | {
         'Category: core-stack\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         pick = ( |
            | 
            "  Top of stack is number to pick 
               ie if stack is a b c :1, after drop stack will be a b c :b  
                mov eax,DWORD PTR [eax*4 +esp]

            "
             chunk copyOnByteVector:
             '\x8B\x04\x84' asByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32' -> () From: ( | {
         'Category: core-stack\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         push: uint32 = ( |
            | 
            chunk copyOnByteVector:
            '\x50' asByteVector,                              "push eax"
            '\xB8' asByteVector, ((byteVector copySize: 4)    "mov eax, lit"
                       cIntSize: 32                            
                         Signed: false 
                             At: 0 
                            Put: uint32 
                         IfFail: [error: 'Bad Int'])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32' -> () From: ( | {
         'Category: core-stack\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         store32 = ( |
            | 
            "  Push the value found at tos to adr 
               ( value adr -- )
                mov ecx, eax
                pop eax
                mov DWORD PTR [eax], ecx
                pop eax
            "
            chunk copyOnByteVector:
               '\x89\xC1\x58\x89\x08\x58' asByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32' -> () From: ( | {
         'Category: core-data\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         sub_uint32 = ( |
            | 
            "  Sub two uint32 on stack.
               pop ecx
               sub eax,ecx
            "
            chunk copyOnByteVector:
              '\x59\x29\xC8' asByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32' -> () From: ( | {
         'Category: core-stack\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         swap = ( |
            | 
            "  mov ecx, eax
               pop eax
               push ecx
            "
            chunk copyOnByteVector:
            '\x89\xC1\x58\x51' asByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32_macos' -> () From: ( | {
         'Category: core-os\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         enter: arity = ( |
             a.
             b.
            | 
            "  We have been called by c. Set up our local situation by
               duplicating stack so that when we return the calling 
               function won't clean up too much as per cdecl. "

            "  Save stack pointer
                 push ebp
                 push ebx
                 mov ebp, esp
            "
            b: '\x55\x53\x89\xE5'.


            "  Copy args to local stack
                 mov Êeax,DWORD PTR [ebp+0x10]
                 push eax
                 mov Êeax,DWORD PTR [ebp+0x0c]
            "
            arity - 1 do: [|:i| b: b, '\x8B\x45\x10\x50'].
            b: b, '\x8B\x45\x0c'.

            chunk copyOnByteVector:
            b asByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32_macos' -> () From: ( | {
         'Category: core-os\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         leave = ( |
            | 
            "   # cdecl - assumes ret value in eax 
                mov esp, ebp
                pop ebx
                pop ebp
                ret
            "
            chunk copyOnByteVector:
            '\x89\xEC\x5B\x5D\xC3' asByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32_macos' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: native\x7fModuleInfo: Module: native InitialContents: FollowSlot'
        
         nativeTypeDescriptor = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: native InitialContents: FollowSlot'
        
         nativeTypeDescriptor = 1.
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
