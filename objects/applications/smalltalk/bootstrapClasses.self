 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'bootstrapString_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: bootstrapping\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         asSelfString = ( |
             sz.
             s.
            | 
            sz: size.
            s: self_lobby mutableString copySize: sz.
            sz do: [| :i |
              s _ByteAt: i Put: (_ByteAt: i).
            ].
            s).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'bootstrapString_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: bootstrapping\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         at: index PutByte: byteValue = ( |
            | 
            _ByteAt: index pred Put: byteValue).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'bootstrapString_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: bootstrapping\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         byteAt: index = ( |
            | 
            _ByteAt: index pred).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'bootstrapString_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: bootstrapping\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         size = ( |
            | _ByteSize).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'bootstrapString_s' -> 'my_behavior' -> () _AddSlots: ( | {
         'Category: bootstrapping\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         fromSelfString: s = ( |
             newS.
            | 
            newS:  new: s size.
            s bytesDo: [| :byte. :index. |
              newS _ByteAt: index Put: byte.
            ].
            newS).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'bootstrapSymbol_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         = aSymbol = ( |
            | selfCanonicalString _Eq: aSymbol selfCanonicalString).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'bootstrapSymbol_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         selfCanonicalString = ( |
            | selfCanonicalString_i).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'bootstrapSymbol_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         selfCanonicalString: s = ( |
            | selfCanonicalString_i: s).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'bootstrapSymbol_s' -> 'my_behavior' -> () _AddSlots: ( | {
         'Category: bootstrapping\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         intern: s = ( |
             newSym.
             canStr.
            | 
            canStr: s asSelfString canonicalize.
            newSym:  fromSelfString: canStr.
            newSym selfCanonicalString: canStr.
            newSym).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'systemDictionary_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: accessing\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         at: k = ( |
            | at: k IfAbsent: [error: 'key not found']).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'systemDictionary_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: accessing\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         at: k IfAbsent: b = ( |
            | 
            (holder_mirror at: (map_name: k) IfAbsent: [^b value]) contents reflectee).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'systemDictionary_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: accessing\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         at: k Put: v = ( |
	    n.
            |
	    n: map_name: k.
            holder_mirror at: n PutContents: v _Mirror.
	    (holder_mirror at: n) module: 'generated_by_smalltalk'.
            v).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'systemDictionary_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: enumerating\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         do: b = ( |
            | 
            holder_mirror do: [|:s| b value: s contents reflectee].
            self).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'systemDictionary_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: accessing\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         keyAtValue: val IfAbsent: b = ( |
            | 
            keysAndValuesDo: [|:k. :v. |
              (v _Eq: val) ifTrue: [^k].
            ].
            b value).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'systemDictionary_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: enumerating\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         keysAndValuesDo: b = ( |
            | 
            holder_mirror do: [|:s|
              b value: (unmap_name: s name) Value: s contents reflectee
            ].
            self).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'systemDictionary_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: enumerating\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         keysDo: b = ( |
            | 
            holder_mirror do: [|:s|
              b value: (unmap_name: s name)
            ].
            self).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'systemDictionary_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: removing\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         removeKey: k0 IfAbsent: b = ( |
             k.
             n.
             v.
            | 
            k: k0 asSelfString.
            v: at: k IfAbsent: [^b value].
            holder_mirror removeSlot: (map_name: k).
            v).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'systemDictionary_s' -> 'instance_methods' -> () _AddSlots: ( | {
         'Category: accessing\x7fModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         size = ( |
            | holder_mirror size).
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> () _AddSlots: ( | {
         'ModuleInfo: Module: bootstrapClasses InitialContents: InitializeToExpression: ((smalltalkEmulator global: \'SystemDictionary\') instance_methods)'
        
         my_behavior* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'systemDictionary_s' -> 'instance_methods' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         bootstrapClasses = bootstrap stub -> 'globals' -> 'modules' -> 'bootstrapClasses' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'bootstrapClasses' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals modules bootstrapClasses.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'bootstrapClasses' -> () _AddSlots: ( | {
         'ModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'bootstrapClasses' -> () _AddSlots: ( | {
         'ModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/smalltalk'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'bootstrapClasses' -> () _AddSlots: ( | {
         'ModuleInfo: Module: bootstrapClasses InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'bootstrapClasses' -> () _AddSlots: ( | {
         'ModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            transporter moduleDictionary resetFillingSemaphore.
            resend.postFileIn.
            smalltalkEmulator smalltalk
              at: 'String'
             Put: smalltalkEmulator global: 'BootstrapString'.
            smalltalkEmulator smalltalk
              at: 'Symbol'
             Put: smalltalkEmulator global: 'BootstrapSymbol'.).
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'bootstrapClasses' -> () _AddSlots: ( | {
         'ModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'bootstrapClasses' -> () _AddSlots: ( | {
         'ModuleInfo: Module: bootstrapClasses InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules bootstrapClasses postFileIn
