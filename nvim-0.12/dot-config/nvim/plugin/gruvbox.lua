vim.pack.add({
    'gh:ellisonleao/gruvbox.nvim',
})
require("gruvbox").setup({
    contrast = "hard", -- can be "hard", "soft" or empty string
})
vim.cmd.colorscheme('gruvbox')
