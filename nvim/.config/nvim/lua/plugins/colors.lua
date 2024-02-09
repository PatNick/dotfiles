return {
    {
        "folke/tokyonight.nvim",
        lazy = true,
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
    }
}

