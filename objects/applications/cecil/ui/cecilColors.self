"Sun-$Revision: 9.1 $"

"cecilColors"
"cecilUIColors"

cecilColors _Define: ( |
   _ parent* = traits oddball.

   ^ colorDict <- dictionary copyRemoveAll.

|)


cecilUIColors _Define: ( |
    _ parent* = traits oddball.

    ^ windowBackground = (cecilColors colorDict at: 'snow2').
    ^ boxBackground = (cecilColors colorDict at: 'SeaGreen').
    ^ paneBackground = (cecilColors colorDict at: 'white').

    ^ boxOutline = (cecilColors colorDict at: 'black').
    ^ paneOutline = (cecilColors colorDict at: 'black').

    ^ text = (cecilColors colorDict at: 'black').
    ^ labelText = (cecilColors colorDict at: 'white').

    ^ entryBackground = (cecilColors colorDict at: 'white').
    ^ highlightBackground = (cecilColors colorDict at: 'SeaGreen').
    ^ highlightText = (cecilColors colorDict at: 'white').
    ^ menuHighlight = (cecilColors colorDict at: 'SeaGreen').
    ^ menuBackground = (cecilColors colorDict at: 'grey83').

    ^ parentArrowTail = (cecilColors colorDict at: 'red3').
    ^ methodArrowTail = (cecilColors colorDict at: 'MediumOrchid4').
    ^ fieldArrowTail = (cecilColors colorDict at: 'blue3').

    ^ parentArrow = (colormapEntry copy index: 64).
    ^ methodArrow = (colormapEntry copy index: 128).
    ^ fieldArrow = (colormapEntry copy index: 200).
| )

