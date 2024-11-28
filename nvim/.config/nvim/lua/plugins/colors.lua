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
        },
        config = function(_, opts)
            local tn = require("tokyonight")
            tn.setup(opts)
            vim.cmd([[colorscheme tokyonight]])
        end,
    }
}

