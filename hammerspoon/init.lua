local usb = require "usb"

hs.ipc.cliInstall()
usb.init()

-- Move to previous tab
hs.hotkey.bind({"cmd"}, "pageup", function()
    hs.eventtap.keyStroke({"cmd", "alt"}, "left")
end)

-- Move to next tab
hs.hotkey.bind({"cmd"}, "pagedown", function()
    hs.eventtap.keyStroke({"cmd", "alt"}, "right")
end)

hs.hotkey.bind({}, "f13", function()
    os.execute("pmset displaysleepnow")
end)

hs.hotkey.bind({"cmd", "alt"}, ";", function()
    os.execute("osascript ~/dotfiles/applescript/scroll_switch.scpt")
end)
