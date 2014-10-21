 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. 
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         pep_extensions = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pep_extensions' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pep_extensions' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pep_extensions.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pep_extensions' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/pep'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pep_extensions' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pep_extensions' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pep_extensions' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pep_extensions' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pep_extensions' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> () From: ( | {
         'Category: extensions\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: public'
        
         benchmarks = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pep' -> 'benchmarks' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pep benchmarks.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         allRichards = ( |
            | benchmark: 'allRichards').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         benchmark: className = ( |
             cl.
             cp.
            | 
            cp: pep loader classPath.
            pep loader classPath: '/home/ungar/java/bench', ':', cp.
            cl: pep loader getClassNamed: className.
            10 do: [ |:i |
              i print.
              ': ' print.
              [cl o_main
              ] time printLine.
            ].
            pep loader classPath: cp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         javac = ( |
             n = 20.
             r.
            | 
            r: vector copySize: n.
            n do: [ |:i |
              "unix command: '/bin/rm /home/self2/ungar/java/bench/COM/sun/labs/kanban/richards_gibbons/*.class'."
              r at: i Put: [(pep loader getClassNamed: 'sun.tools.javac.Main') o_main:
                    '/home/ungar/java/bench/COM/sun/labs/kanban/richards_gibbons/Richards.java'
              ] userTime.
              "unix command: '/bin/ls /home/self2/ungar/java/bench/COM/sun/labs/kanban/richards_gibbons/*.class'."
              i print. ' ' print.
            ].
            '' printLine.
            r do: [|:t. :i| i print. '\t' print. t printLine].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         profileJavac = ( |
            | 
            [
              (pep loader getClassNamed: 'sun.tools.javac.Main') o_main:
                    '/home/ungar/java/bench/COM/sun/labs/kanban/richards_gibbons/Richards.java'.
            ] vmProfile.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'benchmarks' -> () From: ( | {
         'Category: individual richards\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         richards1 = ( |
            | 
            richards: 'gibbons').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'benchmarks' -> () From: ( | {
         'Category: individual richards\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         richards2 = ( |
            | richards: 'gibbons_no_switch').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'benchmarks' -> () From: ( | {
         'Category: individual richards\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         richards3 = ( |
            | 
            richards: 'deutsch_no_acc').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'benchmarks' -> () From: ( | {
         'Category: individual richards\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         richards4 = ( |
            | 
            richards: 'deutsch_acc_inline').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'benchmarks' -> () From: ( | {
         'Category: individual richards\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         richards5 = ( |
            | 
            richards: 'deutsch_acc_virtual').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'benchmarks' -> () From: ( | {
         'Category: individual richards\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         richards6 = ( |
            | 
            richards: 'deutsch_acc_interface').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'benchmarks' -> () From: ( | {
         'Category: individual richards\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         richards: suffix = ( |
             cl.
             cp.
            | 
            cp: pep loader classPath.
            pep loader classPath: '/home/ungar/java/bench/COM/sun/labs/kanban/richards_', suffix, ':',
                                  '/home/ungar/java/bench', ':', cp.
            cl: pep loader getClassNamed: 'Richards'.
            10 do: [ |:i |
              i print.
              ': ' print.
              [cl o_main
              ] time printLine.
            ].
            pep loader classPath: cp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         testBenchpress = ( |
            | 
            20 do: [
              ( pep loader getClassNamed: 'BenchmarkRunner') o_main
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'benchmarks' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         testSumFromTo = ( |
             a.
            | 
            a: pep loader getClassNamed: 'SumFromToBenchmark'.
            20 do: [[a run] time printLine].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Object\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         java_lang_Object_registerNatives = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> () From: ( | {
         'Category: extensions\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: public'
        
         tests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pep tests.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         javac = ( |
            | 
            1 do: [ |:i |
              i print.
              ': ' print.
              [(pep loader getClassNamed: 'sun.tools.javac.Main') o_main:
                    '/home/ungar/java/bench/COM/sun/labs/kanban/richards_gibbons/Richards.java'
              ] time printLine.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         javacv = ( |
            | 
            1 do: [ |:i |
              i print.
              ': ' print.
              [(pep loader getClassNamed: 'sun.tools.javac.Main') o_main:
                    '-verbose /home/ungar/java/bench/COM/sun/labs/kanban/richards_gibbons/Richards.java'
              ] time printLine.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'Comment: This and its callees are my implementation
of Ole\'s pep loader test. -- dmu\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: public'
        
         testAll = ( |
            | 
            testPepTest.
            testRichards.
            testBenchpress.
            testJavaBenchmark.
            testParaffins.
            testJavac.
            testJack).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'Category: individual tests\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: public'
        
         testBenchpress = ( |
            | 
            testClassNamed: 'BenchmarkRunner').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'Category: helpers\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: private'
        
         testClassNamed: n = ( |
            | 
            testClassNamed: n With: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'Category: helpers\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: private'
        
         testClassNamed: n With: argString = ( |
            | 
            (pep loader getClassNamed: n) o_main: argString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'Category: individual tests\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: public'
        
         testJack = ( |
            | testClassNamed: 'SRI.Jack.Main'
            With: '/home/collection3/java/Jack/doc/Jack.jack').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'Category: individual tests\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: public'
        
         testJavaBenchmark = ( |
            | testClassNamed: 'Benchmark').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'Category: individual tests\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: public'
        
         testJavac = ( |
            | testClassName: 'sun.tools.javac.Main' 
            With: '/home/ungar/java/fromOle/local-java/code/Richards.java').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'ModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         testOrb = ( |
            | 
            (pep loader getClassNamed: 'perf_server') run_javaThreadInCurrentSelfProcess: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'Category: individual tests\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: public'
        
         testParaffins = ( |
            | testClassNamed: 'Paraffins' With: '16').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'Category: individual tests\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: public'
        
         testPepTest = ( |
            | 
            testClassNamed: 'PepTest').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'Category: individual tests\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot\x7fVisibility: public'
        
         testRichards = ( |
            | 
            testClassNamed: 'richards.all').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'Category: individual tests\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         testSimpleTest1 = ( |
            | 
            testClassNamed: 'SimpleTest1').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'tests' -> () From: ( | {
         'Category: individual tests\x7fModuleInfo: Module: pep_extensions InitialContents: FollowSlot'
        
         testSimpleTest2 = ( |
            | 
            testClassNamed: 'SimpleTest2' With: '42 84').
        } | ) 



 '-- Side effects'

 globals modules pep_extensions postFileIn
