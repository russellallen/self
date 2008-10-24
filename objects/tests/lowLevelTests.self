 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         lowLevelTests = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'lowLevelTests' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'lowLevelTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules lowLevelTests.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'lowLevelTests' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'lowLevelTests' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'lowLevelTests' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         myComment <- 'tests parts of the interface to the operating system.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'lowLevelTests' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'lowLevelTests' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: April 2007 times delay: 10 Intel bug\x7fModuleInfo: Module: lowLevelTests InitialContents: FollowSlot\x7fVisibility: public'
        
         eqInliningRelocationTest = ( |
             movingObj.
             oc.
             ol.
            | 
            'Testing _EQ: inlining argument relocation ... ' print.
            oc: _Compilers. ol: _RecompileLimits. _Compilers: (vector copyAddFirst: 'sic') Limits: vector.
            _Flush.
            _GarbageCollect.
            10 do: [vector copySize: 1000000].
            movingObj: () _Clone.
            eqInliningTestObj _Mirror at: 'movingObj' PutContents: movingObj _Mirror.
            (eqInliningTestObj test: movingObj) ifFalse: [error: 'failed'].
            _GarbageCollect.
            "will fail if inlined _EQ: prim did not relocate"
            (eqInliningTestObj test: movingObj) ifFalse: [error: 'failed'].
            _Compilers: oc Limits: ol.
            'ok' printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: April 2007 times delay: 10 Intel bug\x7fModuleInfo: Module: lowLevelTests InitialContents: FollowSlot\x7fVisibility: private'
        
         eqInliningTestObj = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'eqInliningTestObj' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests eqInliningTestObj.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'eqInliningTestObj' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         movingObj = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'eqInliningTestObj' -> 'movingObj' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests eqInliningTestObj movingObj.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'eqInliningTestObj' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         test: x = ( |
            | x _Eq: movingObj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         lowLevel = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests lowLevel.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         halfTestBlocksInVectors = ( |
             a.
            | 
            "ensure that the SIC
             materializes a block that is stored into a vector"
            [|:b|
              6000 do: [
                a: vector copySize: 1.
                a at: 0 Put:  b.
                (a at: 0) value
              ].
            ] value: [3+4].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         run = ( |
            | 
            'Testing low level aspects ...' printLine.
            check: [ testBlocksInVectors ] Against: 'ok' 
              Named: 'materializing blocks in vectors'.
            check: [ testNullTerminatedStrings ] Against: 'ok' 
              Named: 'nullTerminated strings'.
            check: [ testGetpid ] Against: 'ok' Named: 'getpid'.
            check: [ testFile ] Against: 'ok' 
              Named: 'file: '.
            check: [ testTypeSizes ] Against: 'ok' Named: 'testTypeSizes'.
            check: [ testCTypes ] Against: 'ok' Named: 'testCTypes').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testBlockCloneAndSetScope = ( |
             b.
             local.
            | 
            local: 'ok'.
            b: (asMirror at: 'testBlockCloneAndSetScope')
              contents literals 
                findFirst: [|:lit| lit asMirror isReflecteeBlock  
                                   &&  [ lit asMirror valueSlot contents includesKey: 'thisOne' ]
              ] IfPresent: [|:blk| blk]
                IfAbsent:  [error: 'could not find block literal'].
            b: b _BlockCloneAndSetScope.
            b asMirror isReflecteeBlock ifFalse: [error: 'not a block'].
            [ | thisOne | local].
            b value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testBlocksInVectors = ( |
            | 
            "must call the following twice:
             once to get it to recompile and again
             to be sure the recompiled version runs"
            halfTestBlocksInVectors.
            halfTestBlocksInVectors).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testCTypes = ( |
            | 
            (testIntType: 'char')     ifFalse: [ ^ 'char failed' ].
            (testIntType: 'short')    ifFalse: [ ^ 'short failed' ].
            (testIntType: 'int')      ifFalse: [ ^ 'int failed' ].
            (testIntType: 'long')     ifFalse: [ ^ 'long failed' ].
            (testFloatType: 'float')  ifFalse: [ ^ 'float failed' ].
            (testFloatType: 'double') ifFalse: [ ^ 'double failed' ].
            ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testDelete: name IfFail: fb = ( |
            | 
            'delete ' print.
            os unlink: name IfFail: [ ^ 'unlink failed-1' ].
            os_file open: name Flags: os_file flags read IfFail: [|:e|
              "fine, the file is no longer there"
              e = 'ENOENT' ifFalse: [^fb value: 'weird open error'].
              os unlink: name IfFail: [ | :e |
                e = 'ENOENT' ifFalse: [^ fb value: 'weird unlink error'].
              ].
              ^self
            ].
            fb value: 'unlink failed-2').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testExists: name IfFail: fb = ( |
            | 
            'open ' print.
            (os_file exists: name)
              ifFalse: [fb value: 'file should exist']
                 True: [self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testFile = ( | {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 f.
                }  {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 firstStar <- 0.
                }  {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 lines <- ''.
                }  {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 n1 = 20.
                }  {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 n2 = 10.
                }  {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 name <- 'theFileName'.
                }  {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 testStr = 'This is a test string. Go for the *. More stuff here. '.
                } 
            | 

            ( 'MacOS' isPrefixOf: host operatingSystem ) ifTrue: [ ^ 'ok' ].

            firstStar:  testStr findFirst: [|:c| c = '*']
                                IfPresent: [|:v. :k.| k]
                                 IfAbsent: [^ 'could not find *'].

            name:  testIsNew:     '/tmp/'                        IfFail: [|:e| ^e].
            lines: testWrite:     name  String: testStr          IfFail: [|:e| ^e].
                   testExists:    name                           IfFail: [|:e| ^e].
            f:     testOpen:      name                           IfFail: [|:e| ^e].
            f:     testLength:    f  Is: lines size              IfFail: [|:e| ^e].
                   testRead:      f  Contents: lines             IfFail: [|:e| ^e].
                   testSeek:      f  Offset: firstStar
                                     Whence: f seek_set          IfFail: [|:e| ^e].
                   testRead:      f 
                   Contents:     (lines copyFrom: firstStar UpTo: firstStar + n1)
                                                                 IfFail: [|:e| ^e].
                   testSeek:      f  Offset: n2
                                     Whence: f seek_cur          IfFail: [|:e| ^e].
                   testSeek:      f  Offset: n2 negate
                                     Whence: f seek_end          IfFail: [|:e| ^e].

                   f atEOF ifTrue: [^ 'should not be at EOF'].

                   testRead:      f  
                   Contents:      (lines copyFrom: lines size - n2
                                             UpTo: lines size)   IfFail: [|:e| ^e].
                   f close.
                   testDelete:    name                           IfFail: [|:e| ^e].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testFloatType: type = ( | {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 bv.
                }  {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 bytesize.
                }  {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 double.
                }  {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 val = 123.756.
                } 
            | 
            double:   type = 'double'.
            bv:       byteVector copySize: 100 FillingWith: 25.
            bytesize: typeSizes byteSize: type.
            bv cFloatDouble: double At:  8 Put: val.
            bv cFloatDouble: double At: 48 Put: val.
            (bv copyFrom:  8 UpTo:  8 + bytesize) = 
              (bv copyFrom: 48 UpTo: 48 + bytesize) ifFalse: [ ^false ].
            (bv copyFrom:  8 UpTo:  8 + bytesize) = 
              (bv copyFrom: 80 UpTo: 80 + bytesize) ifTrue:  [ ^false ].
            (bv cFloatDouble: double At:  8) != val ifTrue: [ ^false ].
            (bv cFloatDouble: double At: 48) != val ifTrue: [ ^false ].
            (bv cFloatDouble: double At: 80) =  val ifTrue: [ ^false ].
            ^ true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testGetpid = ( |
            | 
            os getpid < 0 ifTrue: [ ^ 'getpid returned negative' ].
            os getpid = os getpid ifFalse: [ ^ 'getpid inconsistent' ].
             ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testIntType: type = ( |
            | 
            ^ (testIntType: type Signed: false) && [testIntType: type Signed: true]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testIntType: type Signed: bool = ( |
             bitsize.
             bv.
             bytesize.
             val = 45.
            | 
            bv:       byteVector copySize: 100 FillingWith: 25.
            bitsize:  typeSizes bitSize:  type.
            bytesize: typeSizes byteSize: type.

            bv cIntSize: bitsize Signed: bool At:  8 Put: val.
            bv cIntSize: bitsize Signed: bool At: 48 Put: val.

            (bv copyFrom:  8 UpTo:  8 + bytesize) = 
              (bv copyFrom: 48 UpTo: 48 + bytesize) ifFalse: [ ^false ].
            (bv copyFrom:  8 UpTo:  8 + bytesize) = 
              (bv copyFrom: 80 UpTo: 80 + bytesize) ifTrue:  [ ^false ].

            (bv cIntSize: bitsize Signed: bool At:  8) != val ifTrue: [ ^false ].
            (bv cIntSize: bitsize Signed: bool At: 48) != val ifTrue: [ ^false ].
            (bv cIntSize: bitsize Signed: bool At: 80) =  val ifTrue: [ ^false ].
            ^ true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testIsNew: prefix IfFail: fb = ( |
             maxNameLen = 31.
             name <- ''.
             suff <- ''.
            | 
            'create ' print.
            suff: os getpid printString, '.', times real printString.
            suff: suff copySize: maxNameLen min: suff size. "mac has 31 limit"
            name: prefix, suff.
            (os_file exists: name) ifTrue: [ ^ fb value: 'EXTREMELY BAD LUCK!' ].
            name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testLength: f Is: len IfFail: fb = ( |
            | 
            f size = len ifFalse: [ ^ fb value: 'size of file wrong' ].

            f currentPosition = 0 ifFalse: [^ fb value: 'currentPosition failed-1'].
            f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testNullTerminatedStrings = ( | {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 a.
                }  {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 b.
                } 
            | 
            a: 'yep'.
            a isNullTerminated ifTrue: [ ^ 'should not be 0-terminated' ].
            b: a copyNullTerminated.
            b isNullTerminated ifFalse: [ ^ 'should be 0-terminated' ].
            b = ('yep' , 0 asCharacter) ifFalse: [ ^ 'wrong string-1' ].
            a: b copyNullTerminated.
            a = b ifFalse: [ ^ 'wrong string-2' ].
            ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testOpen: name IfFail: fb = ( |
            | 
            os_file openForReading: name IfFail: [^fb value: 'open failed']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testRead: f Contents: s IfFail: fb = ( | {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 contents <- ''.
                }  {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 start <- 0.
                } 
            | 
            'read ' print.
            start: f currentPosition.
            contents:  f readCount: s size.
            contents = s  ifFalse: [ ^ fb value: 'read wrong stuff' ].

            f currentPosition  =  (start + s size)  ifFalse: [
                ^ fb value: 'currentPosition failed-2'
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testSeek: f Offset: off Whence: wh IfFail: fb = ( | {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 e <- 0.
                }  {
                 'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
                
                 s <- 0.
                } 
            | 
            'seek ' print.
            s:  f currentPosition.
            e:  f lseekOffset: off Whence: wh.

            (wh = f seek_set)  && [e !=  off]            ifTrue: [
              ^fb value: 'seek_set failed'
            ].
            (wh = f seek_cur)  && [e != (off + s)]       ifTrue: [
              ^fb value: 'seek_cur failed'
            ].
            (wh = f seek_end)  && [e != (f size + off)]  ifTrue: [
              ^fb value: 'seek_end failed'
            ].
            f currentPosition = e                       ifFalse: [
              ^fb value: 'currentPosition failed-3'
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testTypeSizes = ( |
            | 
            typeSizes bitSize:  'self_int'.
            typeSizes bitSize:  'self_float'.
            typeSizes bitSize:  'char'.
            typeSizes bitSize:  'short'.
            typeSizes bitSize:  'int'.
            typeSizes bitSize:  'long'.
            typeSizes bitSize:  'float'.
            typeSizes bitSize:  'double'.
            typeSizes bitSize:  'void *'.
            (typeSizes byteSize: 'self_int') < 0 ifTrue: [ ^'negative size'].
            (typeSizes bitSize:  'char') > (typeSizes bitSize:  'short') ifTrue: [
              ^ 'char should not be longer than short'
            ].
            (typeSizes bitSize:  'short') > (typeSizes bitSize:  'int') ifTrue: [
              ^ 'short should not be longer than int'
            ].
            (typeSizes bitSize:  'int') > (typeSizes bitSize:  'long') ifTrue: [
              ^ 'int should not be longer than long'
            ].
            (typeSizes bitSize:  'float') > (typeSizes bitSize:  'double') ifTrue: [
              ^ 'float should not be longer than double'
            ].
            ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lowLevel' -> () From: ( | {
         'ModuleInfo: Module: lowLevelTests InitialContents: FollowSlot'
        
         testWrite: name String: str IfFail: fb = ( |
             f.
             len <- 0.
             line <- ''.
             lines <- ''.
            | 
            f: os_file createForAppend: name.
            'write ' print.
            10 do: [ | :i. | 
              line: str , 'Line ' , i printString , '.\n'.
              (f writeFrom: line Count: line size) = line size ifFalse: [ 
                ^ fb value: 'write failed'.
              ].
              lines: lines, line.
            ].
            f close.
            lines).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fModuleInfo: Module: lowLevelTests InitialContents: FollowSlot\x7fVisibility: public'
        
         nakedMethodTest = ( |
            | 
            (asMirror at: 'nakedMethodTest') contents
              _MirrorReflecteeIfFail: [^false].
            true).
        } | ) 



 '-- Side effects'

 globals modules lowLevelTests postFileIn
