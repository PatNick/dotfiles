require("config.lazy")
vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            }
        }
    },
    root_markers = { ".git" },
})
vim.lsp.config("clangd", {
    filetypes = { "c", "cpp" },
})
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method("textDocument/definition") then
            vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        end
    end,
})
vim.lsp.config("jdtls", { cmd = { "jdtls" } })
vim.lsp.enable({"gopls","clangd","jdtls","lua_ls"})
