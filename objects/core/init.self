'30.11.0-prerelease1'

'
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'

_AddSlotsIfAbsent: ( |

{ 'Comment: Lots of places, but especially the transporter, depend on this slot being here (e.g. paths and chains).
\x7fModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'
    lobby		= self.
}
{ 'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'
    mixins		= ().
    traits		= ().
    globals*	        = ().
}
| )
_AddSlots: ( |
{ 'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'
     shell             = shell.
}
| )

"set the object annotations:"

lobby         _AddSlots: ( | 
{} = 'Comment: This is  the lobby, the foyer for the Self world.
Most interesting objects can be reached from here.
Many objects in the system also inherit from the lobby,
so behavior visible in the lobby will also be visible
in most objects unless it is overridden.  This includes,
for example, the ability to retrieve globals by name.\x7fModuleInfo: Creator: lobby.'. | )

lobby mixins  _AddSlots: ( | 
  {} = 'Comment: This object serves as a repository for mixins used
throughout the system.
A mixin contains behavior and possibly state which is to be inherited,
but is not of itself useful.\x7fModuleInfo: Creator: mixins.'.
| )

lobby traits  _AddSlots: ( | 
  {} = 'Comment: In this object can be found many `traits\', which are
objects containing shared behavior and/or state.
For each traits object there is usually a corresponding prototype in
`globals\' which inherits the traits.  Many copies of the prototype may
also exist, so that changing something in a traits object usually modifies the
behavior of many objects (the prototype and all the copies of it,
which all inherit the modified trait).
Note that it is not essential to put trait objects in here; many
prototypes have traits objects which they keep to themselves.\x7fModuleInfo: Creator: traits.'. 
| )

lobby globals _AddSlots: ( |
  {} = 'Comment: This object contains all the prototypes which are
directly accessible from any object that inherits from the lobby.
If you\'re looking for some object to copy and modify, this is the
place to look!\x7fModuleInfo: Creator: globals.'. 
| )

lobby shell   _AddSlots: ( |
  {} = 'Comment: The shell is the default receiver for any expression
typed at the console prompt ("Self n").  As such it contains useful
shortcuts for common operations and can also be used to attach a
debugger to a process.  The shortcuts are also useful in the graphical
user interface; but use a real debugger (processMorph) if you can.\x7fModuleInfo: Creator: shell.\x7fIsComplete: '.
| )



traits _AddSlotsIfAbsent: ( |
 { 'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'
    byteVector	        = byteVector parent.
    vector		= vector     parent.
    canonicalString	= '' 	     parent.
    " Create these now so that mirrors.self adds slots to them "
    " Although annotated here as init, mirror.self overrwrites as mirror."
    { 'Category: system'
      mirrors = ( |
	{} = 'ModuleInfo: Creator: traits mirrors.'.
	{ 'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'
	  methodActivation      = methodActivationMirror parent.
	  blockMethodActivation = blockMethodActivationMirror parent.
	  assignment = assignmentMirror parent.
	  block	     = blockMirror parent.
	  byteVector = byteVectorMirror parent.
	  smallInt   = smiMirror parent.
	  float	     = floatMirror parent.
	  method     = methodMirror parent.
	  blockMethod = blockMethodMirror parent.
	  mirror     = mirrorMirror parent.
	  process    = processMirror parent.
	  slots	     = slotsMirror parent.
	  canonicalString = stringMirror parent.
	  vector     = vectorMirror parent.
	  fctProxy   = fctProxyMirror parent.
	  proxy      = proxyMirror parent.
	  profiler   = profilerMirror parent.
	}
	| ).
    }
    block       = []  parent.
    float       = 0.0 parent.
    smallInt    = 0   parent.
    process     = _ThisProcess parent _AddSlots: ( |
    {} = 'ModuleInfo: Creator: traits process.'.
    | ).
    profiler    = profiler parent _AddSlots: ( |
    {} = 'ModuleInfo: Creator: traits profiler.'.
    | ).
    proxy   = proxy    parent.
    fctProxy= fctProxy parent.
 }
| )

mixins _AddSlotsIfAbsent: ( |
 { 'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'
  }
| )

globals _AddSlotsIfAbsent: ( |
 { 'Category: collections\x7fCategory: vectors\x7fModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'
    byteVector	= byteVector _AddSlots: ( |
      {} = 'ModuleInfo: Creator: globals byteVector.'.
      {'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: private'
	parent* = byteVector parent.
      }
    | ).
    vector		= vector _AddSlots: ( |
      {} = 'ModuleInfo: Creator: globals vector.'.
      {'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: private'
	parent* = vector parent.
      }
    | ).
    string            = ''.
    "needed for file names below, replaced in string.self"
    mutableString     = byteVector _Clone.
 }
 { 'Category: system\x7fModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'
    bootstrap = ( |
      {} = 'Comment: routines used to read in self source files into an empty VM.\x7fModuleInfo: Creator: globals bootstrap.'.
    | ).

    mirrors = ( |
      {} = 'ModuleInfo: Creator: globals mirrors.'.
      { 'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'
	methodActivation      = methodActivationMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors methodActivation.'
	  | ).
	blockMethodActivation = blockMethodActivationMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors blockMethodActivation.'
	  | ).
	assignment = assignmentMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors assignment.'
	  | ).
	block	     = blockMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors block.'
	  | ).
	byteVector = byteVectorMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors byteVector.'
	  | ).
	smallInt   = smiMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors smallInt.'
	  | ).
	float	     = floatMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors float.'
	  | ).
	method     = methodMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors method.'
	  | ).
	blockMethod = blockMethodMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors blockMethod.'
	  | ).
	mirror     = mirrorMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors mirror.'
	  | ).
        process    = processMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors process.'
	  | ).
	slots	     = slotsMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors slots.'
	  | ).
	canonicalString = stringMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors canonicalString.'
	  | ).
	vector     = vectorMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors vector.'
	  | ).
	fctProxy   = fctProxyMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors fctProxy.'
	  | ).
	proxy      = proxyMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors proxy.'
	  | ).
        profiler   = profilerMirror _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals mirrors profiler.'
	  | ).
      }
    | ).

    modules = ( |
      {} = 'ModuleInfo: Creator: globals modules.'.
    | ).

    { 'Category: OS and filesystem interface\x7fModuleInfo: Module: init InitialContents: FollowSlot'
      snapshotAction = snapshotAction _AddSlots: ( |
        {} = 'ModuleInfo: Creator: globals snapshotAction.\x7fIsComplete: '.
      | ).
    }

    { 'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'
      nil        = nil _AddSlots: ( | 
	{} = 'ModuleInfo: Creator: globals nil.\x7fIsComplete: '. 
	| ).
      { 'Category: booleans'
	false      = false _AddSlots: ( | 
	  {} = 'ModuleInfo: Creator: globals false.\x7fIsComplete: '. 
	  | ).
	true       = true _AddSlots: ( | 
	  {} = 'ModuleInfo: Creator: globals true.\x7fIsComplete: '. 
	  | ).
      }

      { 'Category: concurrency'
	process    = _ThisProcess _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals process.'.
	  { 'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: private'
	    parent* = _ThisProcess parent.
	  } 
	  | ).
      }
      { 'Category: profiling'
	profiler   = profiler _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals profiler.\x7fIsComplete: '.
	  { 'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: private'
	    parent* = profiler parent.
	  } 
	  | ).
      }
      { 'Category: external libraries'
	proxy    = proxy _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals proxy.'
	  | ).
	fctProxy = fctProxy _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals fctProxy.'
	  | ).
      }
      { 'Category: annotations'
	objectAnnotation = objectAnnotation _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals objectAnnotation.'
	  | ).
	slotAnnotation =   slotAnnotation _AddSlots: ( |
	  {} = 'ModuleInfo: Creator: globals slotAnnotation.'
	  | ).
      }
    }
  }
| )


globals bootstrap _AddSlotsIfAbsent: ( |
 {} = 'ModuleInfo: Creator: globals bootstrap.'.
 {  'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'

  { 'Category: bootstrap primitives\x7fComment: Use mirrors if possible to keep module cache current.'

    ifSchedulerRunningThen: runBlock Else: bootBlock = (
       " maybe do not even have ifTrue:... "
       " Now, I cannot turn this feature on yet because:
         1. Since the mirror-level addSlots: does not copy over object
	    annotations, copied-down objects get the wrong annotation.
	 2. Since the slots list in the module is recreated,
	    the module forgets the slots it contains. -- dmu "

       
       [ 0 scheduler _Mirror _MirrorContentsAt: 'start'
	 IfFail: [|:a. :b| ^ bootBlock value ].
         0 scheduler isRunning ifTrue: runBlock False: bootBlock
       ].
       bootBlock value).

    addSlotsTo: destObj From: object = ( 
       ifSchedulerRunningThen: [ destObj _Mirror addSlots: object _Mirror. destObj ]
                         Else: [ destObj _AddSlots: object ] ).

    define:   destObj ToBe: object = ( 	
	ifSchedulerRunningThen: [ destObj _Mirror defineAndSave: object _Mirror. destObj ]
                          Else: [ destObj _Define: object ] ).

    removeAllSlotsFrom: object = ( 
	ifSchedulerRunningThen: [ object _Mirror removeAllSlots. object ]
           Else: [ object _RemoveAllSlots ] ).

    addSlotsIfAbsentTo: destObj From: object = ( 
	ifSchedulerRunningThen: [ destObj _Mirror addSlotsIfAbsent: object _Mirror. destObj ]
	   Else: [ destObj _AddSlotsIfAbsent: object ] ).

    setObjectAnnotationOf: object From: objWAnno = (
	ifSchedulerRunningThen: [ object _Mirror annotation: objWAnno _Mirror annotation.  object ]
           Else: [ object _AddSlots: objWAnno ] ).

    remove: slotName From: object = (
         |
         {} = 'ModuleInfo: Creator: globals bootstrap remove:From:.'.
         |
	ifSchedulerRunningThen: [ object _Mirror removeSlot: slotName IfFail: [].  object ]
	   Else: [ object _RemoveSlot: slotName IfFail: [|:a. :b | object] ]).
  }
  { 'Category: bootstrap reading'

    defaultSelfWorkingDir = (
      ( | sun = '..'. apple = '..'. | ) _Perform: _Manufacturer ).
      
    defaultSelfObjectsWorkingDir = (
      ( | sun = '.'. apple = '.'. | ) _Perform: _Manufacturer ).

    getSelfWorkingDirEVIfFail: fb = (
         'SELF_WORKING_DIR' _getenvenvironmentAtIfFail: [
	   |:e. :n| 
	   fb value ] ).

    selfWorkingDir = (
         |
         {} = 'ModuleInfo: Creator: globals bootstrap selfWorkingDir.'.
         |
         getSelfWorkingDirEVIfFail: [defaultSelfWorkingDir]).

    selfObjectsWorkingDir = (
         |
         {} = 'ModuleInfo: Creator: globals bootstrap selfWorkingDir.'.
         |
         concat: (
           getSelfWorkingDirEVIfFail: [^ defaultSelfObjectsWorkingDir]
         ) With: '/objects').

    concat: n With: p = (| 
	lobby = lobby.
        {} = 'ModuleInfo: Creator: globals bootstrap concat:With:.'.
        |
        n _ByteVectorConcatenate: p  Prototype: lobby mutableString).

    read: name From: dir = (
        |
        {} = 'ModuleInfo: Creator: globals bootstrap read:From:.'.
        |
        read: name From: dir IfFail: [ | :e. :prim |
	  'failed to read: ' _StringPrint. 
	  name         _StringPrint.
	  ' from: '    _StringPrint.
	  dir          _StringPrint.
	  '.  Error: ' _StringPrint.
	  e            _StringPrint. 
	  '\n'         _StringPrint. 
	  _ThisProcess _AbortProcess.
	]).

    read: name From: dir IfFail: fb = (
        |
	n.
        {} = 'ModuleInfo: Creator: globals bootstrap read:From:IfFail:.'.
        |
        "selfObjectsDir + / + dir + / + name + .self"
        n: concat: selfObjectsWorkingDir With: '/'.
        n: concat: n                     With: dir.
        n: concat: n                     With: '/'.
        n: concat: n                     With: name.
        (concat: n With: '.self') _RunScriptIfFail: fb).
        
        read: name From: dir InTree: t = ( |
           | 
           read: name From: dir InTree: t IfFail: [ | :e. :prim |
             'failed to read: ' _StringPrint. 
             name         _StringPrint.
             ' from: '    _StringPrint.
             dir          _StringPrint.
             ' in tree: ' _StringPrint.
             t            _StringPrint.
             '.  Error: ' _StringPrint.
             e            _StringPrint. 
             '\n'         _StringPrint. 
             _ThisProcess _AbortProcess.
           ]).

        read: name From: dir InTree: t IfFail: fb = ( | n | 
           n: ''.
           t = '' ifFalse: [| l |
             "This will break if modules module not loaded!"
             l: (| lobby = lobby |) lobby.
             n: concat: (l modules init treeRootFor: t 
                                           IfAbsent: [^ l error: 'Cannot find tree:', t]) 
                  With: '/'].
           n: concat: n                     With: dir.
           n: concat: n                     With: '/'.
           n: concat: n                     With: name.
           (concat: n With: '.self') _RunScriptIfFail: [|:e. :prim | ^ fb value: e With: prim]).

        read: name InTree: t = ( |
           | 
           read: name From: '' InTree: t IfFail: [ | :e. :prim |
             'failed to read: ' _StringPrint. 
             name         _StringPrint.
             ' in tree: ' _StringPrint.
             t            _StringPrint.
             '.  Error: ' _StringPrint.
             e            _StringPrint. 
             '\n'         _StringPrint. 
             _ThisProcess _AbortProcess.
           ]).
    
  }
  { 'Category: creating name spaces\x7fVisibility: public'
    stub = ( |
      {} = 'ModuleInfo: Creator: globals bootstrap stub.'
      { 'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: private'
        parent* = lobby.
        copy = ( 
            |
            {} = 'ModuleInfo: Creator: globals bootstrap stub copy.'.
            |
	    _Clone ).
	object <- lobby.
	link.
	path <- ''.
	name <- ''.

	concat: a With: b With: c = (
            |
            {} = 'ModuleInfo: Creator: globals bootstrap stub concat:With:With:.'.
            |
	  concat: a With: concat: b With: c).

	concat: a With: b = ( 
	    | lobby = lobby.
            {} = 'ModuleInfo: Creator: globals bootstrap stub concat:With:.'.
            |
        a _ByteVectorConcatenate: b  Prototype: lobby byteVector).

        addSlotIfAbsentDo: b = (
          addSlotContaining: [() _Clone] AndIfAbsentDo: b).
        addObjVectorSlotIfAbsentDo: b = (
          addSlotContaining: [bootstrap removeAllSlotsFrom: vector _Clone ]  AndIfAbsentDo: b).

        addSlotContaining: contentsBlk AndIfAbsentDo: b = (
            |
            {} = 'ModuleInfo: Creator: globals bootstrap stub addSlotIfAbsentDo:.'.
	    m.
            |
	  m: link object _Mirror.
	  object: 
	    (
	      m _MirrorContentsAt: name IfFail: [|:err. :prim|
	        object:  contentsBlk value.
	        m _MirrorDefine:
	          m _MirrorCopyAt: name
	                      Put: object _Mirror
		         IsParent: false
		       IsArgument: false
		       Annotation: 'ModuleInfo: InitialContents: FollowSlot'.
              ^ b value.
             ]
	   ) _MirrorReflectee.
	   self).

        annotateObject = (
            |
            {} = 'ModuleInfo: Creator: globals bootstrap stub annotateObject.'.
            |
	  object _Mirror
	    _MirrorDefine:
	      object _Mirror
	        _MirrorCopyAnnotation: 
	          ( concat: 'ModuleInfo: Creator:' With: path With: '.' ) _StringCanonicalize.
          self).

	makeObject = (
            |
            {} = 'ModuleInfo: Creator: globals bootstrap stub makeObject.'.
            |
	"always undeclared and not parent, must fix elsewhere, assignable?"
	  " add slot"
	    addSlotIfAbsentDo: [
	      annotateObject.
	    ].
	    self).

	makeObjVectorObject = (
            |
            {} = 'ModuleInfo: Creator: globals bootstrap stub makeObject.'.
            |
	"always undeclared and not parent, must fix elsewhere, assignable?"
	  " add slot"
	    addObjVectorSlotIfAbsentDo: [
	      annotateObject.
	    ].
	    self).
      }
      { 'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'
	-> n = (
          followThrough: n IfNeedToMakeObject: [|:x| x makeObject]
        )
      }
      { 'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'
	\/-> n = (
          followThrough: n IfNeedToMakeObject: [|:x| x makeObjVectorObject]
        )
      }
      { 'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'
	followThrough: n IfNeedToMakeObject: b = (
            |
            {} = 'ModuleInfo: Creator: globals bootstrap stub ->.'.
	    r.
            |
	  "create n if absent & return new stub"
	  "but just return result if n is empty object"
	  r: copy.
	  r name: n.
	  r link: self.

	  n _ByteSizeIfFail: [ |:err. :primName| 
	    "if n is int, index array"
	    n _IntAdd: 0 IfFail: [|:err. :primName|
	      "empty, return obj"
	     ^ object. 
            ].
	    "array stuff only works after basic system read in"
	    r path: concat: path With: ' ' With: n storeString.
	    r object: object at: n.
	  ^ r
	  ].
	  r path: concat: path With: ' '  With: n.
	  b value: r).

      }
    | ).
  }
  }
| )


'' parent _AddSlots: ( | print = ( _StringPrint ) | )


_RemoveSlot: 'systemObjects' IfFail: [|:err. :name| nil].

globals modules _AddSlots: ( | 
 {} = 'ModuleInfo: Creator: globals modules.'.
 {  'ModuleInfo: Module: init InitialContents: FollowSlot'
    init = ( |
     {} = 'Comment: the prototype module object, I am created by init.self.\x7fModuleInfo: Creator: globals modules init.\x7fIsComplete: '.
    {  'Category: state\x7fModuleInfo: Module: init InitialContents: InitializeToExpression: (-1)\x7fVisibility: private'
        
         savedTimestamp <- -1.
    }
    {  'Category: state\x7fModuleInfo: Module: init InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
      fileInTimeString <- _CurrentTimeString.
    }
    {  'Category: state\x7fModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'
      copyright <- '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'

    }
    {  'Category: state\x7fModuleInfo: Module: init InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         cachedSlots <- vector.
    }
    {  'Category: state\x7fModuleInfo: Module: init InitialContents: InitializeToExpression: (vector)\x7fVisibility: publicReadPrivateWrite'
	 removedSlotPaths <- vector.
	 addedOrChangedSlots <- vector.
    }
    {  'ModuleInfo: Module: init InitialContents: InitializeToExpression: (\'\')'
        
         tree <- ''.
    }
    {  'ModuleInfo: Module: init InitialContents: FollowSlot'
        
         preFileIn = ("preFileIn" self).
    }
     {  'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: private'
      parent* = ( | 
        {} = 'ModuleInfo: Creator: globals modules init parent.'.
        copy = (
          "dummy, the real one gets put in module.self"
           _Clone).
        postFileIn = (
          "dummy, the real one gets put in module.self"
	  self).
        parent* = lobby. "temporary parent for postFileIn methods"
       | ).

     }
     {  'ModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: private'
      myComment <-
'  Create the base hierarchy of namespace and category objects
   and place the initial system objects in this world.


If this is the first time that this file has been processed, then the
following _AddSlotsIfAbsent: does nothing because the slot systemObjects
is part of the initial Self world. Subsequent operations in this file
reorganize the Self world and move the mirrors elsewhere in the name space,
then delete the slot systemObjects from the lobby. On the other hand,
if this file has already been processed at least once, then the following
_AddSlotsIfAbsent: operation creates an object with references to dummy
mirrors. This allows later references to these names to be resolved. It
doesn\'t matter that the mirrors are dummy objects because subsequent operations
in this file will be noops since the Self world has already been created.
This hackery allows this file to be processed multiple times without error
(although only the first time really does anything).

systemObjects slot was part of the original, empty world, 
but shouldn\'t be part of the newly organized world;
if the slot has already been removed, do nothing.


This module is used to avoid filing out spurious objects in other modules
 but is itself not filed out'.

      directory <- 'core'.

      postFileIn = ( |
         {} = 'ModuleInfo: Creator: globals modules init postFileIn.
'.
	 |
        "This slot was part of the original, empty world, 
	 but shouldn't be part of the new world;
	 if the slot has already been removed, do nothing."
	 lobby _RemoveSlot: 'snapshotAction' IfFail: ["rereading init"].
	 lobby _RemoveSlot: 'systemObjects' IfFail: [|:err. :name| nil].
	 lobby _RemoveSlot: 'help' IfFail: [|:err. :name| nil].
	 resend.postFileIn).

      revision <- 'Sun-$Revision: 30.10 $'.

      subpartNames <- ''.

     }
    | ).
  }
| )

bootstrap stub -> 'globals' -> 'scheduler' "needed for process"

scheduler _AddSlotsIfAbsent: ( |
	  "this way can tell bootstrapping by asking scheduler"
	  isRunning = false
| )

"desktop is needed for reporting messages"
 bootstrap stub -> 'globals' -> () _AddSlots: ( | {
         'Category: Desktop\x7fModuleInfo: Module: init InitialContents: FollowSlot\x7fVisibility: public'
        
         desktop = bootstrap stub -> 'globals' -> 'desktop' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals desktop.
\x7fIsComplete: '.
            | ) .
        } | ) 

desktop _AddSlotsIfAbsent: ( |
             {} = 'ModuleInfo: Creator: globals desktop isOpen.
'.
  isOpen = false
| )

modules init postFileIn
