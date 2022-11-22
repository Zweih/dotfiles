-- Move to previous tab
hs.hotkey.bind({"ctrl"}, "pageup", function()
    hs.eventtap.keyStroke({"cmd", "alt"}, "left")
end)

-- Move to next tab
hs.hotkey.bind({"ctrl"}, "pagedown", function()
    hs.eventtap.keyStroke({"cmd", "alt"}, "right")
end)