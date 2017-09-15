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
        
         addFloats = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'addFloats' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native addFloats.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addFloats' -> () From: ( | {
         'Comment: Add two chars together and return result\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         add: a And: b IfFail: fb = ( |
            | runNativeWith: a With: b IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addFloats' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         arity = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addFloats' -> () From: ( | {
         'Category: caches\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (byteVector copy)'
        
         compiled <- byteVector copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addFloats' -> () From: ( | {
         'Category: caches\x7fModuleInfo: Module: nativeExamples InitialContents: InitializeToExpression: (fctProxy copy)'
        
         nativeCode <- fctProxy copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addFloats' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addFloats' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         source = '
   oop fct(oop this, oop l, oop r, void *useful[], void *FH ){
     return FLOAT_TO_OOP(OOP_TO_FLOAT(l) + OOP_TO_FLOAT(r));
   }
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addFloats' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | 
            [(add: 3.0 And: 4.0 IfFail: -1) = 7.0] assert. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addFloats' -> () From: ( | {
         'Comment: We\'re running about 20x slower than handcrafted.\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         testSlowdown = ( |
             a.
             b.
             c = 1000000.
             d <- 3.0.
             e <- 4.0.
            | 
            a: [c do: [add: d And: e IfFail: [|:e| e]]] time.
            b: [c do: [d + e]] time.
            a / b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: examples\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         addSmallInts <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'addSmallInts' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native addSmallInts.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addSmallInts' -> () From: ( | {
         'Comment: Add two chars together and return result\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         add: a And: b IfFail: fb = ( |
            | runNativeWith: a With: b IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addSmallInts' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         source = '
   oop fct(oop this, oop l, oop r, void *useful[], void *FH ){
     //if (!IS_SMI(l)){ FAILURE(FH, BADTYPEERROR);  return NULL; };
     //if (!IS_SMI(r)){ FAILURE(FH, BADTYPEERROR);  return NULL; };

     // https://www.securecoding.cert.org/confluence/display/c/INT32-C.+Ensure+that+operations+on+signed+integers+do+not+result+in+overflow
     int32_t a = (int32_t) l;
     int32_t b = (int32_t) r;
     if (((b > 0) && (a > (SMI_MAX - b))) ||
         ((b < 0) && (a < (SMI_MIN - b)))) {
            FAILURE(FH, OVERFLOWERROR);  return NULL;
     } else {
       return (oop) (a + b);
     }
   }
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'addSmallInts' -> () From: ( | {
         'Comment: We\'re running about 20x - 120x slower than handcrafted.\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         testSlowdown = ( |
             a.
             b.
             c = 1000000.
             d <- 3.
             e <- 4.
            | 
            a: [c do: [add: d And: e IfFail: [|:e| e]]] time.
            b: [c do: [d + e]] time.
            a / b).
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
            | 
            runNativeWith: '             ' copyMutable 
                   IfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         source = '
  oop fct(oop this, oop byteV, void *useful[],void *FH){
    if (BV_LENGTH(byteV) < 13) {
       FAILURE(FH, BADSIZEERROR);  return NULL; }
    uint8_t *hw = BV_CHAR(byteV);
    char *h  = \"Hello, world!\";
    for(int i = 0; i < 13; i++){
      hw[i] = h[i];
    }
    return byteV;
  }
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'helloWorld' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | 
            [(returnHelloWorldIfFail: '') = 'Hello, world!'] assert. self).
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
            runNativeIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'nothing' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         source = '
  oop fct(oop this, void *useful[], void* FB){return this;}  
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'nothing' -> () From: ( | {
         'ModuleInfo: Module: nativeExamples InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | 
            [(safelyDoNothingIfFail: '') = nativeCode] assert. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: examples\x7fModuleInfo: Module: nativeExamples InitialContents: FollowSlot'
        
         testExamples = ( |
            | 
            addSmallInts test.
            helloWorld test.
            nothing test.
            self).
        } | ) 



 '-- Side effects'

 globals modules nativeExamples postFileIn
