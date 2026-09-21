vim.pack.add({
    "gh:nvim-treesitter/nvim-treesitter",
})
local langs = {"go", "lua", "java", }
require("nvim-treesitter").install(langs)
