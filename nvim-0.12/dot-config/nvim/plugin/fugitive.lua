vim.pack.add({
	'gh:tpope/vim-fugitive',
})

vim.keymap.set("n", "<leader>gs", "<CMD>G<CR>")
vim.keymap.set("n", "<leader>gl", "<CMD>G log<CR>")
vim.keymap.set("n", "<leader>gb", "<CMD>G blame<CR>")
vim.keymap.set("n", "gf", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gj", "<cmd>diffget //3<CR>")
