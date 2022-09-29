vim.g.gruvbox_contrast_dark = "hard"
vim.g.catppuccin_flavour = "mocha"

require("tokyonight").setup({
    style = "night",
    styles = {
        functions = { bold = true },
        sidebars = "dark",
        floats = "dark",
    },
    sidebars = { "qf", "help", "fugitive", "gitcommit" },
    hide_inactive_statusline = true,
    dim_inactive = true,
    lualine_bold = true,
})

vim.cmd[[colorscheme tokyonight]]

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
