"diff.st - A public domain implementation of the diff algorithm"

"$Revision: 30.1 $"

"	NAME		diff
	AUTHOR		miw@cs.man.ac.uk
	FUNCTION McIlroy-Hunt diff algorithm for SequenceableCollections 
	ST-VERSIONS	4.0 4.1
	PREREQUISITES	 
	CONFLICTS	
	DISTRIBUTION  	world
	VERSION		1.2
	DATE	3 Nov 1993
SUMMARY	diff
	is an implementation of the McIlroy-Hunt ""diff"" algorithm, for
   SequenceableCollections.  An example of its use is in conflicts.st.


Test example using files /tmp/[12]
  Smalltalk
   | b s1 s2 |
   b := [:n| (Filename named: n)
     contentsOfEntireFile asSequenceableCollection: Character cr].
   s1 := b value: '/tmp/1'.
   s2 := b value: '/tmp/2'.
   20 timesRepeat: [Transcript show: (Time millisecondsToRun: 
     [s1 longestCommonSubsequence: s2]) printString ; cr]

  Self
   | b s1 s2 |
   b := [:n| (self selfLobby unixFile openForReading: n asSelfString)
     contents asSmalltalkString asSequenceableCollection: Character nl].
   s1 := b value: '/tmp/1'.
   s2 := b value: '/tmp/2'.
   20 timesRepeat: [Transcript show: (Time millisecondsToRun: 
     [s1 longestCommonSubsequence: s2]) printString ; cr]

"!



!Dictionary class methodsFor: 'equivalence classes'!

withPositionsOf: aCollection
	"Create a Dictionary that maps each element of aCollection to the set of positions it occupies in aCollection."
	
	^self withPositionsOf: aCollection inInterval: (1 to: aCollection size)!

withPositionsOf: aCollection inInterval: anInterval
	"Create a Dictionary that maps each element of aCollection to the set of positions it occupies in aCollection, restricted to the elements within the range of indexes specified by anInterval."
	
	| d | 
	d := self new.
	anInterval do:
		[ :index || element dictIndex assoc |
			element := aCollection at: index.
			dictIndex := d findKeyIndex: element.
			(assoc := (d basicAt: dictIndex)) == nil
				ifFalse: [assoc value addLast: index]
				ifTrue: [d atNewIndex: dictIndex put:
							 (Association 
									key: element
									value: (OrderedCollection with: index))]].
	^d

	"This loop is simpler and equivalent, but does two probes per element:
	anInterval do:
		[ :index || element |
			element := aCollection at: index.
			(d includesKey: element)
				ifTrue: [(d at: element) addLast: index]
				ifFalse: [d add: (Association 
									key: element
									value: (OrderedCollection with: index))]]"! !

Link subclass: #LinkElement
	instanceVariableNames: 'value '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Collections-Support'!
LinkElement comment:
'I am a link which knows its next link and also has a value.'!


!LinkElement methodsFor: 'accessing'!

value
	^value!

value: aValue
	value := aValue! !


!SortedCollection methodsFor: 'adding'!

indexForInserting: newObject 
	| index low high |
	low := firstIndex.
	high := lastIndex.
	[index := high + low // 2.
	low > high]
		whileFalse: 
			[(self sortBlock value: (self basicAt: index) value: newObject)
				ifTrue: [low := index + 1]
				ifFalse: [high := index - 1]].
	^low!

replaceNextLargerWith: aValue
	"Find the place at which aValue would normally be inserted into
	 the collection.  If that place is already occupied by aValue, do 
	 nothing, and return nil.  If the place does not exist (i.e., it is off
	 the end of the collection), add it to the end, otherwise replace
	 the element at that point with aValue.

	Because this operation preserves the sort order, it can be implemented
	in an efficient and direct way."

	| index |
	index := self indexForInserting: aValue.
	index > lastIndex
		ifTrue: [super addLast: aValue.
				^self size].
	(self basicAt: index) = aValue
		ifTrue: [^nil].
	self basicAt: index put: aValue.
	^index - firstIndex + 1! !


!SequenceableCollection methodsFor: 'computing differences'!

inverseMatchVector: matchVector
	"If matchVector maps the matching elements of another collection onto me, compute the matchVector that maps me onto the collection."
	| inverseMatchVector |
	inverseMatchVector := Array new: self size.
	1 to: matchVector size do: [ :i |
		(matchVector at: i) notNil
			ifTrue: [inverseMatchVector at: (matchVector at: i) put: i]].
	^inverseMatchVector!

longestCommonSubsequence: anOrderedCollection
	| aStart aFinish bStart bFinish matchVector bMatches thresh links | 
	"This method computes the longest common subsequence in self and anOrderedCollection.
	It uses the algorithm described in A Fast Algorithm for Computing Longest Common Subsequences, CACM, vol.20, no.5, pp.350-353, May 1977, with a few minor improvements to improve the speed."

	"First we prune off any common elements at the beginning or end."
	aStart := 1.
	aFinish := self size.
	bStart := 1.
	bFinish := anOrderedCollection size.
	matchVector := Array new: self size.
	[((aStart <= aFinish) and: [bStart <= bFinish])
	and: [(self at: aStart) = (anOrderedCollection at: bStart)]]
		whileTrue: [matchVector at: aStart put: bStart.
					aStart := aStart + 1.
					bStart := bStart + 1].

	"now the end"
	[((aStart <= aFinish) and: [bStart <= bFinish])
	and: [(self at: aFinish) = (anOrderedCollection at: bFinish)]]
		whileTrue: [matchVector at: aFinish put: bFinish.
					aFinish := aFinish - 1.
					bFinish := bFinish - 1].

	"Now compute the equivalence classes of positions of elements"
	bMatches := Dictionary withPositionsOf: anOrderedCollection
							inInterval: (bStart to: bFinish).

	thresh := SortedCollection new sortBlock: [:x :y | x < y].
	links := Array new: ((aFinish - aStart + 1) min: (bFinish - bStart + 1)).

	aStart to: aFinish do: [ :i || ai |
		ai := self at: i.
		(bMatches includesKey: ai)
			ifTrue:
				[(bMatches at: ai) reverseDo:
					[ :j || k link |
						k := thresh replaceNextLargerWith: j.
						k notNil ifTrue:
							[link := LinkElement new.
							 k > 1 ifTrue: [link nextLink: (links at: k - 1)].
							 link value: (Array with: i with: j).
							 links at: k put: link]]]].

	thresh size > 0
		ifTrue:
			[| link |
			 link := links at: thresh size.
			 [matchVector at: (link value at: 1) put: (link value at: 2).
			  link nextLink notNil] whileTrue:
				[link := link nextLink]].

	^matchVector! !


!Set methodsFor: 'private'!

atNewIndex: i put: e
  self basicAt: i put: e.
  tally := tally + 1
!

!String methodsFor: 'converting'!

asSequenceableCollection: aChar
        "Answer a Collection of lines in me.  The end-of-line character is aChar."
        | lines lastEOL |
        lines := OrderedCollection new.
        lastEOL := 0.
        1 to: self size do: [ :i |
                (self at: i) = aChar
                        ifTrue: [lines addLast: (self copyFrom: lastEOL + 1 to: i - 1).
                                        lastEOL := i]].
        lastEOL = self size             "deal with last line if not terminated"
                ifFalse: [lines addLast: (self copyFrom: lastEOL+1 to: self size)].
        ^lines! !


