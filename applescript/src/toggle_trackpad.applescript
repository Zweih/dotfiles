if running of application "System Preferences" then
	try
		tell application "System Preferences" to quit
	on error
		do shell script "killall 'System Preferences'"
	end try
	delay 0.1
end if

tell application "System Preferences"
	reveal anchor "Mouse" of pane id "com.apple.preference.universalaccess"
	delay 1
	tell application "System Events"
		click checkbox 2 of tab group 1 of group 1 of window 1 of application process "System Preferences"
	end tell
	quit
end tell