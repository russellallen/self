"Sun-$Revision: 9.1 $"

"cecilColormap"

globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilColormap = () | )
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilColors = () | )
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilUIColors = () | )


cecilColormap _Define: ( |
    _ parent* = traits oddball.
    
    ^ initializeOn: win = (
	uiColormap: colormap copyOn: win.
	fillColormap.
	uiColormap install.
	self).
    
    ^ uiColormap.
    
    _ fillColormap = (
	fillBlackAndWhite.  "must go first"
	fillGreys.          "Greys and colors can be interchanged"
	fillColors.
	fillArrowColors.  "must go last"
	self ).
    
    _ i <- 0. "used as index into colormap"
    
    _ fillBlackAndWhite = ( | color. red. green. blue. |
	color: rgbColor from: rgbColor.
	
	color red: 255.
	color green: 255.
	color blue: 255.
	uiColormap at: i Put: color. "Put white at 0"
	cecilColors colorDict 
	    at: 'white' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 0.
	color green: 0.
	color blue: 0.
	uiColormap at: i Put: color. "Put black at 1"
	cecilColors colorDict 
	    at: 'black' Put: (colormapEntry copy index: i).
	i: i+1.
	
	self ).
    
    _ fillGreys = ( | color. red. green. blue. |
	
	color: rgbColor from: rgbColor.
	
	color red: 69.
	color green: 69.
	color blue: 69.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'grey27' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 99.
	color green: 99.
	color blue: 99.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'grey39' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 135.
	color green: 135.
	color blue: 135.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'grey53' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 179.
	color green: 179.
	color blue: 179.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'grey70' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 212.
	color green: 212.
	color blue: 212.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'grey83' Put: (colormapEntry copy index: i).
	i: i+1.
	
	self ).
    
    
    _ fillColors = (
	fillBlues.
	fillPurples.
	fillPinks.
	fillReds.
 	fillBrowns.
	fillOranges.
	fillYellows.
	fillGreens.
	self ).
    
    _ fillBlues = ( | color. red. green. blue. |
	
	
     	color: rgbColor from: rgbColor.
	
	color red: 238. color green: 233.  color blue: 233.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'snow2' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 108. color green: 166.  color blue: 205.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'SkyBlue3' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 176. color green: 226.  color blue: 255.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'LightSkyBlue1' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 0. color green: 191.  color blue: 255.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'DeepSkyBlue' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 0. color green: 245.  color blue: 255.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'turquoise1' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 0. color green: 238.  color blue: 238.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'cyan2' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 0. color green: 206.  color blue: 209.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'DarkTurquoise' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 79. color green: 148.  color blue: 205.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'SteelBlue3' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 95. color green: 158.  color blue: 160.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'CadetBlue' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 122. color green: 103.  color blue: 238.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'SlateBlue2' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 0. color green: 0.  color blue: 255.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'blue' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 0. color green: 0.  color blue: 205.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'blue3' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 0. color green: 0.  color blue: 139.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'blue4' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 25. color green: 25.  color blue: 112.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'MidnightBlue' Put: (colormapEntry copy index: i).
	i: i+1.
	
	self ).
    
    
    _ fillPurples = ( | color. red. green. blue. |
	
	color: rgbColor from: rgbColor.	
	
	color red: 85. color green: 26.  color blue: 139.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'purple44' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 122. color green: 55.  color blue: 139.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'MediumOrchid4' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 139. color green: 0.  color blue: 139.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'magenta4' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 125. color green: 38.  color blue: 205.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'purple3' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 148. color green: 0.  color blue: 211.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'DarkViolet' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 160. color green: 32.  color blue: 240.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'purple' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 186. color green: 85.  color blue: 211.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'MediumOrchid' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 238. color green: 130.  color blue: 238.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'violet' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 255. color green: 187.  color blue: 255.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'plum1' Put: (colormapEntry copy index: i).
	i: i+1.
	
	self ).
    
    _ fillPinks = ( | color. red. green. blue. |
	
	color: rgbColor from: rgbColor.	
	
	color red: 255. color green: 192.  color blue: 203.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'pink' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 255. color green: 130.  color blue: 171.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'PaleVioletRed1' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 238. color green: 58.  color blue: 140.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'VioletRed2' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 205. color green: 16.  color blue: 118.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'DeepPink3' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 176. color green: 48.  color blue: 96.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'maroon' Put: (colormapEntry copy index: i).
	i: i+1.
	
	self ).
    
    _ fillReds = ( | color. red. green. blue. |
	
	color: rgbColor from: rgbColor.	
	
	color red: 205. color green: 92.  color blue: 92.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'IndianRed' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 205. color green: 0.  color blue: 0.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'red3' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 238. color green: 0.  color blue: 0.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'red2' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 255. color green: 0.  color blue: 0.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'red' Put: (colormapEntry copy index: i).
	i: i+1.
	
	self ).
    
    _ fillOranges = ( |color. red. green. blue. |
	
	color: rgbColor from: rgbColor.	
	
	color red: 255. color green: 160.  color blue: 122.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'LightSalmon' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 250. color green: 128.  color blue: 114.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'salmon' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 255. color green: 127.  color blue: 80.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'coral' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 255. color green: 165.  color blue: 0.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'orange' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 255. color green: 140.  color blue: 0.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'DarkOrange' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 210. color green: 105.  color blue: 30.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'Chocolate' Put: (colormapEntry copy index: i).
	i: i+1.
	self ).
    
    _ fillBrowns = ( |color. red. green. blue. |
	
	color: rgbColor from: rgbColor.	
	
	color red: 160. color green: 82.  color blue: 45.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'sienna' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 205. color green: 133.  color blue: 63.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'tan3' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 139. color green: 105.  color blue: 20.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'goldenrod4' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 205. color green: 170.  color blue: 125.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'burlywood3' Put: (colormapEntry copy index: i).
	i: i+1.
	
	self ).
    
    _ fillYellows = ( |color. red. green. blue. |
	
	color: rgbColor from: rgbColor.	
	
	color red: 255. color green: 193.  color blue: 37.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'goldenrod1' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 255. color green: 215.  color blue: 0.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'gold' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 255. color green: 246.  color blue: 143.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'khaki1' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 255. color green: 255.  color blue: 0.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'yellow' Put: (colormapEntry copy index: i).
	i: i+1.
	
	self ).
    
    _ fillGreens = ( | color |
	
	color: rgbColor from: rgbColor.	
	
	color red: 173. color green: 255.  color blue: 47.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'GreenYellow' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 152. color green: 251.  color blue: 152.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'PaleGreen' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 127. color green: 255.  color blue: 212.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'aquamarine' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 0. color green: 250.  color blue: 154.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'MediumSpringGreen' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 0. color green: 205.  color blue: 102.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'SpringGreen3' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 50. color green: 205.  color blue: 50.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'LimeGreen' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 124. color green: 205.  color blue: 124.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'PaleGreen3' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 60. color green: 179.  color blue: 113.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'MediumSeaGreen' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 46. color green: 139.  color blue: 87.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'SeaGreen' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 34. color green: 139.  color blue: 34.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'ForestGreen' Put: (colormapEntry copy index: i).
	i: i+1.
	
	color red: 0. color green: 100.  color blue: 0.
	uiColormap at: i Put: color.
	cecilColors colorDict 
	    at: 'DarkGreen' Put: (colormapEntry copy index: i).
	i: i+1.
	
	self ).
    
    
    _ fillArrowColors = ( | color |
	
	color: rgbColor from: rgbColor.   "First arrow is red3"
	color red: 205.
	color green: 0.
	color blue: 0.
	[i < 128] whileTrue: [
	    uiColormap at: i Put: color.
	    i: i+1.
	].
	
	color: rgbColor from: rgbColor.   "Second arrow is MediumOrchid4"
	color red: 122.
	color green: 55.
	color blue: 139.
	[i < 192] whileTrue: [
	    uiColormap at: i Put: color.
	    i: i+1.
	].
	
	color: rgbColor from: rgbColor. "Third arrow is blue3"
	color red: 0.
	color green: 0.
	color blue: 205.
	[i < 255] whileTrue: [
	    uiColormap at: i Put: color.
	    i: i+1.
	].
	
	self ).
    
| )
