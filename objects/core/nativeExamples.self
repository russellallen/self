 '$Revision:$'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         nativeExamples = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'nativeExamples' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'nativeExamples' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules nativeExamples.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeExamples' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeExamples' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeExamples' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeExamples' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeExamples' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeExamples' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: examples\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         addChars = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native addChars.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( | {
         'Comment: Add two chars together and return result\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         add: a And: b = ( |
            | 
            host osName  = 'macOSX' 
              ifTrue: [osxAdd: a And: b]
               False: [unknownPlatform]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         osxAdd: a And: b = ( |
             result.
            | 
            (osxNativeMethod isForSource: osxSource)
              ifFalse: [recompile].

            result: byteVector copySize: 1.
            osxNativeMethod
                valueWith: result 
                     With: ((byteVector copySize: 1) writeByte: a) 
                     With: ((byteVector copySize: 1) writeByte: b).
            result readByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (native support nativeMethod 
    copyForBytes: \'\\x55\\x89\\xe5\\x8b\\x45\\x08\\x8b\\x4d\\x0c\\x8b\\x55\\x10\\x8a\\x12\\x02\\x11\\x88\\x10\\x5d\\xc3\\x66\\x66\\x66\\x2e\\x0f\\x1f\\x84\\x00\\x00\\x00\\x00\\x00\\x55\\x89\\xe5\\x8a\\x45\\x0c\\x02\\x45\\x08\\x0f\\xbe\\xc0\\x5d\\xc3\\x00\\x00\\x06\\x00\\x00\\x00\\x0f\\x01\\x00\\x00\\x20\\x00\\x00\\x00\\x01\\x00\\x00\\x00\\x0f\\x01\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x5f\\x66\\x63\\x74\\x00\\x5f\\x61\\x64\\x64\\x00\\x00\' asByteVector
           Arity: 3
        SafeCPUs: (collector copyFirst: (\'x86\')) asSet
         SafeOSs: (collector copyFirst: (\'macOSX\')) asSet
          Source: \'
  char add(char, char);

  void fct(char *a, char *b, char *c, ... ){
    *a = add(*b, *c);
  }

  char add(char a, char b) {
    return a + b;
  }
\')'
        
         osxNativeMethod <- native support nativeMethod 
    copyForBytes: '\x55\x89\xe5\x8b\x45\x08\x8b\x4d\x0c\x8b\x55\x10\x8a\x12\x02\x11\x88\x10\x5d\xc3\x66\x66\x66\x2e\x0f\x1f\x84\x00\x00\x00\x00\x00\x55\x89\xe5\x8a\x45\x0c\x02\x45\x08\x0f\xbe\xc0\x5d\xc3\x00\x00\x06\x00\x00\x00\x0f\x01\x00\x00\x20\x00\x00\x00\x01\x00\x00\x00\x0f\x01\x00\x00\x00\x00\x00\x00\x00\x5f\x66\x63\x74\x00\x5f\x61\x64\x64\x00\x00' asByteVector
           Arity: 3
        SafeCPUs: (collector copyFirst: ('x86')) asSet
         SafeOSs: (collector copyFirst: ('macOSX')) asSet
          Source: '
  char add(char, char);

  void fct(char *a, char *b, char *c, ... ){
    *a = add(*b, *c);
  }

  char add(char a, char b) {
    return a + b;
  }
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         osxSource = '
  char add(char, char);

  void fct(char *a, char *b, char *c, ... ){
    *a = add(*b, *c);
  }

  char add(char a, char b) {
    return a + b;
  }
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         recompile = ( |
            | 
            osxNativeMethod: (native support nativeMethod
            copyForC: osxSource Arity: 3). self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | testAdd. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         testAdd = ( |
            | 
            [(add: 3 And: 4) = 7] assert. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         unknownPlatform = ( |
            | error: 'Native code unavailable for: ', host os).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: examples\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         fastUnsafeAddChars = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'fastUnsafeAddChars' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native fastUnsafeAddChars.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'fastUnsafeAddChars' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         add: a And: b = ( |
             c.
             d.
             result.
            | 
            result: bvTemplate _Clone.
            c: bvTemplate _Clone _CUnsignedIntSize: 8 At: 0 Put: a IfFail: [error: 'Bad Byte'].
            d: bvTemplate _Clone _CUnsignedIntSize: 8 At: 0 Put: b IfFail: [error: 'Bad Byte'].
            osxNativeMethod
              unsafeValueWith: result 
                         With: ((byteVector copySize: 1) writeByte: a) 
                         With: ((byteVector copySize: 1) writeByte: b)
                         With: bvTemplate
                         With: bvTemplate
                         With: bvTemplate
                         With: bvTemplate
                         With: bvTemplate.
            result _CUnsignedIntSize: 8 At: 0 IfFail: [error: 'Bad Byte']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'fastUnsafeAddChars' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (byteVector copySize: 1)'
        
         bvTemplate = byteVector copySize: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'fastUnsafeAddChars' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (native support nativeMethod 
    copyForBytes: \'\\x55\\x89\\xe5\\x8b\\x45\\x08\\x8b\\x4d\\x0c\\x8b\\x55\\x10\\x8a\\x12\\x02\\x11\\x88\\x10\\x5d\\xc3\\x66\\x66\\x66\\x2e\\x0f\\x1f\\x84\\x00\\x00\\x00\\x00\\x00\\x55\\x89\\xe5\\x8a\\x45\\x0c\\x02\\x45\\x08\\x0f\\xbe\\xc0\\x5d\\xc3\\x00\\x00\\x06\\x00\\x00\\x00\\x0f\\x01\\x00\\x00\\x20\\x00\\x00\\x00\\x01\\x00\\x00\\x00\\x0f\\x01\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x5f\\x66\\x63\\x74\\x00\\x5f\\x61\\x64\\x64\\x00\\x00\' asByteVector
           Arity: 3
        SafeCPUs: (collector copyFirst: (\'x86\')) asSet
         SafeOSs: (collector copyFirst: (\'macOSX\')) asSet
          Source: \'
  char add(char, char);

  void fct(char *a, char *b, char *c, ... ){
    *a = add(*b, *c);
  }

  char add(char a, char b) {
    return a + b;
  }
\')'
        
         osxNativeMethod <- native support nativeMethod 
    copyForBytes: '\x55\x89\xe5\x8b\x45\x08\x8b\x4d\x0c\x8b\x55\x10\x8a\x12\x02\x11\x88\x10\x5d\xc3\x66\x66\x66\x2e\x0f\x1f\x84\x00\x00\x00\x00\x00\x55\x89\xe5\x8a\x45\x0c\x02\x45\x08\x0f\xbe\xc0\x5d\xc3\x00\x00\x06\x00\x00\x00\x0f\x01\x00\x00\x20\x00\x00\x00\x01\x00\x00\x00\x0f\x01\x00\x00\x00\x00\x00\x00\x00\x5f\x66\x63\x74\x00\x5f\x61\x64\x64\x00\x00' asByteVector
           Arity: 3
        SafeCPUs: (collector copyFirst: ('x86')) asSet
         SafeOSs: (collector copyFirst: ('macOSX')) asSet
          Source: '
  char add(char, char);

  void fct(char *a, char *b, char *c, ... ){
    *a = add(*b, *c);
  }

  char add(char a, char b) {
    return a + b;
  }
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'fastUnsafeAddChars' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         osxSource = '
  char add(char, char);

  void fct(char *a, char *b, char *c, ... ){
    *a = add(*b, *c);
  }

  char add(char a, char b) {
    return a + b;
  }
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'fastUnsafeAddChars' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'fastUnsafeAddChars' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         recompile = ( |
            | 
            osxNativeMethod: (native support nativeMethod
            copyForC: osxSource Arity: 3). self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'fastUnsafeAddChars' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | testAdd. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'fastUnsafeAddChars' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         testAdd = ( |
            | 
            [(add: 3 And: 4) = 7] assert. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: examples\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         helloWorld = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native helloWorld.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         osxNativeMethod <- native support nativeMethod 
                copyForBytes: '\x55\x89\xe5\x8b\x45\x08\xc6\x00\x48\xc6\x40\x01\x65\xc6\x40\x02\x6c\xc6\x40\x03\x6c\xc6\x40\x04\x6f\xc6\x40\x05\x2c\xc6\x40\x06\x20\xc6\x40\x07\x57\xc6\x40\x08\x6f\xc6\x40\x09\x72\xc6\x40\x0a\x6c\xc6\x40\x0b\x64\xc6\x40\x0c\x21\x89\xec\x5d\xc3' asByteVector
                       Arity: 1
                    SafeCPUs: (collector copyFirst: ('x86')) asSet
                     SafeOSs: (collector copyFirst: ('macOSX')) asSet
                      Source: '
USE32

; Callee responsibilities:
PUSH  EBP       ; store callers EBP
MOV   EBP, ESP  ; save current stack pointer in EBP

; ... Code ...
MOV  EAX, [EBP + 8] ; Load parameter 0 into EAX
MOV  [EAX],    byte 72
MOV  [EAX+1],  byte 101
MOV  [EAX+2],  byte 108
MOV  [EAX+3],  byte 108
MOV  [EAX+4],  byte 111
MOV  [EAX+5],  byte 44
MOV  [EAX+6],  byte 32
MOV  [EAX+7],  byte 87
MOV  [EAX+8],  byte 111
MOV  [EAX+9],  byte 114
MOV  [EAX+10], byte 108
MOV  [EAX+11], byte 100
MOV  [EAX+12], byte 33


; Callee responsibilities:
MOV   ESP, EBP  ; remove an unknown number of local data elements
POP   EBP       ; restore callers EBP
RET             ; return
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         osxSource = '
USE32

; Callee responsibilities:
PUSH  EBP       ; store callers EBP
MOV   EBP, ESP  ; save current stack pointer in EBP

; ... Code ...
MOV  EAX, [EBP + 8] ; Load parameter 0 into EAX
MOV  [EAX],    byte 72
MOV  [EAX+1],  byte 101
MOV  [EAX+2],  byte 108
MOV  [EAX+3],  byte 108
MOV  [EAX+4],  byte 111
MOV  [EAX+5],  byte 44
MOV  [EAX+6],  byte 32
MOV  [EAX+7],  byte 87
MOV  [EAX+8],  byte 111
MOV  [EAX+9],  byte 114
MOV  [EAX+10], byte 108
MOV  [EAX+11], byte 100
MOV  [EAX+12], byte 33


; Callee responsibilities:
MOV   ESP, EBP  ; remove an unknown number of local data elements
POP   EBP       ; restore callers EBP
RET             ; return
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         osxValue = ( |
             x.
            | 
            x: byteVector copySize: 13.
            (osxNativeMethod isForSource: osxSource)
              ifFalse: [recompile].
            osxNativeMethod valueWith: x.
            x asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         recompile = ( |
            | 
             osxNativeMethod: (native support nativeMethod
            copyForx86Asm: osxSource Arity: 1). self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | [value = 'Hello, World!'] assert. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         unknownValue = ( |
            | error: 'Native code unavailable for: ', host os).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         value = ( |
            | 
            host osName  = 'macOSX' 
              ifTrue: [osxValue]
               False: [unknownValue]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: examples\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         helloWorldC = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'helloWorldC' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native helloWorldC.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorldC' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         osxNativeMethod <- native support nativeMethod 
                copyForBytes: '\x55\x89\xe5\x8b\x45\x08\xc7\x00\x48\x65\x6c\x6c\xc7\x40\x04\x6f\x2c\x20\x57\xc7\x40\x08\x6f\x72\x6c\x64\xc6\x40\x0c\x21\x5d\xc3\x01\x00\x00\x00\x0f\x01\x00\x00\x00\x00\x00\x00\x00\x5f\x66\x63\x74\x00\x00\x00' asByteVector
                       Arity: 1
                    SafeCPUs: (collector copyFirst: ('x86')) asSet
                     SafeOSs: (collector copyFirst: ('macOSX')) asSet
                      Source: '
  void fct(char*a, ... ){
    char* hw = \"Hello, World!\";
    int i;
    for(i = 0; i < 13; i++){
      a[i] = hw[i];
    } 
  }  
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorldC' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         osxSource = '
  void fct(char*a, ... ){
    char* hw = \"Hello, World!\";
    int i;
    for(i = 0; i < 13; i++){
      a[i] = hw[i];
    } 
  }  
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorldC' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         osxValue = ( |
             x.
            | 
            x: byteVector copySize: 13.
            (osxNativeMethod isForSource: osxSource)
              ifFalse: [recompile].
            osxNativeMethod valueWith: x.
            x asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorldC' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorldC' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         recompile = ( |
            | 
             osxNativeMethod: (native support nativeMethod
            copyForC: osxSource Arity: 1). self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorldC' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | [value = 'Hello, World!'] assert. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorldC' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         unknownValue = ( |
            | error: 'Native code unavailable for: ', host os).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorldC' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         value = ( |
            | 
            host osName  = 'macOSX' 
              ifTrue: [osxValue]
               False: [unknownValue]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: examples\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         sqliteVersion = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersion' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native sqliteVersion.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersion' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         addressOfFct = ( |
             bv.
            | 
            bv: byteVector copySize: 4.
            fct _PointerInByteVector: bv.
            bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersion' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         clean = ( |
            | 
            lib: nil. fct: proxy deadCopy. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersion' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         cleanAll = ( |
            | 
            clean. osxNativeMethod: native support nativeMethod. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersion' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (proxy deadCopy)'
        
         fct <- proxy deadCopy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersion' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (proxy)'
        
         lib <- bootstrap stub -> 'globals' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersion' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         loadFct = ( |
            | fct: lib lookupFunction: 'sqlite3_libversion_number').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersion' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         loadLib = ( |
            | lib: foreignCodeDB at: '/usr/lib/libsqlite3.dylib' IfFail: [|:e| error: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersion' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (native support nativeMethod)'
        
         osxNativeMethod <- bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersion' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         osxSource = '
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
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersion' -> () From: ( | {
         'Category: support\x7fComment: Should probably return 3007012 on a recent OS X\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         osxSqliteVersion = ( |
             res.
            | 
            fct isLive ifFalse: [clean loadLib loadFct].
            res: byteVector copySize: 4.

            (osxNativeMethod isForSource: osxSource)
              ifFalse: [recompile].

            osxNativeMethod valueWith: addressOfFct With: res.
            res readInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersion' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersion' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         recompile = ( |
            | 
            osxNativeMethod: (native support nativeMethod
            copyForx86Asm: osxSource Arity: 2). self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersion' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         sqliteVersion = ( |
            | 
            host osName  = 'macOSX' 
              ifTrue: [osxSqliteVersion]
               False: [unknownPlatform]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersion' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         unknownPlatform = ( |
            | error: 'Native code unavailable for: ', host os).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: examples\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         sqliteVersionC = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersionC' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native sqliteVersionC.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersionC' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         addressOfFct = ( |
             bv.
            | 
            bv: byteVector copySize: 4.
            fct _PointerInByteVector: bv.
            bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersionC' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         clean = ( |
            | 
            lib: nil. fct: proxy deadCopy. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersionC' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         cleanAll = ( |
            | 
            clean. osxNativeMethod: native support nativeMethod. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersionC' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (proxy deadCopy)'
        
         fct <- proxy deadCopy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersionC' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (proxy)'
        
         lib <- bootstrap stub -> 'globals' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersionC' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         loadFct = ( |
            | fct: lib lookupFunction: 'sqlite3_libversion_number').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersionC' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         loadLib = ( |
            | lib: foreignCodeDB at: '/usr/lib/libsqlite3.dylib' IfFail: [|:e| error: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersionC' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (native support nativeMethod)'
        
         osxNativeMethod <- bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'nativeMethod' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersionC' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         osxSource = ' 
      void fct(int(**a)(), int *b, ...){
        *b = (**a)();
      }
    '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersionC' -> () From: ( | {
         'Category: support\x7fComment: Should probably return 3007012 on a recent OS X\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         osxSqliteVersion = ( |
             res.
            | 
            fct isLive ifFalse: [clean loadLib loadFct].
            res: byteVector copySize: 4.

            (osxNativeMethod isForSource: osxSource)
              ifFalse: [recompile].

            osxNativeMethod valueWith: addressOfFct With: res.
            res readInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersionC' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersionC' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         recompile = ( |
            | 
            osxNativeMethod: (native support nativeMethod
            copyForC: osxSource Arity: 2). self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersionC' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         sqliteVersion = ( |
            | 
            host osName  = 'macOSX' 
              ifTrue: [osxSqliteVersion]
               False: [unknownPlatform]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'sqliteVersionC' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         unknownPlatform = ( |
            | error: 'Native code unavailable for: ', host os).
        } | ) 



 '-- Side effects'

 globals modules nativeExamples postFileIn
