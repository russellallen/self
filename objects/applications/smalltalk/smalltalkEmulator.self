 '$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (())'
        
         mango = ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         smalltalkEmulator = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkEmulator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkEmulator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules smalltalkEmulator.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkEmulator' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkEmulator' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/smalltalk'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkEmulator' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkEmulator' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            "Create classes needed for bootstrapping"
            "Methods are defined in bootstrapClasses"
            (smalltalkEmulator global: 'Object')
              variableByteSubclass: 'BootstrapString'
              InstanceVariableNames: ''
              ClassVariableNames: ''
              PoolDictionaries: ''
              Category: 'Collections-Text'.
            (smalltalkEmulator global: 'BootstrapString')
              subclass: 'BootstrapSymbol'
              InstanceVariableNames: 'selfCanonicalString'
              ClassVariableNames: ''
              PoolDictionaries: ''
              Category: 'Collections-Text'.
            (smalltalkEmulator global: 'Object')
              subclass: 'SystemDictionary'
              InstanceVariableNames: ''
              ClassVariableNames: ''
              PoolDictionaries: ''
              Category: 'Collections-System').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkEmulator' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkEmulator' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fCategory: Smalltalk\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         smalltalkEmulator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( |
             {} = 'Comment: For reading and running Smalltalk apps -- Mario, 3/23/95\x7fModuleInfo: Creator: globals smalltalkEmulator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         atEnd = ( |
            | pos > input lastKey).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         buildParser = ( |
            | parser: ((mango parsers stGrammarParser copy) parseFile: 'applications/smalltalk/smalltalk.grm') output makeParser).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: objects\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         buildSystemClasses = ( |
            | 
            fileIn: 'UndefinedObject'.
            "install nil"
            ((reflect: (global: 'Object') instance_methods pseudo_vars) at: 'nil') contents
              defineAndSave: (reflect: ((global: 'UndefinedObject') prototype_instance)).
            "these classes are split into two; the methods that require
             character literals come later (because we haven't yet 
             defined a Character class!"

            fileIn: 'Object'.

            fileIn: 'Collection'.
            fileIn: 'SequenceableCollection'.
            fileIn: 'ArrayedCollection'.
            fileIn: 'Array'.
            fileIn: 'ByteArray'.

            "We can now define Character; for this we need Array"
            fileIn: 'Magnitude'.
            fileIn: 'Character'.

            "After this we can have string and symbol literals in methods"
            fileIn: 'String'.
            fileIn: 'Symbol'.

            "can now complete the initial classes"
            fileIn: 'UndefinedObject2'.
            fileIn: 'Object2'.
            fileIn: 'Collection2'.
            fileIn: 'SequenceableCollection2'.
            fileIn: 'ArrayedCollection2'.
            fileIn: 'Character2'.

            "and back on the main track"
            fileIn: 'LookupKey'.
            fileIn: 'Association'.

            fileIn: 'Bag'.
            fileIn: 'Set'.
            fileIn: 'Dictionary'.
            fileIn: 'IdentityDictionary'.
            fileIn: 'OrderedCollection'.
            fileIn: 'Interval'.
            fileIn: 'SortedCollection'.
            fileIn: 'Link'.
            fileIn: 'LinkedList'.
            fileIn: 'MappedCollection'.

            fileIn: 'TranscriptObj'.
            fileIn: 'Date'.
            fileIn: 'Time'.

            fileIn: 'Message'.

            fileIn: 'Stream'.
            fileIn: 'PositionableStream'.
            fileIn: 'ReadStream'.
            fileIn: 'WriteStream'.
            fileIn: 'ReadWriteStream'.

            "fileIn: 'richards'.
             fileIn: 'deltaBlue'.
             fileIn: 'STones80'").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: objects\x7fComment: Return the categories of classes in the system dictionary\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         categories = ( |
            | 
            (classes mapBy: [|:c| c class_category]
                     Into: set copyRemoveAll) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: objects\x7fComment: Return a vector of class names\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         classNames = ( |
             m.
            | 
            m: smalltalk at: 'Metaclass'.
            (globalNames
               filterBy: [|:n| (smalltalk at: n) class class _Eq: m]
                   Into: sequence copyRemoveAll) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: objects\x7fComment: Return the names of classes that have category cat.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         classNamesInCategory: cat = ( |
            | 
            (classNames asSequence filterBy: [|:c| (global: c) class_category = cat]) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: objects\x7fComment: Return the classes in the system dictionary\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         classes = ( |
             m.
            | 
            m: smalltalk at: 'Metaclass'.
            (((reflect: smalltalk global_dict)
               filterBy: [|:s| s contents reflectee class class _Eq: m]
                   Into: sequence copyRemoveAll)
               mapBy: [|:s| s contents reflectee]
                Into: sequence copyRemoveAll) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: evaluation\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         defaultContext = ( |
            | (global: 'Object') new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: evaluation\x7fModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         doItCounter <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: evaluation\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         evaluate: s = ( |
            | 
            evaluate: s InObject: defaultContext PrintResult: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: evaluation\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         evaluate: s InObject: obj PrintResult: print = ( |
             class.
             res.
             sel.
             src.
             stSrc.
            | 
            doItCounter: doItCounter succ.
            sel: ('doIt', doItCounter printString) canonicalize.
            stSrc: sel, '\n^[', s, '] value'.
            class: obj class.
            src:  translateMethod: stSrc
                         InstVars: class allInstVar_names
                        ClassName: class.
            src isEmpty ifTrue: [^self].
            class
              addMethod_SelfSource: src
              SmalltalkSource: stSrc
              Protocol: 'do it'.
            res: obj _Perform: sel.
            class removeSelector: sel.
            print ifTrue: [| t |
              reportLine: res printString.
            ].  
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: evaluation\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         evaluateAndPrint: s = ( |
            | 
            evaluate: s InObject: defaultContext PrintResult: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: reading\x7fComment: Read in Smalltalk source from fileName or fileName.st.
Use sourceFilePath to locate file.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         fileIn: fileName = ( |
             file.
             fullName.
             val.
            | 
            fullName:
              os_file locate: fileName InPath: sourceFilePath IfFail: [
              os_file locate: fileName, '.st' InPath: sourceFilePath IfFail: raiseError].
            file:  os_file openForReading: fullName.
            input:  file contents.
            file close.
            report: '\nFiling in from ', fileName.
            pos:  input firstKey.
            [atEnd] whileFalse: [
              skipWhitespace.
              val:  evaluate: nextChunk.
            ].
            report: '\n', fileName, ' done\n'.
            val).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: objects\x7fComment: Get the value of the Smalltalk global named \'name\'.
For bootstrapping purposes this has to use mirrors directly.
 -- Mario, 4/4/95\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         global: name = ( |
            | 
            ((reflect: smalltalk global_dict) at: (smalltalk map_name: name)) contents reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: objects\x7fComment: Return a vector of global names\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         globalNames = ( |
             s.
            | 
            s: (reflect: smalltalk global_dict) names
                 filterBy: [|:e| (e copyFrom: e lastKey pred) = '_s']
                     Into: sequence copyRemoveAll.
            (s mapBy: [|:n| smalltalk unmap_name: n]) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (nil)'
        
         input <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: objects\x7fComment: Map Smalltalk instance variable name to internal Self name.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         mapInstVarName: n = ( |
            | n, '_i').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: objects\x7fComment: Map Smalltalk selector s to its Self equivalent\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         mapSelector: s = ( |
             sel.
            | 
            sel: s asSelector.
            sel isKeyword ifFalse: s True: [
              sel keywords
                reduceWith: [| :p. :k | p, k capitalize]
               IfSingleton: [|:k| k]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         nextChar = ( |
             c.
            | 
            c:  input at: pos.
            pos: pos succ.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         nextChunk = ( |
             p.
             s.
            | 
            skipWhitespace.
            atEnd ifTrue: [^''].
            p: pos.
            s: ''.
            [nextChar = '!'  ifTrue: [| dbl |
               dbl:  peekChar: '!'.
               s: s, (input copyFrom: p UpTo: pos pred).
               dbl ifFalse: [^s].
               p: pos.
             ].
             atEnd ifTrue: [^s].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: reading\x7fComment: Smalltalk parser generated using mango -- Mario, 3/23/95\x7fModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         parser <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         peekChar: c = ( |
             t.
            | 
            atEnd ifTrue: [^false].
            t: (input at: pos) = c.
            t ifTrue: [pos: pos succ].
            t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (0)'
        
         pos <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fComment: Report a message in the transcript.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         report: string = ( |
            | 
            (nil = transcriptText) || [desktop isOpen not]
              ifTrue: [string asSelfString printLine]
               False: [
                 transcriptText safelyDo: [
                   transcriptText appendString: string asSelfString
                 ]
               ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fComment: Report the string in the transcript on a new line\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         reportLine: string = ( |
            | 
            nil = transcriptText
             ifTrue: [string asSelfString printLine]
              False: [transcriptText safelyDo: [
                       transcriptText appendString: '\n', string asSelfString]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         skipWhitespace = ( |
            | 
            [| n |
             atEnd ifTrue: [^self].
             n:  input at: pos.
                (n = ' ')
             || [n = '\n']
             || [n = '\t']
             || [n = '\f']
             || [n = '\r']
             ifFalse: [^self].
             pos: pos succ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: objects\x7fComment: The proxy for the system dictionary, Smalltalk -- Mario, 4/4/95\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         smalltalk = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> () From: ( |
             {} = 'Comment: This object mimics the system dictionary, Smalltalk.
Note that for bootstrapping and performance, it is not
a real Dictionary, hence accessing and modifying using
at:, at:put:, etc., will be slow.\x7fModuleInfo: Creator: globals smalltalkEmulator smalltalk.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> () From: ( | {
         'Comment: This object contains the actual globals.
It is on the inheritance path of all Smalltalk objects.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: private'
        
         global_dict = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         behavior_s = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> () From: ( |
             {} = 'Comment: Behavior\x7fModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict behavior_s.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (\'Kernel-Objects\')'
        
         class_category <- 'Kernel-Objects'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         instance_methods = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( |
             {} = 'Comment: Behavior instance methods\x7fModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict behavior_s instance_methods.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: adding and removing methods\x7fComment: src is the source of a method.  Add it to my methods,
under the given protocol, replacing any existing method
of the same name.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         addMethodSource: src Protocol: protocol = ( |
             selfSrc.
            | 
            selfSrc:
             smalltalk_emulator
               translateMethod: src
                      InstVars: self allInstVar_names
                     ClassName: (isMeta ifTrue: [base_name] False: [self_name]).
            selfSrc isEmpty ifTrue: '' False: [
              addMethod_SelfSource: selfSrc
                   SmalltalkSource: src
                          Protocol: protocol
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fComment: Install a new method in the given protocol.
selfSrc is the Self source of the method,
stSrc is the original Smalltalk source.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         addMethod_SelfSource: selfSrc SmalltalkSource: stSrc Protocol: protocol = ( |
             name.
             selfName.
             slot.
             slotsMir.
            | 
            slotsMir: 
              ('| ', selfSrc asSelfString, ' |')
                parseObjectBodyFileName: '<smalltalk>'
                IfFail: [| :err | self_lobby error: err printString].
            selfName: slotsMir names first.
            name: smalltalk_emulator unmapSelector: selfName.
            (prototype_instance _Mirror includesKey: selfName) ifTrue: [
              self_lobby error: 'You may not add a method (', name, ') to a class\n',
               'with the same name as an instance variable (other than\n',
               'a simple variable accessing or setting method).'.
            ].
            slot: slotsMir at: selfName.
            slot category: protocol asSelfString.
            slot module: 'generated_by_smalltalk'.
            instance_methods _Mirror addSlots: slotsMir.
            method_sources at: name Put: stSrc asSelfString.
            name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fComment: Return a vector of all the instance variable names\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         allInstVar_names = ( |
             inherited.
             local.
            | 
            (superclass _Eq: nil) ifTrue: [^self_lobby vector].
            local:  instVar_names.
            inherited: superclass allInstVar_names.
            (inherited asSequence addAll: local) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: instance creation\x7fComment: Make a new instance of me.  Shouldn\'t be
overridden in subclasses.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         basicNew = ( |
            | 
            prototype_instance copy_object).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: instance creation\x7fComment: Make a new instance of me, with `size\' indexed
instance variables.
Shouldn\'t be overridden in subclasses.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         basicNew: size = ( |
            | prototype_instance copy_object: size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fComment: Return a vector of the names of my class variables,
as Self strings, demangled.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         classVar_names = ( |
             names.
            | 
            names: self_lobby list copyRemoveAll.
            instance_methods class_vars _Mirror do: [|:slot|
              slot name last != ':' ifTrue: [
                names add: (smalltalk_emulator smalltalk unmap_name: slot name)
              ]
            ].
            names asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fComment: Return a string of all the (local) class variable names, separated
by spaces.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         classVars_string = ( |
             cvs <- ''.
            | 
            classVar_names doFirst: [|:n| cvs: n] MiddleLast: [|:n| cvs: cvs, (' ', n)].
            cvs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class_vars* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> 'class_vars' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict behavior_s instance_methods class_vars.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: accessing\x7fComment: Get my comment as a Smalltalk String.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         comment = ( |
            | string_s fromSelfString: _Mirror comment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: accessing\x7fComment: Set my comment to str.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         comment: str = ( |
            | 
            _Mirror comment: str asSelfString.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fComment: Copy a class object and its component objects, including
the metaclass.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         copy_object = ( |
             c.
             cm.
             im.
             meta.
            | 
            meta: class copy_object.
            im: instance_methods _Clone _Mirror.
            im at: 'class_vars' PutContents: meta instance_methods class_vars _Mirror.
            c: _Clone.
            cm: c _Mirror.
            im at: 'class' PutContents: cm.
            cm at: 'instance_methods'  PutContents: im.
            cm at: 'my_behavior' PutContents: meta instance_methods _Mirror.
            cm at: 'subclass_Names' PutContents: self_lobby set copyRemoveAll _Mirror.
            cm at: 'method_sources' PutContents: self_lobby dictionary copyRemoveAll _Mirror.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         instance_methods = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> () From: ( |
             {} = 'Comment: Object instance methods\x7fModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict object_s instance_methods.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         inherited_behavior* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         initialize = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fComment: Return a vector of the names of my (local) instance variables,
as Self strings, demangled.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         instVar_names = ( |
             myName.
             names.
            | 
            myName: self_name.
            names: self_lobby list copyRemoveAll.
            prototype_instance _Mirror do: [|:slot|
              (slot category = myName) && [slot name last != ':'] ifTrue: [
                names add: unmapInstVarName: slot name
              ]
            ].
            names asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fComment: Return a string of all the (local) instance variable names, separated
by spaces.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         instVars_string = ( |
             ivs <- ''.
            | 
            instVar_names
                doFirst: [|:n| ivs: n]
             MiddleLast: [|:n| ivs: ivs, (' ', n)].
            ivs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: accessing\x7fComment: Is this a metaclass?  Default to false.
\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         isMeta = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fComment: Continue filing in methods into me, under the
given protocol.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         methodsFor: protocol0 = ( |
             notice.
             protocol.
             str.
            | 
            protocol: protocol0 asSelfString.
            smalltalk_emulator reportLine: self_name, '>', protocol.
            [str: smalltalk_emulator nextChunk.
             str isEmpty] whileFalse: [
                 addMethodSource: str
                        Protocol: protocol.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: accessing\x7fComment: My name in Smalltalk as a Smalltalk String.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         name = ( |
            | 
            string_s fromSelfString: self_name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: instance creation\x7fComment: Make a new instance of me.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         new = ( |
            | 
            basicNew).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: instance creation\x7fComment: Make a new instance of me, with `size\' indexed
instance variables.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         new: size = ( |
            | basicNew: size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         object_type = 'plain'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: subclass creation\x7fCategory: private\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         redefineClass: name From: newClass = ( |
            | 
            smalltalk_emulator smalltalk at: name Put: newClass.
            subclass_Names do: [| :sn. sc. |
              sc: smalltalk_emulator global: sn.
              sc redefineSuper: name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: subclass creation\x7fCategory: private\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         redefineSuper: superclassName = ( |
            | 
            (smalltalk_emulator global: superclassName)
                          subclass: self_name
                              Type: object_type
             InstanceVariableNames: instVars_string
                ClassVariableNames: classVars_string
                  PoolDictionaries: ''
                          Category: class_category).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: removing\x7fComment: Remove me from my superclass\'s subclass list,
and from the system dictionary.  Remove all my
subclasses too.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         remove = ( |
            | 
            subclassesDo: [|:c| c remove].
            superclass subclass_Names remove: self_name.
            smalltalk_emulator smalltalk
              removeKey: self_name
               IfAbsent: []).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: adding and removing methods\x7fComment: Remove my method named s.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         removeSelector: s = ( |
             ss.
             ssm.
            | 
            ss: s asSelfString.
            ssm: smalltalk_emulator mapSelector: ss.
            instance_methods _Mirror removeSlot: ssm.
            method_sources removeKey: ss).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: accessing\x7fComment: My name in Smalltalk as a Self string.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         self_name = ( |
            | 
            smalltalk_s keyAtValue: self IfAbsent: 'an obsolete class').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fComment: I am a new class - connect me as a subclass of c,
type t, name className, in category cat.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         set_super: c Type: t Name: className Category: cat = ( |
             imm.
             mbm.
             mir.
             new_type <- 'same'.
            | 
            c subclass_Names add: className.

            mir: _Mirror.
            mir at: 'superclass' PutContents: c _Mirror.
            mir at: 'class_category'  PutContents: cat _Mirror.
            mir at: 'class_category:' PutContents: self_lobby mirrors assignment.

            imm: instance_methods _Mirror.
            imm at: 'inherited_behavior' PutContents: c instance_methods _Mirror.
            imm comment: 'Instance methods of ', className.

            mbm: my_behavior _Mirror.
            mbm comment: 'Class methods of ', className.

            (c object_type != t) && [t != 'plain'] ifTrue: [
              c object_type = 'plain'
                ifTrue: [mbm at: 'object_type' PutContents: t _Mirror.  new_type: t]
                 False: [selfLobby error: 'Cannot make ', t, ' subclass of ', c object_type, ' class'].
            ].
            class set_super: c class Instance: self Type: new_type Name: className).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: subclass creation\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         subclass: name InstanceVariableNames: i ClassVariableNames: c PoolDictionaries: p Category: cat = ( |
            | 
                         subclass: name
                             Type: 'plain'
            InstanceVariableNames: i
               ClassVariableNames: c
                 PoolDictionaries: p
                         Category: cat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: subclass creation\x7fCategory: private\x7fComment: Make a new subclass of me, and install it as `name\'.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         subclass: name Type: object_type InstanceVariableNames: i ClassVariableNames: c PoolDictionaries: p Category: cat = ( |
             dm.
             exists.
             mangledName.
             newClass.
             nm.
            | 
            nm: name asSelfString.
            mangledName:  smalltalk_emulator smalltalk map_name: nm.
            "Must use mirrors for bootstrapping"
            dm:  (smalltalk_emulator smalltalk global_dict) _Mirror.
            exists:  dm includesKey: mangledName.
            smalltalk_emulator reportLine: 
              (exists ifTrue: ['Redefining class ', nm]
                       False: ['Creating class ', nm]).

            newClass:
                       subclassName: nm
                     OldClassExists: exists
                               Type: object_type asSelfString
              InstanceVariableNames: i asSelfString
                 ClassVariableNames: c asSelfString
                   PoolDictionaries: p asSelfString
                           Category: cat asSelfString.

            exists ifTrue: [
              (smalltalk_emulator global: nm) redefineClass: nm From: newClass
            ] False: [
              "Easy case: new class"
              "Must use mirrors for bootstrapping, not at:Put:"
              dm at: mangledName  PutContents: newClass _Mirror.
              (dm at: mangledName) module: 'generated_by_smalltalk'.
            ].
            newClass).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: subclass creation\x7fCategory: private\x7fComment: Make a new subclass of me to be known as `className\'
but do not install it in the system dictionary.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         subclassName: className OldClassExists: oldExists Type: object_type InstanceVariableNames: i ClassVariableNames: c PoolDictionaries: p Category: cat = ( |
             classVarMir.
             newClass.
             nilMir.
             pm.
            | 
            p isEmpty ifFalse: [error: 'Can\'t do pool dictionaries!'].
            newClass: class new.
            newClass set_super: self Type: object_type Name: className Category: cat.
            pm: newClass prototype_instance _Mirror.
            nilMir: nil _Mirror.
            i asTokensSeparatedByWhiteSpace do: [| :n. mn. |
              mn: smalltalk_emulator mapInstVarName: n.
              pm at: mn      PutContents: nilMir.
              pm at: mn, ':' PutContents: self_lobby mirrors assignment.
              (pm at: mn) category: className.
            ].
            classVarMir: newClass class_vars _Mirror.
            classVarMir comment: 'Class variables of ', className.
            c asTokensSeparatedByWhiteSpace do: [| :n. selfName. |
              selfName: (smalltalk_s map_name: n).
              classVarMir at: selfName      PutContents: nilMir.
              classVarMir at: selfName, ':' PutContents: self_lobby mirrors assignment.
            ].
            oldExists ifTrue: [| oldClass | "must copy old methods and sources"
              oldClass:  (smalltalk_emulator global: className).
              newClass instance_methods _Mirror
                addSlotsIfAbsent: oldClass instance_methods _Mirror.
              newClass class instance_methods _Mirror
                addSlotsIfAbsent: oldClass class instance_methods _Mirror.
              newClass method_sources addAll: oldClass method_sources.  
              newClass class method_sources addAll: oldClass class method_sources.  
            ].
            newClass).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: accessing\x7fComment: Evaluate block for each of my immediate subclasses
(together with the name of the subclass).\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         subclassesDo: block = ( |
            | 
            subclass_Names do: [|:n|
              block value: (smalltalk_emulator global: n) With: n]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fComment: Map instance var name n back to Smalltalk.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         unmapInstVarName: n = ( |
            | 
            n copyFrom: n firstKey UpTo: n lastKey pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: subclass creation\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         variableByteSubclass: name InstanceVariableNames: i ClassVariableNames: c PoolDictionaries: p Category: cat = ( |
            | 
                         subclass: name
                             Type: 'byteArray'
            InstanceVariableNames: i
               ClassVariableNames: c
                 PoolDictionaries: p
                         Category: cat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> () From: ( | {
         'Category: subclass creation\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         variableSubclass: name InstanceVariableNames: i ClassVariableNames: c PoolDictionaries: p Category: cat = ( |
            | 
                         subclass: name
                             Type: 'array'
            InstanceVariableNames: i
               ClassVariableNames: c
                 PoolDictionaries: p
                         Category: cat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         method_sources = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         my_behavior* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> () From: ( |
             {} = 'Comment: Behavior class methods\x7fModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict behavior_s my_behavior.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'class' -> () From: ( |
             {} = 'Comment: Behavior class\x7fModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict behavior_s my_behavior class.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'class' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         instance_methods = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'class' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         method_sources = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         instance_methods = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> () From: ( |
             {} = 'Comment: Metaclass instance methods\x7fModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict metaclass_s instance_methods.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'class' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         my_behavior* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'my_behavior' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'my_behavior' -> 'class' -> () From: ( |
             {} = 'Comment: Object class\x7fModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict object_s my_behavior class.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'class' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         superclass = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'my_behavior' -> 'class' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class_vars* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> 'class_vars' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         my_behavior* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'my_behavior' -> () From: ( |
             {} = 'Comment: Object class methods\x7fModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict object_s my_behavior.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         inherited_behavior* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'my_behavior' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> () From: ( | {
         'Comment: Prototypical behavior\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         prototype_instance = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict behavior_s my_behavior prototype_instance.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (\'a category\')'
        
         class_category <- 'a category'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         instance_methods = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict behavior_s my_behavior prototype_instance instance_methods.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class_vars* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> 'class_vars' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict behavior_s my_behavior prototype_instance instance_methods class_vars.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         inherited_behavior* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> 'inherited_behavior' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict behavior_s my_behavior prototype_instance instance_methods inherited_behavior.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         method_sources = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         method_sources = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'prototype_instance' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         instance_methods = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict metaclass_s my_behavior prototype_instance instance_methods.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         my_behavior* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         subclass_Names = set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (())'
        
         superclass = ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (set copyRemoveAll add: \'Metaclass\')'
        
         subclass_Names = set copyRemoveAll add: 'Metaclass'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         object_s = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> () From: ( |
             {} = 'Comment: I am the root of the Smalltalk class system. 
All classes in the system are subclasses of me.\x7fModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict object_s.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         superclass = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         metaclass_s = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> () From: ( |
             {} = 'Comment: Metaclass\x7fModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict metaclass_s.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (\'Kernel-Objects\')'
        
         class_category <- 'Kernel-Objects'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> () From: ( | {
         'Category: accessing\x7fComment: The name of my instance as a Self string\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         base_name = ( |
            | smalltalk_s keysAndValuesDo: [|:name. :class|
              (class class _Eq: self) ifTrue: [^name].
            ].
            'an obsolete class').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class_vars* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> 'class_vars' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict metaclass_s instance_methods class_vars.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fComment: Copy a metaclass object and its component objects\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         copy_object = ( |
             c.
             cm.
             im.
            | 
            im: instance_methods _Clone _Mirror.
            c: _Clone.
            cm: c _Mirror.
            im at: 'class' PutContents: cm.
            im at: 'class_vars' PutContents: () _Clone _Mirror.
            cm at: 'method_sources' PutContents: self_lobby dictionary copyRemoveAll _Mirror.
            cm at: 'instance_methods' PutContents: im.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         inherited_behavior* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         instanceVariableNames: s = ( |
            | 
            s asSelfString isAllWhiteSpace  ifFalse: [
              error: 'Can\'t do class instance variables!'
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         isMeta = ( |
            | true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fComment: This is a plain word array (Self vector), used
as the basis for objects with indexed instance variable.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (((reflect: vector copy) removeAllSlots
addSlots: (reflect: (| methodPointerIfFail: b = (b value) |) ))  reflectee)'
        
         prototype_array = ((reflect: vector copy) removeAllSlots
addSlots: (reflect: (| methodPointerIfFail: b = (b value) |) ))  reflectee.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fComment: This is a plain byte array (Self byte vector), used
as the basis for objects with byte-valued indexed instance variable.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: ((reflect: byteVector copy) removeAllSlots reflectee)'
        
         prototype_byteArray = (reflect: byteVector copy) removeAllSlots reflectee.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> () From: ( | {
         'Comment: Prototypical behavior\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         prototype_instance = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> () From: ( | {
         'Category: accessing\x7fComment: My name in Smalltalk as a Self string.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         self_name = ( |
            | 
            smalltalk_s keysAndValuesDo: [|:name. :class|
              (class class _Eq: self) ifTrue: [^name, ' class'].
            ].
            'an obsolete metaclass').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         set_super: c Instance: myClass Type: t Name: className = ( |
             cm.
             im.
             parentProtoMir.
             protoMir.
            | 
            cm: c _Mirror.
            _Mirror at: 'superclass' PutContents: cm.
            im: instance_methods _Mirror.
            parentProtoMir:  c instance_methods prototype_instance _Mirror.
            t = 'same' ifTrue: [
              protoMir:  parentProtoMir reflectee copy_object _Mirror.
            ] False: [
              "make a variable subclass of a non-variable class -- introduce indexed vars"
              protoMir:  (t = 'array' ifTrue: [prototype_array] False: [prototype_byteArray]) _Clone _Mirror.
              parentProtoMir:  c instance_methods prototype_instance _Mirror.
              protoMir addSlots: parentProtoMir.
            ].
            protoMir at: 'my_behavior' PutContents: myClass instance_methods _Mirror.
            protoMir comment: className prependAOrAn.
            im at: 'prototype_instance'  PutContents:  protoMir.
            im at: 'inherited_behavior'  PutContents: c instance_methods _Mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         method_sources = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         my_behavior* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> () From: ( |
             {} = 'Comment: Metaclass class methods\x7fModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict metaclass_s my_behavior.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'class' -> () From: ( |
             {} = 'Comment: Metaclass class\x7fModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict metaclass_s my_behavior class.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'class' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         instance_methods = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'class' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         method_sources = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'class' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         my_behavior* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'class' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         superclass = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'class' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class_vars* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> 'class_vars' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         inherited_behavior* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> () From: ( | {
         'Comment: Prototypical metaclass\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         prototype_instance = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'prototype_instance' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict metaclass_s my_behavior prototype_instance.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'prototype_instance' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class_vars* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> 'class_vars' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         inherited_behavior* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         prototype_instance = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> 'prototype_instance' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict metaclass_s my_behavior prototype_instance instance_methods prototype_instance.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'prototype_instance' -> 'instance_methods' -> 'prototype_instance' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         my_behavior* = bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'prototype_instance' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         my_behavior* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'prototype_instance' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         superclass = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'my_behavior' -> 'prototype_instance' -> 'superclass' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict metaclass_s my_behavior prototype_instance superclass.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         subclass_Names = set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         superclass = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (\'Kernel-Objects\')'
        
         class_category <- 'Kernel-Objects'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> () From: ( | {
         'Category: primitives\x7fComment: Switch my identity with that of anObject.
Use with extreme caution!\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         become: anObject = ( |
             om.
             selfm.
             tm.
            | 
            selfm: _Mirror.
            om: anObject _Mirror.
            tm: anObject _Clone _Mirror.
            "Using frozenDefine does not invalidate the module cache;
             otherwise define: would do just as well."
            om frozenDefine: selfm.
            selfm frozenDefine: tm.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class_vars* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> 'class_vars' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict object_s instance_methods class_vars.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         copy_object = ( |
            | _Clone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> () From: ( | {
         'Category: emulator infrastructure\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         copy_object: size = ( |
            | 
            class object_type = 'array'     ifTrue: [^ _Clone:      size Filler: nil ].
            class object_type = 'byteArray' ifTrue: [^ _CloneBytes: size Filler: 0   ].
            0 error: 'Cannot create instances of this class with indexed variables').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         inherited_behavior* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         pseudo_vars* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> 'pseudo_vars' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict object_s instance_methods pseudo_vars.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> 'pseudo_vars' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         false = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> 'pseudo_vars' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (())'
        
         nil = ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> 'pseudo_vars' -> () From: ( | {
         'Comment: Used by the emulator; inaccessible to Smalltalk code\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         self_lobby = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> 'pseudo_vars' -> () From: ( | {
         'Comment: Used by the emulator; inaccessible to Smalltalk code\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         smalltalk_emulator = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> 'pseudo_vars' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         true = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         method_sources = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'my_behavior' -> 'class' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         instance_methods = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'my_behavior' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'my_behavior' -> 'class' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         method_sources = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'my_behavior' -> 'class' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         my_behavior* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'metaclass_s' -> 'instance_methods' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'my_behavior' -> 'class' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         superclass = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'my_behavior' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         class_vars* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> 'class_vars' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'my_behavior' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         inherited_behavior* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'behavior_s' -> 'instance_methods' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'my_behavior' -> () From: ( | {
         'Comment: Prototypical object\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         prototype_instance = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'my_behavior' -> 'prototype_instance' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator smalltalk global_dict object_s my_behavior prototype_instance.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'my_behavior' -> 'prototype_instance' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         my_behavior* = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> 'instance_methods' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (set copyRemoveAll add: \'Behavior\')'
        
         subclass_Names = set copyRemoveAll add: 'Behavior'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> 'object_s' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         superclass = ( |
            | 
            smalltalk_emulator smalltalkNil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'global_dict' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         smalltalk_s = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> () From: ( | {
         'Comment: A mirror on global_dict.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (smalltalkEmulator smalltalk global_dict _Mirror)\x7fVisibility: private'
        
         holder_mirror = smalltalkEmulator smalltalk global_dict _Mirror.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> () From: ( | {
         'Category: infrastructure\x7fComment: Map a Smalltalk name n into the Self name used.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         map_name: n = ( |
            | 
            n asSelfString uncapitalize, '_s').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> () From: ( | {
         'Category: infrastructure\x7fComment: Objects created to represent non-lifo blocks
inherit these traits.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: private'
        
         nonLifoBlockTraits = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator smalltalk nonLifoBlockTraits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: control\x7fComment: report an error if I evaluate to false\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         assert = ( |
            | 
            value ifFalse: [ | vmm |
                vmm: (reflect: self) valueSlot contents.
                error: 
                'assertion failed: ', 
                vmm file, ': ', vmm line printString, ' ',
                '[ ', vmm source, ' ] ' .
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: control\x7fComment: if the block\'s argument is evaluated, exit the block, returning nil\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         exit = ( |
            | value: [ ^ nil ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: control\x7fComment: same as exit, except return a value\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         exitValue = ( |
            | value: [ | :x | ^ x ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: private'
        
         idParent* = bootstrap stub -> 'mixins' -> 'identity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: control\x7fComment: repeat the receiver (a block) forever\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         loop = ( |
            | value. _Restart).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: control\x7fComment: repeat the block until value is sent to
	 its argument; then exit and return nil\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         loopExit = ( |
            | [ value: [ ^ nil ] ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: control\x7fComment: same as loopExit, 
	 plus a second arg block that causes the loop body to restart\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         loopExitContinue = ( |
            | 
            [ [ | :exit | 
                value: [ ^ nil ] With: [ exit value ]
              ] exit
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: control\x7fComment: same as loopExit, except return a value\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         loopExitValue = ( |
            | [ value: [ | :x | ^ x ] ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: control\x7fComment: same as loopExitContinue, except return a value\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         loopExitValueContinue = ( |
            | 
            [ [ | :exit | 
                value: [ | :x | ^ x ] With: [ exit value ]
              ] exit
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'mixins' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: control\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         untilFalse: b = ( |
            | untilTrue: [ b value not ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: control\x7fComment: repeat the receiver and b until b evaluates to true (false)\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         untilTrue: b = ( | {
                 'ModuleInfo: Module: block InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            [ value.  b value ifTrue: [ ^ nil ]. ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: errorHandling\x7fComment: catches the case that a block was given too few args\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         value = ( |
            | error: 'block expects more arguments').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         value: a Value: b = ( |
            | value: a With: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         value: a Value: b Value: c = ( |
            | 
            value: a With: b With: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         value: a Value: b Value: c Value: d = ( |
            | 
            value: a With: b With: c With: d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: private'
        
         valueSelectors = [ | x = vector copySize: 10 | 
             x at: 0  Put: ().
             x at: 1  Put: ().
             x at: 2  Put: ().
             x at: 3  Put: ().
             x at: 4  Put: ().
             x at: 5  Put: ().
             x at: 6  Put: ().
             x at: 7  Put: ().
             x at: 8  Put: ().
             x at: 9  Put: ().
             x] value.
        } | ) 

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> 'valueSelectors' -> () _At: 0 Put: (
     'value')

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> 'valueSelectors' -> () _At: 1 Put: (
     'value:')

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> 'valueSelectors' -> () _At: 2 Put: (
     'value:With:')

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> 'valueSelectors' -> () _At: 3 Put: (
     'value:With:With:')

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> 'valueSelectors' -> () _At: 4 Put: (
     'value:With:With:With:')

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> 'valueSelectors' -> () _At: 5 Put: (
     'value:With:With:With:With:')

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> 'valueSelectors' -> () _At: 6 Put: (
     'value:With:With:With:With:With:')

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> 'valueSelectors' -> () _At: 7 Put: (
     'value:With:With:With:With:With:With:')

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> 'valueSelectors' -> () _At: 8 Put: (
     'value:With:With:With:With:With:With:With:')

 bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> 'valueSelectors' -> () _At: 9 Put: (
     'value:With:With:With:With:With:With:With:With:')

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: Smalltalk support\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         valueWithArguments: a = ( |
             i.
             n.
             v.
            | 
            n: a size.
            v: vector copySize: n.
            i: 0.
            a do: [|:e| v at: i Put: e.  i: i succ].
            (valueSelectors at: n IfAbsent: [error: 'too many arguments'])
              sendTo: self WithArguments: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: control\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         whileFalse = ( |
            | whileFalse: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: control\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         whileFalse: b = ( |
            | 
            [ value ifTrue: [ ^ nil ].  b value. ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: control\x7fComment: repeat the receiver until it evaluates to true (false)\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         whileTrue = ( |
            | whileTrue: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> 'nonLifoBlockTraits' -> () From: ( | {
         'Category: control\x7fComment: repeat the receiver and b until receiver evaluates to true (false)\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         whileTrue: b = ( |
            | [ value ifFalse: [ ^ nil ].  b value. ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'smalltalk' -> () From: ( | {
         'Category: infrastructure\x7fComment: Unmap a global name back to the Smalltalk equivalent,
but return a Self string.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         unmap_name: n = ( |
            | 
            (n copyFrom: n firstKey UpTo: n lastKey pred) capitalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: reading\x7fComment: Directories to seach for Smalltalk sources.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceFilePath = ( |
            | 
            '.', 
            os_file pathSeparator, 
            './smalltalkSrc',
            os_file pathSeparator,
            'applications/smalltalk/smalltalkSrc').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: evaluation\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: private'
        
         symbolTable = bootstrap define: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'symbolTable' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals dictionary copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'symbolTable' -> () From: ( |
             {} = 'Comment: A symbolTable is like a chain of dictionaries.
The behavior is like a single dictionary, except
at: searches up the chain if necessary.\x7fModuleInfo: Creator: globals smalltalkEmulator symbolTable.

CopyDowns:
globals dictionary. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'symbolTable' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'symbolTable' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator symbolTable parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'symbolTable' -> 'parent' -> () From: ( | {
         'Comment: Search up the chain of dictionaries if necessary\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k IfAbsent: b = ( |
            | 
            resend.at: k IfAbsent: [ 
             nil = parentDict ifTrue: [b value]
               False: [parentDict at: k IfAbsent: b ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'symbolTable' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'symbolTable'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'symbolTable' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         includes: v = ( |
            | 
            findFirst: [|:e| v = e] IfPresent: true IfAbsent: [
              nil = parentDict ifTrue: false False: [
                parentDict includes: v]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'symbolTable' -> 'parent' -> () From: ( | {
         'Comment: Take off the current scope and return the result.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         leaveScope = ( |
            | parentDict).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'symbolTable' -> 'parent' -> () From: ( | {
         'Comment: Add a new scope level to the chain.\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         newScope = ( |
            | prototype copy parentDict: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'symbolTable' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'hashTableDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'symbolTable' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         parentDict.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'symbolTable' -> () From: ( | {
         'ModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | 
            smalltalkEmulator symbolTable).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: evaluation\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: private'
        
         symbolTableForInstVars: ivs = ( |
             d.
            | 
            d: symbolTable copyRemoveAll.
            ivs do: [| :iv |
              d at: iv Put: 'iv'
            ].
            d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: smalltalkEmulator InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         transcriptText <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: evaluation\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: private'
        
         translateMethod: meth InstVars: ivs ClassName: className = ( |
             t.
            | 
            parser parseString: meth.
            t: parser output.
            t isEndMarker ifTrue: [^''].
            t simplify.
            t   genSelf: (symbolTableForInstVars: ivs)
              ClassName: className.
            t selfSrc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: objects\x7fComment: Map the Self selector s back to Smalltalk\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot\x7fVisibility: public'
        
         unmapSelector: s = ( |
             sel.
            | 
            sel: s asSelector.
            sel isKeyword ifFalse: s True: [
              sel keywords
                reduceWith: [| :p. :k | p, k uncapitalize]
               IfSingleton: [|:k| k]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fCategory: Smalltalk\x7fComment: Just a shorthand to make translated methods shorter\x7fModuleInfo: Module: smalltalkEmulator InitialContents: FollowSlot'
        
         smalltalkNil = ( |
            | smalltalkEmulator smalltalk nil).
        } | ) 



 '-- Side effects'

 globals modules smalltalkEmulator postFileIn
