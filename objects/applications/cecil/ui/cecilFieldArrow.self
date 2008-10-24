"Sun-$Revision: 9.1 $"

"fieldArrow"

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ fieldArrow = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ fieldArrow = () |)

traits fieldArrow _Define: ( |
    _ parent* = traits cecilArrow.
    
    "parameters"
    _ arrowWidth = 3.
    
    _ myColor = (cecilUIColors fieldArrow).
    _ myPlaneMask = 16rC0.
|)


fieldArrow _Define: cecilArrow clone _AddSlots: (|
    _ parent* = traits fieldArrow.
| )
