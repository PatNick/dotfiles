vim.g.catppuccin_flavour = "mocha"

require("gruvbox").setup({
    transparent_mode = true,
    invert_selection = true,
    contrast = "hard",
})

require("catppuccin").setup({
    transparent_background = true,
    styles = {
        comments = { "italic" },
        functions = { "italic" },
    },
    integrations = {
        cmp = true,
        telescope = true,
        treesitter = true,
    },
})

require("tokyonight").setup({
    style = "night",
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        types = {},
        sidebars = "dark",
        floats = "dark",
    },
    sidebars = { "qf", "help", "fugitive", "gitcommit", "packer", },
    hide_inactive_statusline = true,
    transparent = true,
    lualine_bold = true,
})

vim.cmd.colorscheme("tokyonight")

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

require("lualine").setup {
    options = {
        theme = "tokyonight",
        section_separators = "",
        component_separators = ""
    }
}
