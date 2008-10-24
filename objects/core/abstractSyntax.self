 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractSyntax = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( |
             {} = 'Comment: This object and the corresponding \'traits abstractSyntax\' defines objects for
handling abstract syntax of Self programs. The  following categories exist
*  Syntactic categories
   Defines objects corresponding to the syntactic catagories of Self.
   There is an object corrsponding to each syntactic category of the 
   Self grammar (concrete AST-nodes). In addition there are special objects: 
   - node
   - emptyNode
   - unexpanded
   - instance
   See comments for these.
*  Abstract syntax from byte code
   Contains methods for for constructing abstract syntax trees (ASTs)
   from byte code.
*  Pretty printing/structure editing
   Contains objects and methods for pretty printing, including
   objects/methods for structure editing using a morph based
   structure editor.
*  Misc
   Contains various auxillary stuff
*  Old stuff
   This should probably just be thrown away\x7fModuleInfo: Creator: globals abstractSyntax.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Tests\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractSyntaxTest = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax abstractSyntaxTest.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         !@# x = ( |
            | 
            go: x Go: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'Category: Test suite\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         byteCodeEx = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax abstractSyntaxTest byteCodeEx.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> () From: ( | {
         'Comment: Here is a comment about foo:Bar:\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         foo: a Bar: b = ( |
             hest.
             parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
             x = 17.
             y <- 18.
             z.
            | 
            (x * y) + (x & z).
            (a + b) fool.
            a * b
              dum1: (megetDum: hansen)
              Dum2: (a + b) fool
              Dum3: smart: nielsen.
            x: y + 19.
            z at: 12.
            z with: x Do: y.
            "self" with: [| :a. b. c. d = 7 | x + y. x: 13].
            resend.msg1: 12.
            resend.msgx: [a + b] With: b + c.
            parentx.msg2:13.
            olsen < fisk hest
              ifTrue:
                ["self"
                   with: [| :a. b. c. d = 7 | x + y. x: 13].
                 resend.msg1: 12.
                 resend.msgx: [a + b] With: b + c.
                 msg2: 13.
                ]
              False:
                [x * y.
                 x: y + 19.
                 z at: 12.
                 z with: x Do: y.
                 "self"
                   with: [| :a. b. c. d = 7 | x + y. x: 13].
                ].
            resend.msgx:
                     [olsen] < fisk hest
                       ifTrue:
                         ["self"
                            with:
                              [| :a. b. c. d = 7 | x + y. x: 13
                              ].
                          resend.msg1: 12
                         ]
                       False: [x * y. x: y + 19. z at: 1111].
            ^z * z).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> () From: ( | {
         'Comment: An here is a comment about fool\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         fool = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> 'fool' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax abstractSyntaxTest byteCodeEx fool.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> 'fool' -> () From: ( | {
         'Category: binary operations\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         &*%$ abcd = ( |
            | abc + abc. [acb * abc].
            abc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> 'fool' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIs = ( |
            | 
            "Hest"
            a < b ifTrue: ["1. hest"
               a: a + b. "2. hest"
               a: a %% a .
             ] False: [ b: a * a ].
            "3. hest").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> 'fool' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         bar = 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> 'fool' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (113)'
        
         mAx = 113.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> 'fool' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (113)'
        
         maX <- 113.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> 'fool' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (113)'
        
         max <- 113.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> 'fool' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         minn = 133.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> 'fool' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         msz: xy = ( |
            | ^3 + 347 + 814).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> 'fool' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: ((| flaeskesteg |))'
        
         mySub = (| flaeskesteg |).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> 'fool' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         olsen = ( |
            | fisk.
             hest.
            snorf+kvarf).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> 'fool' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> 'fool' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         testParseAndFilter = ( |
            | 
            ('bar < max ifTrue: [ olsen. mySub flaeskesteg] 
              False: [minn . parent go]'
             parseObjectBody2ASTIfFail: ['fail'])
               filterMessagesToSelf: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> () From: ( | {
         'Comment: Here is a small comment\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         small = ( |
             a.
             b <- 123.
            | y: x .
              x < y ifTrue: [x: y] False: [y: x] .
            y: xxyy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'byteCodeEx' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         tiny = ( |
             a.
            | 
            (olsen + 123).
            (aaa ++ bbb).
            a: (aa * bb).
            (a * b ) + (x && y).
            a: "ko" ( "hest" a + b "faar" ) "ged" .
            a: z - "go" ( "bar" a+b "foo" ) "again").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         byteCodeToSource = ( |
             m.
             v.
            | m: getMirror. m printLine.  
            m source printLine. v: m source _ParseObjectIntoPositionTable.
            v do: [|:i . :e | (i printString , ':' , e printString) printLine ].
            (methodNode: getMirror Activation: true) prettyPrint printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'Category: Test suite\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doTestAST = ( |
             aMsg.
             father.
             s1.
             s2.
             t1.
             t2.
            | 
            t1: makeTestAST  .
            t1 noOfNodes printString printLine .
            s1: t1 prettyPrint  .
            t2: t1 copyDeep  .
            t2 noOfNodes printString printLine .
            s2: t2 prettyPrint  .
            t2
             doInterior: [| :n | father: n]
             Sons:
               [| :s |
                  s father = father
                    ifFalse:
                      ['copyDeep error: ' printLine.
                       father prettyPrint printLine.
                       s prettyPrint printLine
                      ]
                ]  .
            t2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         getMirror = ( |
            | ((reflect: abstractSyntax abstractSyntaxTest ) at:  'simple'  ) value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         go: a Go: b = ( |
            | 
            a+b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         helloWorld = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'helloWorld' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax abstractSyntaxTest helloWorld.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> 'helloWorld' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         main = ( |
            | 
            'Hello World' printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         makeProcess = ( |
            | 
            [| x. y. z |  
               10 do: 
                 [| :i |  
                  i=4 
                    ifTrue: [ 
                       [| :a. :b |  
                          a = 4 ifTrue: [ 'Hello' printLine. halt]
                       ]  value: i With: 117 
                    ] False: [ i printString printLine] 
                 ] 
            ] value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'Category: Test suite\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         makeTestAST = ( |
            | 
            "OBS! This method is part of the Self test-suite" 
            (((reflect: abstractSyntax abstractSyntaxTest ) at:  'byteCodeEx') value) makeAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractSyntax' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         simple = ( |
             a.
             b.
            | 
            "Here is the first line"
            fool you. 
            a:123. "slut" 
            "And here is one taking two or more lines
             Lest see how it prints."
            a: 112. 
            b:"God jul"
            olsen ifTrue:[
                >10 ifTrue:[stop].
            ] .
            olsen fik fisk til aftensmad.
            "And here is one taking two or more lines
             Lest see how it prints."
            a: 112. 
            "hello"
            x foo flaeskeSteg. "pp"
            a with:  "hest" hest And: fisk"fisk".
            "God jul"
            olsen ifTrue:[
                >10 ifTrue:[stop].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         simpleCopy = ( |
             a.
             b.
            | 
            "Here is the first line"
            fool you. 
             a:  12. b:a*a.
            a < b ifTrue:[b: a. a:["lll" olsen].
                  a: a*(b+ c+(12- a))].
            "And here is one taking more lines
             Lets see how it prints."
            a:12.
            "hello"
            x foo flaeskeSteg. "pp"
            a with:  "hest" hest And: fisk"fisk".
            "God jul"
            olsen ifTrue:[
                >10 ifTrue:[stop].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         test = ( |
            | 
            'hello world' printLine.
            a < b ifTrue: [ go go ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         test2 = ( |
            | 
            foo.
            go).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         test3 = ( |
            | 
            fisk hest.
            a < b ifTrue: [
               foo baa gogo.
               foo: a + (bool * hest)
             ].
            b = a 
              ifTrue: [
               to eat or not to eat
             ] False: [
               thats the question
             ].
            thirsty
               ifTrue: [ drink ]
               False: [ eat chocolade ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         test4 = ( |
            | 
            fool m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         tiny = ( |
            | fisk hest).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'abstractSyntaxTest' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         ttiny = ( |
            | flaeskesteg).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         add: slot WithCategory: cat ToCategory: catList OrSlot: slotList = ( |
             catNode.
            | 
            cat = '' 
               ifTrue: [ slotList add: slot ]
               False: [
                 catList do: [| :c |
                   c categoryName = cat ifTrue: [
                     c slots add: slot.
                     ^self
                  ]].
                  " no 'cat' category found "
                  catNode: abstractSyntax slotCategory copy.
                  catNode contracted: true.
                  catNode categoryName: cat.
                  catNode slots: list copy add: slot . 
                  catList add: catNode.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fComment: Represents an empty AST\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         emptyNode = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyNode' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax emptyNode.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
abstractSyntax emptyNode)\x7fVisibility: public'
        
         father <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         emptyNode = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'emptyNode' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax emptyNode.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'emptyNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Streams\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         emptyPPStream = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyPPStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax emptyPPStream.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Streams\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         pPStream = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pPStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax pPStream.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyPPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pPStream' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fComment: This is an abstract object defining common 
data-slots for all concrete AST-nodes.
All concrete AST-nodes copy down from \'node\'.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         node = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax node.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: General\x7fComment: The byte code position of this node\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         byteCodePos <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: General\x7fComment: A possible comment associated with this node\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         comment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: General\x7fComment: If false then this node is NOT pretty-printed.
Its contractionString is showed instead\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         contracted <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: General\x7fComment: The father in the ASt of this node\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
abstractSyntax emptyNode)\x7fVisibility: public'
        
         father <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         node = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax node.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: General\x7fComment: The position of this node in the pPStream
where the AST is pretty-printed\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (abstractSyntax emptyPPStream)\x7fVisibility: private'
        
         position <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyPPStream' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: General\x7fComment: The width in characters needed to print this
node and its sub-nodes. This is a value
cashed in the node by method ppWidth, which
pre-computes the width for all nodes before
pretty-printing\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         thePPWidth <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: General\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         thisObjectPrints = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         col <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         endCol <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         endRow <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         heigth <- 60.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         indent <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
abstractSyntax node)'
        
         innerBlockActivation <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (0)'
        
         innerBlockActivationEnd <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (0)'
        
         innerBlockActivationStart <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         pPStream = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax pPStream.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'Comment: Seems not to be used.
Eliminate!\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
abstractSyntax node)\x7fVisibility: private'
        
         root <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         row <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (collector copy element: \'\')\x7fVisibility: private'
        
         theTexts <- collector copy element: ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         width <- 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'emptyNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos = ( |
            | 
            pos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'emptyNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         asIsPP: pos WithSep: yes = ( |
            | pos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'emptyNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         check: ok NotFound: notFound Ambiguous: amb = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'emptyNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         contracted <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'emptyNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'emptyNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
            | pos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'emptyNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
abstractSyntax emptyNode)\x7fVisibility: public'
        
         father <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'emptyNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesToSelf = ( |
            | list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'emptyNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'emptyNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
            | 
            0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'emptyNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
            | '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fComment: Pretty-prints this AST using the as-is pretty printer.
Returns an outStream:  pPStream.
The pretty-printed text may be obtained by
   outStream text\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         asIsPP = ( |
             inStream.
             outStream.
            | 
            abstractSyntax seStack: list copyRemoveAll.
            inStream: abstractSyntax pPStream copy width: 1000.
            outStream: asIsPP: inStream.
            outStream).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: AST operations\x7fComment: The syntactic category of the node as a string\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         category = '???'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Checking\x7fComment: (This message should be moved to category Checking)
Performs local checking of messages.
If receiver is a messageNode, the message node is checked.
If the receiver is a regularObject, block of body, all expressions
in that object are checked.
See comment for this message at messageNode.
See also checkWithLeafChildren:... in category \'Checking\'.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         check: ok NotFound: notFound Ambiguous: amb = ( |
            | 
            nil.
            "father check: ok NotFound: notFound Ambiguous: amb.").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Parsing\x7fComment: Redefined in regularObject\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         checkIfCodeIsParsed = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Checking\x7fComment: Performs:
1. Local checking of this node using check:NotFound:Ambiguous:
2. For all messages to self which are not found, it is checked
   whether or not they are defined for all leaf-children of this object.
If the checking is wanted for a complete message, the message should be sent
to the regularObject, or body of the method.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         checkWithLeafChildren: found InLeaf: inLeaf NotFound: notFound Ambiguous: amb = ( |
             errors.
             sm.
            | 
            errors: '' & ''. "a string collector "
            sm: list copyRemoveAll.
            "self" check: [| :msg| 
                 ('Found locally: ' , msg selector) printLine.
                 found value: msg.
               ] NotFound: [| :msg | 
                 msg receiver = abstractSyntax emptyNode ifTrue: [ sm add: msg ]
               ] Ambiguous: [| :msg | ('Ambiguous locally: ' , msg selector) printLine.
               ].
            sm size = 0 ifTrue: [ 'All messages to self found locally ' printLine.
               ] False: [| eo . em . lc |
                 em: enclosingObject.
                 eo: em.
                 [(eo father isMethodSlot) || [eo isBlock]] whileTrue: [ eo: eo father enclosingObject].
                 lc: eo leafChildren.
                 sm do: [| :msg . t. isOk. found . amb. col | ' ' printLine.
                     isOk: true. "becomes false if there is a mirror where msg is not found"
                     lc do: [| :mir . p | found: true. amb: false.
                        p: mir lookupKey: msg selector .
                        case if: [ p size = 0 ] Then: [t: ' not found ' . found: false. isOk: false.]
                             If: [ p size = 1 ] Then: [t: ' found '. amb: true.]
                             Else: [t: ' conflicts '].
                       t: ('"' , msg selector , '"' , t , 'in ' , mir printString ).
                       found ifFalse: [ errors: errors & (t , '\n') ].
                       t printLine 
                     ].
                     isOk ifTrue: [ inLeaf value: msg] False: [ notFound value: msg].
               ]].
            errors).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: AST operations\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         children = ( |
            | 
            father = abstractSyntax emptyNode
               ifTrue: [ list copy ]
               False: [father children]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fComment: The string to print for a contracted node\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         contractionString = '...'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: AST operations\x7fComment: Copy this node and all its sub-nodes\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
            | 
            "self" copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fComment: Determindes wheter or not this node
is contrated pr. default.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultContraction = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Iterators\x7fComment: Iterate over the AST.
     b value: self.
     sonsDo: [|:son |  s value: son].
     sonsDo: [|:son | son doInterior: b Sons: s]\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: b Sons: s = ( |
            | 
            b value: self.
            sonsDo: [|:son | s value: son].
            sonsDo: [|:son | son doInterior: b Sons: s]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fComment: Implements an adaptive pretty-printer.
\'pos\' must be a pPStream or one of its childs.
See doPPWidth: for an initial call.
See also abstractSyntax examples\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
            | 
            pos , '?').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fComment: Pretty-prints this AST using the adaptive pretty printer;
width is the maximum line width.
Returns an outStream:  pPStream.
The pretty-printed text may be obtained by
   outStream text\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPPWidth: width = ( |
             inStream.
             outStream.
            | 
            inStream: abstractSyntax pPStream copy width: width.
            outStream: doPP: inStream.
            outStream).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Iterators\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doSelection: blk Start: start End: end = ( |
            | 
            blk value: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: AST operations\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         enclosingListFather = ( |
            | 
            father = abstractSyntax emptyNode
               ifTrue: [ abstractSyntax emptyNode ]
               False: [ father enclosingListFather ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: AST operations\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         enclosingMethodObject = ( |
             i <- 0.
             m.
            | 
            m: enclosingObject.
            [ m father isMethodSlot ] whileFalse: [
               m = abstractSyntax emptyNode ifTrue: [ ^m ] .
               m: m father enclosingObject.
              ].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: AST operations\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         enclosingObject = ( |
            | 
            father != abstractSyntax emptyNode 
               ifTrue: [father enclosingObject]
               False: [abstractSyntax emptyNode]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Selection\x7fComment: Returns the smallest AST containing 
self (startAST) and endAST.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         extent: endAST = ( |
             endASTf.
             endASTx.
             extentAST.
             sel.
             startASTf.
            | 
            extentAST: self.
            ["endAST in: extentAST"
             endASTx: endAST.
             [ (endASTx = extentAST) || [endASTx = abstractSyntax emptyNode]] 
               whileFalse: [
                  endASTf: endASTx.
                  endASTx: endASTx father.
             ].
             endASTx = extentAST
            ] 
             whileFalse: [
               startASTf: extentAST.
               extentAST: extentAST father.
            ].
            "extentAST is the least common father of self an anAST.
             startASTf is a father of self and and immediate son
             of extentAST.
             endASTf is a father of anAST and an immediate son
             of extentAST"
            sel: abstractSyntax selection copy.
            sel theAST: extentAST.
            sel subStart: startASTf.
            sel subEnd: endASTf.
            ^sel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Checking\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         filterMessagesToSelf: context = ( |
             mirr.
             msgs.
             path.
             s.
            | 
            mirr:  reflect: context.
            path: mirr creatorPath.
            s: 'Creator path: '.
            path do: [|:x| s: s , x , '/'].
            s printLine.
            msgs: messagesToSelf.
            msgs do: [| :msg. p |
                 p: mirr lookupKey: msg .
                 p do: [|:x. m . s|
                   case
                     if: [ x isArgument ] Then: [ s: ': argument' ]
                     If: [ x isMethod] Then: [ s: ': method' ] 
                     If: [ x isAssignable ] Then: [s: ': assignable' ]
                     If: [ x isAssignment ] Then: [ s: ': isAssignment']
                     If: [ x isVectorElement] Then: [ s: ': vectorElement']
                     If: [ x isParent] Then: [ s: ': parent' ]
                     Else: [s: ': constant'].
                    x isCreator ifTrue: [s: s , ' - creator'].
                    ('fullName=' , x fullName , ' name=' , x name
                     , s) printLine.
               ]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Misc\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         getSelectedAST: p = ( |
             selectedAST.
            | 
            selectedAST: self.
            doInterior: []
                 Sons: [| :n | 
                  "'Inside: ' printLine.
                  n prettyPrint printLine.
                  n position posAsPair printLine.
                  p printLine."
                  (n position inside: p) ifTrue: [
                  "'returning : 'printLine. n prettyPrint printLine."
                  ^ n getSelectedAST: p]
               ] .
            selectedAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         getSep = ( |
            | comment forAST: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Classification\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         hasCode = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: AST operations\x7fComment: Returns true if self is a sub-AST of theAST\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         in: theAST = ( |
            | 
            "('InAst:' , (prettyPrint),
            ' >>> ' , (theAST prettyPrint)) printLine."
            "self" = theAST
              ifTrue: [true]
              False: [
                father = abstractSyntax emptyNode 
                    ifFalse: [ father in: theAST ]
                    True: [false]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Classification\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         inCode = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'emptyNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Classification\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isBinaryMessage = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Classification\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isBlock = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Classification\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isCode = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: AST operations\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isDeletable = ( |
            | 
            "only certain nodes can be deleted:
             - elements in lists (exps, slots)
             - receivers"
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Classification\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isKeywordMessage = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Classification\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isMessage = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Classification\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         isMethodObject = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Classification\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isMethodSlot = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Classification\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isNumberExp = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Classification\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isObject = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Classification\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isSlot = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Classification\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isUnexpanded = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Checking\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         leafChildren = ( |
            | 
            father = abstractSyntax emptyNode ifTrue: [ list copy ]
               False: [ father leafChildren]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Checking\x7fComment: Returns a list of all messages sent to self.
The same message may appear more than once.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesToSelf = ( |
            | list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Misc\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         messagesToXXSelf = ( |
            | 
            father = abstractSyntax emptyNode ifTrue: [ list copy]
               False: [ father messagesToSelf]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: AST operations\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         noOfNodes = ( |
             n.
            | 
            n: 0.
            doInterior: [ n: n + 1 ] 
            Sons: [].
            n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Parsing\x7fComment: This is the default parser for nodes.
Is redefined for regularObject and slotNode.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         parseString: str IfFail: blk = ( |
            | 
            str parseObjectBodyFileName: '<text window>'
                IfFail: [| :e | blk value: e].
            father
              replaceSon: self 
              With: (abstractSyntax textNode copy text: str)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fComment: Used by doPP: to compute the width
of the string representing this
node. The computed width is saved in
thePPWidthin the prototype.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
            | 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fComment: This operation should have been called uglyPrettyPrint
since it just returns a string for the node and its sub-nodes.
There is no indentation in this string.
It is mainly for debugging purposes.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
            | '<empty AST>').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Debugging\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         print: string Pos: pos PPWidth: w Break: break = ( |
             s.
            | 
            s: 'At: ' , string , 'Category=' , category .
            break ifTrue: [s: s , ' Break=true' ] False: [s: s ,' Break=false'].
            (s , ' thePPWidth:' , w printString ,
              ' Pos.Col=' , pos col printString ,
              ' Pos.Width=' , pos width printString)
            printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: AST operations\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceSon: oldSon With: newSon = ( |
            | 
            nil != newSon ifTrue: [newSon father: self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: AST operations\x7fComment: Return the root of this AST\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         root = ( |
            | 
            abstractSyntax emptyNode = father
               ifTrue: [ self ]
               False: [ father root]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Selection\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         selectSlot: aSelector = ( |
            | 
            isSlot ifTrue: [
              " ('In slot:' , slotName) printLine."
               slotName = aSelector ifTrue: [
                 "'Match:' printLine."
                 contracted: false.
                 ^self " the AST of this method"
             ]] .
            sonsDo: [| :s. continue | 
              continue: s selectSlot: aSelector.
              nil != continue ifTrue: [contracted: false. ^continue].
             ].
            ^nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fComment: A node may be contracted when pretty-printed.
If called with true, the state of all nodes is 
set to their default contraction; if called with
false the state is set to no-contraction.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         setContraction: state = ( |
            | 
            doInterior: [ | :n |  "('\n---' , n prettyPrint) printLine."
               state ifTrue: [ n contracted: n defaultContraction]
                     False: [ n contracted: false]
               ]
            Sons: [ ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: AST operations\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         setFather = ( |
            | 
            father = abstractSyntax emptyNode ifTrue: [
            | father | 
              "'self setFather' printLine."
              doInterior: [| :n | father: n]
              Sons: [| :son| son father: father]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Iterators\x7fComment: Iterate over the sons of this node.
Note: this operation has not yet been implemented
for all node-categories!\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         sonsDo: blk = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: AST operations\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         subListCategory = ( |
            | '???').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: AST operations\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         superCategory = ( |
            | category).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Updating\x7fComment: When a node has been text-edited, the new text is checked
using parseString:IfFail:.
Then the node is updated using update:Editor.
update:Editor is defined by regularObject which handles all
changes to a methodBody.
For slots update:Editor is currently empty, since parse:IfFail
handles update for slots (see slotNode).
This should probably be made more symmetric.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         update: evt Editor: editor = ( |
            | 
            father != abstractSyntax emptyNode 
               ifTrue: [ father update: evt Editor: editor]
               False: [self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         xxxhighLight = ( |
            | 
            position highLight: position col @ position row
                     End: position endCol @ position endRow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         ## pos = ( |
            | 
            endRow: pos row.
            endCol: pos col.
            pos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         + n = ( |
            | 
            copy col: col + n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         , t = ( |
             p.
            | 
            p:  +  t size.
            p theTexts:  theTexts & t.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         ,, t = ( |
            | , t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'Category: asIsstructure editor\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         add: t = ( |
            | , t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         addComment: t Indent: pos Break: break = ( |
             p.
            | 
            p: self.
            t size > 0 ifTrue: [|s |
              s: '"'.
              t do: [| :c . :i | 
                c ='\n' ifTrue: [ 
                  p: p break: 0 Next: 0 Indent: pos Break: true.
                  p: p , s . 
                  s: ' ' .
                ] False: [ s: s , c ]
              ].
              s size >0 ifTrue: [ p: p , (s , '"' ) ] 
            ].
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         break: size Next: next Indent: indent Break: break = ( |
             newPos <- 0.
             s <- ''.
            | 

            break || [ ( col + size + next )  >  width ]  ifTrue: [ 
                 s:  '\n',  ('' copySize: indent col FillingWith: ' ').
                 newPos:  newLine: indent col.
            ] False: [
                 s: '' copySize: size FillingWith: ' '.
                 newPos: + size.
            ].
            newPos theTexts: newPos theTexts & s.
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         highLight: start End: end = ( |
            | 
            uglyEditor text selectionStart: start End: end).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         highlightCurrentByteCodePos = ( |
            | 
            innerBlockActivation body code expressions do: [|:n|
               n byteCodePos = innerBlockActivation currentByteCodePos
                 ifTrue: [ 'Current pos:' printLine.
                   ((n position col @ n position row) #
                   (n position endCol @ n position endRow)) printLine.
                   highLight: n position col @ n position row
                   End: n position endCol @ n position endRow.
                   n prettyPrint printLine
            ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         highlightInnerBlockActivation = ( |
             p1.
             p2.
             text.
            | 
            innerBlockActivationStart col printString printLine.
            innerBlockActivationStart row printString printLine.
            text: uglyEditor text.
            p1: text textGrid: 
             innerBlockActivationStart col @
             innerBlockActivationStart row.
            p2: text textGrid: 
              (innerBlockActivationEnd col + 1) @
              innerBlockActivationEnd row.
            preferences highlightParseError &&
            [ p1 != p2 ] ifTrue: [
            text insertionPoint: p1.
            text selectionEnd: p2.
            text hasSelection: true.
            text scrollIntoView:
              innerBlockActivationStart col @
               innerBlockActivationStart row.
            text changed.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         inside: p = ( |
             x.
             y.
            | 
            "(p printString , ' in: ' , posAsPair printString ) printLine."
            x: p x.
            y: p y.
            "row: position origin y.
            endRow: position corner y."
            case 
               if: [row = y]  Then: [
                   row = endRow ifTrue: [ ^ (col<=x) && (x <= endCol)]
                                False: [^ x >= col]
                   ]
               If: [endRow = y ] Then: [^ x <= endCol ]
               If: [(row < y) && [ y <= endRow ] ] Then: [^ true]
               Else: [^false]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         markEnd: endPos = ( |
            | 
            endRow: endPos row.
            endCol: endPos col.
            endPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         markStart = ( |
            | copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         markStart: anAST = ( |
            | markStart).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         markStartNotVisible: anAST = ( |
            | 
            markStart: anAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         newLine: n = ( |
             p.
            | p: copy. p row: p row + 1. p col: n.
            ^p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         posAsPair = ( |
            | (col@row) # (endCol@endRow)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         positionOfInnerBlockActivation = ( |
            | 
             (innerBlockActivationStart col @
             innerBlockActivationStart row) #
            (innerBlockActivationEnd col @
             innerBlockActivationEnd row)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pPStream' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         text = ( |
            | theTexts flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Messages\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         binaryMessage = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'binaryMessage' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( |
             {} = 'Comment: Represents a binary message like: 
   e1 $ e2
\'receiver\' refers to the AST for e1
\'operator\' is the operator (a string)
\'expression\' referes to the AST for e2.
\x7fModuleInfo: Creator: globals abstractSyntax binaryMessage.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
 abstractSyntax node)\x7fVisibility: public'
        
         expression <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         operator <- '?'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Messages\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         binaryMessage = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax binaryMessage.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
 abstractSyntax node)\x7fVisibility: public'
        
         receiver <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Slots\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         binarySlot = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'binarySlot' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax binarySlot.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
abstractSyntax node)\x7fVisibility: public'
        
         argument <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         operator <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Slots\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         binarySlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax binarySlot.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         regularObject <- bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (slots plain copy)\x7fVisibility: private'
        
         slot <- slots plain copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         block = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'block' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'block' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax block.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         activation.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
abstractSyntax node)\x7fVisibility: public'
        
         body <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         currentByteCodePos <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         block = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax block.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         theMirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'slots' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         blockNode: b Activation: isActivation Excess: excess = ( |
             aBody.
            | 
            aBody: body copy slotList: slotListNode: b valueSlot value
                           Activation: isActivation .
            aBody code: 
              codeNode: b valueSlot value Activation: isActivation
                                          Excess: excess.
            (block copy body: aBody) theMirror: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         body = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'body' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'body' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax body.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'body' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         code <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         body = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'body' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax body.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'body' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'body' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'body' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         slotList <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         bracketedExp = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'bracketedExp' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax bracketedExp.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
abstractSyntax node)\x7fVisibility: public'
        
         expression <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         bracketedExp = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax bracketedExp.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'bracketedExp' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         categoryStruc = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'categoryStruc' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax categoryStruc.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'categoryStruc' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         add: aSlot Sub: catList = ( |
             cat.
             l.
             x.
            | 
            catList isEmpty ifTrue: [
              "find in elements the one with name=''"
              elements do: [|:x|
                 x name = '' ifTrue: [
                 x elements add: aSlot.
                 ^self
              ]].
              "none found"
              elements add: (copy name: '')
                  elements: list copyRemoveAll add: aSlot.
              ^self
            ] False: [
              cat: catList first.
              elements do: [|:x |
                x name  = cat ifTrue: [
                  " add to x"
                  l: catList copy.
                  l removeFirst.
                  x add: aSlot Sub: l.
                  ^self
              ]].
              x: (copy name: cat)
                 elements: list copyRemoveAll.
              l:  catList copy.
              l removeFirst.
              x add: aSlot Sub: l.
              elements add: x.
              ^self
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'categoryStruc' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         do: blk = ( |
            | 
            elements do: [|:e| blk value: e].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'categoryStruc' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         do: leaf Interior: int = ( |
             l.
             ll.
            | 
            l: list copy removeAll.
            elements do: [|:e|
              e name = '' ifTrue: [
                  e elements do: [|:a| l add: leaf value: a ]
                ] False: [ 
                  ll: e do: leaf Interior: int.
                  l add: int value: e With: ll.
                ]
            ].
            l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'categoryStruc' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         elements <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'categoryStruc' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (\'\')'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'categoryStruc' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'categoryStruc' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         print: t Indent: n = ( |
             s.
            | 
            s: '\n'.
            n do: [s: s , ' ' ].
            s: s , 'Category: ' , name , ': ' .
            name = '' ifTrue: [
               elements do: [|:a | s: s , ' ', a name] .
            ] False: [
             elements do: [|:e| s: s , (e print: s Indent: n+1). ].
            ].
            ^s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         code = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'code' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'code' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax code.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (list copy)\x7fVisibility: public'
        
         expressions <- list copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         code = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax code.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fComment: Construct a code node for the object
reflected by the the mirror m\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         codeNode: m Activation: activationSon Excess: excess = ( |
             code.
             delegatee <- ''.
             exps.
             sl.
             sp.
             ss.
             tr.
             v.
             vInx.
            | 
            "('Excess:' , excess printString) printLine."
            v: m source _ParseObjectIntoPositionTable.
            vInx: 0.
            code: abstractSyntax code copy.
            exps: abstractSyntax stack copy.
            m byteCodesDo: [| :bci . :op . :literal . :nbci . litType . opType |
            case
              if: [ op= 'pushSelf' ] Then: [exps push: identifier copy text: 'self']
              If: [ op= 'literal' ] Then: [| b |
                  b: reflect: literal.
                  case
                    if: [b isReflecteeBlock] Then: [ exps push: blockNode: b Activation: nil Excess: excess] 
                    If: [b isReflecteeSlots] Then: [ exps push: objectNode: b ]
                    Else: [ exps push: (numberExp copy theNumber: literal printString)]
                ]
              If: [ op= 'nonlocalReturn' ] Then: [exps push: returnExp copy expression: exps pop]
              If: [ op= 'pop' ] Then: ["exps pop"  "Ignore pop, else this test fails! Don't know why. Ole Agesen."]
              " Don't know exactly what to do here for branches (dmu)"
              If: [ op= 'branchIfTrue' ] Then: [exps pop]
              If: [ op= 'branchIfFalse' ] Then: [exps pop]
              If: [ op= 'branchIndexed' ] Then: [exps pop]
              If: [ op= 'delegatee' ] Then: [delegatee: literal]
              If: [ op= 'undirectedResend' ] Then: [delegatee: 'resend']
              If: [ op= 'send' ] Then: [
                  exps: replace: activationSon In: exps  For: m With: bci. 
                  exps push: (messageNode: nil Selector: literal Args: exps)
                ]
              If: [ (op= 'readLocal') || [op= 'writeLocal'] ] Then: [
                exps: replace: activationSon In: exps  For: m With: bci. 
                exps push: messageNode: emptyNode Selector: literal Args: exps.
                ]
              If: [ op= 'implicitSelfSend' ] Then: [
                delegatee isEmpty ifTrue: [
                  exps: replace: activationSon In: exps  For: m With: bci. 
                  exps push: messageNode: emptyNode Selector: literal Args: exps.
                ] False: [
                  exps push: 
                    (resendMessage copy receiver: delegatee) 
                    message: messageNode: emptyNode Selector: literal Args: exps.
                  delegatee: ''.
                ]]
              Else: [error: 'unexpected byte code: ', op].
            exps last byteCodePos: bci.
            sp: v at: vInx.
            sl: sp + (v at: vInx+1).
            exps last comment: 
              getWhiteSpace: m source Before: sp After: sl IsLast: nbci = 0 Excess: excess.
            vInx: vInx + 2.
            ].
            ^code expressions: exps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Slots\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         dataSlot = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'dataSlot' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax dataSlot.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
abstractSyntax node)\x7fVisibility: public'
        
         expression <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         isArgument <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         isParent <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Slots\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         dataSlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax dataSlot.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'dataSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (slots plain copy)\x7fVisibility: private'
        
         slot <- slots plain copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         slotKind <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         slotName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Misc\x7fComment: Shows how to use the pretty printer on an abstract syntax tree.
ASTs may be constructed from mirrors, see makeASTfromMirror.
The argument to doPP must be an abstract syntax tree.
A node in the AST has a doPP: method. The argument must
be a position or uglyPosition.Before calling 
					    anAST doPP: ..
It is necessary to call
        anAST ppWidth
which traverses the AST and calculates the pretty printing size
of all sub-trees in the AST. This width is save in node thePWidth.
Note, that the actual  \'anAST doPP: ...\' must be executed within
a \'safelyDo\' in order NOT to interfere with UI2 updating of the
screen.
\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         doPP: anAST = ( |
             thePos.
            | 
            anAST ppWidth.
            desktop w
              safelyDo:
                [thePos: anAST doPP: uglyEditorPPStream new: 60
                ].
            thePos root: anAST.
            thePos uglyEditor theAST: anAST.
            thePos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Misc\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: creator At: slot OnFile: file = ( |
             theAST.
             thePos.
            | 
            theAST:
                makeASTfromMirror: 
                    ((reflect: creator) slotAt: slot 
                                      IfAbsent: [| :e|  ^ 'No such slot']
                    ) value.
            theAST ppWidth.
            thePos: theAST doPP: (pPStream copy width: 60) .
            thePos text printOnFile: file.
            file).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Misc\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         doPPforConstructItems: slot = ( |
             theAST.
             thePos.
            | 
            theAST: (makeASTfromMirror: slot value). 
            theAST ppWidth.
            thePos: theAST doPP: (uglyEditorPPStream new: 60).
            thePos root: theAST.
            thePos uglyEditor theAST: theAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Examples\x7fComment: Creates an AST representing the object
sourceExample  \x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         example1 = ( |
            | 
            (((reflect: abstractSyntax) at: 'sourceExample') value) makeAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Examples\x7fComment: Creates an AST using example1; 
scans the slots of this AST and
counts the number of methods and
collects the method names in a string.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         example2 = ( |
             anAST.
             noOfMethodSlots <- 0.
             slotNames <- ''.
            | 
            anAST: example1.
            anAST body slotList slots do: [| :slotAST |
               slotAST isMethodSlot ifTrue: [
                  noOfMethodSlots: noOfMethodSlots + 1.
                  slotNames: slotNames , '"', slotAST slotName , '" ']
             ].
            ('The object has: ' 
             , noOfMethodSlots printString 
             , ' ' , 'methods: ' , slotNames) printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Examples\x7fComment: Creates an AST for the method \'start\' in \'sourceExample\';
forces parsing of the code;
computes all messages sent to self;
prints them;
and returns the list of self-messages.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         example3 = ( |
             anAST.
             msgList.
            | 
            anAST: (((reflect: sourceExample) at: 'start') value) makeAST.
            anAST checkIfCodeIsParsed.
            msgList: anAST messagesToSelf.
            '\nMessages to self are: ' printLine.
            msgList do: [| :msg | ('\t"' , msg , '"') printLine].
            msgList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Examples\x7fComment: Shows the use of the various pretty-printers.
printOnFile with asIsPP incorrectly prints 
the text in a structureEditor outliner twice.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         example4 = ( |
             anAST.
            | 
            '\n\n*** ugly pretty printing ***' printLine.
            anAST: example1.
            anAST prettyPrint printLine.
            '\n\n*** adaptive pretty printer ***' printLine.
            (anAST doPPWidth: 30) text printLine.
            '\n\n*** as-is pretty printer ***' printLine.
            (anAST asIsPP) text printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fComment: Get all white space before and after exp.
White space includes comments.
If WS before has more than one line then exclude the first 
line since it is considered part of the preceeding exp.
exp\' xxxxx\\n
yyyyyy\\n
zzzzz\\n
vvv exp www\\n
uuuu\\n
exp\"
Before exp is:
yyyyyy\\n
zzzzz\\n
vvv
After exp is:
www\\n\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         getWhiteSpace: source Before: first After: last IsLast: isLast Excess: excess = ( |
             as.
             before.
             bs.
             ch.
             hasDot.
             inc.
             inx.
             isFirst.
             pc <- 0.
             pos.
             s.
             size.
            | 
            size: source size.  
            before: true.
            0 upTo: 2 Do: [ |:i| 
              isFirst: false.
              s: ''.
              hasDot: false.
              before ifTrue: [pos: first - 1. inc: -1]
                     False: [pos: last. inc: 1 ].
              [(0 <= pos) && [pos < size] ] whileTrue: [
                ch: source at: pos. 
                case 
                  if: [ ch  <= ' ' ] Then: [" normal white space "
                    before ifTrue: [ s: ch , s ] False: [ s: s , ch ]]
                  If: [ ch = '.' ] Then: [ 
                     " '.' is WS after 'exp' "
                     before ifFalse: [s: s , ch ].
                     hasDot: true.
                    ]
                  If: [ ch = '(' ] Then: [ 
                        before ifTrue: [ s: ch , s. pc: pc+ 1 ] False: [ "stop" pos: size + 1000 ]
                     ]
                  If: [ ch = ')'  ] Then: [
                        (before not) && [ pc > 0 ] 
                            ifTrue: [ s: s , ch. pc: pc - 1 ] False: ["stop" pos: size + 1000 ]
                     ]
                  If: [ ch = '"' ] Then: [" comment is WS "
                     before ifTrue: [s: ch , s ] False: [s: s , ch]. 
                     pos: pos + inc. ch: source at: pos.
                     [ch != '"'] whileTrue: [
                        before ifTrue: [s: ch , s ] False: [s: s , ch].
                        pos: pos + inc.
                        ch: source at: pos
                    ].
                    before ifTrue: [s: ch , s ] False: [s: s , ch.]
                  ]
                  Else: [" non-WS: stop" pos: size + 100].
                pos: pos + inc.
                isFirst: pos <= 0 . " very tricky"
                "the first time this method is called is NOT necessarily
                 corresponding to the first expression in the method/block,
                 since it is first called for the parameters of the first exp."
              ].
              inx: -1.
              s reverseDo: [| :ch . :i |  ch = '\n' ifTrue: [inx: i]].
              before ifTrue: [
                case if: [ isFirst] Then: [ bs: s skipExcess: excess After: false]
                     If: [ inx >= 0 ]
                      Then: [ hasDot 
                                ifTrue: [ bs: (s copyFrom: inx + 1 UpTo: s size) skipExcess: excess  After: false]
                                False: [ bs: s skipExcess: excess  After: false]]
                     Else: [ hasDot ifTrue: [ bs: ''] False: [bs: s ] ].
               ] False: [ 
                case if: [ isLast ] Then: [ as: s skipExcess: excess  After: true]
                     If: [ inx >= 0 ]
                      Then: [ hasDot ifTrue: [as: (s copyFrom: 0 UpTo: inx + 1) skipExcess: excess  After: true]
                                     False: [ as: s skipExcess: excess  After: true] ]
                     Else: [ as: s ]    
               ].
              before: false.
            ].
            [('WS: "' , bs , '" - "' , as ,'"') printLine.].
            ^ bs , '#' , as).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         identifier = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'identifier' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'identifier' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax identifier.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         identifier = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'identifier' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax identifier.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'identifier' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'identifier' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'identifier' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         text <- '?'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fComment: Represents a \'real\' object and NOT an AST. It is used for representing data slots
where the value of the data slot is an object which does NOT have the data slot
as its creator slot\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         instance = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'instance' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'instance' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax instance.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         instance = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'instance' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax instance.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'instance' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'instance' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'instance' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         theInstance <- bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Messages\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         keywordMessage = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'keywordMessage' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( |
             {} = 'Comment: Represents a keyWord message:
   receiver sk0: arg0 Sk1: arg1 ... Skn: argn
where n >= 0   
reciver is the AST representing the receiver;
selector is the string \'sk0:Sk1:...Skn:\';
arguments is a list of ASTs representing arg0, arg1, ... argn;
Note, that this structure does not follow the context-free
grammar. If the grammar structure should have been followed
there should be AST-objects corresponding to keyword-send
of the grammar.\x7fModuleInfo: Creator: globals abstractSyntax keywordMessage.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (list copy)\x7fVisibility: public'
        
         arguments <- list copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Messages\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         keywordMessage = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax keywordMessage.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordMessage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
abstractSyntax node)\x7fVisibility: public'
        
         receiver <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         selector <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Slots\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         keywordSlot = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'keywordSlot' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax keywordSlot.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (list copy)\x7fVisibility: public'
        
         arguments <- list copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
abstractSyntax node)\x7fVisibility: public'
        
         method <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Slots\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         keywordSlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax keywordSlot.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         selector <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (slots plain copy)'
        
         slot <- slots plain copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fComment: Constructs an abstract syntax tree (AST) from a mirror, \'m\'.
The following cases are covered  
   slots (isReflecteeSlots): an AST representing a dataObject is constructed;
       \'objectNode: m\' is called by \'m makeAST\'
   method (isReflecteeMethod): an AST representing a methodObject;
       \'methodNode: m Activation: nil\' is called by \'m makeAST\'
   blockmethodActivation (isReflecteeBlockMethodActivation):
     An AST for the blockmethodActivation, including its enclosing;
       \'methodNode: m Son: nil\' is called  by \'m makeAST\'
         ....\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         makeASTfromMirror: m = ( |
             father.
             theAST.
            | 
            theAST: m makeAST.
             "case 
             if: [ m isReflecteeSlots  ] Then: [ objectNode: m ]
             If: [ m isReflecteeBlockMethodActivation] Then: [ methodNode: m Son: nil ]
             If: [ m isReflecteeMethod ] Then: [ methodNode: m Activation: nil]
             Else: [ instance copy theInstance: m value reflectee ]."
            theAST doInterior: [| :root | father: root ]
                   Sons: [| :son | son father: father ].
            theAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         messageNode: receiver Selector: literal Args: exps = ( |
             n.
             s.
            | 
            s: selector copyStr: literal.
            s isBinary ifTrue: [
               n: binaryMessage copy.
               n rightExp: exps pop "setParenth: (exps pop) Op: literal".
               n operator: literal.
               n leftExp: receiver = nil
                  ifTrue: [ exps pop "setParenth: (exps pop) Op: literal" ]
                  False: [ receiver ].
              "n rightExp comment: (n rightExp comment forAST: true) , '#' ."
              n rightExp comment: (n rightExp comment forASTTrail) .
               ^n
            ].
            s isUnary ifTrue: [
               n: unaryMessage copy .
               n unarySend: literal.
               n receiver: nil = receiver 
                 ifTrue: [ "setParenthForUnary:" exps pop]
                 False: [receiver].
               ^n
            ].
            s isKeyword ifTrue: [|noOfArg  . args . first|
               n: keywordMessage copy.
               noOfArg: s numberOfArguments.
               args: list copy.
               first: true.
               1 to: noOfArg Do: [
                 args addFirst: exps pop "
                   first ifTrue: [first: false. exps pop]
                         False: [setParenthForKeyword: exps pop]"
                 ]. 
               n arguments: args.
               n selector: literal.
               n receiver: receiver=nil 
                 ifTrue:["setParenthForKeyword:" exps pop] 
                 False:[receiver].
               n arguments last comment: 
                  "(n arguments last comment forAST: true ), '#'."
                  (n arguments last comment forASTTrail).
               ^n
             ].
            ^node copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fComment: An AST for a method is constructed.
The code (expression list) of the method
is constructed lazily, in the sense that
it is initially empty. 
The message \'checkIfCodeIsParsed\' will force
parsing of the code-part.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         methodNode: m Activation: isActivation = ( |
             anObj.
            | 
            anObj: regularObject copy body: body copy.
            anObj body slotList: slotListNode: m Activation: isActivation.
            nil = isActivation
              ifTrue: ["lazy construction" anObj body code: emptyNode]
              False: [
                anObj body code: codeNode: m Activation: isActivation 
                                 Excess: (methodText copyForMethod: m) leftExcess
              ].
            anObj theMirror: m.
            m isReflecteeBlockMethodActivation ifTrue: [
                 anObj activation: m.
                 anObj: 
                    (methodNode: (m 
                     lexicalParentIfFail:['no lexical parent' printLine])
                     Son: anObj)
               ].
            ^anObj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fComment: Constructs  a block node for \x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         methodNode: m Son: son = ( |
             aBlock.
             aBody.
            | 
            aBody: body copy.
            " slotListNode needs to know that it should fetch the value of
              argument slots. son != nil indicates this. It might as well
              have been a boolean value."
            aBody slotList: slotListNode: m Activation: son.
            " codeNode needs to have the actual son to insert for one 
              of the blocks in the code."
            nil = son 
               ifTrue: ["lazy construction" aBody code: emptyNode]
               False: [ 
                 aBody code: 
                      codeNode: m 
                    Activation: son
                        Excess: (methodText copyForMethod: m) leftExcess
              ].
            aBlock: block copy body: aBody.
            aBlock  currentByteCodePos: m position.
            m isReflecteeBlockMethodActivation 
              ifTrue: [
                 aBlock activation: m.
                 aBlock: 
                    (methodNode: (m 
                     lexicalParentIfFail:['No lexical parent?' printLine])
                     Son: aBlock)
               ].
            ^aBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         numberExp = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'numberExp' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'numberExp' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax numberExp.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         numberExp = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'numberExp' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax numberExp.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'numberExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'numberExp' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'numberExp' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         theNumber <- '?'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fComment: Constructs an AST for the object reflected by
the mirror m. Note an object has only slots; its
code part is empty. Only method objects and
blocks have a non-empty code part.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         objectNode: m = ( |
             anObj.
            | 
            anObj: regularObject copy body: body copy .
            anObj theMirror: m.
            anObj body code: emptyNode.
            anObj body slotList: slotListNode: m Activation: nil.
            anObj setFather.
            anObj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Type checking\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         pathWithMirror = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pathWithMirror' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax pathWithMirror.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pathWithMirror' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         copy: aSet Mirror: m = ( |
            | 
            setParent: aSet. theMirror: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Type checking\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         pathWithMirror = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pathWithMirror' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax pathWithMirror.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pathWithMirror' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pathWithMirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pathWithMirror' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         setParent* <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'pathWithMirror' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (mirrors slots)'
        
         theMirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'slots' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         regularObject = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'regularObject' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'regularObject' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax regularObject.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         activation.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
 abstractSyntax node parent)\x7fVisibility: public'
        
         body <- bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
 abstractSyntax node)\x7fVisibility: private'
        
         lexicalParent <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         regularObject = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax regularObject.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (mirrors slots)\x7fVisibility: private'
        
         theMirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'slots' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         replace: activationSon In: exps For: m With: bci = ( |
             wasReplaced.
            | 
            wasReplaced: false.
               m isReflecteeBlockMethodActivation
            || [ m isReflecteeActivation ]
               ifTrue: [
                  activationSon = nil
                   ifFalse: [
                     bci = m position ifTrue: [
                     m expressionStack size do: [|:i|
                       (m expressionStack at: i)  
                       = activationSon activation receiver reflectee
                         ifTrue: [| saveExp |
                           wasReplaced ifTrue: ['Double replacement' printLine ].
                           "exps[top - (expressionStack size - i +1)]: activationSon"
                           "The indexing is implemented by pushing the exps stack.
                            This should be possible to do more efficient"
                            saveExp: abstractSyntax stack copy .
                            m expressionStack size - i do: [saveExp push: exps pop].
                            exps push: activationSon .
                            saveExp pop.
                            m expressionStack size - (i + 1) do: [exps push: saveExp pop].   
                            wasReplaced: true.  
                          ]
                      ]
                   ]
               ]
             ].
            exps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Messages\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         resendMessage = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'resendMessage' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'resendMessage' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax resendMessage.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'resendMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         message <- bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Messages\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         resendMessage = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'resendMessage' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax resendMessage.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'resendMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'resendMessage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'resendMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         returnExp = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'returnExp' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'returnExp' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax returnExp.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'returnExp' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
abstractSyntax node)\x7fVisibility: public'
        
         expression <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         returnExp = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'returnExp' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax returnExp.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'returnExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'returnExp' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fCategory: Parentheses handling\x7fComment: \'node\' represents an AST that is going to a receiver
of argument of an AST representing a binary message with
operator \'operator\'. If node is itself a binary message
with operator \'operator\' then a parentheses is needed
around node.
This message is no longer in use, since parentheses are
treated as formatting info and handled by \'getWhiteSpace:...\'.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         setParenth: node Op: operator = ( |
             n.
            | 
            node isBinaryMessage ifTrue:[
               node operator = operator ifFalse:[
                  n: bracketedExp copy expression: node. 
                  ^n
               ]].
            node).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fCategory: Parentheses handling\x7fComment: Similar to setParenth:Op: but node is going 
to be a selector or argument of a keyword expression\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         setParenthForKeyword: node = ( |
             n.
            | 
            node isKeywordMessage
               ifTrue:[n: bracketedExp copy expression: node. ^n]
               False: [^node]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fCategory: Parentheses handling\x7fComment: Similar to setParenth:Op: but node is going 
to be a selector of a unary expression\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         setParenthForUnary: node = ( |
             n.
            | 
            node isBinaryMessage || node isKeywordMessage
               ifTrue:[n: bracketedExp copy expression: node. ^n]
               False: [^node]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Slots\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         slotCategory = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'slotCategory' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax slotCategory.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         categoryName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Slots\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         slotCategory = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax slotCategory.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (list copy)\x7fVisibility: public'
        
         slots <- list copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Slots\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         slotList = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'slotList' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'slotList' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax slotList.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (list copy)\x7fVisibility: public'
        
         categories <- list copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Slots\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         slotList = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax slotList.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (list clone)\x7fVisibility: public'
        
         slots <- list clone.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fComment: Construct a slotList node from the slots
of the object reflected by mirror m\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         slotListNode: m Activation: isActivation = ( |
             categoryList.
             slots.
             slotss.
             theSlot.
            | 
            slots: list copy.
            slotss: list  copy.
            m do: [| :a. :b | 
              theSlot: a asNode: isActivation. "defined in traits slots plain, etc. "
              theSlot = nil ifFalse: [
                 theSlot slot: a.
                 theSlot comment: a comment. " is now redundant since slot is saved"
                 a category != '' ifTrue: [
                   categoryList = nil ifTrue: [ categoryList: list copy 
                 ]].
                 add: theSlot WithCategory: a category ToCategory: categoryList OrSlot: slotss.
              ]
            ].
            ^(slotList copy slots: slotss) categories: categoryList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Examples\x7fComment: Used as data by the example methods \x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceExample = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sourceExample' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax sourceExample.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sourceExample' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         do: blk = ( |
            | 
            blk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sourceExample' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         do: first Then: second = ( |
            | 
            do: first.
            do: second).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sourceExample' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sourceExample' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         start = ( |
            | 
            do: [theString: 'Hello '] 
                Then: [theString: theString , 'world!'].
            theString printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'sourceExample' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         theString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Mirror unparsing\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         stack = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'stack' -> () ToBe: bootstrap addSlotsTo: (
             globals list copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'stack' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax stack.

CopyDowns:
globals list. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'stack' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         pop = ( |
            | removeLast).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'stack' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         push: e = ( |
            | 
            add: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'stack' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'stack' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Structure editing & pretty printing\x7fCategory: Misc\x7fCategory: Misc misc\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (nil)'
        
         testxxx.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fComment: This node holds the text after
an AST has been text-edited and
while its is being parsed and the AST
updated.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         textNode = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'textNode' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax textNode.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'textNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         comment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'textNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (abstractSyntax emptyNode)\x7fVisibility: public'
        
         father <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'emptyNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'textNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'textNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
            | 
            withDot: (text , (comment forAST: false))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'textNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (\' \')\x7fVisibility: private'
        
         text <- ' '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'textNode' -> () From: ( | {
         'Comment: If the text is an expression in a code-node
it must be separated by dots (\'.\') from
other expressions. This methdos may thus
add a dot to the exp.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         withDot: txt = ( |
             first.
             inCom.
             s.
            | 
            father isCode " perhaps same if isSlots? " ifTrue: [
              s: ''.
              inCom: false.
              first: true. 
              txt reverseDo: [| :c |
                case
                  if: [ (c = '.') && [ inCom=false ]]
                      Then: [ first ifTrue: [ ^txt] False: [ s: c , s ]
                     ]
                  If:[ c = '"'] Then: [ s: c , s. inCom: inCom not ]
                  If: [inCom] Then: [ s: c , s ]
                  If: [ c <= ' '] Then: [ s: c , s]
                  Else: [" first time we are here we should add a dot"
                    first ifTrue: [ s: '.' , s. first: false ].
                    s: c , s.
               ]]
            ] False: [ ^ txt ].
            ^ s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Tests\x7fComment: This slot is just for illustrating
the type inference based browser\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         typeInfEx = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfEx' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax typeInfEx.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfEx' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         main = ( |
            | 
            safeRemove: list.
            safeRemove: vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfEx' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'typeInfEx' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         safeRemove: b = ( |
            | 
            b size = 0 ifTrue: [ ^nil].
            b removeFirst).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fComment: Represents an AST which is NOT expanded into a concrete AST. It is used to 
represent placeholders like <exp> and <slot>used by the structure editor.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         unExpanded = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'unExpanded' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'unExpanded' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax unExpanded.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'unExpanded' -> () From: ( | {
         'Category: Structure\x7fComment: A string representing the name of 
the category of this unexpanded AST\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (\'?\')\x7fVisibility: public'
        
         category <- '?'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         unExpanded = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unExpanded' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax unExpanded.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'unExpanded' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unExpanded' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Messages\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         unaryMessage = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'unaryMessage' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( |
             {} = 'Comment: Represents a unaryMessage:
     receiver unarySend
receiver is the ASt for the receiver
unarySend is a string representing the selector\x7fModuleInfo: Creator: globals abstractSyntax unaryMessage.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Messages\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         unaryMessage = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax unaryMessage.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unaryMessage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (
abstractSyntax node)\x7fVisibility: public'
        
         receiver <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         unarySend <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Slots\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         unarySlot = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'unarySlot' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractSyntax node copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractSyntax unarySlot.

CopyDowns:
globals abstractSyntax node. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Slots\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         unarySlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax unarySlot.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (abstractSyntax node)\x7fVisibility: public'
        
         regularObject <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (slots plain copy)\x7fVisibility: private'
        
         slot <- slots plain copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         slotName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrors' -> 'blockMethodActivation' -> () From: ( | {
         'Category: Abstract syntax\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         makeAST = ( |
            | 
            abstractSyntax methodNode: self Son: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         abstractSyntax = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'abstractSyntax' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'abstractSyntax' -> () From: ( |
             {} = 'Comment: the prototype module object, I am created by init.self.\x7fModuleInfo: Creator: globals modules abstractSyntax.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'abstractSyntax' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'abstractSyntax' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'abstractSyntax' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'abstractSyntax' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'abstractSyntax' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         status <- 'new'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'abstractSyntax' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractSyntax = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( |
             {} = 'Comment: This is the traits object for handling abstract syntax
in Self. See the corresponding comment in:
        globals abstractSyntax \x7fModuleInfo: Creator: traits abstractSyntax.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentsDo: blk = ( |
            | 
            blk value: expression).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPPSelectorAndArgs: pos = ( |
             newPos.
            | 
            newPos: pos add: operator.
            newPos: rightExp asIsPP: newPos.
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPPXXX: pos = ( |
            | 
            asIsPP: pos WithSep: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         asIsPPxxx: pos WithSep: yes = ( |
             newPos.
             p.
            | 'Aha' printLine.
            newPos: asIsPPInit: pos WithSep: yes. 
            newPos: newPos add: operator.
            newPos: rightExp asIsPP: newPos.
            p: position asIsEnd: newPos.
            newPos: newPos emitSep: comment forAST: false.
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         category = 'binaryMessage'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             new.
            | 
            new: copy.
            new leftExp: leftExp copyDeep.
            new leftExp father: new.
            new rightExp: rightExp copyDeep.
            new rightExp father: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: n Sons: s = ( |
            | 
            n value: self.
            s value: leftExp.
            s value: rightExp.
            leftExp doInterior: n Sons: s.
            rightExp doInterior: n Sons: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
             newPos.
             s.
            | 
            position: pos markStart: self.
            newPos: leftExp doPP: position copy.
            newPos: newPos break:1 Next: operator size Indent: pos+1 Break:false.
            newPos: newPos , operator.
            s: rightExp comment getComment: true.
            s != '' ifTrue: [newPos: newPos , s].
            newPos: newPos break:1 Next: rightExp ppWidth Indent: pos+2 Break:false.
            "s: comment getComment: true.
            s != '' ifTrue: [newPos: newPos , s]."
            position markEnd: (rightExp doPP: newPos)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doSons: blk = ( |
            | 
            blk value: leftExp.
            blk value: rightExp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isBinaryMessage = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         left: l Op: m Right: r = ( |
             s.
            | s: abstractSyntax binaryMessage copy . s leftExp: l . s operator: m . s rightExp: r . ^s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         leftExp = ( |
            | 
            receiver).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         leftExp: anAST = ( |
            | receiver: anAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Messages\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         messageNode = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'messageNode' -> () From: ( |
             {} = 'Comment: This objects is an abstract parent for 
binaryMessage, unaryMessage and keywordMessage\x7fModuleInfo: Creator: traits abstractSyntax messageNode.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'messageNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
            | 
            leftExp ppWidth +
            operator size + 2 +
            (rightExp ppWidth)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
             s.
            | 
            s: resend.prettyPrint. "prints possible leftExp"
            s: s , operator , 
                "(rightExp comment forAST: true) ,"
                rightExp prettyPrint ,
                (comment forAST: false).
            ^ s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceSon: oldSon With: newSon = ( |
            | 
            resend.replaceSon: oldSon With: newSon.
            leftExp = oldSon ifTrue: [ leftExp: newSon ].
            rightExp = oldSon ifTrue: [ rightExp: newSon ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         rightExp = ( |
            | expression).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         rightExp: anAST = ( |
            | expression: anAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         selector = ( |
            | operator).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binaryMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         selector: aString = ( |
            | operator: aString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         category = ( |
            | 
            'slot').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         contractionString = ( |
            | 
            operator , ' ' , argument prettyPrint , ' ...').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             new.
            | 
            new: copy.
            new argument: argument copyDeep.
            new argument father: new.
            new operator: operator copy.
            new regularObject: regularObject copyDeep.
            new regularObject father: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         defaultContraction = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         doAsIsPPSlotName: pos = ( |
            | 
            doPPSlotName: pos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: n Sons: s = ( |
            | 
            n value: self.
            s value: argument.
            s value: regularObject.
            regularObject doInterior: n Sons: s.
            argument doInterior: n Sons: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         doPPSlotName: pos = ( |
             newPos.
            | 
            newPos: pos add: operator.
            argument asIsPP: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         method = ( |
            | regularObject).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         method: m = ( |
            | regularObject:m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Slots\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         methodSlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> () From: ( |
             {} = 'Comment: This object is an abstract super pattern for
binarySlot, keywordSlot and unarySlot\x7fModuleInfo: Creator: traits abstractSyntax methodSlot.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
            | 
            checkIfCodeIsParsed: method.
             operator , ' ' ,
            argument prettyPrint ,
            '=' , ' ' ,
            (regularObject prettyPrint)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         slotName = ( |
            | operator).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         sonsDo: blk = ( |
            | 
            blk value: argument.
            blk value: regularObject.
            argument sonsDo: blk.
            regularObject sonsDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         updateThisSlot: newSlot = ( |
            | 
            regularObject: newSlot regularObject.
            regularObject father: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'binarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         xxxxdoPP: pos = ( |
             break.
             newPos.
             next.
            | 
            position: pos markStart: self .
            newPos: position copy.
            contracted ifTrue: [newPos: newPos ,, contractionString ]
               False: [
                 newPos: newPos  , operator , ' ' .
                 newPos: (argument doPP: newPos) , ' = '.
                 next: regularObject ppWidth.
                 break: (newPos col + next + comment size) > newPos width.
                 newPos: newPos addComment: comment Indent: pos Break: break.
                 newPos: newPos break:0 Next:next Indent: pos + 2 Break: break.
                 newPos: (regularObject doPP: newPos).
              ].
            position markEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         asIsPP: pos = ( |
            | 
            asIsPP: pos WithSep: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos WithSep: yes = ( |
             newPos.
             p.
            | 
            newPos: pos.
            yes ifTrue: [newPos: newPos emitSep: comment forAST: true ].
            position: newPos asIsStart: self.
            newPos: position copy.
            contracted ifTrue: [ newPos: newPos ,, contractionString 
             ] False: [
               newPos: newPos add: '['.
               newPos: body asIsPP: newPos.
               newPos: newPos add: ']'.
             ].
            p: position asIsEnd: newPos.
            newPos: newPos emitSep: comment forAST: false.
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         category = ( |
            | 'block').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         check: ok NotFound: notFound Ambiguous: amb = ( |
            | 
            body check: ok NotFound: notFound Ambiguous: amb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             new.
            | 
            new: copy.
            new body: body copyDeep.
            new body father: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: b Sons: s = ( |
            | 
            b value: self.
            s value: body.
            body doInterior:  b Sons: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
             break.
             newIndent.
             newPos.
            | 
            position: pos markStart: self.
            activation = nil ifFalse: [
              "We are pretty printing a blockMethodActivation"
              pos innerBlockActivationStart: pos.
              pos innerBlockActivation: self.
            ].
            newPos: position copy.
            break: (thePPWidth + newPos col ) > pos width.
            newPos: newPos ,'['.
            newPos: body doPP: newPos.
            activation = nil ifFalse: [
              newPos innerBlockActivationEnd = 0 ifTrue: [
               newPos innerBlockActivationEnd: newPos
              ]
            ].
            newPos: newPos break: 0 Next: 0 Indent: pos  Break: break.
            position markEnd: (newPos , ']')).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         enclosingObject = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         getSep = ( |
            | 
            comment forAST: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isBlock = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         lookupKey: key = ( |
             p.
             p1.
            | 
            p: theMirror valueSlot value lookupKey: key.
            "('LookUpKey: ' , key , ' in :\n' , prettyPrint , '\n' ,
             'Size: ' , p size printString  ) printLine.
            p do: [| :e| e printString printLine]."
            p size = 0 
              ifTrue: [ father enclosingObject lookupKey: key ] 
              False: [ ^abstractSyntax pathWithMirror copy: p Mirror: theMirror ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         markSelectors: blk Mirror: mirr Templates: tp = ( |
            | 
            body code expressions do: [ | :exp  |
                 exp markSelectors: blk 
                     Mirror: theMirror valueSlot contents
                     Templates: tp
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         messagesToSelf = ( |
            | body messagesToSelf).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
            | 
            thePPWidth: 3 + body ppWidth.
            thePPWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
            | 
            (comment forAST: true)
             , '[' , body prettyPrint , ']'
             , (comment forAST: false)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'block' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         sonsDo: blk = ( |
            | body sonsDo: [|:son| blk value: son]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'body' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos = ( |
             newPos.
            | 
            position: pos asIsInvisibleStart: self.
            newPos: position copy.
            newPos: slotList asIsPP: newPos.
            newPos: code asIsPP: newPos.
            position asIsEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'body' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         check: ok NotFound: notFound Ambiguous: amb = ( |
            | 
            code check: ok NotFound: notFound Ambiguous: amb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'body' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             new.
            | 
            new: copy.
            new slotList: slotList copyDeep.
            new slotList father: new.
            new code: code copyDeep.
            new code father: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'body' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: b Sons: s = ( |
            | 
            b value: self.
            slotList = abstractSyntax emptyNode ifFalse: [
               s value: slotList ].
            code = abstractSyntax emptyNode ifFalse: [
               s value: code ].
            slotList = abstractSyntax emptyNode ifFalse: [
               slotList doInterior:  b Sons: s ].
            code = abstractSyntax emptyNode ifFalse: [
               code doInterior:  b Sons: s ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'body' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
             break.
             newIndent.
             newPos.
            | 
            position: pos markStartNotVisible: self.
            break: (thePPWidth + pos col ) > pos width.
            newPos: position copy.
            newPos: slotList doPP: newPos.
            "newPos col > (pos + 1) col ifTrue: ["
            slotList slots size > 0 ifTrue: [
               code = abstractSyntax emptyNode ifFalse: [
                  newPos: newPos break: 1 Next: 0 Indent: pos + 1  Break: break
            ]].
            code = abstractSyntax emptyNode ifFalse: [
               newPos: code doPP: newPos.
            ].
            position markEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'body' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesToSelf = ( |
            | code messagesToSelf).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'body' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'body' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
            | 
            thePPWidth: 3 + slotList ppWidth + code ppWidth.
            thePPWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'body' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
            | 
            slotList prettyPrint ,   (code prettyPrint)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'body' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         sonsDo: blk = ( |
            | 
            blk value: slotList.
            blk value: code.
            slotList sonsDo: blk.
            code sonsDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos = ( |
             newPos.
            | ' BRACKETED:' printLine.
            position: pos asIsStart: self.
            newPos: position copy.
            newPos: newPos emitSep: comment forAST: true.
            newPos: newPos add: '('.
            newPos: newPos emitSep: expression comment forAST: true.
            newPos: expression asIsPP: position copy.
            newPos: newPos add: ')'.
            newPos: newPos emitSep: comment forAST: false.
            position asIsEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         check: ok NotFound: notFound Ambiguous: amb = ( |
            | 
            expression check: ok NotFound: notFound Ambiguous: amb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             new.
            | 
            new: copy.
            new expression: expression copyDeep.
            new expression father: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: n Sons: s = ( |
            | 
            n value: self.
            s value: expression .
            expression doInterior: n Sons: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
             newPos.
            | 
            position: pos markStart: self.
            newPos: position copy, '('.
            newPos: expression doPP: newPos.
            position markEnd: (newPos , ')')).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doSons: blk = ( |
            | expression doSons: [| :son | blk value: son]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         markSelectors: blk Mirror: mirr Templates: tp = ( |
            | 
            expression markSelectors: blk Mirror: mirr Templates: tp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesToSelf = ( |
            | expression messagesToSelf).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
            | 
            thePPWidth: 2 + expression ppWidth.
            thePPWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
            | 
            (comment forAST:true) 
             , '(' , expression prettyPrint , ')'
             , (comment forAST: false)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'bracketedExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceSon: oldSon With: newSon = ( |
            | 
            resend.replaceSon: oldSon With: newSon.
            oldSon = expression ifTrue: [expression: newSon]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos = ( |
             newPos.
            | 
            position: pos asIsInvisibleStart: self.
            newPos: position copy.
            expressions do: [| :n | newPos: n asIsPP: newPos ].
            position asIsEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         check: ok NotFound: notFound Ambiguous: amb = ( |
            | 
            expressions do: [|:e| e  check: ok NotFound: notFound Ambiguous: amb.]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             new.
             newExps.
            | 
            new: copy.
            newExps: list copyRemoveAll.
            expressions do: [| :e . e1 |
               e1: e copyDeep.
               e1 father: new.
               newExps add: e1
             ].
            new expressions: newExps.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: b Sons: s = ( |
            | 
            "'Code' printLine."
            b value: self.
            expressions do: [| :n | s value: n ].
            expressions do: [| :n | n doInterior: b Sons: s]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
             break.
             i <- 0.
             newPos.
             s.
             size.
            | 
            position: pos markStartNotVisible: self.
            break: thePPWidth > pos width.
            newPos: position copy. 
            size: expressions size.
            expressions do: [| :n |
               i: i + 1 .
               i = 1 ifTrue: ["Handle comments before first exp"
                 s: n comment getComment: true.
                 newPos: emitSep: s To: newPos Last: false Next: n ppWidth Indent: pos Break: break.
               ].
               newPos: n doPP: newPos.
               s: n comment getComment: false. " comment and '.' after exp"
               newPos: emitSep: s To: newPos Last: i = size Next: n ppWidth Indent: pos Break: break.
            ].
            [(expressions doFirst: [| :n| newPos: n doPP: position copy] 
                   Middle: [|:n|
                        newPos: newPos , '.'. 
                        newPos: newPos break: 1 Next: n ppWidth Indent: pos Break: break.
                        newPos: n doPP: newPos
                     ]
                   Last: [|:n| 
                       newPos: newPos , '.'.
                       newPos: newPos break: 1 Next: n ppWidth Indent: pos Break: break.
                       newPos: n doPP: newPos
                     ]
                   IfEmpty:[pos]) .].
            position markEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'Category: Iterators\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         doSelection: blk Start: start End: end = ( |
             doIt <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            (nil = start) || [nil = end] ifTrue: [
               blk value: self
             ] False: [
               expressions do: [|:s| 
                 doIt ifTrue: [ blk value: s].
                 (s = start) || [s = end] ifTrue: [
                    doIt: doIt not
                ].
               doIt ifTrue: [ blk value: s].
            ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         emitSep: s To: pos Last: last Next: next Indent: iPos Break: break = ( |
             breakAgain <- bootstrap stub -> 'globals' -> 'false' -> ().
             inCom <- bootstrap stub -> 'globals' -> 'false' -> ().
             newPos.
             t <- ''.
            | 
            newPos: pos.
            s do: [| :ch |
                inCom ifTrue: [
                   ch = '\n' ifTrue: ["Perhasp skip leading whiteSpace"
                      newPos: newPos , t.
                      t: ''.
                      newPos: newPos break: 1 Next: next Indent: iPos Break: break
                   ] False: [ ch ='\t' ifTrue: ['Tab' printLine].
                      t: t , ch. 
                      ch = '"' ifTrue: [inCom: false]
                 ]] False: [
                   case
                     if: [ ch = '.']  Then: [
                         newPos: newPos , '.'.
                         newPos: newPos break: 1 Next: next Indent: iPos Break: break
                       ]
                     If: [ ch = '"'] Then: [ t: t , '"'. inCom: true. breakAgain: true] 
            ]].
            breakAgain ifTrue: [ 
              newPos: newPos , t.
               last ifFalse: [
                       newPos: newPos break: 1 Next: next Indent: iPos Break: break
            ]].
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         enclosingListFather = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         hasCode = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         insert: before At: theAST = ( |
             c.
             first <- bootstrap stub -> 'globals' -> 'true' -> ().
             newExps.
             ue.
            | 
            newExps: list copy.
            ue: abstractSyntax unExpanded copy category: 'exp'.
            ue father: self.
            expressions do: [| :exp|
              (theAST in: exp) ifTrue: [
                ue comment: exp comment copyWithBlanks.
                "ue prettyPrint printLine."
                before ifTrue: [
                  first ifTrue: ["switch comments"
                    c: ue comment.
                    ue comment: exp comment.
                    exp comment: c
                  ].
                  newExps add: ue 
                ].
                first: false.
                newExps add: exp.
                before ifFalse: [ newExps add: ue ].
             ] False: [ newExps add: exp ].
            expressions: newExps.
            self
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isCode = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesToSelf = ( |
             m <- list copyRemoveAll.
            | 
            m: list copy.
            expressions do: [| :e | m addAll: e messagesToSelf].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
             w.
            | 
            w: 0.
            (expressions doFirst: [|:n | w: w + n ppWidth] 
                   Middle: [|:n| w: 2 + w + n ppWidth ]
                   Last: [|:n| w: 2 + w + n ppWidth] 
                   IfEmpty:[^0]) .
            thePPWidth: w.
            ^ w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
             s.
            | 
            s: ''.
            expressions do: [|:n| s: s , n prettyPrint ].
            [(expressions doFirst: [| :n| s: (s , (n prettyPrint))] 
                   Middle: [|:n| s: ( s , '.\n ' , (n prettyPrint)) ]
                   Last: [|:n| s: (s,'.\n',(n prettyPrint))] 
                   IfEmpty:[^'']) .].
            ^ s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceSon: oldSon With: newSon = ( |
             newExps.
            | 
            resend.replaceSon: oldSon With: newSon.
            newExps: list copy.
            expressions do: [| :son |
               son = oldSon 
                   ifTrue: [
                      nil != newSon ifTrue: [ newExps add: newSon ]
                   ] False: [ newExps add: son]
               ].
            expressions: newExps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         subListCategory = ( |
            | 'Exp').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos = ( |
             newPos.
            | 
            position: pos asIsStart: self.
            newPos: position copy.
            expression = abstractSyntax emptyNode ifTrue: [ contracted: false ].
            contracted ifTrue: [ newPos: newPos add: contractionString ]
              False: [
                newPos: newPos add: slotNameWithKind.
            "!!! remember to print comment here !! "
                "newPos: newPos addComment: comment Indent: pos Break: true.
                next: expression ppWidth.
                break: (newPos col + next) > newPos width.
                newPos: newPos break: 0 Next: next Indent: pos + 2 Break: break."
                newPos: expression asIsPP: newPos.
            ].
            position asIsEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         category = 'dataSlot'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         contractionString = ( |
             argChar.
             initText.
             newPos.
             parentChar.
            | 
            isArgument ifTrue: [ argChar: ':' ] 
                       False: [ argChar: '' ] .
            isParent ifTrue: [ parentChar: '*' ]
                      False: [ parentChar: '' ].
            slotKind='' ifTrue: [ initText: '' ]
                         False: [ initText: ' ', slotKind , ' ' ].
            argChar, slotName, parentChar , initText , ' ' , expression contractionString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             new.
            | 
            new: copy.
            new expression: expression copyDeep.
            new expression father: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         defaultContraction = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: n Sons: s = ( |
            | 
            n value: self.
            expression = abstractSyntax emptyNode ifFalse: [
               s value: expression.
            ].
            expression = abstractSyntax emptyNode ifFalse: [
               expression doInterior: n Sons: s
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
             break.
             newPos.
             next.
            | 
            position: pos markStart: self.
            newPos: position copy.
            expression = abstractSyntax emptyNode ifTrue: [ contracted: false ].
            contracted ifTrue: [ newPos: newPos ,,  contractionString ]
              False: [
                newPos: newPos , slotNameWithKind.
                newPos: newPos addComment: comment Indent: pos Break: true.
                next: expression ppWidth.
                break: (newPos col + next) > newPos width.
                newPos: newPos break: 0 Next: next Indent: pos + 2 Break: break.
                newPos: expression doPP: newPos.
            ].
            position markEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doSons: blk = ( |
            | 
            expression doSlots: [| :son | blk value: son. son doSons: blk]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fCategory: Slots\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         slotNode = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotNode' -> () From: ( |
             {} = 'Comment: Abstract super pattern for
dataSlot and methodSlot\x7fModuleInfo: Creator: traits abstractSyntax slotNode.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
             argChar.
             initText.
             parentChar.
             w.
            | 
            w: 0.
            isArgument ifTrue: [w: w + 1].
            isParent ifTrue: [w: w + 1].
            thePPWidth:
               w + 2 + slotKind size + slotName size + expression ppWidth.
            thePPWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
             argChar.
             initText.
             parentChar.
            | 
            isArgument ifTrue: [argChar: ':'] 
                       False: [argChar: ''] .
            isParent ifTrue: [parentChar: '*']
                      False: [parentChar: ''].
            slotKind='' ifTrue:[initText: '']
                         False:[
                           initText: ' ',slotKind, ' '].
            argChar,
            slotName, parentChar ,
            initText, 
            (expression prettyPrint)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         slotNameWithKind = ( |
             n.
            | 
            isArgument ifTrue: [ n: ':' , slotName ]  False: [ n: slotName ] .
            isParent ifTrue: [ n: n , '*' ].
            slotKind != '' ifTrue: [ n: n , ' ' , slotKind , ' '].
            n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'dataSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         updateThisSlot: newSlot = ( |
            | 
            expression: newSlot expression.
            expression father: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Type checking\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         dummy = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> () From: ( | {
         'Category: Syntactic categories\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         expressionNode = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'expressionNode' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax expressionNode.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'expressionNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         category = ( |
            | 'exp').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'expressionNode' -> () From: ( | {
         'Comment: A wrapper in the form of a code node
is put around any exp before a structureEditor
is openened. The reason is that emitSep may
print some stuff before marskStart is called.
See structureEditorStream\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         createStructureEditor: evtOrNil = ( |
             code.
            | 
            code: abstractSyntax code copy 
                   expressions: 
                       list copyRemoveAll add: self.
            code createStructureEditor: evtOrNil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'expressionNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         inCode = ( |
            | 
            father isCode
               ifTrue: [ father ]
               False: [father inCode]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'expressionNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isDeletable = ( |
            | 
            case
              if: [father isCode] Then: [
                  father replaceSon: self With: nil.
                 ^true
                ]
              If: (father isMessage) &&  
                  [father receiver = self] 
               Then: [ 
                 father replaceSon: father receiver With: abstractSyntax emptyNode.
                 ^true
               ] 
             Else: [false]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'expressionNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'expressionNode' -> () From: ( | {
         'Comment: This is the default parser for nodes.
Is redefined for regularObject and slotNode.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         parseString: str IfFail: blk = ( |
            | 
            resend.parseString: str IfFail: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'expressionNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         superCategory = 'exp'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'identifier' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos = ( |
             newPos.
            | 
            position: pos asIsStart: self.
            newPos: position copy add: text.
            newPos: newPos emitSep: comment forAST: false.
            position asIsEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'identifier' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos WithSep: yes = ( |
             newPos.
             p.
            | 
            newPos: pos.
            yes ifTrue: [newPos: newPos emitSep: getSep].
            position: newPos asIsStart: self.
            newPos: position copy add: text.
            p: position asIsEnd: newPos.
            newPos: newPos emitSep: comment forAST: false.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'identifier' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
            | copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'identifier' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
            | 
            position: pos markStart: self.
            position markEnd: (position copy , text)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'identifier' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         markSelectors: blk Mirror: mirr Templates: tp = ( |
            | 
            blk value: self
                With: (inf interface getColourForExp: byteCodePos
                          MethodMirror: mirr
                          Templates: tp)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'identifier' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesToSelf = ( |
            | list copy add: text).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'identifier' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'identifier' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
            | 
            text size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'identifier' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
            | 
            text).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'instance' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos = ( |
             newPos.
            | 
            position: pos asIsStart: self.
            newPos: position copy add: (reflect: theInstance) evalName.
            newPos: newPos emitSep: comment forAST: false.
            position asIsEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'instance' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         category = 'instance'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'instance' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: n Sons: s = ( |
            | 
            n value: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'instance' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
            | 
            position: pos markStart: self.
            position markEnd: (position copy) , (reflect: theInstance) evalName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'instance' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'instance' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
            | 
            (reflect: theInstance) evalName size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'instance' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
            | 
            (reflect: theInstance) evalName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentsDo: blk = ( |
            | 
            arguments do: [| :arg| blk value: arg]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPPSelectorAndArgs: pos = ( |
             newPos.
             s.
            | 
            newPos: pos.
            s: lobby selector copyStr: selector.
            s keywords with: arguments Do: [| :kw. :arg.|
                 newPos: newPos add:  kw. 
                 "newPos: newPos emitSep: arg comment forAST: true."
                 newPos: arg asIsPP: newPos 
             ].
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         asIsPPxx: pos WithSep: yes = ( |
             newPos.
             p.
             s.
             t.
            | 
            newPos: asIsPPInit: pos WithSep: yes.
            s: lobby selector copyStr: selector.
            s keywords with: arguments Do: [| :kw. :arg.|
                 newPos: newPos add:  kw. 
                 "newPos: newPos emitSep: arg comment forAST: true."
                 newPos: arg asIsPP: newPos 
             ].
            p: position asIsEnd: newPos.
            newPos: newPos emitSep: comment forAST: false.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         asIsPPxxx: pos = ( |
            | 
            asIsPP: pos WithSep: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         category = 'keywordmessage'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             new.
             newArgs.
            | 
            new: copy.
            newArgs: list copyRemoveAll.
            arguments do: [| :a . a1 | 
               a1: a copyDeep.
               a1 father: new.
               newArgs add: a1
             ].
            new arguments: newArgs.
            receiver = abstractSyntax emptyNode
               ifTrue: [ new receiver: abstractSyntax emptyNode]
               False: [
                 new receiver: receiver copyDeep.
                 new receiver father: new.
              ].
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: b Sons: sons = ( |
             s.
            | 
            s: lobby selector copyStr: selector. 
            b value: self.
            s keywords with: arguments Do: [| :kw. :arg. |
               sons value: arg.
            ].
            receiver= abstractSyntax emptyNode
              ifFalse: [ sons value: receiver ].
            s keywords with: arguments Do: [| :kw. :arg. |
                arg doInterior: b Sons: sons ].
            receiver= abstractSyntax emptyNode
              ifFalse: [ receiver doInterior: b Sons: sons ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'Comment: [ receiver $ [[kw1: $ arg1] $ [Kw2: $ arg2] $ [Kw3: $ arg3]]] 
Possible layouts
 receiver
    kw1: arg1 Kw2: arg2 Kw3: arg3
 receiver
    kw1: arg1 
    Kw2: arg2
    Kw3: arg3
 receiver
    kw1: 
      argument1 
    Kw2: arg2
    Kw3: 
      argument3\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
             break.
             firstBreak.
             kwPos.
             newPos.
             s.
             t <- ''.
             xpos.
            | 
            position: pos markStart: self.
            break: (pos col + thePPWidth) > pos width.
            xpos: position copy.
            receiver= abstractSyntax emptyNode
               ifTrue:[newPos: xpos . firstBreak: 0. kwPos: xpos]
               False:[newPos: receiver doPP: xpos. firstBreak: 1. kwPos: xpos + 2].
            s: lobby selector copyStr: selector.
            s keywords with: arguments Do: [| :kw. :arg.|
                 "if break then indent to pos+2. pos is position before"
                 "receiver, i.e. the selector is indented 2 from receiver start"
                 firstBreak = 1 ifTrue:["only break if explicit receiver"
                     newPos: newPos break: firstBreak Next: 0 Indent: kwPos Break: break
                 ].
                 firstBreak: 1.
                 newPos: newPos , kw. 
                 newPos: newPos break: 1 Next: arg ppWidth Indent: kwPos + 2 Break: false.
                 t: arg comment getComment: true.
                 t != '' ifTrue:  [newPos: newPos , t].
                 newPos: arg doPP: newPos 
             ].
            position markEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isKeywordMessage = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'messageNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         ppWidth = ( |
             s.
             t <- ''.
             w.
            | 
            s: lobby selector copyStr: selector. 
            w: 0.
            s keywords with: arguments Do: [| :kw. :arg.|
                 w: w + kw size + arg ppWidth + 2
             ].
            receiver= abstractSyntax emptyNode
               ifTrue:[thePPWidth: w]
               False:[thePPWidth: receiver ppWidth + 1 + w].
            thePPWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
             s.
             t <- ''.
            | 
            t: resend.prettyPrint.
            s: lobby selector copyStr: selector. 
            s keywords with: arguments Do: [| :kw. :arg.|
                 t: t , kw , arg prettyPrint
             ].
            t: t , (comment forAST: false).
            ^t.
            "receiver= abstractSyntax emptyNode
               ifTrue:[t , (comment forAST: false)]
               False:[receiver prettyPrint  , t , (comment forAST: false)]").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceSon: oldSon With: newSon = ( |
             newArgs.
            | 
            resend.replaceSon: oldSon With: newSon.
            receiver = oldSon ifTrue: [ receiver: newSon. ^self].
            newArgs: list copy.
            arguments do: [| :arg |
               arg = oldSon ifTrue: [ newArgs add: newSon ]
                             False: [ newArgs add: arg ]
            ].
            arguments: newArgs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         category = ( |
            | 
            'slot').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         contractionString = ( |
             s.
             t <- ''.
            | 
            s: lobby selector copyStr: selector. 
            s keywords with: arguments Do: [| :kw. :arg.|
                 t: t , kw , ' ' , arg prettyPrint , ' '.
             ].
            t , '...').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             args.
             new.
            | 
            new: copy.
            args: list copy.
            arguments do: [|:a. a1 | 
              a1: a copyDeep.
              a1 father: new.
              args add: a1
             ].
            new arguments: args.
            new method: method copyDeep.
            new method father: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         defaultContraction = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         doAsIsPPSlotName: pos = ( |
             newPos.
             s.
            | 
            newPos: pos.
            s: lobby selector copyStr: selector. 
            s keywords with: arguments Do: [| :kw. :arg.|
              newPos: newPos add: kw, ' '.
              newPos: arg doPP: newPos.
              newPos: newPos add: ' '.
            ].
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: n Sons: s = ( |
             str.
            | 
            n value: self.
            str: lobby selector copyStr: selector. 
            str keywords with: arguments Do: [| :kw. :arg.|
                 s value: arg ].
            s value: method.
            str keywords with: arguments Do: [| :kw. :arg.|
                 arg doInterior: n Sons: s ].
            method doInterior: n Sons: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPPSlotName: pos = ( |
             newPos.
             s.
            | 
            newPos: pos.
            s: lobby selector copyStr: selector. 
            s keywords with: arguments Do: [| :kw. :arg.|
              newPos: newPos , kw, ' '.
              newPos: arg doPP: newPos.
              newPos: newPos , ' '.
            ].
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isArgument = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
             s.
             t <- ''.
            | 
            checkIfCodeIsParsed: method.
            s: lobby selector copyStr: selector. 
            s keywords with: arguments Do: [| :kw. :arg.|
                 t: t, kw, ' ', arg prettyPrint, ' '
             ].
            t , '=',
            method prettyPrint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         slotName = ( |
            | selector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         updateThisSlot: newSlot = ( |
            | 
            method: newSlot method.
            method father: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'keywordSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         xppWidth = ( |
             s.
             w.
            | 
            w:0.
            s: lobby selector copyStr: selector. 
            s keywords with: arguments Do: [| :kw. :arg.|
                 w: w+ kw size + arg ppWidth + 2.
                 " 2 is space before and after arg"
             ].
            thePPWidth: w + 2 + method ppWidth.
            thePPWidth
            " 2 is size of '= '").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'messageNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         asIsPP: pos = ( |
            | 
            asIsPP: pos WithSep: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'messageNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos WithSep: yes = ( |
             newPos.
             p.
            | 
            newPos: pos.
            yes && [contracted not] ifTrue: [newPos: newPos emitSep: getSep].
            position: newPos asIsStart: self.
            newPos: position copy.
            contracted ifTrue: [
               newPos: newPos ,, contractionString.
             ] False: [
               newPos: receiver asIsPP: newPos WithSep: false.
               newPos: asIsPPSelectorAndArgs: newPos.
             ].
            p: position asIsEnd: newPos.
            contracted ifFalse: [newPos: newPos emitSep: comment forAST: false].
            "p."
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'messageNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         asIsPPInit: pos WithSep: yes = ( |
             newPos.
            | 
            newPos: pos.
            yes ifTrue: [newPos: newPos emitSep: getSep].
            newPos: doAsIsPP: newPos.
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'messageNode' -> () From: ( | {
         'Comment: Performs local checking of messages in this messageNode.
Current type checking:
 1. a message to self is checked. If the ASST represents a traits this give
    errors for for messages defined as slots in the corresponding prototype.
 2. If the receiver is a slot denoting an object, and the object has an initial
    value other than nil, then the message is type checked.
Shortcomings:
 1. As mentioned, a messages defined as slots of the prototype of a trait gives errors.
 2. Arguments of methods can not have an initial value.
 3. There is no way of indicating the return type of a method\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         check: ok NotFound: notFound Ambiguous: amb = ( |
             p.
             p1.
             receiverType.
             resultType.
            | 
            "('Check:' , selector , ' in: ' , category ) printLine."
            receiver = abstractSyntax emptyNode 
               ifTrue: [ p: enclosingObject lookupKey: selector. ]
               False: [ receiverType: receiver check: ok NotFound: notFound Ambiguous: amb.
                  receiverType = nil ifFalse: [
                        p1: receiverType lookupKey: selector.
                        p: abstractSyntax pathWithMirror copy: p1 Mirror: receiverType
                ]].
            "receiverType is complicated:
             1. implicit receiver (receiverIsSelf = true)
                receiverType is the AST representing the object containing the message.
                This may be the AST representing the regularObject of a method or block.
                RegularObject defines the message pathsToKey. If a selector is not found
                in the regularObject of the method/block, the lexcial enclosing object
                is searched. This is possible since this info is in the AST (assuming the AST
                has been built for the object and the method). pathsToKey is regularObject
                calls pathsToKey of the corresponding mirror.
             2. explicit receiver (receiverIsSelf = false)
                receiverType is either nil or a mirror (slotsMirror) representing
                the receiver. A slotsMirror also understand pathsToKey.
                Special case: receiver is a number (smallInt)
            "
            p != nil ifTrue: [
              case 
                if: [p size = 1 ] Then: [
                    ok value: self.
                    resultType: p slotType
                 ]
                 If: [p size = 0 ] Then: [ notFound value: self] 
                 Else: [amb value: self]
             ] False: [ "'Receiver type is not known' printLine" ].
            argumentsDo: [| :arg | arg check: ok NotFound: notFound Ambiguous: amb].
            resultType).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'messageNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         doAsIsPP: pos = ( |
             newPos.
            | 
            position: pos asIsStart: self.
            newPos: position copy.
            receiver != abstractSyntax emptyNode 
               ifTrue: [ newPos: receiver asIsPP: newPos WithSep: false].
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'messageNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         getSep = ( |
            | 
            receiver = abstractSyntax emptyNode 
               ifTrue: [ comment forAST: true]
               False: [receiver getSep]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'messageNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isMessage = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'messageNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         markSelectors: blk Mirror: mirr Templates: tp = ( |
            | 
            receiver != abstractSyntax emptyNode
               ifTrue: [  receiver markSelectors: blk Mirror: mirr Templates: tp].
            blk value: self
                With: (inf interface getColourForExp: byteCodePos
                          MethodMirror: mirr
                          Templates: tp).
            argumentsDo: [| :arg | arg markSelectors: blk Mirror: mirr Templates: tp.]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'messageNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesToSelf = ( |
             m <- list copyRemoveAll.
            | 
            m: list copyRemoveAll.
            receiver = abstractSyntax emptyNode ifTrue: [ m add: selector]
                False: [ m addAll: receiver messagesToSelf].
            argumentsDo: [| :arg | m addAll: arg messagesToSelf].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'messageNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'expressionNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'messageNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
             s.
            | 
            receiver= abstractSyntax emptyNode
               ifTrue: [ s: comment forAST: true ]
               False: [ s: receiver prettyPrint ].
            ^s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         acceptChangeMethodResult: rr = ( |
             new.
             newSlot.
             result.
             theSlot.
            | 
            result: (reflect: result).

            new: slot copyHolderForRemove.
            newSlot: result at: result names first.
            newSlot: newSlot copyHolderForAnnotation: anno.
            new: new copyAddSlot: newSlot.
            enclosingObject theMirror defineAndSave: new.
            slot: enclosingObject theMirror at: newSlot name.
            theSlot: slot asNode: false.
               "abstractSyntax methodSlot: slot With: slotName Activation: false."
            theSlot setFather.
            "theSlot is an AST corresponding to the updated method"
            updateThisSlot: theSlot.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos = ( |
             newPos.
            | 
            position: pos asIsStart: self.
            newPos: position copy.
            contracted ifTrue: [ newPos: newPos add: contractionString ]
              False: [
                checkIfCodeIsParsed: method.
                newPos: doAsIsPPSlotName: newPos.
                newPos: newPos add: '='.
                newPos: newPos emitSep: method comment forAST: true.
                newPos: method asIsPP: newPos.
                newPos: newPos emitSep: comment forAST: false.
              ].
            position asIsEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> () From: ( | {
         'Comment: This message is called when the body of a 
method has been changed\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         changeMethodTo: str Editor: editor Evt: evt IfFail: fBlk = ( |
             anno.
             new.
             newSlot.
             postfix = ' |)'.
             prefix <- ''.
             result.
             rr.
             theSlot.
             txt <- ''.
            | 
            prefix: '(| ', slot longKey, ' = \n'.
            anno: slot annotation.
            "('AST methodSlot:changeMethodTo:... ' , str , 
             '\nUpdate: ' , prefix , str , postfix)  printLine."

            rr: str
              evalObjectBodyInContext: lobby asMirror
              Prefix:  '(| ', slot longKey, ' = \n'
              Postfix: ' |)'
              ReportingTo:  
                 (resultReporter copy hostMorph: editor) editor: editor.

            rr didItWork ifFalse: [
             'Parsing failed in methodSlot changemethod:... ' printLine.
             ^ self.
            ].

            [result: (prefix, str, postfix) evalIfFail: [
              |:e. begin. end|
              begin: e errorColumn pred@e errorLine pred pred.
              end:   e scannerColumn pred@e scannerLine pred pred.
              editor text selectionStart: begin End: end.
              evt sourceHand attach: (syntaxErrorMorph copyMessage: e printString).
              ^fBlk value.
            ].].

            result: (reflect: rr result).

            new: slot copyHolderForRemove.
            newSlot: result at: result names first.
            newSlot: newSlot copyHolderForAnnotation: anno.
            new: new copyAddSlot: newSlot.
            enclosingObject theMirror defineAndSave: new.
            slot: enclosingObject theMirror at: newSlot name.
            theSlot: slot asNode: false.
               "abstractSyntax methodSlot: slot With: slotName Activation: false."
            theSlot setFather.
            "theSlot is an AST corresponding to the updated method"
            updateThisSlot: theSlot.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> () From: ( | {
         'Comment: The parser from bytecode is lazy and
dont parse the code-part of a method body until
it is actually needed for pretty-printing.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         checkIfCodeIsParsed: obj = ( |
            | 
            obj body code = abstractSyntax emptyNode ifTrue: [
              obj body code: abstractSyntax 
                 codeNode: obj theMirror Activation: nil
                 Excess: (methodText copyForMethod: obj theMirror) leftExcess.
              obj body code setFather.
              obj body code father: obj body.
              ppWidth.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
             newPos.
            | 
            position: pos markStart: self.
            newPos: position copy.
            contracted ifTrue: [ newPos: newPos ,, contractionString ]
              False: [
                checkIfCodeIsParsed: method.
                newPos: doPPSlotName: newPos.
                newPos: newPos ,  '='.
                newPos: newPos addComment: comment Indent: pos Break: true.
                newPos: newPos break:0 Next: 5000 Indent: pos+2 Break: true.
                newPos: method doPP: newPos.
               ].
            position markEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isMethodSlot = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         ppWidth = ( |
            | 
            thePPWidth: 100000.
            method ppWidth.
            thePPWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceSon: oldSon With: newSon = ( |
            | 
             resend.replaceSon: oldSon With: newSon.
            method = oldSon ifTrue: [ method: newSon]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         resultReporter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> 'resultReporter' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSyntax methodSlot resultReporter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (false)'
        
         didItWork <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         editor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: InitializeToExpression: (nil)'
        
         event.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         failedInProcess: p = ( |
            | 
            "do not need this anymore, scheduler does it"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         hostMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         manifest: aMorph = ( |
            | 
            hostMorph safelyDo: [
              hostMorph isInWorld ifTrue: [ | w |
                w: hostMorph world.
                w addMorph: aMorph.  
                w moveToFront: aMorph.
              ].
            ].
            aMorph moveToPosition: hostMorph globalPosition.
            didItWork: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         result.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         succeededReturning: res = ( |
            | 
            result: res.
            didItWork: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         syntaxError: err = ( |
            | 
            manifest:  syntaxErrorMorph copyMessage: err printString.
            nil = editor  ifFalse: [
              editor text selectionStart: err start End: err end.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'numberExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos = ( |
             newPos.
             p.
            | 
            newPos: pos.
            newPos: newPos emitSep: comment forAST: true.
            position: newPos asIsStart: self.
            newPos: position copy.
            newPos: newPos copy add: theNumber.
            p: position asIsEnd: newPos.
            newPos: newPos emitSep: comment forAST: false.
            "p" newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'numberExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos WithSep: yes = ( |
             newPos.
             p.
            | 
            newPos: pos.
            yes ifTrue: [newPos: newPos emitSep: getSep].
            position: newPos asIsStart: self.
            newPos: position copy.
            newPos: newPos copy add: theNumber.
            p: position asIsEnd: newPos.
            newPos: newPos emitSep: comment forAST: false.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'numberExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         category = 'literal'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'numberExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         check: ok NotFound: notFound Ambiguous: amb = ( |
            | 
            mirrors smallInt "?").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'numberExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
            | copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'numberExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: n Sons: s = ( |
            | n value: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'numberExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
            | 
            position: pos markStart: self.
            position markEnd: (position copy , theNumber)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'numberExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isNumberExp = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'numberExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         markSelectors: blk Mirror: mirr Templates: tp = ( |
            | 
            blk value: self
                With: 'green').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'numberExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesToSelf = ( |
            | list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'numberExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'expressionNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'numberExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
            | theNumber size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'numberExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
            | 
            (comment forAST: true)
             , theNumber 
             , (comment forAST: false)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'pathWithMirror' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         slotType = ( |
             m.
             resultType.
            | 
            m: first value. "the value at the slot"
            case
               if: [ m isReflecteeSlots ] Then: [ resultType: m]
               If: [ m isReflecteeInteger ] Then: [ resultType: m]
               If: [ m isReflecteeMethod ] Then: [ resultType: m.
                 m do: [|:a . :b | 
                    a isAssignable ifTrue: [
                      b = 'returnValue' ifTrue: [^ a value.
                    ]
                   ]
                 ]]
               Else: ["('Unknown mirror: ' , selector) printLine"].
            resultType).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos = ( |
             newPos.
            | 
            position: pos asIsStart: self.
            newPos: position copy add: '('.
            newPos: body asIsPP: newPos.
            newPos: newPos add: ')'.
            position asIsEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         category = ( |
            | 'regularObject').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         check: ok NotFound: notFound Ambiguous: amb = ( |
            | 
            body check: ok NotFound: notFound Ambiguous: amb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'Comment: The parser from bytecode is lazy and
dont parse the code-part of a method body until
it is actually needed for pretty-printing.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         checkIfCodeIsParsed = ( |
            | 
            body code = abstractSyntax emptyNode ifTrue: ['parsing code' printLine.
              body code: 
                abstractSyntax codeNode: theMirror Activation: nil
                               Excess: (methodText copyForMethod: theMirror) leftExcess.
              body code setFather.
              body code father: body.
              ppWidth.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'Comment: Returns a list of mirrors of well-known
children of this object\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         children = ( |
            | 
            browseWellKnown childrenOfReflectee: theMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         contractionString = ( |
            | 
            theMirror name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             new.
            | new: copy  .
            new body: body copyDeep  .
            new body father: new  .
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: b Sons: s = ( |
            | 
            b value: self.
            s value: body.
            body doInterior: b Sons: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
             break.
             newIndent.
             newPos.
            | 
            position: pos markStart: self. 
            break: (thePPWidth + pos col) > pos width.
            newPos: position copy , '('.
            father = abstractSyntax emptyNode 
               ifTrue: [
                  newPos: newPos , contractionString.
                  newPos: newPos break: 0 Next: 0 Indent: pos Break: true.
                 ].
            newPos: body doPP: newPos.
            newPos: newPos break: 0 Next: 0 Indent: pos  Break: break.
            position markEnd: ( newPos , ')' )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPre: b = ( |
            | 
            slotList doSuffix: [ b ].
            code doSuffix: [ b ]. 
            b value: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         enclosingObject = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         findSlot: slotName = ( |
            | 
            body slotList findSlot: slotName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         hasCode = ( |
            | 
            theMirror isReflecteeMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isMethodObject = ( |
            | theMirror isReflecteeMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isObject = ( |
            | 
            theMirror isReflecteeSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'Comment: Retursn a list of mirrors of well-known
leaf-children of this object\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         leafChildren = ( |
             l.
             lc.
            | 
            lc: list copy.
            l: list copy add: theMirror.
            [ l size > 0  ] whileTrue: [| m . s|
              m: l removeFirst.
              s: browseWellKnown childrenOfReflectee: m.
              s size = 0 ifTrue: [ lc add: m . ]
                False: [ l addAll: s ]
            ].
            lc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         lookupKey: key = ( |
             p.
             p1.
            | 
            p: theMirror lookupKey: key.
            "('LookUpKey: ' , key , ' in :\n' , prettyPrint , '\n' ,
             'Size: ' , p size printString  ) printLine.
            p do: [| :e| ('Elm:' , e printString)  printLine]."
            p size = 0 
              ifTrue: [
                father isMethodSlot ifTrue:  [
                       father enclosingObject lookupKey: key
                ] False: [ 
                 ^abstractSyntax pathWithMirror copy: p Mirror: theMirror
                ]
              ] False: [
            ^abstractSyntax pathWithMirror copy: p Mirror: theMirror
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         markSelectors: blk Mirror: mirr Templates: tp = ( |
            | 
            body code expressions do: [ | :exp  |
                 exp markSelectors: blk Mirror: mirr Templates: tp
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesToSelf = ( |
            | body messagesToSelf).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'Comment: Called when the complete body of a method
has been text-edited. The default parser at node
handles expressions, only.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         parseString: str IfFail: blk = ( |
            | 
            father isMethodSlot
               ifTrue: [| prefix. postfix |
                   prefix: '(| ' , father slot longKey , ' =\n'.
                   postfix: ' |)'.
                   (prefix , str , postfix) parseObjectBodyFileName: '<text window>'
                       IfFail: [| :e | blk value: e].
                 ]
               False: [
                '???? parsing: perhaps object literal' printLine.
                str parseObjectBodyFileName: '<text window>'
                IfFail: [| :e | blk value: e].
              ].
            father
              replaceSon: self 
              With: abstractSyntax textNode copy  text: str).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
            | 
            thePPWidth: 3 + body ppWidth.
            thePPWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
             s.
            | 
            s: '(' , body prettyPrint , ')' .
            father isSlot ifFalse: ["object literal"
               s: s , (comment forAST: false) ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         sonsDo: blk = ( |
            | 
            blk value: body.
            body sonsDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'regularObject' -> () From: ( | {
         'Comment: Is called after a part of a methodbody has been
text-edited. It updates the method body of the slot.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         update: evt Editor: editor = ( |
            | 
            father isMethodSlot 
              ifTrue:  [
                " No this message is sent to the OLD AST before the method 
                  was changed. In order to get the updated method, 'father method'
                  MUST be used!"
                "('Change method: ' , father method prettyPrint) printLine."
                father changeMethodTo: father method prettyPrint
                       Editor: editor
                       Evt: evt
                       IfFail: ['Method update failed' printLine].
              ] False: [
                father isSlot ifTrue: [ 
                  'a regular object has been changed: NOT implemented!!!' printLine
                ] False: [ 
                  'Update of object literal' printLine.
                  father update: evt Editor: editor
                ]
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'resendMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         asIsPP: pos = ( |
             newPos.
            | 
            position: pos asIsStart: self.
            newPos: position copy.
            newPos: newPos add: comment forAST: true.
            newPos: newPos add: (receiver , '.') .
            newPos: message asIsPP: newPos.
            newPos: newPos emitSep: comment forAST: false.
            position asIsEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'resendMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             new.
            | 
            new: copy.
            new message: message copyDeep.
            new message father: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'resendMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: n Sons: s = ( |
            | 
            n value: self.
            s value: message.
            message doInterior: n Sons: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'resendMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
            | 
            position: pos markStart: self.
            position markEnd: (message doPP: position copy ,  receiver , '.' )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'resendMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doSons: blk = ( |
            | blk value: message).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'resendMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         markSelectors: blk Mirror: mirr Templates: tp = ( |
            | 
            message markSelectors: blk Mirror: mirr Templates: tp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'resendMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'expressionNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'resendMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
            | 
            receiver size + 1
            + message ppWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'resendMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
            | 
            receiver , '.' , message prettyPrint 
              , (comment forAST: false)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'returnExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos = ( |
             newPos.
            | 
            position: pos asIsStart: self.
            newPos: position copy.
            newPos: newPos emitSep: comment forAST: true.
            newPos: newPos add: '^'.
            newPos: newPos emitSep: expression comment forAST: true.
            newPos: expression asIsPP: position copy.
            "newPos: newPos emitSep: comment forAST: false."
            position asIsEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'returnExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         check: ok NotFound: notFound Ambiguous: amb = ( |
            | 
            expression check: ok NotFound: notFound Ambiguous: amb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'returnExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             new.
            | 
            new: copy.
            new expression: expression copyDeep.
            new expression father: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'returnExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: n Sons: s = ( |
            | 
            n value: self.
            s value: expression.
            expression doInterior: n Sons: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'returnExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
            | 
            position: pos markStart: self.
            position markEnd: (expression doPP: position copy , '^')).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'returnExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doSons: blk = ( |
            | expression doSons: [| :son | blk value: son]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'returnExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         markSelectors: blk Mirror: mirr Templates: tp = ( |
            | 
            expression markSelectors: blk Mirror: mirr Templates: tp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'returnExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesToSelf = ( |
            | expression messagesToSelf).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'returnExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'expressionNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'returnExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
            | 
            1+ expression ppWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'returnExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
            | 
            (comment forAST: true)
             . '^' , expression prettyPrint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'returnExp' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceSon: oldSon With: newSon = ( |
            | 
            resend.replaceSon: oldSon With: newSon.
            oldSon = expression ifTrue: [expression: newSon]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos = ( |
            | doPP: pos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         contractionString = ( |
            | 
            'Category: ' , categoryName , ' ...').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             new.
             newSlots.
            | 
            new: copy.
            newSlots: list copyRemoveAll.
            slots do: [| :e . e1|
               e1: e copyDeep.
               e1 father: new.
               newSlots add: e1
             ].
            new slots: newSlots.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         defaultContraction = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: n Sons: s = ( |
            | 
            n value: self.
            slots do: [| :theSlot |
               s value: theSlot.
               ].
            slots do: [| :theSlot |
               theSlot doInterior: n Sons: s
               ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
             break.
             breakIn.
             newPos.
             oldPos.
            | 
            slots isEmpty ifTrue: [position: pos. position ## pos . ^ pos ].
            position: pos markStart: self.
            contracted ifTrue: [newPos: position ,, contractionString]
              False: [
            break: (thePPWidth + pos col) > pos width.
            newPos: position copy , 'Category: ' , categoryName .  
            newPos: newPos break: 1 Next: 0  Indent: pos + 2 Break: true.
            breakIn: false.
            oldPos: newPos.
            slots doFirst: [| :n | newPos: n doPP: newPos] 
                   Middle: [| :n | 
                       newPos: newPos , '.'.
                       breakIn: newPos row > oldPos row.
                       newPos: newPos break: 1 Next: n ppWidth + 1 Indent: pos + 2 Break: break.
                       "save position before printing next slot"
                       oldPos: newPos.
                       newPos: n doPP: newPos .
                       "test if a line break was made during pp of slot.
                        If this was the case, break after next '.' "
                      ]
                   Last: [| :n |
                       newPos: newPos , '.'. 
                       breakIn: newPos row > oldPos row.
                       newPos: newPos break: 1 Next: n ppWidth + 1 Indent: pos + 2  Break: break.
                       newPos: n doPP: newPos ]
                   IfEmpty: [ ] .
            ].
            ^ position markEnd: newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         enclosingListFather = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         findSlot: slotName = ( |
            | 
            slots do: [|:s | slotName = s slotName ifTrue: [ ^s] ].
            abstractSyntax emptyNode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         insert: before At: theAST = ( |
             newExps.
             ue.
            | 
            newExps: list copy.
            ue: abstractSyntax unExpanded copy category: 'slot'.
            ue father: self.
            slots do: [| :exp|
               (theAST in: exp) ifTrue:
                  [before ifTrue: [ newExps add: ue ].
                   newExps add: exp.
                   before ifFalse: [ newExps add: ue ].
              ] False: [ newExps add: exp ].
            slots: newExps.
            self
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
             w.
            | 
            w: categoryName size.
            slots doFirst: [| :n| w: w + n ppWidth] 
                  Middle: [|:n| w: w + 2 + n ppWidth ]
                  Last: [|:n| w: w + 2 + n ppWidth] 
                  IfEmpty:[] .
            thePPWidth: w.
            thePPWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
             s <- ''.
            | 
            (slots doFirst: [| :n| s: (s , (n prettyPrint))] 
                   Middle: [|:n| s: ( s , '. ' , (n prettyPrint)) ]
                   Last: [|:n| s: (s,'. ',(n prettyPrint))] 
                   IfEmpty:[^'| |']) .
            ^ s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceSon: oldSon With: newSon = ( |
             newExps.
            | 
            resend.replaceSon: oldSon With: newSon.
            newExps: list copy.
            slots do: [| :son |
               son = oldSon ifTrue: [ newExps add: newSon ]
                            False: [ newExps add: son]
               ].
            slots: newExps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         sonsDo: blk = ( |
            | 
            slots do: [| :theSlot | blk value: theSlot ].
            slots do: [| :theSlot |  theSlot sonsDo: blk ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotCategory' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         subListCategory = ( |
            | 
            'Slot').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         asIsPP: pos = ( |
             newPos.
            | 
            newPos: 
               doPP: pos
               Start: [| :pos | pos asIsStart: self]
               PP: [| :n. :newPos. oldIndent. np | 
                    oldIndent: newPos indent.
                    newPos indent: newPos indent + (newPos col + 2). 
                    np: n asIsPP: newPos.
                    np indent: oldIndent.
                    np.]
               End: [| :position. :newPos | position asIsEnd: newPos].
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         category = 'slotList'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             new.
             newSlots.
            | 
            new: copy.
            newSlots: list copyRemoveAll.
            slots do: [| :e . e1|
               e1: e copyDeep.
               e1 father: new.
               newSlots add: e1
             ].
            new slots: newSlots.
            categories != nil ifTrue: [| newCats |
               newCats: list copy removeAll.
               categories do: [| :c. c1 |
                  c1: c copyDeep.
                  c1 father: new.
                  newCats add: c1.
               ].
               new categories: newCats.
             ].
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'Category: Iterators\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: n Sons: s = ( |
            | 
            n value: self.
            categories != nil ifTrue: [
               categories do: [| :c | s value: c]].
            slots do: [| :theSlot |
               s value: theSlot.
               ].
            categories != nil ifTrue: [
               categories do: [| :c |c doInterior: n Sons: s]].
            slots do: [| :theSlot |
               theSlot doInterior: n Sons: s
               ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
             break.
             breakIn.
             newPos.
             oldPos.
            | 
            newPos: 
               doPP: pos 
               Start: [| :pos | pos markStart: self]
               PP: [| :n. :newPos|  n doPP: newPos]
               End: [| :position. :newPos | position markEnd: newPos].
            newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         doPP: pos Start: start PP: pp End: end = ( |
             break.
             breakIn.
             newPos.
             oldPos.
            | 
            slots isEmpty && [ categories = nil ] ifTrue: [position: pos. position ## pos . ^ pos ].
            position: "pos markStart: self. " start value: pos.
            break: ((thePPWidth + pos col) > pos width) || [ enclosingObject isObject].
            breakIn: false.
            newPos: position copy , '| '.
            categories != nil ifTrue: [ 
                 categories do: [|:c| 
                   newPos: "c doPP: newPos." pp value: c With: newPos.
                   newPos: newPos break: 1 Next: 0  Indent: pos + 2 Break: true.
              ]].
            oldPos: newPos.
            slots doFirst: [| :n | newPos: "n doPP: newPos" pp value: n With: newPos] 
                  Middle: [| :n | 
                       newPos: newPos , '.'.
                       breakIn: newPos row > oldPos row.
                       newPos: newPos break: 1 Next: n ppWidth + 1 Indent: pos + 2 Break: break.
                       "save position before printing next slot"
                       oldPos: newPos.
                       newPos: "n doPP: newPos ." pp value: n With: newPos.
                       "text if a line break was made during pp of slot.
                        If this was the case, break after next '.' "
                      ]
                  Last: [| :n |
                       newPos: newPos , '.'. 
                       breakIn: newPos row > oldPos row.
                       newPos: newPos break: 1 Next: n ppWidth + 1 Indent: pos + 2  Break: break.
                       newPos: "n doPP: newPos" pp value: n With: newPos ]
                  IfEmpty:[pos].
            slots isEmpty ifFalse: [ newPos: newPos break: 1 Next: 0 Indent: pos  Break: break].
            ^ "position markEnd: (newPos , '|' )" end value: position With: (newPos , '|' )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'Category: Iterators\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         doSelection: blk Start: start End: end = ( |
             doIt <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            (nil = start) || [nil = end] ifTrue: [
               blk value: self
             ] False: [
               slots do: [|:s | 
                doIt ifTrue: [ blk value: s].
                (s = start) || [s = end] ifTrue: [ doIt: doIt not ].
                doIt ifTrue: [ blk value: s].
            ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         enclosingListFather = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         findSlot: slotName = ( |
            | 
            slots do: [|:s | slotName = s slotName ifTrue: [ ^s] ].
            categories != nil ifTrue: [
               categories do: [| :c . s |  
                  s: c findSlot: slotName.
                  s != abstractSyntax emptyNode ifTrue: [ ^s ]
               ]].
            abstractSyntax emptyNode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         insert: before At: theAST = ( |
             newExps.
             ue.
            | 
            newExps: list copy.
            ue: abstractSyntax unExpanded copy category: 'slot'.
            ue father: self.
            slots do: [| :exp|
               (theAST in: exp) ifTrue:
                  [before ifTrue: [ newExps add: ue ].
                   newExps add: exp.
                   before ifFalse: [ newExps add: ue ].
              ] False: [ newExps add: exp ].
            slots: newExps.
            self
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         nl = ( |
            | 
            enclosingObject isObject 
               ifTrue: ['\n']
               False: ['']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
             w.
            | 
            w: 0.
            nil != categories ifTrue: 
                [ categories do: [| :c | w: w + c ppWidth]].
            slots doFirst: [| :n| w: w + n ppWidth] 
                  Middle: [|:n| w: w + 2 + n ppWidth ]
                  Last: [|:n| w: w + 2 + n ppWidth] 
                  IfEmpty:[].
            thePPWidth: w + 2.
            thePPWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
             s <- ''.
            | 
            slots isEmpty && [ categories = nil ] ifTrue: [ ^'' ].
            s: '| ' .
            categories != nil ifTrue: [
               categories do: [| :c| s: s , '\nCategory:', c categoryName , '\n',
                       c prettyPrint ,'\n'  ].].
            (slots doFirst: [| :n| s: (s , (n prettyPrint))] 
                   Middle: [|:n| s: ( s , '. ' , nl , (n prettyPrint)) ]
                   Last: [|:n| s: (s,'. ' , nl ,(n prettyPrint))] 
                   IfEmpty:[]) .
            ^ s ,  ' | ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceSon: oldSon With: newSon = ( |
             newExps.
            | 
            resend.replaceSon: oldSon With: newSon.
            newExps: list copy.
            slots do: [| :son |
               son = oldSon ifTrue: [ newExps add: newSon ]
                            False: [ newExps add: son]
               ].
            slots: newExps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'Category: Iterators\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         sonsDo: blk = ( |
            | 
            categories != nil ifTrue: [
               categories do: [| :c | blk value: c]].
            slots do: [| :theSlot | blk value: theSlot ].
            categories != nil ifTrue: [
               categories do: [| :c |c sonsDo: blk]].
            slots do: [| :theSlot |  theSlot sonsDo: blk ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         subListCategory = ( |
            | 
            'Slot').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isSlot = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotNode' -> () From: ( | {
         'Category: Parsing\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parseString: str IfFail: blk = ( |
             first <- bootstrap stub -> 'globals' -> 'true' -> ().
             holder.
             mirr.
             new.
             slotAST.
            | 'parsing slot' printLine.
            mirr: reflect: ('(| ' , str , ' |)') evalIfFail: [|:e| blk value: e].
            "mirr: parseUsingProcess: str IfFail: [|:e| blk value: e]."
            holder: slot holder. "mirrors slots of enclosing object"
            new: slot copyHolderForRemoveIfFail:
               [|:e| 'copyHolderForRemove failed' printLine. e printLine].
            mirr size = 0 ifTrue: [" the slot has been deleted"
                 holder defineAndSave: new.
                 father slots remove: self
                              IfAbsent: ['slot absent in father slots?' printLine]
              ] False: [ "mirr size > 0 "
                mirr do: [| :s. n |
                 new: new copyAddSlot: 
                         (s copyHolderForAnnotation: slot annotation
                           IfFail: [|:e| 'copyHolderForAnn failed' printLine. e printLine])
                      IfFail: [|:e| 'copyAddSlot failed' printLine e printLine.].
                 holder defineAndSave: new 
                    IfFail: [|:e| 'Update failed' printLine. e printLine.].
                 n: s asNode: nil.
                 nil = n ifFalse: [
                   slotAST: n.
                   slotAST setFather.
                   slotAST prettyPrint printLine.
                   first ifTrue: [ father replaceSon: self With: slotAST . first: false]
                         False: [ father slots add: slotAST].
                   slotAST slot: holder slotAt: mirr first name.
               ]]].
            enclosingObject theMirror: holder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotNode' -> () From: ( | {
         'Category: Parsing\x7fComment: This is just an alternative method for parsing \'str\'.
It may be called from parseString:IfFail. It
parses the same way as is done in traits slotOutliner.
parseString:IfFail uses evalIfFail:.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         parseUsingProcess: str IfFail: blk = ( |
             holder.
             mess.
             mirr.
             new.
             p.
            | 

            mirr: 
              ('(| ' , str , ' |)') asObjectFileName: '<text window>'
                       IfFail: [| :e | blk value: e ].

            mess: message copy receiver: (reflect: lobby)
                               Selector: 'evaluate:'
                                   With: mirr.
            p: process copySend: mess.
            p causeOfBirth: 'ui2 parsing'.
            p resume.
            p waitForSuspension.
            p causeOfDeath != 'terminated' ifTrue: [
               p causeOfError errorString printLine.
               ^blk value].
            mirr: (reflect: p returnValue).
            mirr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         superCategory = 'slot'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'slotNode' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         update: evt Editor: editor = ( |
            | 
            'a slot has been text-edited' printLine.
            [changeMethodTo: method prettyPrint 
                Editor: editor
                Evt: evt
                IfFail: ['Update failed' printLine]].
            "father"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unExpanded' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos = ( |
             newPos.
             p.
            | 
            position: pos asIsStart: self.
            newPos: position copy.
            newPos: newPos emitSep: comment forAST: true.
            newPos: newPos add: ('\'<' , category , '>\'').
            p: position asIsEnd: newPos.
            newPos: newPos emitSep: comment forAST: false.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unExpanded' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPP: pos WithSep: yes = ( |
             newPos.
             p.
            | 
            newPos: pos.
            yes ifTrue: [newPos: newPos emitSep: getSep].
            position: newPos asIsStart: self.
            newPos: position copy add: ('\'<' , category , '>\'').
            p: position asIsEnd: newPos.
            newPos: newPos emitSep: comment forAST: false.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unExpanded' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: n Sons: s = ( |
            | n value: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unExpanded' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
            | 
            position: pos markStart: self.
            position markEnd: position copy , ' \'<' , category , '>\' ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unExpanded' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isUnexpanded = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unExpanded' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         markSelectors: blk Mirror: mirr Templates: tp = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unExpanded' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'node' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unExpanded' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
            | category size + 4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unExpanded' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
            | 
            (comment forAST: true)
             , ' \'<' , category , '>\' '
             , (comment forAST: false)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentsDo: blk = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         asIsPPSelectorAndArgs: pos = ( |
            | 
            pos add: unarySend).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         asIsPPXX: pos WithSep: yes = ( |
             newPos.
             p.
             s.
            | 
            newPos: asIsPPInit: pos WithSep: yes. 
            newPos: newPos add: unarySend.
            p: position asIsEnd: newPos.
            newPos: newPos emitSep: comment forAST: false.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         asIsPPxxx: pos = ( |
            | 
            asIsPP: pos WithSep: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         category = 'unaryMessage'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             new.
            | 
            new: copy.
            new receiver: receiver copyDeep.
            new receiver father: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: b Sons: s = ( |
            | 
            "'In unary msg' printLine."
            b value: self.
            receiver = abstractSyntax emptyNode ifFalse: [
               s value: receiver .
               receiver doInterior: b Sons: s.
               ].
            "unarySend ...").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPP: pos = ( |
             newPos.
            | 
            position: pos markStart: self.
            newPos: position copy.
            receiver= abstractSyntax emptyNode
               ifTrue: [ newPos: newPos , unarySend ]
               False: [ newPos: receiver doPP: newPos.
                newPos: newPos break: 1 Next: unarySend size Indent: pos + 2 Break: false.
                newPos: newPos, unarySend 
               ].
            position markEnd: newPos.
            ^newPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'messageNode' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         ppWidth = ( |
            | 
            thePPWidth:( receiver= abstractSyntax emptyNode
               ifTrue:[unarySend size]
               False:[receiver ppWidth + 1 +  unarySend size]).
            thePPWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
             s.
            | 
            s: resend.prettyPrint. 
            s: s , unarySend , (comment forAST: false).
            ^s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceSon: oldSon With: newSon = ( |
            | 
            resend.replaceSon: oldSon With: newSon.
            receiver = oldSon ifTrue: [ receiver: newSon]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unaryMessage' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         selector = ( |
            | unarySend).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         category = ( |
            | 
            'slot').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         contractionString = ( |
            | slotName , ' ...').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDeep = ( |
             new.
            | 
            new: copy.
            new regularObject: regularObject copyDeep.
            new regularObject father: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         defaultContraction = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         doAsIsPPSlotName: pos = ( |
            | 
            pos add: slotName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doInterior: n Sons: s = ( |
            | 
            n value: self.
            s value: regularObject.
            regularObject doInterior: n Sons: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doPPSlotName: pos = ( |
            | pos , slotName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         doSons: blk = ( |
            | 
            regularObject doSlots: [| :son | blk value: son. son doSons: blk]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         isArgument = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         method = ( |
            | regularObject).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'Category: Structure\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         method: m = ( |
            | regularObject:m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'methodSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrint = ( |
            | 
            checkIfCodeIsParsed: method.
             slotName , '=' 
            , regularObject prettyPrint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         updateThisSlot: newSlot = ( |
            | 
            regularObject: newSlot regularObject.
            regularObject father: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSyntax' -> 'unarySlot' -> () From: ( | {
         'ModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: private'
        
         useStructureEditorOnMethods <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: abstract syntax\x7fComment: Redefined for
   traits mirrors slots
   traits mirrors method
   traits mirrors blockmethodActivation
See methods in 
   \'abstractSyntax\' category: \'Mirror unparsing\'\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         makeAST = ( |
            | 
            abstractSyntax instance copy theInstance: self value reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: abstract syntax \x7fComment: Return an AST where the code part of this method
is NOT parsed. 
Calling makeASTWithCode: true will enforce parsing
of the code part.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         makeAST = ( |
            | 
            makeASTWithCode: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: abstract syntax \x7fComment: Constructs an AST for the method reflected by self.
For efficiency reasons, the code part is only parsed
on demand. I.e. when pretty printing in the strcutureEditor
or elsewhere. If yes=true, then parsing of the code is enforced.
-- Olm, 1/4/95\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         makeASTWithCode: yes = ( |
             theAST.
            | 
            theAST: abstractSyntax methodNode: self Activation: nil.
            yes ifTrue: [theAST checkIfCodeIsParsed].
            theAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'slots' -> () From: ( | {
         'Category: abstract syntax\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         makeAST = ( |
            | 
            abstractSyntax objectNode: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'argument' -> () From: ( | {
         'Category: abstract syntax\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         asNode: isActivation = ( |
             slotKind.
             theSlot.
             v.
            | 
            nil = isActivation
                ifTrue: [ v: abstractSyntax emptyNode. slotKind: '' ]
                False: [
                  v: abstractSyntax makeASTfromMirror: value.
                   slotKind: '='
                ] .
            theSlot: 
              (((abstractSyntax dataSlot copy slotName: key) expression: v) 
                      isArgument: true) slotKind: slotKind .
            theSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'method' -> () From: ( | {
         'Category: abstract syntax\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         asNode: isActivation = ( |
             args.
             ast <- bootstrap stub -> 'globals' -> 'abstractSyntax' -> ().
             methodBody.
             methodSlot.
             s.
             slotList.
            | 
            s: selector copyStr: key.
            case
              if: [ s isBinary ] Then: [
                  methodSlot: ast binarySlot copy operator: key .
                  methodBody: ast methodNode: value Activation: isActivation.
                  slotList: methodBody body slotList slots .
                  slotList do: [|:aSlot| aSlot isArgument ifTrue: [ aSlot isArgument: false. args: aSlot ]].
                  slotList remove: args.
                  methodSlot argument:args .
                  methodSlot regularObject: methodBody
                  ]
               If:[ s isUnary] Then: [
                  methodSlot: 
                     (ast unarySlot copy slotName: key) 
                       regularObject: ast methodNode: value Activation: isActivation.
                  ]
               If: [ s isKeyword ] Then: [
                  args: list copy.
                  methodSlot: (ast keywordSlot copy selector: key).
                  methodBody: ast methodNode: value Activation: isActivation.
                  slotList: methodBody body slotList slots .
                  slotList do: [| :aSlot| aSlot isArgument ifTrue: [ aSlot isArgument: false. args add: aSlot ]].
                  args do: [| :elem| slotList remove: elem].
                  methodSlot arguments: args.
                  methodSlot method: methodBody 
                  ].
            methodSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'parent' -> () From: ( | {
         'Category: abstract syntax\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         asNode: isActivation = ( |
             ast = bootstrap stub -> 'globals' -> 'abstractSyntax' -> ().
            | 
            (((ast dataSlot copy slotName: key) 
                 expression: ast instance copy theInstance: value reflectee) 
                    isParent: true)
                       slotKind: '=').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slots' -> 'plain' -> () From: ( | {
         'Category: abstract syntax\x7fComment: Create an AST-node corresponding to a data slot.
Special methods in traits slots: argument, method and parent.\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         asNode: isActivation = ( |
             ast = bootstrap stub -> 'globals' -> 'abstractSyntax' -> ().
             slotKind.
             theSlot.
            | 
            case
             if: [ isAssignable] Then: [| val . exp |
                 val: value reflectee. 
                 nil = val ifTrue: [ exp: ast emptyNode. slotKind: ''] 
                         False: [exp: ast instance copy theInstance: val . slotKind: '<-'].
                 theSlot: ((ast dataSlot copy slotName: key) expression: exp) slotKind: slotKind
                ]
             If: [ isAssignment] Then: [  ]
             If: [ isVectorElement] Then: [ 'vector element' printLine ]
             Else: [ 
                theSlot: (ast dataSlot copy slotName: key) slotKind: '='.
                "Create an AST for the object of the dataSlot, if the dataSlot is the creator slot.
                 Note: the following test may not be the best/most efficient?
                 Note: will loop if there are loops in creator slot."
                value creatorSlotIfPresent: [ | :cs | 
                    = cs ifTrue: [ theSlot expression: ast makeASTfromMirror: value ]
                         False: [ theSlot expression: ast instance copy theInstance: value reflectee ]
                 ] IfAbsent: [ theSlot expression: ast instance copy theInstance: value reflectee ] .
              ].
            theSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: abstract syntax\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         copyWithBlanks = ( |
             i <- 0.
             s.
             stop <- bootstrap stub -> 'globals' -> 'false' -> ().
             t.
            | 
            s: forAST: true.
            s reverseDo: [|:c|
              '\n' = c ifTrue: [ stop: true].
              stop ifFalse: [ i: i + 1 ]
              ].
            t: '' copySize: i FillingWith: ' '.
            s: ''.
            reverseDo: [|:c|
              c = '.' ifTrue: [ s: '.' , s].
              c = '\n' ifTrue: [s: '\n' , s ].
              c = '#' ifTrue: [ ^t , '#' , s ]
            ].
            t , '#').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: abstract syntax\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         forAST: before = ( |
             s <- ''.
            | 
            0 to: size - 1 Do: [|:i . ch|
              ch: at: i.
              ch = '#' 
                 ifTrue: [
                    before ifTrue: [^s]
                           False: [s: '']
                 ] False: [ s: s , ch ]
            ].
            ^s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: abstract syntax\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         forASTTrail = ( |
             inCom <- bootstrap stub -> 'globals' -> 'false' -> ().
             pos.
            | 
            0 to: size - 1 Do: [|:i. ch |
              ch: at: i.
              (ch ='#') || [ ch =')' ] ifTrue: [inCom ifFalse: [pos: i]].
              ch ='"' ifTrue: [ inCom: inCom not .]
            ].
            copyFrom: 0 UpTo: pos+1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: abstract syntax\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         getComment: before = ( |
             inC <- bootstrap stub -> 'globals' -> 'false' -> ().
             s <- ''.
            | 
            0 to: size - 1 Do: [| :i. ch  |
              ch: at: i.
              case 
                if: [ch = '#'] Then: [
                    before ifTrue: [^s] False: [s: '']]
                If: [ch = '.'] Then: [s: s , '.']
                If: [ch = '"'] Then: [ 
                     inC ifTrue: [s: s , '" '. inC: false]
                         False: [s: s , ' "'. inC: true]
                  ]
                Else: [inC ifTrue: [ s: s , ch]]
             ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: abstractSyntax\x7fComment: Self is supposed to be a Self expression, like:
   \'hest fisk ifTrue: [ flaeskesteg ] \'.
Self is parsed into an abstract syntax tree.
A succesfull result is an instance of
   abstractSyntax code.
In general, Self may be a list of expressions like:
   \'e1. e2. e3\'
-- Olm, 1/4/95\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         parseObjectBody2ASTIfFail: blk = ( |
             mirr.
             theAST.
            | 
            mirr: parseObjectBodyIfFail: blk.
            theAST: mirr makeASTWithCode: true.
            theAST isMethodObject ifTrue: [
                ^ theAST body code
              ] False: [ blk value].
            abstractSyntax emptyNode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: abstract syntax\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot'
        
         skipExcess: excess After: isAfter = ( |
             all.
             i <- 0.
             s.
            | 
            all: isAfter.
            s: ''.
            do: [|:c|
                i: i + 1 .
                (i > excess) || all ifTrue: [ s: s , c ].
                c = '\n' ifTrue: [ 
                   (i <= excess) && [ all not ] ifTrue: [ s: s , c].
                   i: 0. 
                   all: false.
                ].
            ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textLines' -> () From: ( | {
         'Category: modifying\x7fCategory: abstract syntax\x7fComment: Same code as in leftShrinkwrap;
perhaps leftExcess should be used in
leftShrinkwrap?
-- Olm, 1/23/95\x7fModuleInfo: Module: abstractSyntax InitialContents: FollowSlot\x7fVisibility: public'
        
         leftExcess = ( |
             excess <- 536870911.
             ok <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            lines isEmpty ifTrue: [^0].
            lines asVector do: [|:line. :i.|
                (shrinkLine: i) && [line isAllWhiteSpace not] ifTrue: [
                    excess: excess min: line leadingSpaces.
                    ok: true.
                 ].
            ].
            ok ifTrue: [  ^excess ] False: [ ^0]).
        } | ) 



 '-- Side effects'

 globals modules abstractSyntax postFileIn
