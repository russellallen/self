"Sun-$Revision: 9.1 $"

"cecilParentsPane"

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilParentsPane = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilParentsPane = () |)

traits cecilParentsPane _Define: ( |
    
    _ parent* = traits cecilObjectPane.
    
    "creating"
    ^ createOn: cecilObjBox = ( | newPane |
	newPane: copy.
	newPane container: cecilObjBox.
	cecilObjBox cecilObj isaSpecs do: [
	    | :parent. parentObj. parentEntry. |
	    parentObj: parent object.
	    parentEntry:
		cecilParentEntry createFor: parentObj
		Kind: 'isa'
		On: newPane.
	    newPane components add: parentEntry.
	    newPane updateMaxWidth: parentEntry label.
	].
	
	cecilObjBox cecilObj parentSpecs do: [
	    | :parent. parentObj. parentEntry. |
	    parentObj: parent object.
	    parentEntry:
		cecilParentEntry createFor: parentObj
		Kind: 'inherits'
		On: newPane.
	    newPane components add: parentEntry.
	    newPane updateMaxWidth: parentEntry label.
	].
	
	cecilObjBox cecilObj supertypeSpecs do: [
	    | :parent. parentObj. parentEntry. |
	    parentObj: parent object.
	    parentEntry:
		cecilParentEntry createFor: parentObj
		Kind: 'subtypes'
		On: newPane.
	    newPane components add: parentEntry.
	    newPane updateMaxWidth: parentEntry label.
	].
	
	newPane container updateMaxWidth: newPane maxEntryWidth.
	newPane ).
    
    ^ printString = 'cecilParentsPane'
	
| )

cecilParentsPane _Define: (cecilObjectPane copy) _AddSlots: ( |
    _ parent* = traits cecilParentsPane.
| )
