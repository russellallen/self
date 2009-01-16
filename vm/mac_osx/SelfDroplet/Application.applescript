to split(someText, delimiter)
	set AppleScript's text item delimiters to delimiter
	set someText to someText's text items
	set AppleScript's text item delimiters to {""} --> restore delimiters to default value
	return someText
end split

on open names
	if (length of names > 1) then
		display dialog "You can only drop one snapshot."
	else
		openSnapshot(first item in names)
	end if
	quit
end open

on openSnapshot(fileName)
	set dropletDir to ((POSIX path of (path to me)) & "..") as text
	set unixFileName to (POSIX path of fileName)
	
	-- Determine the folder that the snapshot is residing in
	-- So that we start from that folder and the transporter
	-- will work as anticipated
	set l to reverse of rest of reverse of (split(unixFileName, "/"))
	set unixFileDir to ""
	repeat with i in l
		set unixFileDir to (unixFileDir & i & "/")
	end repeat
	
	tell application "Terminal"
		-- The double quotes below are necessary so that the application/snapshot paths
		-- are interpreted correctly by the shell even if they include spaces in their names.
		do script with command ¬
			"cd \"" & unixFileDir & "\"; \"" & dropletDir & "/Self.app/Contents/MacOS/Self\" -s \"" & unixFileName & "\""
	end tell
end openSnapshot

on idle
	set fileName to (choose file with prompt "Select a Snapshot to open in Self:")
	openSnapshot(fileName)
	quit
end idle


