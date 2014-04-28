"Sun-$Revision: 9.1 $"

"cecilBoxLayout"

"This object contains constants which are used for sizing of boxes in the"
"cecil ui.  It also contains fonts.  These fonts can be used as parameters"
"to the bitmap drawing methods which require a font."
"However, in order to use them, initFor: win must have been executed."
"The cecil ui calls this method once at initialization time."

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilBoxLayout = () | )
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilBoxLayout = () | )

traits cecilBoxLayout _Define: ( |
    _ parent* = traits clonable.
    
    "initializing"
    ^ initFor: win = (initFontsFor: win).
    
    _ initFontsFor: win = (
	boxFont: font copyName: preferences boxFont
	    On: win
	    IfFail: [ | :e | ^ cannotLoadFontError ].
	boxPublicFont: font copyName: preferences boxPublicFont
	    On: win
	    IfFail: [ | :e | ^ cannotLoadFontError ].
	boxPrivateFont: font copyName: preferences boxPrivateFont
	    On: win
	    IfFail: [ | :e | ^ cannotLoadFontError ].
	self ).
    
    _ cannotLoadFontError = (
	error:
	    'The cecil ui tried to load these fonts:\n',
	    '    ', preferences boxFont, '\n',
	    '    ', preferences boxPublicFont, '\n',
	    '    ', preferences boxPrivateFont, '\n',
	    'At least one of them  could not be loaded.\n',
	    'Check if it is available using \'xlsfonts\' from a shell,\n',
	    'or you can change the required fonts in your\n',
	    'preferences file; see defaultPreferences.self' ).
    
    ^ printString = 'a cecilBoxLayout'.
    
| )

cecilBoxLayout _Define: ( |
    _ parent* = traits cecilBoxLayout.
    
    ^ boxFont. "fonts can be queried for width and height"
    ^ boxPublicFont.
    ^ boxPrivateFont.
    
    ^ boxOutlineWidth = 2.
    
    ^ leftMargin = 5.
    ^ rightMargin = 5.
    ^ topMargin = 5.
    ^ bottomMargin = 8.
    
    ^ leftMethodBoxMargin = 5.
    ^ rightMethodBoxMargin = 5.
    ^ topMethodBoxMargin = 5.
    ^ bottomMethodBoxMargin = 5.
    
    ^ leftPaneMargin = 5.
    ^ rightPaneMargin = 15.
    ^ topPaneMargin = 5.
    ^ bottomPaneMargin = 5.
    
    ^ methodBodyPaneMargin = 7.
    ^ menuMargin = 5.
    ^ menuHighlightMargin = 2.

    ^ verticalSpacing = 1.2.
    ^ marginBetweenPanes = 5.
    
    ^ tailDiameter = 8.
| )
