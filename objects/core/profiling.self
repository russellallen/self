 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: profiling\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         callCount = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'callCount' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals callCount.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'callCount' -> () From: ( | {
         'Comment: data accesses (data/assignment/constant slots)\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         access <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'callCount' -> () From: ( | {
         'Comment: block method invocations\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         blocks <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'callCount' -> () From: ( | {
         'Comment: all methods (normal or otherwise) w/DI influence\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         di <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'callCount' -> () From: ( | {
         'Comment: number of DI misses\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         diMisses <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'callCount' -> () From: ( | {
         'Comment: number of inline cache misses\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         misses <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'callCount' -> () From: ( | {
         'Comment: normal method invocations (non-access/DI/block)\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         normal <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: profiling\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         callCount = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'callCount' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits callCount.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'callCount' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'callCount' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'callCount' -> () From: ( | {
         'Comment: number of sends from polymorphic call sites\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         polymorphic <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: profiling\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         compilerProfiling = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'compilerProfiling' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals compilerProfiling.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'compilerProfiling' -> () From: ( | {
         'Comment: stop  VM Compiler profiling\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         off = ( |
            | _VMCompilerProfiling: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'compilerProfiling' -> () From: ( | {
         'Comment: start VM Compiler profiling\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         on = ( |
            | _VMCompilerProfiling: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'compilerProfiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: profiling\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         flatProfiling = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'flatProfiling' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals flatProfiling.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'flatProfiling' -> () From: ( | {
         'Comment: stop  flat profiling\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         off = ( |
            | _FlatProfile: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'flatProfiling' -> () From: ( | {
         'Comment: start flat profiling\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         on = ( |
            | _FlatProfile: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: profiling\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         profiling = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'profiling' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiling.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'flatProfiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'profiling' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'flatProfiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         print: n = ( |
            | _PrintFlatProfile: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'flatProfiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         reset = ( |
            | _ResetFlatProfile).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot'
        
         profiling = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'profiling' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'profiling' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules profiling.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: profiling\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         profiling = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profiling.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         methodCalls = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profiling' -> 'methodCalls' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profiling methodCalls.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> 'methodCalls' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         access = ( |
            | _NumberOfAccessMethodCalls).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> 'methodCalls' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         blocks = ( |
            | _NumberOfBlockMethodCalls).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> 'methodCalls' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         counting = ( |
            | _CountSends).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> 'methodCalls' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         counting: flag = ( |
            | _CountSends: flag).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> 'methodCalls' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         di = ( |
            | _NumberOfDIMethodCalls).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> 'methodCalls' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         diMisses = ( |
            | _NumberOfDIMisses).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> 'methodCalls' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         misses = ( |
            | _NumberOfICMisses).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> 'methodCalls' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         monomorphicSends = ( |
            | total - polymorphicSends).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> 'methodCalls' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         normal = ( |
            | _NumberOfMethodCalls).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> 'methodCalls' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         polymorphicSends = ( |
            | _NumberOfPICSends).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> 'methodCalls' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         reset = ( |
            | 
            _NumberOfMethodCalls: 0.
            _NumberOfAccessMethodCalls: 0.
            _NumberOfBlockMethodCalls: 0.
            _NumberOfBlockClones: 0.
            _NumberOfDIMethodCalls: 0.
            _NumberOfPICSends: 0.
            _NumberOfICMisses: 0.
            _NumberOfDIMisses: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> 'methodCalls' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         total = ( |
            | normal + access + di + blocks).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'Comment: stop profiling\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         off = ( |
            | process this _Profile: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'Comment: start profiling current process\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         on = ( |
            | process this _Profile: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'profiling' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'Comment: profiling takes three optional parameters: 
       cutoff: methods consuming a smaller fraction than cutoff will not be displayed
               e.g. 0.02 will prune the calling tree so that no leaf has < 2% of the
               total time
       skip:   the minimal difference between caller and callee. E.g. if the real
               (measured) call tree is
                     100.0%  method
                       99.9%   methodB
                         99.8%   methodC
               then a skip value of 0.002 (= 0.2%) will display the profile
                     100.0%  methodA
                       99.8%   methodC
               That is, methodB is skipped because it is considered uninteresting.
       depth:  The call tree will only be displayed up to this depth.\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         print = ( |
            | print: 0.02).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         print: cutoff = ( |
            | print: cutoff Skip: 0.01).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         print: cutoff Skip: skip = ( |
            | print: cutoff Skip: skip MaxDepth: 20).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         print: cutoff Skip: skip MaxDepth: depth = ( |
            | 
            _PrintProfileCutoff: cutoff Skip: skip MaxDepth: depth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         reset = ( |
            | _ResetProfile).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: profiling\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         vmProfiling = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'vmProfiling' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals vmProfiling.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'vmProfiling' -> () From: ( | {
         'Comment: stop  VM profiling\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         off = ( |
            | _VMProfiling: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'vmProfiling' -> () From: ( | {
         'Comment: start VM profiling\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         on = ( |
            | _VMProfiling: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'vmProfiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'callCount' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         + other = ( |
            | 
            copyNormal:    normal + other normal
             Access:       access + other access
             Blocks:       blocks + other blocks
             Di:           di + other di
             Poly:         polymorphic + other polymorphic
             Misses:       misses + other misses
             DiMisses:     diMisses + other diMisses).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'callCount' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         - other = ( |
            | 
            copyNormal:    normal - other normal
             Access:       access - other access
             Blocks:       blocks - other blocks
             Di:           di - other di
             Poly:         polymorphic - other polymorphic
             Misses:       misses - other misses
             DiMisses:     diMisses - other diMisses).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'callCount' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         callPrintString = ( |
            | 
            ((normal printString, ' method calls\n') &
             (blocks printString, ' block method calls\n') &
             (access printString, ' access method calls\n') &
             (di     printString, ' di method calls\n') &
             (total  printString, ' total method calls\n')) flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'callCount' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         copyCurrent = ( |
            | 
            "try to not disturb the results - call primitives directly"
             copyNormal:     _NumberOfMethodCalls
               Access:       _NumberOfAccessMethodCalls
               Blocks:       _NumberOfBlockMethodCalls
               Di:           _NumberOfDIMethodCalls
               Poly:         _NumberOfPICSends
               Misses:       _NumberOfICMisses
               DiMisses:     _NumberOfDIMisses).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'callCount' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         copyNormal: n Access: a Blocks: b Di: d Poly: p Misses: m DiMisses: dm = ( | {
                 'ModuleInfo: Module: profiling InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: copy.
            r normal: n.
            r access: a.
            r blocks: b.
            r di: d.
            r polymorphic: p.
            r misses: m.
            r diMisses: dm.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'callCount' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         missPrintString = ( |
            | 
            "PIC counting doesn't work right now -- Urs 8/93"
            ("(polymorphic printString, ' calls from polymorphic call sites\n') &"
             (misses      printString, ' inline cache misses\n') &
             (diMisses    printString, ' DI misses\n')) flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'callCount' -> () From: ( | {
         'Comment: number of sends from monomorphic call sites\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         monomorphic = ( |
            | total - polymorphic).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'callCount' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'callCount' -> () From: ( | {
         'Comment: total number of sends\x7fModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: public'
        
         total = ( |
            | normal + access + blocks + di).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiling' -> () From: ( | {
         'ModuleInfo: Module: profiling InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 



 '-- Side effects'

 globals modules profiling postFileIn
