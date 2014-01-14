"Sun-$Revision: 9.1 $"

"cecilFieldsPane"

"This is a pane within a cecilObjectBox which displays fields.
 Its contents are cecilFieldEntries.
 Currently, only fields that have values other than the defaults
 are displayed.  Such fields are in the states dictionary for
 the object."

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilFieldsPane = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilFieldsPane = () |)

traits cecilFieldsPane _Define: ( |
    
    _ parent* = traits cecilObjectPane.
    
    "creating"
    
    "makes a new pane, and for fields in the states dictionary,
     makes cecilFieldEntries."
    ^ createOn: cecilObjBox = ( | newPane |
	newPane: copy.
	newPane container: cecilObjBox.
	cecilObjBox cecilObj states
	    do: [ | :value :key fieldEntry |
	    fieldEntry: cecilFieldEntry createForField: key
		WithValue: value
		On: newPane.
	    newPane components add: fieldEntry.
	    newPane updateMaxWidth: fieldEntry label.
	].
	newPane container updateMaxWidth: newPane maxEntryWidth.
	newPane ).
    
    ^ printString = 'cecilFieldsPane'
| )

cecilFieldsPane _Define: (cecilObjectPane copy) _AddSlots: ( |
    _ parent* = traits cecilFieldsPane.
| )
