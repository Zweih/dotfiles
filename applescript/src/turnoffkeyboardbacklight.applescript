tell application "System Events"
	tell process "Control Center"
		click (menu bar item 2 of menu bar 1)
		perform action 1 of button "Keyboard Brightness" of window "Control Center"
		delay (0.4)
		set value of slider 1 of window "Control Center" to 0
		key code 53
	end tell
end tell
