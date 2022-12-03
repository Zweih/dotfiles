local usb = require "usb"

hs.ipc.cliInstall()
usb.init()

hs.hotkey.bind({}, "f13", function()
    os.execute("pmset displaysleepnow")
end)

hs.hotkey.bind({"cmd", "alt"}, ";", function()
    os.execute("osascript ~/dotfiles/applescript/scroll_switch.scpt")
end)
