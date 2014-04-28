 '$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot'
        
         selfMinis = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfMinis' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfMinis' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfMinis.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfMinis' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/selfParser'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfMinis' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfMinis' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfMinis' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfMinis' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfMinis' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         miniParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'miniParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals parseKit miniParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'miniParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser miniParser.

CopyDowns:
globals parseKit miniParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'miniParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'miniParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser miniParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'miniParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot'
        
         nameSpace* = bootstrap stub -> 'globals' -> 'selfParser' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'miniParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'miniParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fCategory: slot lists\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         annotatedSlotGroupParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'annotatedSlotGroupParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser miniParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'annotatedSlotGroupParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser annotatedSlotGroupParser.

CopyDowns:
globals selfParser miniParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'annotatedSlotGroupParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'annotatedSlotGroupParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser annotatedSlotGroupParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'annotatedSlotGroupParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'miniParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'annotatedSlotGroupParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         parse = ( |
             anno.
             close.
             open.
             slotsAndGroups.
            | 
             open: nodesToParse removeFirst.
            close: nodesToParse removeLast.
            nodesToParse isEmpty ifTrue: [
              failNode:  open
               Because: 'expected annotation string after: '
            ].
            anno: nodesToParse removeFirst.
            anno isSelfString ifFalse: [
              failNode: anno
               Because: 'expected annotation string instead of'
            ].
            slotsAndGroups: slotSeriesParser
              copyParse: nodesToParse
              AtOrAfter: anno
                 IfFail: [|:e| ^ myFailBlock value: e].

            parseNodes annotatedSlotGroup
                    copyOpen:  open 
                  Annotation:  anno
              SlotsAndGroups:  slotsAndGroups subnodes
                       Close:  close).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fCategory: objects & blocks\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         objectOrBlockParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser miniParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser objectOrBlockParser.

