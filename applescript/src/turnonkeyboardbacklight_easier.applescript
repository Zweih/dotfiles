tell application "System Events"
	tell process "Control Center"
		click (menu bar item 6 of menu bar 1)
		delay (0.4)
		set value of slider 1 of window "Control Center" to 1
		key code 53
	end tell
end tell
