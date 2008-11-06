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
	
	tell application "Terminal"
		-- The double quotes below are necessary so that the application/snapshot paths
		-- are interpreted correctly by the shell even if they include spaces in their names.
		do script with command ¬
			"cd \"" & dropletDir & "\"; Self.app/Contents/MacOS/Self -s \"" & unixFileName & "\""
	end tell
end openSnapshot


on idle
	set fileName to (choose file with prompt "Select a Snapshot to open in Self:")
	openSnapshot(fileName)
	quit
end idle


