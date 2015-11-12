 '0.1.0'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


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
         'ModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (\'0.1.0\')\x7fVisibility: public'
        
         revision <- '0.1.0'.
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
        
         add: a And: b IfFail: fb = ( |
             blk.
             left.
             right.
            | 
            blk: [|:e| ^ fb value: e].
            left:  buffer char copy write: a IfFail: blk.
            right: buffer char copy write: b IfFail: blk.
            runNativeWith: left With: right IfFail: blk.
            left read).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         arity = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( | {
         'Category: caches\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (byteVector copy)'
        
         compiled <- byteVector copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( | {
         'Category: caches\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (fctProxy copy)'
        
         nativeCode <- fctProxy copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         source = '
  char add(char, char);

  void fct(char *a, char *b){
    *a = add(*a, *b);
  }

  char add(char a, char b) {
    return a + b;
  }
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addChars' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | [(add: 3 And: 4 IfFail: -1) = 7] assert. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: stack examples\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         add_uint32s = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'add_uint32s' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native add_uint32s.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'add_uint32s' -> () From: ( | {
         'Comment: for easier access\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         buffer = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'buffer' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'add_uint32s' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'add_uint32s' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (fctProxy deadCopy)'
        
         proxy <- fctProxy deadCopy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'add_uint32s' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         reloadIfFail: fb = ( |
             b.
             mc.
            | 
            mc: source value.
            proxy: fctProxy copy.
            proxy _AllocateBytes: mc size IfFail: [|:e| ^ fb value: 'Native Recompile Error: Couldn\'t allocate storage'].
            (proxy _GetSizeOfAllocatedMemory = mc size) ifFalse: [|:e| ^ fb value: 'Native Recompile Error: Size error'].
            proxy _LoadByteVector: mc AtOffset: 0 IfFail: [|:e| ^ fb value: 'Native Recompile Error: Couldn\'t load byteVector'].
            b: byteVector copySize: proxy _GetSizeOfAllocatedMemory.
            proxy _ReadByteVector: b AtOffset: 0.
            (b = mc) ifFalse: [ ^ fb value: 'Native Recompile Error: Storage failed'].
            proxy _NoOfArgs: source arity.
            (proxy _NoOfArgs = source arity) ifFalse: [ ^ fb value: 'Native Recompile Error: Arity storage error'].
            (proxy isLive) ifFalse: [ ^ fb value: 'Native Recompile Error: Compiled code not live'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'add_uint32s' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         returnIfFail: fb = ( |
             blk.
             r.
             r2.
            | 
            blk: [|:e| ^ fb value: e].
            r:   buffer uint32 copy write: 6   IfFail: blk.
            r2:  buffer uint32 copy write: 8   IfFail: blk.
            runNativeWith: r With: r2          IfFail: blk.
            r read).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'add_uint32s' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         runNativeWith: a IfFail: fb = ( |
            | 
            proxy _RunNativeWith: a Type: a nativeTypeDescriptor IfFail: [ 
              reloadIfFail: [|:e| ^ fb value: e].
              proxy _RunNativeWith: a Type: a nativeTypeDescriptor IfFail: [|:e | ^ fb value: e]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'add_uint32s' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         runNativeWith: a With: b IfFail: fb = ( |
            | 
            proxy _RunNativeWith: a  Type: a nativeTypeDescriptor 
                                 With: b Type: b nativeTypeDescriptor
                               IfFail: [
                      reloadIfFail: [|:e| ^ fb value: e].
                       proxy _RunNativeWith: a  Type: a nativeTypeDescriptor 
                                            With: b Type: b nativeTypeDescriptor
                                          IfFail: [|:e | ^ fb value: e]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'add_uint32s' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         source = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'add_uint32s' -> 'source' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native add_uint32s source.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'add_uint32s' -> 'source' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (2)'
        
         arity <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'add_uint32s' -> 'source' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'stackMachine' -> 'ia32_macos' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'add_uint32s' -> 'source' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         value = ( |
            | 
            (code copy,
              (enter: arity),
              pick1, load32,
              pick1, load32,
              add_uint32,
              store32,
              leave
            ) render).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: examples\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         helloWorld = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native helloWorld.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         arity = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'Category: caches\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (byteVector copy)'
        
         compiled <- byteVector copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'Category: caches\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (fctProxy copy)'
        
         nativeCode <- fctProxy copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         returnHelloWorldIfFail: fb = ( |
             b.
            | 
            b: byteVector copySize: 13.
            runNativeWith: b IfFail: [|:e| ^ fb value: e].
            b asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         source = '
  void fct(char*a, ... ){
    char* hw = \"Hello, World!\";
    int i;
    for(i = 0; i < 13; i++){
      a[i] = hw[i];
    } 
  }  
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | 
            [(returnHelloWorldIfFail: '') = 'Hello, World!'] assert. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: examples\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         nothing = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'nothing' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native nothing.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'nothing' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         arity = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'nothing' -> () From: ( | {
         'Category: caches\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (byteVector copy)'
        
         compiled <- byteVector copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'nothing' -> () From: ( | {
         'Category: caches\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (fctProxy copy)'
        
         nativeCode <- fctProxy copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'nothing' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'nothing' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         safelyDoNothingIfFail: fb = ( |
            | 
            runNativeIfFail: fb. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'nothing' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         source = '
  void fct(){2 + 2;}  
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'nothing' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | 
            [(safelyDoNothingIfFail: '') = self] assert. self).
        } | ) 



 '-- Side effects'

 globals modules nativeExamples postFileIn
