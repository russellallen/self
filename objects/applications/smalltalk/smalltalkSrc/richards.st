"richards.st - The Richards Benchmark in Smalltalk"

"$Revision: 30.1 $"

Object subclass: #RBObject
  instanceVariableNames: ''
  classVariableNames: 'DeviceA DeviceB DevicePacketKind HandlerA HandlerB Idler NoTask NoWork Worker WorkPacketKind '
  poolDictionaries: ''
  category: 'RichardsBenchmark'!


!RBObject methodsFor: 'utilities'!

append: packet head: queueHead
  | mouse link |
  packet link: NoWork.
  NoWork == queueHead ifTrue: [^packet].
  mouse := queueHead.
  [NoWork == (link := mouse link)]
    whileFalse: [mouse := link].
  mouse link: packet.
  ^queueHead! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

RBObject class
  instanceVariableNames: ''!


!RBObject class methodsFor: 'initialize'!

initialize
  "RBObject initialize"
  DeviceA := 5.
  DeviceB := 6.
  DevicePacketKind := 1.
  HandlerA := 3.
  HandlerB := 4.
  Idler := 1.
  NoWork := nil.
  NoTask := nil.
  Worker := 2.
  WorkPacketKind := 2! !

RBObject initialize!


RBObject subclass: #Packet
  instanceVariableNames: 'link identity kind datum data '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'RichardsBenchmark'!


!Packet methodsFor: 'initialize'!

link: aLink identity: anIdentity kind: aKind 
  link := aLink.
  identity := anIdentity. 
  kind := aKind.
  datum := 1.
  data := Array new: 4 withAll: 0! !

!Packet methodsFor: 'accessing'!

data
  ^data!

datum
  ^datum!

datum:  someData
  datum := someData!

identity
  ^identity!

identity: anIdentity
  identity := anIdentity!

kind
  ^kind!

link
  ^link!

link: aWorkQueue 
  link := aWorkQueue! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Packet class
  instanceVariableNames: ''!


!Packet class methodsFor: 'instance creation'!

create: link identity: identity kind: kind 
  ^super new
    link: link
    identity: identity
    kind: kind! !

RBObject subclass: #RichardsBenchmark
  instanceVariableNames: 'taskList currentTask currentTaskIdentity taskTable tracing layout queuePacketCount holdCount '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'RichardsBenchmark'!


!RichardsBenchmark methodsFor: 'creation'!

createDevice: identity priority: priority work: work state: state 
  | data |
  data := DeviceTaskDataRecord create.
  self
    createTask: identity
    priority: priority
    work: work
    state: state
    function: 
      [:work :word | | data functionWork |
      data := word.
      functionWork := work.
      NoWork == functionWork
        ifTrue:
          [NoWork == (functionWork := data pending)
            ifTrue: [self wait]
            ifFalse: 
              [data pending: NoWork.
              self queuePacket: functionWork]]
        ifFalse: 
          [data pending: functionWork.
          tracing
            ifTrue: 
              [self trace: functionWork datum].
          self holdSelf]] asNonLifoBlock
    data: data!

createHandler: identity priority: priority work: work state: state 
  | data |
  data := HandlerTaskDataRecord create.
  self
    createTask: identity
    priority: priority
    work: work
    state: state
    function: 
      [:work :word | | data workPacket count devicePacket |
      data := word.
      NoWork == work
        ifFalse: [WorkPacketKind == work kind 
          ifTrue: [data workInAdd: work]
          ifFalse: [data deviceInAdd: work]].
      NoWork == (workPacket := data workIn)
        ifTrue: [self wait]
        ifFalse: 
          [count := workPacket datum.
          count > 4
            ifTrue: 
              [data workIn: workPacket link.
              self queuePacket: workPacket]
            ifFalse:
              [NoWork == (devicePacket := data deviceIn)
                ifTrue: [self wait]
                ifFalse: 
                  [data deviceIn: devicePacket link.
                  devicePacket datum: (workPacket data at: count).
                  workPacket datum: count + 1.
                  self queuePacket: devicePacket]]]] asNonLifoBlock
    data: data!

