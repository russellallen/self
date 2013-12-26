 'Sun-$Revision: 30.12 $'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: foreign\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         fctProxy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( |
             {} = 'Comment: This traits object provides only the bare functionality 
      necessary for handling foreign functions. A higher level interface 
      is available through the foreignFct object.\x7fModuleInfo: Creator: traits fctProxy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'fctProxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fctProxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: external libraries\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         foreignCode = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'foreignCode' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals foreignCode.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCode' -> () From: ( | {
         'Comment: How many more loads than unloads.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         count <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCode' -> () From: ( | {
         'Comment: Live [fct]Proxies depending on code file.
Actually mirrors on these proxies, since we need identity semantics of
the set, not equality semantics.\x7fModuleInfo: Module: foreign InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: private'
        
         deps <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCode' -> () From: ( | {
         'Comment: Entry pts called when unloading.\x7fModuleInfo: Module: foreign InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: publicReadPrivateWrite'
        
         finalizers <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCode' -> () From: ( | {
         'Comment: Linker handle.\x7fModuleInfo: Module: foreign InitialContents: InitializeToExpression: ( nil )\x7fVisibility: public'
        
         handle <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCode' -> () From: ( | {
         'Comment: Entry pts called when loading.\x7fModuleInfo: Module: foreign InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: publicReadPrivateWrite'
        
         initializers <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: foreign\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         foreignCode = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( |
             {} = 'Comment: A foreignCode object represents a foreign code file that is or can
be loaded by the dynamic linker. The foreignCode object 
    * knows the path of the file in which it is found (if the path
      is the empty string, the foreignCode refers to the main
      program (i.e. the virtual machine)), 
    * has a list of static initializers (called when loaded),
    * has a list of static finalizers (called when unloaded), 
    * keeps track of fctProxies and proxies that depends on it 
      so that they can be killed, when the code file is unloaded, and
    * allows functions and symbols to be looked up.
A foreignCode object is uniquely identified by the path name of the
file it represents. To guarantee that there will never be two
foreignCode objects with the same path name, they should only be
updated through interaction with the foreignCodeDB object.
Only the linker should clone foreignCode objects.\x7fModuleInfo: Creator: traits foreignCode.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCode' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'foreignCode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCode' -> () From: ( | {
         'Comment: Filename of the dynamic library; empty path is the Self VM.\x7fModuleInfo: Module: foreign InitialContents: InitializeToExpression: ( \'\' )\x7fVisibility: publicReadPrivateWrite'
        
         path <-  '' .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCode' -> () From: ( | {
         'Comment: to guard agains concurrent access.\x7fModuleInfo: Module: foreign InitialContents: InitializeToExpression: (recursiveSemaphore copyCount: 1 Capacity: 1)\x7fVisibility: private'
        
         sema <- recursiveSemaphore copyCount: 1 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: external libraries\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         foreignCodeDB = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( |
             {} = 'Comment: foreignCode objects must be globally unique given the path name.
     This is accomplished by registering them in a database, foreignCodeDB.
     The database entries are associated with a path name. Whenever a
     path name is specified it is first attempted to locate a record with
     the exact same name; if this fails it is attempted to locate an entry
     that refers to the same file as the given path name (this is done by
     comparing statStructures\x7fModuleInfo: Creator: globals foreignCodeDB.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         add: codeFile = ( |
            | 
            sema protectNoNLR: [
                allPaths at: codeFile path Put: codeFile.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'Comment: Maps path name -> foreignCode.\x7fModuleInfo: Module: foreign InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         allPaths = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         at: path = ( |
            | at: path IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         at: path IfFail: errBlk = ( |
             cf.
             err.
            | 
            sema protectNoNLR: [
                cf: (sema protectNoNLR: [noLockAt: path]).
                cf ifNil: [
                    "Create the foreignCode object."
                    cf: (foreignCode copyPath: path 
                                       IfFail: [|:e| err: e. nil]).
                    cf ifNotNil: [add: cf].
                ].
            ].
            cf ifNil: [errBlk value: err]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         at: path PutFinalizer: entry = ( |
            | 
            at: path PutFinalizer: entry IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'Comment: Add entry to the list of finalizers that are automatically
called whenever this code file is unloaded.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         at: path PutFinalizer: entry IfFail: errBlk = ( |
             cf.
             err.
            | 
            sema protectNoNlr: [
                cf: (at: path IfFail: [|:e| err: e. nil]).
                cf ifNotNil: [cf finalizers addLast: entry].
            ].
            err ifNotNil: errBlk
                   IfNil: [self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         at: path PutInitializer: entry = ( |
            | 
            at: path PutInitializer: entry IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'Comment: Add entry to the list of initializers that are automatically
called whenever this code file is loaded.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         at: path PutInitializer: entry IfFail: errBlk = ( |
             cf.
             err.
            | 
            sema protectNoNlr: [
                cf: (at: path IfFail: [|:e| err: e. nil]).
                cf ifNotNil: [cf initializers addLast: entry].
            ].
            err ifNotNil: errBlk
                   IfNil: [self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         exists: path = ( |
            | 
            sema protectNoNLR: [
                (noLockAt: path) isNotNil
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'Comment: Iterate over all foreignCode objects.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         foreignCodeFilesDo: blk = ( |
            | 
            sema protect: [
                allPaths do: blk.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'Comment: Do not call directly; should only be called when filing 
in and after reading a snapshot.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            resetLock.
            sema protectNoNLR: [
                foreignCodeFilesDo: [|:cf| cf initialize].
                linker initialize.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'Comment: Look carefully for codeFile matching path. If no such
file, return nil.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         noLockAt: path = ( |
            | 
            allPaths at: path IfAbsent: [
                "Try finding an entry that has a different string as its
                 path name but nevertheless refers to the same physical 
                 file. This second search is not very efficient."
                foreignCodeFilesDo: [|:cf. :dbPath|
                    (cf sameCodeFileAsPath: path) ifTrue: [
                        "Update the database entry to be under the
                         new name. This allows us to adapt to things that
                         have been moved so that they can be more
                         efficiently located in the future."
                         cf setPath: path.
                         allPaths removeKey: dbPath.
                         add: cf.
                         ^ cf.
                    ].
                ].
                nil.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'Comment: Print out summary of information in foreignCodeDB.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         printStatus = ( |
            | 
            'Status of foreignCodeDB: ' printLine.
            ' Loads  foreignCode object' printLine.
            foreignCodeFilesDo: [|:cf|
                '   ' print. cf count print. '    ' print. cf printLine.
                cf dependentsDo: [|:pr| 
                    '           ' print. 
                    pr printLine.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         resetAllLocks = ( |
            | 
            resetLock.
            sema protectNoNLR: [
              foreignCodeFilesDo: [|:cf| cf resetLock].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         resetLock = ( |
            | sema: sema copyBinary).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'Comment: to manage concurrent access.\x7fModuleInfo: Module: foreign InitialContents: InitializeToExpression: (recursiveSemaphore copyCount: 1 Capacity: 1)\x7fVisibility: private'
        
         sema <- recursiveSemaphore copyCount: 1 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignCodeDB' -> () From: ( | {
         'Comment: Do not call directly; only called before reading a snapshot.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         shutdown = ( |
            | 
            sema protectNoNLR: [
                foreignCodeFilesDo: [|:cf| 
                    cf forceUnloadIfFail: [|:err| err printLine].
                ].
                linker shutdown.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: external libraries\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         foreignFct = bootstrap define: bootstrap stub -> 'globals' -> 'foreignFct' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals fctProxy _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'foreignFct' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals foreignFct.

CopyDowns:
globals fctProxy. _Clone 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignFct' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         argCoercions <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignFct' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         codeFile <- bootstrap stub -> 'globals' -> 'foreignCode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignFct' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         fctName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignFct' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         language <- 'C'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: foreign\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         foreignFct = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( |
             {} = 'Comment: This object provides a higher level interface to foreign 
     functions than that provided by the raw fctProxy objects. It knows 
     about code files and cooperates with them and the linker to recover 
     from dead function proxies. All this is transparent to the client.\x7fModuleInfo: Creator: traits foreignFct.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignFct' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'foreignFct' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignFct' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         prototypeName = 'foreignFct'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'foreignFct' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: InitializeToExpression: (\'unknown\')\x7fVisibility: public'
        
         resultType <- 'unknown'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: external libraries\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         sunLinker = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sunLinker' -> () From: ( |
             {} = 'Comment: An implementation of a linker object based on the Sun OS linker ld.so:
     All the methods in this object are pseudo-private. They should not be
     accessed directly, since this would break the higher level protocols 
     defined in foreignCode, foreignFct and foreignCodeDB.\x7fModuleInfo: Creator: globals sunLinker.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: external libraries\x7fComment: THE linker\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         linker = bootstrap stub -> 'globals' -> 'sunLinker' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot'
        
         foreign = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'foreign' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'foreign' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules foreign.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'foreign' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'foreign' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'foreign' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot'
        
         myComment <- 'An interface to foreign functions.\"

                \"The foreignFct, foreignCode and foreignCodeDB objects require
                 an underlying dynamic linker object. The linker object only
                 provides the minimal functionality, the intention being that
                 system dependent aspects are isolated to a relatively small
                 object. A consequence of the minimality is that the linker
                 object should not be accessed directly by the user, since
                 concepts such as reference counting are handled at a higher
                 level (and would break if the user was directly sending
                 messages to the linker).

                 Here is a list of the messages that the dynamic linker should 
                 understand:

            loadPath: path                                                  IfFail: b
            unloadPath:                 path Handle: handle                 IfFail: b
            lookupFunction: entry Path: path Handle: handle ResultProxy: rp IfFail: b
            lookupSymbol:  symbol Path: path Handle: handle ResultProxy: rp IfFail: b
            noOfArgsFunction: entry Path: path Handle: handle               IfFail: b
            initialize
            shutdown

                   * path is an absolute path for a code file. A special case is \'\',
                     which denotes the main code file (i.e. the Self VM).
                   * handle is an optional capability that the concrete dynamic 
                     linker may choose to associate with a given path when loaded. 
                     In subsequent messages related to this path, both the path
                     and the handle will be presented.
                   * rp is the proxy which will be returned as the result of the 
                     operation. It must be dead when passed in.
                   * entry  is a string object.
                   * symbol is a string object.
                   * errBlk should be send    value: \'some err string\'  upon failure.

                   The linker need not do reference counting. This is done by
                   the higher level protocols. Therefore, calls to loadPath:
                   and unloadPath:Handle:  will for a given path occur in
                   strictly alternating order, the first call being loadPath:.
                   The linker must support the special case path = \'\'.  It
                   denotes the main code file (i.e. the Self VM).

                   More detailed, here is what the methods should do:

                    loadPath:
                       Contract: fpath is the full path of a code file that is 
                       presently not loaded. This file should be loaded, and a
                       handle (proxy) representing the loaded file should be
                       returned. If the concrete dynamic linker does not use
                       handles, it is free to return anything.

                    unloadPath:Handle:
                       Contract: fpath is the full path of a code file that has been 
                       previously loaded. This file should be unloaded. This method 
                       is allowed to be unsupported, since some linkers do not provide 
                       this functionality.

                    lookupFunction:Path:Handle:ResultProxy:
                       Contract: entry is a symbol name which should be looked up in 
                       fpath (full path name of a code file that has previously
                       been loaded).  Return value is a fctProxy that
                       represents the function at the entry point given by
                       entry.

                    noOfArgsFunction:Path:Handle:IfFail:
                       Contract: arguments are the same as for 
                       lookupFunction:Path:Handle:.
                       Return guess on number of arguments the function takes 
                       (or -1 if no guess available).

                    lookupSymbol:Path:Handle:ResultProxy:
                       Contract: symbol is a symbol name which should be looked up 
                       in path (a code file that has previously been loaded).
                       Return value is a proxy that contains a pointer to this
                       symbol.

                    initialize 
                       Contract: this message is sent to the linker when it is
                       filed in and after reading a snapshot. 

                    shutdown 
                       Contract: this message is sent to the linker before 
                       reading a snapshot.
                \"
                \"Vm objects like proxy and fctProxy must appear at top level of 
                 slotsToAdd'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'foreign' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            proxy kill.
            fctProxy kill.
            foreignCode   initialize.
            foreignCodeDB initialize.

            snapshotAction addPostReadMessage: (
             "must not be traits foreignFct because message storeStringIfFail:
              sends storeStringIfFail to its receiver-- dmu"
              message copy receiver:  foreignFct
                           Selector: 'initializeOsVariant').

            snapshotAction addPostReadMessage: (
                message copy receiver: foreignCodeDB Selector: 'initialize'
            ).
            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: foreignCodeDB
                           Selector: 'resetAllLocks'.
            foreignFct initializeOsVariant.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'foreign' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: InitializeToExpression: (\'Sun-$Revision: 30.12 $\')\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.12 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'foreign' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: foreign\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         proxy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( |
             {} = 'Comment: A proxy object is a Self object that holds an encapsulated 
     machine pointer. Proxy objects may die (when the pointer becomes 
     invalid), e.g. after reading a Snapshot.\x7fModuleInfo: Creator: traits proxy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunLinker' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         canUnload = ( |
            | 
            "Release 4.1.1 of SunOS has a buggy dynamic linker - unload does
             not work, unless a patch has been installed. If this patch has
             been installed on your system, change this line to reflect it."
            os release >= '4.1.2').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunLinker' -> () From: ( | {
         'Comment: Set true to generate test output.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         debug = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunLinker' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: foreign InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            debug ifTrue: [ 'sunLinker initialize' printLine. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunLinker' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: foreign InitialContents: FollowSlot'
        
         loadPath: fpath IfFail: errBlk = ( |
             handle <- bootstrap stub -> 'globals' -> 'proxy' -> ().
             rec.
            | 
            debug ifTrue: [ ('sunLinker loadPath: ', fpath) printLine. ].
            fpath = '' ifTrue: [ rec: 0. ]
                        False: [ rec: fpath asVMByteVector ].
            "If the scheduler is running _Dlopen has to be wrapped with
             unixGlobals os_file stopAsync and startAsync to avoid undefined status of
             stdin, stdout, and stderr in case the dynamic linker decides to 
             abort this unix process. April 92, LB"
            scheduler isRunning ifTrue: [ os_file stopAsync ].
            handle: rec _Dlopen: 1 ResultProxy: proxy deadCopy IfFail: [|:e|
                scheduler isRunning ifTrue: [ os_file startAsync ].
                ^errBlk value: e].
            scheduler isRunning ifTrue: [ os_file startAsync ].
            handle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunLinker' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: foreign InitialContents: FollowSlot'
        
         lookupFunction: entry Path: fpath Handle: handle ResultProxy: rp IfFail: errBlk = ( |
            | 
            debug ifTrue: [ ('sunLinker lookupFunction: ', entry) printLine. ].
            handle _FctLookup: entry asVMByteVector ResultProxy: rp IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunLinker' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: foreign InitialContents: FollowSlot'
        
         lookupSymbol: symbol Path: fpath Handle: handle ResultProxy: rp IfFail: errBlk = ( |
            | 
            debug ifTrue: [ ('sunLinker lookupSymbol: ', entry) printLine. ].
            handle _Dlsym: symbol asVMByteVector ResultProxy: rp IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunLinker' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: foreign InitialContents: FollowSlot'
        
         noOfArgsFunction: entry Path: fpath Handle: handle IfFail: errBlk = ( |
            | 
            handle _NoOfArgsFct: entry asVMByteVector IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunLinker' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunLinker' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: foreign InitialContents: FollowSlot'
        
         shutdown = ( |
            | 
            debug ifTrue: [ 'sunLinker shutdown' printLine. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sunLinker' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: foreign InitialContents: FollowSlot'
        
         unloadPath: fpath Handle: handle IfFail: errBlk = ( |
            | 
            debug ifTrue: [ ('sunLinker unloadPath: ', fpath) printLine. ].
            canUnload ifTrue: [
                handle _DlcloseIfFail: errBlk.
            ] False: [
                ^ errBlk value: 'Warning: Unless a patch has been installed, ',
                                'the dynamic linker in SunOS\n',
                                'release 4.1.1 (and earlier) ', 
                                'can not unload libraries --\n',
                                'not unloading ', fpath, '.'.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 IfFail: errBlk = ( |
            | 
            _Call: arg1 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 IfFail: errBlk = ( |
            | 
            _Call: arg1 With: arg2 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 IfFail: errBlk = ( |
            | 
            _Call: arg1 With: arg2 With: arg3 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 With: arg4 IfFail: errBlk = ( |
            | 
            _Call: arg1 With: arg2 With: arg3 With: arg4 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 IfFail: errBlk = ( |
            | 
            _Call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 
                      IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 With: arg6 IfFail: errBlk = ( |
            | 
            _Call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 
             With: arg6 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 With: arg6 With: arg7 IfFail: errBlk = ( |
            | 
            _Call: arg1 With: arg2 With: arg3 With: arg4 With: arg5
             With: arg6 With: arg7 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 With: arg6 With: arg7 With: arg8 IfFail: errBlk = ( |
            | 
            _Call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 
             With: arg6 With: arg7 With: arg8 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 With: arg6 With: arg7 With: arg8 With: arg9 IfFail: errBlk = ( |
            | 
            _Call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 
             With: arg6 With: arg7 With: arg8 With: arg9 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 With: arg6 With: arg7 With: arg8 With: arg9 With: arg10 IfFail: errBlk = ( |
            | 
            _Call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 
             With: arg6 With: arg7 With: arg8 With: arg9 With: arg10
                      IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertIfFail: errBlk = ( |
            | 
            _CallAndConvertIfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 IfFail: errBlk = ( |
            | 
            _CallAndConvertWith: a1 And: x1 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 IfFail: errBlk = ( |
            | 
            _CallAndConvertWith: a1 And: x1 With: a2 And: x2
                         IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 IfFail: errBlk = ( |
            | 
            _CallAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3
                         IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 With: a4 And: x4 IfFail: errBlk = ( |
            | 
            _CallAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3 With: a4 And: x4
                         IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 With: a4 And: x4 With: a5 And: x5 IfFail: errBlk = ( |
            | 
            _CallAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3 With: a4 And: x4 
                           With: a5 And: x5
                         IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 With: a4 And: x4 With: a5 And: x5 With: a6 And: x6 IfFail: errBlk = ( |
            | 
            _CallAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3 With: a4 And: x4 
                           With: a5 And: x5 With: a6 And: x6
                         IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 With: a4 And: x4 With: a5 And: x5 With: a6 And: x6 With: a7 And: x7 IfFail: errBlk = ( |
            | 
            _CallAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3 With: a4 And: x4 
                           With: a5 And: x5 With: a6 And: x6
                           With: a7 And: x7
                         IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 With: a4 And: x4 With: a5 And: x5 With: a6 And: x6 With: a7 And: x7 With: a8 And: x8 IfFail: errBlk = ( |
            | 
            _CallAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3 With: a4 And: x4 
                           With: a5 And: x5 With: a6 And: x6
                           With: a7 And: x7 With: a8 And: x8
                         IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 With: a4 And: x4 With: a5 And: x5 With: a6 And: x6 With: a7 And: x7 With: a8 And: x8 With: a9 And: x9 IfFail: errBlk = ( |
            | 
            _CallAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3 With: a4 And: x4 
                           With: a5 And: x5 With: a6 And: x6
                           With: a7 And: x7 With: a8 And: x8 
                           With: a9 And: x9
                         IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 With: a4 And: x4 With: a5 And: x5 With: a6 And: x6 With: a7 And: x7 With: a8 And: x8 With: a9 And: x9 With: a10 And: x10 IfFail: errBlk = ( |
            | 
            _CallAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3 With: a4 And: x4 
                           With: a5 And: x5 With: a6 And: x6
                           With: a7 And: x7 With: a8 And: x8 
                           With: a9 And: x9 With: a10 And: x10
                         IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'Category: calling\x7fComment: 
        Calling a foreign function is supported through the value... and
         callAndConvert...  methods. The value... methods are used for 
         foreign functions where each argument must have a unique type (such
         as read(int fd, char *buf, int nbyte)). The Self level arguments must
         correspond to the types of arguments that the foreign function expects,
         and the return value is an object whose type corresponds to the 
         type that the foreign function returns.
  
         The callAndConvert... methods are used for calling polymorphic foreign 
         functions where each argument may have one of several types (for 
         example printf(char *, ...) where the first argument is a string, 
         but the following arguments can be integers, floats, strings etc.). 
         For callAndConvert..., it takes two arguments at the Self level to 
         produce one argument for the foreign function, according to the 
         following rules:
  
             1. Self arg     2. Self arg    Foreign arg (C notation).
             -------------------------------------------------------
             smallInt a      smallInt x     int n = (int)a | (int)x << 16.
             byteVector a    smallInt x     char *ptr = ptr to x\'th byte in a.
             float a         ignored  x     float g = a.
             proxy a         ignored  x     void *ptr = pointer in a.
  
         The return value of callAndConvert... is a byte vector of size
         sizeof(void *). It contains the bit pattern that the foreign function
         returned.
         
         If attempting to call a function through a dead fctProxy, the call 
         fails. Upon failure, the errBlk is invoked with one argument: a string 
         describing the error.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callIfFail: errBlk = ( |
            | 
            _CallIfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         noOfArgs = ( |
            | noOfArgsIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         noOfArgs: n = ( |
            | noOfArgs: n IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         noOfArgs: n IfFail: errBlk = ( |
            | 
            "Set how many args this fctProxy should demand when called.
             Warning: this is potentially unsafe."
            withRetryDo: [|:blk| _NoOfArgs: n IfFail: blk] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         noOfArgsIfFail: errBlk = ( |
            | 
            "How many args this fctProxy needs when called. 
             -1 means that any number of args is allowed."
            withRetryDo: [|:blk| _NoOfArgsIfFail: blk] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'fctProxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: dependents\x7fComment: Add a [fct]Proxy to the dependency set.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         addDep: pr = ( |
            | 
            sema protectNoNLR: [
                deps add: (reflect: pr).
                invariant.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: copying\x7fComment: Should only be called by foreignCodeDB.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         copyPath: path IfFail: errBlk = ( |
            | 
            copy initPath: path IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: loading and unloading\x7fCategory: count\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         decCountIfZero: blk IfFail: errBlk = ( |
            | 
            sema protect: [
                0 = count ifTrue: [^ errBlk value: 'more unloads than loads'].
                count: count - 1.
                0 = count ifTrue: blk.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: dependents\x7fComment: Iterate \'blk\' over all the proxies that are dependent on this
foreignCode object.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         dependentsDo: blk = ( |
            | 
            sema protect: [
                deps do: [|:w| blk value: w reflectee].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: path operations\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         expandPath: pth = ( |
             searchPath.
            | 
            searchPath: os environmentAt: 'LD_LIBRARY_PATH'  
                                  IfFail: [ os_file dirPath ].
            os_file expand: (os_file locate: pth InPath: searchPath IfFail: [pth])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: path operations\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         expandedPath = ( | {
                 'ModuleInfo: Module: foreign InitialContents: FollowSlot'
                
                 res <- ''.
                } 
            | 
            '' = path ifTrue: [^ path].     "Allow the empty path to get through."
            expandPath: path).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: loading and unloading\x7fCategory: unloading\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         forceUnload = ( |
            | forceUnloadIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: loading and unloading\x7fCategory: unloading\x7fComment: Force unload, no matter the load count.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         forceUnloadIfFail: errBlk = ( |
             err.
            | 
            sema protectNoNLR: [
                count: 1.
                unloadIfFail: [|:e| err: e].
            ].
            err ifNotNil: errBlk
                   IfNil: [self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: loading and unloading\x7fCategory: count\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         incCountIfOne: blk = ( |
            | 
            sema protect: [
                count: 1 + count.
                1 = count ifTrue: blk
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         initPath: pth IfFail: errBlk = ( |
            | 
            setPath: pth.
            '' != path ifTrue: [
                (os_file exists: expandedPath) ifFalse: [
                    ^ errBlk value: 'no such file: ', pth.
                ].
            ].
            initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: initialization\x7fComment: Only external call should be by foreignCodeDB, after 
reading in a snapshot and when filing in.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         initialize = ( |
            | 
            resetLock.
            sema protectNoNLR: [
                handle:       proxy deadCopy.
                initializers: list  copyRemoveAll.
                finalizers:   list  copyRemoveAll.
                deps:         set   copyRemoveAll.
                count:        0.
                invariant.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: initialization\x7fComment: Call any time to verify consistency.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         invariant = ( |
             e.
            | 
            sema protectNoNLR: [
                (0 > count)                        ifTrue: [e: 'inv-'].
                (0 = count) && [0 != deps size]    ifTrue: [e: 'inv0'].
                (0 < count) && [handle isLive not] ifTrue: [e: 'inv+'].
            ].
            e ifNotNil: [error: e].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: loading and unloading\x7fCategory: count\x7fComment: Returns true iff the code repr. by this object is presently loaded.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         isLoaded = ( |
            | 
            0 < count).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: dependents\x7fComment: Kill all fctProxies and proxies that depend on this code file.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         killDeps = ( |
            | 
            sema protectNoNLR: [
                dependentsDo: [|:pr| pr kill].
                deps removeAll.
                invariant.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: loading and unloading\x7fCategory: loading\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         load = ( |
            | loadIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: loading and unloading\x7fCategory: loading\x7fComment: Actual load done only if presently unloaded, but load count 
is always affected.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         loadIfFail: errBlk = ( |
            | 
            incCountIfOne: [ 
                handle: (linker loadPath: expandedPath 
                                  IfFail: [|:e| ^ errBlk value: e]).
                verifyChecksum.
                initializers do: [|:i| 
                    (lookupFunction: i IfFail: [|:e| ^ errBlk value: e])
                         callAndConvertIfFail: [|:e| ^ errBlk value: e].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: loading and unloading\x7fCategory: loading\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         loadIfUnloaded = ( |
            | loadIfUnloadedIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: loading and unloading\x7fCategory: loading\x7fComment: Do a load, unless this code file is already loaded.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         loadIfUnloadedIfFail: errBlk = ( |
             err.
            | 
            sema protectNoNLR: [
                isLoaded ifFalse: [loadIfFail: [|:e| err: e]].
            ].
            err ifNotNil: errBlk
                   IfNil: [self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: lookup\x7fCategory: functions\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupFunction: entry = ( |
            | 
            lookupFunction: entry IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: lookup\x7fCategory: functions\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupFunction: entry IfFail: errBlk = ( |
            | 
            lookupFunction: entry 
               ResultProxy: fctProxy deadCopy 
                    IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: lookup\x7fCategory: functions\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupFunction: entry ResultProxy: rp = ( |
            | 
            lookupFunction: entry ResultProxy: rp IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: lookup\x7fCategory: functions\x7fComment: Lookup a function given by entry, an entry point that is 
defined in the code file. Normally entry points are strings,
but the format may be system dependent. Call load if necessary.
rp is the fctProxy into which the result is put. It is also
the return value of this method.
Warning: no checking is done that the entry point really
designates a function.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupFunction: entry ResultProxy: rp IfFail: errBlk = ( |
             err.
            | 
            sema protectNoNLR: [
                loadIfUnloadedIfFail: [|:e| err: e].
                err ifNil: [
                    linker lookupFunction: entry
                                     Path: expandedPath
                                   Handle: handle
                              ResultProxy: rp
                                   IfFail: [|:e| err: e].
                    err ifNil: [  "Still no error."
                        rp noOfArgs: (linker noOfArgsFunction: entry
                                                          Path: expandedPath
                                                        Handle: handle
                                                        IfFail: [|:e| err: e]).
                        addDep: rp.
                    ].
                ].
            ].
            err ifNil:    [rp]
                IfNotNil: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: lookup\x7fCategory: symbols\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupSymbol: entry = ( |
            | 
            lookupSymbol: entry IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: lookup\x7fCategory: symbols\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupSymbol: entry IfFail: errBlk = ( |
            | 
            lookupSymbol: entry ResultProxy: proxy deadCopy IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: lookup\x7fCategory: symbols\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupSymbol: entry ResultProxy: rp = ( |
            | 
            lookupSymbol: entry ResultProxy: rp IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: lookup\x7fCategory: symbols\x7fComment: This method is similar to lookupFunction:, but looks up any 
kind of symbol (i.e. not only functions, but also variables etc.). 
Returns a proxy (rp) rather than a fctProxy.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupSymbol: entry ResultProxy: rp IfFail: errBlk = ( |
             err.
            | 
            sema protectNoNLR: [
                loadIfUnloadedIfFail: [|:e| err: e].
                err ifNil: [
                    linker lookupSymbol: entry
                                   Path: expandedPath
                                 Handle: handle
                            ResultProxy: rp
                                 IfFail: [|:e| err: e].
                    err ifNil: [addDep: rp].
                ].
            ].
            err ifNil:    [rp]
                IfNotNil: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         resetLock = ( |
            | sema: sema copyBinary).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: path operations\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         sameCodeFileAsPath: pth = ( |
             result <- bootstrap stub -> 'globals' -> 'false' -> ().
             stat1.
             stat2.
            | 
            path = pth ifTrue: [^ true].
            ('' = path) || [pth = ''] ifTrue: [^ false].

            "stat: is implemented by foreign code and will fail in the
             profiled version of the VM due to an inoperative dynamic linker."
            stat1: os stat: expandedPath IfFail: [^false].
            stat2: os stat: (expandPath: pth) IfFail: [^false].

            result: stat1 = stat2.
            stat1 kill.
            stat2 kill.
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: path operations\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         setPath: pth = ( |
            | 
            "This method should only be called from 'foreignCodeDB' and to
             initialize"
            path: pth.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | path).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: loading and unloading\x7fCategory: unloading\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         unload = ( |
            | unloadIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: loading and unloading\x7fCategory: unloading\x7fComment: Actual unload done only if number of unloads matches number of
loads exactly. But load count is always affected.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         unloadIfFail: errBlk = ( |
            | 
            decCountIfZero: [ 
                killDeps.
                finalizers do: [|:i| 
                    (lookupFunction: i IfFail: [|:e| ^ errBlk value: e])
                         callAndConvertIfFail: [|:e| ^ errBlk value: e].
                ].
                linker unloadPath: expandedPath 
                           Handle: handle
                           IfFail: [|:e| ^ errBlk value: e].
                handle kill.
            ] IfFail: [|:e| ^ errBlk value: e].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignCode' -> () From: ( | {
         'Category: loading and unloading\x7fCategory: loading\x7fComment: Verification of checksum in dynamic library. To avoid calls 
from the library into the VM before the checksum has been
verified the verify function is implemented as a c function.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         verifyChecksum = ( |
             fctName = 'verify_checksum'.
             result <- bootstrap stub -> 'globals' -> 'byteVector' -> ().
            | 
            sema protectNoNLR: [
                (lookupFunction: fctName IfFail: nil) ifNotNil: [|:checksumFct|
                    result: (checksumFct callAndConvertIfFail: nil).
                    result isNotNil && [(result at: 3) != 1 asByte] ifTrue: [
                        (path, ' has a wrong checksum, please recompile it.') printLine.
                    ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 IfFail: errBlk = ( |
            | 
            resend.call: arg1 IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.call: (coerce: arg1 To: (argCoercions at: 0))
                         IfFail: errBlk.
                ] False: [
                    errBlk value: e. 
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 IfFail: errBlk = ( |
            | 
            resend.call: arg1 With: arg2 IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.call: (coerce: arg1 To: (argCoercions at: 0))
                           With: (coerce: arg2 To: (argCoercions at: 1))
                         IfFail: errBlk.
                ] False: [
                    errBlk value: e. 
                ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 IfFail: errBlk = ( |
            | 
            resend.call: arg1 With: arg2 With: arg3 IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.call: (coerce: arg1 To: (argCoercions at: 0))
                           With: (coerce: arg2 To: (argCoercions at: 1))
                           With: (coerce: arg3 To: (argCoercions at: 2))
                         IfFail: errBlk.
                ] False: [
                    errBlk value: e. 
                ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 With: arg4 IfFail: errBlk = ( |
            | 
            resend.call: arg1 With: arg2 With: arg3 With: arg4 IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.call: (coerce: arg1 To: (argCoercions at: 0))
                           With: (coerce: arg2 To: (argCoercions at: 1))
                           With: (coerce: arg3 To: (argCoercions at: 2))
                           With: (coerce: arg4 To: (argCoercions at: 3))
                         IfFail: errBlk.
                ] False: [
                    errBlk value: e. 
                ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 IfFail: errBlk = ( |
            | 
            resend.call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 
                      IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.call: (coerce: arg1 To: (argCoercions at: 0))
                           With: (coerce: arg2 To: (argCoercions at: 1))
                           With: (coerce: arg3 To: (argCoercions at: 2))
                           With: (coerce: arg4 To: (argCoercions at: 3))
                           With: (coerce: arg5 To: (argCoercions at: 4))
                         IfFail: errBlk.
                ] False: [
                    errBlk value: e. 
                ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 With: arg6 IfFail: errBlk = ( |
            | 
            resend.call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 
             With: arg6 IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.call: (coerce: arg1 To: (argCoercions at: 0))
                           With: (coerce: arg2 To: (argCoercions at: 1))
                           With: (coerce: arg3 To: (argCoercions at: 2))
                           With: (coerce: arg4 To: (argCoercions at: 3))
                           With: (coerce: arg5 To: (argCoercions at: 4))
                           With: (coerce: arg6 To: (argCoercions at: 5))
                         IfFail: errBlk.
                ] False: [
                    errBlk value: e. 
                ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 With: arg6 With: arg7 IfFail: errBlk = ( |
            | 
            resend.call: arg1 With: arg2 With: arg3 With: arg4 With: arg5
             With: arg6 With: arg7 IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.call: (coerce: arg1 To: (argCoercions at: 0))
                           With: (coerce: arg2 To: (argCoercions at: 1))
                           With: (coerce: arg3 To: (argCoercions at: 2))
                           With: (coerce: arg4 To: (argCoercions at: 3))
                           With: (coerce: arg5 To: (argCoercions at: 4))
                           With: (coerce: arg6 To: (argCoercions at: 5))
                           With: (coerce: arg7 To: (argCoercions at: 6))
                         IfFail: errBlk.
                ] False: [
                    errBlk value: e. 
                ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 With: arg6 With: arg7 With: arg8 IfFail: errBlk = ( |
            | 
            resend.call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 
             With: arg6 With: arg7 With: arg8 IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.call: (coerce: arg1 To: (argCoercions at: 0))
                           With: (coerce: arg2 To: (argCoercions at: 1))
                           With: (coerce: arg3 To: (argCoercions at: 2))
                           With: (coerce: arg4 To: (argCoercions at: 3))
                           With: (coerce: arg5 To: (argCoercions at: 4))
                           With: (coerce: arg6 To: (argCoercions at: 5))
                           With: (coerce: arg7 To: (argCoercions at: 6))
                           With: (coerce: arg8 To: (argCoercions at: 7))
                         IfFail: errBlk.
                ] False: [
                    errBlk value: e. 
                ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 With: arg6 With: arg7 With: arg8 With: arg9 IfFail: errBlk = ( |
            | 
            resend.call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 
             With: arg6 With: arg7 With: arg8 With: arg9 IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.call: (coerce: arg1 To: (argCoercions at: 0))
                           With: (coerce: arg2 To: (argCoercions at: 1))
                           With: (coerce: arg3 To: (argCoercions at: 2))
                           With: (coerce: arg4 To: (argCoercions at: 3))
                           With: (coerce: arg5 To: (argCoercions at: 4))
                           With: (coerce: arg6 To: (argCoercions at: 5))
                           With: (coerce: arg7 To: (argCoercions at: 6))
                           With: (coerce: arg8 To: (argCoercions at: 7))
                           With: (coerce: arg9 To: (argCoercions at: 8))
                         IfFail: errBlk.
                ] False: [
                    errBlk value: e. 
                ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 With: arg6 With: arg7 With: arg8 With: arg9 With: arg10 IfFail: errBlk = ( |
            | 
            resend.call: arg1 With: arg2 With: arg3 With: arg4 With: arg5 
             With: arg6 With: arg7 With: arg8 With: arg9 With: arg10
                      IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.call: (coerce: arg1 To: (argCoercions at: 0))
                           With: (coerce: arg2 To: (argCoercions at: 1))
                           With: (coerce: arg3 To: (argCoercions at: 2))
                           With: (coerce: arg4 To: (argCoercions at: 3))
                           With: (coerce: arg5 To: (argCoercions at: 4))
                           With: (coerce: arg6 To: (argCoercions at: 5))
                           With: (coerce: arg7 To: (argCoercions at: 6))
                           With: (coerce: arg8 To: (argCoercions at: 7))
                           With: (coerce: arg9 To: (argCoercions at: 8))
                           With: (coerce: arg10 To: (argCoercions at: 9))
                         IfFail: errBlk.
                ] False: [
                    errBlk value: e. 
                ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertIfFail: errBlk = ( |
            | 
            resend.callAndConvertIfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.callAndConvertIfFail: errBlk.
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 IfFail: errBlk = ( |
            | 
            resend.callAndConvertWith: a1 And: x1 IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.callAndConvertWith: a1 And: x1 
                                       IfFail: errBlk
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 IfFail: errBlk = ( |
            | 
            resend.callAndConvertWith: a1 And: x1 With: a2 And: x2
                         IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.callAndConvertWith: a1 And: x1 
                                         With: a2 And: x2 
                                       IfFail: errBlk
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 IfFail: errBlk = ( |
            | 
            resend.callAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3
                         IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.callAndConvertWith: a1 And: x1 
                                         With: a2 And: x2 
                                         With: a3 And: x3 
                                       IfFail: errBlk
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 With: a4 And: x4 IfFail: errBlk = ( |
            | 
            resend.callAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3 With: a4 And: x4
                         IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.callAndConvertWith: a1 And: x1 
                                         With: a2 And: x2 
                                         With: a3 And: x3 
                                         With: a4 And: x4 
                                       IfFail: errBlk
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 With: a4 And: x4 With: a5 And: x5 IfFail: errBlk = ( |
            | 
            resend.callAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3 With: a4 And: x4 
                           With: a5 And: x5
                         IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.callAndConvertWith: a1 And: x1 
                                         With: a2 And: x2 
                                         With: a3 And: x3 
                                         With: a4 And: x4 
                                         With: a5 And: x5 
                                       IfFail: errBlk
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 With: a4 And: x4 With: a5 And: x5 With: a6 And: x6 IfFail: errBlk = ( |
            | 
            resend.callAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3 With: a4 And: x4 
                           With: a5 And: x5 With: a6 And: x6
                         IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.callAndConvertWith: a1 And: x1 
                                         With: a2 And: x2 
                                         With: a3 And: x3 
                                         With: a4 And: x4 
                                         With: a5 And: x5 
                                         With: a6 And: x6 
                                       IfFail: errBlk
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 With: a4 And: x4 With: a5 And: x5 With: a6 And: x6 With: a7 And: x7 IfFail: errBlk = ( |
            | 
            resend.callAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3 With: a4 And: x4 
                           With: a5 And: x5 With: a6 And: x6
                           With: a7 And: x7
                         IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.callAndConvertWith: a1 And: x1 
                                         With: a2 And: x2 
                                         With: a3 And: x3 
                                         With: a4 And: x4 
                                         With: a5 And: x5 
                                         With: a6 And: x6 
                                         With: a7 And: x7 
                                       IfFail: errBlk
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 With: a4 And: x4 With: a5 And: x5 With: a6 And: x6 With: a7 And: x7 With: a8 And: x8 IfFail: errBlk = ( |
            | 
            resend.callAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3 With: a4 And: x4 
                           With: a5 And: x5 With: a6 And: x6
                           With: a7 And: x7 With: a8 And: x8
                         IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.callAndConvertWith: a1 And: x1 
                                         With: a2 And: x2 
                                         With: a3 And: x3 
                                         With: a4 And: x4 
                                         With: a5 And: x5 
                                         With: a6 And: x6 
                                         With: a7 And: x7 
                                         With: a8 And: x8 
                                       IfFail: errBlk
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 With: a4 And: x4 With: a5 And: x5 With: a6 And: x6 With: a7 And: x7 With: a8 And: x8 With: a9 And: x9 IfFail: errBlk = ( |
            | 
            resend.callAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3 With: a4 And: x4 
                           With: a5 And: x5 With: a6 And: x6
                           With: a7 And: x7 With: a8 And: x8 
                           With: a9 And: x9
                         IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.callAndConvertWith: a1 And: x1 
                                         With: a2 And: x2 
                                         With: a3 And: x3 
                                         With: a4 And: x4 
                                         With: a5 And: x5 
                                         With: a6 And: x6 
                                         With: a7 And: x7 
                                         With: a8 And: x8 
                                         With: a9 And: x9 
                                       IfFail: errBlk
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callAndConvertWith: a1 And: x1 With: a2 And: x2 With: a3 And: x3 With: a4 And: x4 With: a5 And: x5 With: a6 And: x6 With: a7 And: x7 With: a8 And: x8 With: a9 And: x9 With: a10 And: x10 IfFail: errBlk = ( |
            | 
            resend.callAndConvertWith: a1 And: x1 With: a2 And: x2 
                           With: a3 And: x3 With: a4 And: x4 
                           With: a5 And: x5 With: a6 And: x6
                           With: a7 And: x7 With: a8 And: x8 
                           With: a9 And: x9 With: a10 And: x10
                         IfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.callAndConvertWith: a1 And: x1 
                                         With: a2 And: x2 
                                         With: a3 And: x3 
                                         With: a4 And: x4 
                                         With: a5 And: x5 
                                         With: a6 And: x6 
                                         With: a7 And: x7 
                                         With: a8 And: x8 
                                         With: a9 And: x9 
                                         With: a10 And: x10 
                                       IfFail: errBlk
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         callIfFail: errBlk = ( |
            | 
            resend.callIfFail: [|:e|
                ('badTypeError'   isPrefixOf: e) ||
                ['deadProxyError' isPrefixOf: e] ifTrue: [
                    reviveIfFail: [|:e| ^ errBlk value: e].
                    resend.callIfFail: errBlk.
                ] False: [
                    errBlk value: e. 
                ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: calling\x7fComment: 
            The \"call:With:...\" and \"callAndConvert:With:And:...\" in
            foreignFct objects gives transparent coercion and retry if
            the receiver or an argument is a dead proxy or has the wrong 
            type.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         coerce: arg To: type = ( |
            | 
            'i' = type ifTrue: [^ arg asSmallInteger].
            'f' = type ifTrue: [^ arg asFloat].
            'b' = type ifTrue: [^ arg asVMByteVector].
            'p' = type ifTrue: [^ arg revive].
            ' ' = type ifTrue: [^ arg].
            error: 'foreignFct: unknown argument coercion: ', type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: copying\x7fComment: This is the only copying method that does not require
a type signature. Supplying a type signature is strongly
encouraged. Use a space for those args you don\'t want
coerced.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         copyName: n = ( |
            | 
                copyName: n 
            ArgCoercions: '            '
              ResultType: 'unknown' 
                  IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         copyName: n ArgCoercions: t ResultType: r Path: p = ( |
            | 
            copyName: n ArgCoercions: t ResultType: r Path: p IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         copyName: n ArgCoercions: t ResultType: r Path: p IfFail: errBlk = ( |
            | 
            copy initName: n 
             ArgCoercions: t 
               ResultType: r
                 CodeFile: (foreignCodeDB at: p 
                                      IfFail: [|:e| ^ errBlk value: e])
                 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: naming\x7fComment: hooked up to an os variant in postFileIn\x7fModuleInfo: Module: foreign InitialContents: InitializeToExpression: ( () )\x7fVisibility: public'
        
         currentOsVariant* =  () .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: naming\x7fComment: use a constant slot for speed\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         currentOsVariant: variant = ( |
             tfMir.
            | 
            tfMir: (reflect: traits foreignFct).
            "need to use define cause modules may not be working yet"
            tfMir frozenDefine: (tfMir copyAt: 'currentOsVariant'
                                  PutContents: (reflect: variant)).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         entryName: name Language: lang IfFail: errBlk = ( |
            | 
            "This method maps the source name of a foreign routine to the
             corresponding entry point. Presently this method just prepends 
             an '_' to the name of the function. This is valid for fcts that 
             are glued in, since all glue uses C linking conventions. This may 
             change in the future, in which case the language may be involved in
             the mapping."
            entryPointFromName: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         initName: n ArgCoercions: t ResultType: r CodeFile: cf IfFail: errBlk = ( |
            | 
            fctName:      n.
            argCoercions: t.
            resultType:   r.
            codeFile:     cf.
            reviveIfFail: errBlk. "To get early err msg if things fail.").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeOsVariant = ( |
            | 
            currentOsVariant: host osVariantName sendTo: osVariants).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         isImmutableForFilingOut = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         noOfArgs: n IfFail: errBlk = ( |
            | 
            n > argCoercions size ifTrue: [
                errBlk value: 'can\'t have more args than type coercions'.
            ].
            resend.noOfArgs: n IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: naming\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         osVariants = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits foreignFct osVariants.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         bsd = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'bsd' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits foreignFct osVariants bsd.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         entryPointFromName: name = ( |
            | '_', name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         linux = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'linux' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits foreignFct osVariants linux.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         solaris = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'solaris' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits foreignFct osVariants solaris.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'linux' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'solaris' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         macOS_8 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'macOS_8' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits foreignFct osVariants macOS_8.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'macOS_8' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         entryPointFromName: name = ( |
            | name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         macOS_9 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'macOS_9' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits foreignFct osVariants macOS_9.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'macOS_9' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'macOS_8' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         macOS_X = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'macOS_X' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits foreignFct osVariants macOS_X.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'macOS_X' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'bsd' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         macOS_carbon = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'macOS_carbon' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits foreignFct osVariants macOS_carbon.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'macOS_carbon' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'macOS_9' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         entryPointFromName: name = ( |
            | name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'fctProxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         prototypeName = 'foreignFct'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         reviveIfFail: errBlk = ( |
            | 
            "The way a foreignFct object recovers from a dead fctProxy is by
             calling the linker to load the code (if necessary), and then look
             up the entry point."

             isLive ifTrue: [^ self].   "Just an optimization."
             codeFile loadIfUnloadedIfFail: [|:e| ^ errBlk value: e].
             codeFile lookupFunction: (entryPointFromName: fctName)
                         ResultProxy: kill
                              IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | fctName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            prototypeName, 
            ' copyName: ',      (fctName printStringSize: maxSmallInt),
            ' ArgCoercions: ',  (argCoercions printString),
            ' ResultType: ',    (resultType printString),
            ' Path: ',          (codeFile path printStringSize: maxSmallInt)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'foreignFct' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | prototypeName sendTo: lobby).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | 
            samePointerAs: x IfFail: [|:e| 
                ('badTypeError' isPrefixOf: e) ifTrue: [ ^ false ].
                error: e.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'Comment: Copying kills, this is a copy in order to get a dead one.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         deadCopy = ( |
            | copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         deadOrAlive = ( |
            | isLive ifTrue: 'live' False: 'dead').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | _ForeignHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         isLive = ( |
            | _ForeignIsLive).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         kill = ( |
            | _ForeignKill. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'Comment: For use in native framework.
Very dangerous - use with care.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         pointer = ( |
             bv.
            | 
            bv: byteVector copySize: 4.
            _PointerInByteVector: bv.
            bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'Comment: reviveIfFail: is called when a deadProxyError is detected; 
       override it in child to attempt recovery from this error.
       Since revive is a potentially expensive operation, we allow 
       it to be explicitly called. If the errBlk is sent value:, then
       this error will be reported instead of deadProxyError (useful if
       the recovery attempt fails in a more specific way).
       Important points: 
         1. This method must be idempotent - in particular, 
            calling it on a live proxy is not allowed to fail. 
         2. The return value must be self, unless errBlk is evaluated.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         revive = ( |
            | reviveIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         reviveIfFail: errBlk = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         samePointerAs: x = ( |
            | samePointerAs: x IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         samePointerAs: x IfFail: errBlk = ( |
            | _SamePointerAs: x IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'Comment: Return true iff type seals are the same.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         sameTypeAs: x IfFail: errBlk = ( |
            | 
            x typeSealIfFail: [|:e| ^ errBlk value: e] =
              typeSealIfFail: [|:e| ^ errBlk value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | deadOrAlive).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'Comment: Return type seal (a proxy) for this proxy.\x7fModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         typeSeal = ( |
            | typeSealIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         typeSealIfFail: errBlk = ( |
            | 
            _TypeSealResultProxy: proxy deadCopy IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxy' -> () From: ( | {
         'ModuleInfo: Module: foreign InitialContents: FollowSlot\x7fVisibility: public'
        
         withRetryDo: blk IfFail: errBlk = ( |
            | 
            "Send 'value:' to blk. If it fails with deadProxyError, invoke 
             revive: to attempt recovery, before retrying. Retry only once."
            blk value: [|:e|
                ('deadProxyError' isPrefixOf: e) ifTrue: [ 
                    reviveIfFail: [|:reviveError| ^ errBlk value: reviveError].
                ].
                blk value: errBlk.
            ]).
        } | ) 



 '-- Side effects'

 globals modules foreign postFileIn
