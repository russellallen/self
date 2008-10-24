 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         chain = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'chain' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'chain' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules chain.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'chain' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'chain' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'chain' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         myComment <- 'Comment: A chain represents a reference to an object from the lobby.
                   Each link is one reference and the chains are linked
                   backwards. The last link of each chain is an object
                   denoting the lobby. In this way, we can share the
                   ends of the chains.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'chain' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'chain' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         chains = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter chains.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         lobbyLink = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter chains lobbyLink.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         lobbyLink = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits transporter chains lobbyLink.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: InitializeToExpression: (transporter chains lobbyLink)\x7fVisibility: private'
        
         prevLink = bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'lobbyLink' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         reflectee = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'reflectee' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter chains reflectee.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: InitializeToExpression: (mirrors slots)'
        
         mir <- bootstrap stub -> 'globals' -> 'mirrors' -> 'slots' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         reflectee = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'reflectee' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits transporter chains reflectee.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'reflectee' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         prevLink <- bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'lobbyLink' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         slot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter chains slot.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         slot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits transporter chains slot.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         prevLink <- bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'lobbyLink' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         targetSlot <- bootstrap stub -> 'globals' -> 'slots' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         vectorElement = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'vectorElement' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter chains vectorElement.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         index <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         vectorElement = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'vectorElement' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits transporter chains vectorElement.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'vectorElement' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         prevLink <- bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> 'lobbyLink' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         chains = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits transporter chains.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         abstract = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( |
             {} = 'Comment: A chain represents a reference to an object from the lobby.
		Each link is one reference and the chains are linked
		backwards. The last link of each chain is an object
		denoting the lobby. In this way, we can share the
		ends of the chains.

             In addition to modeling chains of object
             refs from the lobby, also have a mapping feature, so they
	     can be customized with a mixin to substitute objects
	     for objects. This hook was needed for the counterfactual
	     feature in the old transporter.\x7fModuleInfo: Creator: traits transporter chains abstract.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         < c = ( |
            | names < c names).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         = c = ( |
            | 
             == c ifTrue: [^ true].
                ( targetMirror = c targetMirror )
            && [( prevLink     = c prevLink     )
            && [  name         = c name       ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         accessingNodes* = bootstrap stub -> 'globals' -> 'transporter' -> 'chains' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         asPath = ( |
            | path copyWithAll: names).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         compare: c IfLess: lb Equal: eb Greater: gb = ( |
            | 
            names compare: c names IfLess: lb Equal: eb Greater: gb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing shorthands; child must implement one of these\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         condensedKeywordExpression = ( |
            | 
            keywordExpression).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing shorthands; child must implement one of these\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         condensedKeywordMirrorExpression = ( |
            | 
            keywordMirrorExpression).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing shorthands; child must implement one of these\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         condensedUnaryExpression = ( |
            | 
            unaryExpression).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing shorthands; child must implement one of these\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         condensedUnaryMirrorExpression = ( |
            | 
            unaryMirrorExpression).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | 
            "for fileOuts"
            lobbyLink).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         extendForName: n = ( |
            | extendForSlot: targetMirror at: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: chain InitialContents: FollowSlot'
        
         extendForReflectee = ( |
            | 
            "create new path for my reflectee"
               (reflectee copy prevLink: self) 
                mir: targetObject).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         extendForSlot: s = ( |
            | 
            ( slot copy prevLink: self ) targetSlot: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: chain InitialContents: FollowSlot'
        
         extendForVectorIndex: i = ( |
            | 
            "target object is a vector, extend for ith element"
               (
                       vectorElement copy prevLink: self
               ) index: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: chain InitialContents: FollowSlot'
        
         forNames: ns = ( |
             m.
             r.
            | 
            r: lobbyLink.
            m: reflect: lobby.
            ns do: [|:n. s|
                s: m at: n IfAbsent: [
                    error: 'cannot create chain because ', r printString,
                    ' has no slot named ', n.
                ].
                r: s isVectorElement ifTrue: [r extendForVectorIndex: s elementIndex] 
                                      False: [r extendForSlot: s].
                m: r targetMirror.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: chain InitialContents: FollowSlot'
        
         forPath: p = ( |
            | forNames: p contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         hasTargetSlot = ( |
            | "does this chain end in a slot?" false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | prevLink hash ^^ targetMirror hash ^^ name hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing shorthands; child must implement one of these\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         isAllSlots = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         isMethod = ( |
            | targetMirror isReflecteeMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrefixOf: c = ( |
            | c isSuffixOf: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         isSuffixOf: c = ( |
            | = c ifTrue: true False: [prevLink isSuffixOf: c]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing shorthands; child must implement one of these\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         keywordExpression = ( |
            | 
            "answer a string containing an expression of same or 
            higher precedence as keyword message"
            unaryExpression).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing shorthands; child must implement one of these\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         keywordMirrorExpression = ( |
            | 
            "answer a string containing an expression of same or 
            higher precedence as keyword message, for a mirror on me"
            unaryMirrorExpression).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         names = ( |
            | prevLink names addLast: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing shorthands; child must implement one of these\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         okToCondenseExpression = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'orderedClonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         placeHolderExpression = ( | {
                 'ModuleInfo: Module: chain InitialContents: FollowSlot'
                
                 r <- ''.
                } 
            | 
             "return string (or method) to put in to to-be-patched slot"
            r: '*** circular reference to ', printString, ' ***'.
            r: r canonicalize storeString.
            isMethod   ifTrue: ['( ', r, ' )'] 
                        False:      r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         referenceToDummy = ( |
            | 
            referenceToDummyBase, ' -> ()').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         referenceToDummyBase = ( |
             p.
            | 
            p: prevLink referenceToDummyBase.
            targetMirror isReflecteeVector 
              ifTrue: ['((', p, ') \\/-> ', bootstrapStubName, ')' ]
               False: [      p,     ' -> ', bootstrapStubName      ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         statePrintString = ( |
            | 
            names reduceWith: [|:a. :b| a, ' ', b]
                    IfSingleton: [|:a| a]
                    IfEmpty: 'lobby').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         targetSlot = ( |
            | error: 'last link in chain is not a slot').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing shorthands; child must implement one of these\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         unaryExpression = ( |
            | 
            "answer a string containing an expression of same or 
            higher precedence as unary message"
            '(', keywordExpression, ')').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> () From: ( | {
         'Category: accessing shorthands; child must implement one of these\x7fModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         unaryMirrorExpression = ( |
            | 
            "answer a string containing an expression of same or 
            higher precedence as unary message for a mirror on me"
            '(', keywordMirrorExpression, ')').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         = c = ( |
            | == c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         copy = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         hash = ( |
            | identityHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         isAllSlots = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         isSuffixOf: c = ( |
            | = c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         name = 'lobby'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         names = ( |
            | list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         okToCondenseExpression = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         referenceToDummyBase = 'bootstrap stub'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: InitializeToExpression: (lobby _Mirror)'
        
         targetMirror = lobby _Mirror.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         targetSlot = ( |
            | (reflect: lobby) at: 'lobby').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         unaryExpression = 'lobby'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'lobbyLink' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         unaryMirrorExpression = 'lobby _Mirror'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         bootstrapStubName = ( |
            | 
            error: 'bootstrap stub not implemented for reflectees yet').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         keywordMirrorExpression = ( |
            | 
            prevLink keywordExpression).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         name = '_MirrorReflectee'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         patchTarget: c FileOutOn: aFileOut = ( |
            | 
            aFileOut patchReflecteeOf: c prevLink To: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         targetMirror = ( |
            | mir).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         unaryExpression = ( |
            | 
            unaryMirrorExpression, ' _MirrorReflectee').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'reflectee' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         unaryMirrorExpression = ( |
            | 
            prevLink unaryExpression).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         bootstrapStubName = ( |
            | 
            name canonicalize storeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         condensedExpressionIfFail: fb = ( |
            | 
            "cannot in general condense, cause slots are moved
            e.g. snapshotAction when filing in"
            "can, though condense some things"

            okToCondenseExpression && [
                | r |
                r: (reflect: lobby) lookupKey: name.
                (r size = 1) && [r first = targetSlot]
            ] ifTrue: [name] False: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         condensedKeywordExpression = ( |
            | 
            condensedExpressionIfFail: [keywordExpression]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         condensedUnaryExpression = ( |
            | 
            condensedExpressionIfFail: [unaryExpression]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         extendForSlot: s = ( |
            | 

            "override to cut out extra lobbies in lobby lobby lobby foo"
            lobbySlot = targetSlot ifTrue: [prevLink extendForSlot: s]
                                    False: [  resend.extendForSlot: s]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         hasTargetSlot = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         initializationToken = ( |
            | 
            targetSlot isAssignable ifTrue: '<-' False: '=').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         isAllSlots = ( |
            | prevLink isAllSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         isInMethod = ( |
            | prevLink isMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         keywordMirrorExpression = ( |
            | 
            isMethod || [ isInMethod ] 
              ifFalse: [resend.keywordMirrorExpresion]
                True: [ 
                  prevLink unaryMirrorExpression,
                  ' _MirrorContentsAt: ',
                  "canonicalize prevents copyMutable"
                  name canonicalize storeString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: InitializeToExpression: ((reflect: lobby) at: \'lobby\')\x7fVisibility: private'
        
         lobbySlot = (reflect: lobby) at: 'lobby'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | targetSlot name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         okToCondenseExpression = ( |
            | 
            isMethod not && [prevLink okToCondenseExpression]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         patchTarget: c FileOutOn: aFileOut = ( |
            | 
            "using visit object aFileOut, write out a patch
            for my final slot to point to contents of c."
            isMethod || [isInMethod] 
              ifTrue: [ aFileOut patchWithMirrorsSlot: self To: c]
               False: [ aFileOut patchSlot: self To: c     ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         targetMirror = ( |
            | targetSlot contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         targetObject = ( |
            | targetMirror reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         unaryExpression = ( |
            | 
            isMethod ifTrue: [
                error: 'cannot directly name method in ', printString.
            ].
            isInMethod 
                ifTrue: [ unaryMirrorExpression, ' _MirrorReflectee' ]
                 False: [ 
                   lobbyLink = prevLink "lobbyLink must be receiver!"
                    ifTrue: [ name] 
                     False: [ prevLink unaryExpression, ' ', name]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'slot' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         unaryMirrorExpression = ( |
            | 
            isMethod || [ isInMethod ] ifTrue: [resend.unaryMirrorExpression] 
                                        False: [ unaryExpression, ' _Mirror']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         bootstrapStubName = ( |
            | 
            index storeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         keywordExpression = ( |
            | 
            prevLink unaryExpression,  ' _At: ',  index printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | index printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot'
        
         patchTarget: c FileOutOn: aFileOut = ( |
            | 
            aFileOut patchVector: prevLink Index: index To: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         targetMirror = ( |
            | 
            reflect:  
              prevLink targetMirror reflecteeAt: index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         targetSlot = ( |
            | 
            fakeSlot vectorElement 
              copyMirror: prevLink targetMirror  ElementIndex: index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'chains' -> 'vectorElement' -> () From: ( | {
         'ModuleInfo: Module: chain InitialContents: FollowSlot\x7fVisibility: public'
        
         unaryMirrorExpression = ( |
            | 
            unaryExpression, ' _Mirror').
        } | ) 



 '-- Side effects'

 globals modules chain postFileIn
