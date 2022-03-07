local awful = require("awful")

local _M = {}

function _M.get()
    tags = {}

    local tagpairs = {
        names = {
            "DEV", "WWW", "GFX", "SYS", "CHAT"
        },

        layout = {
            RC.layouts[1], RC.layouts[3], RC.layouts[3], RC.layouts[6], RC.layouts[1]
        }
    }

    awful.screen.connect_for_each_screen(function(s)
        tags[s] = awful.tag(tagpairs.names, s, tagpairs.layout)
    end)

    return tags
end

return setmetatable (
    {},
    { __call = function(_,...) return _M.get(...) end }
)
