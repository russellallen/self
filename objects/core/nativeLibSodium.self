 '0.1.0'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: nativeLibSodium InitialContents: FollowSlot'
        
         nativeLibSodium = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'nativeLibSodium' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'preFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'nativeLibSodium' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules nativeLibSodium.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn preFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeLibSodium' -> () From: ( | {
         'ModuleInfo: Module: nativeLibSodium InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeLibSodium' -> () From: ( | {
         'ModuleInfo: Module: nativeLibSodium InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeLibSodium' -> () From: ( | {
         'ModuleInfo: Module: nativeLibSodium InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeLibSodium' -> () From: ( | {
         'ModuleInfo: Module: nativeLibSodium InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            "postFileIn" self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeLibSodium' -> () From: ( | {
         'ModuleInfo: Module: nativeLibSodium InitialContents: FollowSlot'
        
         preFileIn = ( |
            | "preFileIn" self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeLibSodium' -> () From: ( | {
         'ModuleInfo: Module: nativeLibSodium InitialContents: InitializeToExpression: (\'0.1.0\')\x7fVisibility: public'
        
         revision <- '0.1.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeLibSodium' -> () From: ( | {
         'ModuleInfo: Module: nativeLibSodium InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: external libraries\x7fModuleInfo: Module: nativeLibSodium InitialContents: FollowSlot'
        
         libsodium = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'libsodium' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native libsodium.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'libsodium' -> () From: ( | {
         'ModuleInfo: Module: nativeLibSodium InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'libsodium' -> () From: ( | {
         'ModuleInfo: Module: nativeLibSodium InitialContents: FollowSlot'
        
         randombytes_random = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'libsodium' -> 'randombytes_random' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native libsodium randombytes_random.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'libsodium' -> 'randombytes_random' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeLibSodium InitialContents: FollowSlot'
        
         arity = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'libsodium' -> 'randombytes_random' -> () From: ( | {
         'Category: caches\x7fModuleInfo: Module: nativeLibSodium InitialContents: InitializeToExpression: (byteVector copy)'
        
         compiled <- byteVector copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'libsodium' -> 'randombytes_random' -> () From: ( | {
         'ModuleInfo: Module: nativeLibSodium InitialContents: FollowSlot'
        
         functionProxyIfFail: fb = ( |
            | proxyForFunction: 'randombytes_random' Library: '/usr/local/lib/libsodium.dylib' IfFail: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'libsodium' -> 'randombytes_random' -> () From: ( | {
         'Category: caches\x7fModuleInfo: Module: nativeLibSodium InitialContents: InitializeToExpression: (fctProxy copy)'
        
         nativeCode <- fctProxy copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'libsodium' -> 'randombytes_random' -> () From: ( | {
         'ModuleInfo: Module: nativeLibSodium InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'cNativeParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'libsodium' -> 'randombytes_random' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: nativeLibSodium InitialContents: FollowSlot'
        
         source = '
  void cpy(char* to, char* from, int size);

  void fct(char* a, int(f)() ){
    int r = f();
    cpy(a, (char*)&r, 4);
  } 
  
  void cpy(char* to, char* from, int size){
    for(int i = 0; i < size; i++)
      to[i] = from[i];
  }  
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'libsodium' -> 'randombytes_random' -> () From: ( | {
         'ModuleInfo: Module: nativeLibSodium InitialContents: FollowSlot\x7fVisibility: public'
        
         valueIfFail: fb = ( |
            | 
            (
            runNativeReturning: buffer uint32 copy
                          With: (functionProxyIfFail: [|:e| ^ fb value: e])
                        IfFail: [|:e| ^ fb value: e].
            ) read).
        } | ) 



 '-- Side effects'

 globals modules nativeLibSodium postFileIn
