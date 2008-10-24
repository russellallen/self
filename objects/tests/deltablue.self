 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: bench\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         abstractConstraint = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractConstraint' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractConstraint.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractConstraint' -> () From: ( | {
         'Comment: output var of each method\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         methodOuts <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         constraint = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits bench constraint.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         strength <- 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         variables <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractConstraint' -> () From: ( | {
         'Comment: index of chosen method or none\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         whichMethod <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: bench\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         constraintVariable = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'constraintVariable' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals constraintVariable.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         constraints <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         determinedBy <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         mark <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         constraintVariable = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'bench' -> 'constraintVariable' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits bench constraintVariable.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'constraintVariable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         stay <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         value <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         walkStrength <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: bench\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         deltablue = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals deltablue.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         benchmark: chainLength Iters: count = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 editC.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 first.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 last.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 plan.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 prev.
                } 
            | 

            "build chain of n equality constraints"
            chainLength do: [
                | :i. v |
                v:  constraintVariable copyValue: 0.
                i = 0
                    ifTrue: [ first: v ]
                     False: [ equalsConstraint var: prev Var: v ].
                i = (chainLength - 1) ifTrue: [ last: v ].
                prev: v.
            ].
            stayConstraint var: last Strength: default.

            "repeatedly: add a constraint, make and run plan, and remove the constraint"
            count do: [
                editC: editConstraint var: first Strength: strongDefault.
                plan:  planner extractPlanFromConstraint: editC.
                planner executePlan: plan.
                editC removeConstraint.
            ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         chain: n = ( |
            | chain: n Noisy: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         chain: n Noisy: noisy = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 first.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 last.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 prev.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 t.
                } 
            | 

            t: [
                n do: [
                    | :i. v |
                    v:  constraintVariable copyValue: 0.
                    i = 0
                        ifTrue: [ first: v ]
                        False:  [ equalsConstraint var: prev Var: v ].
                    i = (n - 1) ifTrue: [ last: v ].
                    prev: v.
                ].
                stayConstraint var: last Strength: default
            ] cpuTime.

            noisy ifTrue: [
                ('Chain benchmark: ', t printString, ' msecs to build ',
                 ' a chain of ', n printString, ' constraints.') printLine ].

            noisy ifTrue: [ 'Case 1: ' print ].
            modifyBenchmark: first Strength: strongDefault Noisy: noisy.

            noisy ifTrue: [ 'Case 2: ' print ].
            modifyBenchmark: first Strength: weakDefault Noisy: noisy.

            noisy ifTrue: [ 'Case 3: ' print ].
            modifyBenchmark: last Strength: strongDefault Noisy: noisy.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         default = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         modifyBenchmark: v Strength: s Noisy: noisy = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 addTime.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 editC.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 execTime.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 plan.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 planTime.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 removeTime.
                } 
            | 

            addTime: [
                editC:  editConstraint var: v Strength: strongDefault.
            ] cpuTime.
            planTime: [
                plan:  planner extractPlanFromConstraint: editC.
            ] cpuTime.
            execTime: [
                planner executePlan: plan.
            ] cpuTime.
            removeTime: [
                editC removeConstraint.
            ] cpuTime.

            noisy ifTrue: [
                ('add: '            , addTime printString,
                 ' plan: '          , planTime printString,
                 ' execute: '       , execTime printString,
                 ' remove: '        , removeTime printString,
                 ' plan size: '     , plan size printString) printLine ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         none = -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         planner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'deltablue' -> 'planner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals deltablue planner.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> 'planner' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: public'
        
         addPropagate: c = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 todo.
                } 
            | 
            todo: list copyRemoveAll add: c.
            [todo isEmpty] whileFalse: [
                | d |
                d: todo removeFirst.
                d output mark = currentMark ifTrue: [
                    "cycle found; remove c and return false"
                    incrementalRemove: c.
                    ^ false.
                ].
                d recalculate.
                todo addAll: d output consumingConstraints.
            ].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> 'planner' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         currentMark <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> 'planner' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: public'
        
         executePlan: p = ( |
            | p do: [ | :c | c execute ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> 'planner' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: public'
        
         extractPlanFromConstraint: c = ( |
            | 
            c isInput && c isSatisfied
                ifTrue: [ makePlan: (list copyRemoveAll add: c) ]
                False:  [ vector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> 'planner' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: public'
        
         extractPlanFromConstraints: clist = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 sources.
                } 
            | 
            sources: list copyRemoveAll.
            clist do: [ | :c |
                c isInput && c isSatisfied ifTrue: [ sources add: c ].
            ].
            makePlan: sources).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> 'planner' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: public'
        
         extractPlanFromVariables: vlist = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 sources.
                } 
            | 
            sources: list copyRemoveAll.
            vlist do: [ | :v |
                v constraints do: [ | :c |
                     c isInput && c isSatisfied ifTrue: [ sources add: c ].
                ].
            ].
            makePlan: sources).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> 'planner' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: public'
        
         incrementalAdd: c = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 overridden.
                } 
            | 
            newMark.
            overridden:  c satisfy: currentMark.
            [overridden != none] whileTrue: [
                overridden:  overridden satisfy: currentMark
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> 'planner' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: public'
        
         incrementalRemove: c = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 out.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 unsatisfied.
                } 
            | 
            out: c output.
            c whichMethod: none.
            c variables do: [| :v | v detachConstraint: c ].
            unsatisfied:  removePropagateFrom: out.
            required downTo: weakest Do: [
                | :s |
                unsatisfied do: [
                    | :u |
                    u strength = s ifTrue: [incrementalAdd: u].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> 'planner' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         makePlan: clist = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 plan.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 todo.
                } 
            | 
            newMark.
            plan: sequence copyRemoveAll.
            todo: clist.
            [todo isEmpty] whileFalse: [
                | c |
                c: todo removeFirst.
                (c output mark != currentMark) && (c inputsKnown: currentMark) ifTrue: [
                    plan add: c.
                    c output mark: currentMark.
                    todo addAll: c output consumingConstraints.
                ].
            ].
            plan asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> 'planner' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         newMark = ( |
            | currentMark: currentMark succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> 'planner' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'deltablue' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> 'planner' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         removePropagateFrom: v = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 todo.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 unsatisfied.
                } 
            | 
            unsatisfied: list copyRemoveAll.
            v determinedBy: none.
            v walkStrength: weakest.
            v stay: true.
            todo:  list copyRemoveAll add: v.
            [todo isEmpty] whileFalse: [
                | v |
                v: todo removeFirst.
                v constraints do: [
                    | :c |
                    c isSatisfied ifTrue: [
                        c != v determinedBy ifTrue: [
                            c recalculate.
                            todo addLast: c output.
                        ].
                    ] False: [
                        unsatisfied add: c
                    ].
                ].
            ].
            unsatisfied).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> 'planner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            'deltablue planner clone: ', currentMark storeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> 'planner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         storeStringNeeds = ( |
            | deltablue planner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         preferred = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'Comment: strength constants\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         required = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         strengthString: s = ( |
            | 
            s = 6 ifTrue: [ ^'required' ].
            s = 5 ifTrue: [ ^'strong preferred' ].
            s = 4 ifTrue: [ ^'preferred' ].
            s = 3 ifTrue: [ ^'strong default' ].
            s = 2 ifTrue: [ ^'default' ].
            s = 1 ifTrue: [ ^'weak default' ].
            s = 0 ifTrue: [ ^'weakest' ].
            'unknown strength').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         strongDefault = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         strongPreferred = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         test1 = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 a.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 b.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            a:  constraintVariable copyValue: 1.
            b:  constraintVariable copyValue: 2.
            c:  constraintVariable copyValue: 11.

            multConstraint var: a Var: b Var: c.
            a _Print.
            b _Print.
            c _Print.
            'done').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         test2 = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 c.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 f.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 five.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 nine.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 t1.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 t2.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 thirtyTwo.
                } 
            | 

            c:              constraintVariable copyValue: 0.
            f:              constraintVariable copyValue: 0.
            t1:             constraintVariable copyValue: 1.
            t2:             constraintVariable copyValue: 1.
            nine:           constraintVariable copyConstant: 9.
            five:           constraintVariable copyConstant: 5.
            thirtyTwo:      constraintVariable copyConstant: 32.

            'Adding constraints...' print.
            multConstraint var: c  Var: nine      Var: t1.
            multConstraint var: t2 Var: five      Var: t1.
            plusConstraint var: t2 Var: thirtyTwo Var: f.
            'added.' printLine.

            (c printString, ' celcius = ', f printString, ' fahrenheit \n') printLine.

            c set: 0.
            (c printString, ' celcius = ', f printString, ' fahrenheit \n') printLine.

            f set: 0.
            (c printString, ' celcius = ', f printString, ' fahrenheit \n') printLine.

            c set: 100.
            (c printString, ' celcius = ', f printString, ' fahrenheit \n') printLine.

            f set: -40.
            (c printString, ' celcius = ', f printString, ' fahrenheit \n') printLine.

            'done').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         weakDefault = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         weakest = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         addConstraint = ( |
            | 
            variables do: [ | :v | v attachConstraint: self ].
            whichMethod: none.
            planner incrementalAdd: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         chooseMethod: mark = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 best.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 bestOutStrength.
                } 
            | 
            best: none.
            bestOutStrength: strength.
            methodOuts size reverseDo: [
                | :mIndex. mOutput |
                mOutput: methodOuts at: mIndex.
                ((mOutput mark != mark) &&
                 (mOutput walkStrength < bestOutStrength)) ifTrue: [
                    best: mIndex.
                    bestOutStrength: mOutput walkStrength.
                ].
            ].
            best).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         computeStay = ( |
            | 
            isInput ifTrue: [ ^false ].
            inputsDo: [ | :v | v stay ifFalse: [ ^false ] ].
            ^true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         computeWalkStrength = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 min.
                } 
            | 
            min: strength.
            methodOuts do: [
                | :mOutput |
                ((mOutput != output) &&
                 (mOutput walkStrength < min)) ifTrue:
                    [ min: mOutput walkStrength ].
            ].
            min).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         descendantResponsibilities = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> 'descendantResponsibilities' -> () From: ( |
             {} = 'Comment: The following methods must be implemented by a descendant.\x7fModuleInfo: Creator: traits bench constraint descendantResponsibilities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: public'
        
         execute = ( |
            | 'Execute the selected method of this constraint.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         inputsDo: block = ( |
            | 
            variables do: [
                | :v |
                v = output ifFalse: [ block value: v ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         inputsKnown: mark = ( |
            | 
            inputsDo: [
                | :in |
                ((in mark = mark) ||
                 (in stay) ||
                 (in determinedBy = none)) ifFalse:
                    [ ^false ].
            ].
            ^true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         isInput = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         isRequired = ( |
            | strength = required).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         isSatisfied = ( |
            | whichMethod != none).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         markUnsatisfied = ( |
            | whichMethod: none).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         notEnforcedError = ( |
            | error: 'Implementation error: Constraint is not enforced').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         output = ( |
            | methodOuts at: whichMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'deltablue' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         recalculate = ( |
            | 
            output walkStrength: computeWalkStrength.
            output stay: computeStay.
            output stay ifTrue: [ execute ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         removeConstraint = ( |
            | 
            isSatisfied ifTrue: [ planner incrementalRemove: self ].
            variables do: [ | :v | v detachConstraint: self ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         satisfy: mark = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 overridden.
                } 
            | 
            whichMethod: chooseMethod: mark.
            isSatisfied ifTrue: [
                inputsDo: [| :in | in mark: mark ].
                overridden: output determinedBy.
                overridden != none ifTrue: [ overridden whichMethod: none ].
                output determinedBy: self.
                (planner addPropagate: self) ifFalse: [
                    error: 'Cycle encountered'.
                    ^ none.
                ].
                output mark: mark.
                ^ overridden.
            ]
            False: [
                strength = required ifTrue: [
                    error: 'Failed to satisfy a required constraint'.
                ].
                ^ none.
            ].
            error: 'should never get here').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         statePrintString = ( |
            | 'on: ', variables printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         var: v1 = ( |
            | 
            var: v1 Strength: required).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'Comment: creating new constraints\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         var: v1 Strength: s = ( |
            | 
            ( (copyVar: v1) strength: s) addConstraint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         var: v1 Var: v2 = ( |
            | 
            var: v1 Var: v2 Strength: required).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         var: v1 Var: v2 Strength: s = ( |
            | 
            ( (copyVar: v1 Var: v2) strength: s ) addConstraint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         var: v1 Var: v2 Var: v3 = ( |
            | 
            var: v1 Var: v2 Var: v3 Strength: required).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         var: v1 Var: v2 Var: v3 Strength: s = ( |
            | 
            ( (copyVar: v1 Var: v2 Var: v3) strength: s ) addConstraint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: bench\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         editConstraint = bootstrap define: bootstrap stub -> 'globals' -> 'editConstraint' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractConstraint _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'editConstraint' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals editConstraint.

CopyDowns:
globals abstractConstraint. _Clone 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         editConstraint = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'bench' -> 'editConstraint' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits bench editConstraint.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'editConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'editConstraint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: bench\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         equalsConstraint = bootstrap define: bootstrap stub -> 'globals' -> 'equalsConstraint' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractConstraint _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'equalsConstraint' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals equalsConstraint.

CopyDowns:
globals abstractConstraint. _Clone 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         equalsConstraint = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'bench' -> 'equalsConstraint' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits bench equalsConstraint.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'equalsConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'equalsConstraint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         deltablue = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'deltablue' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'deltablue' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules deltablue.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         myComment <- 'DeltaBlue--A simple, incremental constraint satisfier.\"
            \"John Maloney, September 1991\"

            \"Note:  Some aspects of this program are deliberately not object-oriented
            to maintain correspondence with the published pseudocode. Also, many privacy
            declarations are missing. This code is supplied as a useful system benchmark,
            not as a finished constraint satisfier.\"

            \"Tests:
                deltablue test1.
                deltablue test2.
                deltablue chain: 1000'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'deltablue' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: bench\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         multConstraint = bootstrap define: bootstrap stub -> 'globals' -> 'multConstraint' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractConstraint _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'multConstraint' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals multConstraint.

CopyDowns:
globals abstractConstraint. _Clone 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         multConstraint = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'bench' -> 'multConstraint' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits bench multConstraint.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'multConstraint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: bench\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         plusConstraint = bootstrap define: bootstrap stub -> 'globals' -> 'plusConstraint' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractConstraint _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'plusConstraint' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals plusConstraint.

CopyDowns:
globals abstractConstraint. _Clone 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         plusConstraint = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'bench' -> 'plusConstraint' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits bench plusConstraint.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'plusConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'plusConstraint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: bench\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         stayConstraint = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'stayConstraint' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals stayConstraint.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stayConstraint' -> () From: ( | {
         'Comment: output var of each method\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         methodOuts <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         stayConstraint = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'bench' -> 'stayConstraint' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits bench stayConstraint.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stayConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'stayConstraint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stayConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         strength <- 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stayConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         variables <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stayConstraint' -> () From: ( | {
         'Comment: index of chosen method or none\x7fModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         whichMethod <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         attachConstraint: c = ( |
            | constraints add: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         consumingConstraints = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 consumers.
                } 
            | 
            consumers: list copyRemoveAll.
            constraints do: [
                | :c |
                ((c isSatisfied) && (c != determinedBy)) ifTrue: [ consumers add: c ].
            ].
            consumers).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         copy = ( |
            | resend.copy constraints: list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         copyConstant: val = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 new.
                } 
            | 
            new: copy.
            new value: val.
            new walkStrength: required.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         copyValue: val = ( |
            | copy value: val).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         detachConstraint: c = ( |
            | 
            constraints remove: c IfAbsent: nil.
            determinedBy = c ifTrue: [ determinedBy: none ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'deltablue' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         set: newValue = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 editC.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 plan.
                } 
            | 
            editC:  editConstraint var: self.
            editC isSatisfied  ifTrue: [
                value: newValue.
                plan:  planner extractPlanFromConstraint: editC.
                planner executePlan: plan.
            ].
            editC removeConstraint.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'constraintVariable' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         statePrintString = ( |
            | 
            (strengthString: walkStrength), ', ', value printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'editConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         copyVar: v = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 new.
                } 
            | 
            new: copy.
            new variables: vector copySize: 1.
            new variables at: 0 Put: v.
            new methodOuts: new variables copy.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'editConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         execute = ( |
            | 
            whichMethod = none ifTrue: [ notEnforcedError ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'editConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         isInput = ( |
            | true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'editConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'equalsConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         copyVar: v1 Var: v2 = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 new.
                } 
            | 
            new: copy.
            new variables: vector copySize: 2.
            new variables at: 0 Put: v1.
            new variables at: 1 Put: v2.
            new methodOuts: new variables copy.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'equalsConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         execute = ( |
            | 
            whichMethod = 0  ifTrue: [
                (variables at: 0) value: (variables at: 1) value. ^self ].
            whichMethod = 1  ifTrue: [
                (variables at: 1) value: (variables at: 0) value. ^self ].
            notEnforcedError.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'equalsConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'multConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         copyVar: v1 Var: v2 Var: prod = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 new.
                } 
            | 
            new: copy.
            new variables: vector copySize: 3.
            new variables at: 0 Put: v1.
            new variables at: 1 Put: v2.
            new variables at: 2 Put: prod.
            new methodOuts: new variables copy.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'multConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         execute = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 prod.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 v1.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 v2.
                } 
            | 
            v1:    (variables at: 0) value.
            v2:    (variables at: 1) value.
            prod:  (variables at: 2) value.
            whichMethod = 0  ifTrue: [ (variables at: 0) value: prod / v2. ^self ].
            whichMethod = 1  ifTrue: [ (variables at: 1) value: prod / v1. ^self ].
            whichMethod = 2  ifTrue: [ (variables at: 2) value: v1 * v2.  ^self ].
            notEnforcedError.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'multConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'plusConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         copyVar: v1 Var: v2 Var: sum = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 new.
                } 
            | 
            new: copy.
            new variables: vector copySize: 3.
            new variables at: 0 Put: v1.
            new variables at: 1 Put: v2.
            new variables at: 2 Put: sum.
            new methodOuts: new variables copy.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'plusConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         execute = ( | {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 sum.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 v1.
                }  {
                 'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
                
                 v2.
                } 
            | 
            v1:   (variables at: 0) value.
            v2:   (variables at: 1) value.
            sum:  (variables at: 2) value.
            whichMethod = 0  ifTrue: [ (variables at: 0) value: sum - v2. ^self ].
            whichMethod = 1  ifTrue: [ (variables at: 1) value: sum - v1. ^self ].
            whichMethod = 2  ifTrue: [ (variables at: 2) value: v1 + v2.  ^self ].
            notEnforcedError.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'plusConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'constraint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'stayConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         isInput = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bench' -> 'stayConstraint' -> () From: ( | {
         'ModuleInfo: Module: deltablue InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'bench' -> 'editConstraint' -> ().
        } | ) 



 '-- Side effects'

 globals modules deltablue postFileIn
