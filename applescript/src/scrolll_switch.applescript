if running of application "System Preferences" then
	try
		tell application "System Preferences" to quit
	on error
		do shell script "killall 'System Preferences'"
	end try
	delay 0.1
end if

tell application "System Preferences"
	reveal anchor "trackpadTab" of pane id "com.apple.preference.trackpad"
end tell

tell application "System Preferences"
	tell application "System Events" to tell process "System Preferences"
		click checkbox 1 of tab group 1 of window 1
	end tell
end tell

quit application "System Preferences"