CopyDowns:
globals selfParser miniParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> () From: ( | {
         'Category: object & block parsing\x7fModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (nil)'
        
         body.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> () From: ( | {
         'Category: object & block parsing\x7fModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (nil)'
        
         closeBracket.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> () From: ( | {
         'Category: object & block parsing\x7fModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (false)'
        
         hasBody <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> () From: ( | {
         'Category: object & block parsing\x7fModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (false)'
        
         hasSlotList <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> () From: ( | {
         'Category: object & block parsing\x7fModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (nil)'
        
         openBracket.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser objectOrBlockParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         emptyObject = ( |
            | 
            parseNodeProto copyOpen: openBracket Close: closeBracket).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'miniParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parse = ( |
            | 
            nodesToParse size >= 2 ifFalse: [error: 'should have open and close paren nodes'].
             openBracket: nodesToParse removeFirst. 
            closeBracket: nodesToParse removeLast.
            nodesToParse isEmpty ifTrue: [ ^ emptyObject ].

            nodesToParse first isSelfSlotListDelimiter ifTrue: [
              slotList: parseSlotList.
              hasSlotList: true.
            ].
            nodesToParse isEmpty  ifFalse: [
              body: parseBody.
              hasBody: true.
            ].
            nodesToParse isEmpty ifFalse: [
              failNode: closeBracket Reason: 'extra stuff before:'
            ].
            hasSlotList && [parseNodeProto canHaveArguments not && [slotList argumentSlotCount > 0]]  ifTrue: [
              failNode: slotList Because: 'objects or blocks without code cannot have arguments'
            ].
            parseNodeProto copyOpen: openBracket SlotList: slotList Body: body Close: closeBracket).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         parseBody = ( |
            | 
            expressionSeriesParser copyParseNonEmpty: nodesToParse IfFail: myFailBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseBracketsFrom: aNode IfFail: fb = ( |
            | 
            parseInnerBracketsFrom: aNode IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseSlotList = ( |
            | 
            slotListParser copyParseNonEmpty: nodesToParse IfFail: myFailBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> () From: ( | {
         'Category: object & block parsing\x7fModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (nil)'
        
         slotList.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fCategory: objects & blocks\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         blockParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'blockParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser objectOrBlockParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'blockParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser blockParser.

CopyDowns:
globals selfParser objectOrBlockParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'blockParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'blockParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser blockParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'blockParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'blockParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseNodeProto = ( |
            | parseNodes block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         expressionParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser miniParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser expressionParser.

CopyDowns:
globals selfParser miniParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser expressionParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'miniParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parse = ( |
             d.
             r.
            | 
            nodesToParse last isSelfStatementSeparator ifTrue: [
              d: nodesToParse last.
              nodesToParse removeLast.
            ].
            r: parseKeywordSends: nodesToParse.
            nodesToParse removeAll. "for callers"
            nil = d ifFalse: [ parseNodes pop copyExpression: r Dot: d]
                       True: [ r ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> 'parent' -> () From: ( | {
         'Category: parsing sends\x7fCategory: keyword\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseAfterKeyword: nodes ArgumentsInto: parsedArgs KeywordsInto: kws = ( |
             args.
            | 
            "have parsed kw send through first kw"
            args: list copyRemoveAll.
            [|n|
              n: nodes removeFirst.
              case
              if:   [ n isSelfCapKeyword ]
              Then: [
                args isEmpty ifTrue: [ failNode: kws last Because: 'expected argument for keyword:' ].
                parsedArgs addLast: parseBinarySends: args.
                args: list copyRemoveAll.
                kws addLast: n.
                nodes isEmpty ifTrue: [ failNode: n Because: 'no arguments for keyword:' ].
              ]
              If:    [ n isSelfFirstKeyword ]
              Then:  [
                "args seen so far plus rest is a sub-keyword send"
                args addLast: n.
                args addAll: nodes.
                parsedArgs addLast: parseKeywordSends: args.
                ^ self
              ]
              If:   [ nodes isEmpty not ]
              Then: [ args addLast: n ]
              Else: [ 
                args addLast: n.
                parsedArgs addLast: parseBinarySends: args.
                ^ self
              ].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> 'parent' -> () From: ( | {
         'Category: parsing sends\x7fCategory: binary\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseBinarySends: nodesArg = ( |
             nodes.
             rcvrNodes.
             sel.
            | 
            nodes: nodesArg copy.
            rcvrNodes: list copyRemoveAll.

            [|:exit|
              nodes isEmpty  ifTrue: [ ^ parseUnarySends: rcvrNodes ].
              sel: nodes removeFirst.
              sel isSelfOperator ifTrue: exit.
              rcvrNodes addLast: sel
            ] loopExit.

            parseRealBinarySendReceiverNodes: rcvrNodes Selector: sel Rest: nodes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> 'parent' -> () From: ( | {
         'Category: parsing primaries\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseBlock: nodes = ( |
            | blockParser copyParseNonEmpty: nodes IfFail: myFailBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> 'parent' -> () From: ( | {
         'Category: parsing primaries\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseConstant: n = ( |
            | 
            "this is just the token itself"
            n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> 'parent' -> () From: ( | {
         'Category: parsing sends\x7fCategory: keyword\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseKeywordSends: nodesArg = ( |
             nodes.
             rcvrNodes.
            | 
            rcvrNodes: list copyRemoveAll.
            nodes: nodesArg copy.
            nodes isEmpty ifTrue: [ failBecause: 'empty expression' ].
            [nodes isEmpty] whileFalse: [|n|
              n: nodes removeFirst.
              case
              if:   [ n isSelfCapKeyword ]
              Then: [ failNode: n Because: 'first keyword in a keyword send cannot be uppercase' ]
              If:   [ n isSelfFirstKeyword not ]
              Then: [ rcvrNodes addLast: n ]
              If:   [ rcvrNodes isEmpty not  &&  [ rcvrNodes last isSelfOperator ] ]
              Then: [
                      "special case: a + power: b"
                      "is really a binary send with keyword argument with implicit self"
                    ^ parseBinarySends: nodesArg
                    ]
              Else: [ ^ parseRealKeywordSendReceiverNodes: rcvrNodes  FirstKeyword: n RestNodes: nodes ].
            ].
            parseBinarySends: rcvrNodes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> 'parent' -> () From: ( | {
         'Category: parsing primaries\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseObjectOrParenthesizedExpression: nodes = ( |
            | 
            "in this context, (foo) is an expression, not a method"
            objectOrSubexpressionParser copyParseNonEmpty: nodes IfFail: myFailBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> 'parent' -> () From: ( | {
         'Category: parsing primaries\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parsePrimary: nodesArg = ( |
             n.
            | 
            n: nodesArg removeFirst.
            nodesArg isEmpty ifFalse: [failAll: nodesArg Because: 'extra junk in expression primary'].
            n isSquareList ifTrue: [^ parseBlock: n subnodes copy].
            n isParenList  ifTrue: [^ parseObjectOrParenthesizedExpression: n subnodes copy].
            n isSelfReceiver  ifTrue: [^ n].
            n isSelfConstant "float int string" ifTrue: [^ parseConstant: n].

            failNode: n Because: 'unexpected primary:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> 'parent' -> () From: ( | {
         'Category: parsing sends\x7fCategory: binary\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseRealBinarySendReceiver: rcvr Delegatee: del Selector: sel Rest: rest = ( |
             arg.
            | 
            rest isEmpty not  &&  [rest first isSelfFirstKeyword]  ifTrue: [
              "special case: a + foo: b"
            ^ parseNodes binarySend copyReceiver: rcvr Delegatee: del Selector: sel Argument: parseKeywordSends: rest
            ].

            arg: list copyRemoveAll.
            [rest isEmpty] whileFalse: [|n. newDel |
              n: rest removeFirst.
              case
               if:   [ n isSelfOperator not ]  Then: [ arg addLast: n ]
               If:   [ n value != sel value ]
               Then: [ failFrom: rcvr To: n Because: 'no precedence for binary operators - please use parentheses' ]
               If:   [ arg isEmpty not  &&  [ arg last isSelfDelegatee ] ]
               Then: [ newDel: arg removeLast ]
               If:   [ arg isEmpty ]
               Then: [ failNode: sel Because: 'no argument for binary selector' ]
               Else: [ |newRcvr| 
                       " a + b + c "
                       newRcvr:  parseNodes binarySend copyReceiver:  rcvr
                                                          Delegatee:  del
                                                           Selector:  sel
                                                           Argument:  parseUnarySends: arg.
                     ^ parseRealBinarySendReceiver: newRcvr
                                         Delegatee: newDel
                                          Selector: n
                                              Rest: rest
               ].
            ].
            arg isEmpty ifTrue: [ failNode: sel Because: 'no argument for binary selector:' ].
            parseNodes binarySend copyReceiver: rcvr Delegatee: del Selector: sel Argument:  parseUnarySends: arg).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> 'parent' -> () From: ( | {
         'Category: parsing sends\x7fCategory: binary\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseRealBinarySendReceiverNodes: rcvrNodes Selector: sel Rest: rest = ( |
             del.
             rcvr.
            | 
            rcvrNodes isEmpty not && [rcvrNodes last isSelfDelegatee]  ifTrue: [ del: rcvrNodes removeLast ].

            rcvr: rcvrNodes isEmpty ifTrue: [ lexer tokens implicitSelf copyForFirstSelectorNode: sel ]
                                     False: [ parseUnarySends: rcvrNodes ].

            parseRealBinarySendReceiver: rcvr Delegatee: del Selector: sel Rest: rest).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> 'parent' -> () From: ( | {
         'Category: parsing sends\x7fCategory: keyword\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseRealKeywordSendReceiverNodes: rcvrNodes FirstKeyword: kw RestNodes: rest = ( |
             del.
             kws.
             parsedArgs.
             parsedRcvr.
            | 

            rcvrNodes isEmpty not  &&  [ rcvrNodes last isSelfDelegatee ]  ifTrue: [
              del: rcvrNodes removeLast
            ].
            parsedRcvr:  rcvrNodes isEmpty ifTrue: [lexer tokens implicitSelf copyFrom: kw]
                                            False: [parseBinarySends: rcvrNodes           ].
            parsedArgs: list copyRemoveAll.
            kws:        list copyRemoveAll addFirst: kw.

            rest isEmpty ifTrue: [failNode: kw Because: 'no argument for keyword:'].

            parseAfterKeyword: rest ArgumentsInto: parsedArgs KeywordsInto: kws.

            parseNodes keywordSend copyReceiver: parsedRcvr
                                      Delegatee: del
                                       Keywords: kws
                                      Arguments: parsedArgs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionParser' -> 'parent' -> () From: ( | {
         'Category: parsing sends\x7fCategory: unary\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseUnarySends: nodesArg = ( |
             del.
             nodes.
             rcvr.
             sel.
            | 
            nodesArg last isSelfAbstractName  ifFalse: [^ parsePrimary: nodesArg ].
            nodes: nodesArg copy.
            sel: nodes removeLast.
            nodes isEmpty not && [nodes last isSelfDelegatee]  ifTrue: [
              del: nodes removeLast.
            ].
            rcvr: nodes isEmpty ifTrue: [lexer tokens implicitSelf copyForFirstSelectorNode: sel]
                                 False: [parseUnarySends: nodes].
            parseNodes unarySend copyReceiver: rcvr Delegatee: del Selector: sel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         expressionSeriesParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionSeriesParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser miniParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionSeriesParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser expressionSeriesParser.

CopyDowns:
globals selfParser miniParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionSeriesParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionSeriesParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser expressionSeriesParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionSeriesParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'miniParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionSeriesParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot'
        
         parse = ( |
             es.
             parsedEs.
             r.
             return.
            | 
            es: splitIntoExpressions.
            r: parseNodes expressionSeries copyRemoveAll.
            es isEmpty ifTrue: [^ r].
                es last hasSubnodes
            && [es last firstSubnode isSelfReturnToken] ifTrue: [|exprNodes|
              exprNodes: es last subnodes copy asList.
              return: exprNodes removeFirst.
              es addLast: es removeLast copyRemoveAll addAllSubnodes: exprNodes.
            ].
            parsedEs: es copyMappedBy: [|:n| parseExpression: n].
            nil = return  ifFalse: [
              parsedEs addLast: parseNodes return copyReturn: return 
                                                  Expression: parsedEs removeLast
            ].
            r addAllSubnodes: parsedEs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionSeriesParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot'
        
         parseExpression: n = ( |
            | 
            expressionParser copyParseNonEmpty: n subnodes copy IfFail: myFailBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'expressionSeriesParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         splitIntoExpressions = ( |
             tops.
            | 
            tops: list copyRemoveAll.
            [ nodesToParse isEmpty ] whileFalse: [
              |top|
              top: parseNodes node copy.
              [|:exit. n|
                n: nodesToParse removeFirst.
                n isLast || [n isSelfAccept]  ifTrue: [
                  top hasSubnodes  ifTrue: [ 
                    "save comment"
                    top setCommentsFrom: n.
                  ].
                  exit value.
                ].
                top addSubnode: n.
                n isSelfStatementSeparator "dot" ifTrue: exit.
                nodesToParse isEmpty             ifTrue: exit.
              ] loopExit.
              top hasSubnodes ifTrue: [tops addLast: top].
            ].
            tops).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fCategory: top-level parsers\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         stringOrFileParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringOrFileParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser miniParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringOrFileParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser stringOrFileParser.

CopyDowns:
globals selfParser miniParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringOrFileParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringOrFileParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser stringOrFileParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringOrFileParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'miniParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringOrFileParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parse = ( |
            | 
            expressionSeriesParser copyParse: nodesToParse
                                   AtOrAfter: errorNode
                                      IfFail: myFailBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fCategory: top-level parsers\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         fileParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'fileParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser stringOrFileParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'fileParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser fileParser.

CopyDowns:
globals selfParser stringOrFileParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'fileParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'fileParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser fileParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'fileParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'stringOrFileParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'fileParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot'
        
         sourceToNoncommentParser = ( |
            | sourceFromFileToNoncommentParser).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fCategory: objects & blocks\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         objectOrSubexpressionParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrSubexpressionParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser objectOrBlockParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrSubexpressionParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser objectOrSubexpressionParser.

CopyDowns:
globals selfParser objectOrBlockParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrSubexpressionParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrSubexpressionParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser objectOrSubexpressionParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrSubexpressionParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrBlockParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrSubexpressionParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseNodeProto = ( |
            | parseNodes object).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fCategory: objects & blocks\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         objectOrMethodParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrMethodParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser objectOrSubexpressionParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrMethodParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser objectOrMethodParser.

CopyDowns:
globals selfParser objectOrSubexpressionParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrMethodParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrMethodParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser objectOrMethodParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrMethodParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrSubexpressionParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'objectOrMethodParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseNodeProto = ( |
            | 
            hasBody ifTrue: [parseNodes method] False: [parseNodes object]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fCategory: slot lists\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         slotListParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotListParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser miniParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotListParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser slotListParser.

CopyDowns:
globals selfParser miniParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotListParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (nil)'
        
         close.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotListParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (nil)'
        
         open.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotListParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotListParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser slotListParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotListParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'miniParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotListParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot'
        
         parse = ( |
             n.
             nodesInSlotList.
             slotsAndGroups.
            | 
            nodesToParse first isSelfSlotListDelimiter ifFalse: [
              error: 'first node should be opening bar'.
            ].
            open: nodesToParse removeFirst.
            nodesInSlotList: list copyRemoveAll.
            n: open.
            [|:exit|
              nodesToParse isEmpty ifTrue: [ 
                failFrom: open To: n Because: 'could not find `|\' at end of slot list'.
              ].
              n: nodesToParse removeFirst.
              n isSelfSlotListDelimiter ifTrue: [close: n. exit value].
              nodesInSlotList addLast: n.
            ] loopExit.
            slotsAndGroups: slotSeriesParser copyParse: nodesInSlotList
                                             AtOrAfter: open
                                                IfFail: [|:e| ^ myFailBlock value: e].
            parseNodes slotList copyOpen: open SlotsAndGroups: slotsAndGroups subnodes Close: close).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fCategory: slot lists\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         slotParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser miniParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser slotParser.

CopyDowns:
globals selfParser miniParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (nil)'
        
         dot.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (nil)'
        
         equalsOrArrow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (false)'
        
         hasDot <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (nil)'
        
         nameNode.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser slotParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         eatDot = ( |
            | 
            nodesToParse last isSelfSlotSeparator ifTrue: [
              hasDot: true.
              dot: nodesToParse removeLast.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'miniParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parse = ( |
             nodeProto.
            | 
            "Last node may be a dot. Be sure I eat all nodes"
            eatDot.
            nodesToParse isEmpty ifTrue: [
              failNode: dot Because: 'missing slot declaration before:'.
            ].
            splitAtEqualsOrArrow.
            nameNode: parseName.
            valueNode: parseValue.
            reconcileArgumentsInNameWithValue.
            nodeProto: nameNode isSelfObjectAnnotation ifTrue: [parseNodes objectAnnotationSlot] False: [parseNodes slot].
            nodeProto copyName: nameNode Assignment: equalsOrArrow Value: valueNode Dot: dot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseExpression = ( |
            | 
            expressionParser copyParseNonEmpty: parseNodes IfFail: myFailBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseKeywordsAndArguments: nodes = ( |
             args.
             kws.
            | 
            kws: list copyRemoveAll addFirst: nodes removeFirst.

            nodes isEmpty || [nodes first isSelfCapKeyword]  ifTrue: [
              nodes findFirst: [|:n| n isSelfCapKeyword not]
                    IfPresent: [|:n| failNode: n Because: 'expected a capitalized keyword instead of']
                     IfAbsent: [].
              kws addAll: nodes.  nodes removeAll.
            ^ parseNodes keywordSlotNameWithoutFormals copyKeywords: kws
            ].

            args: list copyRemoveAll.
            [|n|
              n: nodes removeFirst.
              n isSelfSimpleName ifFalse: [ failNode: n Because: 'expected argument name instead of' ].
              args addLast: n.
              nodes isEmpty ifTrue: [
              ^ parseNodes keywordSlotNameWithFormals copyKeywords: kws Formals: args
              ].
              n: nodes removeFirst.
              n isSelfCapKeyword ifFalse: [ failNode: n Because: 'expected capitalized keyword instead of' ].
              kws addLast: n
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseName = ( |
             f.
             r.
            | 
            rawNameNodes isEmpty ifTrue: [ 
              failNode: equalsOrArrow Because: 'no slot name found before:'].
            f: rawNameNodes removeFirst.
            r: case
              if:   [ f isSelfObjectAnnotation ]
              Then: [
                      rawNameNodes isEmpty ifFalse: [ 
                        failAll: rawNameNodes Because: 'extra junk after'
                      ].
                      nil = equalsOrArrow ifTrue: [ failNode: f Because: 'missing `=\' after'].
                      equalsOrArrow isSelfConstantSlotAssignment ifFalse: [
                        failNode: equalsOrArrow Because: '`=\' expected instead of'
                      ].
                      parseNodes objectAnnotationSlotName copyAnnotation: f
              ]
              If:   [ f isSelfDelegatee ]
              Then: [ failNode: f Because: 'missing space after' ]
              If:   [ f source first = '_' ]
              Then: [ failNode: f Because: '`_\' is reserved for primitives' ]
              If:   [ f isSelfArgument ]
              Then: [ 
                      nil = equalsOrArrow  ifFalse: [
                        failNode: equalsOrArrow Because: 'cannot initialize an argument slot' 
                      ].
                      parseNodes unarySlotName copyName: f
              ]
              If:   [ f isSelfAbstractName ]
              Then: [ |s|
                      rawNameNodes isEmpty not && [rawNameNodes first source = '*']
                       ifTrue: [s: rawNameNodes removeFirst].
                        parseNodes unarySlotName copyName: f Star: s
              ]
              If:   [ f isSelfOperator ]
              Then: [ parseOperator: f AndArguments: rawNameNodes ]
              If:   [ f isSelfFirstKeyword ]
              Then: [ parseKeywordsAndArguments: rawNameNodes addFirst: f ]
              Else: [ failAll: ( rawNameNodes addFirst: f) 
                      Because: 'expected slot name but found:' ].

            rawNameNodes isEmpty  ifFalse: [
              failAll: rawNameNodes Because: 'extra junk found in slot name'
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseOperator: op AndArguments: nodes = ( |
             n.
            | 
            nodes isEmpty  ifTrue: [
              ^ parseNodes binarySlotNameWithoutFormal copyOperator: op
            ].
            n: nodes removeFirst.
            n isSelfSimpleName ifFalse: [ failNode: n Because: 'expected argument name instead of:' ].
            nodes isEmpty ifFalse: [ failAll: nodes Because: 'extra junk after binary slot formal:' ].
            parseNodes binarySlotNameWithFormal copyOperator: op Formal: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseValue = ( |
             nodes.
             parserProto.
            | 
            nil = equalsOrArrow ifTrue: [^ nil].
            parserProto: expressionParser.
            nodes: nodesToParse.
            case
              if:   [ nodesToParse isEmpty ]
              Then: [ failNode: equalsOrArrow Because: 'expected slot initial value after:' ]
              If:   [ nodesToParse size > 1 ]
              Then: [ "must be expression" ]
              If:   [ nodesToParse first isSquareList ]
              Then: [ parserProto:          blockParser.  nodes: nodesToParse removeFirst subnodes copy ]
              If:   [ nodesToParse first isParenList ]
              Then: [ parserProto: objectOrMethodParser.  nodes: nodesToParse removeFirst subnodes copy ].

            parserProto copyParseNonEmpty: nodes IfFail: myFailBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         reconcileArgumentsInNameWithValue = ( |
             nameArgs.
             valueArgs.
            | 
            nameArgs: nameNode argumentCountAsSlotName.

            case
            if: [ nil = valueNode ] Then: [
              nameArgs = 0
               ifFalse: [ failNode: nameNode 
                          Because: 'slot name implies arguments but implicit initial value of nil takes no arguments' ].
            ]
            If: [ nameNode isArgumentSlotName ] Then: [
              failNode: nameNode Because: 'cannot initialize argument slot'.
            ]
            If: [ valueNode isSelfMethod not ] Then: [
              nameArgs = 0  ifFalse: [ 
                failNode: nameNode 
                Because: 'slot name implies arguments but contents takes no arguments'
              ].
            ]
            If: [ equalsOrArrow source = '<-' ] Then: [
              failNode: equalsOrArrow Because: 'cannot put a method in an assignable slot' 
            ]
            If: [ valueArgs: valueNode argumentCountAsSlotContents.
                  ( nameArgs > 0 )  &&  [ nameNode suppliesAnyArgumentNames ]     ] Then: [
              valueArgs > 0  ifTrue: [
                 failNode: valueNode Because: 'method cannot declare argument names if they are also in the slot name' 
              ].
            ]
            If: [ nameArgs  !=  valueArgs ] Then: [
              failFrom: nameNode To: valueNode
               Because: 'slot name implies ', nameArgs printString,
                        ' arguments but slot contents takes ', valueArgs printString
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         splitAtEqualsOrArrow = ( |
            | 
            rawNameNodes: list copyRemoveAll.
            "= or <- at start is slot name"
            rawNameNodes addFirst: nodesToParse removeFirst.
            equalsOrArrow: nil.
            [nodesToParse isEmpty] whileFalse: [| n|
              n: nodesToParse removeFirst.
              n isSelfSlotAssignment ifTrue: [
                equalsOrArrow: n.
              ^ self
              ].
              rawNameNodes addLast: n
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         rawNameNodes <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (nil)'
        
         valueNode.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fCategory: slot lists\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         slotSeriesParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotSeriesParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser miniParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotSeriesParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser slotSeriesParser.

CopyDowns:
globals selfParser miniParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotSeriesParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotSeriesParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser slotSeriesParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotSeriesParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'miniParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotSeriesParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parse = ( |
            | 
            result: parseNodes node copyRemoveAll.
            [nodesToParse isEmpty] whileFalse: [
              result addSubnode: parseSlotOrAnnotatedGroup
            ].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotSeriesParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseAnnotatedGroup = ( |
             r.
            | 
            r: annotatedSlotGroupParser
              copyParseNonEmpty:  nodesToParse removeFirst subnodes copy
                         IfFail:  myFailBlock.
            nodesToParse isEmpty not && [nodesToParse first isSelfSlotSeparator]  ifTrue: [
              r addDot: nodesToParse removeFirst.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotSeriesParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseSlot = ( |
             slotNodes.
            | 
            slotNodes: list copyRemoveAll.
            [|:exit. n|
              nodesToParse first isCurlyList  ifTrue: exit.
              n: nodesToParse removeFirst.
              slotNodes addLast: n.
              n isSelfSlotSeparator  ifTrue: exit.
              nodesToParse isEmpty ifTrue: exit
            ] loopExit.
            slotParser copyParseNonEmpty: slotNodes IfFail: myFailBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotSeriesParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parseSlotOrAnnotatedGroup = ( |
            | 
            nodesToParse first isCurlyList
              ifTrue: [ parseAnnotatedGroup ]
               False: [ parseSlot ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'slotSeriesParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: InitializeToExpression: (nil)'
        
         slots.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fCategory: lexing miniparsers\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceToNoncommentParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceToNoncommentParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals parseKit sourceToNoncommentParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceToNoncommentParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser sourceToNoncommentParser.

CopyDowns:
globals parseKit sourceToNoncommentParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceToNoncommentParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceToNoncommentParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser sourceToNoncommentParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceToNoncommentParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot'
        
         nameSpace* = bootstrap stub -> 'globals' -> 'selfParser' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceToNoncommentParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'sourceToNoncommentParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fCategory: lexing miniparsers\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceFromFileToNoncommentParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceFromFileToNoncommentParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser sourceToNoncommentParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceFromFileToNoncommentParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser sourceFromFileToNoncommentParser.

CopyDowns:
globals selfParser sourceToNoncommentParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceFromFileToNoncommentParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceFromFileToNoncommentParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser sourceFromFileToNoncommentParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceFromFileToNoncommentParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         inputStreamForSource: s = ( |
            | 
            (resend.inputStreamForSource: s) isForFile: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceFromFileToNoncommentParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceToNoncommentParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fCategory: lexing miniparsers\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceFromStringToNoncommentParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceFromStringToNoncommentParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser sourceToNoncommentParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceFromStringToNoncommentParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser sourceFromStringToNoncommentParser.

CopyDowns:
globals selfParser sourceToNoncommentParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceFromStringToNoncommentParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceFromStringToNoncommentParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser sourceFromStringToNoncommentParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceFromStringToNoncommentParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         inputStreamForSource: s = ( |
            | 
            (resend.inputStreamForSource: s) isForFile: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceFromStringToNoncommentParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'sourceToNoncommentParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: parsing\x7fCategory: miniparsers\x7fCategory: top-level parsers\x7fModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: public'
        
         stringParser = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringParser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser stringOrFileParser copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser stringParser.

CopyDowns:
globals selfParser stringOrFileParser. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringParser' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringParser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser stringParser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'stringOrFileParser' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'stringParser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfMinis InitialContents: FollowSlot'
        
         sourceToNoncommentParser = ( |
            | 
            sourceFromStringToNoncommentParser).
        } | ) 



 '-- Side effects'

 globals modules selfMinis postFileIn
