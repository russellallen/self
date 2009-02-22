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
	
	-- Build the command.  echo $! gets the PID of the VM
	set theCommand to "cd \"" & unixFileDir & "\"
	\"" & dropletDir & "/Self.app/Contents/MacOS/Self\" -s \"" & unixFileName & "\" &> /dev/null &
	echo $!"
	set thePID to do shell script theCommand
	
	-- Tell Self to come to the front
	delay 0.5 -- give it some time to register so that System Events can see it; may need to change this value
	tell application "System Events" to set frontmost of (every process whose unix id is (thePID as integer)) to true
	
end openSnapshot

on idle
	set fileName to (choose file with prompt "Select a Snapshot to open in Self:")
	openSnapshot(fileName)
	quit
end idle


