vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })
vim.lsp.enable({ 'gopls' })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method("textDocument/definition") then
            vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        end
    end,
})
