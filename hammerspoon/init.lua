local usb = require "usb"

usb.init()

-- Move to previous tab
hs.hotkey.bind({"cmd"}, "pageup", function()
    hs.eventtap.keyStroke({"cmd", "alt"}, "left")
end)

-- Move to next tab
hs.hotkey.bind({"cmd"}, "pagedown", function()
    hs.eventtap.keyStroke({"cmd", "alt"}, "right")
end)
