vim.pack.add({
    "gh:nvim-tree/nvim-web-devicons",
    "gh:nvim-lualine/lualine.nvim",
})

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = "gruvbox",
    }
}
