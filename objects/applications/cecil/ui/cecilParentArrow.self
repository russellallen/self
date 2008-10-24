"Sun-$Revision: 9.1 $"

"parentArrow"

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ parentArrow = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ parentArrow = () |)

traits parentArrow _Define: ( |
    _ parent* = traits cecilArrow.
    
    "parameters"
    
    _ arrowWidth = 3.
    
    _ myColor = (cecilUIColors parentArrow).
    _ otherColor = (cecilUIColors methodArrow).
    _ myPlaneMask = 16r40.
    _ otherPlaneMask = 16r80.
|)


parentArrow _Define: cecilArrow clone _AddSlots: (|
    _ parent* = traits parentArrow.
| )
