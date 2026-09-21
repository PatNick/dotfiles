vim.pack.add({ "gh:neovim/nvim-lspconfig" })
vim.lsp.config('gopls', {
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    settings = {
        gopls = {
            semanticTokens = false
        }
    }
})
vim.lsp.enable({ "gopls" })
