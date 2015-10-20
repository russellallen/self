 '30.17.0'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: block InitialContents: FollowSlot'
        
         block = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'block' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'block' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules block.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: block InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: block InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: block InitialContents: InitializeToExpression: (\'30.17.0\')\x7fVisibility: public'
        
         revision <- '30.17.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'blockTests
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         block = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'block' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits block.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         allTimes = ( |
            | 
            timingResults copy runBlock: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: report an error if I evaluate to false\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         assert = ( |
            | 
            assert: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: report an error if I evaluate to false\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         assert: message = ( |
            | 
            value ifFalse: [ | vmm |
                vmm: (reflect: self) valueSlot contents.
                error: 
                'assertion failed: ',
                message,
                (message isEmpty ifTrue: '' False: ': '), 
                vmm file, ': ', vmm line printString, ' ',
                '[ ', vmm source, ' ] ' .
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fCategory: VM measurements\x7fComment: turn VM Compiler profiling on during the block\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         compilerProfile = ( |
             r.
            | 
            compilerProfiling on.
            r: value.
            compilerProfiling off.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fCategory: VM measurements\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         countLookupMisses = ( |
             a <- 0.
             b <- 0.
             c <- 0.
             r.
            | 
              a: _NumberOfFastLookupMisses.
              b: _NumberOfICMisses.
              c: _NumberOfMegamorphicPICMisses.
              r: value.
              ('Misses with fast lookup cache function:', (
                _NumberOfFastLookupMisses - a) printString ) printLine.
              ('Number of inline cache misses:', (
                _NumberOfICMisses - b) printString ) printLine.
              ('Number of PIC misses because of megamorphism:', (
                _NumberOfMegamorphicPICMisses - c) printString ) printLine.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fCategory: VM measurements\x7fComment: count sends during exeuction of receiver and display results
for meaningful results, code must have been compiled with
_GenerateCountCode: true\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         countSends = ( |
             count.
             cs.
             r.
            | 
            count: callCount copyCurrent.
            "call _CountSends prim directly to make result more accurate"
            cs: _CountSends: true.    
            r: value.
            _CountSends: false.
            count: callCount copyCurrent - count.
            count callPrintString print.
            count missPrintString print.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fComment: elapsed cpu time (msec)\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         cpuTime = ( |
             t.
            | 
            t: times cpu.
            value.
            times cpu - t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: if the block\'s argument is evaluated, exit the block, returning nil\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         exit = ( |
            | value: [ ^ nil ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: same as exit, except return a value\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         exitValue = ( |
            | value: [ | :x | ^ x ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fCategory: feedbackMediation\x7fComment: receiver block takes one argument, which when evaluated aborts
         the feedback mediation\x7fModuleInfo: Module: block InitialContents: FollowSlot'
        
         feedbackMediateCPU: frac Increase: iblock Decrease: dblock ResetEvery: t = ( |
            | 
            process this startTiming.
            value: [ process this stopTiming. ^ self ].
            process this cpuUse
              compare: frac IfLess: iblock Equal: [] Greater: dblock.
            process this stopTiming.
            process this totalTime > t ifTrue: [ process this resetTiming ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         flatProfile = ( |
            | 
            p: getProfile.
            p printFlat.
            p reset.       
            p blockResult).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: The obvious implementation of fork, namely:
  (message copy receiver: self Selector: \'value\') fork resume
is not provided, because Self 4.0 does not support non-LIFO blocks.
This means that if you were to use this method, the resulting process
might die at some later time when it tried to access a variable in
the enclosing method (or an enclosing block), if that method had
returned.\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         fork = ( |
            | 
            error: 'fork on blocks not supported in Self because non-LIFO block do not work.
            Use fork in traits message instead.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fCategory: VM measurements\x7fComment: low-level profile for VM debugging\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         fprof = ( |
             count1.
             count2.
             r.
             t.
            | 
            profiling methodCalls counting
                ifTrue: [ count1: callCount copyCurrent ].
            flatProfiling reset.
            flatProfiling on.
            t: times cpu.
            r: value.
            t: times cpu - t.
            flatProfiling off.
            profiling methodCalls counting
                ifTrue: [ count2: callCount copyCurrent ].
            ('\nTotal CPU time: ', (t / 1000.0) printString, 's\n') print.
            flatProfiling print: 20.
            profiling methodCalls counting ifTrue: [ | count |
                count: count2 - count1.
                count callPrintString printLine. ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: repeat the receiver (a block) forever\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         loop = ( |
            | value. _Restart).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: infinite loop with restart block\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         loopContinue = ( |
            | 
            [
              [ | :exit |
                value: exit
              ] exit
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: repeat the block until value is sent to
	 its argument; then exit and return nil\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         loopExit = ( |
            | [ value: [ ^ nil ] ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: same as loopExit, 
plus a second arg block that causes the loop body to restart\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         loopExitContinue = ( |
            | 
            [ [ | :exit | 
                value: [ ^ nil ] With: exit
              ] exit
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: same as loopExit, except return a value\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         loopExitValue = ( |
            | [ value: [ | :x | ^ x ] ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: same as loopExitContinue, except return a value\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         loopExitValueContinue = ( |
            | 
            [ [ | :exit | 
                value: [ | :x | ^ x ] With: exit
              ] exit
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fCategory: unwind protect\x7fComment: invoke protectBlock if receiver block nlr\'s

 Dec/04:
if receiver block returns V, onNonLocalReturn
returns the result of [protectBlock value: V].
-- Ausch\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         onNonLocalReturn: protectBlock = ( |
            | 
            onNonLocalReturn: protectBlock IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fCategory: unwind protect\x7fComment: invoke protectBlock if receiver block nlr\'s

 Dec/04:
if receiver block returns V, onNonLocalReturn
returns the result of [protectBlock value: V].
-- Ausch\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         onNonLocalReturn: protectBlock IfFail: fb = ( |
            | 
            _OnNonLocalReturn: protectBlock IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fCategory: unwind protect\x7fComment: always invoke cleanUpBlock after running receiver block;
return result of receiver block as result of onReturn
Dec/04: This behaviour is unexpectedly different from 
that of \"onNonLocalReturn:\". We are leaving it unchanged
for the sake of compatibility. -- Ausch\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         onReturn: cleanUpBlock = ( |
            | 
            onReturn: cleanUpBlock IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fCategory: unwind protect\x7fComment: always invoke cleanUpBlock after running receiver block;
return result of receiver block as result of onReturn
Dec/04: Behaviour is unexpectedly different from 
that of \"onNonLocalReturn:IfFail:\". We are leaving it unchanged
for the sake of compatibility. -- Ausch\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         onReturn: cleanUpBlock IfFail: fb = ( |
             r.
            | 
            r: onNonLocalReturn: [|:v| cleanUpBlock value: v. v] 
                         IfFail: [|:e| ^ fb value: e].
            cleanUpBlock value: r.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fCategory: VM measurements\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         oprof = ( |
            | oprof: 0.02).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fCategory: VM measurements\x7fComment: low-level -- for VM debugging only; use profile instead\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         oprof: cutoff = ( |
             r.
             t.
            | 
            profiling reset.
            profiling on.
            t: times cpu.
            r: value.
            t: times cpu - t.
            profiling off.
            ('\nTotal CPU time: ', (t / 1000.0) printString, 's\n') print.
            profiling print: cutoff.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         profile = ( |
            | 
            profile: 0.2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fComment: profile execution of this block using the source level profiler\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         profile: cutoff = ( |
             p.
            | 
            p: getProfile.
            p printCutoff: cutoff.
            p reset.
            p blockResult).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fComment: elapsed real time (msec)\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         realTime = ( |
             t.
            | 
            t: times real.
            value.
            times real - t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fComment: elapsed system time (msec)\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         systemTime = ( |
             t.
            | 
            t: times system.
            value.
            times system - t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         time = ( |
            | cpuTime).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: private'
        
         timingResults = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'block' -> 'timingResults' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits block timingResults.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'timingResults' -> () From: ( | {
         'Category: times\x7fModuleInfo: Module: block InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         cpuTime <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'timingResults' -> () From: ( | {
         'ModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'timingResults' -> () From: ( | {
         'Category: times\x7fModuleInfo: Module: block InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         realTime <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'timingResults' -> () From: ( | {
         'ModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         runBlock: aBlock = ( |
            | 
            userTime: [
            systemTime: [
            realTime: [
            cpuTime: [
              aBlock value
            ]    cpuTime
            ]   realTime
            ] systemTime
            ]   userTime.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'timingResults' -> () From: ( | {
         'Category: times\x7fModuleInfo: Module: block InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         systemTime <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'timingResults' -> () From: ( | {
         'Category: times\x7fModuleInfo: Module: block InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         userTime <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fComment: turn tracing on during the block\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         trace = ( |
             r.
            | 
            _Trace: true.
            r: value.
            _Trace: false.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: testing VM\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         twiceWithInlineCacheFlushingBetween = ( |
            | 
            _Interpret ifTrue: self False: [
              value.
              _FlushInlineCache.
              value
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: repeat the receiver and b until b evaluates to false\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         untilFalse: b = ( |
            | untilTrue: [ b value not ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: repeat the receiver and b until b evaluates to true\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         untilTrue: b = ( | {
                 'ModuleInfo: Module: block InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            [ value.  b value ifTrue: [ ^ nil ]. ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fComment: user time (msec) during execution of the block\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         userTime = ( |
             t.
            | 
            t: times user.
            value.
            times user - t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: error handling\x7fComment: catches the case that a block was given too few args\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         value = ( |
            | error: 'block expects more arguments').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fCategory: VM measurements\x7fComment: turn VM profiling on during the block\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         vmProfile = ( |
             r.
            | 
            vmProfiling on.
            r: value.
            vmProfiling off.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: repeat the receiver until it evaluates to true\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         whileFalse = ( |
            | whileFalse: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: repeat the receiver and b until receiver evaluates to true\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         whileFalse: b = ( |
            | 
            [ value ifTrue: [ ^ nil ].  b value. ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: repeat the receiver until it evaluates to false\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         whileTrue = ( |
            | whileTrue: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: control\x7fComment: repeat the receiver and b until receiver evaluates to false\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         whileTrue: b = ( |
            | [ value ifFalse: [ ^ nil ].  b value. ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: testing VM\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         withCompiler: compiler = ( |
             c.
             l.
             r.
            | 
            c: _Compilers. l: _RecompileLimits.

            _Compilers: (vector copySize: 1 FillingWith: compiler)
                Limits: vector copy
                IfFail: [warning: 'could not set compiler'. ^ value].
            r: value.
            _Compilers: c Limits: l.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: testing VM\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         withoutLRUSweeps = ( | {
                 'ModuleInfo: Module: block InitialContents: FollowSlot'
                
                 f.
                }  {
                 'ModuleInfo: Module: block InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            f: _UseLRUInterrupts: false.
            r: value.
            _UseLRUInterrupts: f.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: testing VM\x7fModuleInfo: Module: block InitialContents: FollowSlot\x7fVisibility: public'
        
         withoutPrintingScavenges = ( | {
                 'ModuleInfo: Module: block InitialContents: FollowSlot'
                
                 f.
                }  {
                 'ModuleInfo: Module: block InitialContents: FollowSlot'
                
                 f1.
                }  {
                 'ModuleInfo: Module: block InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            f: _PrintScavenge: false.
            f1: _PrintGC: false.
            r: value.
            _PrintScavenge: f.
            _PrintGC: f1.
            r).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'blockTests' From: 'core'



 '-- Side effects'

 globals modules block postFileIn
