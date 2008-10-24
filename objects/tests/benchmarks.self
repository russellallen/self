 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: bench\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         benchmarks = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( |
             {} = 'Comment: object holding all benchmarks, capable of running a suite of benchmarks\x7fModuleInfo: Creator: globals benchmarks.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: vectors\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         atAllPut = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'atAllPut' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks atAllPut.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'atAllPut' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'atAllPut' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks atAllPut cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         unmeasuredCTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks unmeasuredCTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'atAllPut' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'atAllPut' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'atAllPut' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 304.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'atAllPut' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 65.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'atAllPut' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 65.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'atAllPut' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 45.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'atAllPut' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 29.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'atAllPut' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 50.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'atAllPut' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 29.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         doAllBenchmarks = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'bench' -> 'doAllBenchmarks' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits bench doAllBenchmarks.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'atAllPut' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'doAllBenchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'atAllPut' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | v atAllPut: 7. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'atAllPut' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'atAllPut'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: bubble sort\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         bubble = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks bubble.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks bubble cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_30 = 33.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 21.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_160 = 440.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_50 = 408.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 302.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 185.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 195.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 123.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 67.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 163.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 67.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: quicksort\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         quick = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks quick.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 top.
                } 
            | 
            initarr.
            top: sortelements.
            [top > 1] whileTrue: [ | i |
                i: 1.
                [i < top] whileTrue: [
                    (sortlist at: i) > (sortlist at: i successor) ifTrue: [ | j |
                        j: sortlist at: i.
                        sortlist at: i Put: sortlist at: i successor.
                        sortlist at: i successor Put: j.
                    ].
                    i: i successor.
                ].
                top: top predecessor.
            ].
            ((sortlist at: 1) != littlest) || 
            [(sortlist at: sortelements) != biggest] ifTrue:
                [ 'Error3 in Bubble' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'bubble'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sortelements = 500.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> () From: ( | {
         'Comment: sortelements\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 501)'
        
         sortlist = vector copySize: 501.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: bubble sort\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         bubble_oo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks bubble_oo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: quicksort\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         quick_oo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks quick_oo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 j.
                } 
            | 
            initarr.
            sortlist bubbleSort.
            ((sortlist at: 0) != littlest) || 
            [(sortlist at: sortelements predecessor) != biggest] ifTrue:
                [ 'Error3 in Bubble' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'bubble_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sortelements = 500.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo' -> () From: ( | {
         'Comment: sortelements\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 500)'
        
         sortlist = vector copySize: 500.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: bubble sort\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         bubble_oo_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo_r' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks bubble_oo_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: quicksort\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         quick_oo_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo_r' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks quick_oo_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo_r' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 j.
                } 
            | 
            initarr.
            sortlist bubbleSort_r.
            ((sortlist at: 0) != littlest) || 
            [(sortlist at: sortelements predecessor) != biggest] ifTrue:
                [ error: 'Error3 in Bubble_oo_r' ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo_r' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks bubble_oo_r selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 50.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 80.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'r_bubble_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sortelements <- 500.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sortlist.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: bubble sort\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         bubble_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_r' -> () From: ( |
             {} = 'Comment: Sorts an array using bubblesort\x7fModuleInfo: Creator: globals benchmarks bubble_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: quicksort\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         quick_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> () From: ( |
             {} = 'Comment: Sorts an array using quicksort\x7fModuleInfo: Creator: globals benchmarks quick_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            initarr.
            sortelements reverseDo: [ | :top |
                top do: [ | :i |
                    (sortlist at: i) > (sortlist at: i + 1) ifTrue: [ | j |
                        j: sortlist at: i.
                        sortlist at: i Put: sortlist at: i + 1.
                        sortlist at: i + 1 Put: j.
                    ].
                ].
            ].
            ((sortlist first) != littlest) || 
            [(sortlist last) != biggest] ifTrue:
                [ error: 'Error3 in Bubble_r' ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_r' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks bubble_r selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 410.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 650.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'bubble_r'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sortelements <- 500.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'bubble_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sortlist.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: Cecil\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ccom = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ccom' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks ccom.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ccom' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ccom' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks ccom cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ccom' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (nil)'
        
         cc.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ccom' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ccom' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         comment = 'Cecil compiler'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ccom' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            cc ifNil: [ | f |
                ((reflect: shell) lookupKey: 'cecil_interpreter') size = 0 ifTrue: [
                  f: _PrintScriptName: false.
                  'basic_cecil.self' _RunScript.
                  _PrintScriptName: f.
                ].
                cc: benchmarkCompiler.
                cc preludeName: preludeName.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         benchmarks = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> () From: ( |
             {} = 'Comment: traits object for all benchmarks \x7fModuleInfo: Creator: traits bench benchmarks.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ccom' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ccom' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         preludeName = 'compiler_prelude.cecil'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ccom' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            cc compilingCecil:'fib.cecil'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ccom' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ccom' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks ccom selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ccom' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ccom' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'ccom'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: Cecil\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cint = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks cint.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks cint cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (nil)'
        
         ci.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         comment = 'Cecil interpreter'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            ci ifNil: [ | f |
                ((reflect: shell) lookupKey: 'cecil_interpreter') size = 0 ifTrue: [
                  f: _PrintScriptName: false.
                  'basic_cecil.self' _RunScript.
                  _PrintScriptName: f.
                ].
                ci: cecil_interpreter copy.
                ci doingBenchmark:true.
                ci prelude.
                ci resetAndProcess: 'tree.tst.cecil'.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            ci eval: 'tree_bench()'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks cint selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 1560.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 2700.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'cint'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: Cecil\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cint2 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint2' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks cint2.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint2' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks cint2 cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint2' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (nil)'
        
         ci.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         comment = 'Cecil interpreter (2nd test)'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            ci ifNil: [ | f |
                ((reflect: shell) lookupKey: 'cecil_interpreter') size = 0 ifTrue: [
                  f: _PrintScriptName: false.
                  'basic_cecil.self' _RunScript.
                  _PrintScriptName: f.
                ].
                ci: cecil_interpreter copy.
                ci doingBenchmark:true.
                ci prelude.
                ci resetAndProcess: 'urs.tst.cecil'.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            ci eval: 'urs_tests()'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint2' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks cint2 selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint2' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'cint2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'cint2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: suites\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         coreMP = ( |
            | measurePerformanceOf: coreSuite).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: suites\x7fComment: run the following benchmarks as the core suite for averages, etc.\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         coreSuite = list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         defaultCompiler = 'sic'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         defaultIters = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         deltablue = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'deltablue' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks deltablue.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'deltablue' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks deltablue cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'deltablue' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'deltablue' -> 'cTimes' -> () From: ( | {
         'Comment: gcc 2.3.3 -O2 -finline-functions\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_30 = 52.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'deltablue' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 45.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'deltablue' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 94.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | deltablue benchmark: 10 Iters: 100. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'deltablue' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks deltablue selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'deltablue' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'deltablue' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 540.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'deltablue' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 970.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'deltablue'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         detabify = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'detabify' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks detabify.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'detabify' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'detabify' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks detabify cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'detabify' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'detabify' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'detabify' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            100 do: 
            ['long  string  with    many    tabs    in      it      .       .' 
                detabified ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'detabify' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'detabify'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: vectors\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         fastSumTo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fastSumTo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks fastSumTo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fastSumTo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fastSumTo' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks fastSumTo cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fastSumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fastSumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 75.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fastSumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 2545.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fastSumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 305.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fastSumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 245.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fastSumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 162.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fastSumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 102.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fastSumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 205.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fastSumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 101.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fastSumTo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fastSumTo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 100 do: [ 1 sumTo: 10000 ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fastSumTo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'fastSumTo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         fft = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( |
             {} = 'Comment: too slow to run w/ new floats\x7fModuleInfo: Creator: globals benchmarks fft.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks fft cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_30 = 53.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_160 = 13486.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_50 = 13096.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 9812.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 110360.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 553.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 219.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 123.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 301.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 108.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         complex = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'complex' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks fft complex.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'complex' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ip.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'complex' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> 'complex' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         rp.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cos: x = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 factor <- 1.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 power.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 result <- 1.0.
                } 
            | 
            " computes cos of x (x in radians) by an expansion "
            power: x.
            2 to: 10 Do: [ | :i |
               factor: factor * i.  power: power * x.
               (i && 1) = 0 ifTrue: [
                   (i && 3) = 0 ifTrue: [result: result + (power / factor)]
                   False: [result: result - (power / factor)].
                ].
            ]. result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         e.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         exptabN: n E: e = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 divisor.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 h.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 j.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 k.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 l.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 m.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 theta.
                } 
            | 
            theta: 3.1415926536.
            divisor: 4.0.
            h: vector copySize: 26.
            1 to: 25 Do: [ | :i |
                h at: i Put: 1 / (2 * (cos: theta / divisor)).
                divisor: divisor + divisor.
            ].
            m: n / 2.  l: m / 2.  j: 1.
            (e at: 1) rp: 1.0.
            (e at: 1) ip: 0.0.
            (e at: l successor) rp: 0.0.
            (e at: l successor) ip:1.0.
            (e at: m successor) rp: -1.0.
            (e at: m successor) ip: 0.0.

            [ | i |
                i: l / 2.  k: i.
                [
                    (e at: k successor) rp: (h at: j) *
                        ((e at: k + i + 1) rp + (e at: (k - i) + 1) rp ).
                    (e at: k successor) ip: (h at: j) *
                        ((e at: k + i + 1) ip + (e at: (k - i) + 1) ip ).
                    k: k + l.
                ] untilFalse: [ k <= m ].
                j: j successor min: 25.
                l: i.
            ] untilFalse: [ l > 1 ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         fftN: n Z: z W: w E: e Sqrinv: sqrinv = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 index.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 j.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 k.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 l.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            m: n / 2.
            l: 1.
            [
                k: 0.  j: l.  i: 1.
                [
                    [
                        (w at: i + k) rp: (z at: i) rp + (z at: m + i) rp.
                        (w at: i + k) ip: (z at: i) ip + (z at: m + i) ip.

                        (w at: i + j) rp:
                            ((e at: k + 1) rp * ((z at: i) rp - (z at: i + m) rp))
                            - ((e at: k + 1) ip *
                                ((z at: i) ip - (z at: i + m) ip)).
                        (w at: i + j) ip:
                            ((e at: k + 1) rp * ((z at: i) ip - (z at: i + m) ip))
                            + ((e at: k + 1) ip *
                                ((z at: i) rp - (z at: i + m) rp)).
                        i: i successor.
                    ] untilFalse: [i <= j].
                    k: j.  j: k + l.
                ] untilFalse: [j <= m].

                "z = w ;" index: 1.
                [
                    z at: index Put: w at: index.
                    index: index successor.
                ] untilFalse: [index <= n].
                l: l + l.
            ] untilFalse: [l <= m].

            1 to: n Do: [ | :i |
                (z at: i) rp: sqrinv * (z at: i) rp.
                (z at: i) ip: sqrinv negate * (z at: i) ip. ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         fftsize = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         fftsize2 = 129.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         printComplexArg1: arg1 Arg2: arg2 ZArray: zarray Start: start Finish: finish Increment: increment = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 i.
                } 
            | 
            '\n' print.
            i: start.
            [
                ' ' print.  (zarray at: i) rp print.
                ' ' print.  (zarray at: i) ip print.
                i: i + increment.
                ' ' print.  (zarray at: i) rp print.
                ' ' print.  (zarray at: i) ip print.
                '\n' print.
                i: i + increment.
            ] untilFalse: [i <= finish]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            z: vector copySize: fftsize successor.
            1 to: fftsize Do: [ | :i | z at: i Put: complex copy ].
            w: vector copySize: fftsize successor.
            1 to: fftsize Do: [ | :i | w at: i Put: complex copy ].
            e: vector copySize: fftsize2 successor.
            1 to: fftsize2 Do: [ | :i | e at: i Put: complex copy ].

            exptabN: fftsize E: e.
            seed: 5767.
            1 to: fftsize Do: [ | :i | 
                zr: uniform11.
                zi: uniform11.
                (z at: i) rp: (20.0 * zr) - 10.0.
                (z at: i) ip: (20.0 * zi) - 10.0.
            ].
            1 to: 20 Do: [ | :i | 
                 fftN: fftsize Z: z W: w E: e Sqrinv: 0.0625.
                 " printComplexArg1: 6 Arg2: 99 ZArray: z
                    Start: 1 Finish: 256 Increment: 17." ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'fft'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         uniform11 = ( |
            | seed: ((4855 * seed) + 1731) && 8191. seed / 8192.0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         w.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         z.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         zi <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'fft' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         zr <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: vectors\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         incrementAll = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'incrementAll' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks incrementAll.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'incrementAll' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'incrementAll' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks incrementAll cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'incrementAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'incrementAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'incrementAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 102.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'incrementAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 113.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'incrementAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 65.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'incrementAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 34.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'incrementAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 68.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'incrementAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 34.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'incrementAll' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'doAllBenchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'incrementAll' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | v incrementAll. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'incrementAll' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'incrementAll'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: integer matrix multiply\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         intmm = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> () From: ( |
             {} = 'Comment: Multiplies two integer matrices.\x7fModuleInfo: Creator: globals benchmarks intmm.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks intmm cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_30 = 71.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 60.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_160 = 620.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_50 = 458.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 344.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 417.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 278.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 174.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 110.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 246.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 109.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initmatrix: m = ( |
            | "| m |"
            "m: mmMatrix."
            1 to: rowsize Do: [ | :i. |
                1 to: rowsize Do: [ | :j. temp. |
                    temp: newValue.
                    (m at: i) at: j Put: temp - ((temp / 120) * 120) - 60 ]].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         innerproductRow: row Column: column = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 result <- 0.
                } 
            | 
            1 to: rowsize Do: [ | :i. x. y. r. |
                result: result + (((ma at: row) at: i) *
                                  ((mb at: i) at: column)) ].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> () From: ( | {
         'Comment: rowsize\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 41)'
        
         ma = vector copySize: 41.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> () From: ( | {
         'Comment: rowsize\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 41)'
        
         mb = vector copySize: 41.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         mmMatrix: r = ( |
            | "| r |"
            "r: vector copySize: rowsize successor."
            1 to: rowsize Do: [ | :i |
                r at: i Put: vector copySize: rowsize successor.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> () From: ( | {
         'Comment: rowsize\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 41)'
        
         mr = vector copySize: 41.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         newValue = ( |
            | rand).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         rowsize = 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            initrand.
            "mr: mmMatrix."
            "ma: initmatrix."
            "mb: initmatrix."
            initmatrix: ma.
            initmatrix: mb.
            1 to: rowsize Do: [ | :i |
                1 to: rowsize Do: [ | :j |
                    (mr at: i) at: j Put: innerproductRow: i Column: j.]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'intmm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: integer matrix multiply\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         intmm_oo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks intmm_oo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            initrand.
            "ma init: self."
            "mb init: self."
            xma init.
            xmb init.
            xma mul: xmb Into: xmr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'intmm_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo' -> () From: ( | {
         'Comment: rowsize\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 40)'
        
         xma = vector copySize: 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo' -> () From: ( | {
         'Comment: rowsize\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 40)'
        
         xmb = vector copySize: 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo' -> () From: ( | {
         'Comment: rowsize\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 40)'
        
         xmr = vector copySize: 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: integer matrix multiply\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         intmm_oo_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks intmm_oo_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         finalize = ( |
            | 
            xma: vector copySize: 1.
            xmb: vector copySize: 1.
            xmr: vector copySize: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: integer matrix multiply\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         intmm_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> () From: ( |
             {} = 'Comment: Multiplies two integer matrices.\x7fModuleInfo: Creator: globals benchmarks intmm_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            initrand.
            xma: xma new_r init: self.
            xmb: xmb new_r init: self.
            xmr: xma mul: xmb.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks intmm_oo_r selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 190.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 310.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'r_intmm_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         xma <- [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals benchmarks intmm_oo_r xma.
'.
                    | ) ) _Clone: 1 Filler: 0| 
             x _At: 0  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r') \/-> 'xma') -> () _At: 0 Put: (
     bootstrap stub -> 'globals' -> 'nil' -> ())

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         xmb <- [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals benchmarks intmm_oo_r xmb.
'.
                    | ) ) _Clone: 1 Filler: 0| 
             x _At: 0  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r') \/-> 'xmb') -> () _At: 0 Put: (
     bootstrap stub -> 'globals' -> 'nil' -> ())

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         xmr <- [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals benchmarks intmm_oo_r xmr.
'.
                    | ) ) _Clone: 1 Filler: 0| 
             x _At: 0  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo_r') \/-> 'xmr') -> () _At: 0 Put: (
     bootstrap stub -> 'globals' -> 'nil' -> ())

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         finalize = ( |
            | ma: nil. mb: nil. mr: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initmatrix = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            m: mmMatrix.
            rowsize do: [ | :i. |
                rowsize do: [ | :j. temp. |
                    temp: newValue.
                    (m at: i) at: j Put: temp - ((temp / 120) * 120) - 60 ]].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         innerproductRow: row Column: column = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 result <- 0.
                } 
            | 
            rowsize do: [ | :i. x. y. r. |
                result: result + (((ma at: row) at: i) *
                                  ((mb at: i) at: column)) ].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ma.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         mb.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         mmMatrix = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: vector copySize: rowsize.
            rowsize do: [ | :i |
                r at: i Put: vector copySize: rowsize.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         mr.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         newValue = ( |
            | rand).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         rowsize <- 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            initrand.
            mr: mmMatrix.
            ma: initmatrix.
            mb: initmatrix.
            rowsize do: [ | :i |
                rowsize do: [ | :j |
                    (mr at: i) at: j Put: innerproductRow: i Column: j.]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks intmm_r selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 320.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 490.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'intmm_r'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: suites\x7fComment: large benchmarks\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         largeSuite = list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: mango\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         mango = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks mango.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (nil)'
        
         cParser.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks mango cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            cParser ifNil: [ 
            ((reflect: shell) lookupKey: 'cParser') size = 0 ifTrue: [
                'mango.self' _RunScript.
                'genansi.self' _RunScript.
            ]].
            cParser: shell cParser.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            cParser parseFile:'~/self/applications/mango/substpp.c'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks mango selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 1990.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 3410.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'mango'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: mango\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         mango2 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango2' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks mango2.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (nil)'
        
         cParser.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango2' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks mango2 cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango2' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            cParser ifNil: [ 
            ((reflect: shell) lookupKey: 'cParser') size = 0 ifTrue: [
                'mango.self' _RunScript.
                'genansi.self' _RunScript.
            ]].
            cParser: shell cParser.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            cParser parseFile:'~/self/applications/mango/test2.c'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango2' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks mango2 selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango2' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mango2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'mango2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fComment: these functions use the current compiler settings and also compute mins\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measure2: b Runs: iters = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 cTime <- 0.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 compile <- 0.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 mean <- 0.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 min <- 999999.
                } 
            | 
            ((b shortName, ':') padOnRight: 16) print.

            b initialize.
            memory codeCache flush.        "uncomment to get accurate compile times"
            [ _GarbageCollect. _Scavenge. _Tenure. ] withoutPrintingScavenges.
            compile: time: b Times: 1.

            [ _GarbageCollect. _Scavenge. _Tenure. ] withoutPrintingScavenges.
            iters do: [ | t <- 0 |
                t: [[b runBenchmark] time] withoutLRUSweeps.
                min: t min: min.
                mean: mean + t.
            ].
            mean: mean / iters.
            compile: compile - mean.
            b finalize.

            (compile printString padOnLeft: 8) print.

            (mean printString padOnLeft: 8) print.
            (min  printString padOnLeft: 8) print.

            cTime: b cTime.
            cTime != 0 ifTrue: [
                   (cTime                   printString              padOnLeft:  8)
                        print.
                 (((min /= cTime)           printStringPrecision: 2) padOnLeft: 10)
                        print.
                ((((cTime /= min) * 100.0)  printStringPrecision: 1) padOnLeft:  8)
                        print.
            ].
            '\n' print.
            iters).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fComment: same as measure2 but compares against selfTimes\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measure3: b Runs: iters = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 compile <- 0.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 mean <- 0.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 min <- 999999.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 ncmin <- 0.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 sTime <- 0.
                } 
            | 
            ((b shortName, ':') padOnRight: 16) print.

            b initialize.
            memory codeCache flush.        "uncomment to get accurate compile times"
            [ _GarbageCollect. _Scavenge. _Tenure. ] withoutPrintingScavenges.
            compile: time: b Times: 1.

            [ _GarbageCollect. _Scavenge. _Tenure. ] withoutPrintingScavenges.
            iters do: [ | t <- 0. nc |
                nc: memory codeCache compilations.
                [ b needsGC ifTrue:[ _GarbageCollect].
                    _Scavenge
                ] withoutPrintingScavenges.
                t: [[b runBenchmark] time] withoutLRUSweeps.
                nc: memory codeCache compilations - nc.
                t < min ifTrue: [ min: t. ncmin: nc].
                mean: mean + t.
            ].
            mean: mean / iters.
            compile: compile - mean.
            b finalize.

            (compile printString padOnLeft: 8) print.

            (mean printString padOnLeft: 8) print.
            (min  printString padOnLeft: 8) print.

            sTime: b sTime.
            sTime != 0 ifTrue: [
                   (sTime                   printString              padOnLeft:  8)
                        print.
                 (((min /= sTime)           printStringPrecision: 2) padOnLeft: 10)
                        print.
                ((((sTime /= min) * 100.0)  printStringPrecision: 1) padOnLeft:  8)
                        print.
            ].
            ncmin > 0 ifTrue: [ ' (' print. ncmin print. ')' print. ].
            '\n' print.
            iters).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformance = ( |
            | measurePerformanceOf: suite).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformance2 = ( |
            | measurePerformance2: 10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformance2: iters = ( |
            | 
            measurePerformance2: iters Of: rsuite).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformance2: iters Of: s = ( |
            | 
            measurePerformanceHeading2 print.
            s do: [ | :b. | measure2: b Runs: iters ].
            iters).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformance3 = ( |
            | measurePerformance3: 10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformance3: iters = ( |
            | 
            measurePerformance3: iters Of: rsuite).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformance3: iters Of: s = ( |
            | 
            measurePerformanceHeading3 print.
            s do: [ | :b. | measure3: b Runs: iters ].
            iters).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformance: iters = ( |
            | 
            measurePerformance: iters Of: suite Compiler: defaultCompiler).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformance: iters Of: s Compiler: comp = ( |
            | 
            measurePerformanceHeading print.
            s do: [ | :b. | measurePerformanceOf: b Runs: iters Compiler: comp ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformanceHeading = '
                 compile    mean       C    mean/C       %
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformanceHeading2 = '
                 compile    mean     min       C     min/C       %
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformanceHeading3 = '
                 compile    mean     min    base  min/base       %
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformanceOf: suite = ( |
            | 
            measurePerformance: defaultIters Of: suite Compiler: defaultCompiler).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformanceOf: suite Compiler: compiler = ( |
            | 
            measurePerformance: defaultIters Of: suite Compiler: compiler).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformanceOf: b Runs: iters Compiler: compiler = ( |
             cTime.
             compile.
             mean.
            | 
            ((b shortName, ':') padOnRight: 16) print.
            _PrintCompilationStatistics ifTrue: 
                [ ('#start# |', (b shortName), '|\n') print. ].

            b initialize.

            [ | maxCP. flushDB. |
                "give the compiler a little more room to breathe,
                 so it doesn't get cut off in the middle of compilation"
                maxCP: _MaxCompilePause: _MaxCompilePause max: 1500. "ms"

                memory codeCache flush.    "uncomment to get accurate compile times"
                [ _GarbageCollect. _Scavenge. _Tenure. ] withoutPrintingScavenges.
                compile: time: b Times: 1.

                [ _GarbageCollect. _Scavenge. _Tenure. ] withoutPrintingScavenges.
                mean: (time: b Times: iters) / iters.
                compile: compile - mean.

                "restore old compiler limits"
                _MaxCompilePause: maxCP.
            ] withCompiler: compiler.       

            b finalize.

            (compile printString padOnLeft: 8) print.

            (mean printString padOnLeft: 8) print.

            cTime: b cTime.
            cTime != 0 ifTrue: [
                   (cTime                   printString              padOnLeft:  8)
                        print.
                 (((mean /= cTime)          printStringPrecision: 2) padOnLeft: 10)
                        print.
                ((((cTime /= mean) * 100.0) printStringPrecision: 1) padOnLeft:  8)
                        print.
            ].
            '\n' print.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformanceTest = ( |
            | measurePerformanceOf: measuringSuite).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: suites\x7fComment: all benchmarks\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         measuringSuite = list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         mergesort = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> () From: ( |
             {} = 'Comment: sorting an array of integers with mergesort\x7fModuleInfo: Creator: globals benchmarks mergesort.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks mergesort cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         finalize = ( |
            | v: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initarr = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: random copy seed: 1234567.
            size do: [ | :i. j. | v at: i Put: r integer: 1000 ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialize = ( |
            | v: vector copySize: size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | initarr. v sort. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks mergesort selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 740.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 1130.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'mergesort'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         size <- 20000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mergesort' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         v.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: float matrix multiply\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         mm = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> () From: ( |
             {} = 'Comment: Multiplies two real matrices. Too slow to run w/ new floats.\x7fModuleInfo: Creator: globals benchmarks mm.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks mm cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_30 = 38.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 23.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_160 = 6718.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_50 = 9740.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 7316.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 84370.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 310.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 135.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 72.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 191.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 67.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         newValue = ( |
            | resend.newValue asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'mm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: float matrix multiply\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         mm_oo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm_oo' -> () From: ( |
             {} = 'Comment: not fully implemented\x7fModuleInfo: Creator: globals benchmarks mm_oo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         newValue = ( |
            | resend.newValue asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_oo' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'mm_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'mm_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         nestedLoop = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'nestedLoop' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks nestedLoop.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'nestedLoop' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'nestedLoop' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks nestedLoop cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'nestedLoop' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'nestedLoop' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 76.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'nestedLoop' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 310.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'nestedLoop' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 250.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'nestedLoop' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 165.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'nestedLoop' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 104.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'nestedLoop' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 207.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'nestedLoop' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 102.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'nestedLoop' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'nestedLoop' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 100 do: [ x nestedLoopTest ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'nestedLoop' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'nestedLoop'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'nestedLoop' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         x <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: suites\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         oosuite <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: suites\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         oosuite2 <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'parser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks parser.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'parser' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks parser cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'parser' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'parser' -> () From: ( | {
         'Comment: Change iterations from 20 to 5.  20 just took too long.  JAD 4/17/92 \x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 5 do: ["repeat several times to get reasonable measurements" 
                   oldParser silentParser testXYZ printString.
                   oldParser silentParser testOnePlusTwo printString.
                   oldParser silentParser testRandom printString.
                   oldParser silentParser testAddPoints printString.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'parser' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks parser selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'parser' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'parser' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 120.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'parser' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 270.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'parser'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: permutations\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         perm = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> () From: ( |
             {} = 'Comment: Permutation program, heavily recursive, written by Denny Brown.\x7fModuleInfo: Creator: globals benchmarks perm.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks perm cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_30 = 30.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 25.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_160 = 700.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_50 = 752.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 560.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 147.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 110.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 81.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 44.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 109.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 44.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            "permarray: vector copySize: permrange successor."
            1 to: permrange Do: [ | :i | permarray at: i Put: i predecessor ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         pctr <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> () From: ( | {
         'Comment: permrange\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 11)'
        
         permarray = vector copySize: 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         permcount = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         permrange = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         permute: n = ( |
            | 
            pctr: pctr successor.
            n > 1 ifTrue: [
                permute: n predecessor.
                n predecessor downTo: 1 Do: [ | :k |
                    swap: n With: k.
                    permute: n predecessor.
                    swap: n With: k.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            pctr: 0.
            permcount do: [ initialize. permute: 7. ].
            pctr != (8660 * permcount) ifTrue: [ ' Error in perm.' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'perm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         swap: a With: b = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: permarray at: a.
            permarray at: a Put: permarray at: b.
            permarray at: b Put: t.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: permutations\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         perm_oo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_oo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks perm_oo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | "| permarray |"
            pctr: 0.
            "permarray: vector copySize: permrange successor."
            permcount do: [ permarray permInitialize. permarray permute: 7. ].
            pctr != (8660 * permcount) ifTrue: [ ' Error in perm_oo.' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'perm_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: permutations\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         perm_oo_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_oo_r' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks perm_oo_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: permutations\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         perm_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks perm_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 permarray.
                } 
            | 
            benchmarks perm_oo pctr: 0.
            permarray: vector copySize: permrange successor.
            permcount do: [ permarray permInitialize. permarray permute: 7. ].
            benchmarks perm_oo pctr != (8660 * permcount)
                ifTrue: [ error: ' Error in perm_oo.' ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_oo_r' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks perm_oo_r selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 90.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'r_perm_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         finalize = ( |
            | permarray: nil. "to save space in the standard image").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            permarray: vector copySize: permrange successor.
            permrange do: [ | :i | permarray at: i Put: i ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         pctr <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         permarray.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         permcount <- 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         permrange <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         permute: n = ( |
            | 
            pctr: pctr successor.
            n != 1 ifTrue: [
                permute: n predecessor.
                n predecessor downTo: 1 Do: [ | :k |
                    swap: n With: k.
                    permute: n predecessor.
                    swap: n With: k.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            pctr: 0.
            permcount do: [ initialize. permute: 7. ].
            pctr != (8660 * permcount) ifTrue: [ error: ' Error in perm.' ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks perm_r selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 130.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 230.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'r_perm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'perm_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         swap: a With: b = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: permarray at: a.
            permarray at: a Put: permarray at: b.
            permarray at: b Put: t.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: primitive maker\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         primitiveMaker = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks primitiveMaker.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         buf <- bootstrap stub -> 'globals' -> 'mutableString' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks primitiveMaker cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialize = ( |
             f.
            | 
            f: os_file openForReading:'~/self/self/primitiveMaker.input'.
            buf: mutableString copySize: f size.
            f readInto: buf Count: buf size.
            f close).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            process this _CurrentHash: 123456.  "hash matters"
            primitiveMaker reader copy benchmark: buf. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks primitiveMaker selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 1170.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 2360.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'primitiveMaker'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: primitive maker\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         primitiveMaker2 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker2' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks primitiveMaker2.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         buf <- bootstrap stub -> 'globals' -> 'mutableString' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker2' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks primitiveMaker2 cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker2' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialize = ( |
             f.
            | 
            f: os_file openForReading:'~/self/self/primitiveMaker.input2'.
            buf: mutableString copySize: f size.
            f readInto: buf Count: buf size.
            f close).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            process this _CurrentHash: 123456.  "hash matters"
            primitiveMaker reader copy benchmark: buf. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker2' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks primitiveMaker2 selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker2' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'primitiveMaker2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'primitiveMaker2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: puzzle\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         puzzle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( |
             {} = 'Comment: A compute-bound program from Forest Baskett.\x7fModuleInfo: Creator: globals benchmarks puzzle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks puzzle cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_30 = 158.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 134.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_160 = 2140.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_50 = 2008.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 1498.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 811.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 690.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 436.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 339.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 574.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 287.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'Comment: typemax\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 13)'
        
         class = vector copySize: 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         classmax = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         d = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         fitI: i J: j = ( |
            | 
            0 to: (piecemax at: i) Do: [ | :k |
                ((p at: i) at: k) && [puzzl at: j + k] ifTrue: [^false]].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         init = ( |
            | 
            0 to: typemax Do: [ | :i |
                p at: i Put: vector copySize: puzzleSize successor.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         kount <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         n <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'Comment: typemax\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 13)'
        
         p = vector copySize: 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'Comment: classmax\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         piececount = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals benchmarks puzzle piececount.
'.
                    | ) ) _Clone: 4 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x _At: 3  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle') \/-> 'piececount') -> () _At: 0 Put: (
     bootstrap stub -> 'globals' -> 'nil' -> ())

 ((bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle') \/-> 'piececount') -> () _At: 1 Put: (
     bootstrap stub -> 'globals' -> 'nil' -> ())

 ((bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle') \/-> 'piececount') -> () _At: 2 Put: (
     bootstrap stub -> 'globals' -> 'nil' -> ())

 ((bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle') \/-> 'piececount') -> () _At: 3 Put: (
     bootstrap stub -> 'globals' -> 'nil' -> ())

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'Comment: typemax\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 13)'
        
         piecemax = vector copySize: 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         placeI: i J: j = ( |
            | 
            0 to: (piecemax at: i) Do: [ | :k |
                ((p at: i) at: k) ifTrue: [puzzl at: j + k Put: true]].
            piececount at: (class at: i)
                Put: (piececount at: class at: i) predecessor.
            j to: puzzleSize Do: [ | :k |
                (puzzl at: k) ifFalse: [^k]].
            0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'Comment: puzzleSize\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 512)'
        
         puzzl = vector copySize: 512.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         puzzleSize = 511.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         removeI: i J: j = ( |
            | 
            0 to: (piecemax at: i) Do: [ | :k |
                ((p at: i) at: k) ifTrue: [puzzl at: j + k Put: false]].
            piececount at: (class at: i)
                Put: (piececount at: class at: i) successor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run1 = ( |
            | 
            "piececount: vector copySize: classmax successor."
            "class: vector copySize: typemax successor."
            "piecemax: vector copySize: typemax successor."
            "puzzl: vector copySize: puzzleSize successor."

            "p: vector copySize: typemax successor."
            "
            0 to: typemax Do: [ | :i |
                p at: i Put: vector copySize: puzzleSize successor.
            ].
            "

            0 to: puzzleSize Do: [ | :m | puzzl at: m Put: true].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run10 = ( |
            | 
            0 to: 2 Do: [ | :i |
                0 to: 0 Do: [ | :j |
                    0 to: 0 Do: [ | :k |
                        (p at: 6) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 6 Put: 1.
            piecemax at: 6 Put: 2 + (d * 0) + (d * d * 0).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run11 = ( |
            | 
            0 to: 0 Do: [ | :i |
                0 to: 2 Do: [ | :j |
                    0 to: 0 Do: [ | :k |
                        (p at: 7) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 7 Put: 1.
            piecemax at: 7 Put: 0 + (d * 2) + (d * d * 0).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run12 = ( |
            | 
            0 to: 0 Do: [ | :i |
                0 to: 0 Do: [ | :j |
                    0 to: 2 Do: [ | :k |
                        (p at: 8) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 8 Put: 1.
            piecemax at: 8 Put: 0 + (d * 0) + (d * d * 2).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run13 = ( |
            | 
            0 to: 1 Do: [ | :i |
                0 to: 1 Do: [ | :j |
                    0 to: 0 Do: [ | :k |
                        (p at: 9) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 9 Put: 2.
            piecemax at: 9 Put: 1 + (d * 1) + (d * d * 0).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run14 = ( |
            | 
            0 to: 1 Do: [ | :i |
                0 to: 0 Do: [ | :j |
                    0 to: 1 Do: [ | :k |
                        (p at: 10) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 10 Put: 2.
            piecemax at: 10 Put: 1 + (d * 0) + (d * d * 1).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run15 = ( |
            | 
            0 to: 0 Do: [ | :i |
                0 to: 1 Do: [ | :j |
                    0 to: 1 Do: [ | :k |
                        (p at: 11) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 11 Put: 2.
            piecemax at: 11 Put: 0 + (d * 1) + (d * d * 1).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run16 = ( |
            | 
            0 to: 1 Do: [ | :i |
                0 to: 1 Do: [ | :j |
                    0 to: 1 Do: [ | :k |
                        (p at: 12) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 12 Put: 3.
            piecemax at: 12 Put: 1 + (d * 1) + (d * d * 1).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run2 = ( |
            | 
            1 to: 5 Do: [ | :i |
                1 to: 5 Do: [ | :j |
                    1 to: 5 Do: [ | :k |
                        puzzl at: i + (d * (j + (d * k))) Put: false ]]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run3 = ( |
            | 
            0 to: typemax Do: [ | :i |
                0 to: puzzleSize Do: [ | :m |
                    (p at: i) at: m Put: false]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run4 = ( |
            | 
            0 to: 3 Do: [ | :i |
                0 to: 1 Do: [ | :j |
                    0 to: 0 Do: [ | :k |
                        (p at: 0) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 0 Put: 0.
            piecemax at: 0 Put: 3 + (d * 1) + (d * d * 0).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run5 = ( |
            | 
            0 to: 1 Do: [ | :i |
                0 to: 0 Do: [ | :j |
                    0 to: 3 Do: [ | :k |
                        (p at: 1) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 1 Put: 0.
            piecemax at: 1 Put: 1 + (d * 0) + (d * d * 3).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run6 = ( |
            | 
            0 to: 0 Do: [ | :i |
                0 to: 3 Do: [ | :j |
                    0 to: 1 Do: [ | :k |
                        (p at: 2) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 2 Put: 0.
            piecemax at: 2 Put: 0 + (d * 3) + (d * d * 1).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run7 = ( |
            | 
            0 to: 1 Do: [ | :i |
                0 to: 3 Do: [ | :j |
                    0 to: 0 Do: [ | :k |
                        (p at: 3) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 3 Put: 0.
            piecemax at: 3 Put: 1 + (d * 3) + (d * d * 0).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run8 = ( |
            | 
            0 to: 3 Do: [ | :i |
                0 to: 0 Do: [ | :j |
                    0 to: 1 Do: [ | :k |
                        (p at: 4) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 4 Put: 0.
            piecemax at: 4 Put: 3 + (d * 0) + (d * d * 1).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run9 = ( |
            | 
            0 to: 0 Do: [ | :i |
                0 to: 1 Do: [ | :j |
                    0 to: 3 Do: [ | :k |
                        (p at: 5) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 5 Put: 0.
            piecemax at: 5 Put: 0 + (d * 1) + (d * d * 3).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            run1. run2.  run3.  run4.  run5.  run6.  run7.  run8.
            run9. run10. run11. run12. run13. run14. run15. run16.
            runLast.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runLast = ( |
             m.
            | 
            piececount at: 0 Put: 13.
            piececount at: 1 Put: 3.
            piececount at: 2 Put: 1.
            piececount at: 3 Put: 1.

            m: 1 + (d * (1 + (d * 1))).
            kount: 0.
            (fitI: 0 J: m) ifTrue: [n: placeI: 0 J: m]
                False: [ 'Error1 in Puzzle' printLine ].
            (trial: n) ifFalse: [ 'Error2 in Puzzle' printLine ]
                True: [kount = 2005 ifFalse: [ 'Error3 in Puzzle\n' printLine ]].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'puzzle'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         trial: j = ( |
            | 
            kount: kount successor.
            0 to: typemax Do: [ | :i |
                (piececount at: class at: i) != 0  ifTrue: [
                    (fitI: i J: j) ifTrue: [ | k |
                        k: placeI: i J: j.
                        (trial: k) || [k = 0] ifTrue: [^true]
                            False: [removeI: i J: j]
                    ]
                ]
            ].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         typemax = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: puzzle\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         puzzle_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks puzzle_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         class.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         classmax <- 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         d <- 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         fitI: i J: j = ( |
            | 
            0 to: (piecemax at: i) Do: [ | :k |
                ((p at: i) at: k) && [puzzl at: j + k] ifTrue: [^false]].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         kount <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         n <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         p.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'Comment: A compute-bound program from Forest Baskett.\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'intmm_r' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         piececount.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         piecemax.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         placeI: i J: j = ( |
            | 
            0 to: (piecemax at: i) Do: [ | :k |
                ((p at: i) at: k) ifTrue: [puzzl at: j + k Put: true]].
            piececount at: (class at: i)
                Put: (piececount at: class at: i) predecessor.
            j to: puzzleSize Do: [ | :k |
                (puzzl at: k) ifFalse: [^k]].
            0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         puzzl.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         puzzleSize <- 511.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         removeI: i J: j = ( |
            | 
            0 to: (piecemax at: i) Do: [ | :k |
                ((p at: i) at: k) ifTrue: [puzzl at: j + k Put: false]].
            piececount at: (class at: i)
                Put: (piececount at: class at: i) successor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run1 = ( |
            | 
            piececount: vector copySize: classmax successor.
            class: vector copySize: typemax successor.
            piecemax: vector copySize: typemax successor.
            puzzl: vector copySize: puzzleSize successor.

            p: vector copySize: typemax successor.

            0 to: typemax Do: [ | :i |
                p at: i Put: vector copySize: puzzleSize successor.
            ].


            0 to: puzzleSize Do: [ | :m | puzzl at: m Put: true].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run10 = ( |
            | 
            0 to: 2 Do: [ | :i |
                0 to: 0 Do: [ | :j |
                    0 to: 0 Do: [ | :k |
                        (p at: 6) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 6 Put: 1.
            piecemax at: 6 Put: 2 + (d * 0) + (d * d * 0).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run11 = ( |
            | 
            0 to: 0 Do: [ | :i |
                0 to: 2 Do: [ | :j |
                    0 to: 0 Do: [ | :k |
                        (p at: 7) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 7 Put: 1.
            piecemax at: 7 Put: 0 + (d * 2) + (d * d * 0).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run12 = ( |
            | 
            0 to: 0 Do: [ | :i |
                0 to: 0 Do: [ | :j |
                    0 to: 2 Do: [ | :k |
                        (p at: 8) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 8 Put: 1.
            piecemax at: 8 Put: 0 + (d * 0) + (d * d * 2).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run13 = ( |
            | 
            0 to: 1 Do: [ | :i |
                0 to: 1 Do: [ | :j |
                    0 to: 0 Do: [ | :k |
                        (p at: 9) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 9 Put: 2.
            piecemax at: 9 Put: 1 + (d * 1) + (d * d * 0).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run14 = ( |
            | 
            0 to: 1 Do: [ | :i |
                0 to: 0 Do: [ | :j |
                    0 to: 1 Do: [ | :k |
                        (p at: 10) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 10 Put: 2.
            piecemax at: 10 Put: 1 + (d * 0) + (d * d * 1).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run15 = ( |
            | 
            0 to: 0 Do: [ | :i |
                0 to: 1 Do: [ | :j |
                    0 to: 1 Do: [ | :k |
                        (p at: 11) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 11 Put: 2.
            piecemax at: 11 Put: 0 + (d * 1) + (d * d * 1).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run16 = ( |
            | 
            0 to: 1 Do: [ | :i |
                0 to: 1 Do: [ | :j |
                    0 to: 1 Do: [ | :k |
                        (p at: 12) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 12 Put: 3.
            piecemax at: 12 Put: 1 + (d * 1) + (d * d * 1).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run2 = ( |
            | 
            1 to: 5 Do: [ | :i |
                1 to: 5 Do: [ | :j |
                    1 to: 5 Do: [ | :k |
                        puzzl at: i + (d * (j + (d * k))) Put: false ]]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run3 = ( |
            | 
            0 to: typemax Do: [ | :i |
                0 to: puzzleSize Do: [ | :m |
                    (p at: i) at: m Put: false]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run4 = ( |
            | 
            0 to: 3 Do: [ | :i |
                0 to: 1 Do: [ | :j |
                    0 to: 0 Do: [ | :k |
                        (p at: 0) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 0 Put: 0.
            piecemax at: 0 Put: 3 + (d * 1) + (d * d * 0).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run5 = ( |
            | 
            0 to: 1 Do: [ | :i |
                0 to: 0 Do: [ | :j |
                    0 to: 3 Do: [ | :k |
                        (p at: 1) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 1 Put: 0.
            piecemax at: 1 Put: 1 + (d * 0) + (d * d * 3).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run6 = ( |
            | 
            0 to: 0 Do: [ | :i |
                0 to: 3 Do: [ | :j |
                    0 to: 1 Do: [ | :k |
                        (p at: 2) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 2 Put: 0.
            piecemax at: 2 Put: 0 + (d * 3) + (d * d * 1).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run7 = ( |
            | 
            0 to: 1 Do: [ | :i |
                0 to: 3 Do: [ | :j |
                    0 to: 0 Do: [ | :k |
                        (p at: 3) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 3 Put: 0.
            piecemax at: 3 Put: 1 + (d * 3) + (d * d * 0).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run8 = ( |
            | 
            0 to: 3 Do: [ | :i |
                0 to: 0 Do: [ | :j |
                    0 to: 1 Do: [ | :k |
                        (p at: 4) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 4 Put: 0.
            piecemax at: 4 Put: 3 + (d * 0) + (d * d * 1).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run9 = ( |
            | 
            0 to: 0 Do: [ | :i |
                0 to: 1 Do: [ | :j |
                    0 to: 3 Do: [ | :k |
                        (p at: 5) at: i + (d * (j + (d * k))) Put: true]]].
            class at: 5 Put: 0.
            piecemax at: 5 Put: 0 + (d * 1) + (d * d * 3).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            run1. run2.  run3.  run4.  run5.  run6.  run7.  run8.
            run9. run10. run11. run12. run13. run14. run15. run16.
            runLast.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runLast = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            piececount at: 0 Put: 13.
            piececount at: 1 Put: 3.
            piececount at: 2 Put: 1.
            piececount at: 3 Put: 1.

            m: 1 + (d * (1 + (d * 1))).
            kount: 0.
            (fitI: 0 J: m) ifTrue: [n: placeI: 0 J: m]
                False: [ 'Error1 in Puzzle' printLine ].
            (trial: n) ifFalse: [ 'Error2 in Puzzle' printLine ]
                True: [kount = 2005 ifFalse: [ 'Error3 in Puzzle\n' printLine ]].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks puzzle_r selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 1060.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 1630.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'r_puzzle'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         trial: j = ( |
            | 
            kount: kount successor.
            0 to: typemax Do: [ | :i |
                (piececount at: class at: i) != 0  ifTrue: [
                    (fitI: i J: j) ifTrue: [ | k |
                        k: placeI: i J: j.
                        (trial: k) || [k = 0] ifTrue: [^true]
                            False: [removeI: i J: j]
                    ]
                ]
            ].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'puzzle_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         typemax <- 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: queens\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         queens = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> () From: ( |
             {} = 'Comment: The eight queens problem, solved 50 times. 

     type    
	    doubleboard =   2..16;
	    doublenorm  =   -7..7;
	    boardrange  =   1..8;
	    aarray      =   array (boardrange) of boolean;
	    barray      =   array (doubleboard) of boolean;
	    carray      =   array (doublenorm) of boolean;
	    xarray      =   array (boardrange) of boardrange;\x7fModuleInfo: Creator: globals benchmarks queens.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 17)'
        
         a = vector copySize: 17.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 9)'
        
         b = vector copySize: 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 15)'
        
         c = vector copySize: 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks queens cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_30 = 18.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 17.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_160 = 280.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_50 = 318.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 238.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 142.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 92.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 62.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 35.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 87.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 35.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         doQueens = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 q.
                } 
            | 
            "a: vector copySize: 17."
            "b: vector copySize: 9."
            "c: vector copySize: 15."
            "x: vector copySize: 9."
            i: -7.
            [i <= 16] whileTrue: [
                (i >= 1) && [ i <= 8 ] ifTrue: [b at: i Put: true].
                i >= 2 ifTrue: [a at: i Put: true].
                i <= 7 ifTrue: [c at: i + 7 Put: true].
                i: i successor.
            ].
            (tryI: 1) ifFalse: [ 'Error in queens.' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         queencount = 50.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | queencount do: [ |:i| doQueens ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'queens'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         tryI: i = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 j <- 0.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 q.
                } 
            | 
            q: false.
            [q not && [ j != 8 ]] whileTrue: [
                j: j successor.
                q: false.
                (b at: j) && [(a at: i + j) && [c at: (i - j) + 7]] ifTrue: [
                    x at: i Put: j.
                    b at: j Put: false.
                    a at: i + j Put: false.
                    c at: (i - j) + 7 Put: false.
                    i < 8 ifTrue: [
                        q: tryI: i successor.
                        q ifFalse: [
                            b at: j Put: true.
                            a at: i + j Put: true.
                            c at: (i - j) + 7 Put: true.
                        ]
                    ] False: [ q: true ].
                ].
            ].
            q).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 9)'
        
         x = vector copySize: 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: queens\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         queens_oo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks queens_oo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 15)'
        
         freeMajs = vector copySize: 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 15)'
        
         freeMins = vector copySize: 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 8)'
        
         freeRows = vector copySize: 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks queens_oo parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         doQueens = ( |
            | 
            freeMajs fillWith: true.
            freeRows fillWith: true.
            freeMins fillWith: true.
            (try: 0) ifFalse: [ 'Error in queens.' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         queencount = 50.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | queencount do: [ doQueens ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'queens_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         try: col = ( |
            | 
            8 do: [ | :row |
                (freeRows at: row)
                && [(freeMajs at: col + row)
                && [freeMins at: (col - row) + 7]] ifTrue: [
                    qrows at: col Put: row.
                    freeRows at: row Put: false.
                    freeMajs at: col + row Put: false.
                    freeMins at: (col - row) + 7 Put: false.
                    7 = col ifTrue: [^true].
                    (try: col successor) ifTrue: [^true].
                    freeRows at: row Put: true.
                    freeMajs at: col + row Put: true.
                    freeMins at: (col - row) + 7 Put: true.
                ].
            ].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 8)'
        
         qrows = vector copySize: 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: queens\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         queens_oo_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks queens_oo_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         finalize = ( |
            | freeRows:nil. freeMajs:nil. freeMins: nil. qrows: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         freeMajs.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         freeMins.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         freeRows.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks queens_oo_r parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         doQueens = ( |
            | 
            freeMajs: vector copySize: 15 FillingWith: true.
            freeRows: vector copySize: 8 FillingWith: true.
            freeMins: vector copySize: 15 FillingWith: true.
            qrows: vector copySize: 8.
            freeMajs fillWith: true.
            freeRows fillWith: true.
            freeMins fillWith: true.
            (try: 0) ifFalse: [ 'Error in queens.' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         queencount <- 50.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | queencount do: [ doQueens ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> 'parent' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks queens_oo_r parent selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> 'parent' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> 'parent' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 80.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> 'parent' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 130.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'r_queens_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         try: col = ( |
            | 
            8 do: [ | :row |
                (freeRows at: row)
                && [(freeMajs at: col + row)
                && [freeMins at: (col - row) + 7]] ifTrue: [
                    qrows at: col Put: row.
                    freeRows at: row Put: false.
                    freeMajs at: col + row Put: false.
                    freeMins at: (col - row) + 7 Put: false.
                    7 = col ifTrue: [^true].
                    (try: col successor) ifTrue: [^true].
                    freeRows at: row Put: true.
                    freeMajs at: col + row Put: true.
                    freeMins at: (col - row) + 7 Put: true.
                ].
            ].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         qrows.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: queens\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         queens_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks queens_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         a.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         b.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         c.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         doQueens = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 q.
                } 
            | 
            a: vector copySize: 17.
            b: vector copySize: 9.
            c: vector copySize: 15.
            x: vector copySize: 9.
            i: -7.
            [i <= 16] whileTrue: [
                (i >= 1) && [ i <= 8 ] ifTrue: [b at: i Put: true].
                i >= 2 ifTrue: [a at: i Put: true].
                i <= 7 ifTrue: [c at: i + 7 Put: true].
                i: i successor.
            ].
            (tryI: 1) ifFalse: [ 'Error in queens.' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         finalize = ( |
            | a: nil. b: nil. c: nil. x: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         queencount <- 50.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | queencount do: [ |:i| doQueens ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks queens_r selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 230.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'r_queens'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         tryI: i = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 j <- 0.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 q.
                } 
            | 
            q: false.
            [q not && [ j != 8 ]] whileTrue: [
                j: j successor.
                q: false.
                (b at: j) && [(a at: i + j) && [c at: (i - j) + 7]] ifTrue: [
                    x at: i Put: j.
                    b at: j Put: false.
                    a at: i + j Put: false.
                    c at: (i - j) + 7 Put: false.
                    i < 8 ifTrue: [
                        q: tryI: i successor.
                        q ifFalse: [
                            b at: j Put: true.
                            a at: i + j Put: true.
                            c at: (i - j) + 7 Put: true.
                        ]
                    ] False: [ q: true ].
                ].
            ].
            q).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'queens_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         x.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         biggest <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks quick cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_30 = 25.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 21.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_160 = 280.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_50 = 340.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 175.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 130.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 73.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 41.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 41.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initarr = ( |
            | 
            initrand.
            biggest: -1000000.
            littlest: 1000000.
            "sortlist: vector copySize: sortelements successor."
            1 to: sortelements Do: [ | :i. temp |
                temp: rand.
                sortlist at: i Put: temp - ((temp / 100000) * 100000) - 50000.
                (sortlist at: i) > biggest ifTrue: [biggest: sortlist at: i].
                (sortlist at: i) < littlest ifTrue: [littlest: sortlist at: i]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         littlest <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         quicksortL: l R: r = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 j.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 w.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 x.
                } 
            | 
            " quicksort the array from start to finish "
            i: l.
            j: r.
            x: sortlist at: (l + r) / 2.
            [
                [(sortlist at: i) < x] whileTrue: [i: i successor].
                [x < (sortlist at: j)] whileTrue: [j: j predecessor].
                i <= j ifTrue: [
                    w: sortlist at: i.
                    sortlist at: i Put: sortlist at: j.
                    sortlist at: j Put: w.
                    i: i successor.  j: j predecessor.
                ].
            ] untilFalse: [i <= j].

            l < j ifTrue: [quicksortL: l R: j].
            i < r ifTrue: [quicksortL: i R: r]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            initarr.
            quicksortL: 1 R: sortelements.
            ((sortlist at: 1) != littlest)  ||
              [(sortlist at: sortelements) != biggest] ifTrue:
                [ ' Error in Quick.' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'quick'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sortelements = 5000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> () From: ( | {
         'Comment: sortelements\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 5001)'
        
         sortlist = vector copySize: 5001.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: quicksort\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         quick2 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick2' -> () From: ( |
             {} = 'Comment: another version of quicksort, written in a nicer (more Self-like) style\x7fModuleInfo: Creator: globals benchmarks quick2.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initarr = ( |
            | 
            initrand.
            sortlist: vector copySize: sortelements.
            sortlist initarr: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            initarr.
            sortlist quicksort.
            ((sortlist at: 0) != littlest)  ||
              [(sortlist at: sortelements predecessor) != biggest] ifTrue:
                [ ' Error in Quick.' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick2' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks quick2 selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick2' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick2' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 150.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick2' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 230.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'quick2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sortlist.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initarr = ( |
            | 
            initrand.
            "sortlist: vector copySize: sortelements."
            sortlist initarr: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            initarr.
            sortlist quickSort.
            ((sortlist at: 0) != littlest)  ||
              [(sortlist at: sortelements predecessor) != biggest] ifTrue:
                [ ' Error in Quick.' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'quick_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo' -> () From: ( | {
         'Comment: sortelements\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 5000)'
        
         sortlist = vector copySize: 5000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initarr = ( |
            | 
            initrand.
            sortlist: vector copySize: sortelements.
            sortlist initarr: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            initarr.
            sortlist quickSort.
            ((sortlist at: 0) != littlest)  ||
              [(sortlist at: sortelements predecessor) != biggest] ifTrue:
                [ ' Error in Quick.' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo_r' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks quick_oo_r selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 60.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'r_quick_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sortlist.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         biggest <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         finalize = ( |
            | sortlist: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initarr = ( |
            | 
            initrand.
            biggest: -1000000.
            littlest: 1000000.
            sortlist: vector copySize: sortelements.
            sortelements do: [ | :i. temp |
                temp: rand.
                sortlist at: i Put: temp - ((temp / 100000) * 100000) - 50000.
                (sortlist at: i) > biggest ifTrue: [biggest: sortlist at: i].
                (sortlist at: i) < littlest ifTrue: [littlest: sortlist at: i]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         littlest <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         quicksortL: l R: r = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 j.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 w.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 x.
                } 
            | 
            " quicksort the array from start to finish "
            i: l.
            j: r.
            x: sortlist at: (l + r) / 2.
            [
                [(sortlist at: i) < x] whileTrue: [i: i successor].
                [x < (sortlist at: j)] whileTrue: [j: j predecessor].
                i <= j ifTrue: [
                    w: sortlist at: i.
                    sortlist at: i Put: sortlist at: j.
                    sortlist at: j Put: w.
                    i: i successor.  j: j predecessor.
                ].
            ] untilFalse: [ i <= j].

            l < j ifTrue: [quicksortL: l R: j].
            i < r ifTrue: [quicksortL: i R: r]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            initarr.
            quicksortL: 0 R: sortelements - 1.
            ((sortlist first) != littlest)  ||
              [(sortlist last) != biggest] ifTrue:
                [ ' Error in Quick.' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks quick_r selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 140.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 250.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'quick_r'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sortelements <- 5000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sortlist.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         recur = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'recur' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks recur.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'recur' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'recur' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks recur cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'recur' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'recur' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 1058.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'recur' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 390.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'recur' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 293.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'recur' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 185.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'recur' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 67.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'recur' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 291.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'recur' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 67.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'recur' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'recur' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 10 do: [ x recur ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'recur' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'recur'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'recur' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         x <- 14.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         richards = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_30 = 186.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 143.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 3543.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 1250.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 730.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 486.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 289.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 629.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 298.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | benchmark copy run. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 460.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 1000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'richards'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: suites\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         rsuite = list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run = ( |
            | run: suite).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run: s = ( |
            | 
            s do: [ | :b |
                b shortName printLine.
                [ b run ] withoutLRUSweeps ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run: b Times: iters = ( |
            | 1 to: iters Do: [ b runBenchmark ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: sieve of Eratosthenes\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sieve = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks sieve.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks sieve_r cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 8191)'
        
         flags = vector copySize: 8191.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 10 do: [ sieve ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'sieve'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sieve = ( |
            | 
            0 to: size Do: [ | :i | flags at: i Put: true ].
            0 to: size Do: [ | :i |
                (flags at: i) ifTrue: [ | prime. k. |
                    prime: i + i + 3.
                    k: i + prime.
                    [k <= size] whileTrue: [flags at: k Put: false. k: k + prime]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         size = 8190.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: sieve of Eratosthenes\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sieve_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks sieve_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_30 = 37.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 35.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 1115.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 300.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 165.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 114.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 74.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 140.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 72.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 8191)'
        
         flags <- vector copySize: 8191.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 10 do: [ sieve ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks sieve_r selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 350.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 590.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'r_sieve'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sieve = ( |
            | 
            size do: [ | :i | flags at: i Put: true ].
            size do: [ | :i |
                (flags at: i) ifTrue: [ | prime. k. |
                    prime: i + i + 3.
                    k: i + prime.
                    [k <= size] whileTrue: [flags at: k Put: false. k: k + prime]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sieve_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         size <- 8190.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         stanford = list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: suites\x7fComment: run the following benchmarks as the standard suite\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         suite = list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: vectors\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sumAll = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumAll' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks sumAll.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumAll' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumAll' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks sumAll cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 55.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 55.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 44.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 24.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 47.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumAll' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 24.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumAll' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'doAllBenchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumAll' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | v sumAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumAll' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'sumAll'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: vectors\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sumFromTo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks sumFromTo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks sumFromTo cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 75.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 2545.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 305.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 245.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 162.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 102.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 205.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 101.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 100 do: [ x sumFrom: 1 To: 10000 ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'sumFromTo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumFromTo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         x <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: vectors\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sumTo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks sumTo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks sumTo cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 75.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 2545.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 305.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 245.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 162.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 102.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 205.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 101.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 100 do: [ x sumTo: 10000 ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'sumTo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'sumTo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         x <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: takeuchi\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         tak = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tak' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks tak.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tak' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tak' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks tak cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tak' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tak' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 24.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tak' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 88.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tak' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 65.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tak' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 42.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tak' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 27.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tak' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 67.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tak' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 27.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tak' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tak' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         runBenchmark = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: takX: 18 Y: 12 Z: 6.
            r != 7 ifTrue: [ error: 'tak results are incorrect' ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tak' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'tak'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tak' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         takX: x Y: y Z: z = ( |
            | 
            y < x ifFalse: [ z ] True: [
                takX: (takX: x predecessor Y: y Z: z)
                   Y: (takX: y predecessor Y: z Z: x)
                   Z: (takX: z predecessor Y: x Z: y) ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: takeuchi\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         takl = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks takl.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks takl cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 1096.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 2836.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 4220.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 2660.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 2150.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 1290.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 3162.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 1243.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         listn: n = ( |
            | 
            0 = n ifTrue: nil False: [
                (cons copy car: n) cdr: listn: n predecessor ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         runBenchmark = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: taklX: (listn: 18) Y: (listn: 12) Z: (listn: 6).
            (r = (listn: 7)) ifFalse: [ error: 'takl results are wrong' ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'takl'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shorterpX: x Y: y = ( |
            | 
            (y isNotNil) && [ (x isNil) || [ shorterpX: x cdr Y: y cdr ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         taklX: x Y: y Z: z = ( |
            | 
            (shorterpX: y Y: x) ifFalse: [ z ] True: [
                taklX: (taklX: x cdr Y: y Z: z)
                    Y: (taklX: y cdr Y: z Z: x)
                    Z: (taklX: z cdr Y: x Z: y) ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: takeuchi\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         takl_oo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl_oo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks takl_oo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         runBenchmark = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: (listn: 18) taklY: (listn: 12) Z: (listn: 6).
            (r = (listn: 7)) ifFalse: [ error: 'takl-oo results are wrong' ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'takl_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'takl_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         time: b Times: iters = ( |
            | 
            [ [ run: b Times: iters ] time ] withoutLRUSweeps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: towers of Hanoi\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         towers = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( |
             {} = 'Comment: Program to Solve the Towers of Hanoi\x7fModuleInfo: Creator: globals benchmarks towers.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks towers cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_30 = 46.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 46.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_160 = 766.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_50 = 1018.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 820.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 258.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 191.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 134.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 195.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 63.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'Comment: maxcells\x7fModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (vector copySize: 19)'
        
         cellspace = vector copySize: 19.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         element = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'element' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks towers element.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'element' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         discsize.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'element' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         next.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'element' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         error: emsg = ( |
            | 'Error in towers: ' print. emsg printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         freelist.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         getelement = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 temp.
                } 
            | 
            freelist > 0 ifTrue: [
                temp: freelist.
                freelist: (cellspace at: freelist) next.
            ] False: [error: 'out of space'].
            temp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         init: s To: n = ( |
            | 
            makenull: s.
            n downTo: 1 Do: [ | :discctr | push: discctr OnTo: s. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         makenull: s = ( |
            | stack at: s Put: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         maxcells = 18.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         moveFrom: s1 To: s2 = ( |
            | 
            push: (pop: s1) OnTo: s2.
            movesdone: movesdone successor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         movesdone.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         pop: s = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 temp.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 temp1.
                } 
            | 
            (stack at: s) > 0 ifFalse: [^error: 'nothing to pop'].
            temp1: (cellspace at: (stack at: s)) discsize.
            temp: (cellspace at: (stack at: s)) next.
            (cellspace at: (stack at: s)) next: freelist.
            freelist: stack at: s.
            stack at: s Put: temp.
            temp1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         push: i OnTo: s = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 localel.
                } 
            | 
            (stack at: s) > 0 ifTrue: [
                (cellspace at: stack at: s) discsize <= i ifTrue: [
                    ^error: 'disc size error'.
                ]
            ].
            localel: getelement.
            (cellspace at: localel) next: stack at: s.
            stack at: s Put: localel.
            (cellspace at: localel) discsize: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            "cellspace: vector copySize: maxcells successor."
            1 to: maxcells Do: [ | :i | cellspace at: i Put: element copy ].
            "stack: vector copySize: stackrange successor."
            1 to: maxcells Do: [ | :i | (cellspace at: i) next: i predecessor.].
            freelist: maxcells.
            init: 1 To: 14.
            makenull: 2.
            makenull: 3.
            movesdone: 0.
            towerI: 1 J: 2 K: 14.
            movesdone = 16383 ifFalse: [' Error in towers.' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'towers'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'Comment: stackrange\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         stack = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals benchmarks towers stack.
'.
                    | ) ) _Clone: 4 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x _At: 3  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers') \/-> 'stack') -> () _At: 0 Put: (
     bootstrap stub -> 'globals' -> 'nil' -> ())

 ((bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers') \/-> 'stack') -> () _At: 1 Put: (
     bootstrap stub -> 'globals' -> 'nil' -> ())

 ((bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers') \/-> 'stack') -> () _At: 2 Put: (
     bootstrap stub -> 'globals' -> 'nil' -> ())

 ((bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers') \/-> 'stack') -> () _At: 3 Put: (
     bootstrap stub -> 'globals' -> 'nil' -> ())

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         stackrange = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         towerI: i J: j K: k = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 other.
                } 
            | 
            k = 1 ifTrue: [moveFrom: i To: j]
            False: [
                other: 6 - i - j.
                towerI: i J: other K: k predecessor.
                moveFrom: i To: j.
                towerI: other J: j K: k predecessor.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: towers of Hanoi\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         towers_oo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks towers_oo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         disc = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> 'disc' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks towers_oo disc.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> 'disc' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         discSize.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> 'disc' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         next.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> 'disc' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         discSize: i = ( |
            | disc copy discSize: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         error: emsg = ( |
            | 'Error in towers_oo: ' print. emsg printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         init: s To: n = ( |
            | 
            n downTo: 1 Do: [ | :discctr |
                push: (discSize: discctr) OnTo: s. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         makenull: s = ( |
            | stack at: s Put: sentinel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         moveFrom: s1 To: s2 = ( |
            | 
            push: (pop: s1) OnTo: s2.
            movesdone: movesdone successor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         movesdone.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         pop: s = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 result.
                } 
            | 
            sentinel = (stack at: s) ifTrue: [^error: 'nothing to pop'].
            result: stack at: s.
            stack at: s Put: result next.
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         push: d OnTo: s = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 localel.
                } 
            | 
            localel: stack at: s.
            d discSize >= localel discSize ifTrue: [^error: 'disc size error'].
            stack at: s Put: d next: localel.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            "stack: vector copySize: stackrange."
            makenull: 0.
            makenull: 1.
            makenull: 2.
            init: 0 To: 14.
            movesdone: 0.
            towerI: 0 J: 1 K: 14.
            movesdone = 16383 ifFalse: [' Error in towers.' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sentinel = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> 'sentinel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks towers_oo sentinel.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> 'sentinel' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         discSize <- 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> 'sentinel' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         next.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> 'sentinel' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'towers_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'Comment: stackrange\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         stack = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals benchmarks towers_oo stack.
'.
                    | ) ) _Clone: 3 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo') \/-> 'stack') -> () _At: 0 Put: (
     bootstrap stub -> 'globals' -> 'nil' -> ())

 ((bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo') \/-> 'stack') -> () _At: 1 Put: (
     bootstrap stub -> 'globals' -> 'nil' -> ())

 ((bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo') \/-> 'stack') -> () _At: 2 Put: (
     bootstrap stub -> 'globals' -> 'nil' -> ())

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         stackrange = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         towerI: i J: j K: k = ( |
            | 
            k = 1 ifTrue: [
                moveFrom: i To: j.
            ] False: [ | other |
                other: 3 - i - j.
                towerI: i J: other K: k predecessor.
                moveFrom: i To: j.
                towerI: other J: j K: k predecessor.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: towers of Hanoi\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         towers_oo_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks towers_oo_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         disc = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> 'disc' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks towers_oo_r disc.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> 'disc' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         discSize.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> 'disc' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         next.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> 'disc' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         discSize: i = ( |
            | disc copy discSize: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         error: emsg = ( |
            | 'Error in towers_oo: ' print. emsg printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         init: s To: n = ( |
            | 
            n downTo: 1 Do: [ | :discctr |
                push: (discSize: discctr) OnTo: s. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         makenull: s = ( |
            | stack at: s Put: sentinel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         moveFrom: s1 To: s2 = ( |
            | 
            push: (pop: s1) OnTo: s2.
            movesdone: movesdone successor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         movesdone.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         pop: s = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 result.
                } 
            | 
            sentinel = (stack at: s) ifTrue: [^error: 'nothing to pop'].
            result: stack at: s.
            stack at: s Put: result next.
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         push: d OnTo: s = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 localel.
                } 
            | 
            localel: stack at: s.
            d discSize >= localel discSize ifTrue: [^error: 'disc size error'].
            stack at: s Put: d next: localel.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            stack: vector copySize: stackrange.
            makenull: 0.
            makenull: 1.
            makenull: 2.
            init: 0 To: 14.
            movesdone: 0.
            towerI: 0 J: 1 K: 14.
            movesdone = 16383 ifFalse: [' Error in towers.' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks towers_oo_r selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 90.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 180.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sentinel = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> 'sentinel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks towers_oo_r sentinel.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> 'sentinel' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         discSize <- 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> 'sentinel' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         next.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> 'sentinel' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'r_towers_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         stack.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         stackrange <- 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         towerI: i J: j K: k = ( |
            | 
            k = 1 ifTrue: [
                moveFrom: i To: j.
            ] False: [ | other |
                other: 3 - i - j.
                towerI: i J: other K: k predecessor.
                moveFrom: i To: j.
                towerI: other J: j K: k predecessor.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: towers of Hanoi\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         towers_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( |
             {} = 'Comment: Program to Solve the Towers of Hanoi\x7fModuleInfo: Creator: globals benchmarks towers_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cellspace.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         element = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> 'element' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks towers_r element.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> 'element' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         discsize.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> 'element' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         next.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> 'element' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         error: emsg = ( |
            | 'Error in towers: ' print. emsg printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         finalize = ( |
            | stack: nil. cellspace: nil. freelist: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         freelist.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         getelement = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 temp.
                } 
            | 
            freelist > 0 ifTrue: [
                temp: freelist.
                freelist: (cellspace at: freelist) next.
            ] False: [error: 'out of space'].
            temp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         init: s To: n = ( |
            | 
            makenull: s.
            n downTo: 1 Do: [ | :discctr | push: discctr OnTo: s. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         makenull: s = ( |
            | stack at: s Put: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         maxcells <- 18.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         moveFrom: s1 To: s2 = ( |
            | 
            push: (pop: s1) OnTo: s2.
            movesdone: movesdone successor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         movesdone.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         pop: s = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 temp.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 temp1.
                } 
            | 
            (stack at: s) > 0 ifFalse: [^error: 'nothing to pop'].
            temp1: (cellspace at: (stack at: s)) discsize.
            temp: (cellspace at: (stack at: s)) next.
            (cellspace at: (stack at: s)) next: freelist.
            freelist: stack at: s.
            stack at: s Put: temp.
            temp1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         push: i OnTo: s = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 localel.
                } 
            | 
            (stack at: s) > 0 ifTrue: [
                (cellspace at: stack at: s) discsize <= i ifTrue: [
                    ^error: 'disc size error'.
                ]
            ].
            localel: getelement.
            (cellspace at: localel) next: stack at: s.
            stack at: s Put: localel.
            (cellspace at: localel) discsize: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            cellspace: vector copySize: maxcells successor.
            1 to: maxcells Do: [ | :i | cellspace at: i Put: element copy ].
            stack: vector copySize: stackrange successor.
            1 to: maxcells Do: [ | :i | (cellspace at: i) next: i predecessor.].
            freelist: maxcells.
            init: 1 To: 14.
            makenull: 2.
            makenull: 3.
            movesdone: 0.
            towerI: 1 J: 2 K: 14.
            movesdone = 16383 ifFalse: [' Error in towers.' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks towers_r selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 210.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 350.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'towers_r'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         stack.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         stackrange <- 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'towers_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         towerI: i J: j K: k = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 other.
                } 
            | 
            k = 1 ifTrue: [moveFrom: i To: j]
            False: [
                other: 6 - i - j.
                towerI: i J: other K: k predecessor.
                moveFrom: i To: j.
                towerI: other J: j K: k predecessor.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: treesort\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         tree = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> () From: ( |
             {} = 'Comment: Sorts an array using treesort\x7fModuleInfo: Creator: globals benchmarks tree.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks tree cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'cTimes' -> () From: ( | {
         'Comment: these times include free() now\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_40 = 115.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_160 = 1000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_50 = 1270.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun3_60 = 944.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_110 = 1404.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_260 = 869.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4_390 = 833.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_50 = 224.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'cTimes' -> () From: ( | {
         'Comment: these times are the original, without free()\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_60 = 977.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 126.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         checkTree: p = ( |
             result <- bootstrap stub -> 'globals' -> 'true' -> ().
            | 
            " check by inorder traversal "
            p left ifNotNil: [
                p left val <= p val ifTrue: [result: false]
                False: [result: (checkTree: p left) && [result]]].
            p right ifNotNil: [
                p right val >= p val ifTrue: [result: false]
                False: [result: (checkTree: p right) && [result]]].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         createNode: n = ( |
            | node copy val: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         insert: n Into: t = ( |
            | 
            " insert n into tree "
            n > t val ifTrue: [
                t left ifNil:    [t left: createNode: n]
                       IfNotNil: [insert: n Into: t left]]
            False: [
                n < t val ifTrue: [
                    t right ifNil:    [t right: createNode: n]
                            IfNotNil: [insert: n Into: t right]]
                False: [ error: 'adding a duplicate value to tree' ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         node = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'node' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks tree node.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         left.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         right.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         val.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 tree.
                } 
            | 
            initarr.
            tree: node copy val: sortlist at: 1.
            2 to: sortelements Do: [ | :i | insert: (sortlist at: i) Into: tree ].
            (checkTree: tree) ifFalse: [' Error in Tree.\n'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'tree'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: treesort\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         tree_oo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks tree_oo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         node = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> 'node' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks tree_oo node.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         empty = bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         left.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> 'node' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks tree_oo node parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> 'node' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         checkTree = ( |
            | 
            (left  isNil || [(left  val < val) && [left  checkTree]]) &&
            [right isNil || [(right val > val) && [right checkTree]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> 'node' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         count <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> 'node' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         createNode: n = ( |
            | empty copy val: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> 'node' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         insert: n = ( |
            | 
            n compare: val
                IfLess:  [ left  ifNil:    [left:  createNode: n]
                                 IfNotNil: [left   insert:     n]]
                Equal:   [ ^ error: 'adding duplicate' ]
                Greater: [ right ifNil:    [right: createNode: n]
                                 IfNotNil: [right  insert:     n]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> 'node' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         right.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         val.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 tree.
                } 
            | 
            initarr.
            tree: node createNode: sortlist at: 0.
            1 upTo: sortelements Do: [ | :i | tree insert: sortlist at: i ].
            tree checkTree || [ error: 'Error in Tree' ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'tree_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: treesort\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         tree_oo_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks tree_oo_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         node = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'node' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks tree_oo_r node.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         empty = bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         left.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'node' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks tree_oo_r node parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'node' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         checkTree = ( |
            | 
            ((left  isNil) || [(left  val < val) && [left  checkTree]]) &&
            [(right isNil) || [(right val > val) && [right checkTree]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'node' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         count <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'node' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         createNode: n = ( |
            | empty copy val: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'node' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         insert: n = ( |
            | 
            n compare: val
                IfLess:  [ left    ifNil: [left:  createNode: n]
                                IfNotNil: [left   insert: n]]
                Equal:   [ ^ error: 'adding duplicate' ]
                Greater: [ right    ifNil: [right: createNode: n]
                                 IfNotNil: [right  insert: n]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'node' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         right.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         val.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_oo_r' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 tree.
                } 
            | 
            initarr.
            sortlist doFirst: [ | :val | tree: node copy val: val ]
                  MiddleLast: [ | :val | tree insert: val ].
            tree checkTree || [ error: 'Error in Tree' ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks tree_oo_r selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 480.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 710.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_oo_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'r_tree_oo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'Category: treesort\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         tree_r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> () From: ( |
             {} = 'Comment: Sorts an array using treesort\x7fModuleInfo: Creator: globals benchmarks tree_r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree' -> 'cTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         checkTree: p = ( |
             result <- bootstrap stub -> 'globals' -> 'true' -> ().
            | 
            " check by inorder traversal "
            p left ifNotNil: [
                p left val <= p val ifTrue: [result: false]
                False: [result: (checkTree: p left) && [result]]].
            p right ifNotNil: [
                p right val >= p val ifTrue: [result: false]
                False: [result: (checkTree: p right) && [result]]].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         createNode: n = ( |
            | node copy val: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         insert: n Into: t = ( |
            | 
            " insert n into tree "
            n > t val ifTrue: [
                t left    ifNil: [t left: createNode: n]
                       IfNotNil: [insert: n Into: t left]]
            False: [
                n < t val ifTrue: [
                    t right    ifNil: [t right: createNode: n]
                            IfNotNil: [insert: n Into: t right]]
                False: [ error: 'adding a duplicate value to tree' ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         node = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> 'node' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks tree_r node.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         left.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         right.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         val.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'quick_r' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 tree.
                } 
            | 
            initarr.
            sortlist doFirst: [ | :val | tree: node copy val: val ]
                  MiddleLast: [ | :val | insert: val Into: tree ].
            (checkTree: tree) ifFalse: [' Error in Tree.\n'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks tree_r selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 560.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 800.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'tree_r' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'tree_r'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         typeinf = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks typeinf.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks typeinf cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            ((reflect: shell) lookupKey: 'solver') size = 0 ifTrue: [
                'allti.self' _RunScript.
            ].
            globals inf solver reset.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            "CAUTION: this will take a very long time if you don't remove"
            "bigInts from your snapshot"
            globals inf solver reset. globals inf solver run: testObj.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks typeinf selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 1070.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 1780.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'typeinf'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         testObj = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'testObj' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks typeinf testObj.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'testObj' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         main = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 s.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            s: sub1. t: sub2. t: sub1.
            s have: 30 Choose: 15.
            sub2 have: 10.0 Choose: 1.
            s have: 1 Choose: (t have: t z  Choose: 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'testObj' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'testObj' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks typeinf testObj parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'testObj' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         have: x Choose: y = ( |
            | 
            (y = 0) || (y = x) ifTrue: [^ z].
            x = 9999 ifTrue: [ ^ 'hey, x is 9999' ].
            (have: x   Choose: (y - 1.0)) + 
              (have: (x - 1) Choose: (y - 1))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'testObj' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sub1 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'testObj' -> 'sub1' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks typeinf testObj sub1.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'testObj' -> 'sub1' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'testObj' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'testObj' -> 'sub1' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         z = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'testObj' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sub2 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'testObj' -> 'sub2' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks typeinf testObj sub2.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'testObj' -> 'sub2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* <- bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'testObj' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'typeinf' -> 'testObj' -> 'sub2' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         z = 4.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ui1 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui1' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks ui1.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui1' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks ui1 cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui1' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            initialized ifFalse: [ 'ui1bm.self' _RunScript. initialized: true].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialized <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            ui test.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui1' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks ui1 selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui1' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui1' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 500.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui1' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 840.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ui3 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui3' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks ui3.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui3' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui3' -> 'cTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks ui3 cTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui3' -> 'cTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui3' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            win ifNil: [
                'ui3.self' _RunScript.
                win: ui3InvisibleWindow copyOpen.
                win setUpTest.
                win collectInput: false
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui3' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui3' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         runBenchmark = ( |
            | 
            win doSteps: 100.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui3' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         selfTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui3' -> 'selfTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks ui3 selfTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui3' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui3' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         ss10_41 = 320.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui3' -> 'selfTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sun4c_75 = 790.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui3' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         shortName = 'ui3'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'ui3' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (nil)'
        
         win.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'unmeasuredCTimes' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         undefinedSelector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: a = ( |
            | 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         benchmarks = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'benchmarks' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'benchmarks' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules benchmarks.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         myComment <- 'This is a suite of benchmarks that are relatively short, both in program
                size and execution time.  It requires no input, and prints the execution
                time for each program.  It does a rudimentary check to
                make sure each program gets the right output.  These programs were
                gathered by John Hennessy and modified by Peter Nye.\"

            \"Note: Reading in this file also reads in some additional files. Search
             for the string \'_RunScript\' to see where this is done.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            benchmarks intmm mmMatrix: benchmarks intmm ma.
            benchmarks intmm mmMatrix: benchmarks intmm mb.
            benchmarks intmm mmMatrix: benchmarks intmm mr.

            benchmarks intmm_oo xma new.
            benchmarks intmm_oo xmb new.
            benchmarks intmm_oo xmr new.

            benchmarks puzzle init.


            benchmarks suite add: benchmarks recur.

            benchmarks suite add: benchmarks sumTo.
            benchmarks suite add: benchmarks sumFromTo.
            benchmarks suite add: benchmarks fastSumTo.

            benchmarks suite add: benchmarks nestedLoop.

            benchmarks suite add: benchmarks atAllPut.
            benchmarks suite add: benchmarks sumAll.
            benchmarks suite add: benchmarks incrementAll.

            benchmarks suite add: benchmarks tak.
            benchmarks suite add: benchmarks takl.
            benchmarks suite add: benchmarks takl_oo.

            benchmarks suite add: benchmarks sieve.

            benchmarks suite add: benchmarks perm.
            benchmarks suite add: benchmarks towers.
            benchmarks suite add: benchmarks queens.
            benchmarks suite add: benchmarks intmm.
            benchmarks suite add: benchmarks quick.
            benchmarks suite add: benchmarks bubble.
            benchmarks suite add: benchmarks tree.

            benchmarks suite add: benchmarks perm_oo.
            benchmarks suite add: benchmarks towers_oo.
            benchmarks suite add: benchmarks queens_oo.
            benchmarks suite add: benchmarks intmm_oo.
            benchmarks suite add: benchmarks quick_oo.
            benchmarks suite add: benchmarks bubble_oo.
            benchmarks suite add: benchmarks tree_oo.

            benchmarks suite add: benchmarks puzzle.

            benchmarks suite add: benchmarks richards.

            benchmarks coreSuite add: benchmarks sieve.
            benchmarks coreSuite add: benchmarks perm_oo.
            benchmarks coreSuite add: benchmarks towers_oo.
            benchmarks coreSuite add: benchmarks queens_oo.
            benchmarks coreSuite add: benchmarks intmm_oo.
            benchmarks coreSuite add: benchmarks quick_oo.
            benchmarks coreSuite add: benchmarks bubble_oo.
            benchmarks coreSuite add: benchmarks tree_oo.
            benchmarks coreSuite add: benchmarks puzzle.
            benchmarks coreSuite add: benchmarks richards.

            benchmarks largeSuite add: benchmarks parser.
            benchmarks largeSuite add: benchmarks primitiveMaker.
            benchmarks largeSuite add: benchmarks deltablue.

            benchmarks measuringSuite addAll: benchmarks suite.
            benchmarks measuringSuite addAll: benchmarks largeSuite.


            benchmarks stanford add: benchmarks sieve.
            benchmarks stanford add: benchmarks perm.
            benchmarks stanford add: benchmarks towers.
            benchmarks stanford add: benchmarks queens.
            benchmarks stanford add: benchmarks intmm.
            benchmarks stanford add: benchmarks quick.
            benchmarks stanford add: benchmarks bubble.
            benchmarks stanford add: benchmarks tree.
            benchmarks stanford add: benchmarks perm_oo.
            benchmarks stanford add: benchmarks towers_oo.
            benchmarks stanford add: benchmarks queens_oo.
            benchmarks stanford add: benchmarks intmm_oo.
            benchmarks stanford add: benchmarks quick_oo.
            benchmarks stanford add: benchmarks bubble_oo.
            benchmarks stanford add: benchmarks tree_oo.
            benchmarks stanford add: benchmarks puzzle.

            benchmarks rsuite add: benchmarks sieve_r.
            benchmarks rsuite add: benchmarks perm_r.
            benchmarks rsuite add: benchmarks towers_r.
            benchmarks rsuite add: benchmarks queens_r.
            benchmarks rsuite add: benchmarks intmm_r.
            benchmarks rsuite add: benchmarks quick_r.
            benchmarks rsuite add: benchmarks bubble_r.
            benchmarks rsuite add: benchmarks tree_r.

            benchmarks rsuite add: benchmarks perm_oo_r.
            benchmarks rsuite add: benchmarks towers_oo_r.
            benchmarks rsuite add: benchmarks queens_oo_r.
            benchmarks rsuite add: benchmarks intmm_oo_r.
            benchmarks rsuite add: benchmarks quick_oo_r.
            benchmarks rsuite add: benchmarks bubble_oo_r.
            benchmarks rsuite add: benchmarks tree_oo_r.
            benchmarks rsuite add: benchmarks puzzle_r.
            benchmarks rsuite add: benchmarks quick2.
            benchmarks rsuite add: benchmarks mergesort.


            benchmarks oosuite add: benchmarks ccom.
            benchmarks oosuite add: benchmarks cint.
            benchmarks oosuite add: benchmarks deltablue.
            benchmarks oosuite add: benchmarks mango.
            benchmarks oosuite add: benchmarks primitiveMaker.
            benchmarks oosuite add: benchmarks richards.
            benchmarks oosuite add: benchmarks typeinf.
            benchmarks oosuite add: benchmarks ui1.
            benchmarks oosuite add: benchmarks ui3.

            benchmarks oosuite2 add: benchmarks cint2.
            benchmarks oosuite2 add: benchmarks mango.
            benchmarks oosuite2 add: benchmarks mango2.
            benchmarks oosuite2 add: benchmarks primitiveMaker2.

            benchmarks puzzle p do: [|:e. :i|
              benchmarks puzzle p at: i Put: vector copySize: 512.
            ].
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- '
	 richards
	 '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nil' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         shorterp: y = ( |
            | != y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nil' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         taklY: y Z: z = ( |
            | z).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         cTime = ( |
            | cTimes _Perform: thisHost model name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> () From: ( | {
         'Comment: nil out data structs generated by benchmark to save space in the image\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         finalize = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> () From: ( | {
         'Comment: create static data structs used by benchmark\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialize = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initrand = ( |
            | seed: 74755).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformance = ( |
            | measurePerformance: benchmarks defaultIters).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformance: iters = ( |
            | 
            measurePerformance: iters Compiler: benchmarks defaultCompiler).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         measurePerformance: iters Compiler: compiler = ( |
            | 
            benchmarks measurePerformanceHeading print.
            benchmarks measurePerformanceOf: self Runs: iters Compiler: compiler.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         needsGC = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         rand = ( |
            | seed: ((seed * 1309) + 13849) && 65535. seed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> () From: ( | {
         'Comment: run is the complete run (including intialization & finalization),
     and runBenchmarks is the actual core of the benchmark\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         run = ( |
            | initialize. runBenchmark. finalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sTime = ( |
            | selfTimes _Perform: thisHost model name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         seed <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         shorterp: y = ( |
            | 
            y isNotNil && [ cdr shorterp: y cdr ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'cons' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         taklY: y Z: z = ( |
            | 
            (y shorterp: self) ifFalse: [ z ] True: [
                       (cdr taklY: y Z: z)
                taklY: (y cdr taklY: z Z: self)
                    Z: (z cdr taklY: self Z: y) ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'doAllBenchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         finalize = ( |
            | v: vector copySize: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'doAllBenchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initialize = ( |
            | v: vector copySize: 100000 FillingWith: 5).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'doAllBenchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'benchmarks' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'doAllBenchmarks' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         v <- [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: traits bench doAllBenchmarks v.
'.
                    | ) ) _Clone: 1 Filler: 0| 
             x _At: 0  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'traits' -> 'bench' -> 'doAllBenchmarks') \/-> 'v') -> () _At: 0 Put: (
     bootstrap stub -> 'globals' -> 'nil' -> ())

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: private'
        
         ascendingOrder = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'indexable' -> 'ascendingOrder' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits indexable ascendingOrder.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> 'ascendingOrder' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         element: e1 Equals: e2 = ( |
            | e1 = e2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> 'ascendingOrder' -> () From: ( | {
         'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         element: e1 Precedes: e2 = ( |
            | e1 < e2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: quicksorting\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         insertionSort = ( |
            | 
            insertionSortFrom: 0 To: size pred By: ascendingOrder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: quicksorting\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         insertionSortFrom: start To: stop By: cmp = ( |
            | 
            start succ to: stop Do: [| :j. el. dest |
                el: (at: j).
                dest: j.
                [(dest > start) &&
                 [cmp element: el Precedes: (at: dest pred)]] whileTrue: [
                    at: dest Put: (at: dest pred).
                    dest: dest pred.
                ].
                at: dest Put: el.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: quicksorting\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: private'
        
         partitionFrom: start To: stop By: cmp = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 left.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 pIndex.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 pivot.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 right.
                } 
            | 
            pIndex: start + (random integer: (stop - start)).
            pivot:  (at: pIndex).
            left:   start.
            right:  stop.
            [
                "invariant: start <= left <= right <= stop"
                "invariant: some element = pivot is located in [left...right]"
                "scan left and right, stopping at a pivot if not before"
                [ cmp element: (at: left) Precedes: pivot ] whileTrue: [
                    left: left succ.
                ].
                [ cmp element: pivot Precedes: (at: right) ] whileTrue: [
                    right: right pred.
                ].

                (left = right) ifTrue: [ ^left ].

                (cmp element: (at: left)  Equals: pivot) &&
                [cmp element: (at: right) Equals: pivot] ifTrue: [
                "try to keep left and right partitions balanced"
                "Warning: omitting this balancing code leads to deep
                 stacks when sorting arrays of equal-valued elements"
                (left - start) < (stop - right)
                    ifTrue: [  left:  left succ ]
                     False: [ right: right pred ].

                ] False: [ swap: left With: right ].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: quicksorting\x7fComment: use insertion sort below this limit\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: private'
        
         qsortThreshold = 60.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: quicksorting\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         quicksort = ( |
            | sortFrom: 0 To: size pred By: ascendingOrder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: quicksorting\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         quicksortBy: cmp = ( |
            | sortFrom: 0 To: size pred By: cmp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: quicksorting\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: private'
        
         quicksortFrom: start To: stop By: cmp = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 splitIndex.
                } 
            | 
            splitIndex: partitionFrom: start To: stop By: cmp.
            (splitIndex - start) > qsortThreshold ifTrue:
                [ quicksortFrom: start To: splitIndex By: cmp ].
            (stop - splitIndex succ) > qsortThreshold ifTrue:
                [ quicksortFrom: splitIndex succ To: stop By: cmp ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: quicksorting\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         sortFrom: start To: stop By: cmp = ( |
            | 
            "Sort the given subrange of the receiver in place."
            "Details: quicksort elements into rough order, then insertion
             sort. qsortThreshold, which is approximately the point at which
             insertion sort becomes faster than quicksort, was determined
             empirically (while running only the new compiler)."

            (stop - start) > qsortThreshold ifTrue:
                [ quicksortFrom: start To: stop By: cmp ].
            insertionSortFrom: start To: stop By: cmp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: quicksorting\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot\x7fVisibility: public'
        
         swap: i With: j = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t:         (at: i).
            at: i Put: (at: j).
            at: j Put: t.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         nestedLoopTest = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 sum <- 0.
                } 
            | 
            1 to: 100 Do: [ 1 to: 100 Do: [ sum: sum + 1 ] ].
            sum).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         atAllPut: value = ( |
            | 0 upTo: size By: 1 Do: [| :i | at: i Put: value]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         bubbleSort = ( |
            | 
            size predecessor downTo: 1 Do: [ | :top |
                0 upTo: top Do: [ | :i |
                    (at: i) > (at: i successor) ifTrue: [ | j |
                        j: at: i.
                        at: i Put: at: i successor.
                        at: i successor Put: j.
                    ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         bubbleSort_r = ( |
            | 
            size reverseDo: [ | :top |
                top do: [ | :i |
                    (at: i) > (at: i + 1) ifTrue: [ | j |
                        j: at: i.
                        at: i Put: at: i + 1.
                        at: i + 1 Put: j.
                    ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         commentedOut = '
    init: benchmark = (
	rowsize do: [ | :i. |
	    rowsize do: [ | :j. temp. |
		temp: benchmark newValue.
		(at: i) at: j Put: temp - ((temp / 120) * 120) - 60 ]].
    	self).
    '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         incrementAll = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 sum <- 0.
                } 
            | 
            do: [ | :v. :i | at: i Put: v + 1 ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         init = ( |
            | 
            rowsize do: [ | :i. |
                rowsize do: [ | :j. temp. |
                    temp: benchmarks intmm_oo newValue.
                    (at: i) at: j Put: temp - ((temp / 120) * 120) - 60 ]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking_r\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         init: benchmark = ( |
            | 
            rowsize_r do: [ | :i. |
                rowsize_r do: [ | :j. temp. |
                    temp: benchmark newValue.
                    (at: i) at: j Put: temp - ((temp / 120) * 120) - 60 ]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         initarr: benchmark = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 biggest <- -1000000.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 littlest <- 1000000.
                } 
            | 
            do: [ | :v. :i. temp. |
                temp: benchmark rand.
                at: i Put: temp - ((temp / 100000) * 100000) - 50000.
                (at: i) > biggest ifTrue: [ biggest: at: i ].
                (at: i) < littlest ifTrue: [ littlest: at: i ].
            ].
            benchmark biggest: biggest.
            benchmark littlest: littlest).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         innerProductWith: m Col: c = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 sum <- 0.
                } 
            | 
            do: [ | :v. :i |
                sum: sum + (v * ((m at: i) at: c)) ].
            sum).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking_r\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         mul: m = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: new_r.
            rowsize_r do: [ | :i |
                 rowsize_r do: [ | :j. |
                    (r at: i) at: j Put: (at: i) innerProductWith: m Col: j.
                ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         mul: m Into: r = ( |
            | "| r |"
            "r: new."
            rowsize do: [ | :i |
                 rowsize do: [ | :j. |
                    (r at: i) at: j Put: (at: i) innerProductWith: m Col: j.
                ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         new = ( |
            | "| r |"
            "r: copySize: rowsize."
            rowsize do: [ | :i | "r" at: i Put: vector copySize: rowsize ].
            "r" self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking_r\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         new_r = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: copySize: rowsize_r.
            rowsize_r do: [ | :i | r at: i Put: vector copySize: rowsize_r ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         permInitialize = ( |
            | 
            1 upTo: size Do: [  | :v. :i | at: i Put: i predecessor ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         permSwap: a With: b = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: at: a.
            at: a Put: at: b.
            at: b Put: t.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         permute: n = ( |
            | 
            benchmarks perm_oo pctr: benchmarks perm_oo pctr successor.
            n > 1 ifTrue: [
                permute: n predecessor.
                n predecessor downTo: 1 Do: [ | :k |
                    permSwap: n With: k.
                    permute: n predecessor.
                    permSwap: n With: k.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         quickSort = ( |
            | quickSortFrom: 0 To: size predecessor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         quickSortFrom: l To: r = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 j.
                }  {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 x.
                } 
            | 
            i: l.
            j: r.
            x: at: (l + r) / 2.
            [
                [(at: i) < x] whileTrue: [i: i successor].
                [x < (at: j)] whileTrue: [j: j predecessor].
                i <= j ifTrue: [ | w |
                    w: at: i.
                    at: i Put: at: j.
                    at: j Put: w.
                    i: i successor.
                    j: j predecessor.
                ].
            ] untilFalse: [ i <= j ].

            l < j ifTrue: [quickSortFrom: l To: j].
            i < r ifTrue: [quickSortFrom: i To: r]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         rowsize = 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking_r\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         rowsize_r <- 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: benchmarking\x7fModuleInfo: Module: benchmarks InitialContents: FollowSlot'
        
         sumAll = ( | {
                 'ModuleInfo: Module: benchmarks InitialContents: FollowSlot'
                
                 sum <- 0.
                } 
            | 
            do: [ | :i | sum: sum + i ].
            sum).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'richards' From: 'tests'



 '-- Side effects'

 globals modules benchmarks postFileIn
