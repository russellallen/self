"Sun-$Revision: 9.1 $"

"methodArrow"


traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ methodArrow = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ methodArrow = () |)

traits methodArrow _Define: ( |
    _ parent* = traits cecilArrow.
    
    "parameters"
    
    _ arrowWidth = 3.
    
    _ myColor = (cecilUIColors methodArrow).
    _ otherColor = (cecilUIColors parentArrow).
    _ myPlaneMask = 16r80.
    _ otherPlaneMask = 16r40.
|)


methodArrow _Define: (cecilArrow copy) _AddSlots: (|
    _ parent* = traits methodArrow.
| )
