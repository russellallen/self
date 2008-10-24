on open names
	if (length of names > 1) then
		display dialog "You can only drop one snapshot."
	else
		openSnapshot(first item in names)
	end if
	quit
end open

on openSnapshot(fileName)
	set unixFileName to getUnixFilename(fileName)
	
	-- Here's the line that forces the droplet to be in the same
	-- directory as the snapshot. If anybody knows how to make
	-- Applescript give us the path where the droplet lives,
	-- we would be very very very grateful. Please contact
	-- adam.spitz@sun.com if you can help.
	set dropletDir to pathWithoutLastPiece(unixFileName)
	
	tell application "Terminal"
		-- The double quotes below are necessary so that the application/snapshot paths
		-- are interpreted correctly by the shell even if they include spaces in their names.
		do script with command Â
			"cd \"" & dropletDir & "\"; Self.app/Contents/MacOS/Self -s \"" & unixFileName & "\""
	end tell
end openSnapshot


on idle
	display dialog "You must drop a snapshot."
	quit
end idle


on pathWithoutLastPiece(thePath)
	set myDelim to AppleScript's text item delimiters
	set AppleScript's text item delimiters to {"/"}
	set myList to the text items of (thePath as string)
	set AppleScript's text item delimiters to myDelim
	set goodPath to ""
	
	repeat with i from 2 to (length of myList) - 1
		set goodPath to goodPath & "/" & (item i of myList)
	end repeat
	return goodPath
end pathWithoutLastPiece


on getUnixFilename(theFile)
	set onStartupVolume to true
	tell application "Finder"
		set theDisk to the disk of theFile
		if not startup of theDisk then
			set onStartupVolume to false
		end if
	end tell
	set oldDelim to ":"
	set newDelim to "/"
	set myDelim to AppleScript's text item delimiters
	set AppleScript's text item delimiters to {oldDelim}
	set myList to the text items of (theFile as string)
	set AppleScript's text item delimiters to myDelim
	
	if (onStartupVolume) then
		set goodPath to ""
		set startItem to 2
	else
		set goodPath to "/Volumes"
		set startItem to 1
	end if
	repeat with i from startItem to length of myList
		set goodPath to goodPath & newDelim & (item i of myList)
	end repeat
	return goodPath
end getUnixFilename
