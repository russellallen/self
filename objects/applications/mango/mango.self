"Sun-$Revision: 30.6 $"
 
"Copyright 1992-2012 AUTHORS.
 See the LICENSE file for license information."


traits  _AddSlotsIfAbsent: ( | { 'Category: applications' mango = () } | )
globals _AddSlotsIfAbsent: ( | { 'Category: applications' mango = () } | )
mixins  _AddSlotsIfAbsent: ( | { 'Category: applications' mango = () } | )
 
traits mango _AddSlotsIfAbsent: ( |
  "^" counter      = ().       "Should be promoted to general world."

  "^" symbols      = ().       "These are name spaces."
  "^" productions  = ().
  "^" parsers      = ().
  "^" grammars     = ().
  "^" tokens       = ().
  "^" treeBuilders = ().
| )

mango _AddSlotsIfAbsent: ( |
  "^" counter      = ().

  "^" symbols      = ().       "These are name spaces."
  "^" productions  = ().
  "^" parsers      = ().
  "^" grammars     = ().
  "^" tokens       = ().
  "^" treeBuilders = ().
| )

mango _AddSlots: ( |
  "^" asciiSize    = 256.      "Number of ascii chars. Should be promoted."
  "^" assertSwitch = false.    "If true, check assertions."
  "^" assert: blk  = ( assertSwitch ifTrue: [blk assert]. ).
| )


traits mango symbols _AddSlotsIfAbsent: ( |
  "^" symbol                     = ().
  "^"   terminal                 = ().
  "^"   nonterminal              = ().
| )

mango symbols _AddSlotsIfAbsent: ( |
  "^" symbol                     = ().
  "^"   terminal                 = ().
  "^"   nonterminal              = ().
  "^" symbolSharedState          = ().
  "^"   terminalSharedState      = ().
  "^"   nonterminalSharedState   = ().
|  )


traits mango productions _AddSlotsIfAbsent: ( |
  "^" prodSet                    = ().
  "^" production                 = ().
  "^" structuredProduction       = ().
  "^"   conProduction            = ().
  "^"   lstProduction            = ().
  "^"   lst1Production           = ().
  "^"   lst0Production           = ().
  "^"   altProduction            = ().
  "^"   optProduction            = ().
| )

mango productions _AddSlotsIfAbsent: ( |
  "^" prodSet                    = ().
  "^" production                 = ().
  "^" structuredProduction       = ().
  "^"   conProduction            = ().
  "^"   lstProduction            = ().
  "^"   lst1Production           = ().
  "^"   lst0Production           = ().
  "^"   altProduction            = ().
  "^"   optProduction            = ().
| )


traits mango parsers _AddSlotsIfAbsent: ( |
  "^" action                     = ().
  "^"   simpleShift              = ().
  "^"     shift                  = ().
  "^"   simpleReduce             = ().
  "^"     simpleAccept           = ().
  "^"     reduce                 = ().
  "^"       accept               = ().
  "^"   error                    = ().
  "^" stack                      = ().
  "^" parserPipeline             = ().
  "^" parser                     = ().
  "^"   lrParser                 = ().
  "^"   initialParser            = ().
  "^"     charStreamer           = ().
  "^"     grammarLexer           = ().    "For bootstrapping."
  "^"   simpleStGrammarParser    = ().    "For bootstrapping."
  "^"   filter                   = ().
  "^"     singleKindEater        = ().
  "^"       whitespaceFilter     = ().
  "^"     keywordRecognizer      = ().
  "^"     typedefFilter          = ().
| )

