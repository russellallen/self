"$Revision: 30.1 $"
"script to go through raw modules and fix copyDowns to new scheme"
"8/27/93 -- DMU"

(reflect: modules raw) do: [|:s|
    ( s contents "the raw module"
       contentsAt: 'copyDowns' IfFail: [reflect: ()]
     ) do: [ "need to change each slot in copyDowns, slot_0, slot_1, etc"
        |:s. cdm. aString. a. f. c. cString <- ''|

        cdm: s contents.

	"get names of slots to add"
	aString: (cdm contentsAt: 'slotsToAdd' IfFail: [reflect: '']) reflectee.
	a: module getSlotNames: aString.

	"get chains of from-objects"
        f: module getSlotChains: cdm reflectee from.

        "find names of any slotsToAdd that ARE in from-objects,
         need to force these"
        c: a copyFilteredBy: [|:n| 
	    f findFirst: [|:fromChain| 
	        fromChain targetMirror includesName: n
            ] IfPresent: true
              IfAbsent:  false.
        ].
        "c is list of slotsToChange, stringify if any"
	c isEmpty ifFalse: [
	    c doFirst: [|:n| cString: n]
	       MiddleLast: [|:n| cString: cString, ' ', n]
               IfEmpty: ''.
            cdm: cdm copyAt: 'slotsToChange' Put: reflect: cString.
        ].	 
        (
          cdm reflectee to, 
	  '\n\t slotsToAdd     ', aString,
          '\n\t slotsToChange  ', cString, '\n\n'
        ) print.

	cdm: cdm copyRemoveSlot: 'slotsToRemove' IfFail: [cdm].
	cdm: cdm copyRemoveSlot: 'slotsToAdd'    IfFail: [cdm].


	s contents: cdm.
    ].
].
        

        
    
