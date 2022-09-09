vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
vim.g.tokyonight_lualine_bold = true

vim.cmd[[colorscheme tokyonight-night]]

local config = require("tokyonight.config")
local colors = require("tokyonight.colors").setup(config)

local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
end

hl("LineNr", {
    fg = colors.orange,
})

hl("LineNrAbove", {
    fg = colors.comment,
})

hl("LineNrBelow", {
    fg = colors.comment,
})
