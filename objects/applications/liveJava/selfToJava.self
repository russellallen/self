 '$Revision: 1.2 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: public'
        
         selfASTToJavaConverter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava selfASTToJavaConverter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: InitializeToExpression: (nil)'
        
         inputAST.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: InitializeToExpression: (nil)'
        
         outputAST.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava selfASTToJavaConverter parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert = ( |
            | 
            outputAST: inputAST mapSubnodesBy: [|:nodeToConvert. :parentNode| convertNode: nodeToConvert In: parentNode]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertArgumentsOfSend: n = ( |
             argExprs.
             args.
             lastArt.
             lastExpr.
            | 
            argExprs: n arguments asVector copyMappedBy: [|:a| convertExpression: a In: n].
            args: argExprs copyMappedBy: [|:e. :i|
              i = argExprs lastKey  ifFalse: [jpns argument copyExpression: e Comma: tokenFromSource: ',']
                                       True: [jpns argument copyExpression: e]
            ].
            jpns argumentList copyOpen: (tokenFromSource: '(') Arguments: args Close: tokenFromSource: ')').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertExplicitRcvrSend: n Selector: str = ( |
            | 
            jpns postfixExpression 
              copyExpression: (convertExpression: n receiver In: n)
                    Operator:
                      jpns messageSelector 
                        copyDot: (tokenFromSource: '.') 
                           Name: (selectorIdentifierToken: str)
                      Arguments: convertArgumentsOfSend: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertExpression: n In: parentNode = ( |
            | 
            n isSelfObject
             ifTrue: [convertSubexpression: n]
              False: [convertNode: n In: parentNode]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertExpressionStatement: n In: parentNode = ( |
            | 
            jpns expressionStatement
             copyExpression: (convertExpression: n In: parentNode)
                  Semicolon: tokenFromSource: ';').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertFormalParametersOf: n = ( |
             formals.
            | 
            formals: list copyRemoveAll.
            n slotListIfPresent: [|:sl|
              sl slotsWithAnnotationsDo: [
                |:s| 
                s isArgument ifTrue: [
                  formals addLast: 
                    jpns formalParameter
                      copyType: makeTypeNode
                          Name: (tokenFromSource: s nameNode nameToken value)
                       Squares: vector.
                ]
              ]
            ]
            IfAbsent: [].

            jpns formalParameterList
               copyLeft: ( tokenFromSource: '(')
                Formals: formals
                  Right: tokenFromSource: ')').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertIfStatement: ifExpr Then: selfThenArg Else: selfElseArg = ( |
             ifPart.
            | 
            ifPart: jpns parenList copyOpen: (tokenFromSource: '(') InBrackets: ifExpr Close: tokenFromSource: ')'.
            selfElseArg ifNil: [
              jpns ifStatement
                         copyIf: (tokenFromSource: 'if')
              ConditionInParens: ifPart
                           Then: convertSelfExprToJavaBlock: selfThenArg
            ]
            IfNotNil: [ 
              jpns ifStatement
                         copyIf: (tokenFromSource: 'if')
              ConditionInParens: ifPart
                           Then: (selfThenArg ifNotNil: [convertSelfExprToJavaBlock: selfThenArg]
                                              IfNil:    [jpns block 
                                                            copyOpenCurly: (tokenFromSource: '{')
                                                           StatementNodes: vector
                                                               CloseCurly: tokenFromSource: '}'
                                                        ])
                    ElseKeyword: (tokenFromSource: 'else')
                  ElseStatement:  convertSelfExprToJavaBlock: selfElseArg
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertIfTrueFalse: n ParentNode: parentNode Or: notIfBlock = ( |
             cond.
             else.
             ss.
             then.
            | 
            ss: n selectorString.
                (ss = 'ifTrue:')
            || [(ss = 'ifFalse:')
            || [(ss = 'ifTrue:False:')
            || [ ss = 'ifFalse:True:']]]
              ifFalse: [^ notIfBlock value].

            n arguments 
              findFirst: [|:a| a isSelfBlock not]
              IfPresent: [[todo unimplemented]. "should just add a send of value" ^ notIfBlock value]
               IfAbsent: [].

            cond: convertExpression: n receiver In: n.
            then: n arguments first.
            n arguments size > 1 ifTrue: [ else: n arguments last ].

            ('ifFalse' isPrefixOf: ss) ifTrue: [|x|
              x: then. then: else.  else: x
            ].

            parentNode consumesJavaValue ifTrue: [
              convertQuestionColonE1: cond E2: then E3: else
            ]
            False: [ 
              convertIfStatement: cond Then: then Else: else
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertImplicitSelfSend: n Selector: str = ( |
            | 
            jpns methodInvocation
               copyName: (jpns nameNode copyForName: selectorIdentifierToken: str)
              Arguments: convertArgumentsOfSend: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot'
        
         convertInitializedSlot: n = ( |
            | 
            n assignmentAndValueIfPresent: [
            |:asg. :val|
            val isSelfMethod ifTrue: [todo unimplemented "need a closure?"].

            jpns varDclsStatement
              copyModifiers: (asg value = '=' 
                                ifTrue: [vector copyAddLast: tokenFromSource: 'final']
                                 False: nil)
                       Type: makeTypeNode
                Declarators: (vector copyAddLast:
                                jpns variableDeclarator 
                                  copyName: (tokenFromSource: n nameNode selectorString) 
                                   Squares: vector
                                    Equals: (tokenFromSource: '=')
                               Initializer: jpns scalarInitializer copyExpression: convertExpression: val In: n.
                 )
                  Semicolon: tokenFromSource: ';'
            ]
            IfAbsent: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertMethodBody: anExpressionSeriesNode = ( |
             exprs.
             lastExpression.
            | 
            exprs: anExpressionSeriesNode subnodes copy.
            lastExpression: exprs removeLast.
                         (exprs asVector copyMappedBy: [|:e| convertExpressionStatement: e In: anExpressionSeriesNode])
            copyAddLast: convertReturnStatement: lastExpression In: anExpressionSeriesNode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertNode: n In: parentNode = ( |
            | 
            'convert_', n nodeTypeName, ':In:' sendTo: self With: n With: parentNode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertPrefixExpression: aSend Operator: op = ( |
            | 
            jpns prefixExpression
              copyOperator: ("operator token" tokenFromSource: op)
                Expression: convertExpression: aSend receiver In: aSend).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertQuestionColonE1: e1 E2: e2OrNil E3: e3OrNil = ( |
            | 
            jpns expressionIf copyE1: e1
                            Question: (tokenFromSource: '?')
                                  E2: (e2OrNil ifNil: [jpns nameNode copyForName: tokenFromSource: 'nil']
                                            IfNotNil: [convertSelfBlockToJavaExpression: e2OrNil])
                               Colon: (tokenFromSource: ':')
                                  E3:  e3OrNil ifNil: [jpns nameNode copyForName: tokenFromSource: 'nil']
                                            IfNotNil: [convertSelfBlockToJavaExpression: e3OrNil]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertReturnStatement: n In: parentNode = ( |
            | 
            jpns returnStatement 
                        copyReturn: (tokenFromSource: 'return')
                        Expression: (convertExpression: n In: jpns returnStatement)
                         Semicolon: tokenFromSource: ';').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot'
        
         convertSelfBlockToJavaExpression: n = ( |
            | 
            n isSelfBlock ifFalse: [
              todo unimplemented. "must add value send"
            ].
            n slotListIfPresent: [|:sl|
              todo unimplemented. "will need a closure, of at least dcls"
            ] IfAbsent: [].
            n bodyIfPresent: [|:exprs|
              exprs subnodeCount > 1 ifTrue: [todo unimplemented. need closure].
              ^ convertExpression: exprs firstSubnode In: exprs
            ] IfAbsent: [todo unimplemented]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertSelfExprToJavaBlock: n = ( |
            | 
            n ifNil: [^ n].
            n isSelfBlock
              ifTrue: [ convertSlotsAndBody: n ]
               False: [ todo unimplemented "need to insert send of value"]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertSend: n Selector: str = ( |
            | 
            n receiver isSelfImplicitSelf
              ifTrue: [convertImplicitSelfSend: n Selector: str]
               False: [convertExplicitRcvrSend: n Selector: str]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertSlotList: n = ( |
             r.
            | 
            r: list copyRemoveAll.
            n slotsWithAnnotationsDo: [|:sl. :anno|
              anno isEmpty ifFalse: [todo unimplemented carry annotations as comments maybe].
              r addLast:
                sl assignmentAndValueIfPresent: [convertInitializedSlot:   sl]
                                      IfAbsent: [convertUninitializedSlot: sl].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertSlotsAndBody: n = ( |
             body.
             close.
             dcls.
             open.
            | 
            open:  tokenFromSource: '{'.
            close: tokenFromSource: '}'.
            dcls: n slotListIfPresent: [|:sl| convertSlotList: sl] IfAbsent: vector.
            body: n     bodyIfPresent: [|:b| convertMethodBody: b] IfAbsent: vector.
            jpns block copyOpenCurly: open
                      StatementNodes: (dcls & body) flatVector
                          CloseCurly: close).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertSubexpression: n = ( |
            | 
            n slotListIfPresent: [todo unimplemented "object literals"]
                        IfAbsent: [].
             n bodyIfPresent: [|:exprSeries|
                                exprSeries subnodeCount = 1 ifFalse: [error: 'subexpressions should not have periods in them'].
                                convertExpression: exprSeries firstSubnode In: exprSeries]
                   IfAbsent:  [ jpns newInstance copyNew: (tokenFromSource: 'new') 
                                                    Type: makeTypeNode
                                               Arguments: jpns argumentList copyOpen: (tokenFromSource: '(' )
                                                                           Arguments: vector
                                                                               Close: tokenFromSource: ')' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convertUninitializedSlot: n = ( |
            | 
            jpns varDclsStatement
              copyModifiers: nil
                       Type: makeTypeNode
                Declarators: (vector copyAddLast:
                                jpns variableDeclarator 
                                  copyName: (tokenFromSource: n nameNode selectorString) 
                                   Squares: vector)
                  Semicolon: tokenFromSource: ';').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert_binarySend: n In: parentNode = ( |
             arg.
             jsel.
            | 

            jsel: javaBinarySelectors
                    at: n selectorString
                    IfAbsent: [|:k| ^ convertSend: n Selector: identifiersForBinaries at: k
                                                                                IfAbsent: [todo unimplemented converting unknown binary]].

            arg: (jsel = '&&') || [jsel = '||']
                  ifTrue: [ convertSelfBlockToJavaExpression: n arguments first ]
                   False: [ convertExpression:                n arguments first In: n ].  

            jpns infixExpression copyExpression: (convertExpression: n receiver In: n)
                                       Operator: "javaParser lexer tokens operator"
                                                  (tokenFromSource: jsel)
                                     Expression:  arg).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert_block: n In: parentNode = ( |
            | 
            jpns closure copyResultType: makeTypeNode
                           ArgumentList: (convertFormalParametersOf: n)
                                  Block: convertSlotsAndBody: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot'
        
         convert_expressionSeries: n In: parentNode = ( |
            | 
            todo unimplemented may not be needed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert_float: n In: parentNode = ( |
            | 
            tokenFromSource: n value storeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert_implicitSelf: n In: parentNode = ( |
            | 
            tokenFromSource: 'this').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert_integer: n In: parentNode = ( |
            | n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert_keywordSend: n In: parentNode = ( |
            | 
            convertIfTrueFalse: n 
                    ParentNode: parentNode
                            Or: [ convertSend: n
                                     Selector: translateKeywordSelector: n selectorString ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert_method: n In: parentNode = ( |
            | 
            convertSlotsAndBody: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert_node: n In: parentNode = ( |
            | n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert_object: n In: parentNode = ( |
            | 
            todo unimplemented).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert_pop: n In: parentNode = ( |
            | 
            convertExpression: n expression In: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert_receiver: n In: parentNode = ( |
            | 
            n source = 'self' ifFalse: [todo unimplemented does this ever happen].
            tokenFromSource: 'this').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert_return: n In: parentNode = ( |
            | 
            convertReturnStatement: n expression In: parentNode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert_string: n In: parentNode = ( |
            | 
            "javaParser lexer tokens stringLiteral"
            tokenFromSource: translateToJavaStringLiteral: n value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert_token: n In: parentNode = ( |
            | 
            halt. tokenFromSource: n source).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert_unarySend: n In: parentNode = ( |
            | 
            prefixOperatorsForUnarySelectors
              if: n selectorString 
                IsPresentDo: [|:op| convertPrefixExpression: n Operator: op ]
                 IfAbsentDo: [|:ss| convertSend: n Selector: ss ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAndConvert: anAST = ( |
            | 
            "add dummy parent for conversion, 'cause it needs the parent node"
            (copy inputAST: jpns node copy addSubnode: anAST) convert outputAST firstSubnode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         identifiersForBinaries = bootstrap setObjectAnnotationOf: ( [|d|
	d: dictionary copyRemoveAll.
	d at: ('#!') Put: ('oldStyleRectangleTo').
	d at: ('##!') Put: ('oldStyleRectangleExtent').
	d at: ('##') Put: ('rectangleExtent').
	d at: ('#') Put: ('rectangleTo').
	d at: ('%+') Put: ('modulusUp').
	d at: ('%-') Put: ('modulusDown').
	d at: ('/+') Put: ('divideUp').
	d at: ('/-') Put: ('divideDown').
	d at: ('/=') Put: ('divideExactly').
	d at: ('/~') Put: ('divideAndRound').
	d at: ('<+') Put: ('shiftLeftArithmetic').
	d at: ('@') Put: ('at').
	d at: ('@@') Put: ('pointExtent').
] value) From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava selfASTToJavaConverter parent identifiersForBinaries.

CopyDowns:
globals set. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         javaBinarySelectors = bootstrap setObjectAnnotationOf: ( [|d|
	d: dictionary copyRemoveAll.
	d at: ('!=') Put: ('!=').
	d at: ('!==') Put: ('!=').
	d at: ('%') Put: ('%').
	d at: ('&&') Put: ('&&').
	d at: ('&') Put: ('&').
	d at: ('*') Put: ('*').
	d at: ('+') Put: ('+').
	d at: ('+>') Put: ('>>').
	d at: (',') Put: ('+').
	d at: ('-') Put: ('-').
	d at: ('/') Put: ('/').
	d at: ('<') Put: ('<').
	d at: ('<<') Put: ('<<').
	d at: ('<=') Put: ('<=').
	d at: ('=') Put: ('==').
	d at: ('==') Put: ('==').
	d at: ('>') Put: ('>').
	d at: ('>=') Put: ('>=').
	d at: ('>>') Put: ('>>>').
	d at: ('^^') Put: ('^').
	d at: ('|') Put: ('|').
	d at: ('||') Put: ('||').
] value) From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava selfASTToJavaConverter parent javaBinarySelectors.

CopyDowns:
globals set. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         javaEscapes = bootstrap setObjectAnnotationOf: ( [|d|
	d: dictionary copyRemoveAll.
	d at: ('	') Put: ('\\t').
	d at: ('
') Put: ('\\n').
	d at: ('\"') Put: ('\\\"').
	d at: ('\\') Put: ('\\\\').
	d at: ('\x0d') Put: ('\\r').
] value) From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava selfASTToJavaConverter parent javaEscapes.

CopyDowns:
globals set. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         jpns = bootstrap stub -> 'globals' -> 'javaParser' -> 'parseNodes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         makeTypeNode = ( |
            | 
            jpns classOrInterfaceType copyName: jpns nameNode copyForName: tokenFromSource: 'Object').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         prefixOperatorsForUnarySelectors = bootstrap setObjectAnnotationOf: ( [|d|
	d: dictionary copyRemoveAll.
	d at: ('complement') Put: ('~').
	d at: ('negate') Put: ('-').
	d at: ('not') Put: ('!').
] value) From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava selfASTToJavaConverter parent prefixOperatorsForUnarySelectors.

CopyDowns:
globals set. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         selectorIdentifierToken: str = ( |
            | 
            tokenFromSource: str).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         tokenFromSource: s = ( |
             lexer.
            | 
            lexer: javaParser lexer copyForInputStream: javaParser inputStream copyForString: s.
            lexer scanNextTokenIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         translateCharToJava: c = ( |
            | 
            javaEscapes at: c IfAbsent: [
              c asByte < ' ' asByte
              ifTrue: [ '\\', c asByte octalPrintString ]
               False: [ c ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         translateKeywordSelector: s = ( |
            | 
            (s replace: ':' With: '_') copyWithoutLast).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfASTToJavaConverter' -> 'parent' -> () From: ( | {
         'Category: converting nodes - sent from convertNode:\x7fCategory: helpers\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         translateToJavaStringLiteral: s = ( |
            | 
            "more work to be done here"
            '"',
            (
                s gather: [|:c| translateCharToJava: c]
            ) asString,
            '"').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: public'
        
         selfSlotToJavaConverter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava selfSlotToJavaConverter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: InitializeToExpression: (\'\')'
        
         inputString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: InitializeToExpression: (nil)'
        
         javaAST.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: InitializeToExpression: (nil)'
        
         javaASTWithParens.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava selfSlotToJavaConverter parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         buildSelfAST = ( |
            | 
            selfAST: selfParser objectOrMethodParser 
                      copyParseSource: inputString
                               IfFail: [|:e| selfParserError: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot'
        
         check = ( |
             r.
            | 
            r: userQuery askMultipleChoice:  inputString, '\n\n', resultString
              Choices: ('ok' & 'bad' & 'retry') asVector
              Results: ('ok' & 'bad' & 'retry') asVector.
            r = 'ok' ifTrue: [^ self].
            r = 'bad' ifTrue: [halt. ^ self].

            convert check).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         convert = ( |
            | 
            case if: [slotToConvert isAssignable] Then: [convertAssignableSlot]
                 If: [slotToConvert isMethod    ] Then: [convertMethodSlot]
                                                  Else: [convertConstantDataSlot]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: public'
        
         convertAssignableSlot = ( |
            | 
            todo unimplemented.
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot'
        
         convertConstantDataSlot = ( |
            | 
            todo unimplemented.
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot'
        
         convertMethodSlot = ( |
            | 
            inputString: '( ', (selfMethodText copyForMethod: slotToConvert contents) formatMethodBody asString, ' )'.
            buildSelfAST.
            convertSelfASTToJavaAST.
            prettyPrintJavaAST).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot'
        
         convertSelfASTToJavaAST = ( |
            | 
            javaAST: liveJava selfASTToJavaConverter copyAndConvert: selfAST.
            javaASTWithParens: javaAST addNeededJavaParenthesesOpenProto: (liveJava selfASTToJavaConverter tokenFromSource: '(') 
                                                              CloseProto:  liveJava selfASTToJavaConverter tokenFromSource: ')').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAndConvert: aSlot = ( |
            | 
            (copyForSlot: aSlot) convert resultString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForSlot: s = ( |
            | 
            copy slotToConvert: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         prettyPrintJavaAST = ( |
            | 
            resultString: (
              (javaParser parseNodes node copy addSubnode: javaASTWithParens)
                prettyPrintJavaSubnodes: prettyPrinter copy
            ) resultString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: InitializeToExpression: (\'\')'
        
         resultString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: InitializeToExpression: (nil)'
        
         selfAST.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfSlotToJavaConverter' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         slotToConvert.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: public'
        
         selfToJavaConverter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaConverter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava selfToJavaConverter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaConverter' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaConverter' -> 'parent' -> () From: ( |
             {} = 'Comment: HerToLe is a tablToRe of Java operToLatorToLs,
associativity, and prToLecedence.
-- dmu 11/05

unarToLy

+ nothing
- negate
! not
~ complement

1 lToR * *
1 lToR / /
1 lToR % %

2 lToR + + orToL ,
2 lToR - -

3 lToR << <<
3 lToR >> >+
3 lToR >>> >>

4 lToR < <
4 lToR > >
4 lToR <= <=
4 lToR >= >=
4 lToR instanceof ???

5 lToR == =
5 lToR = !=

6 lToR & &
7 lToR ^ ^^
8 lToR | |

9 lToR && &&[]
10 lToR || ||[]

11 rToL ?: ifTrue:[]False:[]

12 rToL = assignment
12 rToL *= ???
12 rToL /= ???
12 rToL %= ???
12 rToL += ???
12 rToL -= ???
12 rToL <<= ???
12 rToL >>= ???
12 rToL >>>= ???
12 rToL &= ???
12 rToL ^= ???
12 rToL |= ???\x7fModuleInfo: Creator: globals liveJava selfToJavaConverter parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'Category: tools\x7fCategory: testing\x7fModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: public'
        
         selfToJavaTester = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTester' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava selfToJavaTester.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTester' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: InitializeToExpression: (nil)'
        
         all <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTester' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot'
        
         fillAll = ( |
            | 
            all ifNil: [
              userQueryMorph show: 'enumerating all' While: [all: browseWellKnown all] Event: process this birthEvent
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTester' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTester' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot'
        
         showResultsSelf: ss Java: js = ( |
             eds.
             feds.
             jtem.
             qm.
             r.
             stem.
            | 
            stem: uglyTextEditorMorph copyString: ss  Style: (| color = paint |).
            jtem: uglyTextEditorMorph copyString: js  Style: (| color = paint |).
            eds: (stem & jtem) asVector.

            feds: eds copyMappedBy: [|:e| 
              (frameMorph copy addMorph: e) frameStyle: frameMorph insetBezelStyle
            ].

            r: columnMorph copy leftJustify.
            r addAllMorphs: eds.

            qm: userQueryMorph copyQuestion: 'Self vs. Java'.

            qm buttonInRowLabel: 'Incorrect' Result: false.
            qm buttonInRowLabel: 'Correct'   Result: true.
            qm morphsDo: [|:m| m morphTypeName = 'columnMorph' ifTrue: [
              m leftJustify.
              m addMorph: r. r: nil.
            ]].
            qm popUpWhereEventHappened: process this birthEvent.
            eds do: [|:e| e resizeToText].
            qm drawAttention awaitResponse.
            qm result ifFalse: [halt].
            qm result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTester' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot'
        
         testAll = ( |
            | 
            fillAll.
            all do: [|:m|
              m do: [|:s. r|
               s isMethod ifTrue: [|converter|
                 converter: liveJava selfSlotToJavaConverter copyForSlot: s.
                 converter convert.
                 showResultsSelf: converter inputString Java: converter resultString
               ]
            ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot'
        
         selfToJava = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfToJava' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfToJava' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfToJava.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfToJava' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/liveJava'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfToJava' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfToJava' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfToJava' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfToJava' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.2 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfToJava' -> () From: ( | {
         'ModuleInfo: Module: selfToJava InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'javaPrettyPrinter
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'javaPrettyPrinter' From: 'applications/liveJava'



 '-- Side effects'

 globals modules selfToJava postFileIn
