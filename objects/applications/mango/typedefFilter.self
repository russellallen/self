"Sun-$Revision: 30.6 $"
 
"Copyright 1992-2012 AUTHORS.
 See the LICENSE file for license information."

"                                                Ole Agesen, November 1992."



traits mango parsers typedefFilter _Define: ( |
    "Used to remove the typedef ambiguity in C. Will pass its input unchanged
     onto output, except that some of the {identifier} tokens will be changed
     to kind {typedef_name}."
  "_" parent*         = traits mango parsers filter.
  "_" isCaseA         = false.   "See comment 11/11/92."
  "^" printString     = ( 'typedefKludge'. ).
  "^" getMyState      = ( error: 'unimplemented - too expensive (not needed)'. ).
  "^" setMyState: s   = ( error: 'unimplemented - too expensive (not needed)'. ).
  "_" typedef_kind    = 'typedef_name'.
  "_" identifier_kind = 'identifier'.
  "_" takeNewInput    = ( typedefFilterInit. resend.takeNewInput. ).

  "^" dump = (
      print. ': ' print.
      typedefs do: [|:entry. :name|
          name print. ' \t' print.
          entry isTypedeffed printLine.
      ].
      self.
    ).

  "_" computeOutput = (
      (currentInputToken_id = identifier_id) && 
      [isTypedeffed: currentInput source] ifTrue: [
          output: currentInput copy.
          output token_id:   typedef_id.
          output token_kind: typedef_kind.
      ] False: [
          output: currentInput.
      ].  
      trace ifTrue: [
          (output token_id = typedef_id) || 
          [output token_id = identifier_id] ifTrue: [
              traceLine: '\n', output token_kind, ': \t', output source, '\n'.
          ] False: [
              traceLine: output source.
          ].
      ].
      self.
    ).

  "^" computeIOTypes = (
      outputTypes: inputTypes copy.
      identifier_id: (inputTypes at: identifier_kind IfAbsent: [
          error: printString, ': did not find kind \'',
                 identifier_kind, '\' on input'.
      ]).
      (inputTypes includesKey: typedef_kind) ifTrue: [
          error: printString,  ': already has kind \'', 
                 typedef_kind, '\' on input'.
      ].
      typedef_id: (unusedToken_id: outputTypes).
      outputTypes at: typedef_kind Put: typedef_id.
      resend.computeIOTypes.
    ).

  "_" tdEntry = ( |
      "_" parent*       = traits clonable.
      "^" oldEntry     <- nil. "Will be non-nil if this entry overrides another."
      "^" isTypedeffed <- false.
    | ).

  "^" enterNames: names Typedeffed: typedeffed = (
      | entry. oldEntry. |
      names do: [|:name|
          typedeffed != (isTypedeffed: name) ifTrue: [
              "Don't bother registering if this name already has an entry
               with the same value of the 'typdeffed' boolean."
              oldEntry: (typedefs at: name IfAbsent: nil).
              entry: tdEntry copy.
              entry oldEntry: oldEntry.
              entry isTypedeffed: typedeffed.
              typedefs at: name Put: entry.
              scopeStack push: name.
          ].
      ].
      self.
    ).

  "^" enterScope = (
      scopeStack push: nil.   "Scope starts are marked by nil."
      self.
    ).

  "^" exitScope = (
      "Restore old entries (if any) for the names defined in this scope."
      | name <- 'fisk'. |
      [name: scopeStack topPop. nil != name] whileTrue: [
          | entry. |
          entry: (typedefs at: name).
          nil = entry oldEntry ifTrue: [
              typedefs removeKey: name.
          ] False: [
              typedefs at: name Put: entry oldEntry.
          ].
      ].
      self.
    ).

  "_" isTypedeffed: name = (
      (typedefs at: name IfAbsent: [^ false]) isTypedeffed.
    ).

  "_" typedefFilterInit = (
      typedefs removeAll.
      scopeStack reset.
      self.
    ).

  "_" init = (
      typedefs:   typedefs   copy.
      scopeStack: scopeStack copy.
      typedefFilterInit.
      resend.init.
    ).
| )

(mango parsers typedefFilter _Define: 
 mango parsers filter clone _AddSlots: ( |
  "_" parent* = traits mango parsers typedefFilter.
 "^_" outputTypes        <- dictionary.
 "^_" identifier_id      <- -1.
 "^_" typedef_id         <- -1.
  "_" typedefs           <- dictionary.             "Map name to typedefEntry."
  "_" scopeStack         <- mango parsers stack.    "To track local decl's."
| ))

"This is a case B parser so 'posOfOutput = posOfInput', always."
mango parsers typedefFilter _RemoveSlot: 'storedPosOfOutput'
