"Second part of Object.st -- see that file for copyright
info"

"Modified by Mario Wolczko, July 1995"

"$Revision: 30.1 $"


!Object methodsFor: 'errors'!

primitiveFailed
    self error: 'primitive operation failed'
!

shouldNotImplement
    self error: 'should not implement'
!

halt
    self selfLobby halt!

subclassResponsibility
    self error: 'the method is the responsibility of the subclass'
!

notYetImplemented
    self error: 'not yet implemented'
! !

!Object methodsFor: 'primitives'!

asObject
    <primitive: '_AsObject'>
    self primitiveFailed!

asOop
    "not quite the right thing, but close enough for government work"
    <primitive: '_ObjectID'>
    self primitiveFailed!

error: message
    ^self selfLobby error: message asSelfString!

hash
    <primitive: '_IdentityHash'>
    self primitiveFailed!

undefinedSelector: s type: t delegatee: d methodHolder: mh arguments: a
   "This is the message sent by the Self VM when a message is not understood."
   | arr |
   arr := Array new: a size.  "a is a Self vector"
   a do: [ :el :i | arr at: i+1 put: el].
   ^self doesNotUnderstand: 
     (Message
       selector: (Symbol intern: (String fromSelfString: s))
       arguments: a)!

perform: s
	<primitive: '_Perform: s selfCanonicalString '>
	self primitiveFailed
!

perform: s with: a
	<primitive: '_Perform: s selfCanonicalString With: a '>
	self primitiveFailed
!

perform: s with: a1 with: a2
	<primitive: '_Perform: s selfCanonicalString With: a1 With: a2 '>
	self primitiveFailed
!

perform: s with: a1 with: a2 with: a3
	<primitive: '_Perform: s selfCanonicalString With: a1 With: a2 With: a3 '>
	self primitiveFailed
!

perform: s with: a1 with: a2 with: a3 with: a4
	<primitive: '_Perform: s selfCanonicalString With: a1 With: a2 With: a3 With: a4 '>
	self primitiveFailed
!

doesNotUnderstand: m
   ^self selfLobby error: m selector asSelfString, ' was not understood'
! !


!Object methodsFor: 'testing'!

isKindOf: aClass
    ^(self isMemberOf: aClass) or:
    	[ self class inheritsFrom: aClass ]
!

isMemberOf: aClass
    "Returns true if the receiver is an instance of the class 'aClass'"
    ^self class == aClass
! !



!Object methodsFor: 'copying'!

copy
    ^self shallowCopy
!

shallowCopy
    <primitive: '_Clone'>
    self primitiveFailed
!

deepCopy
    self notYetImplemented
! !



!Object methodsFor: 'class membership'!

species
    ^self class
!

yourself
    ^self
! !



!Object methodsFor: 'dependents access'!

addDependent: anObject
    | dependencies |
    dependencies := Smalltalk dependenciesAt: self.
    dependencies isNil ifTrue:
    	[ dependencies := Set new.
	  (Smalltalk at: #Dependencies) at: self put: dependencies ].
    dependencies add: anObject
!

removeDependent: anObject
    | dependencies |
    dependencies := Smalltalk dependenciesAt: self.
    dependencies notNil ifTrue:
    	[ dependencies remove: anObject ifAbsent: [] ]
!

dependents
    | dependencies |
    dependencies := Smalltalk dependenciesAt: self.
    dependencies isNil ifTrue: [ dependencies := Set new ].
    ^dependencies asOrderedCollection
!

release
    " +++ I'm not sure that this is the right thing to do here; the book is
      so vague... "
    (Smalltalk at: #Dependencies) removeKey: self
! !



!Object methodsFor: 'change and update'!

changed
    self changed: self
!

changed: aParameter
    | dependencies |
    dependencies := Smalltalk dependenciesAt: self.
    dependencies notNil ifTrue:
    	[ dependencies do:
	    [ :dependent | dependent update: aParameter ] ]
!

update: aParameter
    "Default behavior is to do nothing"
!

broadcast: aSymbol
    | dependencies |
    dependencies := Smalltalk dependenciesAt: self.
    dependencies notNil ifTrue:
    	[ dependencies do:
	    [ :dependent | dependent perform: aSymbol ] ]
!

broadcast: aSymbol with: anObject
    | dependencies |
    dependencies := Smalltalk dependenciesAt: self.
    dependencies notNil ifTrue:
    	[ dependencies do:
	    [ :dependent | dependent perform: aSymbol with: anObject ] ]
! !



!Object methodsFor: 'printing'!

printString
    | stream |
    stream := WriteStream on: (String new: 0).
    self printOn: stream.
    ^stream contents
!

printOn: aStream
    | article nameString |
    nameString := self classNameString.
    article := nameString first isVowel ifTrue: [ 'an ' ] ifFalse: [ 'a ' ].
    article printOn: aStream.
    nameString printOn: aStream
! !



!Object methodsFor: 'private'!

classNameString
    | name |
    name := self class name.
    name isNil
    	ifTrue: [ name := self name , ' class' ].
    ^name

! !


!Object methodsFor: 'storing'!

storeString
    | stream |
    stream := WriteStream on: (String new: 0).
    self storeOn: stream.
    ^stream contents
!

storeOn: aStream
    | class hasSemi |
    class := self class.
    aStream nextPut: $(.
    aStream nextPutAll: self classNameString.
    hasSemi := false.
    class isVariable
    	ifTrue: [ aStream nextPutAll: ' basicNew: '.
	    	  self basicSize printOn: aStream ]
    	ifFalse: [ aStream nextPutAll: ' basicNew' ].
    1 to: class instSize do:
    	[ :i | aStream nextPutAll: ' instVarAt: '.
	       i printOn: aStream.
	       aStream nextPutAll: ' put: '.
	       (self instVarAt: i) storeOn: aStream.
	       aStream nextPut: $;.
	       hasSemi := true ].
    class isVariable ifTrue: 
    	[ 1 to: self basicSize do:
	    [ :i | aStream nextPutAll: ' basicAt: '.
	    	   i printOn: aStream.
		   aStream nextPutAll: ' put: '.
		   (self basicAt: i) storeOn: aStream.
		   aStream nextPut: $;.
		   hasSemi := true ] ].
    hasSemi ifTrue: [ aStream nextPutAll: ' yourself' ].
    aStream nextPut: $)
! !




!Object methodsFor: 'debugging'!

inspect
    | class instVars instVal |
    class := self class.
    instVars := class instVarNames.
    'An instance of ' print.
    class printNl.
    1 to: instVars size do:
    	[ :i | '  ' print.
	       (instVars at: i) print.
	       ': ' print.
	       (self instVarAt: i)  printNl ]
! !

