traits graphics _AddSlotsIfAbsent: ( | xPixmapMaker = () | )
globals graphics _AddSlotsIfAbsent: ( | xPixmapMaker = () | )

traits xPixmapMaker _AddSlots: ( |
    parent* = traits xBitmapMaker.

    knownFormat = 1.

    parsePixmapFile: filename = ( | format. |
    	openFile: filename.
	format:  getIntegerDefineWithSuffix: '_format'.
	format != knownFormat ifTrue: [
	    closeFile.
	    error: 'unknown pixmap file format: ', format printString. ].
        getWidth.
        getHeight.
    	getNcolors.
	getCharsPerPixel.
    	skipToNextArray.
	parseColors.
	skipToNextArray.
	parsePixelsIntoData.
	closeFile.
	self ).

    pixmapForPaintManager: ptMgr SameScreenAs: xDrawable = ( | pm. im. colorSymToIndex  |
	colorSymToIndex: dictionary copyRemoveAll.
	pm: xlib pixmap createForSameScreenAs: xDrawable
    	    	                         Size: width @ height
		                        Depth: xDrawable depth.
        im: xDrawable display xGetImage: pm 
			X: 0
			Y: 0
    	    	    Width: width
		   Height: height
		PlaneMask: 16rffff
		   Format: xDrawable zPixmap.
	colorDict do: [ | :v . :k . colorList. index  | 
	   colorList: convertColorString: v.
	   index: ptMgr indexForColor: 
			  (paint copyRed: ((colorList at: 0) / 255.0 )
			           Green: ((colorList at: 1) / 255.0 )
	                            Blue: ((colorList at: 2) / 255.0 )).
	   colorList print. ' ' print. index printLine.
	   colorSymToIndex at: k Put: index.
        ].
	height do: [ | :y | width do: [ | :x | 
	      im xPutPixelX: x 
                          Y: y 
                      Value: colorSymToIndex at: (data at: y) at: x.
	 ]].
	pm display xPutImage: pm 
                          GC: pm display gc 
                       Image: im 
                        SrcX: 0 
                        SrcY: 0 
                       DestX: 0 
                       DestY: 0 
                       Width: pm size x
                      Height: pm size y.
	pm ).
		

    getNcolors = ( nColors: getIntegerDefineWithSuffix: '_ncolors' ).
	
    getCharsPerPixel = (
    	charsPerPixel: getIntegerDefineWithSuffix: '_chars_per_pixel' ).

    parseColors = (
    	colorDict: colorDict copyRemoveAll.
    	nColors do: [ | :i. s. cs. |
    	    s: getNextDoubleQuotedString.
	    cs: getNextDoubleQuotedString.
	    colorDict at: s Put: cs. ].
    	self ).

    getNextDoubleQuotedString = ( | c. s <- ''. |
    	[ c: file readOneChar. c = '"' ] whileFalse: [ ].
	[ c: file readOneChar. c = '"' ] whileFalse: [ s: s, c ].
    	s ).

    getNextDoubleQuotedString: n = ( | c. s. |
    	"get the first n characters from the next double quoted string"
	"and advance past the string"
    	[ c: file readOneChar. c = '"' ] whileFalse: [ ].
	s: file readCount: n.
    	[ c: file readOneChar. c = '"' ] whileFalse: [ ].
	s ).

    convertColorString: cs = ( | n |
	cs = 'black' ifTrue: [ ^ (0 & 0 & 0 ) asList ].
	cs = 'white' ifTrue: [ ^ (255 & 255 & 255 ) asList ].
	n: ( '16r' , cs copyWithoutFirst) eval.
	( ((n >> 16) && 255) &  ((n >> 8) && 255) & (n && 255) ) asList.
	).

    parsePixelsIntoData = ( | sw |
	data: data copySize: height.
	sw: width * charsPerPixel.
      	height do: [ | :j. s. |
	    s: getNextDoubleQuotedString: sw.
	    data at: j Put: data copyRemoveAll copySize: width.
   	    j = height ifTrue: [ j printLine. (data at: j) printLine.].
	    width do: [ | :i. n. pix. |
	    	n: i * 2.
	    	pix: s copyFrom: n UpTo: n + charsPerPixel.
		(data at: j) at: i Put: pix.
    	    ].
    	].
	self ).
| )

xPixmapMaker _AddSlots: ( |
    parent* = traits xPixmapMaker.
    thisObjectPrints = true.

    file <- unixFile.
    height <- 1.
    width <- 1.
    nColors <- 32.
    charsPerPixel <- 2.

    colorDict <- dictionary copyRemoveAll.
    data <- vector copyRemoveAll copyAddLast: vector copyRemoveAll.
| )
