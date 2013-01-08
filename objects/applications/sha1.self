 '$Revision:$'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot'
        
         sha1 = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sha1' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sha1' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sha1.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sha1' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sha1' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sha1' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sha1' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sha1' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sha1' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: cryptography\x7fModuleInfo: Module: sha1 InitialContents: FollowSlot\x7fVisibility: public'
        
         sha1 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sha1' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sha1.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sha1' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot\x7fVisibility: public'
        
         hashMessage: message = ( |
            | 
            hashMessage: message IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sha1' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot\x7fVisibility: public'
        
         hashMessage: message IfFail: fb = ( |
             digest.
             h0.
             h1.
             h2.
             h3.
             h4.
             m.
            | 
            h0: int32 fromHigh16Bits: 16r6745 Low16Bits: 16r2301.
            h1: int32 fromHigh16Bits: 16rEFCD Low16Bits: 16rAB89.
            h2: int32 fromHigh16Bits: 16r98BA Low16Bits: 16rDCFE.
            h3: int32 fromHigh16Bits: 16r1032 Low16Bits: 16r5476.
            h4: int32 fromHigh16Bits: 16rC3D2 Low16Bits: 16rE1F0.

            m: preprocessMessage: message.
            [(m size % 64) = 0] assert.

            0 upTo: m size By: 64 Do: [|:chunkStart. words. a. b. c. d. e|
              words: wordsForChunkIn: m StartingAt: chunkStart.
              a: h0.
              b: h1.
              c: h2.
              d: h3.
              e: h4.
              80 do: [|:i. f. k. temp|
                case
                  if: [i <= 19] Then: [
                    f: int32 or: (int32 and: b With: c) With: (int32 and: (int32 xor: b With: -1) With: d).
                    k: int32 fromHigh16Bits: 16r5A82 Low16Bits: 16r7999.
                  ]
                  If: [i <= 39] Then: [
                    f: int32 xor: b With: int32 xor: c With: d.
                    k: int32 fromHigh16Bits: 16r6ED9 Low16Bits: 16rEBA1.
                  ]
                  If: [i <= 59] Then: [
                    f: int32 or: (int32 and: b With: c) With:  int32 or: (int32 and: b With: d) With: (int32 and: c With: d).
                    k: int32 fromHigh16Bits: 16r8F1B Low16Bits: 16rBCDC.
                  ]
                  Else: [
                    f: int32 xor: b With: int32 xor: c With: d.
                    k: int32 fromHigh16Bits: 16rCA62 Low16Bits: 16rC1D6.
                  ].
                temp: int32 add: (int32 rotate: a LeftBy: 5) With: int32 add: f With: int32 add: e With: int32 add: k With: words at: i.
                e: d.
                d: c.
                c: int32 rotate: b LeftBy: 30.
                b: a.
                a: temp.
              ].
              h0: int32 add: h0 With: a.
              h1: int32 add: h1 With: b.
              h2: int32 add: h2 With: c.
              h3: int32 add: h3 With: d.
              h4: int32 add: h4 With: e.
            ].
            digest: byteVector copySize: int32 size * 5.
            digest copyRangeDstPos: int32 size * 0 SrcArray: (int32 asBigEndianByteVectorFrom: h0) SrcPos: 0 Len: int32 size.
            digest copyRangeDstPos: int32 size * 1 SrcArray: (int32 asBigEndianByteVectorFrom: h1) SrcPos: 0 Len: int32 size.
            digest copyRangeDstPos: int32 size * 2 SrcArray: (int32 asBigEndianByteVectorFrom: h2) SrcPos: 0 Len: int32 size.
            digest copyRangeDstPos: int32 size * 3 SrcArray: (int32 asBigEndianByteVectorFrom: h3) SrcPos: 0 Len: int32 size.
            digest copyRangeDstPos: int32 size * 4 SrcArray: (int32 asBigEndianByteVectorFrom: h4) SrcPos: 0 Len: int32 size.
            digest).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sha1' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sha1' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot\x7fVisibility: private'
        
         preprocessMessage: message = ( |
             length.
             m.
            | 
            m: message copyAddLast: 128.
            m: m, (string copySize: (56 - m size) % 64 FillingWith: 0).
            m: m, (int64 asBigEndianByteVectorFrom: message size * 8).
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sha1' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot\x7fVisibility: public'
        
         unitTests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sha1' -> 'unitTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sha1 unitTests.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sha1' -> 'unitTests' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sha1' -> 'unitTests' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sha1 unitTests parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sha1' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot\x7fVisibility: private'
        
         assertHashOf: m Is: expected = ( |
             actual.
            | 
            actual: (sha1 hashMessage: m) hexPrintString.
            [actual = expected] assert: 'sha1 test'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sha1' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sha1' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            assertHashOf: 'The quick brown fox jumps over the lazy dog'
                      Is: '2fd4e1c67a2d28fced849ee1bb76e7391b93eb12'.

            assertHashOf: 'The quick brown fox jumps over the lazy cog'
                      Is: 'de9f2c7fd25e1b3afad3e85a0bd17d9b100db4b3'.

            assertHashOf: 'Hi There'
                      Is: '4b3aed5f9fe40159b499536fb8a10cdf3bc62b4c'.

            [aaa]. "Find an official set of test cases on the net."

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sha1' -> () From: ( | {
         'ModuleInfo: Module: sha1 InitialContents: FollowSlot\x7fVisibility: private'
        
         wordsForChunkIn: m StartingAt: chunkStart = ( |
             words.
            | 
            words: vector copySize: 80.

            16 do: [|:i. wordStart. word|
              wordStart: chunkStart + (i * 4).
              word: int32 copyTakeBigEndianBytesFrom: m Index: wordStart.
              words at: i Put: word.
            ].
            16 upTo: 80 Do: [|:i. word|
              word:
                int32
                  rotate:
                    (int32 xor: (words at: i -  3) With:
                     int32 xor: (words at: i -  8) With:
                     int32 xor: (words at: i - 14) With:
                                (words at: i - 16))
                  LeftBy: 1.
              words at: i Put: word.
            ].
            words).
        } | ) 



 '-- Side effects'

 globals modules sha1 postFileIn