createIdler: identity priority: priority work: work state: state 
  | data |
  data := IdleTaskDataRecord create.
  self
    createTask: identity
    priority: priority
    work: work
    state: state
    function: 
      [:work :word | | data |
      data := word.
      data count: data count - 1.
      0 = data count
        ifTrue: [self holdSelf]
        ifFalse:
          [0 = (data control bitAnd: 1)
            ifTrue: 
              [data control: data control // 2.
              self release: DeviceA]
            ifFalse: 
              [data control: (data control // 2 bitXor: 53256).
              self release: DeviceB]]] asNonLifoBlock
    data: data!

createPacket: link identity: identity kind: kind 
  ^Packet
    create: link
    identity: identity
    kind: kind!

createTask: identity priority: priority work: work state: state function: aBlock data: data 
  | t |
  t := TaskControlBlock
        link: taskList
        create: identity
        priority: priority
        initialWorkQueue: work
        initialState: state
        function: aBlock
        privateData: data.
  taskList := t.
  taskTable at: identity put: t!

createWorker: identity priority: priority work: work state: state 
  | data |
  data := WorkerTaskDataRecord create.
  self
    createTask: identity
    priority: priority
    work: work
    state: state
    function: 
      [:work :word | | data |
      data := word.
      NoWork == work
        ifTrue: [self wait]
        ifFalse: 
          [data destination: (HandlerA = data destination
              ifTrue: [HandlerB]
              ifFalse: [HandlerA]).
          work identity: data destination.
          work datum: 1.
          1 to: 4 do: 
            [:i | 
            data count: data count + 1.
            data count > 26 ifTrue: [data count: 1].
            work data at: i put: $A asInteger + data count - 1].
          self queuePacket: work]] asNonLifoBlock
    data: data! !

!RichardsBenchmark methodsFor: 'private'!

findTask: identity 
  | t |
  t := taskTable at: identity.
  NoTask == t ifTrue: [self error: 'findTask failed'].
  ^t!

holdSelf
  holdCount := holdCount + 1.
  currentTask taskHolding: true.
  ^currentTask link!

initScheduler
  queuePacketCount := holdCount := 0.
  taskTable := Array new: 6 withAll: NoTask.
  taskList := NoTask!

initTrace
  tracing := false.
  layout := 0!

queuePacket: packet 
  | t |
  t := self findTask: packet identity.
  NoTask == t ifTrue: [^NoTask].
  queuePacketCount := queuePacketCount + 1.
  packet link: NoWork.
  packet identity: currentTaskIdentity.
  ^t addInput: packet checkPriority: currentTask!

release: identity 
  | t |
  t := self findTask: identity.
  NoTask == t ifTrue: [^NoTask].
  t taskHolding: false.
  t priority > currentTask priority
    ifTrue: [^t]
    ifFalse: [^currentTask]!

trace: id 
  layout := layout - 1.
  0 >= layout
    ifTrue: 
      [Transcript cr.
      layout := 50].
  Transcript show: id printString!

wait 
  currentTask taskWaiting: true.
  ^currentTask! !

!RichardsBenchmark methodsFor: 'scheduling'!

schedule
  currentTask := taskList. 
  [NoTask == currentTask]
    whileFalse: 
      [currentTask isTaskHoldingOrWaiting
        ifTrue: [currentTask := currentTask link]
        ifFalse: 
          [currentTaskIdentity := currentTask identity.
          tracing ifTrue: [self trace: currentTaskIdentity].
          currentTask := currentTask runTask]]! !

!RichardsBenchmark methodsFor: 'initialize'!

start
  | workQ mark1 mark2 mark3 mark4 |
  self initTrace; initScheduler.
  mark1 := Time millisecondClockValue.
  tracing ifTrue: [Transcript show: 'Bench mark starting'; cr].
  self
    createIdler: Idler
    priority: 0
    work: NoWork
    state: TaskState running.
  workQ := self
        createPacket: NoWork
        identity: Worker
        kind: WorkPacketKind.
  workQ := self
        createPacket: workQ
        identity: Worker
        kind: WorkPacketKind.
  self
    createWorker: Worker
    priority: 1000
    work: workQ
    state: TaskState waitingWithPacket.
  workQ := self
        createPacket: NoWork
        identity: DeviceA
        kind: DevicePacketKind.
  workQ := self
        createPacket: workQ
        identity: DeviceA
        kind: DevicePacketKind.
  workQ := self
        createPacket: workQ
        identity: DeviceA
        kind: DevicePacketKind.
  self
    createHandler: HandlerA
    priority: 2000
    work: workQ
    state: TaskState waitingWithPacket.
  workQ := self
        createPacket: NoWork
        identity: DeviceB
        kind: DevicePacketKind.
  workQ := self
        createPacket: workQ
        identity: DeviceB
        kind: DevicePacketKind.
  workQ := self
        createPacket: workQ
        identity: DeviceB
        kind: DevicePacketKind.
  self
    createHandler: HandlerB
    priority: 3000
    work: workQ
    state: TaskState waitingWithPacket.
  self
    createDevice: DeviceA
    priority: 4000
    work: NoWork
    state: TaskState waiting.
  self
    createDevice: DeviceB
    priority: 5000
    work: NoWork
    state: TaskState waiting.
  tracing ifTrue: [Transcript show: 'Starting'; cr].
  mark2 := Time millisecondClockValue.
  self schedule.
  mark3 := Time millisecondClockValue.
  tracing
    ifTrue: 
      [Transcript show: 'Finished'; cr.
      Transcript show: 'QueuePacket count = ' ;
        show: queuePacketCount printString;
	show: ' HoldCount = ';
	show: holdCount printString;
	cr.
      Transcript cr; show: 'End of run'; cr].
  queuePacketCount = 23246 & (holdCount = 9297) ifFalse: [self error: 'wrong result'].
  mark4 := Time millisecondClockValue.
  Transcript show: '***Scheduler time = ';
   show: (mark3 - mark2) printString;
   show: ' Total time = ';
   show: (mark4 - mark1) printString;
   cr! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

RichardsBenchmark class
  instanceVariableNames: ''!


!RichardsBenchmark class methodsFor: 'instance creation'!

start
  "RichardsBenchmark start"

  super new start! !

RBObject subclass: #TaskState
  instanceVariableNames: 'packetPendingIV taskWaiting taskHolding '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'RichardsBenchmark'!


!TaskState methodsFor: 'initialize'!

packetPending
  packetPendingIV := true.
  taskWaiting := false.
  taskHolding := false!

running
  packetPendingIV := taskWaiting := taskHolding := false!

waiting
  packetPendingIV := taskHolding := false.
  taskWaiting := true!

waitingWithPacket
  taskHolding := false.
  taskWaiting := packetPendingIV := true! !

!TaskState methodsFor: 'accessing'!

isPacketPending
  ^packetPendingIV!

isTaskHolding
  ^taskHolding!

isTaskWaiting
  ^taskWaiting!

taskHolding: aBoolean
  taskHolding := aBoolean!

taskWaiting: aBoolean 
  taskWaiting := aBoolean! !

!TaskState methodsFor: 'testing'!

isRunning
  ^packetPendingIV not and: [taskWaiting not and: [taskHolding not]]!

isTaskHoldingOrWaiting
  ^taskHolding or: [packetPendingIV not and: [taskWaiting]]!

isWaiting
  ^packetPendingIV not and: [taskWaiting and: [taskHolding not]]!

isWaitingWithPacket
  ^packetPendingIV and: [taskWaiting and: [taskHolding not]]! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

TaskState class
  instanceVariableNames: ''!


!TaskState class methodsFor: 'instance creation'!

packetPending
  ^super new packetPending!

running
  ^super new running!

waiting
  ^super new waiting!

waitingWithPacket
  ^super new waitingWithPacket! !

RBObject subclass: #DeviceTaskDataRecord
  instanceVariableNames: 'pending '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'RichardsBenchmark'!


!DeviceTaskDataRecord methodsFor: 'initialize'!

create
  pending := NoWork! !

!DeviceTaskDataRecord methodsFor: 'accessing'!

pending
  ^pending!

pending: packet 
  pending := packet! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

DeviceTaskDataRecord class
  instanceVariableNames: ''!


!DeviceTaskDataRecord class methodsFor: 'instance creation'!

create
  ^super new create! !

RBObject subclass: #HandlerTaskDataRecord
  instanceVariableNames: 'workIn deviceIn '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'RichardsBenchmark'!


!HandlerTaskDataRecord methodsFor: 'initialize'!

create
  workIn := deviceIn := NoWork! !

!HandlerTaskDataRecord methodsFor: 'accessing'!

deviceIn
  ^deviceIn!

deviceIn: aPacket
  deviceIn := aPacket!

deviceInAdd: packet
  deviceIn := self append: packet head: deviceIn!

workIn
  ^workIn!

workIn: aWorkQueue 
  workIn := aWorkQueue!

workInAdd: packet
  workIn := self append: packet head: workIn! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

HandlerTaskDataRecord class
  instanceVariableNames: ''!


!HandlerTaskDataRecord class methodsFor: 'instance creation'!

create
  ^super new create! !

RBObject subclass: #WorkerTaskDataRecord
  instanceVariableNames: 'destination count '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'RichardsBenchmark'!


!WorkerTaskDataRecord methodsFor: 'initialize'!

create
  destination := HandlerA.
  count := 0! !

!WorkerTaskDataRecord methodsFor: 'accessing'!

count
  ^count!

count: aCount
  count := aCount!

destination
  ^destination!

destination: aHandler
  destination := aHandler! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

WorkerTaskDataRecord class
  instanceVariableNames: ''!


!WorkerTaskDataRecord class methodsFor: 'instance creation'!

create
  ^super new create! !

TaskState subclass: #TaskControlBlock
  instanceVariableNames: 'link identity priority input state function handle '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'RichardsBenchmark'!


!TaskControlBlock methodsFor: 'initialize'!

link: aLink identity: anIdentity priority: aPriority initialWorkQueue: anInitialWorkQueue initialState: anInitialState function: aBlock privateData: aPrivateData 
  link := aLink.
  identity := anIdentity.
  priority := aPriority.
  input := anInitialWorkQueue.
  packetPendingIV := anInitialState isPacketPending.
  taskWaiting := anInitialState isTaskWaiting.
  taskHolding := anInitialState isTaskHolding.
  function := aBlock.
  handle := aPrivateData! !

!TaskControlBlock methodsFor: 'accessing'!

identity
  ^identity!

link
  ^link!

priority
  ^priority! !

!TaskControlBlock methodsFor: 'scheduling'!

addInput: packet checkPriority: oldTask
  NoWork == input
    ifTrue: 
      [input := packet.
      packetPendingIV := true.
      priority > oldTask priority ifTrue: [^self]]
    ifFalse: 
      [input := self append: packet head: input].
  ^oldTask!

runTask
  | message |
  self isWaitingWithPacket
    ifTrue: 
      [message := input.
      input := message link.
      NoWork == input
        ifTrue: [self running]
        ifFalse: [self packetPending]]
    ifFalse: [message := NoWork].
  ^function value: message value: handle! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

TaskControlBlock class
  instanceVariableNames: ''!


!TaskControlBlock class methodsFor: 'instance creation'!

link: link create: identity priority: priority initialWorkQueue: initialWorkQueue initialState: initialState function: aBlock privateData: privateData 
  ^super new
    link: link
    identity: identity
    priority: priority
    initialWorkQueue: initialWorkQueue
    initialState: initialState
    function: aBlock
    privateData: privateData! !

RBObject subclass: #IdleTaskDataRecord
  instanceVariableNames: 'control count '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'RichardsBenchmark'!


!IdleTaskDataRecord methodsFor: 'initialize'!

create
  control := 1.
  count := 10000! !

!IdleTaskDataRecord methodsFor: 'accessing'!

control
  ^control!

control: aNumber
  control := aNumber!

count
  ^count!

count: aCount
  count := aCount! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

IdleTaskDataRecord class
  instanceVariableNames: ''!


!IdleTaskDataRecord class methodsFor: 'instance creation'!

create
  ^super new create! !

