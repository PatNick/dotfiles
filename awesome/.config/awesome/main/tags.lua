local awful = require("awful")

local _M = {}

function _M.get()
    tags = {}

    local tagpairs = {
        names = {
            "1", "2", "3", "4", "5", "6",
        },

        layout = {
            RC.layouts[1], RC.layouts[1], RC.layouts[1], RC.layouts[2], RC.layouts[1], RC.layouts[1]
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