mango parsers _AddSlotsIfAbsent: ( |
  "^" action                     = ().
  "^"   simpleShift              = ().
  "^"     shift                  = ().
  "^"   simpleReduce             = ().
  "^"     simpleAccept           = ().
  "^"     reduce                 = ().
  "^"       accept               = ().
  "^"   error                    = ().
  "^" stack                      = ().
  "^" parserPipeline             = ().
  "^" parser                     = ().
  "^"   lrParser                 = ().
  "^"   initialParser            = ().
  "^"     charStreamer           = ().
  "^"     grammarLexer           = ().    "For bootstrapping."
  "^"   simpleStGrammarParser    = ().    "For bootstrapping."
  "^"   filter                   = ().
  "^"     singleKindEater        = ().
  "^"       whitespaceFilter     = ().
  "^"     keywordRecognizer      = ().
  "^"     typedefFilter          = ().
  "^"   stGrammarParser         <- ().    "Final parser for stGrammar's"
| )


traits mango grammars _AddSlotsIfAbsent: ( |
  "^" slrItem                    = ().
  "^"   lrItem                   = ().
  "^" lrState                    = ().
  "^" lrStateMachine             = ().
  "^" grammar                    = ().
  "^" stGrammar                  = ().
| )

mango grammars _AddSlotsIfAbsent: ( |
  "^" slrItem                    = ().
  "^"   lrItem                   = ().
  "^" lrState                    = ().
  "^" lrStateMachine             = ().
  "^" grammar                    = ().
  "^" stGrammar                  = ().
  "^" grammarOptimizer           = ().
| )


traits mango tokens _AddSlotsIfAbsent: ( |
  "^" abstractToken              = ().
  "^"   charToken                = ().
  "^"   token                    = ().
  "^"   node                     = ().
  "^"   gramNode                 = ().
  "^"   nodeSkeleton             = ().
  "^"   listMixin                = ().
  "^"     listSepMixin           = ().
  "^"     listNoSepMixin         = ().
| )

mango tokens _AddSlotsIfAbsent: ( |
  "^" abstractToken              = ().
  "^"   charToken                = ().
  "^"   token                    = ().
  "^"     endMarker              = ().
  "^"     errorMarker            = ().
  "^"   node                     = ().
  "^"   gramNode                 = ().
  "^"   nodeSkeleton             = ().
  "^"   listMixin                = ().
  "^"     listSepMixin           = ().
  "^"     listNoSepMixin         = ().
| )


traits mango treeBuilders _AddSlotsIfAbsent: ( |
  "^" tbConstructor              = ().
  "^" tbStep                     = ().
  "^"   tbNewNodeStep            = ().
  "^"   tbSetSonStep             = ().
  "^"   tbAddListElmStep         = ().
  "^"     tbAddListSepElmStep    = ().
  "^"   tbStartList1Step         = ().
  "^"     tbStartList0Step       = ().
  "^"   tbNoChangeStep           = ().
  "^"     tbInitializeStep       = ().
  "^"       tbInitializeListStep = ().
| )

mango treeBuilders _AddSlotsIfAbsent: ( |
  "^" tbConstructor              = ().
  "^" tbStep                     = ().
  "^"   tbNewNodeStep            = ().
  "^"   tbSetSonStep             = ().
  "^"   tbAddListElmStep         = ().
  "^"     tbAddListSepElmStep    = ().
  "^"   tbStartList1Step         = ().
  "^"     tbStartList0Step       = ().
  "^"   tbNoChangeStep           = ().
  "^"     tbInitializeStep       = ().
  "^"       tbInitializeListStep = ().
| )


mixins mango _AddSlots: ( |
  "^" tracer                     = (). "Mixin now; could perhaps be generalized."
  "^" utilitiesMixin             = ().
  "^" accessorsMixin             = ().
| )



'applications/mango/grammar.self'             _RunScript
'applications/mango/prodSet.self'             _RunScript
'applications/mango/ptokens.self'             _RunScript
'applications/mango/treeBuilders.self'        _RunScript
'applications/mango/stGrammar.self'           _RunScript
'applications/mango/parsers.self'             _RunScript
'applications/mango/typedefFilter.self'       _RunScript
'applications/mango/gramBuild.self'           _RunScript
