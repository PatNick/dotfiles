-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

require("awful.hotkeys_popup.keys")

-- My libs
RC = {} -- global namespace
RC.vars = require("main.user-variables")

require("main.error-handling")
require("main.theme")

local main = {
    layouts = require("main.layouts"),
    tags = require("main.tags"),
    menu = require("main.menu"),
    rules = require("main.rules"),
}

local binding = {
    globalbuttons = require("binding.globalbuttons"),
    clientbuttons = require("binding.clientbuttons"),
    globalkeys = require("binding.globalkeys"),
    bindtotags = require("binding.bindtotags"),
    clientkeys = require("binding.clientkeys"),
}

local deco = {
    wallpaper = require("deco.wallpaper"),
    taglist = require("deco.taglist"),
    tasklist = require("deco.tasklist"),
}

RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

-- Layouts
RC.layouts = main.layouts()

-- Tags
RC.tags = main.tags()

-- Menu
RC.mainmenu = awful.menu({ items = main.menu() })
menubar.utils.terminal = RC.vars.terminal

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

-- {{{ Status bar
require("deco.statusbar")

-- {{{ Rules
awful.rules.rules = main.rules(binding.clientkeys(), binding.clientbuttons())

-- {{{ Signals
require("main.signals")

awful.util.spawn("compton")
awful.util.spawn("xset r rate 200 25")
