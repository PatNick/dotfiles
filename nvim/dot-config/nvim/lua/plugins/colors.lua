return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
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
            sidebars = { "qf", "help", "fugitive", "gitcommit" },
            lualine_bold = true,
            on_colors = function(colors)
                colors.hint = colors.orange
                colors.error = "#ff0000"
            end,
            on_highlights = function(hl, c)
                local util = require("tokyonight.util")
                hl.LineNr = { fg = c.fg_sidebar }
                hl.LineNrAbove = { fg = util.darken(c.fg_sidebar, 0.4) }
                hl.LineNrBelow = { fg = util.darken(c.fg_sidebar, 0.4) }
            end,
        },
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        opts = { contrast = "hard", },
        config = function(_, opts)
            require("gruvbox").setup(opts)
            vim.cmd([[colorscheme gruvbox]])
        end,
    },
}

