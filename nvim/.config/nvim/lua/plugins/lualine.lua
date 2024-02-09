return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "kyazdani42/nvim-web-devicons"
    },
    opts = {
        sections = {
            lualine_x = {
                {
                    require("lazy.status").update,
                    cond = require("lazy.status").has_updates,
                    color = { fg = "$ff9e64" },
                },
            },
        },
        theme = "tokyonight",
        section_separators = "",
        component_separators = "",
    }
}
