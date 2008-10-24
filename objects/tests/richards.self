 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         benchmark = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards benchmark.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         currentTask.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         currentTaskIdentity.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         holdCount <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         layout <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards benchmark parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         copy = ( |
            | resend.copy taskTable: taskTable copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         createDevice: identity Priority: priority Work: work State: state = ( | {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 data.
                } 
            | 
            data: deviceTaskDataRecord create.
            createTask: identity
                Priority: priority
                Work: work
                State: state
                Data: data.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         createHandler: identity Priority: priority Work: work State: state = ( | {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 data.
                } 
            | 
            data: handlerTaskDataRecord create.
            createTask: identity
                Priority: priority
                Work: work
                State: state
                Data: data.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         createIdler: identity Priority: priority Work: work State: state = ( | {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 data.
                } 
            | 
            data: idleTaskDataRecord create.
            createTask: identity
                Priority: priority
                Work: work
                State: state
                Data: data.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         createPacket: link Identity: identity Kind: kind = ( |
            | 
            packet create: link Identity: identity Kind: kind).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         createTask: identity Priority: priority Work: work State: state Data: data = ( | {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: taskControlBlock
                link: taskList
                Create: identity
                Priority: priority
                InitialWorkQueue: work
                InitialState: state
                Benchmark: self
                PrivateData: data.
            taskList: t.
            taskTable at: identity predecessor Put: t.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         createWorker: identity Priority: priority Work: work State: state = ( | {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 data.
                } 
            | 
            data: workerTaskDataRecord create.
            createTask: identity
                Priority: priority
                Work: work
                State: state
                Data: data.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         findTask: identity = ( | {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: taskTable at: identity predecessor.
            noTask = t ifTrue: [error: 'findTask failed'].
            t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         holdSelf = ( |
            | 
            holdCount: holdCount successor.
            currentTask taskHolding: true.
            currentTask link).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         initTrace = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         object = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards object.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         queuePacket: packet = ( | {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: findTask: packet identity.
            noTask = t ifTrue: [^noTask].
            queuePacketCount: queuePacketCount successor.
            packet link: noWork.
            packet identity: currentTaskIdentity.
            t addInput: packet CheckPriority: currentTask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         release: identity = ( | {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: findTask: identity.
            noTask = t ifTrue: [^noTask].
            t taskHolding: false.
            t priority > currentTask priority ifTrue: [t] False: [currentTask]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         run = ( | {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 workQ.
                } 
            | 
            initTrace. "initScheduler."
            createIdler: idler Priority: 0 Work: noWork
                State: taskState copy running.

            workQ: createPacket: noWork Identity: worker Kind: workPacketKind.
            workQ: createPacket: workQ Identity: worker Kind: workPacketKind.
            createWorker: worker Priority: 1000 Work: workQ
                                 State: taskState waitingWithPacket.

            workQ: createPacket: noWork Identity: deviceA Kind: devicePacketKind.
            workQ: createPacket: workQ Identity: deviceA Kind: devicePacketKind.
            workQ: createPacket: workQ Identity: deviceA Kind: devicePacketKind.
            createHandler: handlerA Priority: 2000 Work: workQ
                                 State: taskState waitingWithPacket.

            workQ: createPacket: noWork Identity: deviceB Kind: devicePacketKind.
            workQ: createPacket: workQ Identity: deviceB Kind: devicePacketKind.
            workQ: createPacket: workQ Identity: deviceB Kind: devicePacketKind.
            createHandler: handlerB Priority: 3000 Work: workQ
                                 State: taskState waitingWithPacket.

            createDevice: deviceA Priority: 4000 Work: noWork
                                  State: taskState waiting.
            createDevice: deviceB Priority: 5000 Work: noWork
                                  State: taskState waiting.

            schedule.
            (queuePacketCount = 23246) && [holdCount = 9297]
                ifFalse: [ error: 'richards results incorrect' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         schedule = ( |
            | 
            currentTask: taskList.
            [noTask = currentTask] whileFalse:  [
                currentTask isTaskHoldingOrWaiting ifTrue: [
                    currentTask: currentTask link.
                ] False: [
                    currentTaskIdentity: currentTask identity.
                    tracing ifTrue: [trace: currentTaskIdentity].
                    currentTask: currentTask runTask.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         trace: id = ( |
            | 
            layout: layout predecessor.
            0 >= layout ifTrue: ['\n' print. layout: 50].
            id printString print.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         wait = ( |
            | 
            currentTask taskWaiting: true.
            currentTask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         queuePacketCount <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         taskList.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: InitializeToExpression: (vector copySize: 6)'
        
         taskTable <- vector copySize: 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'benchmark' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: InitializeToExpression: (false)'
        
         tracing <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         append: packet Head: queueHead = ( | {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 link.
                }  {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 mouse.
                } 
            | 
            packet link: noWork.
            noWork = queueHead ifTrue: [^packet].
            mouse: queueHead.
            [link: mouse link. noWork = link] whileFalse: [mouse: link].
            mouse link: packet.
            queueHead).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         deviceA = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         deviceB = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         devicePacketKind = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         deviceTaskDataRecord = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'deviceTaskDataRecord' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards object deviceTaskDataRecord.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'deviceTaskDataRecord' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'deviceTaskDataRecord' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards object deviceTaskDataRecord parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'deviceTaskDataRecord' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         create = ( |
            | copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'deviceTaskDataRecord' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'deviceTaskDataRecord' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         run: work With: benchmark = ( | {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 functionWork.
                } 
            | 
            functionWork: work.
            noWork = functionWork ifTrue: [
                functionWork: pending.
                noWork = functionWork ifTrue: [benchmark wait]
                False: [
                    pending: noWork.
                    benchmark queuePacket: functionWork.
                ]]
            False: [
                pending: functionWork.
                benchmark tracing ifTrue: [benchmark trace: functionWork datum].
                benchmark holdSelf ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'deviceTaskDataRecord' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         pending.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         handlerA = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         handlerB = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         handlerTaskDataRecord = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'handlerTaskDataRecord' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards object handlerTaskDataRecord.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'handlerTaskDataRecord' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         deviceIn.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'handlerTaskDataRecord' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'handlerTaskDataRecord' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards object handlerTaskDataRecord parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'handlerTaskDataRecord' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         create = ( |
            | copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'handlerTaskDataRecord' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         deviceInAdd: packet = ( |
            | deviceIn: append: packet Head: deviceIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'handlerTaskDataRecord' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'handlerTaskDataRecord' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         run: work With: benchmark = ( | {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 count.
                }  {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 devicePacket.
                }  {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 workPacket.
                } 
            | 
            noWork = work ifFalse: [workPacketKind = work kind 
                ifTrue: [workInAdd: work]
                False: [deviceInAdd: work]].
            workPacket: workIn.
            noWork = workPacket ifTrue: [benchmark wait]
            False: [
                count: workPacket datum.
                count > 4 ifTrue: [
                    workIn: workPacket link.
                    benchmark queuePacket: workPacket]
                False: [
                    devicePacket: deviceIn.
                    noWork = devicePacket ifTrue: [benchmark wait]
                    False: [
                        deviceIn: devicePacket link.
                        devicePacket datum:
                            workPacket data at: count predecessor.
                        workPacket datum: count successor.
                        benchmark queuePacket: devicePacket.
                    ].
                ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'handlerTaskDataRecord' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         workInAdd: packet = ( |
            | workIn: append: packet Head: workIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'handlerTaskDataRecord' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         workIn.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         idleTaskDataRecord = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'idleTaskDataRecord' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards object idleTaskDataRecord.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'idleTaskDataRecord' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         control <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'idleTaskDataRecord' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         count <- 10000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'idleTaskDataRecord' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'idleTaskDataRecord' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards object idleTaskDataRecord parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'idleTaskDataRecord' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         create = ( |
            | copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'idleTaskDataRecord' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'idleTaskDataRecord' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         run: work With: benchmark = ( |
            | 
            count: count predecessor.
            0 = count
                ifTrue: [benchmark holdSelf]
                False: [
                    0 = (control && 1) ifTrue: [
                        control: control / 2. "MAKE SURE IS INT"
                        benchmark release: deviceA
                    ] False: [
                        control: (control / 2) ^^ 53256.
                        benchmark release: deviceB.
                    ].
                ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         idler = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         noTask = bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         noWork = bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         packet = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'packet' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards object packet.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'packet' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: InitializeToExpression: (byteVector copySize: 4  FillingWith: 0)'
        
         data <- byteVector copySize: 4  FillingWith: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'packet' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         datum <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'packet' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         identity.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'packet' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         kind.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'packet' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         link.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'packet' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'packet' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards object packet parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'packet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         create: link Identity: identity Kind: kind = ( |
            | 
            (((copy link: link)
                     identity: identity)
                     kind: kind)
                     data: data copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'packet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         taskControlBlock = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards object taskControlBlock.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         benchmark.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         handle.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         identity.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         input.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         link.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         packetPending <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards object taskControlBlock parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         addInput: packet CheckPriority: oldTask = ( |
            | 
            noWork = input ifTrue: [
                input: packet.
                packetPending: true.
                priority > oldTask priority ifTrue: [^self]]
            False: [input: append: packet Head: input].
            oldTask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         link: link Create: identity Priority: priority InitialWorkQueue: initialWorkQueue InitialState: initialState Benchmark: benchmark PrivateData: privateData = ( | {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: copy.
            r link: link.
            r identity: identity.
            r priority: priority.
            r input: initialWorkQueue.
            r packetPending: initialState packetPending.
            r taskWaiting: initialState taskWaiting.
            r taskHolding: initialState taskHolding.
            r benchmark: benchmark.
            r handle: privateData.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> 'parent' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards object taskControlBlock parent parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         isTaskHoldingOrWaiting = ( |
            | 
            taskHolding || [packetPending not && [taskWaiting]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         isWaitingWithPacket = ( |
            | 
            packetPending && [taskWaiting && [taskHolding not]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         packetNowPending = ( |
            | 
            packetPending: true. taskWaiting: false. taskHolding: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         running = ( |
            | 
            packetPending: false.
            taskWaiting: false.
            taskHolding: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         waiting = ( |
            | copy taskWaiting: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         waitingWithPacket = ( |
            | (copy taskWaiting: true) packetPending: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         runTask = ( | {
                 'ModuleInfo: Module: richards InitialContents: FollowSlot'
                
                 message.
                } 
            | 
            isWaitingWithPacket ifTrue: [
                message: input.
                input: message link.
                noWork = input ifTrue: [running] False: [packetNowPending]]
            False: [message: noWork].
            handle run: message With: benchmark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         priority.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         taskHolding <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         taskWaiting <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         taskState = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskState' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards object taskState.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskState' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         packetPending <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskState' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskControlBlock' -> 'parent' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskState' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         taskHolding <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'taskState' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         taskWaiting <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         workPacketKind = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         worker = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         workerTaskDataRecord = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'workerTaskDataRecord' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards object workerTaskDataRecord.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'workerTaskDataRecord' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         count <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'workerTaskDataRecord' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         destination <- 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'workerTaskDataRecord' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'workerTaskDataRecord' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals benchmarks richards object workerTaskDataRecord parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'workerTaskDataRecord' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         create = ( |
            | copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'workerTaskDataRecord' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'benchmarks' -> 'richards' -> 'object' -> 'workerTaskDataRecord' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         run: work With: benchmark = ( |
            | 
            noWork = work
                ifTrue: [benchmark wait]
                False: [
                    destination: handlerA = destination
                        ifTrue: [handlerB] False: [handlerA].
                    work identity: destination.
                    work datum: 1.
                    0 to: 3 Do: [ | :i |
                        count: count successor.
                        count > 26 ifTrue: [count: 1].
                        work data at: i
                                 Put: 'A' first asByte + count predecessor.
                    ].
                    benchmark queuePacket: work.]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         richards = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'richards' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'richards' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules richards.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'richards' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'richards' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'richards' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot'
        
         myComment <- 'The Richards OS simulation benchmark.\"

            \"changes:
              nonlifo block simulation
              use prototype initialization'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'richards' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'richards' -> () From: ( | {
         'ModuleInfo: Module: richards InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules richards postFileIn
