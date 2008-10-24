"Sun-$Revision: 30.6 $"
 
"Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
 See the LICENSE file for license information."
 

( | 
  "_" parent* = traits oddball.

  "^" core__decl = ( |
      "^" isTypedef = (
          "Return true if this declaration is a typedef."
          decl__specifiers is_sc__decl__specifiers && 
          [decl__specifiers storage__class token source = 'typedef'].
        ).
 
      "^" declNames = (
          "Return list of names that are being declared."
          init__declarator__list declNames1.
        ).
 
      "^" initialize_node: stack = (
          | tdf. |
          false ifTrue: [
              (isTypedef ifTrue: 'typedef' False: 'non-typedef') print.
              ' decl of ' print.
              declNames printLine.
          ].
          tdf: (typedefFilter: stack).
          tdf enterNames: declNames Typedeffed: isTypedef.
          self.
        ).
    | ).

  "^" storage__class__specifier = ( |
      "^" isTypedef1 = ( 'typedef' =  token source. ).
    | ).

  "^" init__declarator__list = ( |
      "^" declNames1 = (
          "Return list of all names declared by this declarator_list."
          | names <- list. |
          names: names copy.
          elements do: [|:iDeclarator| names add: iDeclarator declName].
          names.
        ).
    | ).
 
  "^" init__declarator = ( |
      "^" declName = (
          "Return name that is being declared."
          declarator declName1.
        ).
    | ).
 
  "^" declarator = ( |
      "^" declName1 = (
          direct__declarator direct__declarator__part1 declName2.
        ).
    | ).
 
  "^" paren__declarator = ( |
      "^" declName2 = ( declarator declName1. ).
    | ).
 
  "^" type__specifier__or__type__qualifier = ( |
      "^" isTypedef1 = false.
    | ).
 
  "^" declarator__identifier = ( |
      "^" declName2 = ( id name token source. ).
    | ).

  "^" start__scope = ( |
      "^" initialize_node: stack = (
          | tdf. |
          tdf: (typedefFilter: stack).
          tdf enterScope.
          self.
        ).
    | ).

  "^" end__scope = ( |
      "^" initialize_node: stack = (
          | tdf. |
          tdf: (typedefFilter: stack).
          tdf exitScope.
          self.
        ).
    | ).

    
    "shared_behavior describes slots to be added to the common ancestor 
     (traits) of all tree nodes. This is the 'stGramNode traitsSkeleton' 
     in the Ansi-C 'stGrammar' object. 
     shared_behavior_proto describes slots to be added to 
     'stGramNode protoSkeleton'. 
     These slots will be copied down into all concrete tree nodes."

  "^" shared_behavior = ( |
      "_" typedefFilter: stack = ( stack parser prevParser. ).

      "_" traceInitialization = ( 
          false ifTrue: ['initializing 'print. printLine].
          self.
        ).
    | ).
   
  "^" shared_behavior_proto = ( | 
    | ).
| )
