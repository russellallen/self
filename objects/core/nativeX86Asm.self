 '$Revision:$'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: nativeX86Asm InitialContents: FollowSlot'
        
         nativeX86Asm = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'nativeX86Asm' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'nativeX86Asm' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules nativeX86Asm.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeX86Asm' -> () From: ( | {
         'ModuleInfo: Module: nativeX86Asm InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeX86Asm' -> () From: ( | {
         'ModuleInfo: Module: nativeX86Asm InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeX86Asm' -> () From: ( | {
         'ModuleInfo: Module: nativeX86Asm InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeX86Asm' -> () From: ( | {
         'ModuleInfo: Module: nativeX86Asm InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeX86Asm' -> () From: ( | {
         'ModuleInfo: Module: nativeX86Asm InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeX86Asm' -> () From: ( | {
         'ModuleInfo: Module: nativeX86Asm InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> () From: ( | {
         'ModuleInfo: Module: nativeX86Asm InitialContents: FollowSlot'
        
         x86asm = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'x86asm' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support x86asm.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'x86asm' -> () From: ( | {
         'Category: private state\x7fModuleInfo: Module: nativeX86Asm InitialContents: FollowSlot'
        
         i <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'x86asm' -> () From: ( | {
         'Category: private state\x7fModuleInfo: Module: nativeX86Asm InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         labels <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'x86asm' -> () From: ( | {
         'ModuleInfo: Module: nativeX86Asm InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'x86asm' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native support x86asm parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'x86asm' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: nativeX86Asm InitialContents: FollowSlot'
        
         bytes = ( |
            | rawBytes copyFrom: 0 UpTo: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'x86asm' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: nativeX86Asm InitialContents: FollowSlot'
        
         copy = ( |
            | 
            ((resend.copy rawBytes: byteVector copySize: 1000) 
            i: 0) labels: dictionary copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'x86asm' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: nativeX86Asm InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'x86asm' -> 'parent' -> () From: ( | {
         'Category: instructions\x7fModuleInfo: Module: nativeX86Asm InitialContents: FollowSlot'
        
         ret = ( |
            | 
            rawBytes size > i ifFalse: [rawBytes: rawBytes, (byteVector copySize: rawBytes size * 2 FillingWith: 0)].
            rawBytes at: i Put: 16rC3.
            i: i succ.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> 'support' -> 'x86asm' -> () From: ( | {
         'Category: private state\x7fModuleInfo: Module: nativeX86Asm InitialContents: InitializeToExpression: (byteVector)'
        
         rawBytes <- bootstrap stub -> 'globals' -> 'byteVector' -> ().
        } | ) 



 '-- Side effects'

 globals modules nativeX86Asm postFileIn
