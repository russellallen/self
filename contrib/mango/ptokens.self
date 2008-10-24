"Sun-$Revision: 1.1.1.1 $"
 
"Copyright 1992-9 Sun Microsystems, Inc. and Stanford University.
 See the LICENSE file for license information."

"                                                Ole Agesen, September 1992."


traits mango tokens abstractToken _Define: ( |
    "Abstract supertype for all tokens.
     A token is what flows between two parsers. It can
     represent a single charachter, a lexeme, a parse tree and so on."
  "_" parent*       = traits clonable.
  "^" isEndMarker   = false.
  "^" isErrorMarker = false.
  "^" printString   = 'abstractToken'.
  "^" source        = '[not available]'.  "Childs should implement."
  "^" fullSource    = ( source. ).
  "^" token_kind    = ( error: 'childShouldImplement'. ).
  "^" token_id      = ( error: 'childShouldImplement'. ).

  "^" kindPrintString = (
      isEndMarker ifTrue: ['<end of input>']
                   False: ['\'', token_kind, '\''].
    ).
| )

mango tokens abstractToken _Define: ( |
      {} = 'IsComplete: '.
  "_" parent* = traits mango tokens abstractToken.
| )


traits mango tokens charToken _Define: ( |
  "_" parent*     = traits mango tokens abstractToken.
  "^" printString = ( 'charToken(', source, ')'. ).

  "^" set_token_id: id = (
      token_id: id.
      token_kind: token_id asCharacter asString.
      source: token_kind.
    ).
| )

(mango tokens charToken _Define: 
 mango tokens abstractToken copy _AddSlots: ( |
  "_" parent*     = traits mango tokens charToken.
  "^" token_id   <- 65.   "NB: token_id and token_kind may change while"
  "^" token_kind <- 'A'.  "source stays the same (when using char classes)."
 "^_" source     <- 'A'.
| ) )


traits mango tokens token _Define: ( |
  "_" parent*       = traits mango tokens abstractToken.
  "^" printString   = ( 'token(', source, ')'. ).
  "^" set_source: s = ( source: s. ).

  "^" fullSource    = (
      "Source and source for whitespace."
      nil != whitespace ifTrue: [whitespace source, source] 
                         False: [source].
    ).
| )

(mango tokens token _Define: 
 mango tokens abstractToken copy _AddSlots: ( |
  "_" parent*     = traits mango tokens token.
 "^_" source     <- ''.
  "^" token_kind <- ''.
  "^" token_id   <- 65.
  "^" whitespace <- nil. "Preceeding whitespace token if any; else 'nil'."
| ) )


mango tokens endMarker _Define: mango tokens token copy _AddSlots: ( |
  "^" isEndMarker = true.
| )

mango tokens endMarker token_kind: mango grammars grammar endMarker kind
mango tokens endMarker set_source: ''


mango tokens errorMarker _Define: mango tokens token copy _AddSlots: ( |
  "^" isErrorMarker = true.
  "^" errorMessage <- 'no error yet'.
| )

mango tokens errorMarker token_kind: 'errorMarker_internal0000'
mango tokens errorMarker token_id: -3 "All error markers have this token_id"
mango tokens errorMarker set_source: ''


traits mango tokens node _Define: ( |
  "_" parent* = traits mango tokens abstractToken.

    "'initialize_node:' is sent to each node during tree building
     (bottom up). Can be used to perform any side-effecting user-level
     initialization. For actions that are not time critical in
     the sense that they must take place *during* parsing it is highly
     recommended that they be done in a separate walk of the parse tree
     once parsing has completed."
  "^" initialize_node: stack          = ( self. "Default is do nothing." ). 

  "^" prefix_walk_do: blk = ( 
      blk value: self. 
      children_do: [|:child| child prefix_walk_do: blk].
      self. 
    ).

  "^" suffix_walk_do: blk = ( 
      children_do: [|:child| child suffix_walk_do: blk].
      blk value: self. 
      self. 
    ).

  "^" source = ( error: 'not implemented for node objects'. ).

  "^" fullSource = ( 
      | src. |
      src: '' & ''.     "Ensure that 'flatString' always works below."
      children_do: [|:child| src: src & child fullSource].
      src flatString.
    ).
| )

(mango tokens node _Define: 
 mango tokens abstractToken copy _AddSlots: ( |
  "_" parent* = traits mango tokens node.
| ) )


traits mango tokens gramNode _Define: ( |
    "One of these is generated for each 'stGrammar'."
  "_" parent* = traits mango tokens node.    
  "^" my_grammar <- mango grammars stGrammar.
| )

mango tokens gramNode _Define: mango tokens node copy _AddSlots: ( |
  "_" parent* = traits mango tokens gramNode.
| )


traits mango tokens nodeSkeleton _Define: ( |
    "Note: this parent may be removed for certain tree nodes; 
     specifically those that are not direct descendants of the
     relevant 'stGramNode'."
  "_" parent*     = traits mango tokens gramNode.
  "^" printString = ( token_kind, '_node'. ).
  "^" token_id    = 65.    "This is 'token' protocol."
  "^" token_kind  = ''.    "This is 'token' protocol."  "%%% need source also."
| )

(mango tokens nodeSkeleton _Define: 
 mango tokens gramNode copy _AddSlots: ( |
      {} = 'IsComplete: '.
  "_" parent* = traits mango tokens nodeSkeleton.
| ) )


traits mango tokens listMixin _Define: ( |
  "Methods that are shared between lists with and without separators."
  "^" add_elem: e    = ( elements addLast: e. self. ). "Used during parsing."
  "_" copy_listState = ( elements: elements copy. ).

  "_" list_specific_init = (
      "Called just before the general 'initialize_node:' method.
       We can't just extend the 'initialize_node:' message here since we
       are in a mixin (which would result in ambiguous selector errors)."
      elements: elements asVector. "Save space/time later."
      self.
    ).
| )

traits mango tokens listSepMixin _Define: ( |
  "Methods that are specific to lists with separators."
  "_" parent*        = traits mango tokens listMixin.
  "^" has_separator  = true.
  "^" add_sep:  s    = ( separators addLast: s. self. ). "Used during parsing."
  "_" copy_listState = ( separators: separators copy. resend.copy_listState. ).

  "_" list_specific_init = (
      "Called just before the general 'initialize_node:' method.
       We can't just extend the 'initialize_node:' message here since we
       are in a mixin (which would result in ambiguous selector errors)."
      separators: separators asVector. "Save space/time later."
      resend.list_specific_init.
    ).

  "^" children_do: blk = (
      "Here we exploit that the representation of 'elements' and 'separators'
       is vectors."
      elements isEmpty ifFalse: [
          separators size do: [|:i|
              blk value: (elements   at: i).
              blk value: (separators at: i).
          ].
          blk value: elements last.   "Don't forget the last element."
      ].
      self.
    ).
| )

traits mango tokens listNoSepMixin _Define: ( |
  "Methods that are specific to lists without separators."
  "_" parent*          = traits mango tokens listMixin.
  "^" has_separator    = false.
  "^" children_do: blk = ( elements do: blk. self. ).
| )
