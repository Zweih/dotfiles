local watcher = require "hs.usb.watcher"
local inspect = require "hs.inspect"
local fnutils = require "hs.fnutils"
local logger = hs.logger.new('usb')

local mod = {}

local function buildHandlers(watchedEvents)
    local function buildHandler(watchedEvent)
        return function(event)
            logger.d(inspect(event))
            if event.eventType == watchedEvent.eventType and event.productID == watchedEvent.productID and
                event.vendorID == watchedEvent.vendorID then
                logger.df("event matched %s", inspect(watchedEvent))
                watchedEvent.fn()
            end
        end
    end

    local handlers = fnutils.map(watchedEvents, buildHandler)

    return function(event)
        fnutils.each(handlers, function(handler)
            handler(event)
        end)
    end
end

local watchedEvents = {{
    eventType = "removed",
    productID = 24868,
    productName = "UHK 60 v2",
    vendorID = 7504,
    fn = function()
        os.execute("defaults write com.apple.loginwindow DisableScreenLockImmediate -bool no")
        os.execute("osascript ~/dotfiles/applescript/turnonkeyboardbacklight_easier.scpt")
    end
}, {
    eventType = "added",
    productID = 24868,
    productName = "UHK 60 v2",
    vendorID = 7504,
    fn = function()
        os.execute("defaults write com.apple.loginwindow DisableScreenLockImmediate -bool yes")
        os.execute("osascript ~/dotfiles/applescript/turnoffkeyboardbacklight_easier.scpt")
    end
}}

function mod.init()
    local handlers = buildHandlers(watchedEvents)
    watcher.new(handlers):start()
end

return mod
